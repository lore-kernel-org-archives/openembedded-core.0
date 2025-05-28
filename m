Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DB1C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:16:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16810.1748441780270304922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8243f964ea=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SA1gWd011023
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:16:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b148ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:16:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbjqT1eerOuhEqUB/04dr9cJILeGKLJeTRCMEfFnqzeZqJI/p+E7A6q2iS6kmg2nt1ejiMWpkA1olhMgmszgTkD4JunUOYzrUt+LvUAb/ngxmFUHPsYEiK8HYEWMmeGYxacFEOJdDIZHRpH2Eg2pwZw3bUCcsCdrdNXaEEl+g9IM7dMY//umRSq6C+dKc8cgh4LBjR0tLljYiTmWqaEEe26M42luzU+/Bi3lpYyweziSRURxjoIRPCwaC5HUJTgh7VghBKVO9CRv1m2kgKV49/lj55WS5m3e0EzDuTyQb9WyfDxs3UwUNREgaA3rex9LHUDdbd7A1sR/+l3d9ZmXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oeTvfSsxZ/s0js1dqj6OHc6AmrSVFT9OK7m5ACUN6s=;
 b=DVFeG9Mgib3KUwcrqpwvmzlyt7Ohgs3ngh7a/OfyycPN4h7X9wUdQXf/c8X6FRT1PWCpwVTPLxkwJgkYPGzLrv0la4zZw2fW9QAppTOGS4t43792y2wdvHaFQyzmSfrWJF7VTwvD5LKW/AQM21oy5vdprzn7AuUoWwymWR456/KpAAPwsMo35TVfw3GX0ecjFTV8EUw66DSCXSXAsVCgFyyGJba72TntIxCfgN1ZNjjsIc3F/oAcmqh2HGsuMRkd0ZrKo5JQIL7xsbfObaPvKxyHU9Umiv5IgZw0XVZNa4NfvOhpz82VXDBXq8tNUeaXO3/78F7SuqzbdD6QCegS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 14:16:15 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 14:16:15 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2025-1182
