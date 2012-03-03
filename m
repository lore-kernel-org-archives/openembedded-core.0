Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S3miZ-0002b0-Gk
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 12:01:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q23Ar5Lf017581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Mar 2012 02:53:06 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sat, 3 Mar 2012 02:53:05 -0800
Message-ID: <3fce8ebe8b9af73e91bd8baf397d1a9ac196171f.1330771239.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1330771239.git.xiaofeng.yan@windriver.com>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 2 Mar 2012 16:17:19 +0800
Date: Sat, 3 Mar 2012 18:54:01 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] package_rpm.bbclass: Add srpm function
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
X-List-Received-Date: Sat, 03 Mar 2012 11:01:39 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add a new function to archive source, patches and logs to a source rpm
package. Every source rpm package  will be deployed to
${DEPLOY}/sources/deploy-srpm.

[YOCTO #1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/package_rpm.bbclass |   54 +++++++++++++++++++++++++++++++++++--
 1 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index a813c8b..3804aa6 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -4,7 +4,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM="rpm"
 RPMBUILD="rpmbuild"
-
+PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm" 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
 python package_rpm_fn () {
@@ -475,6 +475,37 @@ python write_specfile () {
 	import textwrap
 	import oe.packagedata
 
+	# append information for logs and patches to %prep 
+	def add_prep(d,spec_files_bottom):
+		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+			spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
+			spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
+			spec_files_bottom.append('')
+
+	# get the name of tarball for sources, patches and logs  
+	def get_tarballs(d):
+		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+			sourcelist=[]
+			workdir = d.getVar('WORKDIR',True)
+			for source in os.listdir(workdir):
+				if 'tar.gz' in source:
+					sourcelist.append(source)
+			return sourcelist
+
+	# append the name of tarball to key word 'SOURCE' in xxx.spec.
+	def tail_source(d,source_list=[],patch_list=None):
+		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+			source_number = 0
+			patch_number = 0
+			for source in source_list:
+				spec_preamble_top.append('Source' + str(source_number) + ': %s' % source)
+				source_number += 1
+			if patch_list:
+				for patch in patch_list:
+					print_deps(patch, "Patch" + str(patch_number), spec_preamble_top, d)
+					patch_number += 1
+
+
 	# We need a simple way to remove the MLPREFIX from the package name,
 	# and dependency information...
 	def strip_multilib(name, d):
@@ -786,6 +817,7 @@ python write_specfile () {
 		del localdata
 		bb.utils.unlockfile(lf)
 
+	add_prep(d,spec_files_bottom)
 	spec_preamble_top.append('Summary: %s' % srcsummary)
 	spec_preamble_top.append('Name: %s' % srcname)
 	spec_preamble_top.append('Version: %s' % srcversion)
@@ -796,7 +828,9 @@ python write_specfile () {
 	spec_preamble_top.append('Group: %s' % srcsection)
 	spec_preamble_top.append('Packager: %s' % srcmaintainer)
 	spec_preamble_top.append('URL: %s' % srchomepage)
-
+	
+	source_list = get_tarballs(d)
+	tail_source(d,source_list,None)
 	# Replaces == Obsoletes && Provides
 	if srcrreplaces and srcrreplaces.strip() != "":
 		for dep in srcrreplaces.split(','):
@@ -899,7 +933,13 @@ python write_specfile () {
 
 python do_package_rpm () {
 	import os
-
+	
+	def creat_srpm_dir(d):
+		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+			pkgwritesrpmdir = bb.data.expand('${PKGWRITEDIRSRPM}/${PACKAGE_ARCH_EXTEND}', d)
+			bb.mkdirhier(pkgwritesrpmdir)
+			os.chmod(pkgwritesrpmdir, 0755)
+		return pkgwritesrpmdir
 	# We need a simple way to remove the MLPREFIX from the package name,
 	# and dependency information...
 	def strip_multilib(name, d):
@@ -1015,8 +1055,16 @@ python do_package_rpm () {
 	cmd = cmd + " --define 'debug_package %{nil}'"
 	cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
 	cmd = cmd + " --define '_tmppath " + workdir + "'"
+	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+		cmdsrpm = cmd + " --define '_sourcedir " + workdir + "' --define '_srcrpmdir " + creat_srpm_dir(d) + "'"
+		cmdsrpm = 'fakeroot ' + cmdsrpm + " -bs " + outspecfile
 	cmd = cmd + " -bb " + outspecfile
 
+	# Build the source rpm package !
+	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
+		d.setVar('SBUILDSPEC', cmdsrpm + "\n")
+		d.setVarFlag('SBUILDSPEC', 'func', '1')
+		bb.build.exec_func('SBUILDSPEC', d)
 	# Build the rpm package!
 	d.setVar('BUILDSPEC', cmd + "\n")
 	d.setVarFlag('BUILDSPEC', 'func', '1')
-- 
1.7.0.4



