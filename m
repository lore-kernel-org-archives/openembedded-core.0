Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ACC546BB18
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 21:29:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 09 Sep 2013 14:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,873,1371106800"; d="scan'208";a="393260741"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.204])
	by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2013 14:29:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2013 14:29:20 -0700
Message-Id: <1378762160-25151-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] gstreamer-plugins: Change anonymous python structure
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
X-List-Received-Date: Mon, 09 Sep 2013 21:29:20 -0000

This change ensures that the SRC_URI is set before base.bbclass code is called. This will
also ensure that the xz-native depends is set correct.

[YOCTO #5127]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 6f27957..651119e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -30,7 +30,9 @@ oe_runconf_prepend() {
 	fi
 }
 
-python __anonymous () {
+SRC_URI = "${@get_gst_srcuri(d)}"
+
+def get_gst_srcuri(d):
     # check if expected prefix is present
     prefix = "gstreamer1.0-"
     bpn = d.getVar("BPN", True)
@@ -43,10 +45,10 @@ python __anonymous () {
     branch = d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
 
     if pv == "git":
-        d.setVar("SRC_URI", "git://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch))
+        s = "git://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch)
     else:
-        d.setVar("SRC_URI", "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv))
-}
+        s = "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv)
+    return s
 
 delete_liblink_m4_file() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-- 
1.8.3.1


