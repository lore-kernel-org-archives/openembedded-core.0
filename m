Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0BE6A71CAF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 15:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JF0fJm030131; Sun, 19 Feb 2017 15:00:41 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6OMpFMvtvFm6; Sun, 19 Feb 2017 15:00:41 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JF0b85030116
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 19 Feb 2017 15:00:40 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cfSya-0000vd-C8; Sun, 19 Feb 2017 07:00:36 -0800
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Feb 2017 07:00:33 -0800
Message-Id: <1487516434-3530-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] gcc-cross: Avoid races with gcc_stash_builddir
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
X-List-Received-Date: Sun, 19 Feb 2017 15:00:50 -0000

Its sad we need to do this but do_install and do_populate_sysroot appear
to change the files in ${B} and this breaks if something works in parallel
like gcc_stash_builddir. We've seen a few too many race errors on the
autobuilder which appear to be from this so make things run in sequence
deterministically for now.

An example failure was this from do_populate_sysroot whilst stash_builddir was running
in parallel:

ERROR: gcc-cross-initial-arm-6.3.0-r0 do_populate_sysroot: split_and_strip_files: 'file
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/work/x86_64-linux/
gcc-cross-initial-arm/6.3.0-r0/sysroot-destdir/home/pokybuild/yocto-autobuilder/yocto-worker/
nightly-arm-lsb/build/build/tmp/work/x86_64-linux/gcc-cross-initial-arm/6.3.0-r0/recipe-sysroot-native/
usr/bin/arm-poky-linux-gnueabi.gcc-cross-initial-arm/arm-poky-linux-gnueabi-gcov' failed

Exception: subprocess.CalledProcessError: Command '('patchelf-uninative', '--set-interpreter',
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots-uninative/
x86_64-linux/lib/ld-linux-x86-64.so.2', '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/
build/build/tmp/work/x86_64-linux/gcc-cross-initial-arm/6.3.0-r0/sstate-build-populate_sysroot/
recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi.gcc-cross-initial-arm/arm-poky-linux-gnueabi-gcov')' returned non-zero exit status 1

Subprocess output:
missing section headers

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index fa5cfbd..bb5f7a0 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -200,7 +200,7 @@ do_gcc_stash_builddir () {
 	dest=${BUILDDIRSTASH}
 	hardlinkdir . $dest
 }
-addtask do_gcc_stash_builddir after do_compile before do_build
+addtask do_gcc_stash_builddir after do_compile before do_install
 SSTATETASKS += "do_gcc_stash_builddir"
 do_gcc_stash_builddir[sstate-inputdirs] = "${BUILDDIRSTASH}"
 do_gcc_stash_builddir[sstate-outputdirs] = "${STAGING_DIR}-components/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}"
-- 
2.7.4


