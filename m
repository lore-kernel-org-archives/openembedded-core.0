Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE757C25B74
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 01:20:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30164.1715908820821892519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 18:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58671a1b33=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H1EBGE027630
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn55wm5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr2ZeuIEar2LSS4XkIayZi5z5sqaPEaiD9cJncWY/rGQArpaGutDqtxdpc6sv0xVbuNevwb1DrPV7dHV0McPEP+UVIEV4mO7iF3BYymG2jXWRQd8y/fSKLp7zd9J7h/eFGmUeKX42XAjFd3RXZMdC4h5+nH5bptzaN9OG1BJGpvRbwJRHWLROxfUNqPkhLk5WtCI/L85huiM/ZlmpTtKe5iNEtpdgQERRkS9OBRKz23G2RkURFs3bsqVYTuHcZYPuVfU/Sk+clIoZ0NRFSiTRKysjOFadLTmo2sNGSaIKhT31sgosB/Oe+o5qD5MSeZkiu6+NKPobB+5WIxfq7ftEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oVSatAN4dUcgR4fdGcy3/qVZEYAytD3IXZhLq5F4PE=;
 b=DkiRqU4dbs9dntL8yTIRtwaY3XWaqWpJgB0mG53DQjULH74YUiUjXcHIdHE2aZ21JLeMZBYiA5UhhOGQmQ8ycYR/U9Dsn11eMhL2THknwZof8u/19uwpIK/m/iDwHwdoAGz2svPBRW13Pehvwy0JeBsWFl8G9EvaOzuanjk11ZSheoC6/mWObimKFsxoApUabusJ8rWLzhGN4WfQ5jysKJ9kG/aK6HFdQoUxtxUaJnKT5v/XoajZwhpmymRmyLJCumpiifkSCIjl4285i0TAoeDFoqfvzT29pmLZGTaYbziNvkkjlSOMaZtrYpXIv1vhummjP2KGL4CeJumRd+X34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 01:20:02 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658%7]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 01:20:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] gnu-efi: upgrade 3.0.17 -> 3.0.18
