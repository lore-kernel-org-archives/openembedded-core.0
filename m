Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E41CD358D8
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 07:48:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10497.1769672928905234720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 23:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NFMYD7jG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6489911ce8=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T5Acmg2637028
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 07:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=/Ei7dDolcdEmXixYsjkUMdV507JFO5rjYMYbMI4+yNY=; b=NFMYD7jGY3HX
	siLFn1N9rACFKG7tqQz4GrRjZWwoUg4MguG29X2spqtRiiTILRYGaZHt6ZH21EkX
	SW+nCoCdipRrBwFGTMgdLNYqh6syZNkEvwyvmslVcIUv5aWmhs/VmgDdz0JiGSK0
	EDpb6hvsb8P63o9ib3HjQCS7MxA2q1+/holeLIoiUZgI15Vuh3qzXU0+YuQmURL/
	83C3SMG9wayVt78qKH4G9wCVhBF1WtAQphqMaDX562XTPIO1SVfwMJIYC0J12MZR
	o1ACaYV2paR4UMsf66h8hcNdXKzNcMPYeL5eHJtVz6hPg+LPB/pjQrwvd+uAf7BW
	brNRWan6Wg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwjg90v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 07:48:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 28 Jan 2026 23:48:46 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 28 Jan 2026 23:48:45 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V4] procps: support ptest when TCLIBC is glibc
Date: Thu, 29 Jan 2026 15:48:44 +0800
Message-ID: <20260129074844.2927936-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9b4c9e13e430e3cbf0a45fe15b5a361b63a2b250.camel@linuxfoundation.org>
References: <9b4c9e13e430e3cbf0a45fe15b5a361b63a2b250.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0NSBTYWx0ZWRfXzBe/fhe+CSJH
 7O7QMoesAMtZ+4ddiO1mgOUYwwG2TEJFV2mwaD4WeYm7OziD3h74xXsycsLj0H0vGp1qTpvrOyl
 Zx3fxNxCrX2cUVK58WDGCW/wgnSWV7cRKuR+UrKKgoAqPmKWPbPCEoO3QBjrd1TY2U8xLRQ65A7
 E1k4ToIUmZ4Z1P9pHpiQ8Z7N53FnzSl0TwM43bPmEUCIsmmsRx4p+lPWYTmnsaaGlNgaKE/IVMX
 KEF9hOxMOTRpORMncXlngi7VRUPlLfOO/DM6zpgpWBjD8E9wVY5fq6RDOi9NtcrrEvANnAlrAyH
 q4zeOGzp7O+Al9l5Wo0q1rILHDt7uEs2m0gynqnE5HEU0BWB7bMjgw/+5LNdc+k1Qc3yZs1X9Kn
 sGRdVdGvV96YBj1hm5DO+Vm8pnJG0cjJLEDcj5NXrODRXEVjoUJq9n/c5v9Zo0fbWwvBRwQSygJ
 DN5rVKa/WKxN5GheR9Q==
X-Authority-Analysis: v=2.4 cv=I7hohdgg c=1 sm=1 tr=0 ts=697b10df cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8
 a=0m6fdvx-0sT87eH2KvsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rj6N_nQQ43_2VNEpSnP3tm5TUQFQgCbP
X-Proofpoint-ORIG-GUID: rj6N_nQQ43_2VNEpSnP3tm5TUQFQgCbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 07:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230122

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

* Two pmap test cases may randomly run failed, so set it as xfail, and
  open a issue upstream

