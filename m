Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A852106ACCA
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25679.1773331896139364792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p4JwfjZY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312e9bb6=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9XEmA008800
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6NOuHEHq7ShY7qr3yUamHIzua2sv9zg/0uFDFh/VSPM=; b=
	p4JwfjZYyouzfOsGcODPX8oKn/sBKZcmgzYtnU3r/77c14+n5+SQW2fU3f8mFn27
	q3Nt7LUOPEYGcAIi8v36tEi1MNSlpgDpXkW5VDqdLqy6vJQIKa6xWmXG3HOr5aEx
	Ct1deJAul+hOEgZcAUgM0tPKIg4k9gRXLDp0xcUra/bmDso7Cr/+te2N/UW5vpjV
	GH+swDImaZ20qmF6BWKyWY3O3wqm+FggNa7L72j82GRvaDB2gqiXFxLwFAH02guB
	TltS5Bi3Nc7oW1nU13jvhOtvMzJzwDk1fnATA5G5DGjvvwrkLmXM46F5oiKJ/nS9
	i3HCuJTbK6GtbWzugKqRBw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqrewn-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+tOBIKyM1etJZS9oKWtYxDsKtIStlsXI1klLHxUSXcIqkNaAFFq99fuzmcihad3GvwRjInwvaolTvajgVlP6PSW6e+BtTR+I2z/qKqEFGces1iT1biw2WogR7KQWjmE61mGJTLDUSBZRqGQMF9yI/qgKIaDLFN4K43V/p47r6SKJ+XvsJOjbENWX32Djiz6DqCoQQ+EO8KQajvY8WsO9XBlzMqJri9oUx7qvWQkx+XWoQv46ngNDR6BD70GFAGgOcpj7bsEcuWh/M0lX98ethZ8i3xI+vRlpI+CJeqTeJXgTSw5Jb3o9N7EaO00Avidv4ezmwK6UfR1yZC9OoFn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NOuHEHq7ShY7qr3yUamHIzua2sv9zg/0uFDFh/VSPM=;
 b=TctIt/vXbdBa9TejloirAKdH4febgHKBHnW0tPxE5VOQLn+OQ3J6OhnFsuY/sG/eg0Vgx2z+RodqiHqMPA/Rkx8+lETBr1TiOa46u+F+m3xwMuxkclnShlxZ+ADi3t7cIXB4yt9D2xZJiSHewx65go0tq/drPkeBmxkWnBPoQbocrf/iYPWBqvlVti49lgBw5Mwzfub3PRWGEtlCIcxzAW0gm8EQ+o0GxXyJYSIaYnKBV5CCPxndCV+OrhMD/2jCEUxKmT5yc2qNZl2kzkkPzG/QniGAggIEoWfM0WaPUKrPPMtxH+185whocVQ3bTxptRlrkHzzv0w0PgLv/g/Llg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 16:11:33 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 16:11:33 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 8/8] busybox: fix printf ptest failure with glibc 2.43
