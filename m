Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6754C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19646.1786921889447547940
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gnDdTzih;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMXLqx1095533
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:11:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=; b=
	gnDdTzihIQSGR5TGlyuRMoLdaDgPPK6CU5xmrKyR90N6v2AZBD9YFpgtR0HZrcVj
	KGc76HnoTc/th4jfagsZYwgaxdadlYnkTHeAhxClU11OuwA0mqz3NedoBg2mlq4G
	Vci9PJdAFSMDPwlZhe3D6Q41IgzfU1l7h1pNBtUw0nbu1QIQe/qzDCc/nTxk8ZpL
	u4yQ5OlR95T2/UBZqUPdVRRWlXPkjPASbrJsVCh+pqvUW171BDolgshBrOTtUT4E
	NAnRxHyc31H8IYgbBiZQzDX7yRHaxBwNr3WnPNvpf/k4folm9lbC6bm61PA/HFop
	9jWpPT2h0PuyEiO/2x/Psg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023099.outbound.protection.outlook.com [40.107.201.99])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2qmgse1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 16:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0jI567q8D+bhS5zKvwb3V0vsT20FPQlPxNDf2526yyFvN2wUmRi0q4P2w5stSKd6bFQEKhJHm4xCuCTZrzMTLWpoJ2qplqPkTIrUd3t9Hn8/pap+25aOYd8EJ2/sAyZUSqasPgYjExadX2Si4mziM2TlXdzkOJ8oxspqAygr52CG/MY/6O57FHnl8l49dApsk308JEN7eDvXbAA38CH8/wdtoKHx85okKpHr9wy3ACP8tLU2rnJ4PGu5fRi7KPZmS0o0O8kwFHrLoOArAPToJRNW3O2QkhRE/lUh+kgx7dftufzmxgK+AdJqYJQjGtswAE0zDjo6kCEik6b1RTCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=;
 b=qy5Sr4bnqXRiQx96Q+8HC1feMHTTSm3iuNRa98UR18VsEWuKlGQhttNQo66RoSkEMM5SSDs3w3SWFlQ1CcVVUMnur6bT2A6O3oSY2NCAs892vMYvBV9UAwMyRg0CZRH9RsBlPrTbvnLjvMNe1SM3z9ONgJH0Nr1qx4WCmIT6ShpObk9EuXgEZV1nbtXH9rTADzXokm+uMMaMQvq+6MhpcY8wFtjN7fhwhRpuMOO5IohkNEy38PCsODj8D4KzbNZkelmgsJVtRa8OIyADpHTkUPCPikHVPMSIvfCHJNbDKi8tN83VSir+ysCwbpRqaQ3XLB9JR+BosC0bx9WM1ptd1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:26 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:26 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 07/12] libarchive: Make it work with rpm 6.0.2
