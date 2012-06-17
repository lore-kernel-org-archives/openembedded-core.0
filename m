Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Ny-0008Qm-Tz
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103298"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:53 -0700
Message-Id: <505e87d8aafb2db514ff5dbc83efdfaa175fe18f.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 09/23] libzypp: Fix build with uclibc
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:55 -0000

From: Khem Raj <raj.khem@gmail.com>

cstdio is included indrectly with eglibc based systems
but not with uclibc based systems and use of functions
like ::eof are then reported as warnings. Therefore
we include cstdio explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libzypp/libzypp/cstdio.patch |   49 ++++++++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |   10 +++-
 2 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/cstdio.patch

diff --git a/meta/recipes-extended/libzypp/libzypp/cstdio.patch b/meta/recipes-extended/libzypp/libzypp/cstdio.patch
new file mode 100644
index 0000000..a021d58
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/cstdio.patch
@@ -0,0 +1,49 @@
+include cstdio to get definitions of ::xxx functions which
+are now reported by gcc-4.7 as wanrings and warnings are treated
+as errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: git/zypp/ExternalProgram.cc
+===================================================================
+--- git.orig/zypp/ExternalProgram.cc	2012-06-01 16:25:17.098304709 -0700
++++ git/zypp/ExternalProgram.cc	2012-06-01 16:25:37.254305681 -0700
+@@ -22,6 +22,7 @@
+ #include <cstring> // strsignal
+ #include <iostream>
+ #include <sstream>
++#include <cstdio>
+ 
+ #include "zypp/base/Logger.h"
+ #include "zypp/base/String.h"
+Index: git/zypp/PluginScript.cc
+===================================================================
+--- git.orig/zypp/PluginScript.cc	2012-06-01 16:21:37.814294089 -0700
++++ git/zypp/PluginScript.cc	2012-06-01 16:24:41.002302961 -0700
+@@ -14,6 +14,7 @@
+ 
+ #include <iostream>
+ #include <sstream>
++#include <cstdio>
+ 
+ #include "zypp/base/LogTools.h"
+ #include "zypp/base/DefaultIntegral.h"
+@@ -336,7 +337,7 @@
+     if ( fd == -1 )
+       ZYPP_THROW( PluginScriptException( "Bad file descriptor" ) );
+ 
+-    ::clearerr( filep );
++    std::clearerr( filep );
+     std::string data;
+     {
+       PluginDebugBuffer _debug( data ); // dump receive buffer if PLUGIN_DEBUG
+@@ -370,7 +371,7 @@
+ 	    int retval = select( fd+1, &rfds, NULL, NULL, &tv );
+ 	    if ( retval > 0 )	// FD_ISSET( fd, &rfds ) will be true.
+ 	    {
+-	      ::clearerr( filep );
++	      std::clearerr( filep );
+ 	    }
+ 	    else if ( retval == 0 )
+ 	    {
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 90ee8c4..ca32e73 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -11,7 +11,7 @@ DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev libproxy"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r22"
+PR = "r23"
 
 SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
 	   file://hardcode-lib-fix.patch \
 	   file://close.patch \
 	   file://libzypp-rpm549.patch \
+	   file://cstdio.patch \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
@@ -32,7 +33,10 @@ SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
 SRC_URI_append_arm  = " file://arm-workaround-global-constructor.patch"
 
 # rpmdb2solv from sat-solver is run from libzypp
-RDEPENDS_${PN} = "sat-solver rpm-libs gzip gnupg"
+RDEPENDS_${PN} = "sat-solver rpm-libs gzip ${RDEPGNUPG}"
+
+RDEPGNUPG = "gnupg"
+RDEPGNUPG_libc-uclibc = ""
 
 PACKAGES =+ "${PN}-pkgmgt"
 
@@ -46,6 +50,8 @@ FILES_${PN}-pkgmgt = "${bindir}/package-manager \
 
 EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
 
+LDFLAGS += "-lpthread"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 AVOID_CONSTRUCTOR = ""
-- 
1.7.7.6



