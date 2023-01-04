Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F1CC63707
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9370.1672830362981472240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Omn/05P7;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id t15so23700868wro.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utyk8qs8zG7cv9DiKT+ZoUgScOadOU/1Ym+/p04WGbE=;
        b=Omn/05P7FuDdUCiYcsGnjwfs0oSxYAEiNUfMh9P4H5xQIcMTaJM+poWFgFCDWNSDec
         c21Gl70eBuIiCouLEdpDLqZTlkN+eVDXOpaAzieon0nebWd8Xxdtt4de1xiUM+qTBQ0o
         uAGCRJ2oKX0XLf54Bn2B41e4pXywcG+WfCgwoLoIJBC9qhcuINtoy2cVsvW4auVG1jck
         +kUt4+GARwpy9iv1290NFEmDxw3pIA9xYfdD30yaTBmtj50WNlO1Un+tmLLBmleVWIZU
         SLDNpTVi71xsLQLukskJ2BzaqA/TSas75V9IaSbsk3WeuJGKL+FHs80i8+pKEEFxOq6Z
         482w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utyk8qs8zG7cv9DiKT+ZoUgScOadOU/1Ym+/p04WGbE=;
        b=IlEONmBXSurOLWgSiL4gRObYAbRhUSD0u8rRi/duQgGrfPNAUkJBDjizcVpczLgRFO
         6OZPxtursx1GX5/gqzwcOn6+ODZzaUhlmQl/w7sc5MWRpqfHz9E8LhiZTVPOY2QxVD2K
         VYlRudqeRVwdNdRwfQgyrYrfsrlyiK8Iz+OJmPHHboek1b4yG0gJg0y8LFKCHCu/4P5e
         Irfs58JbiI6dX9ZkUSG8GpkAAycBwjEx9Ks5r8A+Q4ZYj2pe7zxayMg8KmcBuFdQhsRb
         EPqEp5VryxfhmDb29oiXGtHz0ZPT/XJLgK5sgyLTTUNt0/fuH4y5qIWb4jM4sSeEAzOM
         3BAA==
X-Gm-Message-State: AFqh2krChu/LwKIZWUiPEpumTpx+aFzGze4tOL+E79hu1e2DliVlHirN
	iLyKzHVdoPEbkmHYVZG37oevdDAz31M=
X-Google-Smtp-Source: AMrXdXuAIamGb3Jz1YTKlGbmqBwC4nah7tE2GjaCOeF4CnWoGMUvCSKiGP9lcyxxRnbDakd3Ou8GyA==
X-Received: by 2002:adf:ecc8:0:b0:26a:5040:78f6 with SMTP id s8-20020adfecc8000000b0026a504078f6mr32238120wro.46.1672830384321;
        Wed, 04 Jan 2023 03:06:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/77] lsof: upgrade 4.96.4 -> 4.96.5
Date: Wed,  4 Jan 2023 12:05:13 +0100
Message-Id: <20230104110548.2537259-42-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175427

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/lsof/{lsof_4.96.4.bb => lsof_4.96.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lsof/{lsof_4.96.4.bb => lsof_4.96.5.bb} (96%)

diff --git a/meta/recipes-extended/lsof/lsof_4.96.4.bb b/meta/recipes-extended/lsof/lsof_4.96.5.bb
similarity index 96%
rename from meta/recipes-extended/lsof/lsof_4.96.4.bb
rename to meta/recipes-extended/lsof/lsof_4.96.5.bb
index 11de535a0f..9f80176ee1 100644
--- a/meta/recipes-extended/lsof/lsof_4.96.4.bb
+++ b/meta/recipes-extended/lsof/lsof_4.96.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://remove-host-information.patch"
-SRCREV = "669c33a253e414feb60fbbcf2984c25dc413cd75"
+SRCREV = "898916d4c7c390ea4610aebaf1d32b8a3c49f26b"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


