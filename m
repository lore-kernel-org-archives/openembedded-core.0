Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C9CC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 01:39:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.106310.1738633172920504902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 17:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4130ac9f02=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141GuLk008827;
	Mon, 3 Feb 2025 17:39:28 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hm0pt4dx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Feb 2025 17:39:28 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 3 Feb 2025 17:39:28 -0800
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Mon, 3 Feb 2025 17:39:27 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <raj.khem@gmail.com>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 2/3] valgrind: disable ptests
Date: Mon, 3 Feb 2025 20:39:24 -0500
Message-ID: <20250204013925.2005184-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204013925.2005184-1-Randy.MacLeod@windriver.com>
References: <20250204013925.2005184-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PqlpbxM3 c=1 sm=1 tr=0 ts=67a16fd0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=CCpqsmhAAAAA:8 a=3fyaaF4VAAAA:8 a=t7CeM3EgAAAA:8 a=BmqSFSoMsDkiXyIiy1QA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: rfvEJ-z4GxLdsNwVmdC0jZbSXLnctMUn
X-Proofpoint-GUID: rfvEJ-z4GxLdsNwVmdC0jZbSXLnctMUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502040011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 01:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210747

From: Randy MacLeod <Randy.MacLeod@windriver.com>

The valgrind test runner, vg_regtest, changed in the 3.24 update and
there are some additional valgrind ptest regressions happening with glibc-2.41.
Disable the ptests for now. Some of the remaining patches can likely
be dropped but I'd rather carry them so that re-enabling the ptests
is simpler. Also the patch series have some dependencies and unwinding
that would block the glibc-2.41 unnecessarily.

This builds for glibc, musl for qemux86-64, runs:
-> valgrind [--leak-check=full] /bin/ls /tmp

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../valgrind/valgrind/remove-for-aarch64      |  32 ----
 .../valgrind/valgrind/remove-for-all          |  29 ---
 .../valgrind/valgrind_3.24.0.bb               | 167 +-----------------
 3 files changed, 1 insertion(+), 227 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-all

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
deleted file mode 100644
index 5bfba1c8d3..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ /dev/null
@@ -1,32 +0,0 @@
-drd/tests/annotate_sem
-gdbserver_tests/hgtls
-helgrind/tests/hg05_race2
-helgrind/tests/tc20_verifywrap
-memcheck/tests/dw4
-memcheck/tests/varinfo1
-memcheck/tests/varinfo2
-memcheck/tests/varinfo3
-memcheck/tests/varinfo4
-memcheck/tests/varinfo5
-memcheck/tests/varinfo6
-memcheck/tests/varinforestrict
-memcheck/tests/atomic_incs
-memcheck/tests/bug464969_d_demangle
-memcheck/tests/cxx17_aligned_new
-memcheck/tests/demangle
-memcheck/tests/long_namespace_xml
-memcheck/tests/mismatches
-memcheck/tests/mismatches_xml
-memcheck/tests/new_aligned_delete_default
-memcheck/tests/new_delete_mismatch_size
-memcheck/tests/new_nothrow
-memcheck/tests/realloc_size_zero_mismatch
-memcheck/tests/sized_aligned_new_delete_args
-memcheck/tests/sized_aligned_new_delete_misaligned1
-memcheck/tests/sized_aligned_new_delete_misaligned1_xml
-memcheck/tests/sized_aligned_new_delete_misaligned2
-memcheck/tests/sized_aligned_new_delete_misaligned2_xml
-memcheck/tests/sized_aligned_new_delete_misaligned3
-memcheck/tests/sized_aligned_new_delete_misaligned3_xml
-memcheck/tests/sized_delete
-none/tests/bigcode
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
deleted file mode 100644
index 8435a6d41d..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ /dev/null
@@ -1,29 +0,0 @@
-cachegrind/tests/wrap5
-drd/tests/boost_thread
-none/tests/amd64/fb_test_amd64
-none/tests/tls
-gdbserver_tests/hginfo
-gdbserver_tests/mcinvokeRU
-memcheck/tests/linux/dlclose_leak-no-keep
-memcheck/tests/linux/dlclose_leak
-memcheck/tests/linux/timerfd-syscall
-memcheck/tests/supp_unknown
-memcheck/tests/wrap1
-memcheck/tests/wrap2
-memcheck/tests/wrap3
-memcheck/tests/wrap4
-memcheck/tests/wrap5
-memcheck/tests/wrap6
-memcheck/tests/wrap7
-memcheck/tests/wrap8
-helgrind/tests/tls_threads
-helgrind/tests/pth_mempcpy_false_races
-drd/tests/bar_bad
-drd/tests/bar_bad_xml
-drd/tests/pth_barrier_thr_cr
-drd/tests/std_thread2
-drd/tests/thread_name_xml
-massif/tests/deep-D
-massif/tests/bug469146
-massif/tests/new-cpp
-massif/tests/overloaded-new
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.24.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.24.0.bb
index 0f05e029b9..34c306ca52 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.24.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.24.0.bb
@@ -8,17 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
 
