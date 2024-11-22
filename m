Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8E1E65D2B
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 05:18:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17930.1732252685661909849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 21:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105629bf38=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM4M8Hd030547
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:18:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8eehr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:18:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJtk6f4elRvy84cXuHPS4veuZblA4J8ZEdCvaQbWPDvM8NSiIy3IVqHpXXwzfOmiDS9dwtFhflgfAef2z5VjiUqXbe3cl4W9Rg+6x3IDLBq/b9wIpNAEu4l/8CckMWIavVa8ECEL0xN/xWAeAx2qrdCyie/s46KNxOaAlXUnI/xdSSjxaNuBWxF+SD8B98WZx+0ioaiONcKM96Zg6KrBfvE+ClT5lsUTToUdBgpwxNmr6P65J3M1lTERlM2nP34uFxSHraw/lSi+VmV2nDa6dwS8DsQIQAVbRan5qCvAbaPJMC4OVGevGVfALkiuKJo+Fn+RhGwVL9KHr+Xckt+hVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcQjcPPjpue4mliOwJQkkRT9wzIPPOV4Z6/tuh0qV/M=;
 b=p5gjucxCpifSjPZzuODiaVLTfa0EcBNj97ftn2/2DA0j9msWimjtEyuB9q9Ql5MqgbWu8J0jwNnWpqzNOBQj7No9qqJi1jXSJVYwNhIGRsNF3tIHS8K7yC90NLY86BoYbEKGLPlyCRjmemp7cCX5Uc/6WZt08wwHLnpGbyBqqKy7X4Ei6HLunHSvJVHL4ivlX3lOtmhELTnla9ZmA9OvRe0qECbPKLw1gC9415ts4rPj7+yCcoPGXe3nuQzzVCAfwrEWP+prFW4XOI8wNWOjINd7l6YlWQBrBZMZ26N8SiSW/qjezkyeHscmqUGfmYfV2j6XgDGww2uFE+bUYM1DUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 05:17:59 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 05:17:59 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 1/2] ovmf: fix CVE-2024-38796
