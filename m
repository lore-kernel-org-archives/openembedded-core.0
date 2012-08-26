Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T5Wo8-0007MJ-Nh
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 08:58:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7Q6kgrl002998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 23:46:42 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 25 Aug 2012 23:46:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Aug 2012 14:52:01 +0800
Message-ID: <983ebee17c3d08205bb7605ede4f8c92ed0ec5eb.1345963712.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345963712.git.liezhi.yang@windriver.com>
References: <cover.1345963712.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 6/6] archiver.bbclass: fix the remove error
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
X-List-Received-Date: Sun, 26 Aug 2012 06:58:53 -0000
Content-Type: text/plain

* The "tar-package" is used for saving the "Source" list for rpmbuild,
  there is no such a file when "ARCHIVER_MODE[type] ?= srpm", and there
  would be errors, it hadn't happen before was becuase that the remove
  function didn't work. Let the "rpmbuild --rmsource" to remove the
  Sources, and the remove function will just remove the tar-package file.

* Remove several unwanted "try ... exception" sentences, let the error
  raise rather than ignore them when the error happens.

* Remove several un-needed code.

[YOCTO #2619]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass    | 51 ++++++++++++++++------------------------
 meta/classes/package_rpm.bbclass | 25 ++++++--------------
 2 files changed, 27 insertions(+), 49 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 19c5567..3146d02 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -359,26 +359,22 @@ def store_package(d, package_name):
     """
     store tarbablls name to file "tar-package"
     """
-    try:
-        f = open(os.path.join(d.getVar('WORKDIR', True), 'tar-package'), 'a')
-        f.write(package_name + ' ')
-        f.close()
-    except IOError:
-        pass
+    f = open(os.path.join(d.getVar('WORKDIR', True), 'tar-package'), 'a')
+    f.write(package_name + ' ')
+    f.close()
 
 def get_package(d):
     """
     get tarballs name from "tar-package"
     """
     work_dir = (d.getVar('WORKDIR', True))
-    tarpackage = os.path.join(work_dir, 'tar-package')
-    try:
-        f = open(tarpackage, 'r')
-        line = list(set(f.readline().replace('\n', '').split()))
-    except UnboundLocalError, IOError:
-        pass
-    f.close()
-    return line
+    tarlist = os.path.join(work_dir, 'tar-package')
+    if os.path.exists(tarlist):
+        f = open(tarlist, 'r')
+        line = f.readline().rstrip('\n').split()
+        f.close()
+        return line
+    return []
 
 
 def archive_sources_patches(d, stage_name):
@@ -407,9 +403,9 @@ def archive_sources_patches(d, stage_name):
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         move_tarball_deploy(d, [source_tar_name, patch_tar_name])
     else:
-        tarpackage = os.path.join(d.getVar('WORKDIR', True), 'tar-package')
-        if os.path.exists(tarpackage):
-            os.remove(tarpackage)
+        tarlist = os.path.join(d.getVar('WORKDIR', True), 'tar-package')
+        if os.path.exists(tarlist):
+            os.remove(tarlist)
         for package in os.path.basename(source_tar_name), patch_tar_name:
             if package:
                 store_package(d, str(package) + ' ')
@@ -558,18 +554,11 @@ python do_archive_linux_yocto(){
 do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
 
 # remove tarball for sources, patches and logs after creating srpm.
-python do_remove_tarball(){
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-        work_dir = d.getVar('WORKDIR', True)
-        try:
-            for file in os.listdir(os.getcwd()):
-                if file in get_package(d):
-                    os.remove(file)
-            os.remove(os.path.join(work_dir, 'tar-package'))
-        except (TypeError, OSError):
-            pass
+python do_remove_tarlist(){
+    work_dir = d.getVar('WORKDIR', True)
+    tarlist = os.path.join(work_dir, 'tar-package')
+    if os.path.exists(tarlist):
+        os.remove(tarlist)
 }
-do_remove_tarball[deptask] = "do_archive_scripts_logs"
-do_package_write_rpm[postfuncs] += "do_remove_tarball "
-export get_licenses
-export get_package
+do_remove_tarlist[deptask] = "do_archive_scripts_logs"
+do_package_write_rpm[postfuncs] += "do_remove_tarlist "
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index d44ab4c..2c4c89a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -575,16 +575,11 @@ python write_specfile () {
             spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
             spec_files_bottom.append('')
 
-    # get the name of tarball for sources, patches and logs
-    def get_tarballs(d):
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-            return get_package(d)
-    
     # append the name of tarball to key word 'SOURCE' in xxx.spec.
-    def tail_source(d,source_list=[],patch_list=None):
+    def tail_source(d):
         if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
+            source_list = get_package(d)
             source_number = 0
-            patch_number = 0
             workdir = d.getVar('WORKDIR', True)
             for source in source_list:
                 # The rpmbuild doesn't need the root permission, but it needs
@@ -593,11 +588,6 @@ python write_specfile () {
                 os.chown("%s/%s" % (workdir, source), 0, 0)
                 spec_preamble_top.append('Source' + str(source_number) + ': %s' % source)
                 source_number += 1
-            if patch_list:
-                for patch in patch_list:
-                    os.chown("%s/%s" % (workdir, patch), 0, 0)
-                    print_deps(patch, "Patch" + str(patch_number), spec_preamble_top, d)
-                    patch_number += 1
     # We need a simple way to remove the MLPREFIX from the package name,
     # and dependency information...
     def strip_multilib(name, d):
@@ -915,8 +905,7 @@ python write_specfile () {
     spec_preamble_top.append('Group: %s' % srcsection)
     spec_preamble_top.append('Packager: %s' % srcmaintainer)
     spec_preamble_top.append('URL: %s' % srchomepage)
-    source_list = get_tarballs(d)
-    tail_source(d,source_list,None)
+    tail_source(d)
 
     # Replaces == Obsoletes && Provides
     if srcrreplaces and srcrreplaces.strip() != "":
@@ -1151,13 +1140,13 @@ python do_package_rpm () {
         cmd = cmd + " --define '_sourcedir " + workdir + "'"
         cmdsrpm = cmd + " --define '_srcrpmdir " + creat_srpm_dir(d) + "'"
         cmdsrpm = cmdsrpm + " -bs " + outspecfile
-    cmd = cmd + " -bb " + outspecfile
-
-    # Build the source rpm package !
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
+        # Build the .src.rpm
         d.setVar('SBUILDSPEC', cmdsrpm + "\n")
         d.setVarFlag('SBUILDSPEC', 'func', '1')
         bb.build.exec_func('SBUILDSPEC', d)
+        # Remove the source (SOURCE0, SOURCE1 ...)
+        cmd = cmd + " --rmsource "
+    cmd = cmd + " -bb " + outspecfile
 
     # Build the rpm package!
     d.setVar('BUILDSPEC', cmd + "\n")
-- 
1.7.11.2



