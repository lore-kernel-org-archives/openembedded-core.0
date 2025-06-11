Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A759CC61CE7
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 10:59:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4953.1749639595904188025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 03:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8257d95e65=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B7noYp029973
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 10:59:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2m91t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 10:59:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MA73HJCBM1ff5EDz3rL5f4xRci27T/JxI3Gpw0HJXKZPLPtWoyi/WoTpJpVTNBdE3WhmjjK0931c8dkCY9mctJU0VBGK6d4Xf/4WGDhY/MRJQAq0rpGSIGlsKJvWh+zBjeFnj1478Jek9yFzJe8sisdp8s96eS/PUT57bo1ofsrikcHlZ/eyzDK9iQHGEyMdoCTtWH7Euc4lCIFzjkTvZs6fHzQrLvls/tx8Qw0OXJ5eheSo4bUsvqmXpENCpPjNIuS70JEVScuHu2JTOUXhU0vYLh+ti0CdU4CA3HeBk/MAR+v4+4azaOHA0kkIbidYYRpOK420PksVsfkaUG+WeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KS9EP255VK6lzbph5da/C6xelrJCc3xtP06PH3eYOK0=;
 b=GhgmEYoC6s1FDWkz4or5JaKEMlI0SoyH50yFDTF2sPt6p9Z9U6gFJXYZX9wti6V5u7npvStS9V1OATfZMliijBy2jhbE+nveUiKZergRDQU2h/iug8ZjXzog4VpucY1mYtrnkn2sn3xVFdPBR3EWyXURMVyT0pp62IQV8pX9HqD2KzPT17GoeIkLKE/f2aWxsHGf+Z47s4KR5MUbRh97Plho+RtzLkSjD2XKxvGJ5GWGPIOpkvPxJNjQd+kNVRuQEED5Ucj7BvI117FBNKynIhCFqoMqpdfz6BqOldY/v3R1jvKXlQi7h38ziC904SNR/45Bn1ojYlOuODjSpsndXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH0PR11MB5030.namprd11.prod.outlook.com (2603:10b6:510:41::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.22; Wed, 11 Jun 2025 10:59:51 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 10:59:51 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: sunilkumar.dora@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] Glibc: Fix for CVE-2025-4802
