Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B1FD4A619
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:27:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2395.1768555628414868482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XKAH9YXv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5476979829=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G5diY61604995
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XxXvebgrCb8thv6jrQ2Z
	eB/5Bw4cWM4URYN2nNxSY+g=; b=XKAH9YXvRYLedr295ChYIfWqz3U+dOUVNR4u
	T45taiVNy470rOAnljsrOMbdmdklf/ndLHkCzkKj0bluEOXUhCh1UeWOOea/UP4J
	KsN3vCySx73Znd+3/psagxnPBkG13HtaNuZK82A9vlZlKsbhN+mkywVoW5jzD7YH
	h9jMDlclN4yW7i1DpKpkFSmvtJcOC2n1w0DKi8Lz4CJ+SktpYOoLkhGV+V1LkwLe
	WVZrvQbqzLUb1nDv59EMdPEq3PtqvpcRU9VjBXcDKED9WAq86EiHZ88/jOAnB1eo
	d1i2MEJkk6Pxdk+RpOwN9mi4VEhXEP4Xyhtr/SXsnUyugkHtTg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqddvr8sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:27:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 16 Jan 2026 01:27:05 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 16 Jan 2026 01:27:05 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] procps: support ptest when TCLIBC is glibc
Date: Fri, 16 Jan 2026 17:27:04 +0800
Message-ID: <20260116092704.2465341-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2OSBTYWx0ZWRfX8LsayPZHrBCH
 K4E107mAMM53+vkK08Xu7JDGiO6vD6y+f3Idfx6EuwJ3+5DplPvx3AdS4abLq8uUhM5B4lX/dwu
 sNFoieR2vVXY8ac5dB1C3GVuLMibnewte0Cysuh08rbPTKpXgFWG/XQlknf+jFFM80x0+8Pupgf
 6mP/ONbAuDmrGOP5TP+ASZopml11e95+m0eVw524+0e04ktwpZZFl/RLOvctwVUpSK9q03tY+vi
 CpPTN1fr7Ec/UkON81K/7qAHOCoUDsrWuay+OfOmlXjWEG3y+wUT3anDtU0jt6j29gAas90gsTF
 Cs0wpRR12SSVnPixlrcahJRhqunFPW0WpB3X2rK12emul0FmCir3jC+735rwvOqAHmSvcyCtSAQ
 DIhqVYpFDtjg0JmqN+DfS3UrxMiZAp+XajC0c8J2o4GcuxCE2nqZML0dKR8fsXYyxRed2WodVbG
 lfyXz1E1qfcGLlTM2Pw==
X-Proofpoint-GUID: n7QnqT8R6ryUzARSvaK4ebe1PxhEDG9x
X-Proofpoint-ORIG-GUID: n7QnqT8R6ryUzARSvaK4ebe1PxhEDG9x
X-Authority-Analysis: v=2.4 cv=NqvcssdJ c=1 sm=1 tr=0 ts=696a046b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=p0WdMEafAAAA:8
 a=6o7CLz4owJiLX0Cox44A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229529

From: Changqing Li <changqing.li@windriver.com>

* support ptest for procps TCLIBC is glibc. The configure.ac only match
  LINUX as "linux-gnu", we can patch it to make test can run on musl lib
system, but the upstream testsuite should only run on gnu libc host,
some test cases only suitable for glibc, eg: Some of the error messages
for free command on musl system is not the same as glibc system, which
will make test failed. In order to avoid some other unexpected failure,
just support ptest for glibc.

* procps's testsuite use DejaGnu test framework.  The testsuite is
  expected to run during build time, this implementation create the same
folder structure as the testsuite expected to make it can work well.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  2 +
 meta/recipes-extended/procps/procps/run-ptest |  7 +++
 meta/recipes-extended/procps/procps_4.0.5.bb  | 51 ++++++++++++++++++-
 3 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/procps/procps/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index fff2947177..2391224527 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -57,6 +57,7 @@ PTESTS_FAST = "\
     nettle \
     opkg \
     popt \
+    procps \
     python3-atomicwrites \
     python3-attrs \
     python3-bcrypt \
@@ -97,6 +98,7 @@ PTESTS_FAST:remove:mips64 = "qemu"
 PTESTS_PROBLEMS:append:mips64 = " qemu"
 PTESTS_FAST:remove:riscv32 = "qemu"
 PTESTS_PROBLEMS:append:riscv32 = " qemu"
