Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RV6yg-0007f2-Pz
	for openembedded-core@openembedded.org; Mon, 28 Nov 2011 20:34:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Nov 2011 11:28:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,585,1315206000"; d="scan'208";a="89897439"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2011 11:28:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Mon, 28 Nov 2011 11:28:16 -0800
Message-Id: <3371b070212a6d173137e4fc8e4388dd86666ad2.1322508364.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322508364.git.sgw@linux.intel.com>
References: <cover.1322508364.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322508364.git.sgw@linux.intel.com>
References: <cover.1322508364.git.sgw@linux.intel.com>
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
X-List-Received-Date: Mon, 28 Nov 2011 19:34:59 -0000

Add Patch to disable the XML::Parser check in the target
intltool.m4, this check will find the host (not native)
XML::Parser if it's installed possibly causing Host
contamination, but will also fail configuration if XML::Parser
is not installed on the host.

Since we know that XML::Parser is installed on the image, we don't
really need this check, so comment it out.

From RP in mail thread:
> If the recipe needs perl for
> some other reason than intltool, it needs perlnative but it if only
> needs perl for intltool, we shouldn't need the dependency. The .m4 macro
> checks are well intended but don't fit the way we use perl. I really
> don't want to end up in a position where intltool automatically means we
> have to add perlnative as a dependency and we've previously seen many
> problems related to that.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../intltool-0.40.6/remove-xml-check.patch         |   29 ++++++++++++++++++++
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |   11 +++++--
 2 files changed, 37 insertions(+), 3 deletions(-)
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
index e9871fc..c820f11 100644
--- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
@@ -1,14 +1,19 @@
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
+#
+# All of the intltool scripts have the correct paths to perl already
+# embedded into them and can find perl fine, so we add the remove xml-check
+# in the intltool.m4 via the remove-xml-check.patch
+NATIVEPATCHES = "file://noperlcheck.patch \
+                 file://remove-xml-check.patch"
+NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch" 
 
 SRC_URI[md5sum] = "69bc0353323112f42ad4f9cf351bc3e5"
 SRC_URI[sha256sum] = "4d1e5f8561f09c958e303d4faa885079a5e173a61d28437d0013ff5efc9e3b64"
-- 
1.7.6.4



