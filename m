Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B21C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 06:15:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43312.1748844906495744401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 23:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=824846682c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5525Ta4A005041
	for <openembedded-core@lists.openembedded.org>; Sun, 1 Jun 2025 23:15:06 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47019m1a83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 23:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkOxhdGQ4z3MNhKyO3Ey77YiKjid/JJiSS2u8y+TxQ3ZsUEn/W9CbAJ4/xVFh/1oAegqy+gSuTi7jvIaTKlpTdBWhn1Q1szdjDHwdQJ2GiUPTmpuNgm2OfBWfnwomOqwaVK6i6zcLhAtSNvVa8pzz38zXQXhFksZ1YokDrm1Due1LEtj9hBWeA+OQJAkU9EgVR6n5x1w5SOosNKSfVpm4iA6b0fDb1TX3RBUszC/3OFa2u6v+HgDbYkVW4GSIHD8XcZsCCIHpe4kNK4qGQr+wvJpKok1kNegVdQgeSn1nmbDB//amBwba87rEh/MtK7VCjNRRX2KRPLp18v0P2cJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dtvm7iUa9Fo6FYfq2lXHScBvUsTU1OOz98A4ARTS1P8=;
 b=s07vOYPXYCoN7OR3aeYISwmgIpkHwSKMHqQozEmv6hsEltAaCjVQcmGvjfeaqaN4OZqOuFbJ1/AyzV7KpeiiYTSro5S3VzZ2/3RXimaR82WpBmSvtpEaBaVXwgkQo8O6EvljEYrgGUH6nzyL653fnzNztp/tgtxjSEe9Qv1RyCGBlehhgkToclvHBmkh92mj/Jik5/sj/TvP5+UG82W/G2zws0BGQvc4t4SVBrrx59Jt4FIDc8SwX+i8i2qcX4FuFb9bmqHQa8P9pQkTsjFfqszPje/4HHH95sJ8vofoWMwkckTbVqf+yJ/FCPj0RDn6ENqPrXPiYnbQyYi1fKNrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 06:15:03 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 06:15:03 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-1181
