Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EF3C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 12:02:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.46834.1752753758632585339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 05:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9293950bdc=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56HBrm7h747434
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:02:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxk0kd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:02:37 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56HBxYXc756806
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:02:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxk0ka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:02:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouesPs75zH0gMdoUh7/8VaZRuW1G8tUfuwytLevXIp9IQ9n5505ytTYmf7BZb7l0AcNwB9BJtcIl09BsfmaYlYxIxV33lPMjFcsKniLRUhvAEFS4KmCK3o2FBfbst2o8PGaalJGlyngUkFaNmWGtOlvRHlelEbzrkRai1aOqL1hxQ1i/nRtLW8q6WR2VQuRBPQOAVQbVdK4NQELKGm7bDZ7ghr8+a9JYApxdXyclTHmIjbYZMfFctiExcVuYQaOjF/Ge7WX0raAJENJZOsvE2AAwvYU1JE/DEGI7HQrhrdFfMgmjRXSm7+Pkg4GDGXlPMIzYCJpF+HYNSOQBS/iqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHwAE3tFM8fm8Q/d64WWGgoY9Lad6h/Da/iVUbUvYMY=;
 b=piX6LiO7Hp3BX87uB5ZE9fEkAbT4rVF8jcebLOqibmrfyE0J94NOnk/zlIHos/C/cLGZEpEZAHDziiDpD57NOPGRHC9cgFsIxFWsAgjSiXXXECwoQMiZJulaZVHb26ZytI1MHWjI9SajseOYy8F9/6EKNvBkhxmbpnT20a0Wu6Yh7gK/yuHZsG1Uh0Gwo1AmenPGkdEeSmy7kJdueXNvJZnxWfrpkeF2tvtOKE/oh6ph9PhpBo/80iSQHdehIT86De5QD5TCbKDM9VeHJI0sFc20VzmaIM/35Ea15HVShIbt9ee6AM2SxfJzvexpSSCyclt1Y37y7JBoz8p8ukUGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CH3PR11MB7770.namprd11.prod.outlook.com (2603:10b6:610:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 12:02:33 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%7]) with mapi id 15.20.8901.036; Thu, 17 Jul 2025
 12:02:33 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2025-7546
