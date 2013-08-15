Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EDCD66009A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 17:05:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2013 10:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,886,1367996400"; d="scan'208";a="381478963"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2013 10:04:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 18:04:35 +0100
Message-Id: <53a9d0a64bc42576fba25675a0b8a0f43ba4a8d5.1376585082.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] classes/buildhistory: record size of installed package not compressed archive
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
X-List-Received-Date: Thu, 15 Aug 2013 17:05:26 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* usually it's more important to know how much space will each
  package take on target device then size of compressed package
* example for libewebkit0 with 4 different architectures, interesting
  that om_gta02 .ipk is bigger but it's smaller when installed

  before:
  MACHINE     DEFAULTTUNE       SIZE (.ipk file)
  om_gta04    cortexa8t-neon    15996 KiB libewebkit0
  qemux86_64  x86-64            16992 KiB libewebkit0
  spitz       xscale            16148 KiB libewebkit0
  om_gta02    arm920t           16260 KiB libewebkit0

  after:
  MACHINE     DEFAULTTUNE       SIZE (installed)
  om_gta04    cortexa8t-neon    60544 KiB libewebkit0
  qemux86_64  x86-64            63720 KiB libewebkit0
  spitz       xscale            60588 KiB libewebkit0
  om_gta02    arm920t           56268 KiB libewebkit0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass     | 12 ++++---
 meta/classes/package_rpm.bbclass      |  2 ++
 meta/classes/populate_sdk_deb.bbclass |  6 ++--
 meta/classes/populate_sdk_ipk.bbclass |  6 ++--
 meta/classes/populate_sdk_rpm.bbclass |  2 +-
 scripts/oe-pkgdata-util               | 59 ++++++++++++++++++++++++++++++++---
 scripts/opkg-query-helper.py          |  2 +-
 7 files changed, 72 insertions(+), 17 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 1c49831..b2e5cc5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -337,12 +337,14 @@ buildhistory_get_installed() {
 
 	# Produce installed package sizes list
 	printf "" > $1/installed-package-sizes.tmp
-	cat $pkgcache | while read pkg pkgfile
+	cat $pkgcache | while read pkg pkgfile pkgarch
 	do
-		if [ -f $pkgfile ] ; then
-			pkgsize=`du -k $pkgfile | head -n1 | awk '{ print $1 }'`
-			echo $pkgsize $pkg >> $1/installed-package-sizes.tmp
-		fi
+		for vendor in ${TARGET_VENDOR} ${MULTILIB_VENDORS} ; do
+			size=`oe-pkgdata-util read-value ${TMPDIR}/pkgdata $vendor-${TARGET_OS} "PKGSIZE" ${pkg}_${pkgarch}`
+			if [ "$size" != "" ] ; then
+				echo "$size $pkg" >> $1/installed-package-sizes.tmp
+			fi
+		done
 	done
 	cat $1/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > $1/installed-package-sizes.txt
 	rm $1/installed-package-sizes.tmp
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 324d83f..53377a4 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -127,6 +127,8 @@ translate_smart_to_oe() {
 		#echo "$pkg -> $new_pkg" >&2
 		if [ "$arg1" = "arch" ]; then
 			echo $new_pkg $new_arch $other
+		elif [ "$arg1" = "file" ]; then
+			echo $new_pkg $other $new_arch
 		else
 			echo $new_pkg $other
 		fi
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index 3e123ac..ec116ab 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -75,13 +75,13 @@ list_installed_packages() {
 		# Here we want the PACKAGE_ARCH not the deb architecture
 		${DPKG_QUERY_COMMAND} -W -f='${Package} ${PackageArch}\n'
 	elif [ "$1" = "file" ] ; then
-		${DPKG_QUERY_COMMAND} -W -f='${Package} ${Package}_${Version}_${Architecture}.deb\n' | while read pkg pkgfile
+		${DPKG_QUERY_COMMAND} -W -f='${Package} ${Package}_${Version}_${Architecture}.deb ${PackageArch}\n' | while read pkg pkgfile pkgarch
 		do
 			fullpath=`find ${DEPLOY_DIR_DEB} -name "$pkgfile" || true`
 			if [ "$fullpath" = "" ] ; then
-				echo "$pkg $pkgfile"
+				echo "$pkg $pkgfile $pkgarch"
 			else
-				echo "$pkg $fullpath"
+				echo "$pkg $fullpath $pkgarch"
 			fi
 		done
 	else
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index 4e14d9a..04c71af 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -61,13 +61,13 @@ list_installed_packages() {
 	if [ "$1" = "arch" ] ; then
 		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -a
 	elif [ "$1" = "file" ] ; then
-		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -f | while read pkg pkgfile
+		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -f | while read pkg pkgfile pkgarch
 		do
 			fullpath=`find ${DEPLOY_DIR_IPK} -name "$pkgfile" || true`
 			if [ "$fullpath" = "" ] ; then
-				echo "$pkg $pkgfile"
+				echo "$pkg $pkgfile $pkgarch"
 			else
-				echo "$pkg $fullpath"
+				echo "$pkg $fullpath $pkgarch"
 			fi
 		done
 	else
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 219cd18..dd5f39a 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -161,7 +161,7 @@ list_installed_packages() {
 	if [ "$1" = "arch" ]; then
 		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe arch
 	elif [ "$1" = "file" ]; then
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN}\n]" | translate_smart_to_oe
+		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN}\n]" | translate_smart_to_oe file
 	else
 		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe
 	fi
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 629b2d5..c63f87d 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -20,9 +20,12 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
 #
-# Currently only has one function - mapping of packages to their dev/dbg/doc/locale etc. 
-# counterparts ("glob" command). Could be extended in future to perform other useful querying
-# functions on the pkgdata though.
+# Currently only has two functions:
+# 1) glob - mapping of packages to their dev/dbg/doc/locale etc. counterparts.
+# 2) read-value - mapping of packagenames to their location in
+#    pkgdata and then returns value of selected variable (e.g. PKGSIZE)
+# Could be extended in future to perform other useful querying functions on the
+# pkgdata though.
 #
 
 import sys
@@ -32,7 +35,8 @@ import fnmatch
 import re
 
 def usage():
-    print("syntax: pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist> \"<globs>\"");
+    print("syntax: oe-pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist> \"<globs>\"\n \
+                    read-value [-d] <pkgdatadir> <vendor-os> <value-name> \"<package-name>_<package_architecture>\"");
 
 
 
@@ -151,7 +155,52 @@ def glob(args):
 
     print("\n".join(mappedpkgs))
 
+def read_value(args):
+    if len(args) < 4:
+        usage()
+        sys.exit(1)
+
+    pkgdata_dir = args[0]
+    target_suffix = args[1]
+    var = args[2]
+    packages = args[3].split()
 
+    if target_suffix.startswith("-"):
+        target_suffix = target_suffix[1:]
+
+    def readvar(pkgdata_file, var):
+        val = ""
+        with open(pkgdata_file, 'r') as f:
+            for line in f:
+                if line.startswith(var + ":"):
+                    val = line.split(': ')[1].rstrip()
+        return val
+
+    if debug:
+        print "read-value('%s', '%s', '%s' '%s'" % (pkgdata_dir, target_suffix, var, packages)
+    for package in packages:
+        pkg_split = package.split('_')
+        pkg_name = pkg_split[0]
+        pkg_arch = '_'.join(pkg_split[1:])
+        if debug:
+            print "package: name: '%s', arch: '%s'" % (pkg_name, pkg_arch)
+        multimach_target_sys = "%s-%s" % (pkg_arch, target_suffix)
+        revlink = os.path.join(pkgdata_dir, multimach_target_sys, "runtime-reverse", pkg_name)
+        if debug:
+            print(revlink)
+        if not os.path.exists(revlink):
+            # [YOCTO #4227] try to drop -gnueabi from TARGET_OS
+            multimach_target_sys = '-'.join(multimach_target_sys.split('-')[:-1])
+            revlink = os.path.join(pkgdata_dir, multimach_target_sys, "runtime-reverse", pkg_name)
+            if debug:
+                print(revlink)
+        if os.path.exists(revlink):
+            mappedpkg = os.path.basename(os.readlink(revlink))
+            qvar = var
+            if qvar == "PKGSIZE":
+                # append packagename
+                qvar = "%s_%s" % (var, mappedpkg)
+            print(readvar(revlink, qvar))
 
 # Too lazy to use getopt
 debug = False
@@ -173,6 +222,8 @@ if len(args) < 1:
 
 if args[0] == "glob":
     glob(args[1:])
+elif args[0] == "read-value":
+    read_value(args[1:])
 else:
     usage()
     sys.exit(1)
diff --git a/scripts/opkg-query-helper.py b/scripts/opkg-query-helper.py
index b52284b..fa6c44f 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -59,7 +59,7 @@ for line in fileinput.input(args):
                     ver = line.split(": ")[1]
                 elif line.startswith("Architecture:"):
                     arch = line.split(": ")[1]
-                    print("%s %s_%s_%s.ipk" % (pkg,pkg,ver,arch))
+                    print("%s %s_%s_%s.ipk %s" % (pkg,pkg,ver,arch,arch))
             else:
                 if line.startswith("Depends:"):
                     depval = line.split(": ")[1]
-- 
1.8.1.2


