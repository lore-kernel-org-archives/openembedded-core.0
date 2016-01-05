Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 10CF7731C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 12:24:25 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u05COPV5028495; Tue, 5 Jan 2016 06:24:25 -0600
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016010506242539-1701067 ;
	Tue, 5 Jan 2016 06:24:25 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 5 Jan 2016 14:24:23 +0200
Message-Id: <3182226859c3a37e168480aa8c2d93514de68895.1451996491.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3ec94ad0d014bd99c4444523c2744e05c7120a89.1451996491.git.adrian.ratiu@ni.com>
References: <3ec94ad0d014bd99c4444523c2744e05c7120a89.1451996491.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/05/2016 06:24:25 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/05/2016 06:24:25 AM,
	Serialize complete at 01/05/2016 06:24:25 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-05_05:, , signatures=0
Subject: [PATCH v2 2/2] x11vnc: remove all references to moved package
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
X-List-Received-Date: Tue, 05 Jan 2016 12:24:26 -0000

Together with the move to meta-oe, all references to x11vnc should be
removed from oe-core. There are three of these: a distro alias, a
packagegroup rdepends and a runtime test.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/conf/distro/include/distro_alias.inc            |  1 -
 meta/lib/oeqa/runtime/vnc.py                         | 20 --------------------
 .../packagegroups/packagegroup-core-x11-sato.bb      |  2 --
 3 files changed, 23 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/vnc.py

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index dfce760..84eaf03 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -436,7 +436,6 @@ DISTRO_PN_ALIAS_pn-which = "Mandriva=which Fedora=which"
 DISTRO_PN_ALIAS_pn-wpa-supplicant = "Meego=wpa_supplicant Fedora=wpa_supplicant OpenSuSE=wpa_supplicant Ubuntu=wpasupplicant Mandriva=wpa_supplicant Debian=wpasupplicant"
 DISTRO_PN_ALIAS_pn-x11-common = "OE-Core"
 DISTRO_PN_ALIAS_pn-x11perf = "Fedora=xorg-x11-apps Ubuntu=x11-apps"
-DISTRO_PN_ALIAS_pn-x11vnc = "Fedora=x11vnc Ubuntu=x11vnc"
 DISTRO_PN_ALIAS_pn-xcb-util-image = "Debian=xcb-util Fedora=xcb-util"
 DISTRO_PN_ALIAS_pn-xcb-util-keysyms = "Debian=xcb-util Fedora=xcb-util"
 DISTRO_PN_ALIAS_pn-xcb-util-wm = "Debian=xcb-util Fedora=xcb-util"
diff --git a/meta/lib/oeqa/runtime/vnc.py b/meta/lib/oeqa/runtime/vnc.py
deleted file mode 100644
index f31deff..0000000
--- a/meta/lib/oeqa/runtime/vnc.py
+++ /dev/null
@@ -1,20 +0,0 @@
-from oeqa.oetest import oeRuntimeTest, skipModuleUnless
-from oeqa.utils.decorators import *
-import re
-
-def setUpModule():
-    skipModuleUnless(oeRuntimeTest.hasPackage('x11vnc'), "No x11vnc package in image")
-
-class VNCTest(oeRuntimeTest):
-
-    @testcase(213)
-    @skipUnlessPassed('test_ssh')
-    def test_vnc(self):
-        (status, output) = self.target.run('x11vnc -display :0 -bg -o x11vnc.log')
-        self.assertEqual(status, 0, msg="x11vnc server failed to start: %s" % output)
-        port = re.search('PORT=[0-9]*', output)
-        self.assertTrue(port, msg="Listening port not specified in command output: %s" %output)
-
-        vncport = port.group(0).split('=')[1]
-        (status, output) = self.target.run('netstat -ntl | grep ":%s"' % vncport)
-        self.assertEqual(status, 0, msg="x11vnc server not running on port %s\n\n%s" % (vncport, self.target.run('netstat -ntl; cat x11vnc.log')[1]))
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 753d2bf..812735e 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -9,7 +9,6 @@ PR = "r33"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup distro_features_check
-# rdepends on x11vnc
 REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGES = "${PN} ${PN}-base ${PN}-apps ${PN}-games"
@@ -53,7 +52,6 @@ SUMMARY_${PN}-apps = "Sato desktop - applications"
 RDEPENDS_${PN}-apps = "\
     leafpad \
     gst-player-bin \
-    x11vnc \
     matchbox-terminal \
     sato-screenshot \
     ${FILEMANAGER} \
-- 
2.1.4


