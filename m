Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17832D7361D
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:36 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9321.1766114555311480564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UbgDabh4;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so1374892b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114554; x=1766719354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQw7CIST8rm7H08RPs9/B+ds/P5E8XOilBwUOg+20Nk=;
        b=UbgDabh4OsTRmU1amO6lSj/By5UoewHq9hjDbARaTXwW7a+sgrG159AyxPebIH2oh1
         XX3kC1mkWo738o9dXa5mI1xJ8Ic1FA1ZrqM1JM/zisBBcUy4Nma3IL1UTiZ86E0csZgC
         8sZrBnV/iL635psVxB8n0uRbe6+aANqBO0DrdvIPFltcxzOHjXe6L5MNCtq0xPg57xfh
         Geqhv1KEh6DsIg7mbu9dUDMoflCiHUFgr9f+w3SXQuXlG48HSCvRmkFIlafeSv/XKBwD
         HAzOUNgiX49zhj9kHKZu6WgOB+ZffxUf+XYxlAtk0UdLs7e91yYJa7vT1xy+odZH/EVP
         nDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114554; x=1766719354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XQw7CIST8rm7H08RPs9/B+ds/P5E8XOilBwUOg+20Nk=;
        b=FHKpp/JMYCvPv57Tkii+gudJhpcCUCQNHR9dDqABEJiCOpheNlVUVpEJsBaF0CPcSm
         2D/x8CEjshHNdbeZzFHCjFxTIzmaEatZT/5Px4qLzvn7QjXx7Wa+aJK6oebbP6ZKy5px
         nodsoL7WWWC/x7Nq867XaBx3p2DIN87JUe0058oGUqRRhjE7ybYVWlLrfHCATHjSG4sl
         Q2xyvufjIT715t4eWl7FvahB5SOwEr+XQToPJ74HmoFolP6Zzcm0KVZxxZqA9+5zUEtT
         D5LbXpzn7smZloITrgxWt/22ZELIzp5q9prRpuNkDbblhU2s07S+pL7dGumwfkyo/AWd
         0LbA==
X-Gm-Message-State: AOJu0YylwoL6KMng7JeuD4VTlI4Y9JRebhff2yWpj0ghpSoMIl1XyMig
	v4Sp/lHgE166yFY2N1h5hTr4LvEI8sFQbun81cff+0w9wjs2VneRTyvl9+NG2w==
X-Gm-Gg: AY/fxX5BKZnmC6tz8N3dmZaIFJ2JmnoAk1RE2ceX34IBZtR++6BgPggaSdTCC1HRRoE
	cwYX5jzNBOSP3CNb2aKYIUWmmSZm8elCjZ5QqSzucCEkcEEPqutVf5jxCViN4QCo64mklzQVLPO
	JuzfpBW7iVhYeraGDzbGLJL/AQBqr+O+OUestluV67VVSANqNGPBYUhlfC20HonSq6+LKpArHqu
	cwovFsEsyaOTEEfzx3YFnZTwhphpksVA0zRbO9TJMQU+OYKPwCpx6SDse0S0BdCUKzlQo5g1UiU
	r7mtpJMotdwR3tLl6BifriCsgCD9UV2zyWZ/YDgRU7IaJfrMy0lLrQx7RyHVuMxGangEkGFY43b
	H/R/CsozN3e1VXtZ6yq2EHWSuxgIT0XSt4VjHooGdQmio7HrH3zqWW4WfivQAwpVCqN04bhxmtz
	iDEAHxNIv+xUarkM7+HL2v5PSc
X-Google-Smtp-Source: AGHT+IHAq/FfaTlnx+SrKf+QTNRb9ltQVcuCKcX5odCjfcYcdf2HFreqd2TxzXH5At8OcXnDEII8Yw==
X-Received: by 2002:a05:6a00:4405:b0:7aa:d434:69d6 with SMTP id d2e1a72fcca58-7ff6440126fmr1306770b3a.10.1766114554515;
        Thu, 18 Dec 2025 19:22:34 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:34 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 07/29] gst-examples: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:46 +0530
Message-ID: <20251219032209.960840-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228175

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 5d45726d07f049be7d131b4fa0ed1b2716060dff)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
index 2fa4ef11fe..6790f0b038 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "82cbccedf7946a32d28a5aaec8ebbcb627770c19"
+SRCREV = "c5a5c302f5e7218182c0633decec16b25de82add"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 