Date: Fri, 17 May 2024 09:19:47 +0800
Message-Id: <20240517011947.3727744-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240517011947.3727744-1-yi.zhao@windriver.com>
References: <20240517011947.3727744-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|SA0PR11MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: cec3cba8-1ad5-485d-f8ec-08dc760f79f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|376005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0WKITtbp3yYEPmXgqEAhx/8tx8M9K9x7KVeSZMiZaDXX3MB8MXfaqdFqX0oX?=
 =?us-ascii?Q?UayluOl42TXAyNcG3P3h1fYQ9b61ugRFOk199pTWQi0TYyD3t9gxAB8rDgyB?=
 =?us-ascii?Q?LRF2RMOCd4Hxqk1CcjT33mA9wdnO56bP8eS3DAUPVESsSwDSNR0AJB9RvT6Y?=
 =?us-ascii?Q?dSYqQ6YO8W1kb/GzXngUtjiunp8cn+uR6+CN0qqHfDe4Xr+E479GtQKfusXo?=
 =?us-ascii?Q?wDRltMzst4SrII1w4LaU0w7Ln8UZM3ZR8z4fVYpF/+6x81fCcj+l2JKhkPo9?=
 =?us-ascii?Q?ljzWwxa1oTgJYsScB4bGJqI5oaDkGs/hyb/VV5vMJZyeYfns+grjeSpX9n4j?=
 =?us-ascii?Q?w+F/G7Sc0oza/sMm23u2nyB70nFQ6TbuMKzjIxQMgFt+jhdhglf/cLz47WRj?=
 =?us-ascii?Q?zeu5gGp6zQmSvHVmPDPrB0R5pbrQmrQpZrHW+eSLqEb4bsvn7oz+JdPHZLyz?=
 =?us-ascii?Q?v2LnvubAPFjkhkafCnyW8k2MZduIwP6da7/o4n8xVSsw8SiOqBZ+6K4CYc54?=
 =?us-ascii?Q?5SgErCRPI7tt5lp9YnGRXIrgTFyJYhxiHZ5JG4qWhrSiJcQgcSno7qB/FtLZ?=
 =?us-ascii?Q?0kihMqdUVenCoBfv5V95Qz56HN1Sbil99pJR+UxSUxltnqYTPSs5V7hrfESn?=
 =?us-ascii?Q?UaPaGb/X9Hi/e0B0HmegpeY4d4ysI293PSymVmXnVB93dyhZEE1s/ZMSp2jk?=
 =?us-ascii?Q?rEYxV9Qny9BrqKl7ZLGuOREyZ7sD9HorvzwddgKvKWR1cBl227I2Draf5vIA?=
 =?us-ascii?Q?LoIyTZg2iSXW/5WgqylU2YGseCX9DztPTeJ+y507eGKPqt3uTZZNcis/UfkC?=
 =?us-ascii?Q?ABZh6PqVnAEOGquC2jWR6l2ZKpeZbl7jI1qA+GUln2c1m1l2HjdfLovHeCOF?=
 =?us-ascii?Q?HCr4mfFgFnCUXR2Rsv49tdkqZjjR3YuOLv6mQBV6vjplFXthSpWoHcmrgP2l?=
 =?us-ascii?Q?B2liBgUMVsxT7fhPna+tK0bOpxT/2+WA2zPSuESXr5x7kIVxls+MYdZh2/w2?=
 =?us-ascii?Q?cRZOvD5gyiatfT1MvmTEzKXAgFIwet/nYniUhydtlS9WAd7kPutteUzIBkWZ?=
 =?us-ascii?Q?Tpwn051OJ6RkAssn6NRBUaNVHX7B671cD1ujiS4ec/1yUw6w2PqmAwn1Tz45?=
 =?us-ascii?Q?XvGjZ+LRlS1whh2d4PPvSKqasIBmrNsdVRiQi5DdAGiqGY3ysK9G8Y7Wtjp4?=
 =?us-ascii?Q?nye4/iANhqs3dib8+zPsgOt1prfrdNy55f9P+tJD0IiFfjz5U/5UPHL8WH4K?=
 =?us-ascii?Q?IkyFitY+iTG41kd97XMVkBKG+BVxTXGyqJZJJUvh0SqNnwM8UgIn1LdNNdfP?=
 =?us-ascii?Q?co0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iRFPLPVj7jCUsCsdigdAaFvP6/aIbO7KxeyPqhi+z8QNBzF7oQ6ESfb3vtqb?=
 =?us-ascii?Q?mFITPFcVypT9iMpHu1uyCMLgH4OX0W7Bojd4+Gl2HfQ8u8+KYpflpzK+nBdr?=
 =?us-ascii?Q?sR1IFafMijvnoa0Qlq4agCYUYE+46i0/SuM7O2eiSjqYUvhWEErXMazR32GT?=
 =?us-ascii?Q?YSXm8h8JdCqj+AII2hGdEoZDSSrywa/pYOS870QMu13Vg6ANHOrMeNrTozPm?=
 =?us-ascii?Q?pg3XoCRU6LPo44hyw0VEVm9zs06/Dhs20wV5ex1+bf4BUSxUUHUhINuVpcSm?=
 =?us-ascii?Q?pTZ5xdaCrH1qiqBW2G5jssUiderTlnsgJCMJCMJtbUCWeSVQnGMe1PEekc+v?=
 =?us-ascii?Q?mCBqXrCRzmZ+A2P+cMZzyAZD9zmvuslJeOBN9c/kMC4vpBoggKUcPuPGlBev?=
 =?us-ascii?Q?bGgY1We5AH+pXyXe+nsFa5Be8z1ExmPS1Wwfhm3lWvpyetzcFGyhQa/6WnGe?=
 =?us-ascii?Q?1J1ZkdiQwlyGr6buPmhU4miKjEXDuhOavcpgNhMFetZP1shx1bpwVuVA8gWn?=
 =?us-ascii?Q?W7ZJ+SUEdcqIc76y2PlWoNtYfaUiVqv4LLeR6c4SX/d3XjTpJYS6yNJncfQr?=
 =?us-ascii?Q?1eeS2FOp16jawzasiOTPwQbIfrXsO7VBkRK22mu8iDU90d0b/FCWJNW6RAlP?=
 =?us-ascii?Q?tYIUOiurZ9/NWx/Cq+B0RYXxSth3FroixOJpNsRxcLuCbqFeQ/sFCCiEjED9?=
 =?us-ascii?Q?V6DHz/phwxuJ8D9LPlQVRaVrmJtHZtkJZGi0YXvXQQ+f/l9kzXCyZRqDACJm?=
 =?us-ascii?Q?B71hJIQw+8pWQli8JtFjbOZOyYaIM+NtAoRE0akq51uefY0qot/NIg2cuyX6?=
 =?us-ascii?Q?522wfxjD/mzBerNE0UrB4nMSx9bnxC3B7xWvCwB0gIAFWIbP6orOS3EDc89j?=
 =?us-ascii?Q?RWYWxJI5My9Xsi/sF0ttwb+T6KzeKEIp8Dfcq0VI/ZwkquKVdl9TkdnEQr4Q?=
 =?us-ascii?Q?/PHhDVWlIP+nogGxsla5okVU2aZrJwjW6o4lDVpcHbR5euvmaDB3cGtCDEW1?=
 =?us-ascii?Q?doOdw2HvFH0Ur26ZzERyYhf2aO2Qn5N/T8N16hznOrHpkWiDALupl4Ycreop?=
 =?us-ascii?Q?urakkrEqKEKvoGUrP+cEr2TFHwtFRK8oy0IhPfV6nvrNw1CNPPMiZwO6ZqN9?=
 =?us-ascii?Q?MooKakASQtAqSbACKrSeKfGheRj6cQNbcldMh3bORt/5rJU7vkyuhZluxIRi?=
 =?us-ascii?Q?qZwguyONt7K9xKJU96o3orI2RTLYn8HGQGl78owLzu4HZE8zN82xBOzuaSAU?=
 =?us-ascii?Q?71T5s6zpbQVCyhdvRq7fMoS7jfr+K976xZw44uEn7iyDZUm8+Q5HsGjjR4L9?=
 =?us-ascii?Q?JUy0400l+KQVt+qN7SF+1Fr6w55g1LKQYM1R+RNThnvXzNOgb+YmoVZ2iC2X?=
 =?us-ascii?Q?lIoj5F0r+sQ0lG+wKsRauq8V4ZYEzQcHQZ4xw2FOlD1opbEXQExJbRFRS9dl?=
 =?us-ascii?Q?8Qz5SXQ4uykq52HHbT4IB50n3NGV6N2f4s0BBwMY57AVYxfUwvEKUwEmq7OY?=
 =?us-ascii?Q?TGqow/svnYygPf4FtNfmPhS3APshS7Or5XSc0kPInRZOX4j9vicrdiBrotVv?=
 =?us-ascii?Q?Lv62HehGrznlwRNilky3h+Ii6L8wkj2sXWYtiHZI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec3cba8-1ad5-485d-f8ec-08dc760f79f1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 01:20:02.3917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nW1RSbcgPtSYHZYcUJJc7/QgQzCbAXQYGqx7j3696/Z9oxlnW9pAWJ5i5+wijwiTeu235YsgXqASvXbLH7YKeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
