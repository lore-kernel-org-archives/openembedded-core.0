Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D04EC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 04:47:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4473.1785300459860822920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 21:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L/Olu3oH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26709619c3=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4blBD677850
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 21:47:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=7iLEv+QfP6EfHuAPTl4L8MUSKosdRJ/9UERB8O4I6l0=; b=
	L/Olu3oHoQCjYK+HoNL/A9lRhPNzqmnz9SBy1FHe6hgVzeGoUzddBNgIFzPzNigF
	t6BizKUPVMAPzmtDLzMQ2jfpr5J1T2atFiyM6xA4kHZ/ckHd0bcQsLzdcgizDcXj
	4JdCp/f7dRloA94nNgTm7Ub3bSShSGxSafvhRrcdSZBLR6ZEEh3gikWkC11Kr5lY
	yzMQDSWzgRNxMxmZsPftP7+SBHiZDWscsoVMLBVw6Y5dyr23rMjUs20F2KS9S26s
	9o/PDMrgAGuOztbvdwmspqK5BFHqefUlEy+HQM59sLGB0hq3dNJnTRRgKkvHSqXg
	5EBTvFZBpy/3Rvoc2/AZyQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fq86nr5bw-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 21:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvY3kk2TUt2YNBwgGBEnA3pQeyFXA8wEpGvS2Qtq+WGR8LmPVNsJ+XPO7oVHiS6VhtFBKoWjDzRm2qSJDi7OoEEOefejRbJECc7QB1PDh31hpeqALHsxX3bwcznNGWGtIwYvxFqNzc6Jx8RaUz6b3EOnpgEsFFKJhi8r+JNGTWuQPTodqb9Bd4jDSDaVeCI9c94I3RAVWcxAALkwl56Gi4NpgD7Nlq73ZHiFqjgE+DMC5scOaeOlORGDMXNLtpFJ2lo/4RJeUjYCbHBAaQWN3Skt7rx8a6qGehwMTvp30pThYfDOEiFR3cX1fE0PBSZSXoIl9nfJjnHj5JaTwM6D3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iLEv+QfP6EfHuAPTl4L8MUSKosdRJ/9UERB8O4I6l0=;
 b=lWXipHwzWAg/mDK/LnI1UqhenhzMRvWWU7gbcwAU9EW0gEUh1wPhlEDRjD33kahPjsCz0UqboMVBZT8VXH9qt/zY6Pbr+vNDVDwUg1N9yu9wy7ra4qwNt1a/LuuOOpwMeaTTQ0cKVSPMyFNqohw6J8wRN706MPdCphfSCLhMl1oFi6AC4NNvqI87/Islipxv6pssnXpOGfndQdCxt4/WSj10UcS7LXkfqXbDgkZBHRujis4lN9eys13RFjw64LEbZVpT54/ssk1SkiFpTOiFHWWPmEiCx6Se+ouZxeT3JD00AVQkcgDKythabzQkbEl2OnkjZVpT4V32qS5o1b/xdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 04:47:36 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 04:47:36 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v4 3/3] rust: Move do_update_snapshot to rust-source
