Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnKw-0005wZ-TE
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:19 +0200
Received: by mail-yx0-f175.google.com with SMTP id l13so7051851yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=eaamBkeGwnJ5ZGt6NhuuEJLAUO8snuouNlsXYBsgBLo=;
	b=eZgsBRKew+Kiec0aTaoD6WNcKiO69dzXf5HFznuJDvo19lQ0XTla1EM8jwtB38Jcmr
	tbbvLzQbyQYulrzfC5tUHDVikJAO9zUyvGD7+61Ash8QlUZeJVW0cWQkaP8CxnuBcj53
	JsLsQC3Wy9dRvvzSoxxuaYArIv6CgQxKTazJMb3XrbRr/v54klzTpOkBBzenT7uIrsRz
	Q/0q6En+AGf+lj43SpT73OvXGFXzCq7CmHYLr7dJfp9yuTniqVS2x18Qocm/jiKPHdf5
	xBkjasU9GaH5AC6EUj9GGQ7LAD1URxWQaGzpGEXLXXlY4sIvhonvWGU2FOWU8iib1vy/
	eKJw==
Received: by 10.66.89.170 with SMTP id bp10mr37747018pab.12.1341498975485;
	Thu, 05 Jul 2012 07:36:15 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.36.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:36:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:31 -0700
Message-Id: <d510e86847c0f837a2cec2da9a803580c5d3ccce.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 12/14] valgrind: Fix build with eglibc 2.16
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
X-List-Received-Date: Thu, 05 Jul 2012 14:47:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../valgrind-3.7.0/configure-with-glibc-2.16.patch |   32 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    6 ++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch
new file mode 100644
index 0000000..c622637
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch
@@ -0,0 +1,32 @@
+Add case for glibc 2.16 and correct error message to denote support until 2.16
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: valgrind-3.7.0/configure.in
+===================================================================
+--- valgrind-3.7.0.orig/configure.in	2012-07-04 12:57:10.557192441 -0700
++++ valgrind-3.7.0/configure.in	2012-07-04 12:57:58.785194776 -0700
+@@ -788,6 +788,13 @@
+ 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+ 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
++     2.16)
++	AC_MSG_RESULT(2.16 family)
++	AC_DEFINE([GLIBC_2_16], 1, [Define to 1 if you're using glibc 2.16.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+ 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
+@@ -801,7 +808,7 @@
+ 
+      *)
+ 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
+-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.14])
++	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.16])
+ 	AC_MSG_ERROR([or Darwin libc])
+ 	;;
+ esac
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index 6b54472..97b135c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
 
 X11DEPENDS = "virtual/libx11"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
@@ -17,7 +17,9 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://fix_for_automake_1.11.2.patch \
            file://configure-fix.patch \
-           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch"
+           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
+           file://configure-with-glibc-2.16.patch \
+          "
 
 SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
 SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
-- 
1.7.9.5



