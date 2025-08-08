Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874D2C87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 06:21:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15753.1754634078167728701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 23:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=031539778e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5785xGtW3235153
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Aug 2025 06:21:17 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyfat6c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 06:21:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5VbZ8TnMHtAg5N5CNzP1qA+Xbc38ymSlLYeveHENkUtufX6/1MICCdBo1CDeIl34ShFlBMLT12SkYm+lplOUUPDdNNpz2cgmSjnRG2nTQIChg4lj8PMwwFqirYcKfFg6VSQ3eLfcxkUCud+bQM49TyJuXv3OL9BR+qEhxI2Xa+ZuE78P7kvfpFCVB5fbJhqrShLo00kajDCBtKxmvbnECbv+QNQjZApDXgVkhwkDB9cVEJsnJIE1xfvliAURDWm82IDXTcJ1rFG48AYqUZBMeqPnorkCzzvYMFIqYHepYcvW47xprUPBitmUv17qlCxyZgKMHAgCM38bP+Pv4bx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2sxTFASSUXExESoacz5eZDvRNKAXKCm4Io3cFCLwfI=;
 b=ZjfLKPgB12lt61HuLJcGca61On46hNcEdNQfiNk1DlU8NkrzKSrkt9XJLIjbwyWT7zKQ0jFJlKXJ3gjRTp/i5jBaNiB8rfjHpMcii7KDhw385A5BnksoCnJ7zxUJBal6/MnysWNhArHxW5GLaC+7nBnoWotoS0XrSYNBp1DYa+LWJPGR2yUtqt3xklGYGWp7VrbY1u1F0xvUbNMmH8XH49d7/QbHlbov8EE5a7IXQ5oZrIepasOOlB35W8DltHhYAeSTpzJSITa4V6xZ8nCckia81dK5gKTLxjOYz7hFIcrD2ji4e8u2oAjVdSB4j8xDO7H+Ux6KZ6JsXTsikdPQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS7PR11MB7930.namprd11.prod.outlook.com (2603:10b6:8:da::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.16; Fri, 8 Aug 2025 06:21:15 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 06:21:15 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH 1/2] glibc: Forward -ffile-prefix-map option to assembler flags
