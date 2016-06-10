Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 38A6C62134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 19:54:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jun 2016 12:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,451,1459839600"; d="scan'208";a="999511361"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2016 12:54:05 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 11:48:53 +0000
Message-Id: <3da6a3ae457fb93388b3ae2a255a043b60626f42.1465559091.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1465559091.git.mariano.lopez@linux.intel.com>
References: <cover.1465559091.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] update-rc.d.bbclass: Disable class when sysvinit is not in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 10 Jun 2016 19:54:17 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

When sysvinit is not in use, update-rd.d class adds build dependencies
that won't be needed, this patch removes the build dependecies and
won't add the task to PACKAGESPLITFUNCS.

[YOCTO #9515]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/update-rc.d.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 2a0a74a..82b8024 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,6 +1,7 @@
 UPDATERCPN ?= "${PN}"
 
-DEPENDS_append_class-target = " update-rc.d-native update-rc.d initscripts"
+DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', ' update-rc.d-native update-rc.d initscripts', '', d)}"
+
 UPDATERCD = "update-rc.d"
 UPDATERCD_class-cross = ""
 UPDATERCD_class-native = ""
@@ -64,7 +65,7 @@ python __anonymous() {
     update_rc_after_parse(d)
 }
 
-PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
+PACKAGESPLITFUNCS_prepend = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'populate_packages_updatercd ', '', d)}"
 PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
 
 populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
@@ -120,8 +121,7 @@ python populate_packages_updatercd () {
 
     # Check that this class isn't being inhibited (generally, by
     # systemd.bbclass) before doing any work.
-    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or \
-       not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
+    if not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
             pkgs = d.getVar('UPDATERCPN', True)
-- 
2.6.6


