Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A2CC83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 12:46:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21351.1752669996158550730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 05:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92925dd44a=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G5Z30D1439120
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 12:46:35 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxhugv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 12:46:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmVeq+ngcZSH6LT2ab7W11jmIu3jESQdq7f/cwUi8hLYyM+rziSPGr/B+6WNedYV5/Bka64vpC4daZRmkVpjgF1iyoKhu08FS/9m15f8YVAUnuWRhxbqcVyHK/Jgd6ms276tFVmsGueWJHVKZjJYJ0nmsMwBHFPVjnLOIqcUcQVKGQXBJkuoLwjhcbu2BwmpiyvmlaVriDeKC9AlZ/6J9pJSGd/aMYzqcGJUGHYf1QQrx6Jphv5PmMPOl/d1hczmuDUHpdgoh6DgqA76comLNMH5mgXQPlLw6YBVBQyXOO+DU3p2FIhCzyw7gx/kIYe4SToxYpaoK4+sFeDaQ2I/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HG6bFGKUfDVMqimyTkgRwcFsM9cgMzGMrDVNsjgF6uI=;
 b=J0rkTCscxi3saS1PaU+0oqVOqmmxC7+oB3URcpAbjargKT0LQz1V+hnG2gtTC+eSC6gRBOvlznGW9k/KncITcBbeyYdKpkJLJ3KQB82k51oCohlE0giN8XGpPoQ1Whwp343XBRA9soqYpAG7W+ajl9cxCNGUAZfQ2hpoZHjurtwyhK6oxgUCCHR8lK9WPXse3fZ4anM2eKtmZdMVyvsn52yZ23dAXxpnXoySN2Cq5ighmtW6Fy5fqEIy8LsI33/6LLdZBf0qGN8pM8lW5iYEJdTrgg1zd78XnS5YmRqVAMk7k2PCQD7JfLfJDyKq5pBXEszSkA5Y815hHuHWBUlySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 12:46:32 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%7]) with mapi id 15.20.8901.036; Wed, 16 Jul 2025
 12:46:32 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-7546
