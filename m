Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38AC66FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7Etfn013837
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:55 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:18 -0800
Message-ID: <48a6d618d4b39058bf04a6cb0d8c076ae5da4013.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/40] package_manager.py: define info_dir and status_file when OPKGLIBDIR isn't the default
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:55 -0000
Content-Type: text/plain

From: Martin Jansa <Martin.Jansa@gmail.com>

* without this the do_rootfs task doesn't respect OPKGLIBDIR and
  info, status are created in different directory than opkg on
  target expects
* people who modify OPKGLIBDIR need to make sure that opkg.conf included
  in opkg package also sets info_dir and status_file options

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/package_manager.py |   19 +++++++++++++++++++
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
1.7.9.5


