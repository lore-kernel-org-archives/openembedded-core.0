Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D188A73D9C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 14:15:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 May 2015 07:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,366,1427785200"; d="scan'208";a="689613087"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2015 07:15:43 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 May 2015 17:15:39 +0300
Message-Id: <2b01d7b33d64ff7af4992d86c031083092eb56f8.1430748903.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430748903.git.cristian.iorga@intel.com>
References: <cover.1430748903.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1430748903.git.cristian.iorga@intel.com>
References: <cover.1430748903.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] connman: upgrade to 1.29
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
X-List-Received-Date: Mon, 04 May 2015 14:15:43 -0000

- Add support for Ethernet and VLAN usage;
- Fixes.

Added build-create-dirs-before-putting-files-in-them.patch,
already submitted upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...-create-dirs-before-putting-files-in-them.patch | 46 ++++++++++++++++++++++
 .../connman/{connman_1.28.bb => connman_1.29.bb}   |  5 ++-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/build-create-dirs-before-putting-files-in-them.patch
 rename meta/recipes-connectivity/connman/{connman_1.28.bb => connman_1.29.bb} (58%)

diff --git a/meta/recipes-connectivity/connman/connman/build-create-dirs-before-putting-files-in-them.patch b/meta/recipes-connectivity/connman/connman/build-create-dirs-before-putting-files-in-them.patch
new file mode 100644
index 0000000..260d68d
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/build-create-dirs-before-putting-files-in-them.patch
@@ -0,0 +1,46 @@
+When automake's dependency tracking is enabled a mirror of the source tree is
+created in the build directory as it writes the dependency information.
+
+However, if dependency tracking is disabled on an out-of-tree build this mirror
+isn't created and it's possible that the .service files can't be written as the
+directories they go into haven't been created yet (racing against the compiles,
+which do create directories).
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+---
+ Makefile.am | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 507736d..bc3c695 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -410,9 +410,11 @@ MAINTAINERCLEANFILES = Makefile.in \
+
+
+ src/builtin.h: src/genbuiltin $(builtin_sources)
++	$(AM_V_AT)$(MKDIR_P) $(dir $@)
+ 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
+
+ vpn/builtin.h: src/genbuiltin $(builtin_vpn_sources)
++	$(AM_V_AT)$(MKDIR_P) $(dir $@)
+ 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_vpn_modules) > $@
+
+ src/connman.conf: src/connman-dbus.conf src/connman-polkit.conf
+@@ -449,9 +451,11 @@ do_subst = $(AM_V_GEN)$(SED) \
+ 		-e 's,[@]sysconfdir[@],$(sysconfdir),g'
+
+ %.service: %.service.in Makefile
++	$(AM_V_AT)$(MKDIR_P) $(dir $@)
+ 	$(do_subst) < $< > $@
+
+ scripts/connman: scripts/connman.in Makefile
++	$(AM_V_at)$(MKDIR_P) scripts
+ 	$(do_subst) < $< > $@
+
+ include/connman/version.h: include/version.h
+--
+2.1.4
+
diff --git a/meta/recipes-connectivity/connman/connman_1.28.bb b/meta/recipes-connectivity/connman/connman_1.29.bb
similarity index 58%
rename from meta/recipes-connectivity/connman/connman_1.28.bb
rename to meta/recipes-connectivity/connman/connman_1.29.bb
index 53e71fa..3bcd778 100644
--- a/meta/recipes-connectivity/connman/connman_1.28.bb
+++ b/meta/recipes-connectivity/connman/connman_1.29.bb
@@ -3,10 +3,11 @@ require connman.inc
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
+            file://build-create-dirs-before-putting-files-in-them.patch \
             file://connman \
             "
-SRC_URI[md5sum] = "6e07c93877f80bb73c9d4dbfc697f3fc"
-SRC_URI[sha256sum] = "b1d5e7dd2652725906e220a8b0206477e97080e835272971e3b2fd10943c5c94"
+SRC_URI[md5sum] = "5283884504860f5fba2e6f489f517293"
+SRC_URI[sha256sum] = "2a5a69693566f7fd59b2e677fa89356ada6d709998aa665caef8707b1e7a8594"
 
 RRECOMMENDS_${PN} = "connman-conf"
 
-- 
2.1.0