Date: Thu,  7 Aug 2025 23:21:00 -0700
Message-ID: <20250808062101.640198-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS7PR11MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eab769f-c86f-4260-993f-08ddd643c72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5CKx0kSPjLRn9p4cd5/LjThYBClxiMNF8707psTbakoF+VCOAAjp6TgIkRWc?=
 =?us-ascii?Q?/quyu8YQQVvgFxEfHD4lhlKBGb2ZJRh0qGunRphmw52KzBnsd9VbNosCNIcB?=
 =?us-ascii?Q?MZgH+QpXS7z7E4rngOgc0i1MlVoT9nr17c3lzbrSHY7cHx1Oxts27dfG4b0f?=
 =?us-ascii?Q?bumjL4Bou4b03c0fzau10ksr2Y2yADNIjV+3RMtyhXDhEma4iatNB1452F+S?=
 =?us-ascii?Q?zezmwDbPA3eINbEwOZhTMxSaWJM1+gh8P6Ioc5/9PaoZ8b7dgK50QQPHa7mC?=
 =?us-ascii?Q?qWH/OEHM6gEbA2LcO/ZROffnihSkDsTu4ELMe6aB1L2sBYRREcjnrCoFVVWp?=
 =?us-ascii?Q?A40SolFeBlvY+49N7oZ6zBB/1r3pPSQF398HOTSnJF2BZGZKQ9k2Uhi3vMzJ?=
 =?us-ascii?Q?ci7roaj6uF+8LVaglGRHnvnCFAhIT2qftRZxWDVa80sxWULqP5G6FPR8wOex?=
 =?us-ascii?Q?Igl58w/kEVFJWScZ6RPk+Ej+GDVuiA2uEwZSuJwQcAyTPJsCPeRFc3TqYgrE?=
 =?us-ascii?Q?u8UWlDm5hPp04PFvq+j70fgXr/nyr8NtoTYGJBUqho8oMkBNstYhZ0d5Mg1H?=
 =?us-ascii?Q?XOj7U95FLID0r5jhc7dzuvbn8HGH216Skk8ZCyh+M1vv94Gc4vgFXvbfSMEP?=
 =?us-ascii?Q?YeO5mAT+gSDc57Jckw95tI+kygGsXPupurATJPZHXgbQTKMxXvsPRAWKSe0v?=
 =?us-ascii?Q?Eaa2TtafxL5LqdPyPKm2zLRZJ9QH3WEGZbcdKYU0sOIPlgL8q3T+eBVgXo9c?=
 =?us-ascii?Q?TEfvEPgIJ8d7cWymMfyUdCU7Xt9gBdpHAqFaJJtS2NIDo6V98Z4TVPK0MSc+?=
 =?us-ascii?Q?lrvG4x3P7o1CgF2BQMY1l7wuBBJUJbJQ9f6AssKhAypk9W4vpcqd6lBtsLf7?=
 =?us-ascii?Q?E94zUgvWFqu5c/3nJdIsgWJ1MtxAdShydxf7dY7TTCgakkVz/fIcx10KthCK?=
 =?us-ascii?Q?R9Xw/6CSiyZ5Il6PcqyuzrzQOSILUAn2RKiWA9I19VjLQn3e5/6PcEP7UU5u?=
 =?us-ascii?Q?rohRD+4ZT6vfpNAPsI8KHksCcvV7X31AHpHnveVJxHfXdgmWX7PmpvTwXGdr?=
 =?us-ascii?Q?5Zc2QfryWq8E3lDeKEDwQNfYT8nOSChpkdOvsr14+77qaVpi/nS+x6EltC7U?=
 =?us-ascii?Q?rimT3NyfoSirqZE6UXxYFrs7qf/6h4FJPhI9huK13LpZ77cjnaDYLGb9fRsB?=
 =?us-ascii?Q?/uQiRu4xU7F/87NFCjUwxC5rIJ9/hqD0WnzuYxnZjycZAsBAzotekmI1Bjnp?=
 =?us-ascii?Q?B5rd/Seuq5/p0mhNs9gPxKkxEBxUrsPSUiVX7BBoLI2dzNVAFtFT0V2FD64m?=
 =?us-ascii?Q?5A1SLzczHyuykh5d8Rq8I4euVm2S54jYTQDLQARhueph2IqGeJ3+GA6+hs8q?=
 =?us-ascii?Q?aKh0uCmix19yrEytqEmpwTb7Ho5+7wa+lKiuoR7ZJS1yiGC39IPSezZztS3M?=
 =?us-ascii?Q?oiKu+7sBE4bkQbro8uyyP55bWram4Ds3HebesySIB4NjAfQq+RQ2d+R1XmNx?=
 =?us-ascii?Q?aEqwd9rPbJH7PMM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vK1J8iDEw2zF+OnzkTmwO2HkpkJ6APRr83eey8PVaGEg1ZREf4a1/kPm2Dcq?=
 =?us-ascii?Q?oox99N0gFhErYHoTFhvGA1vW9D+sQIu59cni+DBTeE2aNsmx1FVgNHK+G4g+?=
 =?us-ascii?Q?AlbpZ4zD5L/EIeKWhKBO+5t7dTJ9LQAVGz7acRnJ9aKMJPXXFses3jbzxPud?=
 =?us-ascii?Q?hEcj6sU6vnvh+RB5JA1cRgs6Ttryl4dNavJRMDpTRfoYjl1AHj6fbKQil2U8?=
 =?us-ascii?Q?9SNIyAvcP+SZSKguntWabB5PKNNHYsIjp/9fTL+rq1ZuB+KC6AiD1kA2IMPL?=
 =?us-ascii?Q?p/ZItzABnzUPNxjV0TAXEb3YU6fvFtWv0uKnQ58EAipeviabSnaKlb9m+pz6?=
 =?us-ascii?Q?j3c3iakZpwTbCg2XkjW4emaA4uk64etryVwojlzXFbqx+CbgaTLumj8W1oDG?=
 =?us-ascii?Q?1BKoY0SrBOfWuj1O0oOLDWwPIGwVe9crKHgDUFQuJao19kpr0cCpw4VZvnps?=
 =?us-ascii?Q?ndxdf4AVcfTD2lIhBV1fqxbDoTdkJwWAwSQFTgTxnzTEqCML94VictQgk4br?=
 =?us-ascii?Q?lafTJL7lS6sw9kjD5ACjvwGhXUdnWxmAJcXODL2d09HKrJVIWCwDgcPwuCA/?=
 =?us-ascii?Q?jroXFK2ISWexD+4pYy2EsNDLEnj9CyxOLKEczRwiVvnjRJjpaJXcA17O9v1j?=
 =?us-ascii?Q?980VJ15ayA8A5JjuWCBzZn3YOD9/OoygkUEgz+dotYC82KOefws1VRbn/C0b?=
 =?us-ascii?Q?R5mxW48vxV/wZeQSSIJFi7rlIxuJa3Zk/0DXMjCdFkh+BGkL6pfPt4yzKbKc?=
 =?us-ascii?Q?xF3Xfd/mbGa1Ehn7WOyf451h8YiZEiervuEFSYNMIuPAUML/Q6Ea6m6IeCET?=
 =?us-ascii?Q?aQyQ+TosTnMSXswgrospdSFuu1fDqHfBeqp71/pIk6e9KpWY9Ckw82dpO8c2?=
 =?us-ascii?Q?/OXY9TqqH+6Uiq5sKlJpg/qFvnEgmlNWd88TScTL8eUyIyoHY9ZStQAdsU6S?=
 =?us-ascii?Q?zEv0k152l5gELBLc2nAluXyVhm1DGspZgQPl4hocHVn7r23GXm4vnJWNxhZN?=
 =?us-ascii?Q?0UH/5A6k2WTPE0xA5rJLWQyjp2bHphbrD4xYsomscMb9RinT8Uo4Q5bc8Vvj?=
 =?us-ascii?Q?0T21Nyz14paMRpWt+rIK8ll6NyWVCS5B8FBvCsZcdH7/3cNofzFiCcB/Qzg9?=
 =?us-ascii?Q?qgMpKMa2fDF/DkgxmmFtSpeIr2dK/uh52y6SJGeoT5HN85t2Z2QY8kaanB31?=
 =?us-ascii?Q?zelqrSj+fSXtoOvnh+/ZZloEkJFFnqA5A7Ddl721QD5SmIvQWhms+S2xwHzC?=
 =?us-ascii?Q?FzXTcBRNbyZjXN34Tc+zrYIccPELfN9uXZVFFDLjJD4wx1IZtMlfZsnjBIDa?=
 =?us-ascii?Q?UspZJw22U9pw64De8VOm/sI/S28IUbLf19o6XtxZOPv5VlcOqR7U23leZrRl?=
 =?us-ascii?Q?Q3YMTWbUFrtFe8+Xlrshj9X5qEBsVj9Tl8+Z80W9Mx1CL+789U1sCrc2rtJi?=
 =?us-ascii?Q?q+9u4xN1+mguNKiSwCdefFVZp+8pzfkcTKUn8S3fv8fo6bGruvpCvRP5J8iP?=
 =?us-ascii?Q?F8OLV0LqUDJ7Coa2EKuic/PXEmCGb4BVQ8LLimR+gpQLS412PElSc3/UA8Bq?=
 =?us-ascii?Q?Zr3D16LeVbvnqR5ZV9RlBNfiWkSq2k6VhTtIpQv5YhlI4liqnTdHy74RHJrF?=
 =?us-ascii?Q?logYvLVCYnHl1d7ZdPycDEI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eab769f-c86f-4260-993f-08ddd643c72b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 06:21:15.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1v5xexE0BuDNMUsP9/4ud4cRO2FFgPpBgunuXnQQMjGDjbFAjY/IAH+m/a/K0Ja9KFN6T+CpH2tN21l1tE+O+slf+UYn4PlOc8YsA8JtManxMiFw2TqLM1VUbP+eS0v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7930
