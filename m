Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E257CDD1AF
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 13:20:54 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.68690.1727443252517296025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 06:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TgGLu7je;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a90188ae58eso257192866b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727443251; x=1728048051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7KQL7DVWvC5ARWoTyCbhf+crBEGOUX8P2KoHA3/Hohc=;
        b=TgGLu7jeVtKsaryo7AWhW6k/3//toLv2M+qGmLcAXjaftaz7gMl3fhpw9DBqlSrRua
         XyB8wVH72s9pGpDC0SdW3AAxqSMqltHZB4dBkHKtfeuU3gz5I79mZGniTbBnqazOeHMh
         5H9Rxybzv285xKdYzmtbDJA8UZRChDxkt2j63I8nKuS1Yuvf+c+5Y5pjFfVlN8zvYsGz
         UF03A2hkvlJdOFe+28M4ZHJ2P90teBwaINubWYBuaJZdtOPAc2UoyCVjRt67ForTfq72
         fKpJo+HQ+DIdA69t83N5dUWj5izt3t0UKRQXKqKhPsH6JlTSAqSlpD2Yftauk1ZAygCH
         DGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727443251; x=1728048051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KQL7DVWvC5ARWoTyCbhf+crBEGOUX8P2KoHA3/Hohc=;
        b=cFtm0xuMbUIwfAnVVWAM6dKYoR7KAcbU1BLZ69Ftp8QkUn20toYjflE4Xq/Rcs7efD
         kNQv/vl/3IwTuXHjoGRo6xsZrLQNJPlypXvFH1KNLfg3kIJhMzK+2g2akT2ZrK1bAX8+
         J1ipbFc3a9Ogpb6DKtifTcEinCQtNuz6PClKvkYtLaXPKDNKb59JtCubLmEuXlps13+G
         6r3AMUBSKuLH5PTIRlztEZuKheFjd3VzAHca8U+m9hTKPQ+LJdq01ugKmoR0AzNThwss
         srKPxOY40fs5gDZqovQwRNKfKYSG/05i/kRFipkclXzVaQcjiq6oJdSoEtGKtD55chYM
         QWhg==
X-Gm-Message-State: AOJu0YwHkC6uwcxGi8PxE/CpvcJExR73xmfn4hDWxbnECissEzBVB9qd
	RLgHEEUceG45wsWkNIltNq1rvxzo/fuy6jYalu8ZXoPllZq5p61HrrYeePrT
X-Google-Smtp-Source: AGHT+IEItxtYbA/5MsqAqCPKIFe700UrbXryFKrrzDo6R5T49AUcTuILUG6EjnLhn+63kfV2eQcGvQ==
X-Received: by 2002:a17:907:3e21:b0:a8d:7b7d:8c39 with SMTP id a640c23a62f3a-a93c4ac9362mr317610166b.43.1727443250398;
        Fri, 27 Sep 2024 06:20:50 -0700 (PDT)
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2948057sm133398866b.132.2024.09.27.06.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 06:20:50 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Ross.Burton@arm.com
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [RFC][master][PATCH] populate_sdk_base: Add SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
Date: Fri, 27 Sep 2024 15:20:40 +0200
Message-ID: <20240927132040.200122-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 13:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205023

SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY is a new variable to
enable installation of recommended complementary packages in the classic
sdk. Use it to get populate_sdk behave like Kirkstone and earlier.

As installing complementary recommended packages is known to cause bugs
it was disabled. Though it can be usefull when having dummy packages
with DEPENDS to create SDK's. Use this variable with caution.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 documentation/ref-manual/variables.rst        | 7 +++++++
 meta/classes-recipe/populate_sdk_base.bbclass | 1 +
 meta/conf/documentation.conf                  | 1 +
 meta/lib/oe/package_manager/__init__.py       | 4 ++--
 meta/lib/oe/package_manager/deb/sdk.py        | 4 +++-
 meta/lib/oe/package_manager/ipk/sdk.py        | 4 +++-
 meta/lib/oe/package_manager/rpm/sdk.py        | 6 ++++--
 7 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 32c9e7407d..44ec6d59a6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7658,6 +7658,13 @@ system and gives an overview of their function and contents.
 
          $ bitbake -c populate_sdk imagename
 
