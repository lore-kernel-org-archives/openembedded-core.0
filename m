Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.22830.1627645519555400838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FuW+Friv;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id d8so10942808wrm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zq8oXp7sHg9r4Ai6I5hUIy8/X13P0f7Tzgre1qCeLsg=;
        b=FuW+FrivWNByZCFJnkq4LM7eVUB/xz5Y4VaFC5e0qCCDq/LECetAcpA5WL0reALNm7
         xG0l4pETxbRmXmC7iJRufCx2DL03LnT+ISVnH4n520TEfeZT3B/hckHjOhrbZ2WfRCEy
         7GMNA9Ofl7edl8fSomtryin+Wrbwn0h3B5qc8mXnJPELOXij41LFe+1kmuWGgf+Pcd26
         /RV5VSSv3gfZbIBB4rI8hcW78qJbL0MR9dElsERVOdj1OxMvEjgwQ3lQY4yk+iXl1Xw2
         QIcTKgtnCFhgBvsJQJfim2bN20zYEfOsPCrQWqVF2SiXwBEo1WLPmWZ3WovW7eDA2twX
         gGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zq8oXp7sHg9r4Ai6I5hUIy8/X13P0f7Tzgre1qCeLsg=;
        b=lbxfOwbVZEcNv0bMNreQreW2grkUTarDMHxNhhYIf7qgdi4JPpC9GmZ7iO049Fi8xa
         aNOIdAKXT1keYyTM357E2GS8zj+MLdGRrVMHKxhLo/kRKbH4eVPw8r2ciFgocgJZt/3C
         phPYpJVaRMLiCthcujqcT2/KG6IFCZI+G+24YuMFNwGuusELxk7lbYEvLyE4QjyExTbK
         0Na+jDdu2f+rq12fsWTldJ2BX1qjWxbEEw+wYUJ/2bBjVgeMHLDUxYjTiKmcfyVQp6yM
         l6OjaSW+ldoXV3ucL4/GTmyDXiPWImnK4Tk2eV3yt6LZeTm1Q8VxIOl15H1MFKSrPsCr
         GW7w==
X-Gm-Message-State: AOAM532ZyDuDaPWHFiv5O3FeXWtyzCTgGazjWu3WXRRyU7sPZWA6gyQE
	QJo6iJYIuhhL+ufs7ACHZcvQ4HcKfo4=
X-Google-Smtp-Source: ABdhPJxFpdd5fs4T1w0llNcxinENYhqOGN0IHvgK0InbrUcl6hfZJp6cxqncAQEClhamXCoyqZVFRQ==
X-Received: by 2002:a05:6000:2c6:: with SMTP id o6mr2591849wry.241.1627645518177;
        Fri, 30 Jul 2021 04:45:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm1459792wra.80.2021.07.30.04.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:45:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 9/9] selftest: add core-image-weston to no-gpl3-no-meta-gpl2 image test
Date: Fri, 30 Jul 2021 13:45:07 +0200
Message-Id: <20210730114507.732448-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730114507.732448-1-alex.kanavin@gmail.com>
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This demonstrates more of the tricks and techniques that can be used
to achieve gpl3-free images withough having to roll back to ancient
versions of various core items via meta-gpl2.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../oeqa/selftest/cases/incompatible_lic.py   | 28 +++++++++++++------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 152da6332a..6944becb58 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -122,14 +122,26 @@ INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 """)
         bitbake('core-image-minimal')
 
-    def test_core_image_full_cmdline(self):
+    def test_core_image_full_cmdline_weston(self):
         self.write_config("""
-INHERIT += "testimage"\n
-INCOMPATIBLE_LICENSE_pn-core-image-full-cmdline = "GPL-3.0 LGPL-3.0"\n
-RDEPENDS_packagegroup-core-full-cmdline-utils_remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"\n
-RDEPENDS_packagegroup-core-full-cmdline-dev-utils_remove = "diffutils m4 make patch"\n
-RDEPENDS_packagegroup-core-full-cmdline-multiuser_remove = "gzip"\n
+INHERIT += "testimage"
+INCOMPATIBLE_LICENSE_pn-core-image-full-cmdline = "GPL-3.0 LGPL-3.0"
+INCOMPATIBLE_LICENSE_pn-core-image-weston = "GPL-3.0 LGPL-3.0"
+# Settings for full-cmdline
+RDEPENDS_packagegroup-core-full-cmdline-utils_remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"
+RDEPENDS_packagegroup-core-full-cmdline-dev-utils_remove = "diffutils m4 make patch"
+RDEPENDS_packagegroup-core-full-cmdline-multiuser_remove = "gzip"
+# Settings for weston
+# direct gpl3 dependencies
+RRECOMMENDS_packagegroup-base-vfat_remove = "dosfstools"
+PACKAGECONFIG_remove_pn-bluez5 = "readline"
+# dnf pulls in gpg which is gpl3; it also pulls in python3-rpm which pulls in rpm-build which pulls in bash
+# so install rpm but not dnf
+IMAGE_FEATURES_remove_pn-core-image-weston = "package-management"
+CORE_IMAGE_EXTRA_INSTALL_pn-core-image-weston += "rpm"
+# matchbox-terminal depends on vte, which is gpl3
+CORE_IMAGE_BASE_INSTALL_remove_pn-core-image-weston = "matchbox-terminal"
 """)
-        bitbake('core-image-full-cmdline')
-        bitbake('-c testimage core-image-full-cmdline')
+        bitbake('core-image-full-cmdline core-image-weston')
+        bitbake('-c testimage core-image-full-cmdline core-image-weston')
 
-- 
2.31.1

