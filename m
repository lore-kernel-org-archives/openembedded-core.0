Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RjnCQ-00048A-6H
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jan 2012 08:29:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q087MNna020189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 7 Jan 2012 23:22:23 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sat, 7 Jan 2012 23:22:22 -0800
Message-ID: <8e1e0bb2a8e876e37c2de9d84eb747c66d0ec750.1326003199.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1326003199.git.xiaofeng.yan@windriver.com>
References: <cover.1326003199.git.xiaofeng.yan@windriver.com>
Old-Date: Sun, 8 Jan 2012 13:39:25 +0800
Date: Sun, 8 Jan 2012 15:11:25 +0800
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] package_rpm.bbclass: add srpm function in spec file
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
X-List-Received-Date: Sun, 08 Jan 2012 07:29:50 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

For packaging source codes to source rpm package, adding Sources,\
 Patches and prep stage in spec file.
"Sources" include source codes (type of tar.gz) and \
log files including log.do_patch and log.do_configure (type of tar.gz)
"Patches" include all patches called in bb file.
"prep" is for user viewing the result in the stage of doing patch and configuration
for example:
User can use the following command to run the stage of prep.
$rpmbuild -bp package.spec
<show the result of log.do_patch and log.configure>

[YOCTO #1655]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/package_rpm.bbclass |   65 ++++++++++++++++++++++++++++++++------
 1 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index d03dc3f..3e0ca15 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -6,6 +6,7 @@ RPM="rpm"
 RPMBUILD="rpmbuild"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
+PKGWRITEDIRSRPM = "${WORKDIR}/deploy-srpm"
 
 python package_rpm_fn () {
 	d.setVar('PKGFN', d.getVar('PKG'))
@@ -422,6 +423,19 @@ python write_specfile () {
 	import textwrap
 	import oe.packagedata
 
+	def add_prep(spec_files_bottom):
+		bb.build.exec_func('not_srpm', d)
+		if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True) == 'SRPM':
+			spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
+			spec_files_bottom.append('%s' % "set +x")
+			spec_files_bottom.append('%s' % "cd $RPM_SOURCE_BUILD")
+			spec_files_bottom.append('%s' % "tar zxvf $RPM_SOURCE_DIR/log.tar.gz")
+			spec_files_bottom.append('%s' % "echo \"============ do patch ==============\"")
+			spec_files_bottom.append('%s' % "cat log.do_patch*")
+			spec_files_bottom.append('%s' % "echo \"============ do configure ==========\"")
+			spec_files_bottom.append('%s' % "cat log.do_configure*")
+			spec_files_bottom.append('')
+
 	# We need a simple way to remove the MLPREFIX from the package name,
 	# and dependency information...
 	def strip_multilib(name, d):
@@ -533,6 +547,13 @@ python write_specfile () {
 	srcmaintainer  = d.getVar('MAINTAINER', True)
 	srchomepage    = d.getVar('HOMEPAGE', True)
 	srcdescription = d.getVar('DESCRIPTION', True) or "."
+	
+	bb.build.exec_func('not_srpm', d)
+	if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True) == 'SRPM':
+		tpkg_name = d.getVar('PF',True)
+		srctargz  = tpkg_name + ".tar.gz"
+		logtargz = "log.tar.gz"
+
 
 	srcdepends     = strip_multilib(d.getVar('DEPENDS', True), d)
 	srcrdepends    = []
@@ -557,6 +578,11 @@ python write_specfile () {
 	spec_files_top = []
 	spec_files_bottom = []
 
+	if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True) == 'SRPM':
+		srcpatches = []	
+		bb.build.exec_func('get_patches', d)
+		srcpatches = d.getVar('PLIST',True)
+	
 	for pkg in packages.split():
 		localdata = bb.data.createCopy(d)
 
@@ -637,7 +663,7 @@ python write_specfile () {
 				else:
 					bb.note("Creating EMPTY RPM Package for %s" % splitname)
 				spec_files_top.append('')
-
+				
 			bb.utils.unlockfile(lf)
 			continue
 
@@ -714,7 +740,7 @@ python write_specfile () {
 			spec_scriptlets_bottom.append('# %s - %s' % (splitname, script))
 			spec_scriptlets_bottom.append(scriptvar)
 			spec_scriptlets_bottom.append('')
-
+		
 		# Now process files
 		file_list = []
 		walk_files(root, file_list, conffiles)
@@ -732,7 +758,8 @@ python write_specfile () {
 
 		del localdata
 		bb.utils.unlockfile(lf)
-
+	
+	add_prep(spec_files_bottom)
 	spec_preamble_top.append('Summary: %s' % srcsummary)
 	spec_preamble_top.append('Name: %s' % srcname)
 	spec_preamble_top.append('Version: %s' % srcversion)
@@ -743,6 +770,11 @@ python write_specfile () {
 	spec_preamble_top.append('Group: %s' % srcsection)
 	spec_preamble_top.append('Packager: %s' % srcmaintainer)
 	spec_preamble_top.append('URL: %s' % srchomepage)
+	
+	if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True) == 'SRPM':
+		spec_preamble_top.append('Source: %s' % srctargz)
+		spec_preamble_top.append('Source1: %s' % logtargz)
+
 
 	# Replaces == Obsoletes && Provides
 	if srcrreplaces and srcrreplaces.strip() != "":
@@ -764,6 +796,11 @@ python write_specfile () {
 	print_deps(srcrsuggests, 	"Recommends", spec_preamble_top, d)
 	print_deps(srcrprovides, 	"Provides", spec_preamble_top, d)
 	print_deps(srcrobsoletes, 	"Obsoletes", spec_preamble_top, d)
+	if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True) == 'SRPM':
+		numid = 1
+		for patch in srcpatches:
+			print_deps(patch, "Patch" + str(numid), spec_preamble_top, d)
+			numid += 1
 
 	# conflicts can not be in a provide!  We will need to filter it.
 	if srcrconflicts:
@@ -817,12 +854,6 @@ python write_specfile () {
 	except OSError:
 		raise bb.build.FuncFailed("unable to open spec file for writing.")
 
-	# RPMSPEC_PREAMBLE is a way to add arbitrary text to the top
-	# of the generated spec file
-	external_preamble = d.getVar("RPMSPEC_PREAMBLE", True)
-	if external_preamble:
-		specfile.write(external_preamble + "\n")
-
 	for line in spec_preamble_top:
 		specfile.write(line + "\n")
 
@@ -947,9 +978,14 @@ python do_package_rpm () {
 		d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
 	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}', d)
 	pkgarch = bb.data.expand('${PACKAGE_ARCH_EXTEND}${TARGET_VENDOR}-${TARGET_OS}', d)
-	magicfile = bb.data.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc', d)
+	magicfile = bb.data.expand('${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc', d)
 	bb.mkdirhier(pkgwritedir)
 	os.chmod(pkgwritedir, 0755)
+	if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True):
+		pkgwritesrpmdir = bb.data.expand('${PKGWRITEDIRSRPM}/${PACKAGE_ARCH_EXTEND}', d)
+		bb.mkdirhier(pkgwritesrpmdir)
+		os.chmod(pkgwritesrpmdir, 0755)
+	
 
 	cmd = rpmbuild
 	cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
@@ -962,8 +998,17 @@ python do_package_rpm () {
 	cmd = cmd + " --define 'debug_package %{nil}'"
 	cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
 	cmd = cmd + " --define '_tmppath " + workdir + "'"
+	if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True) == 'SRPM':
+		cmdsrpm = cmd + " --define '_sourcedir " + workdir + "' --define '_srcrpmdir " + pkgwritesrpmdir + "'"
+		cmdsrpm = cmdsrpm + " -bs " + outspecfile
 	cmd = cmd + " -bb " + outspecfile
 
+	# Build the source rpm package !
+	if not d.getVar('NOTSRPM', True) and d.getVar('ARCHIVE_TYPE', True) == 'SRPM':
+		d.setVar('SBUILDSPEC', cmdsrpm + "\n")
+		d.setVarFlag('SBUILDSPEC', 'func', '1')
+		bb.build.exec_func('SBUILDSPEC', d)
+
 	# Build the rpm package!
 	d.setVar('BUILDSPEC', cmd + "\n")
 	d.setVarFlag('BUILDSPEC', 'func', '1')
-- 
1.7.7