Date: Thu, 12 Mar 2026 09:10:23 -0700
Message-ID: <20260312161038.2578649-8-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
References: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:8:2b::19) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 8280f8df-96d3-42fe-02c1-08de805203f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LRZejS+lT58NiJSHxnqR6H9BgXg/2OsfKNWOtMau1OJ3iUXcOoDvwcZWUzlYONFjhTxmq9yPlwPKG6GHY+Kx1ptR/E9jZ+nPBGg57pygObt7KLSaaRokZc/w1Y7T88Y/s6QOgPPSOSPpuzfW35RsN+KbAo1GYzdXuPVSSHWnE2IDo4GMzD+waKlxNllkRvcFhXvd6m1bzd/lFcdVVEkTqD3MZM73KkohsaRlNNYNn542beruOpLDlppKm04BDcQf1iGs12MfL0H19paF5i8oKGgOuBowNc3c4jbyUHHQp5AnYPQOUwFOlTfzEOm37e54m/aw+kaaZ8FhudwGAPfM94HHW7mZipi8GHI4RWHCrQOT8fDZnOx60jpeYv1VfuVa5rbOZ2E9kizaOK1Rp8ja2aL+IQ2zA4gGK/0k+U/Tm44AT2tC9avG6fpVYWiEHAaTGFbAqWRjEsNpNGz14nEe3PJ21z1WLB3F8flVoPVVzA4Lk1k4FOtRgki+/FuNYu5JDbBHuCYbJLavEexiveUV+I+k1oz/kS22Nr3k2CwrNso3HFBzbDWJ4ma9moO1IJqnqFIfmadawPIBEVarMsRxlX0L3o39eW2kl0ljWRspKsIlxrQkiC+E1QC05j2IJoCQ2IZFx3sdj9VsSMaIrYkXwXjbLyiQ09eD8j/4iN7y4RDJZdeWDjYgrN14vkOmdnidRGYZSFRBItxRnzA+x1cnL539KeXLkTGAZuLteuYEtHRCbmJmRia8bcAFe1wpcbaNX+uSmbLtfQN09RgMrYox/IfQZnRCxM8UFxRGBQZQkscOvt8MimCbyBZPYUEploYu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AeEinYuS2GhFiJtFbfcb/gVsa8Fm9XREWIucIDIcUA5+XWwVKJNphjPwyzFl?=
 =?us-ascii?Q?2KYzBVhD4QxytfO4exfCAJMQPyszl3l5SQZjkvg2pMFrs6jIabS6+zefkqie?=
 =?us-ascii?Q?Yv+k7UuIMeEysuIPV39odfHKNzahF4SDm1QW0Pc/HG6yd++d3QsKdPeUOJHS?=
 =?us-ascii?Q?D+A7Piv4+WHz1Dw4AJ4sxhv3kyXwnFjTaW3Uy4hBUrHJSxw/7rJLHU17PFlC?=
 =?us-ascii?Q?KiPBAeMFsWIBMHU2jZQQTeEt5K1cC7sMJjg6S5eb/YOXzKyIOpKh7ZLXIxM0?=
 =?us-ascii?Q?TauFSKjfzUUgYEwQQ+lwsMfcSEkSP8BZw2VLeVUjH7nns4/VadfXlJefjpRc?=
 =?us-ascii?Q?xejstBoT+TM1UIYmj8ef82Z6sC1cs7Oud4wmk5JJsZcR8PRGYjVKv4VquXY0?=
 =?us-ascii?Q?UtfqUdEZ72pNOnX7crCaeVAY/D7OecxRNoYM/hddZF0dLGoTaF0UEm+q1FFl?=
 =?us-ascii?Q?ViviY5X7HMHQmk4ky9W+aC4X/Wp6Q3+Usmf3uj7eVPzA4ufJJ6ISkMEypUNX?=
 =?us-ascii?Q?lGx2Ko1z+ybm9SEOLIYeUSHqj6GlyzNy8Qf3L95UO1i8gAjOnzXfwWhX+D3m?=
 =?us-ascii?Q?dIepdru//7j2f+kKvKorLBibxix5WgGDp17otlGbkSOExiCVRozTZ65sAYHZ?=
 =?us-ascii?Q?oqkjBc7mZsr1cN2GCrivlmrggRmvOKpcbraHUIs02AwsLrKfUHBZ6NoNTMsk?=
 =?us-ascii?Q?PCZSlVBoiTX0Ekph+Wd5QKKIpI35KIW5SB5h7sHgKi+UXsqX3IO4qM7eDk76?=
 =?us-ascii?Q?BNaDVXKwDKhjLo+MItKMqQII0ULrhbZoNobcjkJYVkDrf2XscPgD6yFuRPox?=
 =?us-ascii?Q?NAGyHBsGazseMykh5UykggaUtshGPGrbbsTfoQBEoZsIqvB8N80e2eRUeACv?=
 =?us-ascii?Q?+YXepr1sEXLec+LmVyVniQ4u77q/gkvHf44Azi2aLIogCLQQS/vL/tvKLlAx?=
 =?us-ascii?Q?MIB3qtE9tA0si870iQaiaflsN6MU5oXfsNuETMo4O49ubTFHwr3DRg0YAyeh?=
 =?us-ascii?Q?376ChCFxHjFPaBco5e35UGhhkJ80EpTjoRQuc0+xgSeY+nc0Qt98l0bNz3jy?=
 =?us-ascii?Q?Mqidz7TrCAZ4grNtSVGT5Yl6AWJ3FpcLtodHmRQqL66K3W+zqh589n4/9CxV?=
 =?us-ascii?Q?R50pTvCiO77HXULCQWkRzvW/Iniidry8R/N/VqbjJBUb7hYrvdju38N+rlX4?=
 =?us-ascii?Q?aKU4u2fRJzgn/iKiXvvcZeCNz+ljRtaDCqA6pDd+ZYHvmqd8SGjc2UPdzbJg?=
 =?us-ascii?Q?E+1zAzWE9V2CT/HKvJJiZIHgFjBQSdOraF3Ua+yVtHtT58nMilvPvgZwkz8A?=
 =?us-ascii?Q?xKtmkDT98YHdAKvQjOvusb77qPDpwv9b4lb+XIhvCJdIFZaGliRZ7ESYTXF2?=
 =?us-ascii?Q?wOhvqf+fijq+xHUbQqXaqqtsk1l+3Vr38P6oozzLKPMgZHCgijFQqXZD9uPV?=
 =?us-ascii?Q?9n0HHF/o7JgnbBUhPmdmdAJOx3VXBMOpsKRl+mSo1/yFcxD7ZcEPjpy8Pab6?=
 =?us-ascii?Q?6+ytEoftkFAyWudxdTjCBha0xWNWbXAvWcuWqEMSgFBqEqd7q93tfZ/VT+57?=
 =?us-ascii?Q?eG4Q5JxtmP9BCQoiwasWVflIV0iIu90aeIRs3341MdBiku2VfTuWwi2FOytl?=
 =?us-ascii?Q?qaBY5VU2PK/M54qxEtGtw8AAoPF5HkpCk3pf7AIBykCOewohipRaJnQ8vs6D?=
 =?us-ascii?Q?Nk41L73yykVx6B/HCFPhRRHEdFKNOeNQlQYTu2iypJ6s4zotLGhXvzpZ+3y/?=
 =?us-ascii?Q?adMyWIr6oTYZkQT8LD8+GloAs/MHm7E=3D?=
