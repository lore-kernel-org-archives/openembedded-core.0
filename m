Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDA2C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:47 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35239.1788788201948875186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wLcuB9k/;
 spf=pass (domain: smile.fr, ip: 209.85.208.170, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so27200461fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788200; x=1789393000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p3HmJtj8tMVwUo0AE7DusgCGvnLMX3wtOum6N4o0RlQ=;
        b=wLcuB9k/VbaBjbfuL/4Fd/7GOzDp8Wyikdh9WPjtxQmSk/J6mTeZQZNmmA8ySAq/80
         sanox9+XdHMSUDm9kRgo6QEE8s+0i9kP9fd9SrJL7atXimEgR3GDVEGcxv1j7dHAKFKO
         UE68N4OW20/oJ4enjtVdPDjMgf8M+vv6rcZ5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788200; x=1789393000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p3HmJtj8tMVwUo0AE7DusgCGvnLMX3wtOum6N4o0RlQ=;
        b=Qn7WE8O1DqA5xX6TgqkGLDVfr6VDXVRVPfR9YMcnFW/zMUpisOx4YDjhN8v4ySAfzf
         +JuboGjsmnos55P1cTzFHMbUuOv8BYHeiFdes5wjawtT8rAPAXr06RsROe5SqflsILTq
         QEB1KVFu+AB/auBHxcy9KNSaal5Hr7CoA+KcZ9jct9t9WrhuENLFwIlhwLFzq6TTqSAf
         ZwLfOd8ujVULtuNoGyy1Ph/tXAzYL/IrkRf4nGWx5X3892hCq7+J1QeAVdWJfahSQqs7
         Lbd1WlZ7KScIOqNWuK12g6Oj7j8F9KO9jEz1uC/6RU4NrqOImUkgrU/411Bp2952bphg
         ZX8g==
X-Gm-Message-State: AFuF++mNHb9e4k9P3s6MLx6CBlHRzJ9R3RIoNPMdbJCQu7f8/cse3Nfe
	0kLmbODRjGdqQBXr9o/CMEu4ujlHYVsJiruL6dS5NN9GTUujDC1wre4e2C/gax1j3+xpu+F4mgM
	cvb69ax0=
X-Gm-Gg: AYBFou0oL5N0N/zhowFLmkA8VCwBIuPlpTZnfqiKV2vFIx+3GXfiLDYjePKOv6Pd3WP
	e8iPiDFZAk03rodYqy9L9PM+pEG/iicAO1AFwInbWGXPI5+N/Gc94ScZIK4orl4xbEyWIp6KBsG
	vKm1SGgXlpRK0NE2AZsQy/G1sOYrFT16Mw7A1trlBHCy38vVEhfz+oqzgm/zjQLfWr9o030irqK
	o4vYcXtQ48CDC24Os8EWj1vFXamtCD3jJT2gX6lgBmbPEsPKryAMgSSp3Tc8KeaSh01MkPlK83G
	GKs5g6T+MDcllpWImc3MLoQwjIoYI+cWOg4VZ8dZS87FCTRe+pW4vfzQ8BNNIykbz54XGfe6JrL
	PhtfQpvuiextAXCL9puJjs8Ht/ZGpM1TaUmtk+j39S43Y3RxIdxlZd1Kmu5byVddx3L5pxvb6ph
	ii8x5Mg/nfa0qJq2PeNgL72UpIn+v4wBGuq4DkGU6dX6bw0ici6NnOZcby/qajIxdoMct9tXHt8
	J/FfYRGCNyMmvPJZfhjcLIBTOI4hlYOTql0iDhSPXeD3BPJwnZ4acEAXn6K6UMD
X-Received: by 2002:a05:600c:4513:b0:49d:17b7:fdda with SMTP id 5b1f17b1804b1-49d17b7fe34mr5112235e9.1.1788788165048;
        Mon, 07 Sep 2026 06:36:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/35] expat: set CVE_STATUS for CVE-2026-72522
Date: Mon,  7 Sep 2026 15:35:22 +0200
Message-ID: <dbdc9e8d18374a2586c24e1ba41bfa1dcba3ef39.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245293

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

CVE-2026-72522 is an out-of-bounds read and infinite loop vulnerability in
Expat's *_toUtf16 functions caused by mis-classifying low surrogates as
high surrogates.

Our Yocto configuration is not affected by this vulnerability:
- Expat is compiled with EXPAT_CHAR_TYPE=char (8-bit character representation).
- Neither XML_UNICODE nor XML_UNICODE_WCHAR_T is defined.
- The vulnerable *_toUtf16 functions are only invoked when Expat's internal
  character type is 16-bit (ushort or wchar_t).
- In 8-bit mode, Expat handles conversion using *_toUtf8 functions even when
  parsing UTF-16 encoded XML inputs, rendering the vulnerable code path
  unreachable.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-72522
[2] https://github.com/libexpat/libexpat/pull/1296/changes/8fbfb52fa88e040e8b0b7a9d39f260d6a9e8b6db

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: EXPAT_CHAR_TYPE=char is the default and we do not change it]
---
 meta/recipes-core/expat/expat_2.6.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 3387a7d7c1f..93f0622373e 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -99,3 +99,6 @@ do_install_ptest:class-target() {
 BBCLASSEXTEND += "native nativesdk"
 
 CVE_PRODUCT = "expat libexpat"
+
+CVE_STATUS[CVE-2026-72522] = "not-applicable-config: Needs Expat compiled with 16bit character support , Issue only affects firefox/Windows. \
+EXPAT_CHAR_TYPE:STRING=char is for Yocto builds"

