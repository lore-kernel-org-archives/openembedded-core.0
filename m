Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 21D6E72F54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 19:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3AJuBDK006655; 
	Mon, 10 Apr 2017 20:56:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KBrs38u3oK_n; Mon, 10 Apr 2017 20:56:11 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3AJAPR7003935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 10 Apr 2017 20:10:26 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cxehl-0001Gx-Nm; Mon, 10 Apr 2017 20:10:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 20:10:23 +0100
Message-Id: <1491851424-4848-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491851424-4848-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1491851424-4848-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] scripts: Drop cleanup-workdir
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
X-List-Received-Date: Mon, 10 Apr 2017 19:56:12 -0000

This script appears broken and is actively breaking build directories.
For example, binutils-cross-i586 gets run do_fetch to do_populate_sysroot by:

$ oe-selftest -r devtool.DevtoolTests.test_devtool_virtual_kernel_modify

then:

$ oe-selftest -r oescripts.BuildhistoryDiffTests.test_buildhistory_diff

wipes out the contents of tmp/work/x86_64-linux/binutils-cross-i586/2.28-r0/
but does not wipe out the corresponding stamps, then:

$ oe-selftest -r runtime-test.Postinst.test_postinst_rootfs_and_boot

needs binutils-cross-i586:do_populate_lic and if and only if this is
unavailable from sstate, it fails since it thinks the source is already
unpacked when it isn't resulting in:

WARNING: binutils-cross-i586-2.28-r0 do_populate_lic: Could not copy license file /home/pokybuild/yocto-autobuilder/yocto-worker/nigh
tly-oe-selftest/build/build/tmp/work/x86_64-linux/binutils-cross-i586/2.28-r0/git/COPYING3.LIB to /home/pokybuild/yocto-autobuilder/yocto
-worker/nightly-oe-selftest/build/build/tmp/work/x86_64-linux/binutils-cross-i586/2.28-r0/license-destdir/binutils-cross-i586/COPYING3.LI
B: [Errno 2] No such file or directory: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/x86_64-l
inux/binutils-cross-i586/2.28-r0/git/COPYING3.LIB'
ERROR: binutils-cross-i586-2.28-r0 do_populate_lic: QA Issue: binutils-cross-i586: LIC_FILES_CHKSUM points to an invalid file: /home/
pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/x86_64-linux/binutils-cross-i586/2.28-r0/git/COPYING3 [license-checksum]

and similar errors.

Its safer for users to wipe tmp than try and maintain scripts which try
to remove pieces of tmp and get it wrong so remove the script.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/oescripts.py |  27 -----
 scripts/cleanup-workdir             | 198 ------------------------------------
 2 files changed, 225 deletions(-)
 delete mode 100755 scripts/cleanup-workdir

diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/oescripts.py
index c2e2b45..29547f5 100644
--- a/meta/lib/oeqa/selftest/oescripts.py
+++ b/meta/lib/oeqa/selftest/oescripts.py
@@ -10,33 +10,6 @@ from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.utils.decorators import testcase
 
-class TestScripts(oeSelfTest):
-
-    @testcase(300)
-    def test_cleanup_workdir(self):
-        path = os.path.dirname(get_bb_var('WORKDIR', 'selftest-ed'))
-        old_version_recipe = os.path.join(get_bb_var('COREBASE'), 'meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb')
-        old_version = '0.5'
-        bitbake("-c clean selftest-ed")
-        bitbake("-c clean -b %s" % old_version_recipe)
-
-        if os.path.exists(path):
-            initial_contents = os.listdir(path)
-        else:
-            initial_contents = []
-
-        bitbake('selftest-ed')
-        intermediary_contents = os.listdir(path)
-        bitbake("-b %s" % old_version_recipe)
-        runCmd('cleanup-workdir')
-        remaining_contents = os.listdir(path)
-
-        expected_contents = [x for x in intermediary_contents if x not in initial_contents]
-        remaining_not_expected = [x for x in remaining_contents if x not in expected_contents]
-        self.assertFalse(remaining_not_expected, msg="Not all necessary content has been deleted from %s: %s" % (path, ', '.join(map(str, remaining_not_expected))))
-        expected_not_remaining = [x for x in expected_contents if x not in remaining_contents]
-        self.assertFalse(expected_not_remaining, msg="The script removed extra contents from %s: %s" % (path, ', '.join(map(str, expected_not_remaining))))
-
 class BuildhistoryDiffTests(BuildhistoryBase):
 
     @testcase(295)
diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
deleted file mode 100755
index 98769f6..0000000
--- a/scripts/cleanup-workdir
+++ /dev/null
@@ -1,198 +0,0 @@
-#!/usr/bin/env python3
-
-# Copyright (c) 2012 Wind River Systems, Inc.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-import os
-import sys
-import optparse
-import re
-import subprocess
-import shutil
-
-pkg_cur_dirs = {}
-obsolete_dirs = []
-parser = None
-
-def err_quit(msg):
-    print(msg)
-    parser.print_usage()
-    sys.exit(1)
-
-def parse_version(verstr):
-    elems = verstr.split(':')
-    epoch = elems[0]
-    if len(epoch) == 0:
-        return elems[1]
-    else:
-        return epoch + '_' + elems[1]
-
-def run_command(cmd):
-    pipe = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
-    output = pipe.communicate()[0]
-    if pipe.returncode != 0:
-        print("Execute command '%s' failed." % cmd)
-        sys.exit(1)
-    return output.decode('utf-8')
-
-def get_cur_arch_dirs(workdir, arch_dirs):
-    pattern = workdir + '/(.*?)/'
-
-    cmd = "bitbake -e | grep ^SDK_SYS="
-    output = run_command(cmd)
-    sdk_sys = output.split('"')[1]
-
-    # select thest 5 packages to get the dirs of current arch
-    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk-' + sdk_sys, 'nativesdk-autoconf']
-
-    for pkg in pkgs:
-        cmd = "bitbake -e " + pkg + " | grep ^IMAGE_ROOTFS="
-        output = run_command(cmd)
-        output = output.split('"')[1]
-        m = re.match(pattern, output)
-        arch_dirs.append(m.group(1))
-
-def main():
-    global parser
-    parser = optparse.OptionParser(
-        usage = """%prog
-
-%prog removes the obsolete packages' build directories in WORKDIR.
-This script must be ran under BUILDDIR after source file \"oe-init-build-env\".
-
-Any file or directory under WORKDIR which is not created by Yocto
-will be deleted. Be CAUTIOUS.""")
-
-    options, args = parser.parse_args(sys.argv)
-
-    builddir = run_command('echo $BUILDDIR').strip()
-    if len(builddir) == 0:
-        err_quit("Please source file \"oe-init-build-env\" first.\n")
-
-    if os.getcwd() != builddir:
-        err_quit("Please run %s under: %s\n" % (os.path.basename(args[0]), builddir))
-
-    print('Updating bitbake caches...')
-    cmd = "bitbake -s"
-    output = run_command(cmd)
-
-    output = output.split('\n')
-    index = 0
-    while len(output[index]) > 0:
-        index += 1
-    alllines = output[index+1:]
-
-    for line in alllines:
-        # empty again means end of the versions output
-        if len(line) == 0:
-            break
-        line = line.strip()
-        line = re.sub('\s+', ' ', line)
-        elems = line.split(' ')
-        if len(elems) == 2:
-            version = parse_version(elems[1])
-        else:
-            version = parse_version(elems[2])
-        pkg_cur_dirs[elems[0]] = version
-
-    cmd = "bitbake -e"
-    output = run_command(cmd)
-
-    tmpdir = None
-    image_rootfs = None
-    output = output.split('\n')
-    for line in output:
-        if tmpdir and image_rootfs:
-            break
-
-        if not tmpdir:
-            m = re.match('TMPDIR="(.*)"', line)
-            if m:
-                tmpdir = m.group(1)
-
-        if not image_rootfs:
-            m = re.match('IMAGE_ROOTFS="(.*)"', line)
-            if m:
-                image_rootfs = m.group(1)
-
-    # won't fail just in case
-    if not tmpdir or not image_rootfs:
-        print("Can't get TMPDIR or IMAGE_ROOTFS.")
-        return 1
-
-    pattern = tmpdir + '/(.*?)/(.*?)/'
-    m = re.match(pattern, image_rootfs)
-    if not m:
-        print("Can't get WORKDIR.")
-        return 1
-
-    workdir = os.path.join(tmpdir, m.group(1))
-
-    # we only deal the dirs of current arch, total numbers of dirs are 6
-    cur_arch_dirs = [m.group(2)]
-    get_cur_arch_dirs(workdir, cur_arch_dirs)
-
-    for workroot, dirs, files in os.walk(workdir):
-        # For the files, they should NOT exist in WORKDIR. Remove them.
-        for f in files:
-            obsolete_dirs.append(os.path.join(workroot, f))
-
-        for d in dirs:
-            if d not in cur_arch_dirs:
-                continue
-
-            for pkgroot, pkgdirs, filenames in os.walk(os.path.join(workroot, d)):
-                for f in filenames:
-                    obsolete_dirs.append(os.path.join(pkgroot, f))
-
-                for pkgdir in sorted(pkgdirs):
-                    if pkgdir not in pkg_cur_dirs:
-                        obsolete_dirs.append(os.path.join(pkgroot, pkgdir))
-                    else:
-                        for verroot, verdirs, verfiles in os.walk(os.path.join(pkgroot, pkgdir)):
-                            for f in verfiles:
-                                obsolete_dirs.append(os.path.join(pkgroot, f))
-                            for v in sorted(verdirs):
-                               if v not in pkg_cur_dirs[pkgdir]:
-                                   obsolete_dirs.append(os.path.join(pkgroot, pkgdir, v))
-                            break
-
-                # just process the top dir of every package under tmp/work/*/,
-                # then jump out of the above os.walk()
-                break
-
-        # it is convenient to use os.walk() to get dirs and files at same time
-        # both of them have been dealed in the loop, so jump out
-        break
-
-    for d in obsolete_dirs:
-        print("Deleting %s" % d)
-        shutil.rmtree(d, True)
-
-    if len(obsolete_dirs):
-        print('\nTotal %d items.' % len(obsolete_dirs))
-    else:
-        print('\nNo obsolete directory found under %s.' % workdir)
-
-    return 0
-
-if __name__ == '__main__':
-    try:
-        ret = main()
-    except Exception:
-        ret = 2
-        import traceback
-        traceback.print_exc()
-    sys.exit(ret)
-- 
2.7.4