Date: Thu, 17 Jul 2025 05:02:10 -0700
Message-ID: <20250717120210.3061934-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CH3PR11MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 66199420-48fb-428c-288b-08ddc529d034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eKRQRSVaXTkHSvqXXzFYkyOymgfFUjCsY0dfRZSxQ8kyoADEVhbM+XwZ65OG?=
 =?us-ascii?Q?wDffegCU8+Ain4KGt7hHO19NOfpPB0Jbz3DAw5Y1SO2qvqZg4rvs5h8onVI1?=
 =?us-ascii?Q?7ThaxW1/O0NE2T9RFAYmbBsW5AeubNrYYkSuKAMYW5l7v/s1hiG4Hn5dPQD9?=
 =?us-ascii?Q?s6jp6/Vx6lBKkjzVut1+EuKQTfE3PPHy3R4zT0tDX6ncHWyPWhRUXyZQ2Hdh?=
 =?us-ascii?Q?1arwlanMOhDCc7fo1wwjQFcePKfI4DVA2Y/y3Koioq1i56NE/i2dVEfr8lwb?=
 =?us-ascii?Q?CyuvgoCyZufNhUVtTQWjfIY7qyuOOVtH+p5ynhcFNJCKq8mx5DKbc5tVygnT?=
 =?us-ascii?Q?e7Bejvd7i8BCMnIs/l1ChcxwVH6h6qXfZamTdH4Xcv5iH/6QKF4MTGvGubCr?=
 =?us-ascii?Q?PN9vIfJDOVq/pOlLkw7lbetDbKbiQEajtRyvNSdcl9nlAs687Jc3DbGBWZif?=
 =?us-ascii?Q?GsC/OD1GUrVN5Z900d3v+TuFCfHRoZJSobnhyT5owMLJa9aR6cqfjqeWRTfn?=
 =?us-ascii?Q?aWN6iiFV/TYasqkjSpcHD58puGSiR4XezOLg4hdiQ8fviaUIzWLzC0t9LRp9?=
 =?us-ascii?Q?kQouE8F+GqPxZW0W6oM/QxLlFMy7ktfwupLZ64v2VO3HiySKWKNUZRKTlboK?=
 =?us-ascii?Q?4zOuCSk2hR3Nz0xXMZ56NsU8qMbpOUXUhs4q0qlwDRmvpCbKY6hOQrSaPZ4U?=
 =?us-ascii?Q?vIRjf7jDB7dIlalROIR7xUob1/em6m9EdUtC+ZDIJz32hYyGHDRShboQt+5j?=
 =?us-ascii?Q?32wUWeQ7aVy5MmLVul5zPtFD1PbJIGBwAB+K0BGhjZ4e0nyixY8QyJL7synB?=
 =?us-ascii?Q?3NmNmP/cbDZCTmtgSSBV7Y7scAy6M20xtDddJfIeLHRTcya+Tg1K2r7KLGxX?=
 =?us-ascii?Q?euxFrv/a0+VBZLf8IBSHzc96a2BeVfq3puBxb1pufrisDJcTtr1Q6KsNRgBE?=
 =?us-ascii?Q?Qog2Tvu2f2SXtrqr2AJdLdBl1aQ4DAn2VQrIamfEKhhmHfd4UD7KMoou/Yfe?=
 =?us-ascii?Q?fjgVCa37khHYr0/pEDpDN+w0OQe5U14mxaovx6/sBwOq7SxFRN3O+q2WZlMH?=
 =?us-ascii?Q?B06VtURkS3FfHw0AETLLweTMWIJZkhen4+hki9ftpSn0d53obei9HTbTm4nb?=
 =?us-ascii?Q?2rXnFZYzR+vFcdjT0QL2gONSU9LN2tywzD/0J/zG8fPHGkD0CV0nhCBiy6JP?=
 =?us-ascii?Q?kM2X83d9DdiF/NId+/ruvCiyq+iQcMtzUR2Pi4UYXjJZtgbQZ8yl+u0c/ah1?=
 =?us-ascii?Q?aKMJ4YIn3tKpM19cH2b+maa63C9hLCry1HWieF9MLBxAwA8XNHQ/c87gBBZP?=
 =?us-ascii?Q?qWQ6YGnmJMMKcaLcfl1fxX1QWc4hd8Uh3bVzwqmZ1E5vOOAAnj+qAPqxp21i?=
 =?us-ascii?Q?G2chmeVVV2IV0VUy4GOj5lsD/7zRMlro+Mz7rbkfVYJag63ivBZHnbussxj7?=
 =?us-ascii?Q?u7qH52GAKzA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dG2AqC4v+ERkJ5vWV+9ydUsX4hveDg2DGAmwoA0JGTQ79xUdzeeALOnbyQWB?=
 =?us-ascii?Q?X8j3WiCi3BQqrqvcEJufO37Rix41SW89HP8S7kLlXLVfJWrs/BaVo6NEgFMU?=
 =?us-ascii?Q?TYFrPPHhH9HCR8GoNYKq27VGjQOyvwrd3bON4GNgJ8FzVm4lzj2qC6yLroK1?=
 =?us-ascii?Q?QfNFC+eDTMZI1spNCDgdL+tpd8vjRAlF9/US2wuRZqUXdcH0tqGD0Al4yfFh?=
 =?us-ascii?Q?holkXkp66MgbYO1z9dxiOWaN83IK0IwOVoWZKyeQf4CokpKIl1fftnFWrOA+?=
 =?us-ascii?Q?c4uJxrmT/ho0qXJhp2qFiWYvMJ1J7zAdfG4kKq/pjSjvnozd3fkTpLYxOwRR?=
 =?us-ascii?Q?NCAJceHVqhtBujhRuVYw8ZyyKVCrnGqQDWgUj+kLVcEoVhcjWcTrDG6vvHbF?=
 =?us-ascii?Q?WY47u+1uk3x3x7HXKbbLTTA+b7Gu95oMHFMFXcfr+2xUUclNSUzGLSY3CuX2?=
 =?us-ascii?Q?MP1fQHitk8l5fM0Oz3gwRILf5dq8vJXUi1Z5RsDOgnG8ESzeFf1GET3aWIL7?=
 =?us-ascii?Q?BJrUdiXg5GJMUvPgNbakNxiWs9rNRuZ3sU4kkPTW3cc/DMlTAhXSKx19MyVa?=
 =?us-ascii?Q?VymNq1Lhypr+e9wc21H+cVH3IMbuq7irfs7VXzeEVeT5a6KnHbSMygNqQQ92?=
 =?us-ascii?Q?RezJOtn532Bq1YHnzCbr0N6dq/wAq8Q0DkYiNxGCee1iv7G+upVojSsPETMw?=
 =?us-ascii?Q?3yolZz1iHdc4jL4V7iD2PxjJ8rvGY+03F7bLOG3hO5z0wwgm5BDv9PfBlMGg?=
 =?us-ascii?Q?RQwvN+7KiqJa/BFDDevGOuyb5Ab5kkZrCb1L9H4ik7h+Hd/X2uAOwnnkLDov?=
 =?us-ascii?Q?V+wRcyMrcRceOvjOC4DfRU3phE8fMuWpEA6b+2d7k5aPDnjYuVSVHtkFDZzg?=
 =?us-ascii?Q?+gt5SIwbBFg9du9KwX6+YZJztvT0K06k3uWmYXQOMaQDfwn397fhYOEH9mMS?=
 =?us-ascii?Q?PYInwAE8Wq0Tq0jAGjPH/ddOefoClJQGOStItVDh1TlVwlJrQ15VkBM1yz5v?=
 =?us-ascii?Q?XVGEtIWzEM7e3plFZimySEz2mgb9ZU+F6MyVdFEjRp7vNhKJRaBhHQq5PqbX?=
 =?us-ascii?Q?zsH8Zzj7Cuo6sUR1N4hJbzVIZz/0tfx8NQz7cAqj+TBdNegVDZGaIeCGKw4L?=
 =?us-ascii?Q?rz+iHHYV5HSPcaSOiKtymTlTgXeehnmgSKZhMtWT+tiBqp6l+rVtLMEf3MRo?=
 =?us-ascii?Q?F/8S0IGfTJe+fuMUWp28+XjqdTC/wQdEhKsmMgudzuiKXRp3MqSNK+lkW9EQ?=
 =?us-ascii?Q?5fKLPnWL9FNGurft4zKd49XOq+9H+Vtei0JhK39QBlSSPXiAYJeQewYkGcAa?=
 =?us-ascii?Q?xhx4ww5re1kbtUaunF8D9lBNvjpw/LSBZHt1FRGMRaSTAUbs3kkJDrK0ZfR2?=
 =?us-ascii?Q?p/Tc7nHFacLR8S6zUxfjK/YX9NkSb3+6RHFapw+Rztshrh2ibXA0+VurYDFf?=
 =?us-ascii?Q?guDgcsL3/4DZNBUdhhl0RltPyVhBH3wID90t7ezcmQM8Vh0VIuEvpuGpN6Cf?=
 =?us-ascii?Q?rJQsGHQRhAAYB9zlYGHO5NapeAJp96vs7L4H+F34XqTeI19jDKpnTPzAlp7j?=
 =?us-ascii?Q?+n0klJUX+oubrc3EkrF/l4iULT21tcoDdwlxcrL0Gr0QgdKqkB51L4i0G3a1?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66199420-48fb-428c-288b-08ddc529d034
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:02:33.5422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6y8POlTFiiYtKgN5c+Zgd15zvWT5NFtm/0loEd+byZq2MqNhW3n3rDJmUvNl0tHJkxD7D+i1uozY5m02sxJ6I+IR0/+tnPXBahZ7d+3w5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
X-Proofpoint-ORIG-GUID: z-X6fF2V1jqqFAED2DSFmjQosMUQyr9_
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=6878e65d cx=c_pps
 a=k3z6I4pdfs0t3+GLVInSVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=5ajh65UlYrPjdiaPQP0A:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2pZw-ySw4BemdX_FF5isOVDNJ39KEOSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX0eAxjLQ4uaiz
 IxyIXsULYzfaSjt55pyrUN+ccLuiZsxEN0wkxpwyLmMPLGQWzJMB7pFGDJbSiy5upFPbJNxku5P
 ZMVKstQwUjbvL2W+4ok+EOn3OLKd7hbjQ6njSfRktppXkxWGClE6XAG6jXWEQIbetE6lpgC0zI5
 sUDf38aH0ThLS5TDv3/u0YR0s/RxcgzdJaZQ964bLEX0hqQjjKsqaUe7Dyrjw2YOOhNXqf9YEXF
 LJh7nZ5xoLHh2n7Nchkli5dfSU5NgeGHcc5jImqMJcJww6H96Is5VD7qFDc9Bql1h2kppIeCBoM
 2K/+wmJMvnx98yueHtYbc7bEI4NgSSQQY1aWzDBb+N+nWQBoif5gStJngJaUjYGe5/jVBLuHW12
 aqufgzSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220535

