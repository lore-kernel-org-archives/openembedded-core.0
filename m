Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD77C6F89E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:03:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2BH3qU1003909
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Mar 2014 10:03:52 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 11 Mar 2014 10:03:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 01:08:21 +0800
Message-ID: <7337ad5ac0c8f13c3b23160f2a2ea6e9dc383f64.1394555880.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] package_rpm.bbclass: archive the source to srpm package
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
X-List-Received-Date: Tue, 11 Mar 2014 17:03:55 -0000
Content-Type: text/plain

The archiver.bbclass will put the sources to ARCHIVER_OUTDIR according
to configuration, then the rpmbuild -bs will create the srpm.

[YOCTO #4986]
[YOCTO #5113]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index bce5648..9e63878 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -6,7 +6,6 @@ RPM="rpm"
 RPMBUILD="rpmbuild"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
-PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
 
 # Maintaining the perfile dependencies has singificant overhead when writing the 
 # packages. When set, this value merges them for efficiency.
@@ -87,23 +86,26 @@ python write_specfile () {
 
     # append information for logs and patches to %prep
     def add_prep(d,spec_files_bottom):
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
+        if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
             spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
             spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
             spec_files_bottom.append('')
 
     # append the name of tarball to key word 'SOURCE' in xxx.spec.
     def tail_source(d):
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-            source_list = get_package(d)
+        if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
+            ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+            if not os.path.exists(ar_outdir):
+                return
+            source_list = os.listdir(ar_outdir)
             source_number = 0
-            workdir = d.getVar('WORKDIR', True)
             for source in source_list:
                 # The rpmbuild doesn't need the root permission, but it needs
                 # to know the file's user and group name, the only user and
                 # group in fakeroot is "root" when working in fakeroot.
-                os.chown("%s/%s" % (workdir, source), 0, 0)
-                spec_preamble_top.append('Source' + str(source_number) + ': %s' % source)
+                f = os.path.join(ar_outdir, source)
+                os.chown(f, 0, 0)
+                spec_preamble_top.append('Source%s: %s' % (source_number, source))
                 source_number += 1
     # We need a simple way to remove the MLPREFIX from the package name,
     # and dependency information...
@@ -611,15 +613,6 @@ python write_specfile () {
 }
 
 python do_package_rpm () {
-    def creat_srpm_dir(d):
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-            clean_licenses = get_licenses(d)
-            pkgwritesrpmdir = bb.data.expand('${PKGWRITEDIRSRPM}/${PACKAGE_ARCH_EXTEND}', d)
-            pkgwritesrpmdir = pkgwritesrpmdir + '/' + clean_licenses
-            bb.utils.mkdirhier(pkgwritesrpmdir)
-            os.chmod(pkgwritesrpmdir, 0755)
-            return pkgwritesrpmdir
-            
     # We need a simple way to remove the MLPREFIX from the package name,
     # and dependency information...
     def strip_multilib(name, d):
@@ -687,16 +680,14 @@ python do_package_rpm () {
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-        cmd = cmd + " --define '_sourcedir " + workdir + "'"
-        cmdsrpm = cmd + " --define '_srcrpmdir " + creat_srpm_dir(d) + "'"
+    if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
+        cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR', True) + "'"
+        cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR', True) + "'"
         cmdsrpm = cmdsrpm + " -bs " + outspecfile
         # Build the .src.rpm
         d.setVar('SBUILDSPEC', cmdsrpm + "\n")
         d.setVarFlag('SBUILDSPEC', 'func', '1')
         bb.build.exec_func('SBUILDSPEC', d)
-        # Remove the source (SOURCE0, SOURCE1 ...)
-        cmd = cmd + " --rmsource "
     cmd = cmd + " -bb " + outspecfile
 
     # Build the rpm package!
-- 
1.8.3.1


