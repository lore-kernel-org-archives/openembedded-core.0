Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53420C2BD09
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 02:03:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.160560.1719280984882246533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 19:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6906a44fcf=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P1xfhI029802
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:03:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywsvyt4q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:03:04 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 19:03:03 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 19:03:03 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 0/1] Fix glibc fortran header conflict for arm
Date: Tue, 25 Jun 2024 10:02:48 +0800
Message-ID: <20240625020249.767760-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 37-jEsS_FUV7g1OI4Xak4bD36VW2dbZ7
X-Proofpoint-ORIG-GUID: 37-jEsS_FUV7g1OI4Xak4bD36VW2dbZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_22,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=919 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406250015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 02:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201117

From: Kai Kang <kai.kang@windriver.com>

Tested for qemuarm64 with multilib enabled:

1. set machine and enable multilib

	require conf/multilib.conf
	MULTILIBS = "multilib:lib32"
	MACHINE = "qemuarm64"
	DEFAULTTUNE:virtclass-multilib-lib32 = "armv7vethf-neon"

2. enable fortran and install to image

	FORTRAN:forcevariable = ",fortran"
	IMAGE_INSTALL:append = " gfortran lib32-gfortran"

3. build image and boot, run gfortran with option '-v' to verify
   math-vector-fortran.h has been pre-included

   for aarch64:

	/usr/libexec/gcc/aarch64-poky-linux/14.1.0/f951 hello.f95 -quiet
	-dumpdir a- -dumpbase hello.f95 -dumpbase-ext .f95 -mlittle-endian
	-mabi=lp64 -version -fintrinsic-modules-path /usr/lib/gcc/aarch64-poky-linux/14.1.0/finclude
	-fpre-include=/usr/lib/gcc/aarch64-poky-linux/14.1.0/finclude/math-vector-fortran.h
	-o /tmp/ccuPIzQY.s

   for arm:

	/usr/libexec/gcc/arm-pokymllib32-linux-gnueabi/14.1.0/f951 hello.f95
	-quiet -dumpdir a- -dumpbase hello.f95 -dumpbase-ext .f95
	-mfloat-abi=hard -mtls-dialect=gnu -marm -mlibarch=armv7ve+fp
	-march=armv7ve+fp -version -fintrinsic-modules-path /usr/lib/gcc/arm-pokymllib32-linux-gnueabi/14.1.0/finclude
	-fpre-include=/usr/lib/gcc/arm-pokymllib32-linux-gnueabi/14.1.0/finclude/math-vector-fortran.h
	-o /tmp/cc5pikK8.s


Kai Kang (1):
  glibc: fix fortran header file conflict for arm

 meta/recipes-core/glibc/glibc-package.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--
2.34.1


