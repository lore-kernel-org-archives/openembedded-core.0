Return-Path: <raphael.teller@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF4AC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:11:33 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.25057.1653293485690865398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 01:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DqlRTat7;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: raphael.teller@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id u30so24174750lfm.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=u75rZaXoROIcGhs2BKDYphc8ftSyXkDBCvvPPgBGux4=;
        b=DqlRTat7EE0EaRfi79k6Gx4RO7H87uLPwUnn+MwWIymEjbmFrPiNanKuioyFSXOBkV
         qPQZylcQEVzfywoEukdqTARco0ONOmbcbPlaqOiINZoNMO5QQsJK7pwbdyPsg1WLdNBt
         3hyIroSWmAd2W9NjXjMbtXHMNpyqirdy9unoy3jSsmRg7q7Pq6Rc0y/YPXkj+olWOHwj
         At0Tz0JMhjgEDBV5e0BGl9/6Yae9dL0pOzhMz/BwOxu0sR7q9wjgmFICG4P0sHr9fkgr
         dFPuUORuiczZrfU03K1vEd7DGOjet54PJDxlsJKpEPB2ZxbpRlM8A0M6ohoVafQgoqA5
         q5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=u75rZaXoROIcGhs2BKDYphc8ftSyXkDBCvvPPgBGux4=;
        b=DD4DZ8VeVSXSVr6ISKqEaz+xAOhNgsEIN+kJX+JdTyhF8AVU/ViADKugsBtx27a9+J
         EFv3sKk20im/ET06xiOqpqzjffyPh46o0zNDwFgRA1L/tH2+pMVGWMXnwcUB8GNzvPcK
         SiykLExV2/8dS6R+fi7JEgT6XsXGKjYkwKTFdgo2BRy5SuM/9rQcVWnaD0cyZhVJuuO4
         qHDfbGbi5b42yn8iyUwMKwmoV6cG26Ddk7WbRr4HKKyccStTGoRwyxHWcGi8dWJIPv3E
         3kpUdgI+sZnX5c/M5E21+ATFID9TRWvVzC00jS/SRCBMFXcFi0fL8kQsfEwPyW0o178q
         jdYg==
X-Gm-Message-State: AOAM530tedIVsmPZiha02rJeBDbXXRyc0pobz7DJ5npxbLPDJ98zZyTq
	rNSSgqYbt9svXdLNjFy7X83lwe01vVsSSi2+
X-Google-Smtp-Source: 
 ABdhPJxntsVMJpUi88YbJFu4aG7+J5FP/4982PNRWmH//v3a4CyGUySVkPH/RIP6qlKChiA6L6qloA==
X-Received: by 2002:a05:6512:3341:b0:44a:eb29:c59c with SMTP id
 y1-20020a056512334100b0044aeb29c59cmr15465002lfd.596.1653293483366;
        Mon, 23 May 2022 01:11:23 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-92-135.A1301.priv.bahnhof.se.
 [158.174.92.135])
        by smtp.gmail.com with ESMTPSA id
 j20-20020a2e6e14000000b0024f3d1daedesm1621906ljc.102.2022.05.23.01.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 01:11:22 -0700 (PDT)
From: Raphael Teller <raphael.teller@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Raphael Teller <raphael.teller@se.com>
Subject: [PATCH] kernel.bbclass: Do not overwrite recipe's custom postinst
Date: Mon, 23 May 2022 10:10:44 +0200
Message-Id: <20220523081044.7312-1-raphael.teller@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 08:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166001

From: Raphael Teller <raphael.teller@se.com>

Allow recipe to set a custom postinst for kernel image.
Use prependVar in order to allow custom postinst to be
ran after default postinst, potentially modifying the
installed file/symlink.

Signed-off-by: Raphael Teller <raphael.teller@se.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 83785c3b5b..5d2f17c3be 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -110,7 +110,7 @@ python __anonymous () {
 
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
-        d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
+        d.prependVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set +e
 if [ -n "$D" ]; then
     ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
 else
-- 
2.17.1


