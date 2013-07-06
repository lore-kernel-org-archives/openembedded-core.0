Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id D511D6AF5D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 10:03:59 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so1930669eak.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=prflAXObTyJvXMqS39sFveSxJzrtjpLNdAv2aEzifyU=;
	b=iJhlTI0pVR15JprwiPCdjYwgqjgzmkVM4Wp/LK5/wagvS1DGCKVs7yEG1IArtsky9U
	6TtozJ6lAPQaEi8G/YWTk+z6RYF15nQxc+XbBqvABvOVuQ+7h5m2WfXHcSsYf/Wqq6xD
	PvJU2sBu8lQwSZgU4kbKZoTGepxAMQN4r/+j9cJS41zp+OMH8hAhTvn1l7EN3uwQpDoU
	s+QfEPjwN/nrKjE+eyBlNoXTRvMQEnkmsCIXguvJIMt45cpWKi9I2hUKUe61H/6HlT+7
	us6jFOkAMOeJKzy9yun5C3EXhoAjvu5vOBdfA1fjwqCoyAwTreVVGUieFqS/IGj5IVTf
	o0lQ==
X-Received: by 10.14.149.141 with SMTP id x13mr16211612eej.77.1373105040004;
	Sat, 06 Jul 2013 03:04:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ci50sm22012650eeb.12.2013.07.06.03.03.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 03:03:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jul 2013 12:04:04 +0200
Message-Id: <1373105044-30014-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130704083054.GA3259@jama>
References: <20130704083054.GA3259@jama>
Subject: [PATCHv2] buildhistory: Record size of installed package not compressed archive
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
X-List-Received-Date: Sat, 06 Jul 2013 10:04:00 -0000

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
---
 meta/classes/buildhistory.bbclass | 11 ++++----
 scripts/oe-pkgdata-util           | 59 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 36e7fe1..1ebe68e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -317,6 +317,8 @@ buildhistory_get_installed() {
 	# Get list of installed packages
 	pkgcache="$1/installed-packages.tmp"
 	list_installed_packages file | sort > $pkgcache
+	pkgcachearch="$1/installed-packages-arch.tmp"
+	list_installed_packages arch | sort > $pkgcachearch
 
 	cat $pkgcache | awk '{ print $1 }' > $1/installed-package-names.txt
 	if [ -s $pkgcache ] ; then
@@ -338,18 +340,17 @@ buildhistory_get_installed() {
 
 	# Produce installed package sizes list
 	printf "" > $1/installed-package-sizes.tmp
-	cat $pkgcache | while read pkg pkgfile
+	cat $pkgcachearch | while read pkg arch
 	do
-		if [ -f $pkgfile ] ; then
-			pkgsize=`du -k $pkgfile | head -n1 | awk '{ print $1 }'`
-			echo $pkgsize $pkg >> $1/installed-package-sizes.tmp
-		fi
+		size=`oe-pkgdata-util read_values ${TMPDIR}/pkgdata ${TARGET_VENDOR}-${TARGET_OS} "PKGSIZE" ${pkg}_${arch}`
+		echo "$size $pkg" >> $1/installed-package-sizes.tmp
 	done
 	cat $1/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > $1/installed-package-sizes.txt
 	rm $1/installed-package-sizes.tmp
 
 	# We're now done with the cache, delete it
 	rm $pkgcache
+	rm $pkgcachearch
 
 	if [ "$2" != "sdk" ] ; then
 		# Produce some cut-down graphs (for readability)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 629b2d5..731e269 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -20,9 +20,12 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
 #
-# Currently only has one function - mapping of packages to their dev/dbg/doc/locale etc. 
-# counterparts ("glob" command). Could be extended in future to perform other useful querying
-# functions on the pkgdata though.
+# Currently only has two functions 
+# 1) glob - mapping of packages to their dev/dbg/doc/locale etc. counterparts.
+# 2) read_values - mapping of packagenames to their location in
+#    pkgdata and then returns value of selected variable (e.g. PKGSIZE)
+# Could be extended in future to perform other useful querying functions on the
+# pkgdata though.
 #
 
 import sys
@@ -32,7 +35,8 @@ import fnmatch
 import re
 
 def usage():
-    print("syntax: pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist> \"<globs>\"");
+    print("syntax: pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist> \"<globs>\"\n \
+                    read_values [-d] <pkgdatadir> <vendor-os> <variable-name> \"<package-name>_<package_architecture>\"");
 
 
 
@@ -151,7 +155,52 @@ def glob(args):
 
     print("\n".join(mappedpkgs))
 
+def read_values(args):
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
+        print "read_values('%s', '%s', '%s' '%s'" % (pkgdata_dir, target_suffix, var, packages)
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
+elif args[0] == "read_values":
+    read_values(args[1:])
 else:
     usage()
     sys.exit(1)
-- 
1.8.2.1