Date: Tue, 28 Jul 2026 21:47:13 -0700
Message-ID: <20260729044714.1239545-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260729044714.1239545-1-Deepesh.Varatharajan@windriver.com>
References: <20260729044714.1239545-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:408:e0::27) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa3f18d-73df-4a8c-09c2-08deed2c8258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|23010399003|366016|376014|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	68SHy3vNmXbb6Oi0uo64L9x6zLH6VUxUEM+uf/11S5GdKnUqm6UtVaCVRKmWg6IdvVBrfl6p6surMEpUF9bQCRoxPEW6PyEhMEJYmPmjdQLX+wB4RnWAT/kgGHyGKuMxS4UGNUocc4HEGTnokupRSbdmPfWGnQMdLgBNl6TFWwvXACTLXimAT554XSfU6PD5uIRRU28DKWye6nMQEFpK/+YjbMxhFrUSCE/UeDAg5IRrogTTVQs0dpUHJ1QSU0rmLV407NQ9zEpEHXnjyoyR5Zfw6WYgKEjv/omY59cGK7oWMw8dusWwwvZXHQQkAd/d/PdPyo/sNltwK4eLkovwiPXalAL/akNXvU0pHmrF9Na4Qq5QjNNfpocwG4BbMKaqiauk3bsYouYDlQj6L0CYyqRav2kA+MsnUX41moeh/a94Y47u/IsZs5NfFRVh2bri4+yhfZmFXm2NkJYKptqFB71Sn7zgrOS2BgyK3zm9b9psNee/81YKjIJLo7JFVwqpbkHF7/YQJS/uPGILWJFMALNZPNK0441uE0/nlL4QZmcC/nV2flEwTd6kbprBw5fPrLPFtmqRjKb639RUjn62JDmRvEoVnRgpq6KBdiUf4h/ICBGkwzP7uMhzy5Yc8NqaZrx6Wf704GBb/TjM4PoYIsWnhabooKCrevoMXfFv6moC7TmIsl75Itexh4YZqP5fqqEYCZMkZIOnqx5S7ZnixTjuUn7OfkTuOiJQjEisjUo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W8438jIhkxAdrTI3LV4x/TMxp6miaozV1TMAg+iL4hv3GX5kAr71ffvKp35/?=
 =?us-ascii?Q?9KZSiHbl6kFAceeFKq/uK+zDoYHUI8toT9KEK8jvvZIsyNYIedS4JN1JdQo3?=
 =?us-ascii?Q?zUf5kUWorom+k1z6uj/dyGQBF+MLxHX4UinmplHGyHWxRdaAryzxkeJiQPPd?=
 =?us-ascii?Q?0fE+4DsBITPNpiqr8G+BU8+QV4DgKyeWUDE/x0qFriQuYzsC8l5/2T6lGDiP?=
 =?us-ascii?Q?N1VjRlKCDIZ6fAn8W0oOIwDJ6XwXPMJAJ9/5IKUc+OmOB0TsZJfF8EhsGSLy?=
 =?us-ascii?Q?jir2tOJDp4ZbpCK3my3Nqtgy/yXgRSmqyT7uYa6IJ0c+GxfEWtff8zY6yGnD?=
 =?us-ascii?Q?S6ODJSFEk3uHwpeNkxUERGejxbrK+7XN2Ufdp67fE8IDBTNPhKT9LZDp0L1I?=
 =?us-ascii?Q?+QydqzE1YAw89oXUh8x2G7wkaIknygoV83lfPD/Yj8Xw8nmLwi9V0ROdsgUZ?=
 =?us-ascii?Q?kQRlWT9romVrmNPLol0MYyf5ViRSdfx7zyo+kDyRs7SHKlxAGdi5RW90WP0l?=
 =?us-ascii?Q?BNjE/852C9QSHCER51CcveOXVgpfsa5VfbYQ3DdgSGdNJLusayMjbitzTnNT?=
 =?us-ascii?Q?OImxd1Beg3Ef7auN8ByWlSP93ps1F2Mm3xKEatgkzqWCSC85q8xS6sIy9PuC?=
 =?us-ascii?Q?fpnKU/4BP8hHogVdwYFsfGfoITsQNcdZi2DoOnA212xSLD8JKfy3svxhuLm+?=
 =?us-ascii?Q?OpXvp1NMYrXPeK3XDzMwDTgmZIrgeEMyA6B2vR8Vr5fLz+YnbELjeclZWZmE?=
 =?us-ascii?Q?K60iOAnt6PSUiICHlzg10Nqug5Iaw4A4MI9Xrw7d6+y+ZkMtlhyRAHOwWYa6?=
 =?us-ascii?Q?xs5h/zU6eWiMHKkPP1WGens4o9yGCFPQmQ1r9sYAuBbe13jdzd97vfncwQbe?=
 =?us-ascii?Q?qZ5wI2xcOJ190xto2Kqo+TuI+AxM/GpCYUSxPHkbaCSdPWp8UJyE8eNeAEon?=
 =?us-ascii?Q?qyE9Y07KxhE+0iO7ZOvHh5sofxfB5iSbyi5L4uLGXYBsv45OvGes+ybOXvYU?=
 =?us-ascii?Q?kxckOWJRJDTf3PC5phX+Hf/tCQC8T16cYy//pHqmWl2JnqUb8J8nDa4gdLUt?=
 =?us-ascii?Q?WNk1Od5Rcey+GqXPC+yeqoytrGgeS/4BglT16A0ppNJRABPeEC80Q9n5r3gA?=
 =?us-ascii?Q?1hb7Ih9ivLwTyxDyLOPMqRoUHPm1y1jBRS3mqbHU8HJvrvdXABbdaqKfEfwS?=
 =?us-ascii?Q?lcDOf+h32hVPfEIIt/2WnOL44pmePZW5abvUYg/tBvlranSVIMBb68PvNkXq?=
 =?us-ascii?Q?OQYTSY5cSczQCKX22+d21rFNUdiiXeERa93aZ6BfxThdn3c83XI+K/JgHf8R?=
 =?us-ascii?Q?llCRnBMJ1mYcOoAWHxh9+2PJJis3YxXk47IjdQx13n33fyUtWRGlll1mic1C?=
 =?us-ascii?Q?AK0tqA3sPf4SwjSHo+qhd/OaN/7B8I9j8nGpIGr2TeaDVplhIKn5px1MjhKR?=
 =?us-ascii?Q?W/eMMXV1PMp7gwxvGxz2DnKadyxbzF6K1tg5FeTlg/PjqKO0Z0uYduNRKAQm?=
 =?us-ascii?Q?hVG3NbCpmeQwtRRLfY9l260Uc0iwqI3KZWsWixi7qrlya6XBmi4DFhYTlYuV?=
 =?us-ascii?Q?NiGz1vr23XjVbGGRYFKdH8BTAFsweHsQz8n15daZokcab+ZKl33mSiW5Rlvr?=
 =?us-ascii?Q?QiD1aQoGC/HM/T7gLex7SgsSHyT3iCARt5s3sRb821jHf1D55xogNAIxUNyl?=
 =?us-ascii?Q?ER2rjDnEMqm1bt1neKQJWn+nXUfJ9RXdZpDkoXr1SXNydUdGlt8lCcyVgDMY?=
 =?us-ascii?Q?e34i8StxXmOBxWyGERRoh4Qwd8RqPb4Zo2KdzAQmzNMmSImwoAdx?=