Date: Sun,  1 Jun 2025 23:15:00 -0700
Message-ID: <20250602061500.773093-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:510:f::27) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: e87f5d00-fcf5-4c9a-f4f5-08dda19ccfcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EpMYfdROTjWr4PziFfRJTUuLEjxqol1fl2utMXwpoX4gCA8x1pVrbFIyhZTx?=
 =?us-ascii?Q?JnkDV4JpmyUCTLTE9mM7V3zR9j9bKR/G1olqjVksY7so6J1CMAWFfu+qfRr6?=
 =?us-ascii?Q?sSIEVfBH6A+ZWyivpE2j0tkVGe/AHpZeGPyREYjdn8+Tzvsrql7cuGgHQ+pt?=
 =?us-ascii?Q?Z10xhzSLTcj3Oxer9GjGdJIjqhIU98D8FI/F6QpKedAHW4l5j5yXY9r8Mm/O?=
 =?us-ascii?Q?XGvzkBqhc9nZN3WwkBDTwz3TIxZ4yA4YGgnFohPjyfcqAEMQgtrb+e4abEAu?=
 =?us-ascii?Q?My0FkSWUj+NgTzfs3mNPDlDBOarH/3StvVEDwhQwZh5t+cxRfp5K1yjZGTxG?=
 =?us-ascii?Q?GP6dnhhPg1jlnq+QdhWOd14TqipHh67k5QAhZItUtAKlf6YYhK5n0FEJ1kqv?=
 =?us-ascii?Q?bk67oGR8lx/QEx2Yen2ostyV+c0LZRZzAELOsCLv/Nou/zcopX8BFgLhhQBu?=
 =?us-ascii?Q?15tAIo3BP06K/vjX4T84g4GNdn+TkI/ifiWfJua66LMAQ2AFWKQ42vsK5FCg?=
 =?us-ascii?Q?t9iu1i6QWIvg14O6gEjWrueIrG1ccutfnJY1mskv4dlVB9ivNUALuZaqBrMz?=
 =?us-ascii?Q?fIVq4S4sAN55UXfA3bEUxDWqoL+pfWVy3L9E2C0s+s/m5AKgFw/6nmN9CeRR?=
 =?us-ascii?Q?zeJrY9X4mtbtVPVw2boIYnKWn1UJvZClBsFQ3xc6auJVnSLAxyppdabfEIYP?=
 =?us-ascii?Q?zGu9SY0NXbqChijSeisjTFenWkncSpAqOT5BWP6CJMm0P+8TB4EF0jIZ8zGs?=
 =?us-ascii?Q?cFm0PwyV8U3dXi4q44+afQCO4uAYSuYXcgDEo9ZQ0Q9YPbmDPGvrl/iaUZu0?=
 =?us-ascii?Q?XjH4YQZaDcHEa8+PlGxRU4ScdQxZZ+WpNLbI2gUS7ZGN4gPq/pEV/udTRKAy?=
 =?us-ascii?Q?e0lqMd0ZN72Xt2idSfU0j8OURRxK8sVXJKp/xE2bq3G3u2mnL1Gtvo7PG66B?=
 =?us-ascii?Q?1sG5gLMRyk+fhiu5Lyi5gU3ZzXPDlD7B3/p91pUubA/YwCZ+HOPAMp30eIL3?=
 =?us-ascii?Q?xTLiG1uBGD9THpZAvJlgUTudAoK1ss6P1MCN3dqqFZZcTRUKimlxAQFy/ReY?=
 =?us-ascii?Q?hhMBvYOaDMGWYwdJEcc0kxvV9x+M81moBL2mDEsVDARG+Owo3gw0GmOgNi4K?=
 =?us-ascii?Q?2daWGyQq5muXJcjv6up9DYP98uvnC36KP/7uRfbnVE4BD/U91iw48dlh6We/?=
 =?us-ascii?Q?CZ8RcE/c9+Qqlr04icA2WLLWU+pzVICc6PeGOZl62Nz9ZukGyoV/rkeSzqPs?=
 =?us-ascii?Q?ie0lF80M5WcYgG5fWxuBoZIlqH+SEqACPSglioFvKp0v6GMh6+vFGbhCsDWH?=
 =?us-ascii?Q?OJlUIDhHCN2HSFhx+ECdr99G9deLTLDn7Q+mPB+sJQOX+LeMWLI1l6oGP8up?=
 =?us-ascii?Q?+aea46bsw9R2e9PdrUtaS+S+A7AUBw5RRJZE6Yk4p1wtadiX92pZM2b2HzcO?=
 =?us-ascii?Q?0EXjsZiMbSdinDoXZ16wPbD9jipl7BVf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xc1RzvTGobxPHXHAZHgQvHmbqAwIz8YtZy4V+MP4JemNFufnvwolRIRLCuRF?=
 =?us-ascii?Q?sfF+slgsCHe9VdsUPy0hut5OaxXD3X4OJokuPHNOjdRtSBebuaott5zEelVu?=
 =?us-ascii?Q?8R2qG6Eq7Rt6ODLKX0wUTRLWzH6Fqi4LQcRKah0enl8K1xnWdJawZNnckabq?=
 =?us-ascii?Q?3thmdEcT8ayH/vFCktIpNFJ7LLpkJCIHS0+2uLMVdLP9Cmu8POYkrqdYnnJ5?=
 =?us-ascii?Q?tkBDJ/KSkMQ5SzegMexuEhdfzkKESliyNdNEHSgeMXdbd09/QmKDPOBt697L?=
 =?us-ascii?Q?Wfkw8BTPqJoYP0ACoplqSzeb2AeeKndaxldsqKgXCxjP874q3QUuUdsOlY+k?=
 =?us-ascii?Q?TNO8F+o38U97GDd9gGp3BEtoaO1HrSACD5eJ/3t/sA3nYDjDw7jw2ebzSddd?=
 =?us-ascii?Q?6Nft6chgJP8oQNqGynL+M5CVFs8RFIoj0ly6XUI6FsT6ueeCHiOBWxcTjlEw?=
 =?us-ascii?Q?x+Sd6snxPegQd+/VY1GcmJAFmcoO9k/W7qz1OJPCiit5225Bboybv5Un7QBD?=
 =?us-ascii?Q?e4lSxj1QWUT7hzs6lkvPcWv0aa2YYzGpxSSLCBUq2nBfGa81qjmV8rTxUogA?=
 =?us-ascii?Q?4g0eth05pkB+d/Q5PzP9uYlrskSQjJxFWQ2YtCGV3Y6xsyf+iPC/EIFPgxZy?=
 =?us-ascii?Q?QYBV+jH70z8Ep12E19tSEZgWQjJT23/8Beot+HZiUxbKXqDLnmQ32oFaBHN5?=
 =?us-ascii?Q?6tVwyLrCv27uiPOe/BkjTwEGdfamX1SOQnhH+Eazz3+GvTq1cOmcrrUACQAV?=
 =?us-ascii?Q?D2qIwU+PAAnLSrjiZ3FZRyWyhfaqDsRSAXQk2pnrQqFxFtrpUQsgEaxNlGU3?=
 =?us-ascii?Q?TFZebarHswmB+h2XsePu9fp5xjzWa0/NjB2e7fTMFAn1vj+MPUjxD2G7EHO4?=
 =?us-ascii?Q?j7GjpBp1SNs+2/L707y6630qTxypWYMsHdq7fqsxOJ8mrKg3hLCFxgczH7Kc?=
 =?us-ascii?Q?y2xNvpQvibHrS0qznHynARSHoPG6JvoAskzgjtXUWH7Oea55xA60PVlolGMX?=
 =?us-ascii?Q?RiEKSYm09odx0Rjjppio93PSvSPWdsyOhSRCWO/y2UiiOsuj/1prpNrVktde?=
 =?us-ascii?Q?6ED0u0/535m325zgeb9LYSLsCpB7ODbyR+56m4DLJg/Ss9ZzDJ7R4oMonNRP?=
 =?us-ascii?Q?nSP+pNHfquLouqsRKIKF7wQW+IC1F53SIam1hH74Ihb7KMONlDKODnQdYwav?=
 =?us-ascii?Q?rv63EElsfUNLkc5rnFizipQSmvW/6yxw4Vi/ssveJBTjj2IqagPC0NFwTtr0?=
 =?us-ascii?Q?RWwQPgeblANM07MUCSZ8YYilv6E3OKaTuAGWyM/gv8IiLr1mHCWaxCDJE5Nl?=
 =?us-ascii?Q?hQsy0Nrld68GGzPo5770afxOqzE4sPkSsDXJ8X4OXUJIZ0Fd8uobtc8i4Abg?=
 =?us-ascii?Q?xUx38+WevIC0zqe+DJd1YBgSFfmJeUNIPcW81Yf1kYoco7uupL3H9ojfhfxx?=
 =?us-ascii?Q?XomA/1jNLI8kwJdrmlMm2XN+JDhBEEKvWRdh5OeILIJtKRrO+8AdMM1Ic1hj?=
 =?us-ascii?Q?PuNHU5rE9ZfwyuqRL2XSLrouInZ8SrwoBstvArGWYMV/W9WrKiIl8U15vUUw?=
 =?us-ascii?Q?g+sAJVnJh1nh3POC6oZjbg8G2Yiy/rvLXMlHsr2zf+3MtZp7UGBNJ7xAf17o?=
 =?us-ascii?Q?0koSz89qxlqjz5lJjRh9p/I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87f5d00-fcf5-4c9a-f4f5-08dda19ccfcd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 06:15:03.1756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8eaM1T9rh3syRnw72gJaNVeWH8OhOgb7XFk1EAAHWHn+aGg/ZLHIcPWd+TGVpyNUVFEua7e0Fyop3GfZ2ZqtB3swTJ2Dp14g7Mo6FpE8WFWful2+IJrAlaMRaJvR0pP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