Date: Fri, 22 Nov 2024 13:17:48 +0800
Message-Id: <20241122051749.1260019-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::32) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: ef343b24-24cb-4695-435c-08dd0ab507b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HqsdPr65m3JY78ZrpnJVNgA9ruC2MzU4ogHUrKbEArnltIPqY4Ezi2NxlXTt?=
 =?us-ascii?Q?p8OWy2ZiqroqqroMYbHxFeNwmcZSrsSpqm6ImPgh3+8YIZFyFK7V0F6kUZom?=
 =?us-ascii?Q?5CPZqL4fbx3ll9GHKu/rlnQGNPNuyJgtmiviohfgJQezAbDR5rtYrbX8Fk3E?=
 =?us-ascii?Q?ZzxdsdNPNTMrKDsbTTX/wTSIkFmJI7RnYCovB9D6nHqRmvBJT8ZoeRI1GWRC?=
 =?us-ascii?Q?zj0ny/HeEO/wQ5yGQQKi4TFXgBVcbcMa4hCpG2uJiW4pwahYU1Ji/v+JPMWb?=
 =?us-ascii?Q?8be5ij2Z3WfImIA2Gr+azM1BzgNXiVDwTCypRZNn9OT8U86fJFFR9u8FqmR8?=
 =?us-ascii?Q?35gJMQVZqhS+PZYFuU2NTYCn7LbiPMBnxQxGiJbgzj1MqoXMpXnCUVyn4q0+?=
 =?us-ascii?Q?c6IqSUBh5OeiDziGLIlucjOE1noom/poqtKUqNEB0j6bDEVqZlzcfDI1DoFJ?=
 =?us-ascii?Q?UlFznsW3zWLM974xCvdNp4C3/heXCs1IEvnIni+nJQZNKMfB7C1BXkGioDNQ?=
 =?us-ascii?Q?W+yscwG34TO7jE6RvKAf+OZrfGFiWZUEIB84M0m9/lfzy1nkMgdWO57DYB1F?=
 =?us-ascii?Q?c3x5s271cB35XfbQJrSac2PJN740nqt0CMWNiAlFAjmf6KSHeb3kuqeWyNB9?=
 =?us-ascii?Q?k0vOKhYyEKj7IP5Ul5iZR75/1Dw+bxKkb4IN5vRrGPFNzjM7Uu7nm9JCPaBz?=
 =?us-ascii?Q?B7LFi85XD0qwblKG+DsNX/Cfejq4HJcfkpC2RgwnfT95O2xRiCw2Xi2HlJQ9?=
 =?us-ascii?Q?BsI1MchiP9Os9vURUpqJmKgiXPCDWyISw2zIYdL4bULZWG5xGKc69sp49/PV?=
 =?us-ascii?Q?sQVcB0xZIk+s0j44OxvNQe06EKuXjMdg8rVvcA/3eljF6gN32EFMSJYOPLEY?=
 =?us-ascii?Q?Q/B6SKhPdbYlW7V+DtkNKhZJnjMJuoCO2LzehCQRbawCZMJPrRg7eWGql1oa?=
 =?us-ascii?Q?NHJ9xnA6thpkI/+sIOGudRTWVA6DPXkc1VP1bSjUp6JRc2eKt82duX89fNqW?=
 =?us-ascii?Q?evr7NxRJRCEieJAzBxryvo4mvgJKr1exx5tK26DGPZMewZ7Kzo3yK2JdLFx7?=
 =?us-ascii?Q?i3jDvGzOEaiK0VJT/aCK8CI4qQZjvVSB5N7JNBg7xyfhslCOyY4DGEK/+hbi?=
 =?us-ascii?Q?MdWp33DdDYtj9GekHBPkJujPVigPtij0s8oNRC+dhXJfBSF0UYwCK92ad3IL?=
 =?us-ascii?Q?t1QeYeCca0O5G31q5t/3vR0WydoItqmqspn35+sgsNI5YaVCXnVzlMOfU+Jx?=
 =?us-ascii?Q?kaArBUB61g5mMkhm/W1Wcwhn6muypwMIqpyKwdBOjRmgJqV9ITxs2PXnwkoL?=
 =?us-ascii?Q?wYVfGWeAG1xMS8Edt5b7sWVqCcKmm5Ip/Yc6cy8eW/pU0xRtsANyx0x0bb5T?=
 =?us-ascii?Q?MtPv/DUv4gvgx7C3z2IljF9hmzTl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B1cY5TJmFHrZWuHjMU1HiVaKPdY85mT6EiCujae6/Hz90YpWSJ4mTxwF45vo?=
 =?us-ascii?Q?H5RgVpYwLY33kCjnkaJozUoxCJ1f1qEF9YwxHN3co1bV5IEcsNHpTC0HFZnC?=
 =?us-ascii?Q?iRGdUATThmSyAA0aWL6RXqJ+m3j0Y1nroEjbb5iYYzYOmTR4nKw5MKfWjONP?=
 =?us-ascii?Q?surI0yig7s3TQ+wyZdsez+AmUANKURtawnTfkByMs+7D1dsc4RdlIf09wUfZ?=
 =?us-ascii?Q?jnjJ7yt3epTgXRgdScwZsiF0ON3JvOW45lIE1OReVL7LaFLcz7RJmZidgGU0?=
 =?us-ascii?Q?QLP7ObFpu4EMRZ/srDBLgeqpN5Cup5EsuOhZjntFwHsTkgeEOar6jaYUnySK?=
 =?us-ascii?Q?aJ/wu7dThvrtU5sDh+KshmB7lPthwxUI8mxgB3zgccwPaVTucXpAU3PzxJfV?=
 =?us-ascii?Q?VJljCiXf4gB85pT2iK6Z6FCjtTGUgLESyX8+IX2rFdSwiE7/NWF4Bpt+rBre?=
 =?us-ascii?Q?qrWHvt20IxYotCIngRyHtBsDQzAk+B/72ql3FLkfF4NpMusoVKqzUXXaO0Mm?=
 =?us-ascii?Q?rn2Y1nFOx8upvV1qL2WS/M+q90w3/4cwvGaCddIZpfvlPfLPds20uJSwlPx2?=
 =?us-ascii?Q?PY+nJb9My+uS1EnfIJKgrSrU2oc4w3Xg50JG3+/TXL/EQM71CZrsuMS4jOod?=
 =?us-ascii?Q?g2jZT1u9puS4hso7WGGICze1FK4ZBk4LVBeNmZU9bui43tgxKYwIS11IVnQv?=
 =?us-ascii?Q?5La//a0qOqGO+vc2p+C4acNbsfl1l2ZrN2Zq3FtbJdLlU6OSD6ideJup6z3Z?=
 =?us-ascii?Q?LJ0aLKX6MwspXpx9KwXzfjIXrIboOy3s8r9Yu33TVbAtLnGkALDFuJAOJ654?=
 =?us-ascii?Q?cyo69cCdtR1NwF1z9/3vZbVQRZnoWaPWW0/9FZJAZuac6AGSmkMVveLJdCio?=
 =?us-ascii?Q?VpgqX1skf0efdztJvgReA7utRp9aF2vPcGvezSTtZA1fUplhFgy2ctHEbGnB?=
 =?us-ascii?Q?DL4PUFAGr3OMMCW6zZPzWVZ9EMs7zDt+djklwV/cR9KBi4yyQY+ZF7PaAfdi?=
 =?us-ascii?Q?CwE8Q+SWTjzA4dRwxMItHFEY9KBgXhvq/dxRDFV78+y3ZbqOrgxMdPAe+DDq?=
 =?us-ascii?Q?W1Dihqb4OnGnvJkgV2MWlfeQY/hGDSGsRlKhNFtlyFcxJ8UHr62EaKn46g4i?=
 =?us-ascii?Q?j69RuYjb6V85hrBiUM9rjhEWHZvItiqJp5fZTIyLT7yj0SyA8c4NP9sqyowN?=
 =?us-ascii?Q?Oiy9Z/uIdct94/ceRzWAwEPssYpnfpTRwE2Dp+ajd5OBthq1U3LCeIU/49tr?=
 =?us-ascii?Q?vwF3NxW1SkPEeLZyHAGoP4k4DYsvoNcrJIFTpg5Iv8dimS74itSqZTxjzMJ+?=
 =?us-ascii?Q?wy/PknT66hq/clDldLsa2ddB1oEbCm6ywhAKXFF+2r4jg1cysDIPAD1vCFa9?=
 =?us-ascii?Q?BcZ/nHQa9gBMP48oqip7LlfElsD9aSdEFZhDtVSLewe75q29tafcljjTmZv+?=
 =?us-ascii?Q?A6iIT0mWB35LKwj6olmp9Cx5HreyJjqkeJzkCFjwpy0P0SDdtv/cX9JbjVn5?=
 =?us-ascii?Q?8b7Qe71kwX3PygjXBEbS2Tr8jwhGA1BTXiLy+SMgl48uTz+3GacKYa5SRcuN?=
 =?us-ascii?Q?SZWFh/YDPqk2O2x+/2vX0ke6njONoAcO3Vg2FJxjrMxan9gyJNt9SKT7QI+r?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef343b24-24cb-4695-435c-08dd0ab507b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 05:17:59.2796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jWdMM1ktrr5V/NgREFiU9GVLbuosCezoPJzc/h3mn6YXRVgyumpXERb5ttfA9bj578WlVc2v7K+v5nVQ+JbQEOx8bJ61oH4QC9ZUGL0Yvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
