Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T5Wo5-0007Lb-V4
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 08:58:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7Q6kd3V025982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 23:46:39 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 25 Aug 2012 23:46:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Aug 2012 14:51:59 +0800
Message-ID: <b5bd6ea0e516fa1d777018fea33d10deb7d24704.1345963712.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345963712.git.liezhi.yang@windriver.com>
References: <cover.1345963712.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 4/6] archiver.bbclass: remove the "upper()" function
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
X-List-Received-Date: Sun, 26 Aug 2012 06:58:50 -0000
Content-Type: text/plain

The configuration value from the conf file is lower case, e.g. srpm,
tar, so there is no reason to use the upper case which makes things
complicated.

[YOCTO #2619]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass    | 26 +++++++++++---------------
 meta/classes/package_rpm.bbclass | 12 ++++++------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 7056714..19c5567 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -7,9 +7,9 @@
 #
 
 ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
-ARCHIVE_TYPE ?= "TAR SRPM"
+ARCHIVE_TYPE ?= "tar srpm"
 DISTRO ?= "poky"
-PATCHES_ARCHIVE_WITH_SERIES = 'TRUE'
+PATCHES_ARCHIVE_WITH_SERIES = 'yes'
 SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= '${@d.getVarFlag('ARCHIVER_MODE', 'log_type') \
     if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'logs_with_scripts'}'
 SOURCE_ARCHIVE_PACKAGE_TYPE ?= '${@d.getVarFlag('ARCHIVER_MODE', 'type') \
@@ -74,7 +74,7 @@ def tar_filter(d):
     and ignore the one in COPYLEFT_LICENSE_EXCLUDE. Don't exclude any
     packages when \"FILTER\" is \"no\"
     """
-    if d.getVar('FILTER', True).upper() == "YES":
+    if d.getVar('FILTER', True) == "yes":
         included, reason = copyleft_should_include(d)
         if not included:
             return False
@@ -235,7 +235,6 @@ def archive_sources_from_directory(d, stage_name):
     archive sources codes tree to tarball when tarball of $P doesn't
     exist in $DL_DIR
     """
-    import shutil
 
     s = d.getVar('S', True)
     work_dir=d.getVar('WORKDIR', True)
@@ -353,10 +352,7 @@ def move_tarball_deploy(d, tarball_list):
 
 def check_archiving_type(d):
     """check the type for archiving package('tar' or 'srpm')"""
-    try:
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in d.getVar('ARCHIVE_TYPE', True).split():
-            raise AttributeError
-    except AttributeError:
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) not in d.getVar('ARCHIVE_TYPE', True).split():
         bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is \'tar\' or \'srpm\', no other types")
 
 def store_package(d, package_name):
@@ -399,16 +395,16 @@ def archive_sources_patches(d, stage_name):
 
     source_tar_name = archive_sources(d, stage_name)
     if stage_name == "prepatch":
-        if d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True).upper() == 'TRUE':
+        if d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True) == 'yes':
             patch_tar_name = select_archive_patches(d, "all")
-        elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True).upper() == 'FALSE':
+        elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True) == 'no':
             patch_tar_name = select_archive_patches(d, "applying")
         else:
-            bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' is strings 'True' or 'False' ")
+            bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' to 'yes' or 'no' ")
     else:
         patch_tar_name = ''
 
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         move_tarball_deploy(d, [source_tar_name, patch_tar_name])
     else:
         tarpackage = os.path.join(d.getVar('WORKDIR', True), 'tar-package')
@@ -438,7 +434,7 @@ def archive_scripts_logs(d):
     else:
         return
 
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         move_tarball_deploy(d, [tarlog])
 
     else:
@@ -556,14 +552,14 @@ python do_archive_linux_yocto(){
     s = d.getVar('S', True)
     if 'linux-yocto' in s:
         source_tar_name = archive_sources(d, '')
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         move_tarball_deploy(d, [source_tar_name, ''])
 }
 do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
 
 # remove tarball for sources, patches and logs after creating srpm.
 python do_remove_tarball(){
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
         work_dir = d.getVar('WORKDIR', True)
         try:
             for file in os.listdir(os.getcwd()):
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b999c28..d44ab4c 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -570,19 +570,19 @@ python write_specfile () {
 
     # append information for logs and patches to %prep
     def add_prep(d,spec_files_bottom):
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
             spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
             spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
             spec_files_bottom.append('')
 
     # get the name of tarball for sources, patches and logs
     def get_tarballs(d):
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
             return get_package(d)
     
     # append the name of tarball to key word 'SOURCE' in xxx.spec.
     def tail_source(d,source_list=[],patch_list=None):
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
             source_number = 0
             patch_number = 0
             workdir = d.getVar('WORKDIR', True)
@@ -1020,7 +1020,7 @@ python write_specfile () {
 
 python do_package_rpm () {
     def creat_srpm_dir(d):
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
             clean_licenses = get_licenses(d)
             pkgwritesrpmdir = bb.data.expand('${PKGWRITEDIRSRPM}/${PACKAGE_ARCH_EXTEND}', d)
             pkgwritesrpmdir = pkgwritesrpmdir + '/' + clean_licenses
@@ -1147,14 +1147,14 @@ python do_package_rpm () {
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
         cmd = cmd + " --define '_sourcedir " + workdir + "'"
         cmdsrpm = cmd + " --define '_srcrpmdir " + creat_srpm_dir(d) + "'"
         cmdsrpm = cmdsrpm + " -bs " + outspecfile
     cmd = cmd + " -bb " + outspecfile
 
     # Build the source rpm package !
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
         d.setVar('SBUILDSPEC', cmdsrpm + "\n")
         d.setVarFlag('SBUILDSPEC', 'func', '1')
         bb.build.exec_func('SBUILDSPEC', d)
-- 
1.7.11.2



