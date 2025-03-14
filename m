Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072B5C28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 06:36:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7744.1741934197945777030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 23:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=516868653b=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E5D70Q017522
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 06:36:37 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0ga3021-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 06:36:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svIjXxagVL//cKdhn2J7MASlWdt/Tbqh3trx79xE/r0KNdgegvff2q2Qys9n+xTHRbRDULbPBgEo1/QC0+FEd+cfRDktMfu8OWa5mFYUp7u/1qIiOnsGAUaF9TJtRjwf0WKWhc2QisPdgiIUnbo6b/2MgvIL3oBTiuU9w2u+mbLcmTfd4T4wWX//TtqLmjcCJn8WDMjxiVYlobPG/RGkMewH92JTx+zPYB/UzJiW0DKzCW9Kw6xoq35z1O9fIwptP6aEsZOh4qcPzpKv+BcynTEix4TAzG36A+ffpEJhCo0aB9VctfMTrDCOLIfVB7bWm+Oce/anc58MwMWjfD3VCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYW+Gl5AwqSDtneVi4Cbukj0P76i40J39K0QbzLPfTo=;
 b=hn5YB5lIz3sxsnwUqHPgvPCaxxQwAm9ZbfhQ6KASmh/IFwoJfaP1HdgcEX1wNFTC9oan40BbvctS19/WfflJiZIuJV7ZwGdVoKHrD5/j9nifDHGSbEEYkEfth25/W3X0hD7bcLeiMW57EMTjXmZUpvhK3pHjcDP1vq3/1wxS2wxlXZxvb5tvi55U7gunfTckv1xA6kLKytPbG99LFYGlHcMMx7WvJZxDgprjqEdTH2MXmvst1kzyeaO0t0wIZNiNps1MXfMUhyFa+26ZzPab57Dvutsd/hE6efGEhxqtBDlA1ox1ZqW5d4luNH3T6J/jCDeJrMFhiNE2iHFbb/BxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.28; Fri, 14 Mar 2025 06:36:34 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%5]) with mapi id 15.20.8511.025; Fri, 14 Mar 2025
 06:36:34 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] mpg123: upgrade 1.32.6 -> 1.32.10
