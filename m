Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C73BC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 12:23:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38931.1753100621057058811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 05:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92970f4c5c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L7DwgE1320108
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 12:23:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k09ye9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 12:23:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4kW1A0OlsL7asHqhxo1dOVQ9GAkW/XRKRSUDaCQd5ERXj8WjAOWGNo7MByTYHLeLq1bnG+GaENyn9ykWTGUri/jMbDKktdffUl420ne03WP+EawP6L+j2IjJa5s56JgpeT3d+Qe4WOC0M/LrYvAlu67/HkFVwwAK03pAMvQc1Shtig3mWHy6NVM5hDdoh7/JkTT8OIc4ymMZskSAT1Yf2x5C9TbONFx5embNS2vCoO6oa/72GT7VoCw/46f6fR2a6VHIJpw4rpYzGbX2jvMtd18kSNT2ioZl+hQzT5fI4wIYw/+RS6pRf/nw1gUHz2OOk9RAkSx3++yYvGEiNhOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXV3PwFnbE+GXM1NPSuo588dSPIglUgkXKtkJTyqVvc=;
 b=etFlyFZzJrabpryHkD/4OsINq/6G56nxKKWa3bwPsrXwxx1dIFAFUIZqcTMJx+Oco0kk0ZrbAPVly3BBz3hGcZ5pT4HD6emZTq4L2DkVfMkgLKMyVS3LmxYsLDQHdMV1cyBTdJWdhiFXwBpsA1jVrCnXODLhrV8NfKfdhR67uaavb4usgnzWYGGbm0CHW35o3Kon1bt0I8NynbR12hEaefljJt0rvLwIwB1d55knX0qB9YOtqS+wutyBs3KEhn1jquIVUQETFOtn0D4nY5F2yFfZgeJUDn/zQDqexJOrzFxyD4vH6uJKpSfSJkdI6qO88xBR8Eo6hh9I8gDkvSVwKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CO1PR11MB4993.namprd11.prod.outlook.com (2603:10b6:303:6c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:23:37 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 12:23:37 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates
Date: Mon, 21 Jul 2025 05:23:19 -0700
Message-ID: <20250721122319.1549209-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::10) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CO1PR11MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: f5facc12-511a-49fd-0331-08ddc8516af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ASugVmmnpvXjCZQDmBey95DC6sVd010IqfI8Gd4Wo6tJYTgU3lP20eHcKfWc?=
 =?us-ascii?Q?QyuSy2aOD5xNThQFDznsJSluuvxpibpaAhM4CcCdk53dE+jjqlMHFEkodbEa?=
 =?us-ascii?Q?ei05mAQYxkq8SDE7v0ozd7QckQy3FdcoIQ3LkjgxW6hplPOMOI8O0qTI1+uX?=
 =?us-ascii?Q?oEcZGksNWQfnDbIxb2x2bTiOCzwVUXFt+cB8glfTcqgluNgS9R0TAyQ2zLe6?=
 =?us-ascii?Q?z3ecedkV0y/vHxTBRZZZCpJFByRQEqR2OCZkosq5UhWU/A2f8iSavYfLOHwB?=
 =?us-ascii?Q?3fWlo+Cw3xI5KWmv+K9iFI9Lr/3YpMg7BJp4r4mq+ADTBb9IXFBG0+Uk5wOZ?=
 =?us-ascii?Q?OdClkFp6kMrGwSA8LGxym5J6oFaft1EkmnF+LyDL0M2/SQ7uVLI8G7b8YIYW?=
 =?us-ascii?Q?Dd8khjsZrohn5ujp+9oGKnQyH3nTAIoCdhb/JNAYDS+3WAllJAkPTidiPC5b?=
 =?us-ascii?Q?0IQGJfudWmGPGmbfnrXZW7C7wvQdjCEoDh2SDHl1w1qYtZTKbPeNJhcIxI9Q?=
 =?us-ascii?Q?VlX14aZJ7qyLRoz5cXk09c76/owdLzylGDZVR29nLRp0cyFDTWtjfaxEcDE9?=
 =?us-ascii?Q?gPvC89VvlCv5i03N/F1CJCZsTuV8ikag9I03gWV4fA+01fztgTrigwfRmf/N?=
 =?us-ascii?Q?2CD+VFFJXjwDXCviKmMjWdt0CCVpVf5dSYXxK0W1BoaJjvu6mnzglt1upaP2?=
 =?us-ascii?Q?Vujf/IwvpXnG4bjI94bD1rHAX9Nw1afxBsMmWwomlTKLHsDJFPbMe3xZ3Br/?=
 =?us-ascii?Q?ZMicvfIZPEAetGapA1npPBgA8+wd6v7dE4omOrpeemXpOol9k69Pq3XifmAf?=
 =?us-ascii?Q?IhWmF2dov3rym/i1lttivcXsbpHI4nU5hBZceMBVXxEfIgBieo89aErK3J9z?=
 =?us-ascii?Q?H3QkiEhE8VwOtR9EG6as2kCiaknNDsF0BfCX/Z+HTmoYR/ZDoHIxhQk26F2t?=
 =?us-ascii?Q?gcffuu7DLTTNxc2rDjaFwS0ijD+iTbDQ3Zrvs/kS6+wPHUQAATYab+TtzA9x?=
 =?us-ascii?Q?bvSxH1C2sxmHzDZYV7XGQQ+WhbeTm9ZxXFNI/urf5MDF+3o1QwrPVFgcMUtb?=
 =?us-ascii?Q?n6SIbHiTkcDRrDRSKJcTnE4xLJa70hTy68kGqDhWmKCXLbneUjzRT/E2xbiE?=
 =?us-ascii?Q?RxogDpnUccIp3aMa4Q+Qez4bZ2yGtrUzPwylmcKRzuVWEpY7BnAyudkE2U7w?=
 =?us-ascii?Q?GHLI8cJ3Y/wzrSrLxa23361wGBVAceGM+0dyTBtzhe8Fpxx4H/YcD7dht0kf?=
 =?us-ascii?Q?hdMm26IktFAIlTtuiduwlapjWsnWSBsyfqcoyKz8Q8vVwB5CprzhdZ76gkmc?=
 =?us-ascii?Q?LQKQ+3SUTeQZmCzJR5tDlGynI+CygZT58cuzl8q1Mr3sannE7V3YV7AMPsWg?=
 =?us-ascii?Q?kuQVeQ0JrsVEJpH8nSeJSA3t3wr6BvxZFkEZA26gs2Sz1peLRf4Nq/Dwg27Q?=
 =?us-ascii?Q?IWFsENIktyie3bEMk0uk4myUGEqqm8gI5hCqHgi0TjPFSBqN3TWi8Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YWFR98PEoStpQmo/+CCmxFuB0XLdiMxSWtsiwlvSVYvYUwiyktoCx1g85vNp?=
 =?us-ascii?Q?vyPxTnbFI2oXrEXzLviOIEQaSG90YJgdaKmL3eOub2YeAyHRJiVkKB1sPUPQ?=
 =?us-ascii?Q?UWOsmSDUc9p+mkb6kSqHf4xdBlJLZIP6dmgkjsljTPJR51CU/rgWWZULWUEq?=
 =?us-ascii?Q?ETuXZjPUXlD89+O2wqFvPTB/KBKRFQp0CDLWIiuMhrdJmjUc+D9ccd5rIjEf?=
 =?us-ascii?Q?sOZ7w3ZYtDTW/8ZL6G6zlDQc07hXAIaBIGY5/TtjKQ37SIqeFtihYw8hVg6H?=
 =?us-ascii?Q?vwyItbT5deBR7IvQLd9zQzvnFhMm4YD+Q5PHiOzWAJQs5ijGqa42aYX79ASS?=
 =?us-ascii?Q?guZepYdj2Yd86R8txnouxSP7IqgQ/mHHzkwluWOlZknuhv238KqVRvK/ydO9?=
 =?us-ascii?Q?D4fT83rH+zjCAcWhms7CxIW4QGL18CANYpMvznTga+J8KCZgJmiY63xRlXYx?=
 =?us-ascii?Q?kR04urdsUXOKGuMYEOqeIhVAWPSUf24ixta12Bni9LRqRlmFUKWS0kZCQ4VE?=
 =?us-ascii?Q?ptVKWXJV3iSYaInRqvge6UnkJim8zD3GFtPNRrUTtXF9nTvSj3cSrwUvD3OQ?=
 =?us-ascii?Q?NF5B9/GPcr0kM16RPDQnUuO1qS2IBuUhwYMGGD7Fc0iDO04CNdszrdqbGiKe?=
 =?us-ascii?Q?U2MGVgTmAOCFAlGCfGaqzHubq+aEOobObbnlwc1wSHKbRhVelAMBcpjn3iEG?=
 =?us-ascii?Q?f4kRIFcIjJdv1ARgPin18Bovn/hTp7fhsOVFfzI7olVMbwWMAOsYBkzc3zv9?=
 =?us-ascii?Q?IJWml1e73stkPfbbE/igNSSmntNUJ/anj7naAgeX39Xv//gFJYd5Lns6C+od?=
 =?us-ascii?Q?D4mkFp7e0qFyjBUWV25trmEbQKyL+yVGRsHYxOpYyxABVlOmedTX3uzQOHDG?=
 =?us-ascii?Q?WLnhmxeEiv9lO9nnREpXgZGfpQnZsFljSlK/0hiJfpn3u5eeO1Zzy7T+kx2G?=
 =?us-ascii?Q?FoMoZckwhfrqtQV5UZ4wZFoilPkcxRvsYVxohgEaW/bsh8AmBHNID/szIfpx?=
 =?us-ascii?Q?h/QQiMWimwWwDmkHtKPzNZDY2NJ9pll1WofLPjtpuLLFNnhnAD7+68qDhtpD?=
 =?us-ascii?Q?B4AsD9OmuixCT51CQzECeL2820lELVyPX1l64qkKBoJzgD7C3xZRBfd/6tz1?=
 =?us-ascii?Q?HF1NUwLCpzOkEmjOO47qqPalfj+XKoCZ0VOJdlUxrp7X8AenhJrKUxLCOcYf?=
 =?us-ascii?Q?vXHYcwMjLF5lf8Cam69HGwFn7VtS6kmJJdP2ldA5OpatnQx/Bf2RcUvWDRNB?=
 =?us-ascii?Q?6TEUWf92Hom5qmb9Nao9nB2mp3K02hxWkUE4UtBhCCUhAUdFvq5TExGvYcyj?=
 =?us-ascii?Q?bevOZ0MgDIf7gv1Rw6jXhVOzcHdr4BZiG3FQDJN4SpEC8VKAUFVTfEVmSm9E?=
 =?us-ascii?Q?LktTbA8ScFtCMhmMDIEBsiUuqg9URK1zaR3GFEdRcrf2VgRvLzq6QRNmNvvM?=
 =?us-ascii?Q?FCS8fjx3/2Dv9mTbNLMYRSn0iW3K/H2RRatHAX9h4QisdILyjN6WKL14CeCK?=
 =?us-ascii?Q?TyTab0LYGlbf524nCt7jqpRH//NGKfIH3Z2hy1xoqOz+7GjrTLuDeV12QVIc?=
 =?us-ascii?Q?StVUjjMvyYUTFMSjqrOrzZLN0UNcI9e/2x46LI727vEWJj/Wcfm40+0MTDoC?=
 =?us-ascii?Q?3DFhOJIA3I6bC03TVXMBmMU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5facc12-511a-49fd-0331-08ddc8516af7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:23:37.0747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ga9rcVyhqNl2ShkYcZGCgXjU+U3xObEgE9pa2fnIEepRh5JPMJtOCHwLg26lKgiE4VCeUVrDRoYnsCWEqa3Oz4SMtf+I0sJJxT/oPEnnKQxBE3qNahUOGdOPZ7yHa3mx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4993