Date: Wed, 11 Jun 2025 03:59:20 -0700
Message-ID: <20250611105920.1636034-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0007.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::12) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH0PR11MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: d975876d-f632-451a-46ed-08dda8d716eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/6ckHqB3GNAoD0vqXRxXuoAgsfnv93uUxJB/Ccx4wf0Ke1FeMZEECqSofxVU?=
 =?us-ascii?Q?xgTCST7lUdIOUc4I8GL3O22UqA9QTE/OA6OhLBJKhKK2VdTlyiV0x7dw8IN9?=
 =?us-ascii?Q?YlgKgj5+YCKTPNmLt8duWeN0YgKiLdBw0ZYwwzYthdQSDVPledlltZBqYYsY?=
 =?us-ascii?Q?lqVYl8GkmMGPZ8c0GJOPUAMHa44D6CsT1WVpEuzFcEPsEb8K0yHjDuSNns0h?=
 =?us-ascii?Q?WBSXbVTlTsOuHhgfnCv/ACGIYEt3D/9FKgYdJCoNOnVM8rO20N8FXuWX+Pac?=
 =?us-ascii?Q?TOg5pgWfLVfttb9iOUgdnM1O0z9d43oOHLJD4czoD/Qs1sRaglK6JIvH7cWf?=
 =?us-ascii?Q?MUUn7zj2RDXDg7SF7PcJU3LtWAcADUUR9Jan3X8NRpiJ7vnJtVQ58qfv4Tf/?=
 =?us-ascii?Q?o1i6Q9naJ1tXpEehuMAJVl+XC10HbCJeOZj5LsY36osYBBZ8FOHNs/Kh/62v?=
 =?us-ascii?Q?oX5SkWJJ4gU+VpMLCIEjWZwhRkmfNEA5vcgZyWj8I35DPaSPwAxx3/vNZyVO?=
 =?us-ascii?Q?moIY3ZHnraubFKbsUifINOE92Upw1koFh500WZyF0MIO/OOExkeYdj8U1KmN?=
 =?us-ascii?Q?PDByBbLXiTfEH3+524A3zSusjIxnmKvQd4lfUHe/77akAVcfIQCzK9B2oksC?=
 =?us-ascii?Q?LZ9/fD60OkdZDMtT6kN84e6PJ8GdzEwiQPuY/A1EmPYmL27NhYk6Wks9+Dox?=
 =?us-ascii?Q?wNNyAzr8c0WfBIcPXgcKtoDTsaFRFqpbgIe9Q5ZoC1+8Tdb9CFKpKWqavt5T?=
 =?us-ascii?Q?oqGr+O/HQe9PRTvfDiZ8Is6le9Zgdgh4ZOCdYCCu46BvmctnHJh/vf1Mrv3t?=
 =?us-ascii?Q?58IsOW83fx0Fte2a4QdXm9m258WdNbyGmCjYE167HPmeF/WuGQsApK9qPADH?=
 =?us-ascii?Q?yqSMuM+7H16PrFzN4X9NCFLo/MyfcEZ/s5paeINuBhheQQ8Mhvt0VTwESsja?=
 =?us-ascii?Q?X+mVGWezAjBIfQb0mykVUCV/qoYYfhzyhXp60EKQTl9zAxkW7fHOGz0hVjzt?=
 =?us-ascii?Q?FGJadLcvgur2MS1aqMs2smuFVbSuoCZyXnaXQLVdBhCURhk9iZ4pigjY+sw2?=
 =?us-ascii?Q?/ftnvPomORPDvI+2ZHKcCbQU6hUKp2azUcMc/pTaX6SMHAPZ8kke3schwkwm?=
 =?us-ascii?Q?hnjS3WRsO8zPU/QxOYq6LJ1am7eC8NuNfVr4k6xa4pt/yBVvKDmY3PKyXxBf?=
 =?us-ascii?Q?ljI1Q6i0b0BNvc1eWeCxLF2FzQe/6sqkqk4JdhyCASjCaJYTIDdhrTWUCi+C?=
 =?us-ascii?Q?4HXsF4E2bNpKrDCcAHVtRO89m9XjSQ6Ds3QdbsEXlpiKsNjh6rb6+5ujdh6Y?=
 =?us-ascii?Q?w0DAEOpvEliGiquGvO0+M2GDZLbvyP0BCJronrf7UMIT1+jpOAWvLVn1EKV8?=
 =?us-ascii?Q?xVyuusN42A4C76YI8B9ee8826qemOI+Q+VVIQE9dOUAYo6hFLtP12LUyuScM?=
 =?us-ascii?Q?vNf5KZau4hRaOZr7A190GggRcaFoH6qS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zMO7fnmaN0criJcCU5vnBJIzaayBrrL03Z3YkDD6x8ze2ruYpFNFg+f/p6Cp?=
 =?us-ascii?Q?NO5qeW3Rh25PcKywxbcO4pmWdw5+bqM5evdqFA/T92AaPis2RFxgpt8tboV+?=
 =?us-ascii?Q?k+kWaCbTIfZg3gaueI1QW9HTTYD6wJ0R2hF25FXJiMtbhbEX5DhED3IXS/KZ?=
 =?us-ascii?Q?+j6Mf2aUNtgOa8a01SYLu7x6c/BA545zqllQfGacZ9Do/paY9ocQ/QPerBsA?=
 =?us-ascii?Q?hDXRexmzWnd5XmuohUrh4km9Wi3DO8mGeiY42cNwV481sgLbTLnuaHuAAvXz?=
 =?us-ascii?Q?bxFkA6/Poh18cwU3mtGHok77Pgr69IVXiv2xiu91aYXhDR12MYfpwZXG/mmt?=
 =?us-ascii?Q?XLYaexwydWI+KTrv7ogVegX+1M2XTTPxgByroQWJARNhc8X+2KCUOqk20VQ1?=
 =?us-ascii?Q?EB2MnEqzEPlUd45CVdUswmexTafb5ItKtIadMSNaSyd2qlJ0N34DWQgRGqrN?=
 =?us-ascii?Q?TYwKRbH6G4JSvm4vaf6pJQPZ9sMy87sWXnqhputpXljoTXJ7AiiZtgJbXCco?=
 =?us-ascii?Q?WyJ+mtgym48BAgIeli/1xOwnHZ/nZriQ5GnDHbmQo2cdk3CqchSzwPZrF2j4?=
 =?us-ascii?Q?KnKzM46ToPLj2IGMTF82KipszLydZs9UMs5+zdm0rYLJguWu5Wn8X5guKvgo?=
 =?us-ascii?Q?lXov5bKKifUS2oS4oGyFerwvnplUwj8UeJfcoIUXUGsiku2T7OBUtqOHPtr4?=
 =?us-ascii?Q?T/x8gzlVWDwmP6I1sdKpDdi5efU06UXfUgHCcyTu5c9FAJkmrQb61Ou82kQ6?=
 =?us-ascii?Q?sCapUQnoiIdvVRrlioeNP3jTIWufj/PqN61S6vhQDkZyOe/oGtxzK+W4Wmxs?=
 =?us-ascii?Q?jKIU9Y2LpalxdwXe/tq7NOfjskk72t/jMLtIb+Od18kNNBGJuxts6Xp6Qus1?=
 =?us-ascii?Q?IxaHrTeVkY41I8xJ6W7rXckVyactgs6PtRcSkKqTjp7hMTocDBRk8fY2XCpC?=
 =?us-ascii?Q?0lj8v/Onp1nbu0EQ5sKqUzety/6r4YOkLZeE1QgcZA8spVqLyr1QFmnSXgNh?=
 =?us-ascii?Q?ZoLANIsKg7YMmuxg32PweoVQkTtzIiXzOiAG6NEnijV1yDASwUHHISFzNwEn?=
 =?us-ascii?Q?HEpPpuwVW4B+BnTk7sI/wYuCgEaeLEOddmXRbLfJDgzUdIJqbLsJnRSZ1XVL?=
 =?us-ascii?Q?lugyt1CGanT0krl9f+5FLrE8N5MQGemsnFoyj33DlLNAPxGRKfrSslqq0c7H?=
 =?us-ascii?Q?mJ7ZH5ZXbbBx9hrrOtAdasBQYVjD0Q4FH+3KhkQIuMV7nbeD8XZFkgLoCQOP?=
 =?us-ascii?Q?5JFJNXjRj6xtGwN0gl1uuNEltznM+YdSQjH31Sc6X/+E7ITAhrOL323EgKmM?=
 =?us-ascii?Q?PITry9ROS0uW3BztFA14GQJY2Tw0lr1PlkTmiKHXzYiqfQ9w6FSBdYJP0fiD?=
 =?us-ascii?Q?75BCZ/fGLNGd8tptgvQT0ZYFaCN5TdzZST8IUpe87JVE6mL3b1X6aI1Edarl?=
 =?us-ascii?Q?WdTih6dShyZY+Xo6bERprhOk+p+bjkjjtPyYTPLTmSpfAnbwM4U4fQ7hLkDo?=
 =?us-ascii?Q?KLJbP5PcO//yGqpX946QcynhWzfgS0fJcHa5XILmwiUNUCQY4pLT/kGFVCnh?=
 =?us-ascii?Q?RZILNOs9FzQWNedYZCoiIbVl2TfNdPpttxON73T1pggd3NeEo6ToKwPDNr7l?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d975876d-f632-451a-46ed-08dda8d716eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:59:51.3847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mu2QULsj1iyVWL3bpEPc3kUNvTFu/k2LoFMExz7HtIP8rHqfiIkIt/97fGM864asPYSKJqNIAohKOKJ+bK7J2Gp6FQDAl1Bghy1IkRtL7eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5030
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5MyBTYWx0ZWRfXwx32OE3osHgf bO3JYIy9gn55AGfV5vjGEEFi3K+OboX4FUkYzkMexx9p8udYAuIoKwWL6ZUb9f5a8MS4K7M88n3 NVteoVsd0EK+/rqJzrsHgoFPHLvyBYkHzfCpmZKBZYxfyMWaUDBcLbV/1/QF4hDZ+H6Jmw58gUH
 LUi9hK0wF1KCLFVBGJ8vFolFUUqxjHKzz4j8+dWRZwenV0fJX2wK0VZy07q3FhJSNPscOhSXdFR uQpVxM5bOAcG02qEo2ldx/AcPKgXDSCJTBrQoeTanUvBk7yDmXoKRODsNVMiisQGiA5wzcKkNf8 hjJ5udlIeGcjKRd3SYu18izvgmUk8MGBkKqRQyBeLa4rO7htTFLSmX113sOOjO3At8Q4+XlX6Wu
 0HKulmPamjnvBmKjAZU2yXAyJa9XnniNI6IlBc0CQOOhbquOqu4FVxB6C39X/OtRaGVHoK4C
