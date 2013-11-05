Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 325ED6CEF1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 22:08:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5M8ChQ005494 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 22:08:12 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xJr9HV2Qi-9e
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 22:08:12 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5M88ns005484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 22:08:10 GMT
Message-ID: <1383689284.6271.179.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Nov 2013 22:08:04 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package_rpm: Remove need for locking
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
X-List-Received-Date: Tue, 05 Nov 2013 22:08:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently if multiple package tasks are running against a recipe, package_rpm
is restricted to the slowest speed of them due to the locking. This patch
explicitly ignores the opkg/debian artefacts and hence allows a speedup.

It also removes an issue were a Ctrl+C interrupting a deb.ipk packaging task
would end up with CONTROL/DEBIAN files in the spec file resulting in a build
failure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 36bad09..31265d9 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -660,9 +660,16 @@ python write_specfile () {
                     array.append("%s: %s" % (tag, dep))
 
     def walk_files(walkpath, target, conffiles):
+        # We can race against the ipk/deb backends which create CONTROL or DEBIAN directories
+        # when packaging. We just ignore these files which are created in 
+        # packages-split/ and not package/
         for rootpath, dirs, files in os.walk(walkpath):
             path = rootpath.replace(walkpath, "")
+            if path.endswith("DEBIAN") or path.endswith("CONTROL"):
+                continue
             for dir in dirs:
+                if dir == "CONTROL" or dir == "DEBIAN":
+                    continue
                 # All packages own the directories their files are in...
                 target.append('%dir "' + path + '/' + dir + '"')
             for file in files:
@@ -760,8 +767,6 @@ python write_specfile () {
 
         root = "%s/%s" % (pkgdest, pkg)
 
-        lf = bb.utils.lockfile(root + ".lock")
-
         localdata.setVar('ROOT', '')
         localdata.setVar('ROOT_%s' % pkg, root)
         pkgname = localdata.getVar('PKG_%s' % pkg, True)
@@ -842,8 +847,6 @@ python write_specfile () {
                 else:
                     bb.note("Creating EMPTY RPM Package for %s" % splitname)
                 spec_files_top.append('')
-
-            bb.utils.unlockfile(lf)
             continue
 
         # Process subpackage data
@@ -949,7 +952,6 @@ python write_specfile () {
             spec_files_bottom.append('')
 
         del localdata
-        bb.utils.unlockfile(lf)
     
     add_prep(d,spec_files_bottom)
     spec_preamble_top.append('Summary: %s' % srcsummary)



