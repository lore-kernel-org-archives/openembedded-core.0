Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 58807601A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 21:20:07 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Wed,  7 May 2014 23:20:00 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id 042053A141;
	Wed,  7 May 2014 23:19:52 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 23:19:42 +0200
Message-Id: <cover.1399497346.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/13] Remove usage of FILESPATH
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
X-List-Received-Date: Wed, 07 May 2014 21:20:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

We extend the search path in a number of recipes by setting FILESPATH,
which is not really desirable since the manner in which we have done it
can make the recipe harder to bbappend (and we explicitly advise modifying
FILESPATH this in the manual). These should be changed to use FILESEXTRAPATHS
to extend the path instead or use a default FILESPATH (e.g. BP, BPN or files).


The following changes since commit 7b78c364b7de901f97cd8dbe56d5e02f545bf3d3:

  cleanup-workdir: Fix crosssdk reference after addition of PN (2014-05-05 09:05:42 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/bug/4497
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug/4497

Petter Mabäcker (13):
  systemtap: remove usage of FILESPATH
  dbus: remove usage of FILESPATH
  gstreamer: remove unused FILESPATH
  trace-cmd: remove usage of FILESPATH
  xorg-lib: remove usage of FILESPATH
  mesa: remove usage of FILESPATH
  qemu: remove unused FILESPATH
  linuxdoc-tools: remove usage of FILESPATH
  gcc: remove usage of FILESPATH
  python: remove usage of FILESPATH
  u-boot: remove unused FILESPATH
  uclibc: remove usage of FILESPATH
  eglibc: remove usage of FILESPATH

 meta/recipes-bsp/u-boot/u-boot.inc                 |    1 -
 meta/recipes-core/dbus/dbus-test_1.6.18.bb         |    2 +-
 .../fix_for_centos_5.8.patch                       |    0
 .../eglibc/cross-localedef-native_2.19.bb          |    3 +--
 meta/recipes-core/eglibc/eglibc_2.19.bb            |    4 +---
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    2 +-
 .../0001-Add-eventfd_read-and-eventfd_write.patch  |    0
 ...nt.c-wtent.c-move-functions-from-utxent.c.patch |    0
 ...1-atexit_old-Do-not-add-it-to-shared-libc.patch |    0
 ...brt-Use-nodefaultlibs-instead-of-nostdlib.patch |    0
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |    0
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |    0
 .../0002-wire-setns-syscall.patch                  |    0
 ...tl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch |    0
 .../0004-Add-clock_adjtime-syscall.patch           |    0
 .../{uclibc-git => files}/argp-headers.patch       |    0
 .../{uclibc-git => files}/argp-support.patch       |    0
 .../compile-arm-fork-with-O2.patch                 |    0
 .../uclibc/{uclibc-git => files}/locale.cfg        |    0
 .../uclibc/{uclibc-git => files}/obstack.cfg       |    0
 .../uclibc/{uclibc-git => files}/orign_path.patch  |    0
 .../{uclibc-git => files}/powerpc_copysignl.patch  |    0
 .../remove_attribute_optimize_Os.patch             |    0
 .../uclibc/{uclibc-git => files}/uClibc.distro     |    0
 .../uclibc/{uclibc-git => files}/uClibc.machine    |    0
 .../uclibc_enable_log2_test.patch                  |    0
 meta/recipes-core/uclibc/uclibc-git.inc            |    4 +---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    2 +-
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb |    3 +--
 .../recipes-devtools/python/python-native_2.7.3.bb |    2 +-
 .../python/python-pygobject_2.28.3.bb              |    2 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb              |    1 -
 meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb        |    2 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |    2 +-
 .../{systemtap => files}/docproc-build-fix.patch   |    0
 .../obsolete_automake_macros.patch                 |    0
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    2 --
 .../{trace-cmd => files}/addldflags.patch          |    0
 .../blktrace-api-compatibility.patch               |    0
 .../kernelshark-fix-syntax-error-of-shell.patch    |    0
 .../{trace-cmd => files}/make-docs-optional.patch  |    0
 ...dd-checks-for-invalid-pointers-to-fix-seg.patch |    0
 ...o-not-call-stop_threads-if-doing-latency-.patch |    0
 ...etting-plugin-to-nop-clears-data-before-i.patch |    0
 .../trace-cmd-fix-syntax-error-of-shell.patch      |    0
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    2 --
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    2 --
 .../gstreamer/gstreamer1.0-plugins.inc             |    2 --
 48 files changed, 11 insertions(+), 27 deletions(-)
 rename meta/recipes-core/eglibc/{eglibc-2.19 => cross-localedef-native-2.19}/fix_for_centos_5.8.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-Add-eventfd_read-and-eventfd_write.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-atexit_old-Do-not-add-it-to-shared-libc.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0002-wire-setns-syscall.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/0004-Add-clock_adjtime-syscall.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/argp-headers.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/argp-support.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/compile-arm-fork-with-O2.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/locale.cfg (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/obstack.cfg (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/orign_path.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/powerpc_copysignl.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/remove_attribute_optimize_Os.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/uClibc.distro (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/uClibc.machine (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => files}/uclibc_enable_log2_test.patch (100%)
 rename meta/recipes-kernel/systemtap/{systemtap => files}/docproc-build-fix.patch (100%)
 rename meta/recipes-kernel/systemtap/{systemtap => files}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/addldflags.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/blktrace-api-compatibility.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/kernelshark-fix-syntax-error-of-shell.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/make-docs-optional.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/trace-cmd-fix-syntax-error-of-shell.patch (100%)

-- 
1.7.9.5