X-Exchange-RoutingPolicyChecked: 
	MS0dzbdfCsn7Nbi5wf8CqA5eUQxqMal3qDw2vMW0Pq4QfIkOpQPZ9u0hJSsulb0LnlW0ETFb/py963OL4JLn3VcJ23MpQmRZ2dMA3+H71cNrKsBNKrAjJCao9pkQUlCW3F5oeEXuKnA2AMtgVhvo3Unt/eEh8CNTECz01pHTZznhMcNAeEIZXyPxnrixiporN2ZxIzKEym9mWMLsg2ypQ/o9jHgPOWbV1le6+Jhec5iggzQWxGBBEBsdDdPn0+uZPXOKk9oA8xATgz5PZwJypjFyU8IJf97r4c4ZoQNhqVYZMGcK8Q6XC5APDOpIXxdslEwNrRzu0P//un71ZCdglA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8280f8df-96d3-42fe-02c1-08de805203f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:11:27.9558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6m+mi3X9XvwejS/k1C29O5Mk7Xp67snTVZSnzrZkzge+ZEGjqQFXrEXviipd6O4OZC3l/LAiyNBMiRSr7rAq5/3GASBoNLH/kRwSb4njJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-Proofpoint-ORIG-GUID: d9tKwBpzrJ0QU6Y23IXg3WiD33LY7wHB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfX0zPMYOcJ3W52
 ZBpnOjs6NXsWQsLojUcOhRbC5CIO0uwy036GsFFhKv1EwTxitkrxgUqqV1FN2PyztUu0siUzQ/t
 Robu0JaIhYnKN5Mo8EuAQER9KlNMb9H/j+YfK3WOTrKX+9oLFf9T3l1OI7gBGo1uqqVHyM08q3V
 bvCMOOM7wa+pfoZczHOip8ot6KFgeVXLMnL1n4aeFuhUUt0v9J7JL88luRzdHlXVvaZt9UvyajQ
 cwu79LenKDo70yqnYYhHsMrun9VXmKorTfEWv2GSSDNkxn7x9qvXuHfHqLzasSRAtgjmQukHCmb
 WFdMLb1bPKX0H9ZGy+wzkAfnslAVspqsw/czEw9kOCSLrB4hNdg94jQqRh7IvZdPCYn10N+zWlo
 PXBZE/SV3VVHgJfW5h5+o7s2Z9RunJWbJ9F1LTGXiVBII0kisoahP2CF97e5lcc0U45cKkxmVtu
 HUx0P9pqhd8q/7AgKtA==
X-Proofpoint-GUID: d9tKwBpzrJ0QU6Y23IXg3WiD33LY7wHB
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2e5b7 cx=c_pps
 a=Z1Yvi+W4mc/VVWckEa0YUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=xNf9USuDAAAA:8
 a=J0Tn2xNtAAAA:8 a=t7CeM3EgAAAA:8 a=zyrUNJ-FjU7R3JAHTiYA:9
 a=3w6iy9BqfFbDrj__1GvT:22 a=9ZcRxastL33iXWX1AWsW:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232994

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Following ptests were failing on aarch64 after glibc 2.43 upgrade:
  - printf_understands_%s_'"x'_"'y"_"'zTAIL"
  - printf_handles_positive_numbers_for_%f