X-Exchange-RoutingPolicyChecked: 
	TSI0npyehqao8aJYYIxBJVaBgrob3KDRcU3aFVszO00u2wFJdkURREgk6JCM1cgj3JUBQHirVdQtkHQs7ttQIOT/dli0+Wexu64tGIQLCuey5cYVFhHAU9sCEjur8vZxYa2xiytjZLbdmVvaBnYFAJMF3MxTmMOPkZ9bws32fJ8qjTHhrOyxvuCPl0+Ray31A8jG7k+am67GLkr+8GXBp4IagwHIUgjAC2XJzGYzG2cEciHuq9w2xEDEVOFvGNl3sCcH1b1luwFoThylsG9z3ynarrztBQPAo8eHsdYJBFf/onRv+miIGwTxBMkeBsBSvFhfH1BS1l6fnO+3vtWVgA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa3f18d-73df-4a8c-09c2-08deed2c8258
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 04:47:35.5893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1piofR9qo4cmJlTRjdlyTMHYEPzW9ketdVBk6keHXZ3YoYE3fWd+hA/CpetQ4Z/WqgesEdCBj5Ne6vqud6Mm4HRBLcmmmqS7V6zpOteMSD5szJnFVx+qQLcVbqigYKS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: y5zMOyNj8J27ZrIwWZm2eo0_tQz8TLHm
X-Authority-Analysis: v=2.4 cv=f594wuyM c=1 sm=1 tr=0 ts=6a6985eb cx=c_pps
 a=1HqfSBmQQ8HGCHze6/9uFg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=M-5mPBX6iDpf5b3w-P8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAzNiBTYWx0ZWRfX5XYh27GVuDNA
 CGFuzyrRz14KUd/ac2QBXNH8QWsv1FrkmTjTLoidPA9aJ4ZcpoIJMCD11DCeU9ar/vm+JnxMGTU
 9dgEQsrdEeP26qvPO7yh+zGNDyvJxjJ3IuHjZK3qjgU+sL+o70k8