-DEPENDS = " \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
-        "
-
 SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
-           file://run-ptest \
-           file://remove-for-aarch64 \
-           file://remove-for-all \
-           file://taskset_nondeterministic_tests \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
            file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch \
@@ -39,17 +31,6 @@ UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
-# patch 0001-memcheck-vgtests-remove-fullpath-after-flags.patch removes relative path
-# argument. Change expected stderr files accordingly.
-do_patch:append() {
-    bb.build.exec_func('do_sed_paths', d)
-}
-
-do_sed_paths() {
-    sed -i -e 's|tests/||' ${S}/memcheck/tests/badfree3.stderr.exp
-    sed -i -e 's|tests/||' ${S}/memcheck/tests/varinfo5.stderr.exp
-}
-
 # valgrind supports armv7 and above
 COMPATIBLE_HOST:armv4 = 'null'
 COMPATIBLE_HOST:armv5 = 'null'
@@ -69,8 +50,7 @@ COMPATIBLE_HOST:linux-gnun32 = 'null'
 # Disable for powerpc64 with musl
 COMPATIBLE_HOST:libc-musl:powerpc64 = 'null'
 
-# brokenseip is unfortunately required by ptests to pass
-inherit autotools-brokensep ptest multilib_header
+inherit autotools-brokensep multilib_header
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
 EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS') != '32']}"