From: Yash Shinde <Yash.Shinde@windriver.com>

Report corrupted group section instead of trying to recover.

CVE: CVE-2025-7546
Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
PR  33050 [https://sourceware.org/bugzilla/show_bug.cgi?id=33050]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0043-CVE-2025-7546.patch         | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index f1c29015bc..70176c791c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -78,5 +78,6 @@ SRC_URI = "\
      file://0040-CVE-2025-1182.patch \
      file://0041-CVE-2025-5244.patch \
      file://0042-CVE-2025-5245.patch \
+     file://0043-CVE-2025-7546.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch
new file mode 100644
index 0000000000..da4dc3fb39
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch
@@ -0,0 +1,44 @@
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
+@@ -3611,8 +3611,18 @@
+ 	break;
+     }
+ 
++  /* We should always get here with loc == sec->contents + 4.  Return
++     an error for bogus SHT_GROUP sections.  */
+   loc -= 4;
+-  BFD_ASSERT (loc == sec->contents);
++  if (loc != sec->contents)
++    {
++     /* xgettext:c-format */
++      _bfd_error_handler (_("%pB: corrupted group section: `%pA'"),
++                         abfd, sec);
++      bfd_set_error (bfd_error_bad_value);
++      *failedptr = true;
++      return;
++    }
+ 
+   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
+ }
-- 
2.49.0


