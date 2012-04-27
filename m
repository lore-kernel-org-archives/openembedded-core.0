Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNmxX-00023z-La for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 17:19:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RFA9rR017853;
	Fri, 27 Apr 2012 16:10:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17785-01; Fri, 27 Apr 2012 16:10:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RF9xSs017834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Apr 2012 16:10:01 +0100
Message-ID: <1335539400.20130.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2012 16:10:00 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package_rpm: Only rebuild the indexes if the packages have changed
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
X-List-Received-Date: Fri, 27 Apr 2012 15:19:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This change farms the solvedb creation out to a separate script which
handles creation of the index, only if mtime of any of the packages
has changed.

For a core-image-minimal set of rpm's this saves ~20s of a 45s rootfs
build. For core-image-sato it saves 1 minute of a 5 minute rootfs build.
The more packages in the system, the bigger the saving will be.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2476c16..cf66a51 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -40,12 +40,13 @@ package_update_index_rpm_common () {
 	rpmconf_base="$1"
 	shift
 
+        createdirs=""
 	for archvar in "$@"; do
 		eval archs=\${${archvar}}
 		packagedirs=""
 		for arch in $archs; do
 			packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
-			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb
+			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb.done
 		done
 
 		cat /dev/null > ${rpmconf_base}-${archvar}.conf
@@ -53,22 +54,11 @@ package_update_index_rpm_common () {
 			if [ -e $pkgdir/ ]; then
 				echo "Generating solve db for $pkgdir..."
 				echo $pkgdir/solvedb >> ${rpmconf_base}-${archvar}.conf
-				if [ -d $pkgdir/solvedb ]; then
-					# We've already processed this and it's a duplicate
-					continue
-				fi
-				mkdir -p $pkgdir/solvedb
-				echo "# Dynamically generated solve manifest" >> $pkgdir/solvedb/manifest
-				find $pkgdir -maxdepth 1 -type f >> $pkgdir/solvedb/manifest
-				${RPM} -i --replacepkgs --replacefiles --oldpackage \
-					-D "_dbpath $pkgdir/solvedb" --justdb \
-					--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
-					--ignoresize --nosignature --nodigest \
-					-D "__dbi_txn create nofsync" \
-					$pkgdir/solvedb/manifest
+                                createdirs="$createdirs $pkgdir"
 			fi
 		done
 	done
+	rpm-createsolvedb.py "${RPM}" $createdirs
 }
 
 #
diff --git a/scripts/rpm-createsolvedb.py b/scripts/rpm-createsolvedb.py
new file mode 100755
index 0000000..0d5f219
--- a/dev/null
+++ b/scripts/rpm-createsolvedb.py
@@ -0,0 +1,63 @@
+#!/usr/bin/env python
+#
+# This script generates a solution database for a directory containing rpm packages
+# but tries to be efficient about this, only doing so when the packages have changed
+# in some way.
+#
+# It is assumed something already went through and removed all the solvedb.done stamp files
+# in advance.
+#
+# First argument - the rpm binary to use
+# Subsequent arguments - paths to process solution databases for
+#
+
+import sys, os
+import hashlib
+import stat
+
+if len(sys.argv) < 1:
+    print("Error, rpm command not specified")
+    sys.exit(1)
+
+if len(sys.argv) < 2:
+    print("Error, no paths specified")
+    sys.exit(1)
+
+paths = sys.argv[2:]
+
+for path in paths:
+    if os.path.exists(path + "/solvedb.done"):
+        continue
+    data = ""
+    manifest = []
+    for root, dirs, files in os.walk(path):
+        for file in files:
+            f = os.path.join(root, file)
+            if f.startswith(path + "/" + "solvedb"):
+                continue
+            data = data + str(os.stat(f)[stat.ST_MTIME])
+            manifest.append(f)
+    checksum = hashlib.md5(data).hexdigest()
+
+    if os.path.exists(path + "/solvedb.checksum") and open(path + "/solvedb.checksum", "r").read() == checksum:
+        open(path + "/solvedb.done", "w")
+        continue
+
+    if os.path.exists(path + "/solvedb"):
+        os.system("rm -rf %s" % (path + "/solvedb"))
+    os.mkdir(path + "/solvedb")
+    m = open(path + "/solvedb/manifest", "w")
+    m.write("# Dynamically generated solve manifest\n")
+    for f in manifest:
+        m.write(f + "\n")
+    m.close()
+
+    cmd = sys.argv[1] + ' -i --replacepkgs --replacefiles --oldpackage -D "_dbpath ' + path + '/solvedb" --justdb \
+			--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
+			--ignoresize --nosignature --nodigest -D "__dbi_txn create nofsync" \
+			' + path + '/solvedb/manifest'
+    os.system(cmd)
+
+    open(path + "/solvedb.checksum", "w").write(checksum)
+    open(path + "/solvedb.done", "w")
+




