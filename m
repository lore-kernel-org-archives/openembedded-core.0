Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1F7D31A0C
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 04:43:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3701.1768365802707851639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 20:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OElwI+j+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5474771f1a=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E4OgHd1072796
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 20:43:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=0n68VOVugFXVw4bFCffh
	hQe4LE6nvNQoHrndh0bjiVs=; b=OElwI+j+NZgZ7WFgrKBECvO/TqzURKp0Ufif
	OEBZIVg0+kP1apFvjbZtqBonBJnn9XPaXDSA1geYXnDSSpCt+fhMn88nB4RmonIy
	rlWZWwRQVQDyaxPQwc3epiFw7ZBuuh6MVqkeqpsTFdzfyp19prxWLkHtYxIYeqpr
	b3IA3yFm17Mbk33A4/oveLztQkfFz+DClZ+7HfKR3IFycYRK2dAtfg5tBKYgwaA/
	4npV+siM1I6ug7Dq+Jn5yoe+fwlvkxT4HM6BVvu59jS93G+/iW4i2+ZiXvsP8Fy1
	iHhBAaIdQpDathEHnoA2+KdfJkd5U/kIGWWPYDCJipjtj8coQA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5fur9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 20:43:21 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 13 Jan 2026 20:43:21 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 13 Jan 2026 20:43:20 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] procps: support ptest
Date: Wed, 14 Jan 2026 12:43:19 +0800
Message-ID: <20260114044319.2830540-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=69671ee9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=p0WdMEafAAAA:8
 a=JKThXVu0WzubKF0lb_0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAzMyBTYWx0ZWRfX+/xl658uKwHB
 56fNAifW+ijm5JNAI5tRCGTW74ktaSRqOXamDKzHNHEL3I7TG9uBpXqk8ZVh7t3dntaCCnWBKgR
 QK0xikBfAqkj/RgI2U7EWMnhpgJVGnxhKZVrS8XkLHvXKDbi5UIQ6u4pC+uk0yr+bJ26JpFGvww
 fFqjsVkemcwIuNjJKrBeGTGQMl8G3j4l20qTXQvL+fircYjFdvGAsUXzqghbA//SLcwMAW+2APu
 IZh2b7w8wOqlA2Cf6koM6f/8n3ZmOWVtRWqRSPgQcBabNmGTVb9Iy27A6G2Xi/XfBIZ+Qu9oGTl
 QLnQEvk6v5wDAqLnUgu6U/a3eXyOoSFHVugWDC2yoBiWkNaN8qfSP5mGD2LvMyCJXQJGXUPue3J
 I6FGc9ayFVwMgey9+ZgH1FaI31pN+QHbPYRPQjTdqkn/vfm7r8qw71wIgwdZqatSs/ocO0XA5gd
 SpmjAIvyqB9Evirc/9Q==
X-Proofpoint-ORIG-GUID: o_Jh_B7Q-HgWg5kNNJh38t_p_iZIaNTK
X-Proofpoint-GUID: o_Jh_B7Q-HgWg5kNNJh38t_p_iZIaNTK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 04:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229302

From: Changqing Li <changqing.li@windriver.com>

support ptest for procps, procps's testsuite use DejaGnu test framework.
The testsuite is expected to run during build time, this implementation
create the same folder structure as the testsuite expected to make it
can work well.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/procps/procps/run-ptest |  7 +++
 meta/recipes-extended/procps/procps_4.0.5.bb  | 50 ++++++++++++++++++-
 3 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/procps/procps/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index fff2947177..0a4ff49ee3 100644
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
diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recipes-extended/procps/procps/run-ptest
new file mode 100644
index 0000000000..c999876bd8
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
index 0e0e06f0d2..b4697f7ce3 100644
--- a/meta/recipes-extended/procps/procps_4.0.5.bb
+++ b/meta/recipes-extended/procps/procps_4.0.5.bb
@@ -10,11 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "ncurses"
 
-inherit autotools gettext pkgconfig update-alternatives
+inherit autotools gettext pkgconfig update-alternatives ptest
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
            file://sysctl.conf \
            file://top_large_pid_fix.patch \
+           file://run-ptest \
            "
 SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
 
@@ -47,8 +48,51 @@ do_install:append () {
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
+
+CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
 bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
 base_bindir_progs += "kill pidof ps watch"
 base_sbindir_progs += "sysctl"
@@ -80,6 +124,8 @@ RDEPENDS:${PN} += "${PROCPS_PACKAGES}"
 RDEPENDS:${PN}-ps += "${PN}-lib"
 RDEPENDS:${PN}-sysctl += "${PN}-lib"
 
+RDEPENDS:${PN}-ptest += "dejagnu bash glibc-utils"
+
 FILES:${PN}-lib = "${libdir}"
 FILES:${PN}-ps = "${base_bindir}/ps.${BPN}"
 FILES:${PN}-sysctl = "${base_sbindir}/sysctl.${BPN} ${sysconfdir}/sysctl.conf ${sysconfdir}/sysctl.d"
-- 
2.34.1


