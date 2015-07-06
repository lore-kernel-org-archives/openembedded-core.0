Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E8D456AD0D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 17:19:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jul 2015 10:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,415,1432623600"; d="scan'208";a="601028914"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga003.jf.intel.com with ESMTP; 06 Jul 2015 10:19:28 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 10:17:19 +0000
Message-Id: <41e68bf09d809269524babaae2911a7c41e38351.1436177709.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1436177709.git.alejandro.hernandez@linux.intel.com>
References: <cover.1436177709.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] opkg-build: Ignore tar error due to hardlinks issue when creating ipk files
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
X-List-Received-Date: Mon, 06 Jul 2015 17:19:29 -0000

If a the number of hard links decreases or increases while creating
the tar files used for an ipk package, tar fails with error code 1,
if this is the case we ignore the error and continue to create the ipk file

[YOCTO #7933]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../opkg-utils/opkg-utils/tar_ignore_error.patch   | 47 ++++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  4 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
new file mode 100644
index 0000000..4bcae4954
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
@@ -0,0 +1,47 @@
+If a the number of hard links decreases or increases while creating
+the tar files used for an ipk package, tar fails with error code 1:
+
+| DEBUG: Executing python function do_package_ipk
+| tar: ./usr/src/debug/gperf/3.0.4-r0/gperf-3.0.4/src/main.cc: file changed as we read it
+NOTE: recipe gperf-3.0.4-r0: task do_package_write_ipk: Failed
+ERROR: Task 6539 (recipes-extended/gperf/gperf_3.0.4.bb, do_package_write_ipk) failed with exit code '1'
+
+
+We detect if the error code produced by tar is 1 and in this case ignore it.
+
+This a similar behavior to the one on dpkg:
+http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=40731942515ec8d80c727ad561174986d4f05818
+
+Upsteam-Status: Inappropriate
+
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+
+
+Index: git/opkg-build
+===================================================================
+--- git.orig/opkg-build
++++ git/opkg-build
+@@ -250,8 +250,21 @@ tmp_dir=$dest_dir/IPKG_BUILD.$$
+ mkdir $tmp_dir
+ 
+ echo $CONTROL > $tmp_dir/tarX
+-( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -cz $tarformat -f $tmp_dir/data.tar.gz . )
+-( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/control.tar.gz . )
++
++
++# Ignore error code 1, caused by modifying the number of hard links while creating the tar file
++rc=0
++( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -cz $tarformat -f $tmp_dir/data.tar.gz . ) || rc=$?
++if [[ $rc -ne 1 ]] && [[ $rc -ne 0 ]] ;then
++        exit $rc 
++fi
++
++rc=0
++( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/control.tar.gz . ) || rc=$?
++if [[ $rc -ne 1 ]] && [[ $rc -ne 0 ]] ;then
++        exit $rc
++fi
++
+ rm $tmp_dir/tarX
+ 
+ echo "2.0" > $tmp_dir/debian-binary
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 2800a5d..74b974d 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -10,7 +10,9 @@ PROVIDES += "virtual/update-alternatives"
 SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
 PV = "0.1.8+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/opkg-utils"
+SRC_URI = "git://git.yoctoproject.org/opkg-utils " 
+
+SRC_URI_append_class-native = "file://tar_ignore_error.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4.5


