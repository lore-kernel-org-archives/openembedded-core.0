Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DFCC41513
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 23:21:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.353.1718407299979874498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 16:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6895928f3b=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EMdctg004466;
	Fri, 14 Jun 2024 16:21:39 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk2embh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 14 Jun 2024 16:21:38 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 16:21:38 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 16:21:37 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/2] gcc: remove g77/f77
Date: Sat, 15 Jun 2024 07:21:31 +0800
Message-ID: <20240614232131.1036271-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614232131.1036271-1-kai.kang@windriver.com>
References: <20240614232131.1036271-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: v5YJCBWgtq9VUqMqHl86dILph9TvWzXC
X-Proofpoint-GUID: v5YJCBWgtq9VUqMqHl86dILph9TvWzXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_17,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406140164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 23:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200662

From: Kai Kang <kai.kang@windriver.com>

g77/f77 has been removed from gcc 4.0.0 via commit:

* b4117c30610 Makefile.def, [...]: Remove all mention of libf2c.

When set

    FORTRAN = ",f77"

it complains with error:

| The following requested languages could not be built: f77
| Supported languages are: c,c,c++,fortran,go,lto,m2,objc,obj-c++

So remove g77/f77 from gcc recipes.

[1]: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b4117c30610

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gcc/gcc-configure-common.inc              |  2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc     | 13 +------------
 meta/recipes-devtools/gcc/gcc-target.inc      | 19 -------------------
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index dba25eb754..d77b2ec3d1 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -6,7 +6,7 @@ require gcc-shared-source.inc
 # These can be overridden by the version specific .inc file.
 
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
-FORTRAN ?= ",f77"
+FORTRAN ?= ",fortran"
 LANGUAGES ?= "c,c++${FORTRAN}"
 
 EXTRA_OECONF_BASE ?= ""
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 89b0bebcfb..ad9798530f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -43,7 +43,7 @@ RUNTIMELIBSSP ?= ""
 RUNTIMELIBSSP:mingw32 ?= "libssp"
 
 RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
-    ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
+    ${@bb.utils.contains('FORTRAN', ',fortran', 'libquadmath', '', d)} \
 "
 # Only build libstdc++ for newlib
 RUNTIMETARGET:libc-newlib = "libstdc++-v3"
@@ -164,8 +164,6 @@ PACKAGES = "\
     libstdc++-precompile-dev \
     libstdc++-dev \
     libstdc++-staticdev \
-    libg2c \
-    libg2c-dev \
     libssp \
     libssp-dev \
     libssp-staticdev \
@@ -196,15 +194,6 @@ FILES:${PN}-dbg += "\
 # So it needs to be added manually to images sadly.
 # RDEPENDS:${PN}-dbg += "python3-datetime"
 
-FILES:libg2c = "${target_libdir}/libg2c.so.*"
-SUMMARY:libg2c = "Companion runtime library for g77"
-FILES:libg2c-dev = "\
-    ${libdir}/libg2c.so \
-    ${libdir}/libg2c.a \
-    ${libdir}/libfrtbegin.a \
-"
-SUMMARY:libg2c-dev = "Companion runtime library for g77 - development files"
-
 FILES:libstdc++ = "${libdir}/libstdc++.so.*"
 SUMMARY:libstdc++ = "GNU standard C++ library"
 FILES:libstdc++-dev = "\
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index daf24741aa..7e1d2dfad6 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -33,7 +33,6 @@ PACKAGES = "\
     ${PN} ${PN}-plugins ${PN}-symlinks \
     g++ g++-symlinks \
     cpp cpp-symlinks \
-    g77 g77-symlinks \
     ${@bb.utils.contains('FORTRAN', ',fortran', 'gfortran gfortran-symlinks', '', d)} \
     gcov gcov-symlinks \
     ${PN}-doc \
@@ -81,19 +80,6 @@ FILES:${PN}-plugins = "\
 "
 ALLOW_EMPTY:${PN}-plugins = "1"
 
-FILES:g77 = "\
-    ${bindir}/${TARGET_PREFIX}g77 \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
-"
-FILES:g77-symlinks = "\
-    ${bindir}/g77 \
-    ${bindir}/f77 \
-"
-RRECOMMENDS:g77 = "\
-    libg2c \
-    libg2c-dev \
-"
-
 INSANE_SKIP:gfortran += "dev-deps"
 FILES:gfortran = "\
     ${bindir}/${TARGET_PREFIX}gfortran \
@@ -203,11 +189,6 @@ do_install () {
 	# Not sure why we end up with these but we don't want them...
 	rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
 
-	# Symlinks so we can use these trivially on the target
-	if [ -e ${TARGET_PREFIX}g77 ]; then
-		ln -sf ${TARGET_PREFIX}g77 g77 || true
-		ln -sf g77 f77 || true
-	fi
 	if [ -e ${TARGET_PREFIX}gfortran ]; then
 		ln -sf ${TARGET_PREFIX}gfortran gfortran || true
 		ln -sf gfortran f95 || true
-- 
2.34.1