+   :term:`SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY`
+      Set to '0' to install recommended complementary packages as part of populate_sdk.
+      Used to make the clasical sdk behave like Kirkstone and earlier yocto releases.
+      Complementary recommended packages was disabled for default because of long standing
+      bugs where RDEPENDS from -dev packages causes problems in sdk. Example with conflict
+      for main openssh and dropbear packages. Use with caution.
+
    :term:`SDKMACHINE`
       The machine for which the SDK is built. In other words, the SDK is built
       such that it runs on the target you specify with the :term:`SDKMACHINE`
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 16013d5872..09e9c5b61c 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -37,6 +37,7 @@ def complementary_globs(featurevar, d):
 SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs src-pkgs ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'doc-pkgs', '', d)}"
 SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
 SDKIMAGE_INSTALL_COMPLEMENTARY[vardeps] += "SDKIMAGE_FEATURES"
+SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY ??= "1"
 
 PACKAGE_ARCHS:append:task-populate-sdk = " sdk-provides-dummy-target"
 SDK_PACKAGE_ARCHS += "sdk-provides-dummy-${SDKPKGSUFFIX}"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 3f130120c0..84e2fef688 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -376,6 +376,7 @@ SDK_DIR[doc] = "The parent directory used by the OpenEmbedded build system when
 SDK_NAME[doc] = "The base name for SDK output files."
 SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creating SDK output."
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
+SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY[doc] = "Set to something else than '1' to install recommended complementary packages as part of sdk. Used to make populate_sdk behave like Kirkstone and earlier"
 SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to build SDK and ADT items."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
 SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = '1'. In this case, the value of DEBUG_OPTIMIZATION is used."
diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index d3b2317894..50e78c4017 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -344,7 +344,7 @@ class PackageManager(object, metaclass=ABCMeta):
                          "'%s' returned %d:\n%s" %
                          (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
-    def install_complementary(self, globs=None):
+    def install_complementary(self, globs=None, hard_depends_only=True):
         """
         Install complementary packages based upon the list of currently installed
         packages e.g. locales, *-dev, *-dbg, etc. Note: every backend needs to
@@ -399,7 +399,7 @@ class PackageManager(object, metaclass=ABCMeta):
                 bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
                     ' '.join(install_pkgs),
                     ' '.join(skip_pkgs)))
-                self.install(install_pkgs, hard_depends_only=True)
+                self.install(install_pkgs, hard_depends_only=hard_depends_only)
             except subprocess.CalledProcessError as e:
                 bb.fatal("Could not compute complementary packages list. Command "
                          "'%s' returned %d:\n%s" %
diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index 6f3005053e..6232c47f4a 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -65,7 +65,9 @@ class PkgSdk(Sdk):
         bb.note("Installing TARGET packages")
         self._populate_sysroot(self.target_pm, self.target_manifest)
 
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
+        hard_depends_only = (self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY') == '1')
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'),
+            hard_depends_only)
 
         self.target_pm.run_pre_post_installs()
 
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index 3acd55f548..e8663523df 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -61,7 +61,9 @@ class PkgSdk(Sdk):
         bb.note("Installing TARGET packages")
         self._populate_sysroot(self.target_pm, self.target_manifest)
 
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
+        hard_depends_only = (self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY') == '1')
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'),
+            hard_depends_only)
 
         env_bkp = os.environ.copy()
         os.environ['PATH'] = self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index ea79fe050b..a3f505c023 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -65,8 +65,10 @@ class PkgSdk(Sdk):
         bb.note("Installing TARGET packages")
         self._populate_sysroot(self.target_pm, self.target_manifest)
 
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
-
+        hard_depends_only = (self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY') == '1')
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'),
+            hard_depends_only)
+        
         env_bkp = os.environ.copy()
         os.environ['PATH'] = self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
                              os.pathsep + os.environ["PATH"]
-- 
2.45.2


