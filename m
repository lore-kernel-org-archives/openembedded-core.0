Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B581BCA6CB6
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:58:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6556.1769504292557017152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 00:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O1sAiUOy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54872b1b3d=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4tY8w1862637
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 08:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=tpk4LPFkw2MGmcpdoiigASORctUOQQ8ExMN4wPeDb34=; b=O1sAiUOy1XCV
	C36fTTxZU3hgHmcqE9xCDim/SUiMPQrRXpgZFw4XWqAJR4c2x5MBGgXvzTVd8rTI
	8gTRktiGKnt4PHf8nsi262Xr+ZbwpAO3z7lPbDSO/oXa3vhVzg0AXHheObu1bCNC
	BWKZ/MUCTbItpdZTs/wjtKI0ZnUtIO7xGqysJ+niA7LAKrg2sNbJBDCZaGQ3Xhji
	l7glvwIXrymd9Y5ds8zuo6rBFsBawfpqf0gk6NHC7rZVGtMmmWUA1+J8LtX58QvE
	DGOAFKLbDAZXPq1vqfHJu5nUpwRU2Pob2+wx0x7JBnOGBx+XVPUAHR/lDXj4SSED
	TVc1NM3Vjw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvn28aw9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 08:58:11 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 27 Jan 2026 00:58:09 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 27 Jan 2026 00:58:09 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] procps: support ptest when TCLIBC is glibc
Date: Tue, 27 Jan 2026 16:58:08 +0800
Message-ID: <20260127085808.1980602-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <48503D06-1C65-407A-8EE8-B2E5099C797C@arm.com>
References: <48503D06-1C65-407A-8EE8-B2E5099C797C@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3MiBTYWx0ZWRfX+WHovL0ZOpMa
 +mcXyZ7pDPtpFeE0vUmhnr77mX2LB4r5aLj1f+NrEBFhBkZaYspXa10bgtmB/ljF/D6ifAXU4N8
 gcHsGXRmMs47GAObfY0LX3mudWU3iPLEg0QmJJx/6+1suK4f0cbTbUw/3+nqTuhzVqUmr0E0KgO
 pWzA2ZZQfGCqlpFp6mkPqmjyuyVHr9s5MNHS84mPqttvWAR2RUbG/XKjY9mhIp8ckNM8bZPHLN3
 UMtsocxuTduj4ngFVoBOi/bXS9QxL45qMe9i8ViHp3IOo1qowe3b5A3nvfpwYXiQ6x2Q+9dc1Vu
 KPN/GifuCQ/lZUgyybjgm90AuGBBkaaw1H8Z+u+46ozM/6oYNx/6FrajFI/VVWlkMv5kfXBtOI7
 VOC44V0u8CMkTBkzEjE80oS1nNrQC6tihhbiqG/qeT+bxYSzQitVf1mD/7KYh1BHKrOQ0wDVJ0M
 hshrNQj8W/tFRi1Zb1w==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69787e23 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=p0WdMEafAAAA:8
 a=6o7CLz4owJiLX0Cox44A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4PArP-2ibYErtz4WMJSZBr6hxo00bdtf
X-Proofpoint-GUID: 4PArP-2ibYErtz4WMJSZBr6hxo00bdtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 08:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230032

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
 meta/recipes-extended/procps/procps/run-ptest | 24 ++++++++
 meta/recipes-extended/procps/procps_4.0.5.bb  | 57 ++++++++++++++++++-
 3 files changed, 81 insertions(+), 2 deletions(-)
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
index 0e0e06f0d2..cddb79cf10 100644
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
 
@@ -47,8 +48,58 @@ do_install:append () {
         fi
 }
 
-CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
+do_compile_ptest() {
+    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        oe_runmake $p
+    done
+    oe_runmake -C testsuite site.exp
+}
 
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
+}
+
+CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
 bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
 base_bindir_progs += "kill pidof ps watch"
 base_sbindir_progs += "sysctl"
@@ -80,6 +131,8 @@ RDEPENDS:${PN} += "${PROCPS_PACKAGES}"
 RDEPENDS:${PN}-ps += "${PN}-lib"
 RDEPENDS:${PN}-sysctl += "${PN}-lib"
 
+RDEPENDS:${PN}-ptest += "dejagnu glibc-utils"
+
 FILES:${PN}-lib = "${libdir}"
 FILES:${PN}-ps = "${base_bindir}/ps.${BPN}"
 FILES:${PN}-sysctl = "${base_sbindir}/sysctl.${BPN} ${sysconfdir}/sysctl.conf ${sysconfdir}/sysctl.d"
-- 
2.34.1


