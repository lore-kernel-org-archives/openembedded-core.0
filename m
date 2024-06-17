Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AA5C41513
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 06:34:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50584.1718606073716004561
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 23:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6898887b7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H67ma6014253
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:33 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682ha6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:33 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 16 Jun 2024 23:34:32 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 16 Jun 2024 23:34:32 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 0/8] backports from master
Date: Mon, 17 Jun 2024 14:34:23 +0800
Message-ID: <20240617063431.2221035-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _P3D38dGJYWDkzdQuKB3tnnNmKVC5wzI
X-Proofpoint-GUID: _P3D38dGJYWDkzdQuKB3tnnNmKVC5wzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_05,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406170049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200786

From: Changqing Li <changqing.li@windriver.com>

* backport 7 patches from master, so we can build scarthgap on 
  host with gcc-14, like fedora 40
* Add one patch for fixing build failure for expect-native

Changqing Li (1):
  expect-native: fix build with gcc-14

Khem Raj (1):
  zip: Fix build with gcc-14

Martin Jansa (3):
  db: ignore implicit-int and implicit-function-declaration issues fatal
    with gcc-14
  cdrtools-native: fix build with gcc-14
  expect: ignore various issues now fatal with gcc-14

Michael Halstead (1):
  yocto-uninative: Update to 4.5 for gcc 14

Zoltan Boszormenyi (2):
  cracklib: Modify patch to compile with GCC 14
  cdrtools-native: Fix build with GCC 14

 meta/conf/distro/include/yocto-uninative.inc  |  8 ++--
 .../cdrtools/cdrtools-native_3.01.bb          | 12 ++++-
 .../cdrtools/cdrtools/gcc14-fix.patch         | 13 ++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb |  7 +++
 ...port-dictionary-byte-order-dependent.patch |  2 +-
 ...e-dirent.h-for-closedir-opendir-APIs.patch | 45 +++++++++++++++++++
 ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch | 35 ---------------
 meta/recipes-extended/zip/zip_3.0.bb          |  2 +-
 meta/recipes-support/db/db_5.3.28.bb          |  4 ++
 9 files changed, 85 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch
 delete mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch

-- 
2.25.1


