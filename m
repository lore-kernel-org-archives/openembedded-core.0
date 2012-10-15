Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TNtD3-0003oL-12
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 00:32:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Oct 2012 15:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,590,1344236400"; d="scan'208";a="156486156"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.226])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Oct 2012 15:19:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2012 15:19:10 -0700
Message-Id: <1350339551-8820-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 1/2] bitbake.conf: change libexecdir to ${libdir}/${BPN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2012 22:32:29 -0000

In order to be more compliant with the Filesystem Hierarchs
Standard (FHS), this change removes the /usr/libexec default
in favor of ${libdir}/${BPN} (which is typically /usr/lib).

http://www.pathname.com/fhs/pub/fhs-2.3.html

This also address the native and STAGING variations

[YOCTO #2915]

(From OE-Core rev: 68c31b095a1cb20bd297df596024fc568614f5e8)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 324dc9f..64bcd42 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -35,8 +35,8 @@ export docdir = "${datadir}/doc"
 # Architecture dependent paths
 export bindir = "${exec_prefix}/bin"
 export sbindir = "${exec_prefix}/sbin"
-export libexecdir = "${exec_prefix}/libexec"
 export libdir = "${exec_prefix}/${baselib}"
+export libexecdir = "${libdir}/${BPN}"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
 export systemd_unitdir = "${base_libdir}/systemd"
@@ -51,6 +51,7 @@ bindir_native = "${prefix_native}/bin"
 sbindir_native = "${prefix_native}/sbin"
 includedir_native = "${prefix_native}/include"
 libdir_native = "${prefix_native}/lib"
+libexecdir_native = "${libdir_native}/${BPN}"
 base_libdir_native = "/lib"
 datadir_native = "${prefix_native}/share"
 bindir_cross = "/bin"
@@ -350,6 +351,7 @@ STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_BINDIR_CROSS = "${STAGING_BINDIR}/crossscripts"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
+STAGING_LIBEXECDIR_NATIVE = "${STAGING_DIR_NATIVE}${libexecdir_native}"
 STAGING_BASE_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${base_libdir_native}"
 STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
@@ -358,6 +360,7 @@ STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
 STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}"
 STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
 STAGING_LIBDIR = "${STAGING_DIR_HOST}${libdir}"
+STAGING_LIBEXECDIR = "${STAGING_DIR_HOST}${libexecdir}"
 STAGING_BASELIBDIR = "${STAGING_DIR_HOST}${base_libdir}"
 STAGING_INCDIR = "${STAGING_DIR_HOST}${includedir}"
 STAGING_DATADIR = "${STAGING_DIR_HOST}${datadir}"
-- 
1.7.7.6