Date: Wed, 16 Jul 2025 05:46:09 -0700
Message-ID: <20250716124609.912756-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: bf39e11b-3ac7-49ec-1292-08ddc466ca87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DdR+3/Xwv9vAh6YBKbzLW7ZkYlLJiyXh3jz8BcVRdYSV0fCKfKWFxsVZPyNs?=
 =?us-ascii?Q?ZIc0NaZhLRozluM8PKG4EZnHaYiGn3FaPYTE08BqBMBn2FsBc18quRnjHVk3?=
 =?us-ascii?Q?PcPmoM7pZSgwIemcGbXBVYQisU3ja2A1+GAygnmw1JsFUZx1jIkTClTeNo1A?=
 =?us-ascii?Q?XM4wEoCujfMzA4cSdWH4TfkICizJH6hAEOw+S3qQ2oH9bR61ovVkKnCMrA+Q?=
 =?us-ascii?Q?rCwRsLudJJ+d3KJXxDSnCr9euaPEVwvgwD3seBYkU6n2EQbkRxYcPBJQ7kgp?=
 =?us-ascii?Q?oMUST4QulQrk4saW0Nv5gqMSwzQW/CEFrZMjKGmegIAirEiV65Xw95uZZJGZ?=
 =?us-ascii?Q?hIaMGcgNLRNhJSB+3Qz/5qmB111whIO8drCozcZ3b34PCj8ocyoipclvMK7Z?=
 =?us-ascii?Q?lFPAtCgBDXpb6qZU8UjjylLylhbXN1D2CxomQF8zfISSM7x7xSaCEmEuRb6s?=
 =?us-ascii?Q?EJC0uY4yLHeLJbnBovzogY21bS4rRkJBrfAmMv1ct97l1wz8D2D3LNdflLTg?=
 =?us-ascii?Q?0YIHkGVx5bbFQ8UWytzmiIO9xccish63+JLOg0ie+GrGPApc4mpmbaSz6ipp?=
 =?us-ascii?Q?03cM77VYynqQDxksQhdS6GCU5sbazAuPDL3hwRmcpm8tpRKFlqpd1Alf01pd?=
 =?us-ascii?Q?gLkgik8ieMiuLkW0fvNmAoGS0jGrd98yVoSXzdwOuC0b5532wwv/qQpLImdg?=
 =?us-ascii?Q?eWWPk86UJZs4rzzHsMmZMu9CFd36vZ7Vv9hVmyIZ5virtz5J1VnHN0+VKHMd?=
 =?us-ascii?Q?uOiQPIv7TvLfG1zA4aNToANBKDAyDNcx8ydGzGrYyLGAbkdD4pz+Qy0uoEku?=
 =?us-ascii?Q?UuClZoA9gFXQQv+tcrQn4+LCxOb8eyQkGzLd8KMi7EIq3p29UDGSy6JdxkzQ?=
 =?us-ascii?Q?/urqLQtRnEREFCFJzEJhUjwn29u3yxmFsrTaE7xHjN/njss0GeSOOsq2zGrt?=
 =?us-ascii?Q?zq2R0SCi81CCjpeZQpvAZ5TVtf7pZXNQp980Xd9UVOPIe7RH2ujglHJnoK2q?=
 =?us-ascii?Q?HMYtWB8yEhNXlccV5hre9LYMipWSF4iLol72+6Gh+9LSHC+Qoq4IYD1OjF7t?=
 =?us-ascii?Q?yl7umVsn5dFh2uWiqbhn6xOGNYcBJU3LPnBwanlZfnp6qrsNunaC7Bx6ETsn?=
 =?us-ascii?Q?4P2DGwOVrLVv83fBSwYCZWNY3NaVnyhUSJFM8dlByS7hB4TPQFpvLHYOHH41?=
 =?us-ascii?Q?z6yfXK+6bt95YdyubzC/v84e1OoIsNcFUC/h+Ra7jgKXymvVSYq3sOPaLH3r?=
 =?us-ascii?Q?EIhgie/VFxYY7DF0NjwiiSKfXPsqVqNU12aTrsYCK7nLbGbnwUsgIc94ahA0?=
 =?us-ascii?Q?hcfu19UwGUoymaFpgjtLEIVJQMQMlQImCXfc9JVb/s8r4ZjOhKzacSzu/37Q?=
 =?us-ascii?Q?bA2Y5kIkixsN3juWTHlh1ft6wZepvibrgaGiWtilo2S5oOSsG7NmHLOUqiRU?=
 =?us-ascii?Q?Nts0W/HrMhI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rAE/8DDOe/eexfZnWDZHLWElgqIBzOFhoe9iMr/WUxL8c0terGcxZWLq3Mde?=
 =?us-ascii?Q?wb+HGtROYaeZUcuyTsQOO8fkoRx4YSIQYWq4ITVDKmHmMLKsGjw0lZWnxFcd?=
 =?us-ascii?Q?eKYNj4/T+kmrQqfC1Su4SkFHdC8RU6dGbq8bmLF9uyOvkS25XB3eyMOMPZuy?=
 =?us-ascii?Q?ew0ap6K2LAQ5+h0XQ2GKKkcJt+LfyK9NWssPPI63QBykkPXQLrJxNvBdxyl3?=
 =?us-ascii?Q?fchMdKkYUbNVFmskrWQQ4Tuz2a/XTnrraekN1mVbSBMl5yFkw9qO4EU9IWLZ?=
 =?us-ascii?Q?fu1vSEf/56NU5MmgSsOlPVobqdJP4LQd5pCLqEWpeLVq0V8B4kLPcmuKZ2cM?=
 =?us-ascii?Q?zZdp6Z5ChSYzIxrPOsz7pDrwVT7cvTb8BHJZPT6tswHKQ3tjl8yaMZuMPH0a?=
 =?us-ascii?Q?6HON5tyW79J/xMSDiTZua0tQJRRo6/b+AdySdS/4Mvz6lv9XEf+UQLLzuQgq?=
 =?us-ascii?Q?AR3v4HD6Qjw9bDysWx4pQTh+M9lGKNAZBHUv9vFScChY3PA8ev8/NTBvt1fq?=
 =?us-ascii?Q?ApVSa/BZIabcTyjq2Xpt+fcxmQpoetV+1Haig2Uys9j8NKInf/3Go7Ujz33f?=
 =?us-ascii?Q?sxYB8xExTCTP+ukM8B+IEjBKBxPUbZqvJNkCBMP9bfEN/pRLWOzOAnMSueZ0?=
 =?us-ascii?Q?PwGalw5IbNY+xISlLsNTPTVR49Q0i8MEDj38kUR0KO0f//jOM3mCo+/MrljX?=
 =?us-ascii?Q?azOPYtxE/0zTFlInToki2U3FExJnM6Sv9Yk0RDq/RTXhZLh907P78wSsDK2R?=
 =?us-ascii?Q?MxqZHDOIO66jbfcr5li2xoz8pAChrDN5DxBXvMH3GU17bRXUGb5EAkyboOcW?=
 =?us-ascii?Q?m0MxoIuiKgCVdxLpdDNC+fHCZoe6gSAhAikjQH2Z2dMFZmFXoZ28nLAsttUT?=
 =?us-ascii?Q?BxZV3Lof5kKrTr0FpZsO2TL04Phxl/6wHfcehIHJpyR7UYNW9cwiNkE6ig6h?=
 =?us-ascii?Q?Le06WpDQgJehSK+650BTvZngFLgL0QfizY383QAumQpJ8uy4ktx5jeXW76Lc?=
 =?us-ascii?Q?1NL5EJ2oWAGFu+faS18KYEGI+o8oye6yTupbL65AU2AfKkonPjs2tJD0yBxV?=
 =?us-ascii?Q?ltg8cTiWonS3h2eWHgiOvbemjRZ2NpHMr4zfzrnsEmj6ysWtgez2EwCsLftK?=
 =?us-ascii?Q?01/Vt5lhO4XDJsX81qAQbFoFDHaLa/rrbq92aD72nomE3Eo215FtURa1n2qg?=
 =?us-ascii?Q?LPhTvS9niaFOaS2E8Vw9QD/08F+QFFlTrOuLzTO9e5K1QofHcatBGxHXuvKo?=
 =?us-ascii?Q?8mTpETnEA8bii1PZ4OVUKqQs3APDOPhdIsng+biSlHgPcxQEDJ9JmwjMUvS0?=
 =?us-ascii?Q?iCAa7afpZd+aGNfFTFjYstIFhCl3M7QxRlU9UImQF1ZX8gg4nrTE9kmm69NH?=
 =?us-ascii?Q?D1UP/RPuJu84i2yTA0ovtnr0S8iVVoo1MoFz7IK0dvisTBxgkjqQ0XJszNWI?=
 =?us-ascii?Q?1LnSSDg+PJbEjLVqA8eWq4xECGoRi9Zfoey8MhAXtLI4UeZgfeAlyy5onCY4?=
 =?us-ascii?Q?5bbsRJJXJ66YUy1BBKcGMgngG6JQ06mnijn861vpW6IDQCP+En2VAhFBktkn?=
 =?us-ascii?Q?ORFpA27QSjL/GuEr7QYl9oCGz5DkEjzkMTV8JpM/gI/6zgcJzyq86ay16eQk?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf39e11b-3ac7-49ec-1292-08ddc466ca87
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 12:46:32.1959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xj6/kzlG7DHP+G2YQEBo2aGGXb93q+B0c1BskjsB0JvHYZD1QSi44FXravtk01apNKG9bqunqGJ2p6XN5BRFu7aY05HqUZ0pfr44mPnvb9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
X-Proofpoint-ORIG-GUID: fW0yf7rXxBPL3lLxv9W1_cJTwbxcGKDF
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=68779f2b cx=c_pps
 a=yeGrG+f0JF9zvp/Z2aw8DA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=JpM3RfheRiMeTFbm_d0A:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fW0yf7rXxBPL3lLxv9W1_cJTwbxcGKDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX7zG4aQCR5MrJ
 5y6+IpbSEHqYlxNz8DJOLNhhCqCvalSsw4Gg+2EYzoX22Wu834iTeDtWFxuQfn2FtfubSjwh/0r
 rc2wzHDP0mrsePLrVDTTpIRGWpF90op4IdNpsRfQacIIWYGzt2jiEP/Nn95OcIa5IC4+aytuF+m
 nybtmmFUhT6+OtjlpWfkBCPsBenYVhuDk2/LhBF/ieCCadyUhfVVSEPhhnvll7SEdeeCnIyln8i
 mJdECJcVLTvJTbtKgaarkTh5JKmDR6fL9ObgVjWR6X4tPWb6qsirs6liTVSVLGoNB3BmA/gC0vB
 yJ8x5igBLJf/YLQ9XLogRF8UyCQpJb8miilD72QztiU2BvnxLM3UIwaliZ2NgKv0KAeR9B9cFpz
 /4Zdxdwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 12:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220451