Backport fix from Debian bug #1128825.

References: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1128825

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...printf-ptest-failure-with-glibc-2.43.patch | 114 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch b/meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch
new file mode 100644
index 0000000000..951812532b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch
@@ -0,0 +1,114 @@
+busybox: fix printf ptest failure with glibc 2.43
+
+Following ptests were failing on aarch64 after glibc 2.43 upgrade:
+  - printf_understands_%s_'"x'_"'y"_"'zTAIL"
+  - printf_handles_positive_numbers_for_%f
+
+Backport fix from Debian bug #1128825.
+
+Upstream-Status: Submitted [https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=1128825;filename=busybox_glibc-2.43_thp.patch;msg=10]
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+diff --git a/coreutils/printf.c b/coreutils/printf.c
+index 3cd48cfcc..a5d995ab5 100644
+--- a/coreutils/printf.c
++++ b/coreutils/printf.c
+@@ -191,6 +191,7 @@ static void print_direc(char *format, unsigned fmt_length,
+ 	double dv;
+ 	char saved;
+ 	char *have_prec, *have_width;
++	int saved_errno, ret;
+ 
+ 	saved = format[fmt_length];
+ 	format[fmt_length] = '\0';
+@@ -205,22 +206,32 @@ static void print_direc(char *format, unsigned fmt_length,
+ 
+ 	switch (format[fmt_length - 1]) {
+ 	case 'c':
+-		printf(format, *argument);
++		saved_errno = errno;
++		ret = printf(format, *argument);
++		/* Restore errno if there was no error */
++		if (ret >= 0) {
++			errno = saved_errno;
++		}
+ 		break;
+ 	case 'd':
+ 	case 'i':
+ 		llv = my_xstrtoll(skip_whitespace(argument));
+  print_long:
++		saved_errno = errno;
+ 		if (!have_width) {
+ 			if (!have_prec)
+-				printf(format, llv);
++				ret = printf(format, llv);
+ 			else
+-				printf(format, precision, llv);
++				ret = printf(format, precision, llv);
+ 		} else {
+ 			if (!have_prec)
+-				printf(format, field_width, llv);
++				ret = printf(format, field_width, llv);
+ 			else
+-				printf(format, field_width, precision, llv);
++				ret = printf(format, field_width, precision, llv);
++		}
++		/* Restore errno if there was no error */
++		if (ret >= 0) {
++			errno = saved_errno;
+ 		}
+ 		break;
+ 	case 'o':
+@@ -238,16 +249,21 @@ static void print_direc(char *format, unsigned fmt_length,
+ 		} else {
+ 			/* Hope compiler will optimize it out by moving call
+ 			 * instruction after the ifs... */
++			saved_errno = errno;
+ 			if (!have_width) {
+ 				if (!have_prec)
+-					printf(format, argument, /*unused:*/ argument, argument);
++					ret = printf(format, argument, /*unused:*/ argument, argument);
+ 				else
+-					printf(format, precision, argument, /*unused:*/ argument);
++					ret = printf(format, precision, argument, /*unused:*/ argument);
+ 			} else {
+ 				if (!have_prec)
+-					printf(format, field_width, argument, /*unused:*/ argument);
++					ret = printf(format, field_width, argument, /*unused:*/ argument);
+ 				else
+-					printf(format, field_width, precision, argument);
++					ret = printf(format, field_width, precision, argument);
++			}
++			/* Restore errno if there was no error */
++			if (ret >= 0) {
++				errno = saved_errno;
+ 			}
+ 			break;
+ 		}
+@@ -257,16 +273,21 @@ static void print_direc(char *format, unsigned fmt_length,
+ 	case 'g':
+ 	case 'G':
+ 		dv = my_xstrtod(argument);
++		saved_errno = errno;
+ 		if (!have_width) {
+ 			if (!have_prec)
+-				printf(format, dv);
++				ret = printf(format, dv);
+ 			else
+-				printf(format, precision, dv);
++				ret = printf(format, precision, dv);
+ 		} else {
+ 			if (!have_prec)
+-				printf(format, field_width, dv);
++				ret = printf(format, field_width, dv);
+ 			else
+-				printf(format, field_width, precision, dv);
++				ret = printf(format, field_width, precision, dv);
++		}
++		/* Restore errno if there was no error */
++		if (ret >= 0) {
++			errno = saved_errno;
+ 		}
+ 		break;
+ 	} /* switch */
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index d3851a27b9..2a38372339 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -59,6 +59,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
            file://CVE-2025-60876.patch \
+           file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \ 
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
-- 
2.49.0