X-Proofpoint-GUID: tVdyddXxkzssn74go8sziQKK5VdLq0f8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDIwMSBTYWx0ZWRfXzveoyPgwOpOR
 22cwHD2QjScinpWOathXMonAjdVWsbgeBP04w5jW+eHIwVLInsXEKZny9JZ1oR7GnaSTTwZUDv9
 4slNgloL9cR9KeH6Z/OooH++GIibueoNhunJLkNF2LwhZwyFaTrKbJ1/mga0lv8EtmZFkhcpeIX
 7151a+Arglas6VZ/4oC/kLlhw8UOcePLDEJpObWF26rIPnH7wJfLBUeRKVLXAciSGQZt/HhsnWC
 uK2tyW6CCt9YNb653DallncyB1Lwyg8hC5M5e2IHnC09Tt2j5ZhEdZswGWuUQhrQhSPwm/Q9VaO
 c0jZvy2W67+w0jhjRUB6Yt6tdF4dD6PqC2IB+WVmCnP0H32fnruPtKT+bEn7BEX2sQ49T6e1Xmk
 jPZkHPrF
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=687e314c cx=c_pps
 a=f1tBHqq0Bau8jCQW9r2qvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=xSs9iO1qsYZR3K1SDMMA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: tVdyddXxkzssn74go8sziQKK5VdLq0f8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507180201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220683

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