+PTESTS_FAST:remove:libc-musl = "procps"
 
 PTESTS_SLOW = "\
     apr \
diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recipes-extended/procps/procps/run-ptest
new file mode 100644
index 0000000000..0a74907fcc
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+cd ./testsuite
+for tool in @DEJATOOL@;do
+    runtest -a --tool $tool --outdir ../log
+done
+
diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
index 0e0e06f0d2..d39bb5062f 100644
--- a/meta/recipes-extended/procps/procps_4.0.5.bb
+++ b/meta/recipes-extended/procps/procps_4.0.5.bb
@@ -10,12 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "ncurses"
 
-inherit autotools gettext pkgconfig update-alternatives
+inherit autotools gettext pkgconfig update-alternatives ${@bb.utils.contains('TCLIBC', 'glibc', 'ptest', '', d)}
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
            file://sysctl.conf \
            file://top_large_pid_fix.patch \
            "
+SRC_URI:append:libc-glibc = " file://run-ptest"
+
 SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
 
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they
@@ -47,8 +49,51 @@ do_install:append () {
         fi
 }
 
-CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
+do_compile_ptest() {
+    oe_runmake -C testsuite site.exp
+    oe_runmake src/tests/test_process src/tests/test_strutils  src/tests/test_fileutils src/tests/test_shm
+    DEJATOOL=$(make -C testsuite -s -f Makefile -f - <<'EOF'
+all:
+	$(info $(DEJATOOL))
+EOF
+)
+    echo $DEJATOOL > ${B}/testsuite/.dejatool
+}
+
+do_install_ptest() {
+     install -d ${D}${PTEST_PATH}/testsuite
+     install -d ${D}${PTEST_PATH}/src
+     install -d ${D}${PTEST_PATH}/log
+
+     cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
+     cp -r ${B}/testsuite/* ${D}${PTEST_PATH}/testsuite/
+     cp -r ${B}/src/tests ${D}${PTEST_PATH}/src/
+
+     rm -rf ${D}${PTEST_PATH}/testsuite/Makefile*
+     rm -rf ${D}${PTEST_PATH}/testsuite/README
+     find ${D}${PTEST_PATH}/testsuite/ -type f -name "*.o" -exec rm -f {} +
+     find ${D}${PTEST_PATH}/src/ -type f -name "*.o" -exec rm -f {} +
+
+     sed -i -e "/set srcdir/c\set srcdir ${PTEST_PATH}/testsuite" \
+            -e "/set objdir/c\set objdir ${PTEST_PATH}/testsuite" ${D}${PTEST_PATH}/testsuite/site.exp
+
+     DEJATOOL=$(cat ${B}/testsuite/.dejatool)
+     sed -i -e "s#@DEJATOOL@#$DEJATOOL#g" ${D}${PTEST_PATH}/run-ptest
+     for p in $DEJATOOL; do
+        if [ "$p" = "ps" ]; then
+            install -d ${D}${PTEST_PATH}/src/ps
+            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscommand
+        elif [ "$p" = "sysctl" ]; then
+            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
+        elif [ "$p" = "kill" ] || [ "$p" = "pidof" ] || [ "$p" = "watch" ]; then
+            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
+        else
+            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
+        fi
+     done
+}
 
+CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
 bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
 base_bindir_progs += "kill pidof ps watch"
 base_sbindir_progs += "sysctl"
@@ -80,6 +125,8 @@ RDEPENDS:${PN} += "${PROCPS_PACKAGES}"
 RDEPENDS:${PN}-ps += "${PN}-lib"
 RDEPENDS:${PN}-sysctl += "${PN}-lib"
 
+RDEPENDS:${PN}-ptest += "dejagnu bash glibc-utils"
+
 FILES:${PN}-lib = "${libdir}"
 FILES:${PN}-ps = "${base_bindir}/ps.${BPN}"
 FILES:${PN}-sysctl = "${base_sbindir}/sysctl.${BPN} ${sysconfdir}/sysctl.conf ${sysconfdir}/sysctl.d"
-- 
2.34.1


