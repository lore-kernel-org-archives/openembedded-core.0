Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B29D87729E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 10:52:14 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u15AqFtO010297 for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Feb 2016 04:52:15 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020504521546-685420 ;
	Fri, 5 Feb 2016 04:52:15 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 5 Feb 2016 12:51:51 +0200
Message-Id: <1454669511-6302-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/05/2016 04:52:15 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/05/2016 04:52:15 AM,
	Serialize complete at 02/05/2016 04:52:15 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-05_04:, , signatures=0
Subject: [PATCH 1/1] package_manager.py: fix python indentation bug (opkg)
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
X-List-Received-Date: Fri, 05 Feb 2016 10:52:16 -0000

This if branch is causing the following error during do_rootfs:
"Exception: UnboundLocalError: local variable 'cfg_file' referenced
before assignment". This happends because the cfg_file variable is
defined at a deeper nesting level (just above the if branch).

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/lib/oe/package_manager.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 5776952..26f6466 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1507,14 +1507,14 @@ class OpkgPM(PackageManager):
                                         self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True),
                                         arch))
 
-            if self.opkg_dir != '/var/lib/opkg':
-                # There is no command line option for this anymore, we need to add
-                # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
-                # the default value of "/var/lib" as defined in opkg:
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
-                cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
-                cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
+                        if self.opkg_dir != '/var/lib/opkg':
+                            # There is no command line option for this anymore, we need to add
+                            # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
+                            # the default value of "/var/lib" as defined in opkg:
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                            cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
+                            cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
 
 
     def _create_config(self):
-- 
2.7.0


