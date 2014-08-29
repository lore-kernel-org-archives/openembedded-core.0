Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2737E7070E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 17:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7THdFYu013200; Fri, 29 Aug 2014 18:39:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6UWYB5q5tbB6; Fri, 29 Aug 2014 18:39:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7THdABZ013194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 29 Aug 2014 18:39:11 +0100
Message-ID: <1409333952.29296.195.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 18:39:12 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: ronan <ronan.lemartret@open.eurogiciel.org>,
	Ed Bartosh <eduard.bartosh@intel.com>
Subject: [PATCH] package_rpm: Add optional improved directory handling
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
X-List-Received-Date: Fri, 29 Aug 2014 17:39:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Ronan Le Martret <ronan@fridu.net>

During spec generation, ideally directories should not be auto
packaged under the %file section of rpm packages but take ownership of
specific directories.

* packages only empty directories or explict directory.
   See:
       - http://www.rpm.org/max-rpm/s1-rpm-inside-files-list-directives.html
       - "The %dir Directive"

* This will prevent the overlapping of security permission.
   For example, in Tizen the directory /etc have smack label 'System::Shared'
   So Only one package should own and set the label of /etc to prevent
   the overwriting of the smack label.

Existing behaviour is maintained if DIRFILES is not set. If it is set,
the modified behaviour is used.

[RP: Modified to allow optional usage of DIRFILES]
Signed-off-by: Ronan Le Martret <ronan@fridu.net>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 0a32b3e..eecfcb2 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -185,7 +185,7 @@ python write_specfile () {
                 if not len(depends_dict[dep]):
                     array.append("%s: %s" % (tag, dep))
 
-    def walk_files(walkpath, target, conffiles):
+    def walk_files(walkpath, target, conffiles, dirfiles):
         # We can race against the ipk/deb backends which create CONTROL or DEBIAN directories
         # when packaging. We just ignore these files which are created in 
         # packages-split/ and not package/
@@ -196,11 +196,24 @@ python write_specfile () {
             path = rootpath.replace(walkpath, "")
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
-            for dir in dirs:
-                if dir == "CONTROL" or dir == "DEBIAN":
-                    continue
-                # All packages own the directories their files are in...
-                target.append('%dir "' + path + '/' + dir + '"')
+
+            # Directory handling can happen in two ways, either DIRFILES is not set at all
+            # in which case we fall back to the older behaviour of packages owning all their
+            # directories
+            if dirfiles is None:
+                for dir in dirs:
+                    if dir == "CONTROL" or dir == "DEBIAN":
+                        continue
+                    # All packages own the directories their files are in...
+                    target.append('%dir "' + path + '/' + dir + '"')
+            else:
+                # packages own only empty directories or explict directory.
+                # This will prevent the overlapping of security permission.
+                if path and not files and not dirs:
+                    target.append('%dir "' + path + '"')
+                elif path and path in dirfiles:
+                    target.append('%dir "' + path + '"')
+
             for file in files:
                 if file == "CONTROL" or file == "DEBIAN":
                     continue
@@ -311,6 +324,9 @@ python write_specfile () {
         bb.data.update_data(localdata)
 
         conffiles = (localdata.getVar('CONFFILES', True) or "").split()
+        dirfiles = localdata.getVar('DIRFILES', True)
+        if dirfiles is not None:
+            dirfiles = dirfiles.split()
 
         splitname    = strip_multilib(pkgname, d)
 
@@ -367,7 +383,7 @@ python write_specfile () {
             srcrpostrm     = splitrpostrm
 
             file_list = []
-            walk_files(root, file_list, conffiles)
+            walk_files(root, file_list, conffiles, dirfiles)
             if not file_list and localdata.getVar('ALLOW_EMPTY') != "1":
                 bb.note("Not creating empty RPM package for %s" % splitname)
             else:
@@ -474,7 +490,7 @@ python write_specfile () {
 
         # Now process files
         file_list = []
-        walk_files(root, file_list, conffiles)
+        walk_files(root, file_list, conffiles, dirfiles)
         if not file_list and localdata.getVar('ALLOW_EMPTY') != "1":
             bb.note("Not creating empty RPM package for %s" % splitname)
         else:



