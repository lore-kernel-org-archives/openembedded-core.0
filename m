Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 16D557422C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:42:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 08 Sep 2015 06:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,490,1437462000"; d="scan'208";a="800637745"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 06:42:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 14:41:51 +0100
Message-Id: <e2372e183b9a2f8c2e53d0a57f5a1211ef5a5331.1441719081.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441719081.git.paul.eggleton@linux.intel.com>
References: <cover.1441719081.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441719081.git.paul.eggleton@linux.intel.com>
References: <cover.1441719081.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 2/3] build-compare: add support for examining deb and ipk packages
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
X-List-Received-Date: Tue, 08 Sep 2015 13:42:08 -0000

This is just rudimentary support at the moment as we'd potentially want
to compare the control files a bit more specifically than this does, but
it's a start.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../build-compare/build-compare_git.bb             |  8 ++-
 ...001-Add-support-for-deb-and-ipk-packaging.patch | 64 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 418aee0..7ac3784 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -5,9 +5,11 @@ HOMEPAGE = "https://github.com/openSUSE/build-compare"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/openSUSE/build-compare.git"
-SRC_URI += "file://Rename-rpm-check.sh-to-pkg-diff.sh.patch;striplevel=1"
-SRC_URI += "file://Ignore-DWARF-sections.patch;striplevel=1"
+SRC_URI = "git://github.com/openSUSE/build-compare.git \
+           file://Rename-rpm-check.sh-to-pkg-diff.sh.patch;striplevel=1 \
+           file://Ignore-DWARF-sections.patch;striplevel=1 \
+           file://0001-Add-support-for-deb-and-ipk-packaging.patch \
+           "
 PATCHTOOL = "git"
 
 SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
diff --git a/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch b/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch
new file mode 100644
index 0000000..5c15218
--- /dev/null
+++ b/meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch
@@ -0,0 +1,64 @@
+From 02dbc7e3478e409d6f5e3e1c53daddf8838be999 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 1 Sep 2015 12:04:33 +0100
+Subject: [PATCH] Add support for deb and ipk packaging
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ functions.sh | 15 +++++++++++++++
+ pkg-diff.sh  |  6 ++++++
+ 2 files changed, 21 insertions(+)
+
+diff --git a/functions.sh b/functions.sh
+index 06079df..85c9003 100644
+--- a/functions.sh
++++ b/functions.sh
+@@ -85,6 +85,13 @@ function unpackage()
+             CPIO_OPTS="--extract --unconditional --preserve-modification-time --make-directories --quiet"
+             rpm2cpio $file | cpio ${CPIO_OPTS}
+             ;;
++        *.ipk|*.deb)
++            ar x $file
++            tar xf control.tar.gz
++            rm control.tar.gz
++            tar xf data.tar.gz
++            rm data.tar.gz
++            ;;
+     esac
+     popd 1>/dev/null
+ }
+@@ -255,4 +262,12 @@ function cmp_spec ()
+     rm $file1 $file2
+     return $RES
+ }
++
++function adjust_controlfile () {
++    cat $1/control | sed '/^Version: /d' > $1/control.fixed
++    mv $1/control.fixed $1/control
++    cat $2/control | sed '/^Version: /d' > $2/control.fixed
++    mv $2/control.fixed $2/control
++}
++
+ # vim: tw=666 ts=2 et
+diff --git a/pkg-diff.sh b/pkg-diff.sh
+index 0f1fa76..3cf10aa 100644
+--- a/pkg-diff.sh
++++ b/pkg-diff.sh
+@@ -138,6 +138,12 @@ echo "Extracting packages"
+ unpackage $oldpkg $dir/old
+ unpackage $newpkg $dir/new
+ 
++case $oldpkg in
++  *.deb|*.ipk)
++     adjust_controlfile $dir/old $dir/new
++  ;;
++esac
++
+ # files is set in cmp_spec for rpms, so if RES is empty we should assume
+ # it wasn't an rpm and pick all files for comparison.
+ if [ -z $RES ]; then
+-- 
+2.1.0
+
-- 
2.1.0


