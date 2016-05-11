Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEDD273163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 359A31811C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id i1UVAzNq2V9Z
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id B5FF4180E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 95D9E15E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 8186714B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 802291022
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4BHRI9O028638
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4BHRI5T028637
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2016 19:27:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 19:27:00 +0200
Message-Id: <cover.1462987580.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 00/16] Simplify how to stage directories in the sysroot
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
X-List-Received-Date: Wed, 11 May 2016 17:27:24 -0000

The first commit in this set makes it possible to specify the
directories that will be staged in the sysroot via variables rather
than hardcoding it in sysroot_stage_dirs(). This should make it a lot
easier to add/remove directories to stage.

The rest of the commits just change recipes to take advantage of the
new variables.

Because of the following if statement in sysroot_stage_dirs():

	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then

I have split the list of directories into SYSROOT_DIRS and
SYSROOT_DIRS_NATIVE, where the latter is included if that if statement
is true. I am not sure when that statement is true (my understanding
is that it should be true for native builds, but I am not sure if it
is also true for other builds like cross, nativesdk, etc). If it is
only true for native builds then that if statement could be removed,
and the SYSROOT_DIRS_NATIVE variable could be replaced by
SYSROOT_DIRS_append_class-native...

//Peter

The following changes since commit 28433319ad8299aa23b1fcfdddbe100b29e86517:

  bitbake: toaster: tests browser Add test for creating a project (2016-05-11 11:32:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/sysroot_dirs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/sysroot_dirs

Peter Kjellerstedt (16):
  staging.bbclass: Make it easier to define which dirs to stage
  u-boot-fw-utils: Use SYSROOT_DIRS to add dirs to stage in sysroot
  libtool-cross: Use SYSROOT_DIRS to add dirs to stage in sysroot
  qemuwrapper-cross: Use SYSROOT_DIRS to add dirs to stage in sysroot
  tcl: Use SYSROOT_DIRS to add dirs to stage in sysroot
  shadow-sysroot: Use SYSROOT_DIRS to add dirs to stage in sysroot
  depmodwrapper-cross: Use SYSROOT_DIRS to add dirs to stage in sysroot
  base-files: Use SYSROOT_DIRS to add dirs to stage in sysroot
  signing-keys: Use SYSROOT_DIRS to add dirs to stage in sysroot
  vala.inc: Use SYSROOT_DIRS to add dirs to stage in sysroot
  gobject-introspection: Use SYSROOT_DIRS to add dirs to stage in
    sysroot
  grub2.inc: Use SYSROOT_DIRS_BLACKLIST to exclude dirs from the sysroot
  gettext: Use SYSROOT_DIRS_BLACKLIST to exclude dirs from the sysroot
  gcc-target.inc: Use SYSROOT_DIRS_BLACKLIST to exclude dirs from
    sysroot
  libtool: Use SYSROOT_DIRS_BLACKLIST to exclude dirs from the sysroot
  font-util: Remove ${datadir}/fonts from SYSROOT_DIRS_BLACKLIST

 meta/classes/staging.bbclass                       | 69 ++++++++++++----------
 meta/recipes-bsp/grub/grub2.inc                    |  5 +-
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb |  5 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |  5 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |  7 +--
 meta/recipes-core/meta/signing-keys.bb             |  6 +-
 meta/recipes-devtools/gcc/gcc-target.inc           |  4 +-
 .../libtool/libtool-cross_2.4.6.bb                 |  7 +--
 meta/recipes-devtools/libtool/libtool_2.4.6.bb     | 13 ++--
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |  6 +-
 meta/recipes-devtools/tcltk/tcl_8.6.4.bb           |  5 +-
 meta/recipes-devtools/vala/vala.inc                | 13 ++--
 .../shadow/shadow-sysroot_4.2.1.bb                 |  6 +-
 .../gobject-introspection_1.46.0.bb                |  9 ++-
 meta/recipes-graphics/xorg-font/font-util_1.3.1.bb |  5 +-
 .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |  6 +-
 16 files changed, 67 insertions(+), 104 deletions(-)

-- 
2.1.0


