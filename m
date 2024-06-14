Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92099C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 23:22:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.342.1718407359365939910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 16:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6895928f3b=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EMgTeX001524;
	Fri, 14 Jun 2024 16:21:37 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymptg6gnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 14 Jun 2024 16:21:37 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 16:21:36 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 16:21:36 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/2] gfortran: update runtime dependencies
Date: Sat, 15 Jun 2024 07:21:30 +0800
Message-ID: <20240614232131.1036271-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614232131.1036271-1-kai.kang@windriver.com>
References: <20240614232131.1036271-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gx3Tv8G3bEt8DDCBBWT2lvDBzJ3R6j7A
X-Proofpoint-GUID: gx3Tv8G3bEt8DDCBBWT2lvDBzJ3R6j7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_17,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 mlxlogscore=863 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406140164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 23:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200663

From: Kai Kang <kai.kang@windriver.com>

It fails to run both `gcc` and `gfortran` with errors:

| root@qemux86-64:~# x86_64-poky-linux-gcc a.c
| x86_64-poky-linux-gcc: fatal error: cannot execute 'as': posix_spawnp: No such file or directory

then add binutils which provides `as` to RDEPENDS of gcc.

libgfortran-dev provides libgfortran.spec which required by gfortran:

| root@qemux86-64:~# gfortran hello.f95
| gfortran: fatal error: cannot read spec file 'libgfortran.spec': No such file or directory

And gcc provides liblto_plugin.so:

| root@qemux86-64:~# gfortran hello.f95
| gfortran: fatal error: '-fuse-linker-plugin', but liblto_plugin.so not found

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 82da5ef82b..daf24741aa 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -34,7 +34,7 @@ PACKAGES = "\
     g++ g++-symlinks \
     cpp cpp-symlinks \
     g77 g77-symlinks \
-    gfortran gfortran-symlinks \
+    ${@bb.utils.contains('FORTRAN', ',fortran', 'gfortran gfortran-symlinks', '', d)} \
     gcov gcov-symlinks \
     ${PN}-doc \
     ${PN}-dev \
@@ -61,7 +61,7 @@ RRECOMMENDS:${PN} += "\
     libssp \
     libssp-dev \
 "
-RDEPENDS:${PN} += "cpp"
+RDEPENDS:${PN} += "binutils cpp"
 
 FILES:${PN}-dev = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
@@ -94,10 +94,15 @@ RRECOMMENDS:g77 = "\
     libg2c-dev \
 "
 
+INSANE_SKIP:gfortran += "dev-deps"
 FILES:gfortran = "\
     ${bindir}/${TARGET_PREFIX}gfortran \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
 "
+RDEPENDS:gfortran = "\
+    gcc \
+    libgfortran-dev \
+"
 RRECOMMENDS:gfortran = "\
     libquadmath \
     libquadmath-dev \
-- 
2.34.1