Date: Sun, 16 Aug 2026 16:10:59 -0700
Message-ID: <20260816231104.3871015-8-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3bb0f3-8729-42f4-10b3-08defbebb25c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|13003099007|38350700014|6133799003|10067099003|11063799006|56012099006|22082099003|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FG5xZihRKYYPHU34pjwmW22kUvr/lnBC5ZdHabpEcaU6eYRHUZAYD2FKC0IZ86Tu4pnw14G/KXsqAOTztzcs5Cf892niPWbAePaFqm5R0U7TFVM0jrTxa20Xsxs0kaUEeMYjja7W6U5Myb7N9dVxcx31M8BXyuUZxGPPMPJiy+JhTBr+zMpzlhEHbdJtiXbVC2iSna8F0WsZnc/0wXnTijjJdJThYgqaP2KrOtX6kbbsCUIMWKeYuc2zHd+ChQc6W1lHVqJZrE6pMpQYaVudKDU0v719cWWscV9DBFYyxRvmIian7Sww8EzeqpScFfyYvE/oOXff5AucrAh84r7McNLY27VTcZoE/KjFzmWkk0ZwddljiHXSI6xGj3oL1NsMbiYkLL1rZU/GsWizg5U7OUsxOupJUCLOI44xCc0qnLi6XrbvXMrj/wdCrZITiYPXGU0dNIQmCXdUKtviowbesetbI3UDUpHbNaZrUR7GwlWOAk0D7O03TVjbhhnkKrf1Y4qfKFpmaY9QSmT1hxHtjUqIsttVni5EwMqHvtpYBUjTdl5qFadT5AiZBLeM2PQXcLhfGVYap8VzHwBNdoNTDdkCWsyQPszcMMd1LJdb4ynyHBPWZAY2d0wIYuQBV8UhSPrTTA5ZnS5x9W3uuH/R3D1tathX8zSCUAmUnWSJThY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(13003099007)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(12006099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6hn+OU/6s4pdEAt49ZrCMCPuGmoGotFcLN/zrYOWHlYoeDAczME1FlSb+Lxi?=
 =?us-ascii?Q?4YacpX5kirK8f81zO77BPXnh+nyIw3zVaQ635Fyr2nCcYEvZEipvaSzTFulY?=
 =?us-ascii?Q?/tp42rSt2J3pz0a5WjJALWElpPMF+t4L6laJc3NyTuDy46ZM7fHpBjeFzc5i?=
 =?us-ascii?Q?1+C2X0O+6vCzyXozaB03FhxJ4Cct+HTElMFL70xahgv/qMTwEbRn+8ebILMi?=
 =?us-ascii?Q?MYKKWulY/tm2p0/xqxTL6797EPH2qun3WivLhGaorSBHM5ICDbF7k8aB5cKV?=
 =?us-ascii?Q?Y2MzypOsqjjNZD8MXNMiWqXlmsKvIQDYRCZql1Cpi5XsfPjlwuG6tTELBHBP?=
 =?us-ascii?Q?NeTDJkRRyysKREz9YV3/49tI9fXRikfj8J3fPZ+g54FLw8ktqw1j95OkBIjN?=
 =?us-ascii?Q?IQ80iMkK4fH11exCIYc+cDrZC3fjlTT3ciB/pYPgWENFF7rv1e6WM5kgy8+v?=
 =?us-ascii?Q?o/TtI4NMU5DVBKanoTX2Cbh26LYM9oTGas9wu0vnVxZU7EQrjaTUuKBNgWEo?=
 =?us-ascii?Q?7ls7TkmbxIai/yHHrHnul0F5p2nXDP0KZtPHvJ3RWwllHdZDkLCKDKcuKCnf?=
 =?us-ascii?Q?0roaqoyKqt2Mfu5/s48Ncl6KGDi0Bl3fQT28LJOpDgkPLncKWd+to3CLpSN5?=
 =?us-ascii?Q?2gXU54K7lNZny1pTSBfjh/etUUDPHOPhIJSdZQrnOCU+FzmpEBrJCe2ZtinJ?=
 =?us-ascii?Q?qxYXOEvFt44voBX3sn4AfDOIfImtcBVGRFwb7kTPv3pUmVCBXQvZzwYBweus?=
 =?us-ascii?Q?3v5ApKmU/dKrqs1sknCrRn1OuwdP7OmWpk8llmnyGVT/cPPxCr1vCmTbI52U?=
 =?us-ascii?Q?PN9mmMWgdBtAQZUaV4RtyhXEaGLCVQrzHh5TCncYL/5KhxcFQkeNAsYI6NvQ?=
 =?us-ascii?Q?/voyJMgPoLOZQt7FAOw6BFJhQ1QM4UpZOyynAqFmzfTLPnCstYN+XeIl0Nhq?=
 =?us-ascii?Q?i2ooMv/z3682kIKFGJZTJeKXXAx1d+jPbABeVf03XrOV2ToSag6z/hIQeTHP?=
 =?us-ascii?Q?N/mUmJe3LMjPS54WOQHGZZaHrQknm/dR7TI5hfm6cvt9DPKDoYwLPzYnrBpi?=
 =?us-ascii?Q?uSpeYy2I9DFB5JmFPYfYvR2uElAxzkk6XqJG58lUM7ibD6ibeDufclEWDxDb?=
 =?us-ascii?Q?ApnSfRGALinmA+vQ7Jf+dV1UMqiOr8b5x5aZEGZcGfH0zqifXI9CCKeOL6Tt?=
 =?us-ascii?Q?kLM+nQqprqbA1473z+Nepy8/K3DI1BtBS/T0uV+jQjXPaZHrTGVdSyZ9a4Yn?=
 =?us-ascii?Q?TIcHzysJ7uVtQmugOlCkPibmITAWXgXdB6cg87hrGKQmjbeUJFO54O/+GxKJ?=
 =?us-ascii?Q?V9Ut4dAQuUmUIpLct1ij7O9hZyO5tyWgx81SAE+GXpq4ZoXNkHWJgade/knk?=
 =?us-ascii?Q?+JZYAk6x3GVR7I9kWZojKsIyJlJnsMtPVePfgBTNYbntAlb3ULdiCBWU7Rxn?=
 =?us-ascii?Q?cIDjVXwarPEh5jJVAIeTelDAsnkyyFDcXn9EUraiGvSDvrQf4tyu8MuucSmT?=
 =?us-ascii?Q?Q+mvP3GzkZj7Ybd+hZR6CralaZbNL0bPpQt4k9eKXRURzRFo3CDBJT2xX0/o?=
 =?us-ascii?Q?aChNoYCZN6Z1j0KGZfAnF5iwq8kIERnKZzxPJx67SmYaJwB1oi5dSJQwaXGg?=
 =?us-ascii?Q?4FB0ZIA6sroajJsUAdj4zn92DTIN6zYH8djvtaygwzKRxbyO2Dkj5MEVGXLk?=
 =?us-ascii?Q?s5NGRSNNoPgLz8TOAKZ54Y8mxAmKRh1QB0/D+2vVd7GEZgLMstUOO6zERCT+?=
 =?us-ascii?Q?esjMHKXmSspPJXmol+h5Axx6yLR+RCg=3D?=
X-Exchange-RoutingPolicyChecked: 
	Wsqp6oZxOUi6+eN1CLV3fxN2ZSYqQu81uhY1MjlGNUXT9/cK0mkCf6+/2epy0SwltRmrmOB3R/kPzl1S77djZgjPjoGV0e4d6yZ0RIWP+U1SjKK+k99rZACT8r6b9SnE0x2KPEMshxvWjQTALBkFI0cJ2NjOZCsFmi4e3BaaqPh68DKp9b2YuLBBXTX4bKue2ztoyeO6Ch6hqT7MKjHGVmVxk4bcWLef5GL59Tq+FeISeOtxj4ZHxkcJgJygsJtvxS5/Fy27dKeZFFCiDaM0SvS/9MaXT1Gh7wU27QAkOYyPQSY09JuX37FbIxCg9mpNbZoaZEIflrUky9EGgV/mZg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3bb0f3-8729-42f4-10b3-08defbebb25c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:26.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31VFDmHTzJB8FOlVZ60zkzPVP8htRbzZhcBfmeDogV9W7N1P/gBXl7tSlXO5Eet8RRi1+8KUlcJqgZ5xNoQAd58AphLXSTgayLdAHzE6Z1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=br98wkai c=1 sm=1 tr=0 ts=6a8243a0 cx=c_pps
 a=swu9HWZHTc4gAW/9Xzq+iQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8 a=yC51jOswJ7eKArgWbMgA:9
 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-GUID: p6QpKpawDWShDb7QPMQ4BkZLPIJ3rxkw
X-Proofpoint-ORIG-GUID: N-IMDH-zVD63aCgsq-U8CWfRnkZ_Zz-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX/3t7bSAyZs9P
 Zd9DREE6DyLNUZIC0yUNxPzOPC47xuiUKRTxGXEeVz3T0rPUX5FI8BixLEKGuvtQqC0Xkxp9Mqo
 SSYojXwfxmPv1j7wXeHtYLhwxdYuQbgezSZhuRoArF5DQh5w+yCOKbF41y+TdMBZ83R9/UVeA+n
 J3yaCSDJFMgX+dKCWsMMBJ1DtZJAgPuHtt1pwaMJZqk2OgtLULTzAUkwZWEmYnxUXbsbgE7Ulg9
 QpYSuN1r/ykALI7a6RPzUmf68wzL1ET2jppocrVoXVyEwBhsJdvA1M6IFctg4Yaze/3/I4Fe1qa
 FXyBQPMBmnRutYhxgO4ptrpfaKmEPRAo0Z6FOKzCihntlIxJyGIZRGsC+9JGO7VimV0hjZiLzJI
 WMjLqBg5jNIbFTdPKvVLjJ0URedgPvU4oFbWSEzy0WPxU5eRqXhoJeTRasRx2DX+kkM6oLb7a4C
 sR4jqPFggohQqBmffAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX2KbADJyC9CnS
 Nqtc4DGQA50EeF76g+EQ24qy9hhUNFmDFBbrM/akQqZSdmXf5yBBt1MOllzbeDv5+Mm3q4fBqkN
 dR6OBNXhpHQ9kIl8Uh6ZOXtyfnfXjgDvCfUMYHq7Yegn3R75loL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243573

The patch is from:
https://github.com/libarchive/libarchive/pull/3346/

Fixed:
$ oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native

cannot open archive from pipe
/path/to/tmp-debuginfod/work/x86-64-v3-poky-linux/xz/5.8.2/localpkgfeed/x86_64_v3/bash-locale-vi-5.3-r0.x86_64_v3.rpm
libarchive error: cannot open archive from pipe: Unrecognized archive format
exceptions encountered during archive scan

Note: 0001-append_filter-Use-last-bidder-for-filter.patch was already
present from upstream, so only the remaining two PR #3346 patches are
added here.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...-Verify-that-bidder-and-filter-match.patch | 103 +++++++
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   2 +
 3 files changed, 363 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
new file mode 100644
index 0000000000..a91f518207
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
@@ -0,0 +1,103 @@
+From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:26:22 +0200
+Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
+
+Make sure that appending a filter always matches its supposed bidder.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/test/CMakeLists.txt                |  1 +
+ .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
+ 3 files changed, 56 insertions(+)
+ create mode 100644 libarchive/test/test_archive_read_append_filter.c
+
+diff --git a/Makefile.am b/Makefile.am
+index 2fb4fdf4..c96b3bc6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -404,6 +404,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_archive_pathmatch_oob.c \
+ 	libarchive/test/test_archive_read.c \
+ 	libarchive/test/test_archive_read_add_passphrase.c \
++	libarchive/test/test_archive_read_append_filter.c \
+ 	libarchive/test/test_archive_read_close_twice.c \
+ 	libarchive/test/test_archive_read_multiple_data_objects.c \
+ 	libarchive/test/test_archive_read_next_header_empty.c \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 44f839f8..c4102c3d 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
+     test_archive_pathmatch_oob.c
+     test_archive_read.c
+     test_archive_read_add_passphrase.c
++    test_archive_read_append_filter.c
+     test_archive_read_close_twice.c
+     test_archive_read_multiple_data_objects.c
+     test_archive_read_next_header_empty.c
+diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchive/test/test_archive_read_append_filter.c
+new file mode 100644
+index 00000000..5c301d52
+--- /dev/null
++++ b/libarchive/test/test_archive_read_append_filter.c
+@@ -0,0 +1,54 @@
++/*-
++ * Copyright (c) 2026 Tobias Stoeckmann
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "archive.h"
++#include "test.h"
++
++DEFINE_TEST(test_archive_read_append_filter)
++{
++	struct archive *a;
++	int r;
++
++	a = archive_read_new();
++	assert(a != NULL);
++
++	/* Append a program bidder (without filter). */
++	assertEqualIntA(a, ARCHIVE_OK,
++	    archive_read_support_filter_program(a, "prog1"));
++
++	/* Append a filter program which comes with its own bidder. */
++	r = archive_read_append_filter_program(a, "prog2");
++
++	/* Verify that filter uses its own bidder. */
++	if (r == ARCHIVE_FATAL) {
++		assertEqualStringA(a, "Can't initialize filter; unable to run program \"prog2\"",
++			archive_error_string(a));
++	} else {
++		assertEqualIntA(a, ARCHIVE_OK, r);
++		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
++	}
++
++	archive_read_free(a);
++}
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
new file mode 100644
index 0000000000..bbd2478577
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
@@ -0,0 +1,258 @@
+From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:31:33 +0200
+Subject: [PATCH 3/3] Remove bidder name
+
+The name was only needed to find the appropriate bidder for a filter.
+Since this has been resolved by accessing the last bidder, since in these
+situations the bidder is added first, then the filter, the name is not
+needed anymore.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read.c                         | 2 --
+ libarchive/archive_read_append_filter.c           | 1 -
+ libarchive/archive_read_private.h                 | 3 ---
+ libarchive/archive_read_support_filter_bzip2.c    | 2 +-
+ libarchive/archive_read_support_filter_compress.c | 2 +-
+ libarchive/archive_read_support_filter_grzip.c    | 2 +-
+ libarchive/archive_read_support_filter_gzip.c     | 2 +-
+ libarchive/archive_read_support_filter_lrzip.c    | 2 +-
+ libarchive/archive_read_support_filter_lz4.c      | 2 +-
+ libarchive/archive_read_support_filter_lzop.c     | 2 +-
+ libarchive/archive_read_support_filter_program.c  | 2 +-
+ libarchive/archive_read_support_filter_rpm.c      | 2 +-
+ libarchive/archive_read_support_filter_uu.c       | 2 +-
+ libarchive/archive_read_support_filter_xz.c       | 6 +++---
+ libarchive/archive_read_support_filter_zstd.c     | 2 +-
+ 15 files changed, 14 insertions(+), 20 deletions(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index e844e42d..406d84de 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *a,
+ int
+ __archive_read_register_bidder(struct archive_read *a,
+ 	void *bidder_data,
+-	const char *name,
+ 	const struct archive_read_filter_bidder_vtable *vtable)
+ {
+ 	struct archive_read_filter_bidder *bidder;
+@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *a,
+ 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
+ 		bidder = (a->bidders + i);
+ 		bidder->data = bidder_data;
+-		bidder->name = name;
+ 		bidder->vtable = vtable;
+ 		if (bidder->vtable->bid == NULL || bidder->vtable->init == NULL) {
+ 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index 9dd9f536..5cc8ff55 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct archive *_a,
+     __archive_read_free_filters(a);
+     return (ARCHIVE_FATAL);
+   }
+-  b->name = a->filter->name;
+ 
+   a->bypass_filter_bidding = 1;
+   return r;
+diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
+index 3bd8de2d..e30b6c2b 100644
+--- a/libarchive/archive_read_private.h
++++ b/libarchive/archive_read_private.h
+@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
+ struct archive_read_filter_bidder {
+ 	/* Configuration data for the bidder. */
+ 	void *data;
+-	/* Name of the filter */
+-	const char *name;
+ 	const struct archive_read_filter_bidder_vtable *vtable;
+ };
+ 
+@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read *a,
+ 
+ int __archive_read_register_bidder(struct archive_read *a,
+ 		void *bidder_data,
+-		const char *name,
+ 		const struct archive_read_filter_bidder_vtable *vtable);
+ 
+ const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *);
+diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/archive_read_support_filter_bzip2.c
+index 588953f2..1cfc55dc 100644
+--- a/libarchive/archive_read_support_filter_bzip2.c
++++ b/libarchive/archive_read_support_filter_bzip2.c
+@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "bzip2",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&bzip2_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchive/archive_read_support_filter_compress.c
+index 4e1f1dc5..4763995e 100644
+--- a/libarchive/archive_read_support_filter_compress.c
++++ b/libarchive/archive_read_support_filter_compress.c
+@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
++	return __archive_read_register_bidder(a, NULL,
+ 			&compress_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/archive_read_support_filter_grzip.c
+index 9d9ad46e..8457ec7c 100644
+--- a/libarchive/archive_read_support_filter_grzip.c
++++ b/libarchive/archive_read_support_filter_grzip.c
+@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "grzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&grzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/archive_read_support_filter_gzip.c
+index 89ae0f37..34b174b7 100644
+--- a/libarchive/archive_read_support_filter_gzip.c
++++ b/libarchive/archive_read_support_filter_gzip.c
+@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "gzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&gzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/archive_read_support_filter_lrzip.c
+index 33910fe1..a1d45d77 100644
+--- a/libarchive/archive_read_support_filter_lrzip.c
++++ b/libarchive/archive_read_support_filter_lrzip.c
+@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lrzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lrzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/archive_read_support_filter_lz4.c
+index 19086a1f..28189a07 100644
+--- a/libarchive/archive_read_support_filter_lz4.c
++++ b/libarchive/archive_read_support_filter_lz4.c
+@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lz4",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lz4_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/archive_read_support_filter_lzop.c
+index ebfaf01e..5a552fce 100644
+--- a/libarchive/archive_read_support_filter_lzop.c
++++ b/libarchive/archive_read_support_filter_lzop.c
+@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzop",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzop_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive/archive_read_support_filter_program.c
+index cf7c3613..a9e02a32 100644
+--- a/libarchive/archive_read_support_filter_program.c
++++ b/libarchive/archive_read_support_filter_program.c
+@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct archive *_a,
+ 		memcpy(state->signature, signature, signature_len);
+ 	}
+ 
+-	if (__archive_read_register_bidder(a, state, NULL,
++	if (__archive_read_register_bidder(a, state,
+ 				&program_bidder_vtable) != ARCHIVE_OK) {
+ 		free_state(state);
+ 		return (ARCHIVE_FATAL);
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf7..1cfddf75 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "rpm",
++	return __archive_read_register_bidder(a, NULL,
+ 			&rpm_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/archive_read_support_filter_uu.c
+index c0f6f48e..10d49648 100644
+--- a/libarchive/archive_read_support_filter_uu.c
++++ b/libarchive/archive_read_support_filter_uu.c
+@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "uu",
++	return __archive_read_register_bidder(a, NULL,
+ 			&uudecode_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/archive_read_support_filter_xz.c
+index 7c8e0cb5..b00ba543 100644
+--- a/libarchive/archive_read_support_filter_xz.c
++++ b/libarchive/archive_read_support_filter_xz.c
+@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "xz",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&xz_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzma",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzma_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/archive_read_support_filter_zstd.c
+index 12eac04c..163f54b5 100644
+--- a/libarchive/archive_read_support_filter_zstd.c
++++ b/libarchive/archive_read_support_filter_zstd.c
+@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "zstd",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&zstd_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 868086e319..01a5249a88 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -33,6 +33,8 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
            file://0001-append_filter-Use-last-bidder-for-filter.patch \
            file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch \
+           file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
+           file://0003-Remove-bidder-name.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