From: Yash Shinde <Yash.Shinde@windriver.com>

Report corrupted group section instead of trying to recover.

CVE: CVE-2025-7546
Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
PR  33050 [https://sourceware.org/bugzilla/show_bug.cgi?id=33050]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0020-CVE-2025-7546.patch         | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7546.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 18bff2816a..5903ec95f2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -43,4 +43,5 @@ SRC_URI = "\
      file://0018-CVE-2025-5245.patch \
      file://0019-CVE-2025-5244.patch \
      file://0019-CVE-2025-3198.patch \
+     file://0020-CVE-2025-7546.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7546.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7546.patch
new file mode 100644
index 0000000000..23c38091a2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7546.patch
@@ -0,0 +1,58 @@
+From 41461010eb7c79fee7a9d5f6209accdaac66cc6b Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:52:00 +0800
+Subject: [PATCH] elf: Report corrupted group section
+
+Report corrupted group section instead of trying to recover.
+
+	PR binutils/33050
+	* elf.c (bfd_elf_set_group_contents): Report corrupted group
+	section.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
+CVE: CVE-2025-7546
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ bfd/elf.c | 23 ++++++++++-------------
+ 1 file changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 14ce15c7254..ee894eb05f2 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -3971,20 +3971,17 @@ bfd_elf_set_group_contents (bfd *abfd, asection *sec, void *failedptrarg)
+ 	break;
+     }
+ 
+-  /* We should always get here with loc == sec->contents + 4, but it is
+-     possible to craft bogus SHT_GROUP sections that will cause segfaults
+-     in objcopy without checking loc here and in the loop above.  */
+-  if (loc == sec->contents)
+-    BFD_ASSERT (0);
+-  else
++  /* We should always get here with loc == sec->contents + 4.  Return
++     an error for bogus SHT_GROUP sections.  */
++  loc -= 4;
++  if (loc != sec->contents)
+     {
+-      loc -= 4;
+-      if (loc != sec->contents)
+-	{
+-	  BFD_ASSERT (0);
+-	  memset (sec->contents + 4, 0, loc - sec->contents);
+-	  loc = sec->contents;
+-	}
++      /* xgettext:c-format */
++      _bfd_error_handler (_("%pB: corrupted group section: `%pA'"),
++			  abfd, sec);
++      bfd_set_error (bfd_error_bad_value);
++      *failedptr = true;
++      return;
+     }
+ 
+   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
+-- 
+2.43.5
+
-- 
2.49.0