Date: Wed, 28 May 2025 07:15:47 -0700
Message-ID: <20250528141547.3231251-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::10) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f3cadf-669f-41ac-67ba-08dd9df234f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ohh/pBe7TJ/faYmHVt9ah2blKrgQxjGLxvFTK35OEmr73a8iByApseZb5nOy?=
 =?us-ascii?Q?Z2BgfLmlswaNsIo18j47l6PYxx3gW1Z2070EH64Ohr2Ot1OOV1VAHiMZ18bQ?=
 =?us-ascii?Q?O+SB4DOH7k1a0x4GTPec27Rk5KNCyRxkJljjMCblASDqw0SAGoUT+v+FNglA?=
 =?us-ascii?Q?Ngd3VWuy2zTTtVkE4LAJL+BN9Uy6QJiu8Dcyz/tfHKYaoEqhI9rUl/MeIyzx?=
 =?us-ascii?Q?0CRasd6Nfcyj3zc3jm1bIVRXfrcAgMblsvYInYXA2p0Qft7GYSL1CdZuLiwo?=
 =?us-ascii?Q?iVmsPXhBENcss077BR/M4VyHsYTw2Ebxd7/afoKy+hOoML51UJtSH3vJiavd?=
 =?us-ascii?Q?g6jCuom4YwOemaq2FLWDrdiKqmch7mHfyDGsoUfD4oJCYQMTWjdnW3dsyVvC?=
 =?us-ascii?Q?TFBoZf+2yHY4IVlMr5jL3x3OUwIqVvgEqYNPvz85Z/pBE85IWP3G7htOIJCH?=
 =?us-ascii?Q?DkW9nGEeALINOl0vYr2JgQA3qsxPRg4RP2SLiP/ec5oQUgybm3PvrK19Kv5d?=
 =?us-ascii?Q?5oh7eLS+0eAWL8hw7cLABb3lqNgY3SBO2smilTVCgmNtYciVoiO5FLbuMMWK?=
 =?us-ascii?Q?kma26LS8Q4z79dRrrWT9auOU7LnEPgWwZS0sX1fnQSaHPb0NWqRHC/9Z3GHD?=
 =?us-ascii?Q?7ZXafjMm/WtuG+SB6pwngrsaA+VO6y75LoQdT9e7EWS3F0iI0KUHWlmZxKvi?=
 =?us-ascii?Q?9vIOQ7Z2m4KDDENwPzRjB2b018BjERAIPAywZ8a6bQv0ltOdFnNJzk3DSTju?=
 =?us-ascii?Q?dhISaXgdC676+UEtOfAmWZnufUYG+Sl+yCUBiLPfhx0X0BXHV7WTyNQcyxcz?=
 =?us-ascii?Q?Q++Lqc+QeabY8CaEMAyhBWjHs0icl+oThKGIENKpJ8upHxtaiHGZ3zvISGOT?=
 =?us-ascii?Q?zPV3ay7x54Quf9dNB5Dn+cVEOKn8u159q/VDXWcvO/YfVJBvnFrPc9eG6H2V?=
 =?us-ascii?Q?+2icJDn44HDWFDGH06GtOA7wgvC9wREyR6bEiE0Mphly6fyz03i+kKBC0T6J?=
 =?us-ascii?Q?NOz0pagrAQ4T29Pf/eJbb+anRH9Mvn6HBydAmPwiOIemVBkPw9AiSFrr1aDJ?=
 =?us-ascii?Q?TmzKL0PAZsoG/IuYj4ABaWID5ExvbODAhUp4cyCJ6PEwjDxJNwR+JdwhZNqu?=
 =?us-ascii?Q?fzKx/KTyo2D/Dk+UCF8Hm99Xom7DbfPDNv7Hh4ONvKW9GVl6FWoisTGk6j3q?=
 =?us-ascii?Q?2qM9VGy2Cht05/8f5ha9h2/Zd1NhXVd2o92X0F3yh46miCnmJDqebkZZANP6?=
 =?us-ascii?Q?YB9kibXRnRqwu9pIcS1O2QWo8BugUWyOGs4kkziG+fwaLqMwC07s/iXtm/L3?=
 =?us-ascii?Q?D4O4YqyMqIpgudV/jyjuIANHDrPc3ZI24pAmpAKFbzXENplyBDW51MFb5krN?=
 =?us-ascii?Q?ul7AxAjdIAVhEnROjAQpP7fJuwn2BznpkxNVsQWOH1bNKZLEKZcziff/gPyH?=
 =?us-ascii?Q?1rFzIbag2Ng=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RAsyOqeYg2s/nn8CPU7AjAUlKRfoIku7zNv7WB2x8naMizCB0sYsOWHVMfK5?=
 =?us-ascii?Q?VGoeN0Iq6wFjC3eht2+vKLriv7MaCDs2ry62NwCftuiOY9hyBSUN7zJAuN+b?=
 =?us-ascii?Q?omCT7CG4m/xiKFKMvB4+qRU/K/7o/8Vm8cAcIPFkzoxN+zZb80Nvtbb7E+YK?=
 =?us-ascii?Q?NU9w9LkNWSsLkwAyGj5miTcUlyE/lvUGgQjrZF3ZlONU1YftEwyUSJbcGZbd?=
 =?us-ascii?Q?Z7WLzCpmV9KP7PxGSInStSMU9/2Vfk527rP9bcpQU/uh7uiaEw2svzmEDucC?=
 =?us-ascii?Q?x0rGsjvFpkPEdIney848YdO0zLSjMKsP+vc98T2GM/zHSrAZ+SO7xFhJcTpp?=
 =?us-ascii?Q?6anJ6A1K8rf621pMIVDAPCsmeIROQ+Nzh+T4qzxHxPb3VPUp4YxPJ0Z5LO5I?=
 =?us-ascii?Q?23Nq0af0hGJfbZfEvNs7hB+xkb8w02aeVhkgEIJPv4vrDrq4myeUdCD+kn+O?=
 =?us-ascii?Q?h3PeyVRc94QeyrylSJTDc2PZ8DPiitQAPy1U0FkYSda54Xb7usUc2GYXax9r?=
 =?us-ascii?Q?cxQPlQ2dx6+W/WzPeLFx5woKPrkesogn6w6j+A/QPdHnuJN55eHo2b9q0Z8o?=
 =?us-ascii?Q?KnOTnlmxdLG59jEE0FwbyNBA31sXqrAsZZG2rJuUR6XrAFjydlJ+ktTsB/fp?=
 =?us-ascii?Q?fzcj99PdfvB/uaC7NlilmNPALyxYW+6pBLS568vsWnk1w3C/GRMCE3GhTGGF?=
 =?us-ascii?Q?vViGNAc8brDa4IoLtvAQnTxLzG12uZWusvBmtgwSNLNOxgm3SFAat8OD/u7V?=
 =?us-ascii?Q?lAUx5945KMMPQ145tiMyRX+iCIvIbUqUyldrdGOMfuDykZDGDNvBdMV1231M?=
 =?us-ascii?Q?BJYIk0RVh7t5QLO8Tm+na0eNrLVFCQBEubIDsZ8vvBmZjSDdciMLMJbI3mRq?=
 =?us-ascii?Q?fzpH0VeVFH1v/gBuSkRzCdxxnHblp8Vp/Iq1t1cpXf8ZGvyaxE9GyItFCHeG?=
 =?us-ascii?Q?4tvRUZcki0zL3fNq9iArSC6fEpiFEsDig2ZLxjim1qTuXd3+wgUuRYug1s9H?=
 =?us-ascii?Q?IP8OCJWNqmQfplw9K9w5s+Cr/68xn86o9081v4Ev/qXVPQoc91wiUxshN5Us?=
 =?us-ascii?Q?J0+JV6/IWFLFEfry8wuluWQJhnNUg77ZVgo8O/409LAlDIAlxWZldGZT8cTP?=
 =?us-ascii?Q?o3yOiHCyw97iuZzy6vfX5QA1mazRhg3jqxhtKuKzBsXQ9iAeQZZKVYy+5FrL?=
 =?us-ascii?Q?3J9Vn91goosxwRcBJHR2itvJtY9xx6uLPr7R4OgOIKeUbZg1ROfvWmdHjik2?=
 =?us-ascii?Q?OHXTnCyhmTijj12vYjzPbZfA6rjFeriGf7/nIqjVslSemX30gtp5O0+yqa2J?=
 =?us-ascii?Q?7yZUlbiUi9I/9dBqs2aZBdO0MSjhGwDuEq6gLCEFVeMOoa1pQ8z9ga+T140x?=
 =?us-ascii?Q?AGNKSSoXC/UtTHjheKNDsykcSZibvzfgmO+MS+mlhNqu/KvrtwtpADYSN0mu?=
 =?us-ascii?Q?uUe3H/HRDohP54WMMTRp0s3AeWLDPjcfIKITQymDm0TS2BLAyhYpA1NI5T0c?=
 =?us-ascii?Q?/Oqliqx0K5Va8XrBbK/0a1H8h5Ny+SBOWbE+mQUNIjS5bH55goimWv5GKln2?=
 =?us-ascii?Q?Kt82bQpcFJH6sqNJyH/T4CjZYepVykOVCY02xy9ziX+PkJwAzsm1jWkGrXEc?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f3cadf-669f-41ac-67ba-08dd9df234f5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 14:16:15.4573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZAHN+vRFGX0QnHvNKCb3dJZkrZPjL9Wz9w8ffosdCTPnl4zPVRbkwZQ79DyBEbee2Lqy34Kr9YBlD0r9I7N3bXvS37JAnDLoxyEvhrW6GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
