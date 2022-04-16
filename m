Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A6AC63701
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.21645.1650136505676758706
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Lm1uAnEd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso10874756pjj.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pOwL1f8UnJ94x9fgEvXKv1kx3wVcKsECC0wJltkqMYw=;
        b=Lm1uAnEdUz2D37EM61dv1LrlKaZURymxvDJ/+Ruyt8SziGmB0GV05ZVnFT25qbZtZU
         UcHrXRSzXqcWp+iERsPAnk9D66TO8t+VmUbbvINsnvt990zrxwY0RHjtwQe0Vrdog97B
         268qdTBuCwxx0m9oD9FdX4zs71fDa+5BfxLseW3CzSOpgoGEDVDuXHdDl2KRzIf4AjdC
         Hs9qPl190JGD8Vk5MNx6Au+BX7BsXSv4nRQDs88O5eTaxJLj63RDHgHSz3vg5HtXIi+y
         PeOxGdq/rRqbBcAhBrgFB2V6NqBhgnObySIfscPnYYIIownXLfnh65pOb0T/A6YsJaR1
         ktSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pOwL1f8UnJ94x9fgEvXKv1kx3wVcKsECC0wJltkqMYw=;
        b=71hs0M1qaTBq+77GaFT8C6Fa9uKGcut2M0Qr7tP+MHPnegPQubV87W0Cf//Jo2n0/M
         uacCFVXR3N3Btw0Iz4mkONyCsE6NeAay71D/3ixGlp/9CfIQCGGOxOKX9E7arIo9BwhF
         6Lq4d3GtrMe80jfxnrdUCWqB2niSg29yZiloQRH6TK/Z4Ks2WlyYfdyZ/HyF30BjHzMw
         gUpQSxh9/8nWdr0jTvW04WkC+SnjKVJlsiCgalb294l50fF+DWY+TJ+cQQSJKj7G7D+w
         jdCkYwVdSPrT/eu9ZNhRBF4hi0EtSV6YP171IyFTfpNETTLw6gmjUhw9T5RIzz8+MHqO
         PGGQ==
X-Gm-Message-State: AOAM533jSA1fTSmALs/sj1Z2vzR/Erqy0QRq058g66iLlHmfxaLfvRxQ
	DoHCGM5TEqFPBjEyhhH54lErJVC81D2zkzidmjY=
X-Google-Smtp-Source: 
 ABdhPJwcJqxjb2V8oj/mYmGIKoaWAj12TMWrmCdZE9abnoxqUDOQ02y9E9A3gb1aJ87/EBm7qg/mmA==
X-Received: by 2002:a17:90a:b28c:b0:1ca:a055:12ac with SMTP id
 c12-20020a17090ab28c00b001caa05512acmr10387836pjr.215.1650136504826;
        Sat, 16 Apr 2022 12:15:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.15.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:15:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] pseudo: Fix handling of absolute links
Date: Sat, 16 Apr 2022 09:14:25 -1000
Message-Id: 
 <4e79b3fa07d6b8d044f2fb21e691ff3683aee1ea.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164553

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Update to a version of pseudo which has a fix for absolute links,
evaluating them from the chroot path.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33147b89bc3c9e9bdd53a942a5551d8a1d06130c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 35240f1616..b5da3f0e29 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "df1d1321fb093283485c387e3c933d2d264e509c"
+SRCREV = "2b4b88eb513335b0ece55fe51854693d9b20de35"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1