X-Proofpoint-GUID: eq9RkurKxOgXXi5hcJCCij1VDYuWVVxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAzNiBTYWx0ZWRfX3vIGSwf7eM+C
 Pix60tRAee/mTS5ACmH4zOtMMmP5o3nj/KVvrWx3/XHfoYD6ft/dQCz99gUj8g8++6NVz9Rbq9g
 3aJES57d20qbqXOCguzFW8LPBT+5+RfPyy7bvRLvvM+taYJP0Brttme4NgoueCnYyfuvgPA5DGm
 uXntub0oL/m9+ZMlmqJpypZnEyXsIxJz7rZBBuX/gqsbU6G5TRdX8FcDLoCT2LIhZsV1KcyKGFJ
 OC317F3uyPxv+KFxVVxqVKn/jFwnegwyIqeE0DCzrPJCMc9L/eZ8/qeP6gBP/Mxit1qOX/F5C3f
 h8qpEuZ9OpwIVKiJUs+tyDY8f4VE2TafVN+LRK6V8WGYuSPv/hBQTTJJTcC9bzWtiDmBcQFugJz
 VoZDZIUTt2yUQlivtvAK8V5a6rVYsQ8TPj8GoV1VIUZkPcWObTdarHnnTDpubVCNdsTsLYs57i8
 Xk8hGerwN4vQtOc6E7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 04:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242229

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Move do_update_snapshot from rust to rust-source, since
rust-source now owns do_fetch/do_unpack/do_patch tasks
after the shared source refactoring.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/rust-source_1.96.1.bb                | 72 ++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.96.1.bb     | 73 -------------------
 2 files changed, 72 insertions(+), 73 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-source_1.96.1.bb b/meta/recipes-devtools/rust/rust-source_1.96.1.bb
index e9163b4a97..5649c3e937 100644
--- a/meta/recipes-devtools/rust/rust-source_1.96.1.bb
+++ b/meta/recipes-devtools/rust/rust-source_1.96.1.bb
@@ -54,3 +54,75 @@ B = "${WORKDIR}/build"
 RUST_BUILD_ARCH = "${@{'ppc': 'powerpc', 'ppc64': 'powerpc64', 'ppc64le': 'powerpc64le', 'riscv64': 'riscv64gc'}.get(d.getVar('BUILD_ARCH'), d.getVar('BUILD_ARCH'))}"
 
 EXCLUDE_FROM_WORLD = "1"
+
+addtask do_update_snapshot after do_patch
+do_update_snapshot[nostamp] = "1"
+
+# Run with `bitbake rust-source-${PV} -c update_snapshot` to update `rust-snapshot.inc`
+# with the checksums for the rust snapshot associated with this rustc-src tarball.
+python do_update_snapshot() {
+    import json
+    import re
+    import sys
+
+    from collections import defaultdict
+
+    key_value_pairs = {}
+    with open(os.path.join(d.getVar("S"), "src", "stage0")) as f:
+        for line in f:
+            # Skip empty lines or comments
+            if not line.strip() or line.startswith("#"):
+                continue
+            # Split the line into key and value using '=' as separator
+            match = re.match(r'(\S+)\s*=\s*(\S+)', line.strip())
+            if match:
+                key = match.group(1)
+                value = match.group(2)
+                key_value_pairs[key] = value
+    # Extract the required values from key_value_pairs
+    config_dist_server = key_value_pairs.get('dist_server', '')
+    compiler_date = key_value_pairs.get('compiler_date', '')
+    compiler_version = key_value_pairs.get('compiler_version', '')
+
+    src_uri = defaultdict(list)
+    # Assuming checksums_sha256 is now a key-value pair like: checksum_key = checksum_value
+    for k, v in key_value_pairs.items():
+        # Match the pattern for checksums
+        if "dist" in k and "tar.xz" in k:
+            m = re.search(f"dist/{compiler_date}/(?P<component>.*)-{compiler_version}-(?P<arch>.*)-unknown-linux-gnu\\.tar\\.xz", k)
+            if m:
+                component = m.group('component')
+                arch = m.group('arch')
+                src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
+    # Create the snapshot string with the extracted values
+    snapshot = """\
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0
+## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
+## The exact (previous) version that has been used is specified in the source tarball.
+## The version is replicated here.
+
+SNAPSHOT_VERSION = "%s"
+
+""" % compiler_version
+    # Add the checksum components to the snapshot
+    for arch, components in src_uri.items():
+        snapshot += "\n".join(components) + "\n\n"
+    # Add the additional snapshot URIs
+    snapshot += """\
+SRC_URI += " \\
+    ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+    ${RUST_DIST_SERVER}/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+    ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+"
+
+RUST_DIST_SERVER = "%s"
+
+RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+""" % config_dist_server
+    # Write the updated snapshot information to the rust-snapshot.inc file
+    with open(os.path.join(d.getVar("THISDIR"), "rust-snapshot.inc"), "w") as f:
+        f.write(snapshot)
+}
diff --git a/meta/recipes-devtools/rust/rust_1.96.1.bb b/meta/recipes-devtools/rust/rust_1.96.1.bb
index 4bbe4ed0bd..f8f47b0414 100644
--- a/meta/recipes-devtools/rust/rust_1.96.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.96.1.bb
@@ -354,79 +354,6 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
 }
 
