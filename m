Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7CE61E92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 12:46:14 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2013 05:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,806,1363158000"; d="scan'208";a="312617031"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2013 05:46:13 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 15:47:15 +0300
Message-Id: <1370436435-3822-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] iptables: upgrade to 1.4.19.1
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
X-List-Received-Date: Wed, 05 Jun 2013 12:46:14 -0000

fix-iptables-extensions-build-error.patch no longer needed.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../fix-iptables-extensions-build-error.patch      |   44 --------------------
 .../{iptables_1.4.18.bb => iptables_1.4.19.1.bb}   |    5 +--
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.18.bb => iptables_1.4.19.1.bb} (90%)

diff --git a/meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch b/meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch
deleted file mode 100644
index 4cd919d..0000000
--- a/meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0a43f156e23edf616859ac5a8c90e41ccc5cb1cd Mon Sep 17 00:00:00 2001
-From: Cristian Iorga <cristian.iorga@intel.com>
-Date: Wed, 16 Jan 2013 20:14:43 +0200
-Subject: [PATCH] extensions: fix iptables extensions build error            
- in cross-compilation environments
-
-libtool is properly declared and used for cross-platform
-build environments
-
-Upstream-Status: Pending
-
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
----
- extensions/GNUmakefile.in |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in
-index adad4d6..befb1fb 100644
---- a/extensions/GNUmakefile.in
-+++ b/extensions/GNUmakefile.in
-@@ -13,6 +13,7 @@ xtlibdir     = @xtlibdir@
- 
- CC                 = @CC@
- CCLD               = ${CC}
-+LIBTOOL            = @LIBTOOL@
- CFLAGS             = @CFLAGS@
- CPPFLAGS           = @CPPFLAGS@
- LDFLAGS            = @LDFLAGS@
-@@ -94,10 +95,10 @@ lib%.so: lib%.la
- 	${AM_VERBOSE_NULL} ln -fs .libs/$@ $@
- 
- lib%.la: lib%.lo
--	${AM_VERBOSE_CCLD} ../libtool ${AM_LIBTOOL_SILENT} --tag=CC --mode=link ${CCLD} ${AM_LDFLAGS} -module ${LDFLAGS} -o $@ $< ../libxtables/libxtables.la ${$*_LIBADD} -rpath ${xtlibdir}
-+	${AM_VERBOSE_CCLD} ${LIBTOOL} ${AM_LIBTOOL_SILENT} --tag=CC --mode=link ${CCLD} ${AM_LDFLAGS} -module ${LDFLAGS} -o $@ $< ../libxtables/libxtables.la ${$*_LIBADD} -rpath ${xtlibdir}
- 
- lib%.lo: ${srcdir}/lib%.c
--	${AM_VERBOSE_CC} ../libtool ${AM_LIBTOOL_SILENT} --tag=CC --mode=compile ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init ${CFLAGS} -o $@ -c $<
-+	${AM_VERBOSE_CC} ${LIBTOOL} ${AM_LIBTOOL_SILENT} --tag=CC --mode=compile ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init ${CFLAGS} -o $@ -c $<
- 
- libxt_NOTRACK.so: libxt_CT.so
- 	${AM_VERBOSE_GEN} ln -fs $< $@
--- 
-1.7.10.4
-
diff --git a/meta/recipes-extended/iptables/iptables_1.4.18.bb b/meta/recipes-extended/iptables/iptables_1.4.19.1.bb
similarity index 90%
rename from meta/recipes-extended/iptables/iptables_1.4.18.bb
rename to meta/recipes-extended/iptables/iptables_1.4.19.1.bb
index bb8718f..a98ad4c 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.18.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.19.1.bb
@@ -21,12 +21,11 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
-           file://fix-iptables-extensions-build-error.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
           "
 
-SRC_URI[md5sum] = "a819199d5ec013b82da13a8ffbba857e"
-SRC_URI[sha256sum] = "14a99fb8b0ca22027a9ac6eb72fa32c834ceb3073820e0ba79bf251c6a7bcf3c"
+SRC_URI[md5sum] = "be97ce9007fa42c867901b496c935a0a"
+SRC_URI[sha256sum] = "dd51d3b942758a462afc7c8495930d25c93058e5319303247375183ad50164d2"
 
 inherit autotools
 
-- 
1.7.10.4


