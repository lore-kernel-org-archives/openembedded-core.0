Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50A9A6EE66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:52:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1OFqxXU015109
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Feb 2014 07:52:59 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 24 Feb 2014 07:52:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 23:56:07 +0800
Message-ID: <5373cb83c0c437d62a6d7fbaeae05cc13307bf49.1393256563.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393256563.git.liezhi.yang@windriver.com>
References: <cover.1393256563.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] package_rpm.bbclass: archive the source to srpm package
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
X-List-Received-Date: Mon, 24 Feb 2014 15:53:02 -0000
Content-Type: text/plain

The archiver.bbclass will put the sources to ARCHIVER_OUTDIR according
to configuration, then the rpmbuild -bs will create the srpm.

[YOCTO #4986]
[YOCTO #5113]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 82ea187..329ee06 100644
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
+        if d.getVarFlag('ARCHIVER_MODE', 'type', True) == 'srpm' and bb.data.inherits_class('archiver', d):
             spec_files_bottom.append('%%prep -n %s' % d.getVar('PN', True) )
             spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
             spec_files_bottom.append('')
 
     # append the name of tarball to key word 'SOURCE' in xxx.spec.
     def tail_source(d):
-        if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-            source_list = get_package(d)
+        if d.getVarFlag('ARCHIVER_MODE', 'type', True) == 'srpm' and bb.data.inherits_class('archiver', d):
+            ar_dir = d.getVar('ARCHIVER_OUTDIR', True)
+            if not os.path.exists(ar_dir):
+                return
+            source_list = os.listdir(ar_dir)
             source_number = 0
-            workdir = d.getVar('WORKDIR', True)
             for source in source_list:
                 # The rpmbuild doesn't need the root permission, but it needs
                 # to know the file's user and group name, the only user and
                 # group in fakeroot is "root" when working in fakeroot.
-                os.chown("%s/%s" % (workdir, source), 0, 0)
-                spec_preamble_top.append('Source' + str(source_number) + ': %s' % source)
+                f = os.path.join(ar_dir, source)
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
@@ -687,9 +680,9 @@ python do_package_rpm () {
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-        cmd = cmd + " --define '_sourcedir " + workdir + "'"
-        cmdsrpm = cmd + " --define '_srcrpmdir " + creat_srpm_dir(d) + "'"
+    if d.getVarFlag('ARCHIVER_MODE', 'type', True) == 'srpm' and bb.data.inherits_class('archiver', d):
+        cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR', True) + "'"
+        cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR', True) + "'"
         cmdsrpm = cmdsrpm + " -bs " + outspecfile
         # Build the .src.rpm
         d.setVar('SBUILDSPEC', cmdsrpm + "\n")
-- 
1.8.3.1


