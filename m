Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 537986FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 00:26:02 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBF0Q30T005524 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:26:03 -0600
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015121418260351-1131285 ;
	Mon, 14 Dec 2015 18:26:03 -0600 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 18:25:51 -0600
Message-Id: <1450139152-19802-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1449608008-25611-1-git-send-email-haris.okanovic@ni.com>
References: <1449608008-25611-1-git-send-email-haris.okanovic@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/14/2015 06:26:03 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/14/2015 06:26:03 PM,
	Serialize complete at 12/14/2015 06:26:03 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-15_01:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [PATCH 1/2] package.bbclass/package.py: Add do_install_source() task
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
X-List-Received-Date: Tue, 15 Dec 2015 00:26:03 -0000

Add do_install_source() task to stage a recipe's SRC_URI files under
SRC_D.

Dependencies:
 After do_fetch() to ensure SRC_URI files are downloaded
 After do_install() because it resets ${D} that's also used by this task
 Before do_package() to stage files before writing installers

No-ops unless ENABLE_SRC_INSTALL_${PN} = 1, which needs to be set in
distro config or recipes wanting to use this facility.

This is change is part of a series which add source packages to OE.
See the following thread for more information:
http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/72660

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/classes/package.bbclass |  5 +++
 meta/conf/documentation.conf |  1 +
 meta/lib/oe/package.py       | 96 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d731757..98f01e5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2079,3 +2079,8 @@ def mapping_rename_hook(d):
     runtime_mapping_rename("RRECOMMENDS", pkg, d)
     runtime_mapping_rename("RSUGGESTS", pkg, d)
 
+addtask do_install_source after do_fetch after do_install before do_package
+
+python do_install_source () {
+    oe.package.do_install_source(d)
+}
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 845559a..0df8a2f 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -26,6 +26,7 @@ do_fetchall[doc] = "Fetches all remote sources required to build a target"
 do_generate_qt_config_file[doc] = "Writes a qt.conf file for building a Qt-based application"
 do_install[doc] = "Copies files from the compilation directory to a holding area"
 do_install_ptest_base[doc] = "Copies the runtime test suite files from the compilation directory to a holding area"
+do_install_source[doc] = "Stages source code for packaging"
 do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
 do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yocto style kernel"
 do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index ea6feaa..c85aa22 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -123,3 +123,99 @@ def read_shlib_providers(d):
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
     return shlib_provider
+
+def archive_dir(dirPath, archivePath):
+    ''' Create tar.bz2 archive at archivePath from dirPath '''
+    import os, oe, bb
+
+    arDir = os.path.dirname(dirPath)
+    arName = os.path.basename(dirPath)
+
+    cmd = 'tar -c -I pbzip2 -f \"%s\" -C \"%s\" -p \"%s\"' % (archivePath, arDir, arName)
+    (retval, output) = oe.utils.getstatusoutput(cmd)
+    if retval:
+        bb.fatal('Failed to archive %s --> %s: %s %s' % (dirPath, archivePath, cmd, output))
+
+def do_install_source(d):
+    ''' Stage recipe's source for packaging '''
+    import os, oe, bb
+
+    pn = d.getVar("PN", True)
+
+    if d.getVar("ENABLE_SRC_INSTALL_%s" % pn, True) != "1":
+        return
+
+    packages = (d.getVar("PACKAGES", True) or "").split()
+    if ("%s-src" % pn) not in packages:
+        # Some recipes redefine PACKAGES without ${PN}-src. Don't stage
+        # anything in this case to avoid installed-vs-shipped warning.
+        return
+
+    urls = (d.getVar('SRC_URI', True) or "").split()
+    if len(urls) == 0:
+        return
+
+    workdir = d.getVar('WORKDIR', True)
+
+    # TODO rm_work() should clean this up
+    unpackTempDir = os.path.join(workdir, 'install-source-unpack-temp')
+    if os.path.exists(unpackTempDir):
+        bb.utils.remove(unpackTempDir, recurse=True)
+    os.makedirs(unpackTempDir, 0755)
+
+    src_d = d.getVar("SRC_D", True)
+    if os.path.exists(src_d):
+        bb.warn("SRC_D already exist. Removing.")
+        bb.utils.remove(src_d, recurse=True)
+    os.makedirs(src_d, 0755)
+
+    fetcher = bb.fetch2.Fetch(urls, d)
+
+    fileManif = []
+    for url in urls:
+        urlScheme = bb.fetch2.decodeurl(url)[0]
+        srcPath = fetcher.localpath(url)
+        srcName = os.path.basename(srcPath)
+
+        dstName = srcName
+        if os.path.isdir(srcPath):
+            dstName += '.tar.bz2'
+
+        dstPath = os.path.join(src_d, dstName)
+
+        # fetch() doesn't retrieve any actual files from git:// URLs,
+        # so we do an additional unpack() step to get something useful
+        # for these.
+        # TODO: May need to pre-process other revision control schemes
+        if urlScheme == 'git':
+            unpackPath = os.path.join(unpackTempDir, srcName)
+            if os.path.exists(unpackPath):
+                bb.utils.remove(unpackPath, recurse=True)
+            os.makedirs(unpackPath, 0755)
+
+            fetcher.unpack(unpackPath, [url])
+
+            # unpack() puts actual source in a 'git' subdir
+            srcPath = os.path.join(unpackPath, 'git')
+
+        if os.path.exists(dstPath):
+            bb.warn('Duplicate file %s in SRC_URI. Overwriting.' % dstName)
+            bb.utils.remove(dstPath, recurse=True)
+
+        if not dstName in fileManif:
+            fileManif.append(dstName)
+
+        if os.path.isdir(srcPath):
+            archive_dir(srcPath, dstPath)
+        else:
+            bb.utils.copyfile(srcPath, dstPath)
+
+    manifFilePath = os.path.join(src_d, 'manifest')
+    if os.path.exists(manifFilePath):
+        bb.warn('manifest file found in SRC_URI. Overwriting.')
+        bb.utils.remove(manifFilePath, recurse=True)
+
+    with open(manifFilePath, 'wb') as manif:
+        for fname in fileManif:
+            manif.write(fname)
+            manif.write('\n')
-- 
2.6.2


