Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fJ-0002bs-KT
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:08 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401L9u020544; Mon, 4 Feb 2013 00:01:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ACt9DVzm3nXG; Mon,  4 Feb 2013 00:01:21 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401CYw020460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:14 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pl-0000YB-6o; Sun, 03 Feb 2013 23:56:01 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:46 +0000
Message-Id: <9c587541c095c0c150b3b858ae2d27604ef0459a.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 16/22] package.bbclass: Various minor performance tweaks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

* Call getVar outside the loop
* Drop unneeded PATH export (bitbake does this already)
* Drop unused variable
* Simplify if statement nesting
* Simplify variable expandion to a getVar call (expand would just call getVar)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 22ca546..6d2dd89 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -557,11 +557,12 @@ python fixup_perms () {
     # paths are resolved via BBPATH
     def get_fs_perms_list(d):
         str = ""
+        bbpath = d.getVar('BBPATH', True)
         fs_perms_tables = d.getVar('FILESYSTEM_PERMS_TABLES', True)
         if not fs_perms_tables:
             fs_perms_tables = 'files/fs-perms.txt'
         for conf_file in fs_perms_tables.split():
-            str += " %s" % bb.which(d.getVar('BBPATH', True), conf_file)
+            str += " %s" % bb.utils.which(bbpath, conf_file)
         return str
 
 
@@ -889,11 +890,10 @@ python populate_packages () {
     for pkg in packages.split():
         if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
             bb.warn("%s has an incompatible license. Excluding from packaging." % pkg)
+        elif pkg in package_list:
+            bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
         else:
-            if pkg in package_list:
-                bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
-            else:
-                package_list.append(pkg)
+            package_list.append(pkg)
     d.setVar('PACKAGES', ' '.join(package_list))
     pkgdest = d.getVar('PKGDEST', True)
 
@@ -908,7 +908,6 @@ python populate_packages () {
             bb.warn("FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg)
             filesvar.replace("//", "/")
         files = filesvar.split()
-        file_links = {}
         for file in files:
             if os.path.isabs(file):
                 file = '.' + file
@@ -1192,7 +1191,7 @@ python package_do_filedeps() {
 
     pkgdest = d.getVar('PKGDEST', True)
     packages = d.getVar('PACKAGES', True)
-    rpmdeps = d.expand("${RPMDEPS}")
+    rpmdeps = d.getVar('RPMDEPS', True)
 
     def chunks(files, n):
         return [files[i:i+n] for i in range(0, len(files), n)]
@@ -1282,7 +1281,6 @@ python package_do_shlibs() {
     def linux_so(file):
         needs_ldconfig = False
         cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) + " 2>/dev/null"
-        cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
         fd = os.popen(cmd)
         lines = fd.readlines()
         fd.close()
-- 
1.7.10.4