X-Proofpoint-GUID: cqxIbrxiV3bq-tFZ5jFAmwAlZKZLr1vz
X-Proofpoint-ORIG-GUID: cqxIbrxiV3bq-tFZ5jFAmwAlZKZLr1vz
X-Authority-Analysis: v=2.4 cv=ZpHtK87G c=1 sm=1 tr=0 ts=6895975d cx=c_pps
 a=7lZyNaC2F/ThP7FyJEKG4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=CCpqsmhAAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=r2z26tNrudXxuRAnXlwA:9 a=aH9sc-IdxHcA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA1MCBTYWx0ZWRfX8jvUJN8KltuD
 BeXy7NqdwjQwixwVNxZhviDXnF0enxZ4S6IuVnhZI92G1Xkq9/fNOmhMT9XD6dI3GrLu2KV+cQs
 roqQO4d/fw4E/K5pidylj1JNqznZkrhqdc2D7vSOM+/X2c/JMgiXaaE3RqtQ+akrBB3IBK6yQ+E
 Bbf5AblOvR5DeVh8p7w7udQdZP3uMdOIt0Mbw9Tm0iBBqgVWfrol1fQN25rlLMKyAGswucf41h6
 FiluIV0vveKRfIc6Vv4IX2jKF/jQOYAC+vH++RmnesktphBlS3nc7Hc/WJT6J1CtZ0BIFvoxTOh
 DqckRsRlK85yM7U+HqtMoexjaqNP8v4UCL2ryPtpOFo/FgeIJOmuYlqHq3FEOc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 06:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221595

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: a85cccc80aa7e6d6a5850c2d730cba5e1cb60cb3)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...le-prefix-map-from-CFLAGS-to-ASFLAGS.patch | 24 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
new file mode 100644
index 0000000000..96140c625b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
@@ -0,0 +1,24 @@
+From 603e50d6b8ccadb32d59b0497f76629665c1794b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Apr 2025 19:51:01 -0700
+Subject: [PATCH] Propagate -ffile-prefix-map from CFLAGS to ASFLAGS.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/libc-alpha/2025-April/165969.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ Makeconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makeconfig b/Makeconfig
+index e35c5cfe4e..7a19c731c6 100644
+--- a/Makeconfig
++++ b/Makeconfig
+@@ -1176,7 +1176,7 @@ endif
+ 
+ # The assembler can generate debug information too.
+ ifndef ASFLAGS
+-ASFLAGS := $(filter -g% -fdebug-prefix-map=%,$(CFLAGS))
++ASFLAGS := $(filter -g% -fdebug-prefix-map=% -ffile-prefix-map=%,$(CFLAGS))
+ endif
+ override ASFLAGS += -Werror=undef $(ASFLAGS-config) $(asflags-cpu)
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 7ddf7f9127..731b9ee255 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -54,6 +54,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
+           file://0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.49.0


