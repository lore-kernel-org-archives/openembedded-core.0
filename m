Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 693C76011D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 09:08:11 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so128870404wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 01:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bseWdxhJjsfd8xKEyoopQ2dvTDGuizriAseQOD+nW1Q=;
	b=f7DUKl7yjGFndTu4/WE1FezAJGxqLEMFuVhxtTutbz5TVtn308tm43Yx+kcLp885nl
	buXtVbZG7SukpZmXcCF+ZpJFfEn0O3OTVEJc0vBvyJRaVWzanQj2TrOtMAYZIiwi1G+D
	hb99trEeLghR740m+QIoMXGMQ1HwTAbyDUamdKbQTv+IKUsyGQ2LxtHte5AbPdDUOH3C
	wihvy+/lpjYyV2qzVh0wfQlLQ7XTC/rRW+jKWeKh/CIibcZ+PFlEnWDgsSFFiri2L6jY
	l194WV0Vx41rPsbge8YuTQhWxPNczVqrrXNpUf5V09bA8mC8f2kfBwcMF2H9rA+aWj7U
	IEpw==
X-Received: by 10.194.239.104 with SMTP id vr8mr47579451wjc.64.1448442492168; 
	Wed, 25 Nov 2015 01:08:12 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h7sm2479072wmf.0.2015.11.25.01.08.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Nov 2015 01:08:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 10:08:43 +0100
Message-Id: <1448442523-4075-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][master][jethro] package_manager.py: define info_dir and status_file when OPKGLIBDIR isn't the default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Nov 2015 09:08:12 -0000

* without this the do_rootfs task doesn't respect OPKGLIBDIR and
  info, status are created in different directory than opkg on
  target expects
* people who modify OPKGLIBDIR need to make sure that opkg.conf included
  in opkg package also sets info_dir and status_file options

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/package_manager.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 964fddc..7b71174 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1471,6 +1471,16 @@ class OpkgPM(PackageManager):
                                         self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True),
                                         arch))
 
+            if self.opkg_dir != '/var/lib/opkg':
+                # There is no command line option for this anymore, we need to add
+                # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
+                # the default value of "/var/lib" as defined in opkg:
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                cfg_file.write("option info_dir     %s\n" % os.path.join(self.opkg_dir, 'info'))
+                cfg_file.write("option status_file  %s\n" % os.path.join(self.opkg_dir, 'status'))
+
+
     def _create_config(self):
         with open(self.config_file, "w+") as config_file:
             priority = 1
@@ -1486,6 +1496,15 @@ class OpkgPM(PackageManager):
                     config_file.write("src oe-%s file:%s\n" %
                                       (arch, pkgs_dir))
 
+            if self.opkg_dir != '/var/lib/opkg':
+                # There is no command line option for this anymore, we need to add
+                # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
+                # the default value of "/var/lib" as defined in opkg:
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                config_file.write("option info_dir     %s\n" % os.path.join(self.opkg_dir, 'info'))
+                config_file.write("option status_file  %s\n" % os.path.join(self.opkg_dir, 'status'))
+
     def insert_feeds_uris(self):
         if self.feed_uris == "":
             return
-- 
2.6.3