X-Proofpoint-GUID: mcLarWuCiLoTQQDQ1zQv9HOolEOEkdh_
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=684961aa cx=c_pps a=K3uzq/QeDaRwdbRgqMx8hA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=YV6vfrAavRWOqJXlchkA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mcLarWuCiLoTQQDQ1zQv9HOolEOEkdh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506110093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 10:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218447

From: Sunil Dora <sunilkumar.dora@windriver.com>

elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static
[https://sourceware.org/bugzilla/show_bug.cgi?id=32976]

Upstream-Status: Backport [ https://sourceware.org/cgit/glibc/commit/?id=5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
                            https://sourceware.org/cgit/glibc/commit/?id=d8f7a79335b0d861c12c42aec94c04cd5bb181e2 ]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0025-CVE-2025-4802.patch      | 247 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch

diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
new file mode 100644
index 0000000000..319c447207
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
@@ -0,0 +1,247 @@
+From 32917e7ee972e7a01127a04454f12ef31dc312ed Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Wed, 11 Jun 2025 03:19:10 -0700
+Subject: [PATCH] elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for
+ static
+
+It mimics the ld.so behavior.
+Checked on x86_64-linux-gnu.
+
+[New Test Case]
+elf: Test case for bug 32976 (CVE-2025-4802)
+[https://sourceware.org/bugzilla/show_bug.cgi?id=32976]
+
+Check that LD_LIBRARY_PATH is ignored for AT_SECURE statically
+linked binaries, using support_capture_subprogram_self_sgid.
+
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
+                            https://sourceware.org/cgit/glibc/commit/?id=d8f7a79335b0d861c12c42aec94c04cd5bb181e2]
+
+Co-authored-by: Florian Weimer <fweimer@redhat.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ elf/Makefile              |   4 ++
+ elf/dl-support.c          |  46 ++++++++---------
+ elf/tst-dlopen-sgid-mod.c |   1 +
+ elf/tst-dlopen-sgid.c     | 104 ++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 132 insertions(+), 23 deletions(-)
+ create mode 100644 elf/tst-dlopen-sgid-mod.c
+ create mode 100644 elf/tst-dlopen-sgid.c
+
+diff --git a/elf/Makefile b/elf/Makefile
+index 61c41ea6..3ad66ab6 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -274,6 +274,7 @@ tests-static-normal := \
+   tst-array1-static \
+   tst-array5-static \
+   tst-dl-iter-static \
++  tst-dlopen-sgid \
+   tst-dst-static \
+   tst-env-setuid \
+   tst-env-setuid-tunables \
+@@ -807,6 +808,7 @@ modules-names = \
+   tst-dlmopen-gethostbyname-mod \
+   tst-dlmopen-twice-mod1 \
+   tst-dlmopen-twice-mod2 \
++  tst-dlopen-sgid-mod \
+   tst-dlopenfaillinkmod \
+   tst-dlopenfailmod1 \
+   tst-dlopenfailmod2 \
+@@ -2913,3 +2915,5 @@ $(objpfx)tst-recursive-tls.out: \
+     0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
+ $(objpfx)tst-recursive-tlsmod%.os: tst-recursive-tlsmodN.c
+ 	$(compile-command.c) -DVAR=thread_$* -DFUNC=get_threadvar_$*
++
++$(objpfx)tst-dlopen-sgid.out: $(objpfx)tst-dlopen-sgid-mod.so
+diff --git a/elf/dl-support.c b/elf/dl-support.c
+index 09079c12..c2baed69 100644
+--- a/elf/dl-support.c
++++ b/elf/dl-support.c
+@@ -272,8 +272,6 @@ _dl_non_dynamic_init (void)
+   _dl_main_map.l_phdr = GL(dl_phdr);
+   _dl_main_map.l_phnum = GL(dl_phnum);
+ 
+-  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
+-
+   /* Set up the data structures for the system-supplied DSO early,
+      so they can influence _dl_init_paths.  */
+   setup_vdso (NULL, NULL);
+@@ -281,27 +279,6 @@ _dl_non_dynamic_init (void)
+   /* With vDSO setup we can initialize the function pointers.  */
+   setup_vdso_pointers ();
+ 
+-  /* Initialize the data structures for the search paths for shared
+-     objects.  */
+-  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
+-		  /* No glibc-hwcaps selection support in statically
+-		     linked binaries.  */
+-		  NULL, NULL);
+-
+-  /* Remember the last search directory added at startup.  */
+-  _dl_init_all_dirs = GL(dl_all_dirs);
+-
+-  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
+-
+-  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
+-
+-  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
+-
+-  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
+-  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
+-    _dl_profile_output
+-      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
+-
+   if (__libc_enable_secure)
+     {
+       static const char unsecure_envvars[] =
+@@ -324,6 +301,29 @@ _dl_non_dynamic_init (void)
+ #endif
+     }
+ 
++  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
++
++  /* Initialize the data structures for the search paths for shared
++     objects.  */
++  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
++		  /* No glibc-hwcaps selection support in statically
++		     linked binaries.  */
++		  NULL, NULL);
++
++  /* Remember the last search directory added at startup.  */
++  _dl_init_all_dirs = GL(dl_all_dirs);
++
++  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
++
++  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
++
++  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
++
++  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
++  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
++    _dl_profile_output
++      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
++
+ #ifdef DL_PLATFORM_INIT
+   DL_PLATFORM_INIT;
+ #endif
+diff --git a/elf/tst-dlopen-sgid-mod.c b/elf/tst-dlopen-sgid-mod.c
+new file mode 100644
+index 00000000..5eb79eef
+--- /dev/null
++++ b/elf/tst-dlopen-sgid-mod.c
+@@ -0,0 +1 @@
++/* Opening this object should not succeed.  */
+diff --git a/elf/tst-dlopen-sgid.c b/elf/tst-dlopen-sgid.c
+new file mode 100644
+index 00000000..47829a40
+--- /dev/null
++++ b/elf/tst-dlopen-sgid.c
+@@ -0,0 +1,104 @@
++/* Test case for ignored LD_LIBRARY_PATH in static startug (bug 32976).
++   Copyright (C) 2025 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <dlfcn.h>
++#include <gnu/lib-names.h>
++#include <stddef.h>
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/capture_subprocess.h>
++#include <support/check.h>
++#include <support/support.h>
++#include <support/temp_file.h>
++#include <unistd.h>
++
++/* This is the name of our test object.  Use a custom module for
++   testing, so that this object does not get picked up from the system
++   path.  */
++static const char dso_name[] = "tst-dlopen-sgid-mod.so";
++
++/* Used to mark the recursive invocation.  */
++static const char magic_argument[] = "run-actual-test";
++
++static int
++do_test (void)
++{
++/* Pathname of the directory that receives the shared objects this
++   test attempts to load.  */
++  char *libdir = support_create_temp_directory ("tst-dlopen-sgid-");
++
++  /* This is supposed to be ignored and stripped.  */
++  TEST_COMPARE (setenv ("LD_LIBRARY_PATH", libdir, 1), 0);
++
++  /* Copy of libc.so.6.  */
++  {
++    char *from = xasprintf ("%s/%s", support_objdir_root, LIBC_SO);
++    char *to = xasprintf ("%s/%s", libdir, LIBC_SO);
++    add_temp_file (to);
++    support_copy_file (from, to);
++    free (to);
++    free (from);
++  }
++
++  /* Copy of the test object.   */
++  {
++    char *from = xasprintf ("%s/elf/%s", support_objdir_root, dso_name);
++    char *to = xasprintf ("%s/%s", libdir, dso_name);
++    add_temp_file (to);
++    support_copy_file (from, to);
++    free (to);
++    free (from);
++  }
++
++  TEST_COMPARE (support_capture_subprogram_self_sgid (magic_argument), 0);
++
++  free (libdir);
++
++  return 0;
++}
++
++static void
++alternative_main (int argc, char **argv)
++{
++  if (argc == 2 && strcmp (argv[1], magic_argument) == 0)
++    {
++      if (getgid () == getegid ())
++        /* This can happen if the file system is mounted nosuid.  */
++        FAIL_UNSUPPORTED ("SGID failed: GID and EGID match (%jd)\n",
++                          (intmax_t) getgid ());
++
++      /* Should be removed due to SGID.  */
++      TEST_COMPARE_STRING (getenv ("LD_LIBRARY_PATH"), NULL);
++
++      TEST_VERIFY (dlopen (dso_name, RTLD_NOW) == NULL);
++      {
++        const char *message = dlerror ();
++        TEST_COMPARE_STRING (message,
++                             "tst-dlopen-sgid-mod.so:"
++                             " cannot open shared object file:"
++                             " No such file or directory");
++      }
++
++      support_record_failure_barrier ();
++      exit (EXIT_SUCCESS);
++    }
++}
++
++#define PREPARE alternative_main
++#include <support/test-driver.c>
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9073e04537..1ea4d5a252 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -61,6 +61,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0025-CVE-2025-4802.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


