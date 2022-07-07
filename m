Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32260C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:31 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.755.1657231230064486347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ye4MBBjD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id s21so11923256pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IbqruSoimRkbP//VvOyiUrNjXI0gqjRgAMpwVnTofgk=;
        b=Ye4MBBjDpz214jwtX+CWwOxlNb/1MniQBjaph3kPBf2vvt1r2yAvjS9c30AhrldG3E
         3jHuvFmkFCLZj+bxIeoazhWoVTfKwhnvnyZCSgRqeF44S9tmOqXnXKjwqP+2pDoY86Hc
         ZMPEyRPSOZBAqd9emPvaJCMUx79bVXONFGsrlBoqKKvDg6kadLMrWs1Ywikk7xCjYJQq
         wnAWz75Jv3zHGHHchficr7dBSuacIFnemZOAyrG/XLemnhsd6ebpjFf+wEtgZc5FXTcR
         /6qVa7feSLmqp4K/3VGypP0ZdzzPMVWaRBcShQJ5dJOLIiEtW2cMxNxu8R8wrAH97aY2
         rxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IbqruSoimRkbP//VvOyiUrNjXI0gqjRgAMpwVnTofgk=;
        b=T48iqtTuZAM8JeQ8tmgdkAXIWOXvJ3ohO8DrrLf6vALKT/zRAuEzIDNpXLveCU4vU0
         nB3pYoojqhWIaaSXLflzIe9G4ynwaBEUvyIY0GXkWkGI48a1J5CQOgR74mrvgSPZMwXv
         jwt9TfarZqN1rxYytzXtSV4ZvP2y/tgZY7c20W2wBfqezB5KUiQYxmocT6mAJM47S0wZ
         3lfmwCw3wZoJvv1bAMJZrI4hOI8/x/UHLsYultldOe0LTQzFBNeZhITv5vRfJ2J104dh
         DGyUepK2a55O2dPtwL31iwmsynIhzK314Ni6VDUFoUa2U4J140qZTlvZ4Tr3skKpgx2s
         8r1A==
X-Gm-Message-State: AJIora/5e8NQg5fFQezl+yYfDTItkzkNAO+uLz+eOSoJscqcMnw2F6jP
	cuo84MKOw6Eyk7Saz7O5qv5Byg9JJLwoRFPy
X-Google-Smtp-Source: 
 AGRyM1vVGfbzpgUpmMs6zPioovf4qrP2X3PW5H6hdckdqQDFjx0uidganoJbGv7N+KDxXombVxO/tg==
X-Received: by 2002:a17:90a:930b:b0:1ed:5441:1fff with SMTP id
 p11-20020a17090a930b00b001ed54411fffmr4977pjo.238.1657231228969;
        Thu, 07 Jul 2022 15:00:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.15.00.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:00:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] IMAGE_LOCALES_ARCHIVE: add option to prevent
 locale archive creation
Date: Thu,  7 Jul 2022 11:59:35 -1000
Message-Id: 
 <af32908dfcebbc0f617ad828d895f504c37ee2d1.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167811

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


