Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C366C25B4F
	for <webhook@archiver.kernel.org>; Sat, 11 May 2024 01:50:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6149.1715392202565360416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 18:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58612e8482=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44B1loj2014871
	for <openembedded-core@lists.openembedded.org>; Sat, 11 May 2024 01:50:01 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1y9x002g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 11 May 2024 01:50:01 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 10 May 2024 18:50:00 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Fri, 10 May 2024 18:49:59 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] glibc: fix multilib headers conflict for arm
Date: Sat, 11 May 2024 09:49:53 +0800
Message-ID: <20240511014953.5360-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eFsWDd58DwkN5bx4ATaFlbftZWUH3qas
X-Proofpoint-GUID: eFsWDd58DwkN5bx4ATaFlbftZWUH3qas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_18,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405110012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 May 2024 01:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199202

From: Kai Kang <kai.kang@windriver.com>

The header files conflic when multilib enabled for arm:

| Error: Transaction test error:
|   file /usr/include/finclude/math-vector-fortran.h conflicts between attempted installs of
    lib32-libc6-dev-2.39+git0+312e159626-r0.armv7at2hf_neon and libc6-dev-2.39+git0+312e159626-r0.cortexa72

Invoke function oe_multilib_header to resolve it.

But gfortran-cross can NOT recognize macros such as `#ifdef` as
expected, so pass option `-nostdinc` to gfortran-cross-aarch64 that not
preinclude multilib specific math-vector-fortran.h [1].

[1]: https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/gnu-user.h;h=f7eefdafe8b330787c412ad950675d7a2d595e61;hb=HEAD#l158

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/bitbake.conf                    | 5 ++++-
 meta/recipes-core/glibc/glibc-package.inc | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b2c500d873..262c3e32ee 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -555,11 +555,14 @@ HOSTTOOLS_NONFATAL += "git-lfs"
 
 CCACHE ??= ""
 
+FC_OPTIONS ??= ""
+FC_OPTIONS:append:aarch64 = " -nostdinc"
+
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export FC = "${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+export FC = "${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}${FC_OPTIONS}"
 export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
 export CCLD = "${CC}"
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 0c5e3b4c3d..3a2ebfff75 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -167,6 +167,8 @@ do_install_armmultilib () {
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
 
 	oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys/user.h
+
+	oe_multilib_header finclude/math-vector-fortran.h
 }
 
 
-- 
2.34.1


