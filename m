Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [RFC PATCH] insane.bbclass: lock down pending patches
Date: Mon,  6 Dec 2021 09:36:29 +0100
Message-Id: <20211206083629.2591982-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

Misuse of 'Pending' patch status has been a problem for a long time;
let's disallow that in any newly added patches. Please do the upsream
submission at the same time as you submit the patch to oe-core.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/insane.bbclass             |  11 +
 meta/files/pending-patches-lockdown.txt | 368 ++++++++++++++++++++++++
 2 files changed, 379 insertions(+)
 create mode 100644 meta/files/pending-patches-lockdown.txt

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 8a47da5a09..8dcf98aba8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1172,6 +1172,10 @@ python do_qa_patch() {
     import re
     from oe import patch
 
+    locked_pending = []
+    for locked_p in open(os.path.join(d.getVar('COREBASE'),'meta/files/pending-patches-lockdown.txt')).readlines():
+        locked_pending.append(os.path.join(d.getVar('COREBASE'), locked_p.split()[0]))
+
     for url in patch.src_patches(d):
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
@@ -1184,10 +1188,17 @@ python do_qa_patch() {
        content = open(fullpath, encoding='utf-8', errors='ignore').read()
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
        strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport)( .+)?$", re.MULTILINE)
+       pending_status_re = re.compile(r"^Upstream-Status: Pending( .+)?$", re.MULTILINE)
        match_kinda = kinda_status_re.search(content)
        match_strict = strict_status_re.search(content)
+       match_pending = pending_status_re.search(content)
        guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
 
+       if match_pending and not fullpath in locked_pending:
+           bb.error("Pending status is not allowed in patch\n%s\nPlease submit the patch upstream or otherwise set the status according to %s ." % (fullpath, guidelines))
+       if not match_pending and fullpath in locked_pending:
+           bb.error("Please delete patch\n%s\n from meta/files/pending-patches-lockdown.txt" % (fullpath))
+
        if not match_strict:
            if match_kinda:
                bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
diff --git a/meta/files/pending-patches-lockdown.txt b/meta/files/pending-patches-lockdown.txt
new file mode 100644
index 0000000000..f196fe98b7
--- /dev/null
+++ b/meta/files/pending-patches-lockdown.txt
@@ -0,0 +1,368 @@
+meta/recipes-bsp/apmd/apmd/libtool.patch Scott Garman <scott.a.garman@intel.com>
+meta/recipes-bsp/apmd/apmd/linkage.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-bsp/apmd/apmd/unlinux.patch Scott Garman <scott.a.garman@intel.com>
+meta/recipes-bsp/apmd/apmd/wexitcode.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-bsp/efivar/efivar/determinism.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch Saul Wold <sgw@linux.intel.com>
+meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-bsp/grub/files/determinism.patch Naveen Saini <naveen.kumar.saini@intel.com>
+meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/05
+meta/recipes-bsp/libacpi/files/makefile-fix.patch unknown <unknown@email>
+meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/07
+meta/recipes-bsp/setserial/setserial/add_stdlib.patch unknown <unknown@email>
+meta/recipes-bsp/setserial/setserial/ldflags.patch Christopher Larson <chris_larson@mentor.com>
+meta/recipes-bsp/v86d/v86d/ar-from-env.patch Jason Wessel <jason.wessel@windriver.com>
+meta/recipes-bsp/v86d/v86d/Support-for-cross-compilation.patch Serhey Popovych <serhe.popovych@gmail.com>
+meta/recipes-connectivity/avahi/files/initscript.patch unknown <unknown@email>
+meta/recipes-connectivity/bind/bind-9.16.23/0001-avoid-start-failure-with-bind-user.patch Chen Qi <Qi.Chen@windriver.com>
+meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch Andrei Dinu <andrei.adrianx.dinu@intel.com>
+meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
+meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch Stefano Cappa <stefano.cappa.ks89@gmail.com>
+meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-telnetd-Fix-multiple-definitions-of-errcatch-an.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch Jackie Huang <jackie.huang@windriver.com>
+meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch Mike Frysinger <vapier at gentoo.org>
+meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch Martin Jansa <martin.jansa@gmail.com>
+meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch Kai Kang <kai.kang@windriver.com>
+meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch Baruch Siach <baruch@tkos.co.il>
+meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch Koen Kooi <koen@dominion.thruhere.net>
+meta/recipes-connectivity/iw/iw/separate-objdir.patch Changhyeok Bae <changhyeok.bae@gmail.com>
+meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch Kai Kang <kai.kang@windriver.com>
+meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch Henrik Riomar <henrik.riomar@ericsson.com>
+meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch Martin Jansa <Martin.Jansa@gmail.com>
+meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch Maxin B. John <maxin.john@enea.com>
+meta/recipes-core/base-passwd/base-passwd/kvm.patch Jacob Kroon <jacob.kroon@gmail.com>
+meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch Anders Darander <anders@chargestorm.se>
+meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch Chen Qi <Qi.Chen@windriver.com>
+meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch Jussi Kukkonen <jussi.kukkonen@intel.com>
+meta/recipes-core/expat/expat/libtool-tag.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/gettext/gettext-0.21/0001-msgmerge-29-Add-executable-file-mode-bits.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/gettext/gettext-0.21/parallel.patch Joe Slater <jslater@windriver.com>
+meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch Jason Wessel <jason.wessel@windriver.com>
+meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch Jason Wessel <jason.wessel@windriver.com>
+meta/recipes-core/glibc/glibc/0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0018-Remove-bash-dependency-for-nscd-init-script.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0019-eglibc-Cross-building-and-testing-instructions.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/glibc/0026-intl-Emit-no-lines-in-bison-generated-files.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch unknown <unknown@email>
+meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch Paul Gortmaker <paul.gortmaker@windriver.com>
+meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch Amarnath Valluri <amarnath.valluri@intel.com>
+meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch Serhey Popovych <serhe.popovych@gmail.com>
+meta/recipes-core/ncurses/files/0002-configure-reproducible.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools.patch Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
+meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
+meta/recipes-core/ovmf/ovmf/0003-ovmf-Update-to-latest.patch Steve Langasek <steve.langasek@ubuntu.com>
+meta/recipes-core/readline/readline-8.1/configure-fix.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch Chen Qi <Qi.Chen@windriver.com>
+meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-core/sysvinit/sysvinit/install.patch Qing He <qing.he@intel.com>
+meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch Tudor Florea <tudor.florea@enea.com>
+meta/recipes-core/util-linux/util-linux/ptest.patch Tudor Florea <tudor.florea@enea.com>
+meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/automake/automake/buildtest.patch =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
+meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch Adrian Calianu <adrian.calianu@enea.com>
+meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch Zhenhua Luo <zhenhua.luo@nxp.com>
+meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch Otavio Salvador <otavio@ossystems.com.br>
+meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch Chong Lu <Chong.Lu@windriver.com>
+meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch sweeaun <swee.aun.khor@intel.com>
+meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+meta/recipes-devtools/dpkg/dpkg/arch_pm.patch Joe Slater <jslater@windriver.com>
+meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch Jackie Huang <jackie.huang@windriver.com>
+meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch Joe Slater <jslater@windriver.com>
+meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-devtools/expect/expect/0001-configure.in.patch Anders Roxell <anders.roxell@enea.com>
+meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch Li Zhou <li.zhou@windriver.com>
+meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-devtools/expect/expect/0002-tcl.m4.patch Anders Roxell <anders.roxell@enea.com>
+meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gcc/gcc/0014-libtool.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch Szabolcs Nagy <nsz@port70.net>
+meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch Andre McCurdy <amccurdy@gmail.com>
+meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch Yousong Zhou <yszhou4tech@gmail.com>
+meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch Joe Slater <joe.slater@windriver.com>
+meta/recipes-devtools/libedit/libedit/stdc-predef.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch Martin Kelly <mkelly@xevo.com>
+meta/recipes-devtools/make/make/0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch Jens Rehsack <sno@netbsd.org>
+meta/recipes-devtools/make/make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/make/make/0001-src-dir.c-fix-buffer-overflow-warning.patch Jens Rehsack <sno@netbsd.org>
+meta/recipes-devtools/make/make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch Jens Rehsack <sno@netbsd.org>
+meta/recipes-devtools/make/make/0002-w32-compat-dirent.c-follow-header.patch Jens Rehsack <sno@netbsd.org>
+meta/recipes-devtools/make/make/0003-posixfcn-fcntl-gnulib-make-emulated.patch Jens Rehsack <sno@netbsd.org>
+meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch unknown <unknown@email>
+meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/perl-cross/files/determinism.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/perl/files/determinism.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/perl/files/errno_ver.diff Brendan O'Dea <bod@debian.org>
+meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch Jussi Kukkonen <jussi.kukkonen@intel.com>
+meta/recipes-devtools/prelink/prelink/0001-Add-MIPS-gnu-hash-support.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch Changqing Li <changqing.li@windriver.com>
+meta/recipes-devtools/python/python3/makerace.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/python/python3-pbr/0001-change-shebang-to-python3.patch Changqing Li <changqing.li@windriver.com>
+meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch Changqing Li <changqing.li@windriver.com>
+meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch Nicola Lunghi <nicola.lunghi@jci.com>
+meta/recipes-devtools/qemu/qemu/determinism.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch Qing He <qing.he@intel.com>
+meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch Christopher Larson <chris_larson@mentor.com>
+meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch Jeremy Puhlman <jpuhlman@mvista.com>
+meta/recipes-devtools/strace/strace/mips-SIGEMT.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/subversion/subversion/disable_macos.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/subversion/subversion/serfmacro.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch Koen Kooi <koen.kooi@linaro.org>
+meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch Merlin Mathesius <mmathesi@redhat.com>
+meta/recipes-devtools/syslinux/syslinux/determinism.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/systemd-bootchart/systemd-bootchart/no_lto.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch Abdur Rehman <abdur_rehman@mentor.com>
+meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch unknown <unknown@email>
+meta/recipes-devtools/tcltk/tcl/interp.patch Ross Burton <ross.burton@arm.com>
+meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch unknown <unknown@email>
+meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch "Song.Li" <Song.Li@windriver.com>
+meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch Haiqing Bai <Haiqing.Bai@windriver.com>
+meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch Randy MacLeod <Randy.MacLeod@windriver.com>
+meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch Aneesh Bansal <aneesh.bansal@freescale.com>
+meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch Andre McCurdy <armccurdy@gmail.com>
+meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch Yi Fan Yu <yifan.yu@windriver.com>
+meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch Andre McCurdy <armccurdy@gmail.com>
+meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch Dan Callaghan <dan.callaghan@opengear.com>
+meta/recipes-extended/at/at/configure-add-enable-pam.patch unknown <unknown@email>
+meta/recipes-extended/at/at/fix_parallel_build_error.patch Chen Qi <Qi.Chen@windriver.com>
+meta/recipes-extended/at/at/makefile-fix-parallel.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-extended/at/at/pam.conf.patch Chen Qi <Qi.Chen@windriver.com>
+meta/recipes-extended/bash/bash/build-tests.patch Anders Roxell <anders.roxell@enea.com>
+meta/recipes-extended/bash/bash/fix-run-builtins.patch Dengke Du <dengke.du@windriver.com>
+meta/recipes-extended/bash/bash/makerace2.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch unknown <unknown@email>
+meta/recipes-extended/bash/bash/test-output.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset_alias-when-building-for-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/cronie/cronie/crond_pam_config.patch Wenzong Fan <wenzong.fan@windriver.com>
+meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch Kang Kai <kai.kang@windriver.com>
+meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch Joe Slater <joe.slater@windriver.com>
+meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch Jeremy Puhlman <jpuhlman@mvista.com>
+meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-extended/gzip/gzip-1.11/wrong-path-fix.patch Ming Liu <ming.liu@windriver.com>
+meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch "Maxin B. John" <maxin.john@intel.com>
+meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch "Maxin B. John" <maxin.john@intel.com>
+meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch Alex Kiernan <alex.kiernan@gmail.com>
+meta/recipes-extended/libaio/libaio/system-linkage.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch Anuj Mittal <anuj.mittal@intel.com>
+meta/recipes-extended/man-db/files/man_db.conf-avoid-multilib-install-file-conflict.patch Kai Kang <kai.kang@windriver.com>
+meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-extended/mdadm/files/0001-Compute-abs-diff-in-a-standard-compliant-way.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/mdadm/files/debian-no-Werror.patch martin f. krafft <madduck@debian.org>
+meta/recipes-extended/mdadm/files/include_sysmacros.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch "Maxin B. John" <maxin.john@intel.com>
+meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
+meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch Lu Chong <Chong.Lu@windriver.com>
+meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
+meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
+meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch Martin Jansa <Martin.Jansa@gmail.com>
+meta/recipes-extended/net-tools/net-tools/Add_missing_headers.patch Martin Jansa <Martin.Jansa@gmail.com>
+meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+meta/recipes-extended/newt/files/cross_ar.patch Jason Wessel <jason.wessel@windriver.com>
+meta/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch Otavio Salvador <otavio@ossystems.com.br>
+meta/recipes-extended/pam/libpam/libpam-xtests.patch Kang Kai <kai.kang@windriver.com>
+meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/quota/quota/fcntl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/screen/screen/CVE-2021-26937.patch Scott Murray <scott.murray@konsulko.com>
+meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch Scott Garman <scott.a.garman@intel.com>
+meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch Shan Hai <shan.hai@windriver.com>
+meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch Kang Kai <kai.kang@windriver.com>
+meta/recipes-extended/slang/slang/dont-link-to-host.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-extended/slang/slang/no-x.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch Oleksiy Obitotskyy <oobitots@cisco.com>
+meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch Martin Jansa <Martin.Jansa@gmail.com>
+meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch farrah rashid <farrah.rashid@windriver.com>
+meta/recipes-extended/texinfo/texinfo/0001-gnulib-Update.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-extended/texinfo/texinfo/link-zip.patch Joshua Lock <josh@linux.intel.com>
+meta/recipes-extended/watchdog/watchdog/0001-wd_keepalive.service-use-run-instead-of-var-run.patch Chen Qi <Qi.Chen@windriver.com>
+meta/recipes-extended/which/which-2.21/automake.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-gnome/epiphany/files/distributor.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-gnome/epiphany/files/migrator.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-gnome/gnome/gconf/create_config_directory.patch Jaewon Lee <jaewon.lee@xilinx.com>
+meta/recipes-gnome/gnome/gconf/remove_plus_from_invalid_characters_list.patch Laurentiu Palcu <laurentiu.palcu@intel.com>
+meta/recipes-gnome/gtk-doc/files/conditionaltests.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-graphics/freetype/freetype/use-right-libtool.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-graphics/glew/glew/no-strip.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-graphics/glew/glew/notempdir.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch Jose Quaresma <quaresma.jose@gmail.com>
+meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch Martin Jansa <Martin.Jansa@gmail.com>
+meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch Adrian Bunk <bunk@stusta.de>
+meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch Alistair Francis <alistair@alistair23.me>
+meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch Martin Jansa <Martin.Jansa@gmail.com>
+meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch Martin Jansa <Martin.Jansa@gmail.com>
+meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch Martin Jansa <Martin.Jansa@gmail.com>
+meta/recipes-graphics/mesa/mesa-demos/0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch Prabhu <prabhu.sundararaj@freescale.com>
+meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch Jose Quaresma <quaresma.jose@gmail.com>
+meta/recipes-graphics/vulkan/vulkan-samples/debugfix.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-graphics/wayland/libinput/determinism.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch Chen Qi <Qi.Chen@windriver.com>
+meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch Laurentiu Palcu <laurentiu.palcu@intel.com>
+meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch unknown <unknown@email>
+meta/recipes-graphics/xorg-app/xset/disable-xkb.patch unknown <unknown@email>
+meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch Mingli Yu <mingli.yu@windriver.com>
+meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch Nitin A Kamble <nitin.a.kamble@intel.com>
+meta/recipes-graphics/xorg-lib/xcb-util-image/clang.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch California Sullivan <california.l.sullivan@intel.com>
+meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch Yu Zongchun <b40527@freescale.com>
+meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch Quanyang Wang <quanyang.wang@windriver.com>
+meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch Haiqing Bai <Haiqing.Bai@windriver.com>
+meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-kernel/kmod/kmod/ptest.patch Tudor Florea <tudor.florea@enea.com>
+meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch Jeremy Puhlman <jpuhlman@mvista.com>
+meta/recipes-kernel/lttng/lttng-tools/determinism.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch Andre McCurdy <armccurdy@gmail.com>
+meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch Andre McCurdy <armccurdy@gmail.com>
+meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch Andre McCurdy <armccurdy@gmail.com>
+meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch zhouming <b42586@freescale.com>
+meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch Carlos Rafael Giani <crg7475@mailbox.org>
+meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch Sébastien Mennetrier <s.mennetrier@innotis.org>
+meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch Shane Wang <shane.wang@intel.com>
+meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch Shane Wang <shane.wang@intel.com>
+meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-multimedia/mpeg2dec/files/0001-check-for-available-arm-optimizations.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-multimedia/mpeg2dec/files/0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-multimedia/mpeg2dec/files/61_global-symbol-test.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-multimedia/mpeg2dec/files/altivec_h_needed.patch Dongxiao Xu <dongxiao.xu@intel.com>
+meta/recipes-multimedia/pulseaudio/pulseaudio/0001-meson-Check-for-__get_cpuid.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch Andrei Gherzan <andrei@gherzan.ro>
+meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch Christopher Larson <chris_larson@mentor.com>
+meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch Joe Slater <joe.slater@windriver.com>
+meta/recipes-sato/rxvt-unicode/rxvt-unicode/xwc.patch unknown <unknown@email>
+meta/recipes-sato/settings-daemon/files/addsoundkeys.patch unknown <unknown@email>
+meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch Jeremy Puhlman <jpuhlman@mvista.com>
+meta/recipes-support/apr/apr/0004-Fix-packet-discards-HTTP-redirect.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-support/apr/apr/0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch Robert Yang <liezhi.yang@windriver.com>
+meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch Dengke Du <dengke.du@windriver.com>
+meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+meta/recipes-support/apr/apr/autoconf270.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-support/apr/apr/libtoolize_check.patch Helmut Grohne <helmut@subdivi.de>
+meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/argp-standalone/files/0002-isprint.patch Max Filippov <jcmvbkbc@gmail.com>
+meta/recipes-support/argp-standalone/files/out_of_tree_build.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch Andreas Oberritter <obi@opendreambox.org>
+meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch unknown <unknown@email>
+meta/recipes-support/consolekit/consolekit/add-polkit-configure-argument.patch unknown <unknown@email>
+meta/recipes-support/consolekit/consolekit/sepbuildfix.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-support/gdbm/files/ptest.patch Josep Puigdemont <josep.puigdemont@enea.com>
+meta/recipes-support/gmp/gmp/use-includedir.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch Saul Wold <sgw@linux.intel.com>
+meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch Wenzong Fan <wenzong.fan@windriver.com>
+meta/recipes-support/gnutls/gnutls/arm_eabi.patch Joe Slater <jslater@windriver.com>
+meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch Lei Maohui <leimaohui@cn.fujitsu.com>
+meta/recipes-support/icu/icu/fix-install-manx.patch Ross Burton <ross.burton@intel.com>
+meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch Roy Li <rongqing.li@windriver.com>
+meta/recipes-support/libcheck/libcheck/not-echo-compiler-info-to-check_stdint.h.patch Kai Kang <kai.kang@windriver.com>
+meta/recipes-support/libdaemon/libdaemon/fix-includes.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch Brett Warren <brett.warren@arm.com>
+meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch Chen Qi <Qi.Chen@windriver.com>
+meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch Hongxu Jia <hongxu.jia@windriver.com>
+meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x86_local_resume.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/libunwind/libunwind/0004-Fix-build-on-mips-musl.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch Christopher Larson <chris_larson@mentor.com>
+meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch Fan Xin <fan.xin@jp.fujitsu.com>
+meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch Simon McVittie <smcv@debian.org>
+meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch Haiqing Bai <Haiqing.Bai@windriver.com>
+meta/recipes-support/npth/npth/0001-Revert-Fix-problem-with-regression-tests-on-recent-g.patch Khem Raj <raj.khem@gmail.com>
+meta/recipes-support/npth/npth/pkgconfig.patch Saul Wold <sgw@linux.intel.com>
+meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch Roy Li <rongqing.li@windriver.com>
+meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch Li xin <lixin.fnst@cn.fujitsu.com>
+meta/recipes-support/vim/files/disable_acl_header_check.patch Wenzong Fan <wenzong.fan@windriver.com>
+meta/recipes-support/vim/files/no-path-adjust.patch Joe Slater <joe.slater@windriver.com>
+meta/recipes-support/vim/files/racefix.patch Richard Purdie <richard.purdie@linuxfoundation.org>
+meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch Chong Lu <Chong.Lu@windriver.com>
-- 
2.20.1