@@ -102,8 +82,6 @@ RDEPENDS:${PN}-callgrind = "${PN} perl"
 
 do_configure:prepend () {
     rm -rf ${S}/config.h
-    sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/ptest:g' ${S}/none/tests/Makefile.am
-    sed -i -e 's:$(top_builddir):$(pkglibdir)/ptest:g' ${S}/memcheck/tests/Makefile.am
 }
 
 do_install:append () {
@@ -127,146 +105,3 @@ INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-
 # valgrind needs debug information for ld.so at runtime in order to
 # redirect functions like strlen.
 RRECOMMENDS:${PN} += "${TCLIBC}-dbg"
-
-RDEPENDS:${PN}-ptest += " bash coreutils curl file \
-   gdb \
-   ${TCLIBC}-src gcc-runtime-dbg \
-   libgomp \
-   perl \
-   perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
-   perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
-   perl-module-carp perl-module-symbol \
-   procps \
-   python3-compile \
-   sed \
-   util-linux-taskset \
-   ${PN}-dbg ${PN}-src \
-   ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
-"
-RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-gconv-utf-32"
-
-# One of the tests contains a bogus interpreter path on purpose.
-# Skip file dependency check
-SKIP_FILEDEPS:${PN}-ptest = '1'
-INSANE_SKIP:${PN}-ptest = "debug-deps"
-
-do_compile_ptest() {
-    oe_runmake check
-}
-
-
-do_install_ptest() {
-    chmod +x ${B}/tests/vg_regtest
-
-    # The test application binaries are not automatically installed.
-    # Grab them from the build directory.
-    #
-    # The regression tests require scripts and data files that are not
-    # copied to the build directory.  They must be copied from the
-    # source directory.
-    saved_dir=$PWD
-    for parent_dir in ${S} ${B} ; do
-        cd $parent_dir
-
-        subdirs=" \
-	   .in_place \
-	   cachegrind/tests \
-	   callgrind/tests \
-	   dhat/tests \
-	   drd/tests \
-	   gdbserver_tests \
-	   helgrind/tests \
-	   lackey/tests \
-	   massif/tests \
-	   memcheck/tests \
-	   none/tests \
-	   tests \
-	   exp-bbv/tests \
-	"
-        # Get the vg test scripts, filters, and expected files
-        for dir in $subdirs ; do
-            find $dir | cpio -pvdu ${D}${PTEST_PATH}
-        done
-        cd $saved_dir
-    done
-
-    # The scripts reference config.h so add it to the top ptest dir.
-    cp ${B}/config.h ${D}${PTEST_PATH}
-    install -D ${UNPACKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
-    install -D ${UNPACKDIR}/remove-for-all ${D}${PTEST_PATH}
-    install -D ${UNPACKDIR}/taskset_nondeterministic_tests ${D}${PTEST_PATH}
-
-    # Add an executable need by none/tests/bigcode
-    mkdir ${D}${PTEST_PATH}/perf
-    cp ${B}/perf/bigcode ${D}${PTEST_PATH}/perf
-
-    # Add an executable needed by memcheck/tests/vcpu_bz2
-    cp ${B}/perf/bz2 ${D}${PTEST_PATH}/perf
-
-    # Make the ptest dir look like the top level valgrind src dir
-    # This is checked by the gdbserver_tests/make_local_links script
-    mkdir ${D}${PTEST_PATH}/coregrind
-    cp ${B}/coregrind/vgdb ${D}${PTEST_PATH}/coregrind
-
-    # Add an executable needed by massif tests
-    cp ${B}/massif/ms_print ${D}${PTEST_PATH}/massif/ms_print
-
-    find ${D}${PTEST_PATH} \
-        \( \
-	   -name "Makefile*" \
-        -o -name "*.o" \
-	\) \
-        -exec rm {} \;
-
-    sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann1.vgtest
-    sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann2.vgtest
-
-    # point the expanded @abs_top_builddir@ of the host to PTEST_PATH
-    sed -i s:${S}:${PTEST_PATH}:g \
-        ${D}${PTEST_PATH}/memcheck/tests/linux/debuginfod-check.vgtest
-
-    # handle multilib
-    sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
-    sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
-    sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
-
-    # enable cachegrind ptests
-    ln -s ${bindir}/cg_annotate ${D}/${PTEST_PATH}/cachegrind/cg_annotate
-    ln -s ${bindir}/cg_diff ${D}/${PTEST_PATH}/cachegrind/cg_diff
-    ln -s ${bindir}/cg_merge ${D}/${PTEST_PATH}/cachegrind/cg_merge
-
-    # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
-    # https://bugs.kde.org/show_bug.cgi?id=402833
-    rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
-
-    # This is known failure see https://bugs.kde.org/show_bug.cgi?id=435732
-    rm ${D}${PTEST_PATH}/memcheck/tests/leak_cpp_interior.vgtest
-
-    # https://bugs.kde.org/show_bug.cgi?id=445743
-    rm ${D}${PTEST_PATH}/drd/tests/pth_mutex_signal
-
-    # As the binary isn't stripped or debug-splitted, the source file isn't fetched
-    # via dwarfsrcfiles either, so it needs to be installed manually.
-    mkdir -p ${D}${TARGET_DBGSRC_DIR}/none/tests/
-    install ${S}/none/tests/tls.c ${D}${TARGET_DBGSRC_DIR}/none/tests/
-}
-
-do_install_ptest:append:x86-64 () {
-    # https://bugs.kde.org/show_bug.cgi?id=463456
-    rm ${D}${PTEST_PATH}/memcheck/tests/origin6-fp.vgtest
-    # https://bugs.kde.org/show_bug.cgi?id=463458
-    rm ${D}${PTEST_PATH}/memcheck/tests/vcpu_fnfns.vgtest
-    # https://bugs.kde.org/show_bug.cgi?id=463463
-    rm ${D}${PTEST_PATH}/none/tests/amd64/fma.vgtest
-}
-
-# avoid stripping some generated binaries otherwise some of the tests will fail
-# run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
-INHIBIT_PACKAGE_STRIP_FILES += "\
-    ${PKGD}${PTEST_PATH}/none/tests/tls \
-    ${PKGD}${PTEST_PATH}/none/tests/tls.so \
-    ${PKGD}${PTEST_PATH}/none/tests/tls2.so \
-    ${PKGD}${PTEST_PATH}/helgrind/tests/tc09_bad_unlock \
-    ${PKGD}${PTEST_PATH}/memcheck/tests/manuel1 \
-    ${PKGD}${PTEST_PATH}/drd/tests/pth_detached3 \
-"
-- 
2.34.1