X-Proofpoint-ORIG-GUID: y9WTqcj1jHP_psuhsDyniPqIvACYBqA4
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=68371ab3 cx=c_pps a=FmmX2Qmn+cbSQjaPaomTkg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=DMKfGVqTvDxfVueMAdEA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: y9WTqcj1jHP_psuhsDyniPqIvACYBqA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNSBTYWx0ZWRfX2dskiXjbSwtd fq6LwBzFavzTRtf1YjsPMu/3u2YrE7h4duWWjhcbUI0lyCctpJ9XDcf15EMVjB/n/1R+eQwP4DN pJDKdxULekChkF7a1Dhs5SamvlNW/xarxRKtttKUBM2XymxPgl5xiIP5GFMAQI43Me0z8AJlAAT
 lWNY2QLJuPzi6GNXv9ye4Y9fSdSx637bJe08/pYOKIoCqQAgOiXYbdnRxJ7VNPCwpZ6Nn2wKn68 n/Lj+MOc5L7BSRGuWbqTtCxVI1Vbf8idrN1pEPnDnlEpN6vbqMXw8Yzd/sWryWtsZq4mnJN0res Npq+Jfn+r3F466pccy5oyGxNbNJBnoen1EgatDLcB/1uhuNdCD+MLSrBZaVJ5Kbs+3dO8yKUiqH
 eTH12EBTvCyZBaETPkzFImgnKWDTMX+6+l82AQzQYUw0zhdrr5Ppekcnn8ziDcoOSCfGJrgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=883 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217350

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b425859021d17adf62f06fb904797cf8642986ad]
CVE: CVE-2025-1182

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/0040-CVE-2025-1182.patch         | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch

diff --git a/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
new file mode 100644
index 0000000000..682f633927
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
@@ -0,0 +1,31 @@
+From b425859021d17adf62f06fb904797cf8642986ad Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 16:27:38 +0000
+Subject: [PATCH] Fix another illegal memory access triggered by corrupt ELF
+ input files.
+
+PR 32644
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b425859021d17adf62f06fb904797cf8642986ad]
+
+CVE: CVE-2025-1182
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14711,6 +14711,10 @@
+        }
+       else
+        {
++         if (r_symndx >= rcookie->locsymcount)
++           /* This can happen with corrupt input.  */
++           return false;
++
+          /* It's not a relocation against a global symbol,
+             but it could be a relocation against a local
+             symbol for a discarded section.  */
-- 
2.49.0