X-Proofpoint-GUID: XOa-pzJER9Cd-S8yrYsBNhqIouezbwte
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=6740140c cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8 a=j59TsiCqwUfw_GPqhyAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XOa-pzJER9Cd-S8yrYsBNhqIouezbwte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_17,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=929
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411220043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207588

Backport fix from upstream to resolve CVE-2024-38796

  https://github.com/tianocore/edk2/commit/c95233b8525ca6828921affd1496146c=
ff262e65

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 36 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-is=
sue-in-BasePeCoffLib.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-=
BasePeCoffLib.patch b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-=
issue-in-BasePeCoffLib.patch
new file mode 100644
index 0000000000..c6e15c5069
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-BasePeC=
offLib.patch
@@ -0,0 +1,36 @@
+From 5f7bd3f3c4747d5bb2733f017f8c5b93b63a74e3 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 22 Nov 2024 13:03:33 +0800
+Subject: [PATCH] MdePkg: Fix overflow issue in BasePeCoffLib
+
+The RelocDir->Size is a UINT32 value, and RelocDir->VirtualAddress is
+also a UINT32 value. The current code does not check for overflow when
+adding RelocDir->Size to RelocDir->VirtualAddress. This patch adds a
+check to ensure that the addition does not overflow.
+
+Signed-off-by: Doug Flick <dougflick@microsoft.com>
+Authored-by: sriraamx gobichettipalayam <sri..@intel.com>
+
+CVE: CVE-2024-38796
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c95233=
b8525ca6828921affd1496146cff262e65]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ MdePkg/Library/BasePeCoffLib/BasePeCoff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c b/MdePkg/Library/Ba=
sePeCoffLib/BasePeCoff.c
+index 86ff2e7..128090d 100644
+--- a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
++++ b/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
+@@ -1054,7 +1054,7 @@ PeCoffLoaderRelocateImage (
+     RelocDir =3D &Hdr.Te->DataDirectory[0];=0D
+   }=0D
+ =0D
+-  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0)) {=0D
++  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0) && (RelocDir->Size - 1=
 < MAX_UINT32 - RelocDir->VirtualAddress)) {=0D
+     RelocBase    =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddres=
s (ImageContext, RelocDir->VirtualAddress, TeStrippedOffset);=0D
+     RelocBaseEnd =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddres=
s (=0D
+                                                   ImageContext,=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 35ca8d1834..cc2ac4268c 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
+           file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch \
            "
=20
 PV =3D "edk2-stable202402"
--=20
2.34.1