$ git log --oneline 06a70769fd0b2e1f2a3085ad50ab620282bd77b3..cff1042cceec3502269947e96cf7023451af22f3
cff1042cce Fix error reporting (false negatives) in SGID tests
1924d341c0 support: Pick group in support_capture_subprogram_self_sgid if UID == 0

Testing Results:
             Before   After    Diff
PASS          5074     5082     +8
XPASS         4        4         0
FAIL          121      116      -5
XFAIL         16       16        0
UNSUPPORTED   157      154      -3

cff1042cce Fix error reporting (false negatives) in SGID tests
Improved SGID test handling by unifying error reporting and using secure temporary directories.
Replaced non-standard exit codes and fixed premature exits to avoid masking failures.
These changes reduced false negatives, increasing overall test pass rates

UNSUPPORTED tests changes
-UNSUPPORTED: stdlib/tst-secure-getenv
-UNSUPPORTED: elf/tst-env-setuid-static
-UNSUPPORTED: elf/tst-env-setuid-tunables

FAILed tests changes
-FAIL: malloc/tst-aligned-alloc-random-thread-cross-malloc-check
-FAIL: malloc/tst-aligned-alloc-random-thread-malloc-check
-FAIL: malloc/tst-dynarray
-FAIL: malloc/tst-dynarray-mem
-FAIL: resolv/tst-resolv-aliases

PASSed tests changes
+PASS: stdlib/tst-secure-getenv
+PASS: elf/tst-env-setuid-static
+PASS: elf/tst-env-setuid-tunables
+PASS: malloc/tst-aligned-alloc-random-thread-cross-malloc-check
+PASS: malloc/tst-aligned-alloc-random-thread-malloc-check
+PASS: malloc/tst-dynarray
+PASS: malloc/tst-dynarray-mem
+PASS: resolv/tst-resolv-aliases

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 0130613936..6ee9fc7a0b 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "06a70769fd0b2e1f2a3085ad50ab620282bd77b3"
+SRCREV_glibc ?= "cff1042cceec3502269947e96cf7023451af22f3"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


