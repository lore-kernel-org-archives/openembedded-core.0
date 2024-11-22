Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7F8E65D29
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 05:18:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17931.1732252686250022707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 21:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105629bf38=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM4M8He030547
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:18:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8eehr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:18:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TahLY5sXFhEZcT5GNSbsr+Sq3xWuo/zYCJUe3eMBirvcF1Gk0eYwA0qT1MUqoySoB7PZicswX/kj+DoMCxu8rbAhbVvjf9CVyW34IYRFE8AlwHdkaZpbLdX9rV4WlyCx/PUGFHQYKeUSOxvndDo71kUeQVncqzI4+HtYgL/H4G3nuKeQP2Q1Nngeyjm4HYeG/YTSlZRj0qoPHPpqt48ZXEimHamwLl5/M74Pd0CsfoLmfju+e2U76/olpLhhleibT2BSuxeyq4JDH00msXV+FzZhDk9RLfFXdQLxfQROKmSmMeG5l41q0F3AiOoUUyYBkcred0L3FYSpM3soE7qtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9T8uygJbngYkhSQ03fh5vX6A65f5iJ7nlt/r8M2NNQ=;
 b=szVa/0HLllRzJyPxD0gEFM3MvBRnc2W2EP+ewMbh4pWLFhxk3Z4bzI3oomj2e6bIk46Th32uY/uVkXfUXcZEBYQIQEj14Pca1Nj9Ax+hYS9Kjfhv1xrTACIQeRhiE+IsOKFd0Ss4v/gmvtxbRusoXz9oiFRapCLdthKRboKlRSm+ZzjL3Iwju6Ki2KOOgA8cvczZpeaTB/ZPCdDHKRwveZeYAPoG3CwjnydABGdeFJN+jS5SpUOmTBlVnrvPcyCUNvNabBGDweBqlYABu26aCzCQwcsabFuLmVOykITCqcErt6hsrT3OlBMhSvSOxlP0qrjipJy/12owbK6hN6cWcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 05:18:00 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 05:18:00 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 2/2] ovmf: fix CVE-2024-1298
