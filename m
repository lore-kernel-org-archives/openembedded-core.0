Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1Q9wUo-0006DJ-Sd
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Apr 2011 11:36:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Apr 2011 02:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,203,1301900400"; d="scan'208";a="418367805"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by azsmga001.ch.intel.com with ESMTP; 13 Apr 2011 02:34:06 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1Q9wLM-0004mu-Vm; Wed, 13 Apr 2011 17:26:36 +0800
Message-Id: <b94c6ce5656dd4bd312feda0eaf2423cae505ccd.1302686656.git.qing.he@intel.com>
In-Reply-To: <cover.1302686656.git.qing.he@intel.com>
References: <cover.1302686656.git.qing.he@intel.com>
Old-Date: Wed, 13 Apr 2011 17:22:49 +0800
Date: Wed, 13 Apr 2011 17:26:36 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 2/2] quilt: fix test for target build
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
X-List-Received-Date: Wed, 13 Apr 2011 09:36:23 -0000

From: Qing He <qing.he@intel.com>

fixes [YOCTO #969]

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../quilt/quilt/gnu_patch_test_fix_target.patch    |   66 ++++++++++++++++++++
 meta/recipes-devtools/quilt/quilt_0.48.bb          |    6 +-
 2 files changed, 70 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch

diff --git a/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
new file mode 100644
index 0000000..784fe76
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
@@ -0,0 +1,66 @@
+The test of patch and diff should not be run for cross build,
+rather, assume them as gnu version is rather safe. This is a
+workaround to remove it altogether.
+
+Signed-off-by: Qing He <qing.he@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 026a36c..7b45ca4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -245,55 +245,6 @@ fi
+ QUILT_COMPAT_PROG_PATH(DIFF, diff)
+ QUILT_COMPAT_PROG_PATH(PATCH, patch)
+ 
+-# Sun diff and others will not work because GNU patch options are used.
+-AC_MSG_CHECKING([the version of $DIFF])
+-if $DIFF --version 2>/dev/null | grep GNU >/dev/null; then
+-  set -- `$DIFF --version 2>/dev/null | $AWK '{ print $NF; exit }'`
+-  diff_version=$1
+-  AC_MSG_RESULT($diff_version)
+-  saved_IFS=$IFS; IFS='.'
+-  set -- $diff_version
+-  IFS=$saved_IFS
+-  set -- `echo $1 | $TR -cd 0-9` `echo $2 | $TR -cd 0-9`
+-  if test 0$1 -lt 2 || test 0$1 -eq 2 -a 0$2 -lt 7 ; then
+-    diff_version=
+-  fi
+-else
+-  AC_MSG_RESULT(no GNU diff)
+-fi
+-if test -z "$diff_version" ; then
+-  AC_MSG_ERROR([
+-$PACKAGE_NAME requires at least version 2.7 of GNU diffutils. You can
+-download a current version of patch from ftp.gnu.org, or if you already
+-have GNU diff then you can supply its path with the '--with-diff=' option.
+-])
+-fi
+-
+-
+-# Sun's patch, and others, do not work because GNU patch options are used.
+-AC_MSG_CHECKING([the version of $PATCH])
+-if $PATCH --version 2> /dev/null | grep GNU >/dev/null; then
+-  set -- `$PATCH --version 2> /dev/null`
+-  patch_version=$2
+-  AC_MSG_RESULT($patch_version)
+-  saved_IFS=$IFS; IFS='.'
+-  set -- $patch_version
+-  IFS=$saved_IFS
+-  set -- `echo $1 | $TR -cd 0-9` `echo $2 | $TR -cd 0-9`
+-  if test 0$1 -lt 2 || test 0$1 -eq 2 -a 0$2 -lt 4 ; then
+-    patch_version=
+-  fi
+-else
+-  AC_MSG_RESULT(no GNU patch)
+-fi
+-if test -z "$patch_version" ; then
+-  AC_MSG_ERROR([
+-$PACKAGE_NAME requires at least version 2.4 of GNU patch. You can download a
+-current version of patch from ftp.gnu.org, or if you already have GNU patch
+-then you can supply its path with the '--with-patch=' option.
+-])
+-fi
+-
+ QUILT_COMPAT_PROG_PATH(FIND, find)
+ 
+ AC_MSG_CHECKING([whether $FIND -path works])
diff --git a/meta/recipes-devtools/quilt/quilt_0.48.bb b/meta/recipes-devtools/quilt/quilt_0.48.bb
index 20a708d..124e2cd 100644
--- a/meta/recipes-devtools/quilt/quilt_0.48.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.48.bb
@@ -2,8 +2,10 @@ require quilt.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
-PR = "r0"
-SRC_URI += "file://aclocal.patch"
+PR = "r1"
+SRC_URI += "file://aclocal.patch \
+            file://gnu_patch_test_fix_target.patch \
+           "
 
 SRC_URI[md5sum] = "f77adda60039ffa753f3c584a286f12b"
 SRC_URI[sha256sum] = "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"
-- 
1.7.0



