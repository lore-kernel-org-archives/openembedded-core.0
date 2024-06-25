Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56208C30659
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 02:03:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.160561.1719280991750252748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 19:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6906a44fcf=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P1oaoB015157
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 02:03:11 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywnk5t8au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 02:03:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 19:03:09 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 19:03:08 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 1/1] glibc: fix fortran header file conflict for arm
Date: Tue, 25 Jun 2024 10:02:49 +0800
Message-ID: <20240625020249.767760-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625020249.767760-1-kai.kang@windriver.com>
References: <20240625020249.767760-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vSm730uRyxJR006bgqiKxQu65gG4rgT8
X-Proofpoint-GUID: vSm730uRyxJR006bgqiKxQu65gG4rgT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_22,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406250015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 02:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201118

From: Kai Kang <kai.kang@windriver.com>

There is a file conflict for arm when multilib enabled:

| Error: Transaction test error:
|   file /usr/include/finclude/math-vector-fortran.h conflicts between attempted installs of
    lib32-libc6-dev-2.39+git0+312e159626-r0.armv7at2hf_neon and libc6-dev-2.39+git0+312e159626-r0.cortexa72

Install math-vector-fortran.h to the gfortran default search directory
which is arch specific to avoid the conflict.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 0c5e3b4c3d..3352f3e2f5 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -39,7 +39,7 @@ FILES:sln = "${base_sbindir}/sln"
 FILES:${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
 FILES:libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
-FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
+FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal ${libdir}/gcc/${TARGET_SYS}/*/finclude"
 RDEPENDS:${PN}-dev = "linux-libc-headers-dev"
 FILES:${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
 FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_system_unitdir}/nscd* ${nonarch_libdir}/tmpfiles.d/nscd.conf \
@@ -169,6 +169,12 @@ do_install_armmultilib () {
 	oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys/user.h
 }
 
+do_install_armmultilib:append:class-target() {
+    gcc_version=$($CC -dumpversion)
+    mkdir -p ${D}${libdir}/gcc/${TARGET_SYS}/${gcc_version}/finclude
+    mv ${D}${includedir}/finclude/math-vector-fortran.h ${D}${libdir}/gcc/${TARGET_SYS}/${gcc_version}/finclude/
+    rmdir --ignore-fail-on-non-empty ${D}${includedir}/finclude
+}
 
 LOCALESTASH = "${WORKDIR}/stashed-locale"
 bashscripts = "mtrace sotruss xtrace"
-- 
2.34.1


