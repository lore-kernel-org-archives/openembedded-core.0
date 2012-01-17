Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b0-0006h6-Og
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633015"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:23 -0800
Message-Id: <fe13c126970446f5c8399303f33fb96e583d7718.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 38/62] bitbake.conf: search /lib for -native builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2012 08:40:49 -0000

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Changes to BUILD_LDFLAGS are required due to the recent movement of some
libraries from ${libdir} to ${base_libdir}.  ${base_libdir} must be now
in the linker search path to avoid build problems of -native packages.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/conf/bitbake.conf |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 43eedad..d051363 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -49,6 +49,7 @@ bindir_native = "${prefix_native}/bin"
 sbindir_native = "${prefix_native}/sbin"
 includedir_native = "${prefix_native}/include"
 libdir_native = "${prefix_native}/lib"
+base_libdir_native = "/lib"
 datadir_native = "${prefix_native}/share"
 bindir_cross = "/bin"
 bindir_crossscripts = "${bindir}/crossscripts"
@@ -330,6 +331,7 @@ STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_BINDIR_CROSS = "${STAGING_BINDIR}/crossscripts"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
+STAGING_BASE_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${base_libdir_native}"
 STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
 STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
@@ -462,8 +464,12 @@ export CXXFLAGS = "${TARGET_CXXFLAGS}"
 export TARGET_CXXFLAGS = "${TARGET_CFLAGS} -fpermissive"
 
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
+                        -L${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
-                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
+                        -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
+                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} \
+                        -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} \
+                        -Wl,-O1"
 
 BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
                     -Wl,-rpath-link,${STAGING_LIBDIR} \
-- 
1.7.6.5



