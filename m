Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C25A472A6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:25:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:18:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="647910875"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2015 10:25:00 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 20:24:53 +0200
Message-Id: <6351f8bcd5d3d278fbdd7dca19115d992b840fff.1423160658.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423160658.git.cristian.iorga@intel.com>
References: <cover.1423160658.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1423160658.git.cristian.iorga@intel.com>
References: <cover.1423160658.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] neard: upgrade to 0.15
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
X-List-Received-Date: Thu, 05 Feb 2015 18:25:04 -0000

- parallel-build.patch patch removed,
included upstream;
- systemd unit files provided by neard,
YP-provided removed;
- improved systemd support.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/neard/neard.inc          | 10 +++---
 .../neard/neard/parallel-build.patch               | 40 ----------------------
 meta/recipes-connectivity/neard/neard_0.14.bb      | 12 -------
 meta/recipes-connectivity/neard/neard_0.15.bb      |  9 +++++
 4 files changed, 13 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard/parallel-build.patch
 delete mode 100644 meta/recipes-connectivity/neard/neard_0.14.bb
 create mode 100644 meta/recipes-connectivity/neard/neard_0.15.bb

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index 76640d8..31bc6dd 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -11,6 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/ --with-systemduserunitdir=${systemd_unitdir}/user/,--disable-systemd"
+
 EXTRA_OECONF += "--enable-tools"
 
 do_install() {
@@ -26,12 +30,6 @@ do_install_append() {
 		chmod 0755 ${D}${sysconfdir}/init.d/neard
 	fi
 
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		install -d ${D}${systemd_unitdir}/system
-		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.service.in \
-		  > ${D}${systemd_unitdir}/system/neard.service
-	fi
-
 	# Install the tests for neard-tests
 	install -d ${D}${libdir}/neard
 	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
diff --git a/meta/recipes-connectivity/neard/neard/parallel-build.patch b/meta/recipes-connectivity/neard/neard/parallel-build.patch
deleted file mode 100644
index 5624749..0000000
--- a/meta/recipes-connectivity/neard/neard/parallel-build.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 488e898300f7a4ab9ba73307967ae9e02b7a6511 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Fri, 13 Jun 2014 17:49:45 +0100
-Subject: [PATCH] Makefile: add missing binaries to dependency on
- local_headers
-
-seeld and snap_send were missing from the rule that generates the header symlink
-farm, resulting in headers not being available in highly parallel builds.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- Makefile.am |    9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index c51351f..8e58ac1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -254,7 +254,14 @@ se/plugin.$(OBJEXT): se/builtin.h
- se/builtin.h: src/genbuiltin $(builtin_se_sources)
- 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_se_modules) > $@
- 
--$(src_neard_OBJECTS) $(tools_nfctool_nfctool_OBJECTS) $(plugin_objects): $(local_headers)
-+$(src_neard_OBJECTS) \
-+$(tools_nfctool_nfctool_OBJECTS) \
-+$(plugin_objects) \
-+$(se_seeld_OBJECTS) \
-+$(unit_test_ndef_parse_OBJECTS) \
-+$(unit_test_ndef_build_OBJECTS) \
-+$(unit_test_snep_read_OBJECTS) \
-+$(tools_snep_send_OBJECTS): $(local_headers)
- 
- include/near/version.h: include/version.h
- 	$(AM_V_at)$(MKDIR_P) include/near
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/neard/neard_0.14.bb b/meta/recipes-connectivity/neard/neard_0.14.bb
deleted file mode 100644
index 7a1096b..0000000
--- a/meta/recipes-connectivity/neard/neard_0.14.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require neard.inc
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
-           file://parallel-build.patch \
-           file://neard.in \
-           file://neard.service.in \
-           file://Makefile.am-fix-parallel-issue.patch \
-          "
-SRC_URI[md5sum] = "692ba2653d60155255244c87396c486b"
-SRC_URI[sha256sum] = "6ea724b443d39d679168fc7776a965d1f64727c3735391df2c01469ee7cd8cca"
-
-PR = "r1"
diff --git a/meta/recipes-connectivity/neard/neard_0.15.bb b/meta/recipes-connectivity/neard/neard_0.15.bb
new file mode 100644
index 0000000..c92a171
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard_0.15.bb
@@ -0,0 +1,9 @@
+require neard.inc
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
+           file://neard.in \
+           file://Makefile.am-fix-parallel-issue.patch \
+          "
+SRC_URI[md5sum] = "b746ce62eeef88e8de90765e00a75a1c"
+SRC_URI[sha256sum] = "651f6513d32cdaf8a426255d03aff38a6620a89b0567ec2b36606c6330a93353"
+
-- 
2.1.0