Date: Fri, 14 Mar 2025 14:36:24 +0800
Message-Id: <20250314063624.3437544-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:404:15::17) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bffac2-76a9-4829-b274-08dd62c29071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SNxbYS8LXXG0KEK8rwwdS0FO/zi+fHMQpN2aiAwUnqsmnvIMBZeO8odUiG0L?=
 =?us-ascii?Q?caE15Wuk09tU9ab76nLeG0+gWvca3y4gLOA0rNQiMv+1CzXEY6BwiTREY1Sr?=
 =?us-ascii?Q?HUXmldEv2iBcjNUPlJEvy5Ymn68hHHHEnzq4fQs9PHfhSUugEd+qHIoXx0ME?=
 =?us-ascii?Q?ZYztnI3Wi/1prs1GFqxV1cEXUN2iFvHYRJ3oLXtHUuc8X/n/N71cgOaHcF5J?=
 =?us-ascii?Q?Udnz5CiGbbI2xc5t3qWZIq/efZ+vqXxIt+xtvB6MhB2kk7EkOJtVdonOmHC7?=
 =?us-ascii?Q?7lkA2kAgCpm5n6VNyJB/ecYyQzvxCy6mV+1PfWyUvNJiTp61YdYu5rZzYLNo?=
 =?us-ascii?Q?MGRC6hYsghLwtR2+3TLzrM2fO66YztGRgn9u152D2xPMoav6ybw/vzzqHEI5?=
 =?us-ascii?Q?1OnAMPXx1V0eTuq1y5UM7YoDlXEdJcZ+xkGVRDxSMS9cAW0YDRLyNbAjGtAY?=
 =?us-ascii?Q?iwudgiADN+q9JfFj7oQeKdn/HcBlvyWzdw7cEQmh/SmmRlyL2kzFOEZVHZm/?=
 =?us-ascii?Q?ZnleMaWCs2giobDB14FCgeop8l06uM0QK1qBskPj4Pkql1yvpr+t1yLaGhDY?=
 =?us-ascii?Q?KuXQs7l7ZZMe+Ph6E1LtVCEV0ABtOakoThBIWm9dZsnuSlMT/BvlXbAE+B2Y?=
 =?us-ascii?Q?qYM9+V3buCJsXNf21yhKycVjHh83ZjXuyaUxmo9Fix7thKuw1M5aspOOsuQL?=
 =?us-ascii?Q?xtgHnGT0gD6jAH37jLacvAJuXuAi2ef7DNM0Odp2eX8SLcHUPeFQA/MlIkbT?=
 =?us-ascii?Q?exDUZiq1AAofRJlQqbYOn57hebh3p6Kj/7XCrwwsyOwRvCkSg2BW5EQQk05h?=
 =?us-ascii?Q?aqv8a3cNVtViys2sJAoyDiJjZKwn7tvBRB7FjS1nSwb/u6kMAECRegR7QDyA?=
 =?us-ascii?Q?fvER12J4DVFEnZYReawAPCsKg7o/AFu1DT9p3oPaXXZsq33LmthGtIGraQ/Y?=
 =?us-ascii?Q?QjpplzU+0d0bopnzRN/6sHoZRDjjgypWwy/8h7xsxes+GIPxhWFUfbz15cxO?=
 =?us-ascii?Q?XtESVrQDKaOhiNRBy61x6wXHEAOXm6Pm14qvJWhIJYLSUN/FtnsH7FBFNrue?=
 =?us-ascii?Q?7Cu9o57kIyOcXx68ID5PGkCf++9RYe3RHMHy7fiEMh+m/YzGap5dyXv58dOi?=
 =?us-ascii?Q?eH9a4j1hw4RN26t7CKqja/Uh87gpzVdE320fnyV8rJLXKx6L+u8OBRxEnKT8?=
 =?us-ascii?Q?BJ6NK/S6x79gL+to4IpFHm9S+iW60lz4Ml7Vfla3BymMoIZrEWAGCIkdRFWi?=
 =?us-ascii?Q?S8XQl5ZfSPI5eaHNM9cSbu3AaQG2ePAJEDVyVJk4PsgubZQ7cEo2USbHpAkR?=
 =?us-ascii?Q?eGOGUintluOWbKsFsNo8Dds83hFp5VKA1VWdazdscnV43ZLGTPaV6MDkaph0?=
 =?us-ascii?Q?M2jsD4i2ZsR0n0VlXTDMk5stuWfk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k4KOU4CxmY8LJOdIs9PsFexc1eesi9V6viYv363JfcFsKfOY11alfrta5OEi?=
 =?us-ascii?Q?edWJtTMAAYQVeBk7j2XCKj1l5yu2JxYQX1h1Xn6bniNjgQxUZOaCneQaYSnt?=
 =?us-ascii?Q?1ppR4RZKV244pCfnGSF1rbbJAjsSPLQFw4Yw3L1B3cJdTQ8GAVXutPzF5xLb?=
 =?us-ascii?Q?dhc/3r5HoNb7mdlsMvD5TLAyDnmGFCVR5q8kmZn9AZ6R1viqU81CpG8IcuGJ?=
 =?us-ascii?Q?jZVi+2ZczydBjDtLFSlK4hbF9y3BeQ+MPsgZ7d9oUXnnYd8uIzbKHpoy4lig?=
 =?us-ascii?Q?LFYMHQqZr+9ZRNTVWNXX5vun80iQPcfhA837QM0+HL07aKs4HW0uf4SvRojC?=
 =?us-ascii?Q?AX8qfrRI4M/W3s2D5/MP0xdgvigll3j6s14ZCRXIYDyfcZMTSMikEYbInJYb?=
 =?us-ascii?Q?pSyybSyVuxhE1WRL2cal5J1AHHgGsA4QXTMN2ubR0NyHE9xuQkoM0JmWaVqc?=
 =?us-ascii?Q?Qp8XDYI0yGTcwrBsi8EkZ417rxavNRE8lhHMALY/PryDOgoh1m7/kF3e0xO/?=
 =?us-ascii?Q?4g2z8f7rLaS4/dyL6J30v3ejvs6YdGUlpOfGN8hvcEYbNe5nWeQptGBkNTDT?=
 =?us-ascii?Q?uh4PBFlCxwyLR1VaYCvtiZRArcXFqMCeMg1ytHdrolfi8tzc9JPOxAyZCo8A?=
 =?us-ascii?Q?NyF8wjk/DUwtQneS07OHI/cvw57ufytFnryix5AVFpPRmOMPWzw/2rqO8JjU?=
 =?us-ascii?Q?FGdI0AUBb/bRsT/soi7LIY6uREcozd5Rrypf29HiifxqQae0W25wDDQH20VJ?=
 =?us-ascii?Q?5JUeVnIgl4BIlgXLv1vrp2yxZybOSpdxFdBXZYgGrnSmX6c6zXMUNUJotJLu?=
 =?us-ascii?Q?54KmJzbp97pkRdl7HJnAXXPsSz4yWYQit9+2l4Rqt7g8oqnR85BBNldlYYN0?=
 =?us-ascii?Q?IpBZfS9kkmBTKTs4RjpD0W2Ns2UyLlfILvfC5SIv5ek25hKvMbY9yfEMyGTA?=
 =?us-ascii?Q?wmJRUpCgCMsYqgAfEZrQfpto/5Zhfi/6YNPzkEJ7nhJmORFAAwATdJzqyT11?=
 =?us-ascii?Q?cH+IEwVGtAAl3rYc3A4jtpAVBXVGWdiHv0VmKzIyLV7iNAt0voPwenmycJ03?=
 =?us-ascii?Q?2mCtq8qOfQ0Gizj0IZRiSABZmZ3zr2pWyOiPiXiJ6jz+9ZxN3OGCvhX/6aX4?=
 =?us-ascii?Q?tciK9VIkLqv4wtNUlmq0rqa9MrXmKfU8DXdEXMNg2UWu/6ln9Pa7D1YdZrF/?=
 =?us-ascii?Q?t2nekE8TKdjN+ItzLAqGFFN5zjw2LZxeUjjB22+jKuM2GyrdzS+20muox5I3?=
 =?us-ascii?Q?SBmLN8hWc0a621Vv3d46yBuKQqzfO9UwFsk+UwZwwa8ZSe5i3ZfmSuBRiq5M?=
 =?us-ascii?Q?7X9Kq1tP4CKcFgEvkVovbJ3MyhTh4WsZ2iyg1IEmmuwR16q56hoUpMhoqFD0?=
 =?us-ascii?Q?EJguWvviG7O9WGsxAVhXEP2F2m6NG8mE2wU45JAwRSwjC6JprZ1j6z+efZoH?=
 =?us-ascii?Q?X4WEqIfG60sMswB3CU8TE8SfSQqT2JD4bXQ5IpNUHoftlTLtbFQ8ihPdTKnP?=
 =?us-ascii?Q?dDet3nOUtIx5BXuzyVC2NxntLMW4N1MO6H4E/eQVjKgLruRr494fZQYOe3Hv?=
 =?us-ascii?Q?gDo8q8cdDMTbndisQ8tPBKN4r/7KscrlciwEQiZpvkOFDXJ9JBTZc5q7Cx5e?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bffac2-76a9-4829-b274-08dd62c29071
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 06:36:34.4874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCiUtc8vLoagsWLLERuF8lGdvm2BdKGMxT94mqTuXGp4Oma+es1AXX0xDB4EFKTFap5ToJawkN/zjuqABR7LzpVoTXHbUbw9SzuZImELCM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
X-Proofpoint-GUID: YVZ9HhuwRdpMvZJZnWKVkrHQuz1vF_q2
X-Proofpoint-ORIG-GUID: YVZ9HhuwRdpMvZJZnWKVkrHQuz1vF_q2
X-Authority-Analysis: v=2.4 cv=ZrXtK87G c=1 sm=1 tr=0 ts=67d3ce74 cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=zlTb_1xVAAAA:8 a=t7CeM3EgAAAA:8 a=w1OtyLzAMHzdRHBZsn8A:9 a=ntYVSH5SEK9JljX4K8Km:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503140050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 06:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212819

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
==========
1.32.10
  - scripts/tag_lyrics.py: fix for python3
  - libout123: Use strtok_r() to avoid conflicts multithreaded contexts
  - libmpg123: Un-break DLL builds that need I/O functions defined in libmpg123.c
  - ports/cmake: More fixup to also produce .pc files with Libs.private.
1.32.9
  - libmpg123:
    -- enable 64 bit offset path for MSVCRT and avoid warnings about
       MS's game about POSIX API with and without underscores
    -- Increase the library patchlevel, as was forgotten on previous
      release.
1.32.8
  Update: The buffer overflow got assigned the CVE ID CVE-2024-10573.
  - libmpg123:
    -- Add sections to assembly to support PAC/BTI code
       for aarch64 (-mbranch-protection variants)
    -- Prevent premature application of header info into decoding structure,
       at worst having triggered out-of-bounds writes of decoded PCM data
  - out123: Show --quiet in --longhelp.
1.32.7
  - ports/cmake: Work around bug in CMake that does not detect FPU on Apple ARM CPUs.
  - Fix some laziness (func() to func(void)) for standards conformance.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../mpg123/{mpg123_1.32.6.bb => mpg123_1.32.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.6.bb => mpg123_1.32.10.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
index f7786e8588..82f7b7d332 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "ccdd1d0abc31d73d8b435fc658c79049d0a905b30669b6a42a03ad169dc609e6"
+SRC_URI[sha256sum] = "87b2c17fe0c979d3ef38eeceff6362b35b28ac8589fbf1854b5be75c9ab6557c"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