Date: Fri, 22 Nov 2024 13:17:49 +0800
Message-Id: <20241122051749.1260019-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122051749.1260019-1-hongxu.jia@windriver.com>
References: <20241122051749.1260019-1-hongxu.jia@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::32) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: b09a0812-1247-4f85-7a4d-08dd0ab50854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UBk2oLu0crmOAp+AhmgcgvsPTmD2fdA6N/7Mk3KDpLUMqdM8q3OaCXij/1z/?=
 =?us-ascii?Q?jpmqA9eRjmZmfsPa7lmxEhLTKy8sEMWVj4LWox8hWijubHYWNQcJ/xdS9DUU?=
 =?us-ascii?Q?3Y+xiMjjiWmnHX0LXrME03a/a9uRnQAI16acM9hPZHojY9n/lB9XkjcGc4Qx?=
 =?us-ascii?Q?rHmm9dWsz/wIr5zatdgculA3+Sx5vVCWO6yOQeygExT+PgwoFhRzYjgBJiZ1?=
 =?us-ascii?Q?ZKQF1riiSAS4ioVb1q3WPMMTyJJ7yaLpFGWUpA4CF2/iR8wZlFgt/qHVM4al?=
 =?us-ascii?Q?VKTVB60HiMa/Nq9bmIyhiAfaGzZ74DIB2m/57NIOQ99Tk04cE8w5mUPT+E4Y?=
 =?us-ascii?Q?TcHAYEs/N3kma0PokAqI1lDsWuwe6dmw+dbVBFUS6vc9FJsV1+DFSVCJBjNi?=
 =?us-ascii?Q?aGR2Zreu47HU66A8uF2jcP1qGnH29qCb8uR/j5fKcPdNCxt0l8iaAlYAaawd?=
 =?us-ascii?Q?Qf89FN/GEy1r7iVdnPykNH2Q/2aYPORb+ALDAVJZYKfTBv1wcE/WUHObl3a/?=
 =?us-ascii?Q?xegykSDqZsJciRztCMGScVJVCc23nkMDdkSplDTlJ1sc0Xv4ATqnT3iQxrQi?=
 =?us-ascii?Q?TZgIXjka7gSZ0edE1RF55JtD4BMmRhSlqjPqyFz6InK5q12XS6j4gUvrWQa6?=
 =?us-ascii?Q?5FgFOUpe65jjw97AuaYWgDRe5OScb4Cj+Fa1K/XlWB1dvcZEGv+XpWdZZBmJ?=
 =?us-ascii?Q?UCjOaoD0/0ilBepdpWEm2Yofa+uzkda1H4ONAvrJp3+FiYGxu5teS/7+HIiC?=
 =?us-ascii?Q?yUHKRc/7Itn8kLr4Dnb5nkZjETqMqT7rbaMtvDFvkWxOPLqPVeww6NyKRcaf?=
 =?us-ascii?Q?B7XR/e3vMwnKH1yZDW0I0D32Vd383/NhAd6sw3UqOqr40TwZ4LHRwHjG5F5c?=
 =?us-ascii?Q?XsqCc7sWpMoh3cK9M8N6mrftHbH58N5EyqAVuuNIKapgMYQihPNHiswr6tMr?=
 =?us-ascii?Q?pdzqvqqp0E4EBj1mrnbmqH5nAexdRVjrgsQLIBeE8YQbuvgRAfO+JwRE74bj?=
 =?us-ascii?Q?c7vE5lZfHTJAItHDFHDtZo5mhBBbmKw7CREounzu4Iog/fjOtvb3Kb9da9ZH?=
 =?us-ascii?Q?FsL6dFTCFsTZgFRrhNnIFtAIRBAx94bKTcsXDoFT+YcVmJJWZcmd8Heqvwkc?=
 =?us-ascii?Q?0m/LtON9qhjBAm43R8oTLNYhDtF/4KNE0xQjJahuyMlWAotGkqjuKJyajiBn?=
 =?us-ascii?Q?zklqnjIJrWYCTpEUMG6XtYHDSY4TuJd5yQHccahOKUVcji49ioNbCcj0HFZ2?=
 =?us-ascii?Q?Hdy2+Y50iBjQUjKBI5dDZnnDPbLUpqzZDFDT0wumNwAUt0cwpgOZShiOdlgL?=
 =?us-ascii?Q?HxX2EcWjMFgWAiz5EsGEEt7I?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BOBQweqWDN7lg29pvqwhuRPRg1irnWkrft9Vn+u4HdR/xaULzacqnA4d2r+d?=
 =?us-ascii?Q?sy+CvlR+vg9qIqKw/G6j7VWjvla9rZKz4fu/bfS/YLySvTwgaXI7YUeFqgCD?=
 =?us-ascii?Q?XlGOn5bCa1llwjPBom9JguXZpzLwmh1lfBfbye4/3uCA7COKOLCdaAjOl8fs?=
 =?us-ascii?Q?nUKzWUyfH7oBK+72DrlPGWGDU7llLbThi8qNH/GfBYTzHck3xi6rsK+P5otF?=
 =?us-ascii?Q?v2EGwUzULTqJuOdHFkZKQhpnVumVqQQMJhIVZ3ypPfbDB6hT5q/lnt3mmm+H?=
 =?us-ascii?Q?2ISrpVKoXnBT7c/XnwfFF6Vy8U9sq9rhLD8vlRjC0LQXTsdbkHlRIaPejzon?=
 =?us-ascii?Q?oTJjbxP4xBkLCUOyhI0MqAqDwGjZzb9MA69aeDJBS/PcaTY5lMkkZ6A/8qLX?=
 =?us-ascii?Q?BC7trJ9LRCkM5tMFnbOq9J4lE/IG0oePWliCPNgE1lVlriA84RsvNst/Wz5Q?=
 =?us-ascii?Q?Nmq3SSfpdqykc15aXmwhF6eh+TUwd9VUFN11kbfhtD/IG9FqCK0QdFai0M0+?=
 =?us-ascii?Q?wMr0sxKLLdLsSfSNKSyNPC/6GCBXWUOoSzK9z+clytG2X1dMcVhnKL1V3w6l?=
 =?us-ascii?Q?SGTo2lBMqmhW6JnHU7j9C/c0PMGlmvJJ0NWfAGYpvsVZF9BMnt/3tJAay4o9?=
 =?us-ascii?Q?Q+4nR/TvgEy/hJrVsNWpBD2NA/cbLK5oa1mpTeaPe1jC6Qqd0D9zO+Nj374U?=
 =?us-ascii?Q?N7GVliiOh3WIlG4Sr5/+wIGHmZQxwRxLHr+cVzGX9/1pMbyPGynoBiRzXdbU?=
 =?us-ascii?Q?xE42X61E5OYuBcr1i4Bfh3WCfj3DOl0fhWzmuZEdQM5jueFRdhWgg8uVXsyb?=
 =?us-ascii?Q?vVxt2xKSu1anCmUcNQXH0KjbRG/DZmIdMIZNt+GLgUPLXLVEV/JFIYgsCAlR?=
 =?us-ascii?Q?ucb+JJBtHICy2WG7Tk9gdKV1xqmRVYpLtzpRt/+6EcoYuT7rhKSRsS+y4Xzq?=
 =?us-ascii?Q?w+Jxq0xVKZI7BqHTsW4RowhArHNCk9ay8Z8lFhMkKLXf5QhtsukMJYSUZm6G?=
 =?us-ascii?Q?y01HSQrytOeXgDtU4s///VjL3n7GrI651lQLBiYmNV4/0uYYTX/nbzF331Ki?=
 =?us-ascii?Q?dbCiQ+eWbfwsJ7AihSvABJLEVPNng6ICEFrl4Q6XIJCmxl9OsUsCxL+HXjhr?=
 =?us-ascii?Q?P+ylIz/o105N4ttmU4WNlETj5Ucn/sE+7C403Uz95W8Vy1ccCPe6bhf0d1jJ?=
 =?us-ascii?Q?AonG4OupbmpU66XGlMAEN+dbY0vxORnMAhliwDdagZi47SIpy+4CQecUMg9i?=
 =?us-ascii?Q?RpR2JDwWdtbE7JupfEmvDT+0DdBIkf3iy6JjXK3INlr4LSdhSspK7lbLjAj9?=
 =?us-ascii?Q?10d0fKBgRaqaRr9gsi6/Hno7Ll/Kz63PR1QDuctMLjnbwxvuM+Fn8fbaRVSO?=
 =?us-ascii?Q?wfueYitg6Bh6k6h9rGtcCiWhoHWR30NgBEMt4gAQbvbByqxGM6Ej6ON0qxFH?=
 =?us-ascii?Q?ftzdgWpjlxXG6xmLRvFj77Xa1JrjhilDYP7kAhACkLv/xQuADdj3ONiyYRUT?=
 =?us-ascii?Q?3Y9yMRD2lRmIGAN60AeB+VaouhHNcOqmvcg/i/PvQr+ML5nXZjVPkAcPyWKb?=
 =?us-ascii?Q?7qxvNUSMcMyxIB4OWF2txGvtfmb9F/8LoIppKHc3l+cS1tH2xs/mTb52ulad?=
 =?us-ascii?Q?RA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09a0812-1247-4f85-7a4d-08dd0ab50854
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 05:18:00.3759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6yyt524+8RdnHMHLXcgtNieHku49WyUnZFw68MuNNW6gvEWvbVoj2BaA4oeXsHgh6zGKmTtCOU2z1PNdRtjnu7RD5rcnqOl5yblRqH7htw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
X-Proofpoint-GUID: nJ-9BJUV-2oTdPuaMiw8w4yasEIiESb2
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=6740140d cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=hqBzw_eTAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=jYJ61ryfAAAA:8 a=J6owyr6zO-tr3Sa6r84A:9 a=bkWp_v3HvcftT6DRAIDL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=eNvJ01k53lG8zT5pDJgy:22
X-Proofpoint-ORIG-GUID: nJ-9BJUV-2oTdPuaMiw8w4yasEIiESb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_17,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411220043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207589