[1] https://gitlab.com/procps-ng/procps/-/issues/409

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  2 +
 meta/recipes-extended/procps/procps/run-ptest | 24 ++++++++
 meta/recipes-extended/procps/procps_4.0.5.bb  | 60 ++++++++++++++++++-
 3 files changed, 84 insertions(+), 2 deletions(-)
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
index 0000000000..7e132653b0
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+# Run testsuite which use dejagnu
+cd ./testsuite
+for tool in @DEJATOOL@; do
+    runtest -a --tool $tool --outdir ../log
+done
+cd -
+
+# Run test programs not used by dejagnu but run directly
+for p in @TESTS@; do
+    ./src/tests/"$p" > ./log/"$p".log 2>&1
+    case "$?" in
+        0)
+            echo "PASS: $p"
+            ;;
+        77)
+            echo "SKIP: $p"
+            ;;
+        *)
+            echo "FAIL: $p"
+            ;;
+    esac
+done
diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
index 0e0e06f0d2..bccfee1de9 100644
--- a/meta/recipes-extended/procps/procps_4.0.5.bb
+++ b/meta/recipes-extended/procps/procps_4.0.5.bb
@@ -10,11 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "ncurses"
 
-inherit autotools gettext pkgconfig update-alternatives
+inherit autotools gettext pkgconfig update-alternatives ${@bb.utils.contains('TCLIBC', 'glibc', 'ptest', '', d)}
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
            file://sysctl.conf \
            file://top_large_pid_fix.patch \
+           file://run-ptest \
            "
 SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
 
@@ -47,8 +48,61 @@ do_install:append () {
         fi
 }
 
-CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
+do_compile_ptest() {
+    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        oe_runmake $p
+    done
+    oe_runmake -C testsuite site.exp
+}
+
+do_install_ptest() {
+     install -d ${D}${PTEST_PATH}/testsuite
+     install -d ${D}${PTEST_PATH}/src/tests
+     install -d ${D}${PTEST_PATH}/log
+
+     install -m644 ${B}/testsuite/site.exp ${D}${PTEST_PATH}/testsuite/
+     for p in $(makefile-getvar ${B}/testsuite/Makefile noinst_PROGRAMS); do
+         install -m755 ${B}/testsuite/$p ${D}${PTEST_PATH}/testsuite/
+     done
+     cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
+
+     for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS);do
+         case "$p" in
+             src/tests/*)
+                 install -m 0755 ${B}/$p ${D}${PTEST_PATH}/src/tests/ ;;
+             library/tests/*)
+                 install -m 0755 ${B}/library/tests/.libs/$(basename $p)  ${D}${PTEST_PATH}/src/tests/ ;;
+         esac
+     done
+
+     tests=""
+     for p in $(makefile-getvar ${B}/Makefile TESTS); do
+         tests="$tests $(basename $p)"
+     done
+     sed -i -e "s#@TESTS@#$tests#" ${D}${PTEST_PATH}/run-ptest
+
+     sed -i -e "/set srcdir/c\set srcdir ${PTEST_PATH}/testsuite" \
+            -e "/set objdir/c\set objdir ${PTEST_PATH}/testsuite" ${D}${PTEST_PATH}/testsuite/site.exp
+
+     sed -i -e "s#@DEJATOOL@#$(makefile-getvar ${B}/testsuite/Makefile DEJATOOL)#" ${D}${PTEST_PATH}/run-ptest
+     for p in $(makefile-getvar ${B}/testsuite/Makefile DEJATOOL); do
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
 
+     sed -i -e '/set test "pmap X pid pid has same total"/a \setup_xfail *-*-linux*' \
+            -e '/set test "pmap XX pid pid has same total"/a \setup_xfail *-*-linux*' ${D}${PTEST_PATH}/testsuite/pmap.test/pmap.exp
+}
+
+CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
 bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
 base_bindir_progs += "kill pidof ps watch"
 base_sbindir_progs += "sysctl"
@@ -80,6 +134,8 @@ RDEPENDS:${PN} += "${PROCPS_PACKAGES}"
 RDEPENDS:${PN}-ps += "${PN}-lib"
 RDEPENDS:${PN}-sysctl += "${PN}-lib"
 
+RDEPENDS:${PN}-ptest += "dejagnu glibc-utils"
+
 FILES:${PN}-lib = "${libdir}"
 FILES:${PN}-ps = "${base_bindir}/ps.${BPN}"
 FILES:${PN}-sysctl = "${base_sbindir}/sysctl.${BPN} ${sysconfdir}/sysctl.conf ${sysconfdir}/sysctl.d"
-- 
2.34.1