X-Proofpoint-ORIG-GUID: ID4HAC-nYRtBDhKwZFCrhBDmFT8SZ1Yi
X-Authority-Analysis: v=2.4 cv=SpqQ6OO0 c=1 sm=1 tr=0 ts=683d4169 cx=c_pps a=YAEMTVrAcchZ2C0DOoOS4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=H4py6OZAxxsHHjbtlqMA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ID4HAC-nYRtBDhKwZFCrhBDmFT8SZ1Yi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MSBTYWx0ZWRfX6abEkmTrW4Gx lO0CI2PqsESSV4aXvsK+eHPNpb/UcUtut3y9lY0nOexFc7sh+bmen4HcO3/bd7wvr19Yeodvjrq qLW/pPsYa4/5mt/S+2rbqJzceRTDFzVhievUTkJxzPlnXlZRhiL6eviygZOBDFPS+0B3Dc5OSFW
 0LHJcRhpA1NSGm38dM524GF+CvaX4CRXP13thnsF4PgoBrn0L5WHIXZACFJHvhX5qU+dFCoYNC8 +IxGMtm6CSk5XgDs3ifWaSYND+y+Fo099YEsXFUmlijcilRfsfwZhgPpln5FFT108N2lIYyQQWV AEkSTGVUWU/qZ4s6CLR1u5uyGG2YvEBLUrCw4qfJGQ5tShwrA+Z4AIhqIuY7PG7Np3b/SYujzRG
 +sahIigt572LwVtDWanjlQYvOoNsIfYF35k98lA0w46Bc1X0qdhSP7Lqtv+TeWM3t1u0X8DS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2506020051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 06:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217687

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR 32641 [https://sourceware.org/bugzilla/show_bug.cgi?id=32641]
PR 32643 [https://sourceware.org/bugzilla/show_bug.cgi?id=32643]

Upstream-Status: Backport
[https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=18cc11a2771d9e40180485da9a4fb660c03efac3
&& https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=931494c9a89558acb36a03a340c01726545eef24]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |   2 +
 .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
 .../binutils/0017-CVE-2025-1181-2.patch       | 337 ++++++++++++++++++
 3 files changed, 480 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 7d1de61e10..5838b2ebeb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -38,5 +38,7 @@ SRC_URI = "\
      file://0015-CVE-2025-1178.patch \
      file://CVE-2025-1180.patch \
      file://CVE-2025-1182.patch \
+     file://0016-CVE-2025-1181-1.patch \
+     file://0017-CVE-2025-1181-2.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
new file mode 100644
index 0000000000..d3709c7a4f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
@@ -0,0 +1,141 @@
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 14:31:10 +0000
+
+Prevent illegal memory access when checking relocs in a corrupt ELF binary.
+
+PR 32641
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=18cc11a2771d9e40180485da9a4fb660c03efac3]
+CVE: CVE-2025-1181
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
+index 785a37dd7fd..d2bf8e5cbae 100644
+--- a/bfd/elf-bfd.h
++++ b/bfd/elf-bfd.h
+@@ -3150,6 +3150,9 @@ extern bool _bfd_elf_link_mmap_section_contents
+ extern void _bfd_elf_link_munmap_section_contents
+   (asection *);
+ 
++extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
++  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *);
++
+ /* Large common section.  */
+ extern asection _bfd_elf_large_com_section;
+ 
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index 32db254ba6c..2d82c6583c3 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1744,7 +1744,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
+   bool to_reloc_pc32;
+   bool abs_symbol;
+   bool local_ref;
+-  asection *tsec;
++  asection *tsec = NULL;
+   bfd_signed_vma raddend;
+   unsigned int opcode;
+   unsigned int modrm;
+@@ -1910,6 +1910,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
+ 	return true;
+     }
+ 
++  if (tsec == NULL)
++    return false;
++
+   /* Don't convert GOTPCREL relocation against large section.  */
+   if (elf_section_data (tsec) !=  NULL
+       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) != 0)
+@@ -2206,10 +2209,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_link_info *info,
+       else
+ 	{
+ 	  isym = NULL;
+-	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	  h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
+ 	}
+ 
+       /* Check invalid x32 relocations.  */
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 1f1263007c0..eafbd133ff5 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,6 +96,27 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
+   return true;
+ }
+ 
++struct elf_link_hash_entry *
++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
++			      unsigned int                   symndx,
++			      Elf_Internal_Shdr *            symtab_hdr)
++{
++  if (symndx < symtab_hdr->sh_info)
++    return NULL;
++
++  struct elf_link_hash_entry *h = sym_hashes[symndx - symtab_hdr->sh_info];
++
++  /* The hash might be empty.  See PR 32641 for an example of this.  */
++  if (h == NULL)
++    return NULL;
++
++  while (h->root.type == bfd_link_hash_indirect
++	 || h->root.type == bfd_link_hash_warning)
++    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++
++  return h;
++}
++
+ static struct elf_link_hash_entry *
+ get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+ {
+@@ -108,6 +129,9 @@ get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+     {
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
++      if (h == NULL)
++	return NULL;
++
+       while (h->root.type == bfd_link_hash_indirect
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 8e5a005fd36..832a5495eb1 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -973,15 +973,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,
+ 	  goto error_return;
+ 	}
+ 
+-      if (r_symndx < symtab_hdr->sh_info)
+-	h = NULL;
+-      else
+-	{
+-	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-	}
++      h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
+ 
+       if (X86_NEED_DYNAMIC_RELOC_TYPE_P (is_x86_64, r_type)
+ 	  && NEED_DYNAMIC_RELOCATION_P (is_x86_64, info, true, h, sec,
+@@ -1209,10 +1201,12 @@ _bfd_x86_elf_link_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
+       else
+ 	{
+ 	  /* Get H and SEC for GENERATE_DYNAMIC_RELOCATION_P below.  */
+-	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	  h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
++	  if (h == NULL)
++	    {
++	      /* FIXMEL: Issue an error message ?  */
++	      continue;
++	    }
+ 
+ 	  if (h->root.type == bfd_link_hash_defined
+ 	      || h->root.type == bfd_link_hash_defweak)
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
new file mode 100644
index 0000000000..5af743582f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
@@ -0,0 +1,337 @@
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 15:43:04 +0000
+
+Add even more checks for corrupt input when processing
+relocations for ELF files.
+
+PR 32643
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=931494c9a89558acb36a03a340c01726545eef24]
+CVE: CVE-2025-1181
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index fd423d61..91cd7c28 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,15 +96,17 @@
+   return true;
+ }
+ 
+-struct elf_link_hash_entry *
+-_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
+-			      unsigned int                   symndx,
+-			      Elf_Internal_Shdr *            symtab_hdr)
++static struct elf_link_hash_entry *
++get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
++		     unsigned int                   symndx,
++		     unsigned int                   ext_sym_start)
+ {
+-  if (symndx < symtab_hdr->sh_info)
++  if (sym_hashes == NULL
++      /* Guard against corrupt input.  See PR 32636 for an example.  */
++      || symndx < ext_sym_start)
+     return NULL;
+ 
+-  struct elf_link_hash_entry *h = sym_hashes[symndx - symtab_hdr->sh_info];
++  struct elf_link_hash_entry *h = sym_hashes[symndx - ext_sym_start];
+ 
+   /* The hash might be empty.  See PR 32641 for an example of this.  */
+   if (h == NULL)
+@@ -117,27 +119,28 @@
+   return h;
+ }
+ 
+-static struct elf_link_hash_entry *
+-get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
++struct elf_link_hash_entry *
++_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
++			      unsigned int                   symndx,
++			      Elf_Internal_Shdr *            symtab_hdr)
+ {
+-  struct elf_link_hash_entry *h = NULL;
+-
+-  if ((r_symndx >= cookie->locsymcount
+-       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-      /* Guard against corrupt input.  See PR 32636 for an example.  */
+-      && r_symndx >= cookie->extsymoff)
+-    {
+-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
++  if (symtab_hdr == NULL)
++    return NULL;
+ 
+-      if (h == NULL)
+-	return NULL;
++  return get_link_hash_entry (sym_hashes, symndx, symtab_hdr->sh_info);
++}
+ 
+-      while (h->root.type == bfd_link_hash_indirect
+-	     || h->root.type == bfd_link_hash_warning)
+-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-    }
++static struct elf_link_hash_entry *
++get_ext_sym_hash_from_cookie (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
++{
++  if (cookie == NULL || cookie->sym_hashes == NULL)
++    return NULL;
++  
++  if (r_symndx >= cookie->locsymcount
++      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++    return get_link_hash_entry (cookie->sym_hashes, r_symndx, cookie->extsymoff);
+ 
+-  return h;
++  return NULL;
+ }
+ 
+ asection *
+@@ -147,7 +150,7 @@
+ {
+   struct elf_link_hash_entry *h;
+ 
+-  h = get_ext_sym_hash (cookie, r_symndx);
++  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
+   
+   if (h != NULL)
+     {
+@@ -9105,7 +9108,6 @@
+ 		  size_t symidx,
+ 		  bfd_vma val)
+ {
+-  struct elf_link_hash_entry **sym_hashes;
+   struct elf_link_hash_entry *h;
+   size_t extsymoff = locsymcount;
+ 
+@@ -9128,12 +9130,12 @@
+ 
+   /* It is a global symbol: set its link type
+      to "defined" and give it a value.  */
+-
+-  sym_hashes = elf_sym_hashes (bfd_with_globals);
+-  h = sym_hashes [symidx - extsymoff];
+-  while (h->root.type == bfd_link_hash_indirect
+-	 || h->root.type == bfd_link_hash_warning)
+-    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++  h = get_link_hash_entry (elf_sym_hashes (bfd_with_globals), symidx, extsymoff);
++  if (h == NULL)
++    {
++      /* FIXMEL What should we do ?  */
++      return;
++    }
+   h->root.type = bfd_link_hash_defined;
+   h->root.u.def.value = val;
+   h->root.u.def.section = bfd_abs_section_ptr;
+@@ -11611,10 +11613,19 @@
+ 	      || (elf_bad_symtab (input_bfd)
+ 		  && flinfo->sections[symndx] == NULL))
+ 	    {
+-	      struct elf_link_hash_entry *h = sym_hashes[symndx - extsymoff];
+-	      while (h->root.type == bfd_link_hash_indirect
+-		     || h->root.type == bfd_link_hash_warning)
+-		h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	      struct elf_link_hash_entry *h;
++
++	      h = get_link_hash_entry (sym_hashes, symndx, extsymoff);
++	      if (h == NULL)
++		{
++		  _bfd_error_handler
++		    /* xgettext:c-format */
++		    (_("error: %pB: unable to create group section symbol"),
++		     input_bfd);
++		  bfd_set_error (bfd_error_bad_value);
++		  return false;
++		}	      
++
+ 	      /* Arrange for symbol to be output.  */
+ 	      h->indx = -2;
+ 	      elf_section_data (osec)->this_hdr.sh_info = -2;
+@@ -11749,7 +11760,7 @@
+ 		  || (elf_bad_symtab (input_bfd)
+ 		      && flinfo->sections[r_symndx] == NULL))
+ 		{
+-		  h = sym_hashes[r_symndx - extsymoff];
++		  h = get_link_hash_entry (sym_hashes, r_symndx, extsymoff);
+ 
+ 		  /* Badly formatted input files can contain relocs that
+ 		     reference non-existant symbols.  Check here so that
+@@ -11758,17 +11769,13 @@
+ 		    {
+ 		      _bfd_error_handler
+ 			/* xgettext:c-format */
+-			(_("error: %pB contains a reloc (%#" PRIx64 ") for section %pA "
++			(_("error: %pB contains a reloc (%#" PRIx64 ") for section '%pA' "
+ 			   "that references a non-existent global symbol"),
+ 			 input_bfd, (uint64_t) rel->r_info, o);
+ 		      bfd_set_error (bfd_error_bad_value);
+ 		      return false;
+ 		    }
+ 
+-		  while (h->root.type == bfd_link_hash_indirect
+-			 || h->root.type == bfd_link_hash_warning)
+-		    h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-
+ 		  s_type = h->type;
+ 
+ 		  /* If a plugin symbol is referenced from a non-IR file,
+@@ -11984,7 +11991,6 @@
+ 			  && flinfo->sections[r_symndx] == NULL))
+ 		    {
+ 		      struct elf_link_hash_entry *rh;
+-		      unsigned long indx;
+ 
+ 		      /* This is a reloc against a global symbol.  We
+ 			 have not yet output all the local symbols, so
+@@ -11993,15 +11999,16 @@
+ 			 reloc to point to the global hash table entry
+ 			 for this symbol.  The symbol index is then
+ 			 set at the end of bfd_elf_final_link.  */
+-		      indx = r_symndx - extsymoff;
+-		      rh = elf_sym_hashes (input_bfd)[indx];
+-		      while (rh->root.type == bfd_link_hash_indirect
+-			     || rh->root.type == bfd_link_hash_warning)
+-			rh = (struct elf_link_hash_entry *) rh->root.u.i.link;
+-
+-		      /* Setting the index to -2 tells
+-			 elf_link_output_extsym that this symbol is
+-			 used by a reloc.  */
++		      rh = get_link_hash_entry (elf_sym_hashes (input_bfd),
++						r_symndx, extsymoff);
++		      if (rh == NULL)
++			{
++			  /* FIXME: Generate an error ?  */
++			  continue;
++			}
++
++		      /* Setting the index to -2 tells elf_link_output_extsym
++			 that this symbol is used by a reloc.  */
+ 		      BFD_ASSERT (rh->indx < 0);
+ 		      rh->indx = -2;
+ 		      *rel_hash = rh;
+@@ -13965,25 +13972,21 @@
+ 		       struct elf_link_hash_entry *h,
+ 		       Elf_Internal_Sym *sym)
+ {
+-  if (h != NULL)
++  if (h == NULL)
++    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
++
++  switch (h->root.type)
+     {
+-      switch (h->root.type)
+-	{
+-	case bfd_link_hash_defined:
+-	case bfd_link_hash_defweak:
+-	  return h->root.u.def.section;
++    case bfd_link_hash_defined:
++    case bfd_link_hash_defweak:
++      return h->root.u.def.section;
+ 
+-	case bfd_link_hash_common:
+-	  return h->root.u.c.p->section;
++    case bfd_link_hash_common:
++      return h->root.u.c.p->section;
+ 
+-	default:
+-	  break;
+-	}
++    default:
++      return NULL;
+     }
+-  else
+-    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
+-
+-  return NULL;
+ }
+ 
+ /* Return the debug definition section.  */
+@@ -14032,46 +14035,49 @@
+   if (r_symndx == STN_UNDEF)
+     return NULL;
+ 
+-  h = get_ext_sym_hash (cookie, r_symndx);
++  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
++  if (h == NULL)
++    {
++      /* A corrup tinput file can lead to a situation where the index
++	 does not reference either a local or an external symbol.  */
++      if (r_symndx >= cookie->locsymcount)
++	return NULL;
+ 
+-  if (h != NULL)
++      return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
++			      &cookie->locsyms[r_symndx]);
++    }
++
++  bool was_marked = h->mark;
++
++  h->mark = 1;
++  /* Keep all aliases of the symbol too.  If an object symbol
++     needs to be copied into .dynbss then all of its aliases
++     should be present as dynamic symbols, not just the one used
++     on the copy relocation.  */
++  hw = h;
++  while (hw->is_weakalias)
+     {
+-      bool was_marked;
++      hw = hw->u.alias;
++      hw->mark = 1;
++    }
+ 
+-      was_marked = h->mark;
+-      h->mark = 1;
+-      /* Keep all aliases of the symbol too.  If an object symbol
+-	 needs to be copied into .dynbss then all of its aliases
+-	 should be present as dynamic symbols, not just the one used
+-	 on the copy relocation.  */
+-      hw = h;
+-      while (hw->is_weakalias)
+-	{
+-	  hw = hw->u.alias;
+-	  hw->mark = 1;
+-	}
++  if (!was_marked && h->start_stop && !h->root.ldscript_def)
++    {
++      if (info->start_stop_gc)
++	return NULL;
+ 
+-      if (!was_marked && h->start_stop && !h->root.ldscript_def)
++      /* To work around a glibc bug, mark XXX input sections
++	 when there is a reference to __start_XXX or __stop_XXX
++	 symbols.  */
++      else if (start_stop != NULL)
+ 	{
+-	  if (info->start_stop_gc)
+-	    return NULL;
+-
+-	  /* To work around a glibc bug, mark XXX input sections
+-	     when there is a reference to __start_XXX or __stop_XXX
+-	     symbols.  */
+-	  else if (start_stop != NULL)
+-	    {
+-	      asection *s = h->u2.start_stop_section;
+-	      *start_stop = true;
+-	      return s;
+-	    }
++	  asection *s = h->u2.start_stop_section;
++	  *start_stop = true;
++	  return s;
+ 	}
+-
+-      return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
+     }
+ 
+-  return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
+-			  &cookie->locsyms[r_symndx]);
++  return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
+ }
+ 
+ /* COOKIE->rel describes a relocation against section SEC, which is
+@@ -15094,7 +15100,7 @@
+ 
+       struct elf_link_hash_entry *h;
+ 
+-      h = get_ext_sym_hash (rcookie, r_symndx);
++      h = get_ext_sym_hash_from_cookie (rcookie, r_symndx);
+ 
+       if (h != NULL)
+ 	{
-- 
2.49.0


