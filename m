Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
 by mx.groups.io with SMTP id smtpd.web12.3847.1614043124054271390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 17:18:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=VESWRXkP;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.210.97, mailfrom: suji.velupillai@broadcom.com)
Received: by mail-ot1-f97.google.com with SMTP id k13so3497769otn.13
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 17:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=4vSSGDczOYJr9Lfq6prM1RrkXQjZlLnOkLn0/Kqmwoo=;
        b=VESWRXkPgSEGLHUJJtLs3U3OzHq/FypQ8UknKb7QesRxD1ICeu4mJPOERVzHHQDfwb
         ynz9nM0pnMbt7EW75ucOTQSepcMt32zx9bBEN9Cd+bJ/Y4RsiAvUZq2jfQvY6n7cNjdT
         VWYhpPbFGQ6wpKCzUfVPGg/LsbGwI2LahKvuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4vSSGDczOYJr9Lfq6prM1RrkXQjZlLnOkLn0/Kqmwoo=;
        b=sIMX9xdWpPpT876qfGEygVADTIcKzbFZDZr+3+hy+kWKyGoDGIseR2L3sr7Jhm2I8o
         skw3stCeGpRuRw6Wbf4f7XyK9RYlsErpW7GgTqdkYOCtdv5hrdw1ynCK+ezx2s3cg0n3
         0+6nBjsSEie9hIHN6VZ/WtpKUFwvoRevC+zj0spBq4S5VKm2WcX7UXasSsgQJdfCcV2a
         +Nz0h3qLZIUje7o2oOIN6KHoan7jqx4nAoMwB2ajM7xUTUZWk4frLQxOuUQNr2h16sNx
         FI39fithFCtisd2FlgWr9MrYi6cLhVu0C/R7B1tz4KUwrcqimMGV3eVt1XMJYXioG4fB
         CTuw==
X-Gm-Message-State: AOAM533aUDhTNfK/pkM7qGS3eWKY/bEKkvuwrASXKp5YCrB0r48XlddX
	KOHGCHkIEOYmSttRuLYDx9w5gGC3k2cGKNmvGXb+5voDapS6fb0z8wrtHPz8bUxo53wAO0//epf
	ADCL07/LBXJE5H0AqMKP+FYlYGyrp1llnDaSGWuNmr5XjfaSREM4V54mthL3BQB9qlMsF+S2ugZ
	sBlQ9aAC+XRdKiN6WJIE2z65VvsM2U2buTyBBPwxBy/Q==
X-Google-Smtp-Source: ABdhPJxBDef0eUT0z1t8q//zzdyHG87QPv5xnccFgB+JrSjz6+278ewYXPDA3xZvYgRkliioWaA0VrNBuLOc
X-Received: by 2002:a9d:d34:: with SMTP id 49mr1263677oti.205.1614043122873;
        Mon, 22 Feb 2021 17:18:42 -0800 (PST)
Return-Path: <suji.velupillai@broadcom.com>
Received: from suji-Vostro-460.ric.broadcom.com ([192.19.228.250])
        by smtp-relay.gmail.com with ESMTPS id u18sm3944474oot.25.2021.02.22.17.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 17:18:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
From: "Suji Velupillai" <suji.velupillai@broadcom.com>
To: openembedded-core@lists.openembedded.org
Cc: suji.velupillai@broadcom.com,
	jonathan.richardson@broadcom.com,
	scott.branden@broadcom.com
Subject: [OE-core][PATCH] ffmpeg: add ptest install for ffmpeg
Date: Mon, 22 Feb 2021 17:17:43 -0800
Message-Id: <20210223011743.7996-1-suji.velupillai@broadcom.com>
X-Mailer: git-send-email 2.17.1

From: Suji Velupillai <suji.velupillai@broadcom.com>

