Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6CD7003C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:04 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id u63so24608290wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/sck1/4YFOY73SOXhEHFrEAMrmZy5kYo5cmikeovgt4=;
	b=NXQpWNqrr/k4c0qbCMBbsLD+JES/S7rIyYTxikV5WmC0YzFxy9coEHwwqmF9eN7HgO
	naBhQlnqxQyiNA+XGWaXTlxODLiTngCDG3ccQ1Nq3PuJphE54ZcMKmYkYj4Nd6u/fITh
	OKLQOeEJ9eh2/+J6oJcCmHiW6JBze0FvXff4WyMTY1j3XwFMDgxbHUW9HfR60kfoCFdf
	HgJolcV2f3v7CZ7G3G0BT+myPwSagTlneCS8FWTthODn0/z8CXqNnsUjobyMSLOdnB7A
	pRIQq8Xc2W1C3Nuo6sAOh7oeyQZQS/IE3X+22aBZYZ4B5hsq2QUTTBqUWL9JVLmvbJJE
	FMeA==
X-Received: by 10.28.91.9 with SMTP id p9mr38962211wmb.18.1449755224962;
	Thu, 10 Dec 2015 05:47:04 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	h5sm12503540wjz.21.2015.12.10.05.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:31 +0100
Message-Id: <1449755316-17611-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/11] package_manager.py: define info_dir and status_file when OPKGLIBDIR isn't the default
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:04 -0000

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
index 964fddc..b9fa6d8 100644
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
+                cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
+                cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
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
+                config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
+                config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
+
     def insert_feeds_uris(self):
         if self.feed_uris == "":
             return
-- 
2.6.3