-addtask do_update_snapshot after do_patch
-do_update_snapshot[nostamp] = "1"
-
-# Run with `bitbake -c update_snapshot rust` to update `rust-snapshot.inc`
-# with the checksums for the rust snapshot associated with this rustc-src
-# tarball.
-python do_update_snapshot() {
-    import json
-    import re
-    import sys
-
-    from collections import defaultdict
-
-    key_value_pairs = {}
-    with open(os.path.join(d.getVar("S"), "src", "stage0")) as f:
-        for line in f:
-            # Skip empty lines or comments
-            if not line.strip() or line.startswith("#"):
-                continue
-            # Split the line into key and value using '=' as separator
-            match = re.match(r'(\S+)\s*=\s*(\S+)', line.strip())
-            if match:
-                key = match.group(1)
-                value = match.group(2)
-                key_value_pairs[key] = value
-    # Extract the required values from key_value_pairs
-    config_dist_server = key_value_pairs.get('dist_server', '')
-    compiler_date = key_value_pairs.get('compiler_date', '')
-    compiler_version = key_value_pairs.get('compiler_version', '')
-
-    src_uri = defaultdict(list)
-    # Assuming checksums_sha256 is now a key-value pair like: checksum_key = checksum_value
-    for k, v in key_value_pairs.items():
-        # Match the pattern for checksums
-        if "dist" in k and "tar.xz" in k:
-            m = re.search(f"dist/{compiler_date}/(?P<component>.*)-{compiler_version}-(?P<arch>.*)-unknown-linux-gnu\\.tar\\.xz", k)
-            if m:
-                component = m.group('component')
-                arch = m.group('arch')
-                src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
-    # Create the snapshot string with the extracted values
-    snapshot = """\
-## This is information on the rust-snapshot (binary) used to build our current release.
-## snapshot info is taken from rust/src/stage0
-## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
-## The exact (previous) version that has been used is specified in the source tarball.
-## The version is replicated here.
-
-SNAPSHOT_VERSION = "%s"
-
-""" % compiler_version
-    # Add the checksum components to the snapshot
-    for arch, components in src_uri.items():
-        snapshot += "\n".join(components) + "\n\n"
-    # Add the additional snapshot URIs
-    snapshot += """\
-SRC_URI += " \\
-    ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
-    ${RUST_DIST_SERVER}/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
-    ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
-"
-
-RUST_DIST_SERVER = "%s"
-
-RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-""" % config_dist_server
-    # Write the updated snapshot information to the rust-snapshot.inc file
-    with open(os.path.join(d.getVar("THISDIR"), "rust-snapshot.inc"), "w") as f:
-        f.write(snapshot)
-}
-
 RUSTLIB_DEP:class-nativesdk = ""
 
 # musl builds include libunwind.a
-- 
2.49.0


