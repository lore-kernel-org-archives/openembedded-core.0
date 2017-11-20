Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DEBB1788CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:15:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 04:15:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,426,1505804400"; 
   d="scan'208";a="7294454"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2017 04:15:40 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 14:15:24 +0200
Message-Id: <dfd0f3afcabf507e2f9e98a43abb4574c77186c3.1511179969.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
References: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<cover.1511179969.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v6 07/15] iptables: enable native
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
X-List-Received-Date: Mon, 20 Nov 2017 12:15:40 -0000

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 ...revent-absolute-path-in-installed-symlink.patch | 29 ++++++++++++++++++++++
 meta/recipes-extended/iptables/iptables_1.6.1.bb   |  3 +++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/prevent-absolute-path-in-installed-symlink.patch

diff --git a/meta/recipes-extended/iptables/iptables/prevent-absolute-path-in-installed-symlink.patch b/meta/recipes-extended/iptables/iptables/prevent-absolute-path-in-installed-symlink.patch
new file mode 100644
index 0000000000..3ca6c0dd28
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/prevent-absolute-path-in-installed-symlink.patch
@@ -0,0 +1,29 @@
+From d7a50cf5a9f03f3b65293d556dadfc484456b0d8 Mon Sep 17 00:00:00 2001
+From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+Date: Fri, 17 Nov 2017 14:10:59 +0200
+Subject: [PATCH] prevent absolute path in installed symlink
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+---
+ iptables/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/iptables/Makefile.am b/iptables/Makefile.am
+index f92cc4f..55ce793 100644
+--- a/iptables/Makefile.am
++++ b/iptables/Makefile.am
+@@ -88,7 +88,8 @@ pkgconfig_DATA = xtables.pc
+ install-exec-hook:
+ 	-if test -z "${DESTDIR}"; then /sbin/ldconfig; fi;
+ 	${INSTALL} -dm0755 "${DESTDIR}${bindir}";
+-	for i in ${vx_bin_links}; do ${LN_S} -f "${sbindir}/xtables-multi" "${DESTDIR}${bindir}/$$i"; done;
++	_relpath=`python -c "import os.path; print(os.path.relpath('${sbindir}/xtables-multi', '${bindir}'))"`; \
++	for i in ${vx_bin_links}; do ${LN_S} -f "$${_relpath}" "${DESTDIR}${bindir}/$$i"; done;
+ 	for i in ${v4_sbin_links}; do ${LN_S} -f xtables-multi "${DESTDIR}${sbindir}/$$i"; done;
+ 	for i in ${v6_sbin_links}; do ${LN_S} -f xtables-multi "${DESTDIR}${sbindir}/$$i"; done;
+ 	for i in ${x_sbin_links}; do ${LN_S} -f xtables-compat-multi "${DESTDIR}${sbindir}/$$i"; done;
+-- 
+2.13.6
+
diff --git a/meta/recipes-extended/iptables/iptables_1.6.1.bb b/meta/recipes-extended/iptables/iptables_1.6.1.bb
index b37c55a64e..2f565821a4 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.1.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
            file://0001-fix-build-with-musl.patch \
+           file://prevent-absolute-path-in-installed-symlink.patch \
 "
 
 SRC_URI[md5sum] = "ab38a33806b6182c6f53d6afb4619add"
@@ -47,3 +48,5 @@ do_configure_prepend() {
 	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
 	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
 }
+
+BBCLASSEXTEND = "native"
-- 
2.13.6