[YOCTO #5605] Add ptest for ffmpeg

ffmpeg fate test requires full source code and copy of test suite
data to run the full test. Test data is over 1GB thus cannot be
included within Yocto. But it can be mounted on the target during
the test or fate test can run limited tests without test suite
data as well.

Add ptest install such that it will only copy ffmpeg source code
to the target image. The run-ptest script gets necessary
configuration information from the shell environment variables
at run time, which must be set prior to running the test.

  FATEWORKDIR  - working directory to run fate testing,
                 full test with samples requires about 6GB
  FATECONFIG   - ffmpeg config options for fate
  FATESAMPLES  - fate test suite samples directory, optional,
                 but required for full test
  FATEIGNORE_TESTS - list of tests to ignore during fate testing
  FATECLEANUP - set to 1 to cleanup fate compile and install
                directories after testing

Signed-off-by: Suji Velupillai <suji.velupillai@broadcom.com>
---
 .../ffmpeg/ffmpeg/run-ptest                   | 130 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |  16 ++-
 2 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest b/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest
new file mode 100644
index 0000000000..ee866a58b2
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest
@@ -0,0 +1,130 @@
+#!/bin/sh
+
+# Following can be set in the environment to overwrite
+# FATEWORKDIR      - working directory for the fate test, needs about 6GB
+# FATECONFIG       - ffmpeg config options
+# FATESAMPLES      - fate test suite samples directory
+# FATEIGNORE_TESTS - tests to ignore during fate test run (comma separated)
+# FATECLEANUP      - set to 0 or 1 (default) to clean up after fate test
+
+# Following variables are set during Yocto build time
+VERSION=""
+FATECONFIG_DEFAULT=""
+
+CLEANUP_DEFAULT=1
+make=make
+src="$(dirname $(readlink -f $0))"
+
+echo "---------------------------------------------"
+echo "ffmpeg fate test env config info: "
+echo "   workdir       : [${FATEWORKDIR}]"
+echo "   config        : [${FATECONFIG}]"
+echo "   config_default: [${FATECONFIG_DEFAULT}]"
+echo "   samplesdir    : [${FATESAMPLES}]"
+echo "   ignore tests  : [${FATEIGNORE_TESTS}]"
+echo "   clean up      : [${FATECLEANUP}]"
+echo "---------------------------------------------"
+
+die() {
+   echo "$@"
+   echo "ffmpeg fate: FAILED"
+   exit 1
+}
+
+lock() {
+   lock=$1/fate.lock
+   (set -C; exec >$lock) 2>/dev/null || return
+   trap 'rm $lock' EXIT
+}
+
+prep_test_vector() {
+   # If samples directory not provided, run the fate without samples.
+   # In this case, limited test warning printed out to report by fate test.
+   test -f "${FATESAMPLES}/md5sum" || FATESAMPLES=""
+}
+
+prep_work_space() {
+   test -z ${FATEWORKDIR} && die "Error: empty workdir: ${FATEWORKDIR}"
+   test -d ${FATEWORKDIR} || die "Error: invalid workdir: ${FATEWORKDIR}"
+   cd ${FATEWORKDIR}
+   mkdir -p fatetest
+   FATEWORKDIR+="/fatetest"
+}
+
+check_version() {
+   # if version is not set then try to get the version from src
+   [ -z "${VERSION}" ] && VERSION=$(${src}/ffbuild/version.sh ${src})
+}
+
+configure() {
+   cd ${build} || return
+
+   ${src}/configure \
+      --prefix="${install}" \
+      ${FATESAMPLES:+--samples="$FATESAMPLES"} \
+      ${FATEIGNORE_TESTS:+--ignore-tests="$FATEIGNORE_TESTS"} \
+      ${FATECONFIG_DEFAULT:+$FATECONFIG_DEFAULT} \
+      ${FATECONFIG:+$FATECONFIG}
+}
+
+compile() {
+   cd ${build} || return
+   ${make} && ${make} install
+}
+
+fate() {
+   cd ${build} || return
+   ${make} fate
+}
+
+report() {
+   date=$(date -u +%Y%m%d%H%M%S)
+   echo "fate:1:${date}:${VERSION}:$1:$2" >${FATEWORKDIR}/report
+   cat ${build}/ffbuild/config.fate >>${FATEWORKDIR}/report
+   cat ${build}/tests/data/fate/*.rep >>${FATEWORKDIR}/report 2>/dev/null || \
+      for i in ${build}/tests/data/fate/*.rep ; do cat "$i" >>${FATEWORKDIR}/report 2>/dev/null; done
+   echo "fate test logs are in [${FATEWORKDIR}]"
+}
+
+clean() {
+   [ -z "${FATECLEANUP}" ] && FATECLEANUP=${CLEANUP_DEFAULT}
+   if [[ "${FATECLEANUP}" -eq 1 ]]; then
+      echo "Cleaning up fate build and install directories"
+      rm -rf ${build} ${install}
+   fi
+}
+
+fail() {
+    report "$@"
+    clean
+    echo "ffmpeg fate: FAILED"
+    exit 1
+}
+
+prep_work_space
+prep_test_vector
+
+lock ${FATEWORKDIR} || die "${FATEWORKDIR} locked"
+cd ${FATEWORKDIR} || die "cd ${FATEWORKDIR} failed"
+build="${FATEWORKDIR}/build"
+install="${FATEWORKDIR}/install"
+mkdir -p $build
+mkdir -p $install
+PATH="$install/bin:$PATH"
+LD_LIBRARY_PATH="$install/lib"
+
+check_version
+echo "configuring for fate test"
+configure >${FATEWORKDIR}/configure.log 2>&1 || fail 3 "error in fate configuring stage"
+echo "compiling fate test"
+compile   >${FATEWORKDIR}/compile.log   2>&1 || fail 2 "error in fate compiling stage"
+echo "fate testing in progress"
+fate      >${FATEWORKDIR}/test.log  2>&1 || fail 1 "error in fate testing stage"
+echo "generate test report"
+report 0 success
+clean
+if [ $? == 0 ]; then
+    echo "ffmpeg fate: PASSED"
+else
+    echo "ffmpeg fate: FAILED"
+fi
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
index bd21552332..c374694956 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
+           file://run-ptest \
            file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://CVE-2020-35964.patch \
@@ -43,7 +44,7 @@ PROVIDES = "libav libpostproc"
 
 DEPENDS = "nasm-native"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
                    alsa bzlib gpl lzma pic pthreads shared theora x264 zlib \
@@ -141,6 +142,19 @@ do_compile_prepend_class-target() {
         sed -i -e "s,${WORKDIR},,g" ${B}/config.h
 }
 
+RDEPENDS_${PN}-ptest += "make"
+
+do_install_ptest() {
+    cd ${S}
+    VERSION="`ffbuild/version.sh .`"
+    tar -c --exclude='.git*' --exclude='oe-*' . | ( cd ${D}${PTEST_PATH} && tar -xf - )
+    cd -
+
+    FATECONF="${PACKAGECONFIG_CONFARGS} ${EXTRA_PTESTCONF}"
+    sed -i "s|FATECONFIG_DEFAULT=\"\"|FATECONFIG_DEFAULT=\"${FATECONF}\"|g" ${D}${PTEST_PATH}/run-ptest
+    sed -i "s|VERSION=\"\"|VERSION=\"$VERSION\"|g" ${D}${PTEST_PATH}/run-ptest
+}
+
 PACKAGES =+ "libavcodec \
              libavdevice \
              libavfilter \
-- 
2.17.1