Backport fix from upstream to resolve CVE-2024-1298

  https://github.com/tianocore/edk2/commit/284dbac43da752ee34825c8b3f6f9e82=
81cb5a19

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ential-UINT32-overflow-in-S3-ResumeC.patch | 51 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential=
-UINT32-overflow-in-S3-ResumeC.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential-UINT32=
-overflow-in-S3-ResumeC.patch b/meta/recipes-core/ovmf/ovmf/0001-MdeModuleP=
kg-Potential-UINT32-overflow-in-S3-ResumeC.patch
new file mode 100644
index 0000000000..264820138f
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential-UINT32-overfl=
ow-in-S3-ResumeC.patch
@@ -0,0 +1,51 @@
+From 150ea3ea4c821b133a782eeb33ef2a9c8fd8d7c3 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 22 Nov 2024 13:05:57 +0800
+Subject: [PATCH] MdeModulePkg: Potential UINT32 overflow in S3 ResumeCount
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4677
+
+Attacker able to modify physical memory and ResumeCount.
+System will crash/DoS when ResumeCount reaches its MAX_UINT32.
+
+Cc: Zhiguang Liu <zhiguang.liu@intel.com>
+Cc: Dandan Bi <dandan.bi@intel.com>
+Cc: Liming Gao <gaoliming@byosoft.com.cn>
+
+Signed-off-by: Pakkirisamy ShanmugavelX <shanmugavelx.pakkirisamy@intel.co=
m>
+Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
+
+CVE: CVE-2024-1298
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/284dba=
c43da752ee34825c8b3f6f9e8281cb5a19]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../FirmwarePerformancePei.c                         | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/MdeModulePkg/Universal/Acpi/FirmwarePerformanceDataTablePei/F=
irmwarePerformancePei.c b/MdeModulePkg/Universal/Acpi/FirmwarePerformanceDa=
taTablePei/FirmwarePerformancePei.c
+index 2f2b2a8..2ba9215 100644
+--- a/MdeModulePkg/Universal/Acpi/FirmwarePerformanceDataTablePei/Firmware=
PerformancePei.c
++++ b/MdeModulePkg/Universal/Acpi/FirmwarePerformanceDataTablePei/Firmware=
PerformancePei.c
+@@ -112,11 +112,15 @@ FpdtStatusCodeListenerPei (
+   //=0D
+   S3ResumeTotal =3D MultU64x32 (AcpiS3ResumeRecord->AverageResume, AcpiS3=
ResumeRecord->ResumeCount);=0D
+   AcpiS3ResumeRecord->ResumeCount++;=0D
+-  AcpiS3ResumeRecord->AverageResume =3D DivU64x32 (S3ResumeTotal + AcpiS3=
ResumeRecord->FullResume, AcpiS3ResumeRecord->ResumeCount);=0D
++  if (AcpiS3ResumeRecord->ResumeCount > 0) {=0D
++    AcpiS3ResumeRecord->AverageResume =3D DivU64x32 (S3ResumeTotal + Acpi=
S3ResumeRecord->FullResume, AcpiS3ResumeRecord->ResumeCount);=0D
++    DEBUG ((DEBUG_INFO, "\nFPDT: S3 Resume Performance - AverageResume =
=3D 0x%x\n", AcpiS3ResumeRecord->AverageResume));=0D
++  } else {=0D
++    DEBUG ((DEBUG_ERROR, "\nFPDT: S3 ResumeCount reaches the MAX_UINT32 v=
alue. S3 ResumeCount record reset to Zero."));=0D
++  }=0D
+ =0D
+-  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - ResumeCount   =3D %d=
\n", AcpiS3ResumeRecord->ResumeCount));=0D
+-  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - FullResume    =3D %l=
d\n", AcpiS3ResumeRecord->FullResume));=0D
+-  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - AverageResume =3D %l=
d\n", AcpiS3ResumeRecord->AverageResume));=0D
++  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - ResumeCount   =3D 0x=
%x\n", AcpiS3ResumeRecord->ResumeCount));=0D
++  DEBUG ((DEBUG_INFO, "FPDT: S3 Resume Performance - FullResume    =3D 0x=
%x\n", AcpiS3ResumeRecord->FullResume));=0D
+ =0D
+   //=0D
+   // Update S3 Suspend Performance Record.=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index cc2ac4268c..ada6ee72db 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
            file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch \
+           file://0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-Resume=
C.patch \
            "
=20
 PV =3D "edk2-stable202402"
--=20
2.34.1


