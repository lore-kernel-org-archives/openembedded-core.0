Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RTeAf-0007wE-3S
	for openembedded-core@openembedded.org; Thu, 24 Nov 2011 19:37:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Nov 2011 10:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79613680"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.93])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2011 10:29:27 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu, 24 Nov 2011 10:29:25 -0800
Message-Id: <f8e475e6907d1ad9bfb93ec4c37a0876bc5ed90f.1322095568.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322095568.git.sgw@linux.intel.com>
References: <cover.1322095568.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322095568.git.sgw@linux.intel.com>
References: <cover.1322095568.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] intltool: remove XML::Parser check
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
X-List-Received-Date: Thu, 24 Nov 2011 18:37:18 -0000

Add Patch to disable the XML::Parser check in the target
intltool.m4, this check will find the host (not native)
XML::Parser if it's installed possibly causing Host
contamination, but will also fail configuration if XML::Parser
is not installed on the host.

Since we know that XML::Parser is installed on the image, we don't
really need this check, so comment it out.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../intltool-0.40.6/remove-xml-check.patch         |   29 ++++++++++++++++++++
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    7 +++--
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch

diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
new file mode 100644
index 0000000..476d091
--- /dev/null
+++ b/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
@@ -0,0 +1,29 @@
+Index: intltool-0.40.6/intltool.m4
+===================================================================
+--- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
++++ intltool-0.40.6/intltool.m4	2011-11-23 15:39:34.689561872 -0800
+@@ -122,14 +122,16 @@
+    IT_PERL_VERSION="`$INTLTOOL_PERL -e \"printf '%vd', $^V\"`"
+    AC_MSG_RESULT([$IT_PERL_VERSION])
+ fi
+-if test "x$2" != "xno-xml"; then
+-   AC_MSG_CHECKING([for XML::Parser])
+-   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
+-       AC_MSG_RESULT([ok])
+-   else
+-       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
+-   fi
+-fi
++
++# Disable this check since we know XML::Parser is installed
++#if test "x$2" != "xno-xml"; then
++#   AC_MSG_CHECKING([for XML::Parser])
++#   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
++#       AC_MSG_RESULT([ok])
++#   else
++#       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
++#   fi
++#fi
+ 
+ # Substitute ALL_LINGUAS so we can use it in po/Makefile
+ AC_SUBST(ALL_LINGUAS)
diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
index e9871fc..8180fd8 100644
--- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
@@ -1,14 +1,15 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r5"
+PR = "r6"
 
 SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
                    ${NATIVEPATCHES} \
                  "
 
-NATIVEPATCHES = "file://noperlcheck.patch"
-NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
+NATIVEPATCHES = "file://noperlcheck.patch \
+                 file://remove-xml-check.patch"
+NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch" 
 
 SRC_URI[md5sum] = "69bc0353323112f42ad4f9cf351bc3e5"
 SRC_URI[sha256sum] = "4d1e5f8561f09c958e303d4faa885079a5e173a61d28437d0013ff5efc9e3b64"
-- 
1.7.5.4



