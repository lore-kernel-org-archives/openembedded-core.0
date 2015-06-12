Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DFCE7568E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 03:23:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5C3NNvM023680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 20:23:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 20:23:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 20:23:22 -0700
Message-ID: <e8e90b46fb79d09ae36e4df169bdde25cd6a1f1f.1434079315.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434079315.git.liezhi.yang@windriver.com>
References: <cover.1434079315.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Remove invalid ac_cv
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
X-List-Received-Date: Fri, 12 Jun 2015 03:23:22 -0000
Content-Type: text/plain

They are not invalid any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_6.8p1.bb |    8 --------
 meta/recipes-connectivity/socat/socat_1.7.3.0.bb   |    1 -
 meta/recipes-core/glibc/glibc.inc                  |    1 -
 meta/recipes-devtools/apt/apt.inc                  |   12 ------------
 meta/recipes-devtools/git/git_2.4.2.bb             |    2 +-
 meta/recipes-devtools/python/python.inc            |    1 -
 meta/recipes-devtools/strace/strace_4.10.bb        |    2 --
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 -
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    2 --
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 -
 meta/recipes-support/apr/apr_1.5.2.bb              |    4 ----
 12 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.8p1.bb b/meta/recipes-connectivity/openssh/openssh_6.8p1.bb
index b00ef6f..e44353f 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.8p1.bb
@@ -53,17 +53,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --disable-strip \
                 "
 
-# Since we do not depend on libbsd, we do not want configure to use it
-# just because it finds libutil.h.  But, specifying --disable-libutil
-# causes compile errors, so...
-CACHED_CONFIGUREVARS += "ac_cv_header_bsd_libutil_h=no ac_cv_header_libutil_h=no"
-
 # passwd path is hardcoded in sshd
 CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
 
-# We don't want to depend on libblockfile
-CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
-
 # This is a workaround for uclibc because including stdio.h
 # pulls in pthreads.h and causes conflicts in function prototypes.
 # This results in compilation failure, so unless this is fixed,
diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.0.bb b/meta/recipes-connectivity/socat/socat_1.7.3.0.bb
index b58e0a7..64a7a0c 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.0.bb
@@ -26,7 +26,6 @@ EXTRA_AUTORECONF += "--exclude=autoheader"
 EXTRA_OECONF += "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \
         sc_cv_sys_tabdly_shift=11 sc_cv_sys_csize_shift=4 \
         ac_cv_ispeed_offset=13 \
-        ac_cv_header_bsd_libutil_h=no \
 "
 
 PACKAGECONFIG ??= "tcp-wrappers"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index da56bc9..74ad0b5 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -52,7 +52,6 @@ REQUIRED_DISTRO_FEATURES = "${DISTRO_FEATURES_LIBC}"
 LEAD_SONAME = "libc.so"
 
 CACHED_CONFIGUREVARS += " \
-  ac_cv_path_KSH=${base_bindir}/bash \
   ac_cv_path_BASH_SHELL=${base_bindir}/bash \
   libc_cv_slibdir=${base_libdir} \
   libc_cv_rootsbindir=${base_sbindir} \
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 04fcd65..94bd6e9 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -22,16 +22,4 @@ do_configure_prepend() {
     rm -rf ${S}/buildlib/config.guess
 }
 
-# Apt wants to know the glibc version by running a binary file, which will
-# fail, so we have to tell configure which version to use Since I don't know
-# the impliations of setting a wrong value I only provide one for angstrom,
-# which uses glibc 2.5 (which claims to be 2.4) 
-# Koen - 20070327
-EXTRA_OECONF_append_angstrom = " ac_cv_glibc_ver=libc6.4"
-
-# under Debian it is set to libc6.3 as they use glibc 2.3
-# They also provide glibc 2.5 in 'experimental' and it works with APT built
-# for 2.3 so we set it in same way
-EXTRA_OECONF_append = " ac_cv_glibc_ver=libc6.3"
-
 FILES_${PN}-dbg += "${libdir}/apt/methods/.debug/"
diff --git a/meta/recipes-devtools/git/git_2.4.2.bb b/meta/recipes-devtools/git/git_2.4.2.bb
index 0bb92a2..b8237fb 100644
--- a/meta/recipes-devtools/git/git_2.4.2.bb
+++ b/meta/recipes-devtools/git/git_2.4.2.bb
@@ -5,7 +5,7 @@ SRC_URI[tarball.sha256sum] = "8edd564051fb776a41b4c475ed2d6105de82b674b8903a9efa
 SRC_URI[manpages.md5sum] = "b52251e6f859a54bf5d5a3b7682fbfbf"
 SRC_URI[manpages.sha256sum] = "114b22518dd71cc1a16018b0ff198a5ee1e6b2239381dfd6a6b9994f3da89661"
 
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index e18ab8e..d428409 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -26,6 +26,5 @@ EXTRA_OECONF = "\
   --with-signal-module \
   --enable-shared \
   --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
-  ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no \
   ${PYTHONLSBOPTS} \
 "
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
index 20b7e3d..afc85dd 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.10.bb
@@ -22,13 +22,11 @@ RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
 
 PACKAGECONFIG_class-target ??= "\
     libaio ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 "
 
 PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[libunwind] = "--with-libunwind, --without-libunwind, libunwind"
-PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
 
 TESTDIR = "tests"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 02a170a..cc1c02b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -119,7 +119,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --localstatedir=/var \
                  --with-xkb-output=/var/lib/xkb \
                  --with-sha1=libcrypto \
-                 ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
 PACKAGECONFIG ??= "dri2 udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri glx', '', d)} \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 97e2949..10b5662 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -36,5 +36,3 @@ EXTRA_OECONF += " \
 "
 
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
-
-CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
diff --git a/meta/recipes-multimedia/lame/lame_3.99.5.bb b/meta/recipes-multimedia/lame/lame_3.99.5.bb
index 0477611..85ffa4e 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.5.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.5.bb
@@ -27,4 +27,4 @@ FILES_libmp3lame = "${libdir}/libmp3lame.so.*"
 FILES_libmp3lame-dev = "${includedir} ${libdir}/*"
 FILES_${PN}-dev = ""
 
-CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_xmmintrin_h=no"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 30fe221..03ed6d0 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -29,7 +29,6 @@ EXTRA_OECONF = "\
 		--without-fftw \
 		--without-zsh-completion-dir \
 		--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d \
-                ac_cv_header_valgrind_memcheck_h=no \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.5.2.bb
index aac6276..22c623e 100644
--- a/meta/recipes-support/apr/apr_1.5.2.bb
+++ b/meta/recipes-support/apr/apr_1.5.2.bb
@@ -27,10 +27,6 @@ OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 # Added to fix some issues with cmake. Refer to https://github.com/bmwcarit/meta-ros/issues/68#issuecomment-19896928
 CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes"
 
-# Also suppress trying to use sctp.
-#
-CACHED_CONFIGUREVARS += "ac_cv_header_netinet_sctp_h=no ac_cv_header_netinet_sctp_uio_h=no"
-
 do_configure_prepend() {
 	# Avoid absolute paths for grep since it causes failures
 	# when using sstate between different hosts with different
-- 
1.7.9.5