X-Proofpoint-GUID: JF6IEY_FBmnPiRnfe5P_xOD3Ytgz6GdA
X-Proofpoint-ORIG-GUID: JF6IEY_FBmnPiRnfe5P_xOD3Ytgz6GdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199502

* Drop backport patches.
* Refresh patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-parallel-make-failure-for-archives.patch} | 12 ++++---
 ...0001-riscv64-adjust-type-definitions.patch | 34 -------------------
 .../0001-riscv64-ignore-unknown-relocs.patch  | 32 -----------------
 ...002-Do-not-treat-warnings-as-errors.patch} | 21 +++++++++---
 .../gnu-efi-3.0.9-fix-clang-build.patch       | 24 -------------
 .../{gnu-efi_3.0.17.bb => gnu-efi_3.0.18.bb}  |  9 ++---
 6 files changed, 27 insertions(+), 105 deletions(-)
 rename meta/recipes-bsp/gnu-efi/gnu-efi/{parallel-make-archives.patch => 0001-Fix-parallel-make-failure-for-archives.patch} (85%)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-adjust-type-definitions.patch
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-ignore-unknown-relocs.patch
 rename meta/recipes-bsp/gnu-efi/gnu-efi/{no-werror.patch => 0002-Do-not-treat-warnings-as-errors.patch} (57%)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-3.0.9-fix-clang-build.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.17.bb => gnu-efi_3.0.18.bb} (88%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Fix-parallel-make-failure-for-archives.patch
similarity index 85%
rename from meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
rename to meta/recipes-bsp/gnu-efi/gnu-efi/0001-Fix-parallel-make-failure-for-archives.patch
index 63d9b6fc31..3c11baca0c 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Fix-parallel-make-failure-for-archives.patch
@@ -1,4 +1,4 @@
-From f56ddb00a656af2e84f839738fad19909ac65047 Mon Sep 17 00:00:00 2001
+From 70e30774debb9ab5d53a29c183f86fc569661b7c Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Sun, 9 Mar 2014 15:22:15 +0200
 Subject: [PATCH] Fix parallel make failure for archives
@@ -19,16 +19,15 @@ Signed-off-by: Darren Hart <dvhart@linux.intel.com>
 Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
 [Rebased for 3.0.8]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
 ---
  lib/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/Makefile b/lib/Makefile
-index 1fc6a47..54b0ca7 100644
+index ec1f9e3..79a794d 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -77,7 +77,7 @@ libsubdirs:
+@@ -75,7 +75,7 @@ libsubdirs:
  $(OBJS): libsubdirs
  
  libefi.a: $(OBJS)
@@ -36,4 +35,7 @@ index 1fc6a47..54b0ca7 100644
 +	$(AR) $(ARFLAGS) $@ $(OBJS)
  
  clean:
- 	rm -f libefi.a *~ $(OBJS) */*.o
+ 	@rm -vf libefi.a *~ $(OBJS) */*.o
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-adjust-type-definitions.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-adjust-type-definitions.patch
deleted file mode 100644
index 3475606264..0000000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-adjust-type-definitions.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1de509497826faa0ad84b82f5e2c3d21ee613459 Mon Sep 17 00:00:00 2001
-From: Moody Liu <mooodyhunter@outlook.com>
-Date: Sat, 13 May 2023 17:39:16 +0100
-Subject: [PATCH] riscv64: adjust type definitions
-
-CHAR8 needs to be defined while BOOLEAN should be removed
-here to prevent typedef conflicts
-
-Upstream-Status: Backport [https://sourceforge.net/p/gnu-efi/code/ci/1de509497826faa0ad84b82f5e2c3d21ee613459/]
-Signed-off-by: Moody Liu <mooodyhunter@outlook.com>
----
- inc/riscv64/efibind.h | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/inc/riscv64/efibind.h b/inc/riscv64/efibind.h
-index 4fdf81d..d8b4f39 100644
---- a/inc/riscv64/efibind.h
-+++ b/inc/riscv64/efibind.h
-@@ -32,11 +32,9 @@ typedef uint16_t                UINT16;
- typedef int16_t                 INT16;
- typedef uint8_t                 UINT8;
- typedef int8_t                  INT8;
-+typedef char                    CHAR8;
- typedef wchar_t                 CHAR16;
- #define WCHAR                   CHAR16
--#ifndef BOOLEAN
--typedef uint8_t                 BOOLEAN;
--#endif
- #undef VOID
- typedef void                    VOID;
- typedef int64_t                 INTN;
--- 
-2.41.0
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-ignore-unknown-relocs.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-ignore-unknown-relocs.patch
deleted file mode 100644
index 5b3c152c5e..0000000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-ignore-unknown-relocs.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 708f66acfec9a86f237726d45095cbd380fd83ca Mon Sep 17 00:00:00 2001
-From: Callum Farmer <gmbr3@opensuse.org>
-Date: Wed, 21 Jun 2023 11:32:28 +0100
-Subject: [PATCH] riscv64: ignore unknown relocs
-
-Sometimes ld emits relocs such as R_RISCV_64 for unwind symbols
-these don't need to be handled yet so just can be skipped otherwise
-the binary will never load
-
-Upstream-Status: Backport [https://sourceforge.net/p/gnu-efi/code/ci/708f66acfec9a86f237726d45095cbd380fd83ca/]
-Signed-off-by: Callum Farmer <gmbr3@opensuse.org>
----
- gnuefi/reloc_riscv64.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/gnuefi/reloc_riscv64.c b/gnuefi/reloc_riscv64.c
-index 0b02d83..e429602 100644
---- a/gnuefi/reloc_riscv64.c
-+++ b/gnuefi/reloc_riscv64.c
-@@ -81,8 +81,7 @@ EFI_STATUS EFIAPI _relocate(long ldbase, Elf_Dyn *dyn)
- 			*addr = ldbase + rel->r_addend;
- 			break;
- 		default:
--			/* Panic */
--			while (1) ;
-+				break;
- 		}
- 		rel = (Elf_Rela *)((char *)rel + relent);
- 		relsz -= relent;
--- 
-2.41.0
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warnings-as-errors.patch
similarity index 57%
rename from meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
rename to meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warnings-as-errors.patch
index db2bcf70b7..37befc8b4c 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0002-Do-not-treat-warnings-as-errors.patch
@@ -1,14 +1,24 @@
-Do not treat warnings as errors
+From 89218bb3c5eb7b97987769cb4f7bf8323d35ca7e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 May 2024 21:38:32 +0800
+Subject: [PATCH] Do not treat warnings as errors
 
 There are additional warnings found with musl which are
 treated as errors and fails the build, we have more combinations
 then upstream supports to handle
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Make.defaults | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.defaults b/Make.defaults
+index 0068e31..b643285 100755
 --- a/Make.defaults
 +++ b/Make.defaults
-@@ -187,7 +187,7 @@ CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wex
+@@ -190,7 +190,7 @@ CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
             -funsigned-char -fshort-wchar -fno-strict-aliasing \
             -ffreestanding -fno-stack-protector
  else
@@ -16,4 +26,7 @@ Upstream-Status: Inappropriate [OE specific]
 +CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign \
             -funsigned-char -fshort-wchar -fno-strict-aliasing \
  	   -ffreestanding -fno-stack-protector -fno-stack-check \
-            -fno-stack-check \
+            $(if $(findstring gcc,$(CC)),-fno-merge-all-constants,)
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-3.0.9-fix-clang-build.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-3.0.9-fix-clang-build.patch
deleted file mode 100644
index c6d660095e..0000000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-3.0.9-fix-clang-build.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix building with CLANG-9.0.0 
-
-Fixes
-clang-9: error: unknown argument: '-maccumulate-outgoing-args'
-
-Upstream-Status: Submitted [https://sourceforge.net/p/gnu-efi/patches/70/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/Make.defaults
-+++ b/Make.defaults
-@@ -110,10 +110,10 @@
-                             || ( [ $(GCCVERSION) -eq "4" ]      \
-                                  && [ $(GCCMINOR) -ge "7" ] ) ) \
-                           && echo 1)
--  ifeq ($(GCCNEWENOUGH),1)
--    CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
--  else ifeq ($(USING_CLANG),clang)
-+  ifeq ($(USING_CLANG),clang)
-     CPPFLAGS += -DGNU_EFI_USE_MS_ABI --std=c11
-+  else ifeq ($(GCCNEWENOUGH),1)
-+    CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
-   endif
- 
-   CFLAGS += -mno-red-zone
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
similarity index 88%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
index 43b7cc7529..a56a85bdef 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
@@ -13,13 +13,10 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582
                    "
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
-           file://parallel-make-archives.patch \
-           file://gnu-efi-3.0.9-fix-clang-build.patch \
-           file://0001-riscv64-adjust-type-definitions.patch \
-           file://0001-riscv64-ignore-unknown-relocs.patch \
-           file://no-werror.patch \
+           file://0001-Fix-parallel-make-failure-for-archives.patch \
+           file://0002-Do-not-treat-warnings-as-errors.patch \
            "
-SRC_URI[sha256sum] = "7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4"
+SRC_URI[sha256sum] = "7f212c96ee66547eeefb531267b641e5473d7d8529f0bd8ccdefd33cf7413f5c"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
 COMPATIBLE_HOST:armv4 = 'null'
-- 
2.25.1


