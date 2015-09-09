Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A51B176420
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 15:36:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Sep 2015 08:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,497,1437462000"; d="scan'208";a="801557609"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2015 08:36:10 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 18:36:50 +0300
Message-Id: <1441813010-31215-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] connman: upgrade to 1.30
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
X-List-Received-Date: Wed, 09 Sep 2015 15:36:28 -0000

Bugfixes.

build-create-dirs-before-putting-files-in-them.patch
patch removed, patch included upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...-create-dirs-before-putting-files-in-them.patch | 46 ----------------------
 .../connman/{connman_1.29.bb => connman_1.30.bb}   |  5 +--
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/build-create-dirs-before-putting-files-in-them.patch
 rename meta/recipes-connectivity/connman/{connman_1.29.bb => connman_1.30.bb} (58%)

diff --git a/meta/recipes-connectivity/connman/connman/build-create-dirs-before-putting-files-in-them.patch b/meta/recipes-connectivity/connman/connman/build-create-dirs-before-putting-files-in-them.patch
deleted file mode 100644
index 260d68d..0000000
--- a/meta/recipes-connectivity/connman/connman/build-create-dirs-before-putting-files-in-them.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-When automake's dependency tracking is enabled a mirror of the source tree is
-created in the build directory as it writes the dependency information.
-
-However, if dependency tracking is disabled on an out-of-tree build this mirror
-isn't created and it's possible that the .service files can't be written as the
-directories they go into haven't been created yet (racing against the compiles,
-which do create directories).
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- Makefile.am | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 507736d..bc3c695 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -410,9 +410,11 @@ MAINTAINERCLEANFILES = Makefile.in \
-
-
- src/builtin.h: src/genbuiltin $(builtin_sources)
-+	$(AM_V_AT)$(MKDIR_P) $(dir $@)
- 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
-
- vpn/builtin.h: src/genbuiltin $(builtin_vpn_sources)
-+	$(AM_V_AT)$(MKDIR_P) $(dir $@)
- 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_vpn_modules) > $@
-
- src/connman.conf: src/connman-dbus.conf src/connman-polkit.conf
-@@ -449,9 +451,11 @@ do_subst = $(AM_V_GEN)$(SED) \
- 		-e 's,[@]sysconfdir[@],$(sysconfdir),g'
-
- %.service: %.service.in Makefile
-+	$(AM_V_AT)$(MKDIR_P) $(dir $@)
- 	$(do_subst) < $< > $@
-
- scripts/connman: scripts/connman.in Makefile
-+	$(AM_V_at)$(MKDIR_P) scripts
- 	$(do_subst) < $< > $@
-
- include/connman/version.h: include/version.h
---
-2.1.4
-
diff --git a/meta/recipes-connectivity/connman/connman_1.29.bb b/meta/recipes-connectivity/connman/connman_1.30.bb
similarity index 58%
rename from meta/recipes-connectivity/connman/connman_1.29.bb
rename to meta/recipes-connectivity/connman/connman_1.30.bb
index 3bcd778..8c47353 100644
--- a/meta/recipes-connectivity/connman/connman_1.29.bb
+++ b/meta/recipes-connectivity/connman/connman_1.30.bb
@@ -3,11 +3,10 @@ require connman.inc
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
-            file://build-create-dirs-before-putting-files-in-them.patch \
             file://connman \
             "
-SRC_URI[md5sum] = "5283884504860f5fba2e6f489f517293"
-SRC_URI[sha256sum] = "2a5a69693566f7fd59b2e677fa89356ada6d709998aa665caef8707b1e7a8594"
+SRC_URI[md5sum] = "4a3efdbd6796922db9c6f66da57887fa"
+SRC_URI[sha256sum] = "5c5e464bacc9c27ed4e7269fb9b5059f07947f5be26433b59212133663ffa991"
 
 RRECOMMENDS_${PN} = "connman-conf"
 
-- 
2.1.4


