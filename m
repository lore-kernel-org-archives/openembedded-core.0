Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7684C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 17:16:25 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.139.1657127776178536313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 10:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XOyIdw4r;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: jatedev@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id c13so19142619qtq.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GWQu8rRULkF/T4SJyHnf/V9TP6ove/QLukZygEJpm1A=;
        b=XOyIdw4rT8Lp2UbRbu6p9qMTBzf6dkQjn3evco1iqZc8A8Oiw1jRYxyHhhwwqOc9kh
         PktOShauuuR6mPcyuAeWtn63dlmrrEc73YVgGeM0lQKxE/j+BoTag2YCoIXyYwz8Dtbz
         vaGyqi1MmBiUplh0ywaZjAIX6N4K3ZirtXA6z+Cgq+h8qLZAg4qY+SNxmKhTH4nfp0jq
         IfbekZPMsL9e/U3D9p87Jxv9Kbkm+M1lUbOiRc+O/DQTiXJzfLvtZK7ZYWE/WT3zKdN7
         zsCt5WyKyhKMDGKj9JivfOGNTW+2kyJ5mc2/KxCF6MnSG0XtZTzClsVy88HpRJ/TfY3p
         Mm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GWQu8rRULkF/T4SJyHnf/V9TP6ove/QLukZygEJpm1A=;
        b=TbiGch01HWsDgmRWN4hH+8ECIiudGDj+PmYHZFZNZRPVzIaiHc+/k7f/nrz4LvEVJS
         2vKHQD1VRo5m+FfhY7e6iBKREh5IIHH80ABduNDwvGAvnL5QnguVPVlmw7wS6nMsHEnT
         G4AHPC/uT5yTF1lsTKJaQZT9TwBTQE0MUq2qR03egyCPse6CycVwpaRcfxETwWfGJ1Wv
         UYaa8IsSO+CvUtf89qYpmZrRW/Sl+TbF8IPEbAdXb5YIWfRf+eRnoK1upEEkmP01JeoM
         bUPI+jP+4ME23+w0KYjRmh8zcB4xDfK/UK3rVlBeAugDW1AXtl+2bk2nODEIATVn5ziT
         IQVw==
X-Gm-Message-State: AJIora9Qq9mwCTY6R3EaNpi8v3/eZgLaZ1D3brWLQzEhVuHx/XRf/ifP
	adIlXtF/LSl17KSQIlME9Zj4byDfXbM=
X-Google-Smtp-Source: 
 AGRyM1tP3pfoozV+BdeOD1AbTpuMWczSfTmQr5FrVg7HZpq/SzJM63aLUC/uVu4K1jbAK2HGfO60QA==
X-Received: by 2002:ac8:59cf:0:b0:31d:396d:e58 with SMTP id
 f15-20020ac859cf000000b0031d396d0e58mr23204297qtf.394.1657127774872;
        Wed, 06 Jul 2022 10:16:14 -0700 (PDT)
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id
 a14-20020ae9e80e000000b006a77940be22sm29012060qkg.95.2022.07.06.10.16.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:16:14 -0700 (PDT)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] IMAGE_LOCALES_ARCHIVE: add option to prevent locale
 archive creation
Date: Wed,  6 Jul 2022 17:15:49 +0000
Message-Id: <20220706171549.25595-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 17:16:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167739

From: Jate Sujjavanich <jatedev@gmail.comt>

[YOCTO #14851]

Under some circumstances it is not desirable to create a combined locale
archive (/usr/lib/locale/locale-archive).
The new variable IMAGE_LOCALES_ARCHIVE defaults to '1', so the default
behaviour is not changed.

Modified to work with code before move to lib/oe/package_manager

Signed-off-by: Michael Thalmeier <michael.thalmeier@hale.at>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d78b819c2ec33fce3a34254fa90864ee5fa7617)
Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 meta/classes/image.bbclass     |  5 ++++-
 meta/lib/oe/package_manager.py | 13 +++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1900eff412..0d77d2f676 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -124,7 +124,7 @@ python () {
 def rootfs_variables(d):
     from oe.rootfs import variable_depends
     variables = ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
-                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY',
+                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY', 'IMAGE_LOCALES_ARCHIVE',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
                  'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
@@ -176,6 +176,9 @@ IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
 LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS').split()))}"
 
+# per default create a locale archive
+IMAGE_LOCALES_ARCHIVE ?= '1'
+
 # Prefer image, but use the fallback files for lookups if the image ones
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index db988d9247..502dfbe3ed 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -611,12 +611,13 @@ class PackageManager(object, metaclass=ABCMeta):
                          "'%s' returned %d:\n%s" %
                          (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
-        target_arch = self.d.getVar('TARGET_ARCH')
-        localedir = oe.path.join(self.target_rootfs, self.d.getVar("libdir"), "locale")
-        if os.path.exists(localedir) and os.listdir(localedir):
-            generate_locale_archive(self.d, self.target_rootfs, target_arch, localedir)
-            # And now delete the binary locales
-            self.remove(fnmatch.filter(self.list_installed(), "glibc-binary-localedata-*"), False)
+        if self.d.getVar('IMAGE_LOCALES_ARCHIVE') == '1':
+            target_arch = self.d.getVar('TARGET_ARCH')
+            localedir = oe.path.join(self.target_rootfs, self.d.getVar("libdir"), "locale")
+            if os.path.exists(localedir) and os.listdir(localedir):
+                generate_locale_archive(self.d, self.target_rootfs, target_arch, localedir)
+                # And now delete the binary locales
+                self.remove(fnmatch.filter(self.list_installed(), "glibc-binary-localedata-*"), False)
 
     def deploy_dir_lock(self):
         if self.deploy_dir is None:
-- 
2.25.1


