Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sbfpo-00014q-U3
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 00:33:13 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so6811292pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 15:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZL5yv5oGXPTUDPi7OCad6NWiB7Dlgh1J8X5s0Uhfcvw=;
	b=d+oNwjBcck21Nm0/QkDwNI0UHHZH6dkS3YoKhzVQPqc+T3Vo9MQSIzAqgUYgHNXuBV
	4lDU3wb0iJ6jnmxvCj0nvn2yH8zbuFKMLz5NW+rfE35nxaD9dkfqPcvKa+5ybrQscORL
	M658vl4PWMcZTtJSWqxEexmLOuAMvvNoNY3WLe2/PlG1uzLgei6lWTAvGSmRzOV1VTH8
	2wNanhyUxaLGpK8zfDqwiL3d5EbhT3i3yjqOoLu3aQoWLLGgQekW7nx/sMRNY7/IDIoh
	lwi0zd/+jIsOVIIcjl0nSskKMlhKTCiiIpHItYUBVmmwEqQAdyYU5NtthtWxlvXtGQQT
	cQnw==
Received: by 10.68.232.161 with SMTP id tp1mr43861711pbc.44.1338848569627;
	Mon, 04 Jun 2012 15:22:49 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id we10sm34017pbc.13.2012.06.04.15.22.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 15:22:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2012 15:21:46 -0700
Message-Id: <048f41bb35e65cb5235eca7b7d1f891517af6827.1338848379.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
References: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
In-Reply-To: <cover.1338848379.git.raj.khem@gmail.com>
References: <cover.1338848379.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] libzypp: Fix build with uclibc
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
X-List-Received-Date: Mon, 04 Jun 2012 22:33:13 -0000

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
index 3c3a9f0..0fe6114 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -11,7 +11,7 @@ DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev libproxy"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r20"
+PR = "r21"
 
 SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
 	   file://fix_for_compile_wth_gcc-4.6.0.patch \
 	   file://hardcode-lib-fix.patch \
 	   file://close.patch \
+	   file://cstdio.patch \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
@@ -31,7 +32,10 @@ SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
 SRC_URI_append_arm  = " file://arm-workaround-global-constructor.patch"
 
 # rpmdb2solv from sat-solver is run from libzypp
-RDEPENDS_${PN} = "sat-solver rpm-libs gzip gnupg"
+RDEPENDS_${PN} = "sat-solver rpm-libs gzip ${RDEPGNUPG}"
+
+RDEPGNUPG = "gnupg"
+RDEPGNUPG_libc-uclibc = ""
 
 PACKAGES =+ "${PN}-pkgmgt"
 
@@ -45,6 +49,8 @@ FILES_${PN}-pkgmgt = "${bindir}/package-manager \
 
 EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
 
+LDFLAGS += "-lpthread"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 AVOID_CONSTRUCTOR = ""
-- 
1.7.5.4



