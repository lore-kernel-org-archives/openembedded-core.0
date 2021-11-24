Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8F3C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 01:15:32 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.357.1637716531465517278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 17:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SEdX9h4g;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so978663pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 17:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOhQKbnS86nACuVQOIReXUb8TJCTpLGAhIRyZ5KUIME=;
        b=SEdX9h4g5QnT/XbCUnb8d+u4saN51i7Lg1HTckqoXu8b5wh4dvxsMotIv7TpVaqnnu
         24IdJ7uUPy7YMAl+bWLSdc+LETVYenAiVQ3iusemGyxpxS5PDclb201lvSnkUaESl6z2
         CmzQdtZNqijzdQtw/jjdQoP6FNIb+HDwqSNB9CvXL0934ruAbUXzL9OvsnQGSyZ+Na4w
         XsfouKIJ1LunxEhYlBuBbAVVGoaI6jOi6J4sX62l0hA4J4NLIebq22Z3uZRzvzJn3uM6
         2EGCOxS/z/By5RkZKimtpABhOQtVB+6SRi/5qGViSbORcn5HimxxGpFoTLmde1XSzURt
         uuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOhQKbnS86nACuVQOIReXUb8TJCTpLGAhIRyZ5KUIME=;
        b=ZEZBFVeGss74UtFfoA6l+JaHCRd7Tj+g+QuUpExsILHiCgL3ppw8qeKqlHQc4QX8+7
         gxXT9pIdr1f60lPvj6gUhoysCbycQuZ9tpbcU/jv9bRNJ5frevTo94UpjpWHLbTDRvIi
         QdR8MPq/49PPaTC0ByWEaYpkiSJ3Ercyq42Bo7h/Ev8FB/obPmzX2LCD1PJgL5Vq8eYJ
         NnmfVUkOBQ8gqIIvobLXV6y3w7aqH6RTQ7NByk0LEuBlzcZHac6H3EjDLbvaxWPCGwX+
         wYDCsqWEpGpvZF4g0L13itjWFsb3Q3QeqffhCyVhIlwQ4hcQgUDJ8jOWVWuKa5z/XNsR
         5Y3g==
X-Gm-Message-State: AOAM533gCXQPYMAuDOu+aQnaLIo6HV9iYLtvkjp+qMHCOizAutR2PkpF
	0f1fwiiunJuR+IATzjbnitaRzQ+mjXFwEA==
X-Google-Smtp-Source: 
 ABdhPJxm8i9eyMVc4aIOMX1zQ374lTif5frREq/s7Z0/E+Jruws72ZosilTg2xfpu2bfGBCtYCuP7w==
X-Received: by 2002:a17:90a:2843:: with SMTP id
 p3mr9483775pjf.176.1637716530701;
        Tue, 23 Nov 2021 17:15:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 c2sm14589154pfv.112.2021.11.23.17.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 17:15:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] image: Include psplash only when screen machine feature is
 enabled
Date: Tue, 23 Nov 2021 17:15:28 -0800
Message-Id: <20211124011528.3911871-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 01:15:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158649

base-image boots in degraded mode when using systems without display
system since there is no fb device detected and pslash service would
fail to start. Removing this image feature means that core-image-base is
complete for headless devices

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Remove a typo '0'

 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6c759fdf700..8a46b4852cd 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -53,7 +53,7 @@ FEATURE_INSTALL_OPTIONAL[vardepvalue] = "${FEATURE_INSTALL_OPTIONAL}"
 
 # Define some very basic feature package groups
 FEATURE_PACKAGES_package-management = "${ROOTFS_PKGMANAGE}"
-SPLASH ?= "psplash"
+SPLASH ?= "${@bb.utils.contains("MACHINE_FEATURES", "screen", "psplash", "", d)}"
 FEATURE_PACKAGES_splash = "${SPLASH}"
 
 IMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("IMAGE_FEATURES", d)}'
-- 
2.34.0


