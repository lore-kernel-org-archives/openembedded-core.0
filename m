Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C29CA5FAC
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 11:59:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11661.1790769561973414742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 04:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OcysotU9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47331f768d=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB9TrF2933572
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 04:59:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=UNfQjmviY
	1dspqj9CDQYn8lA3ifLI1i1KV+nk78xrNY=; b=OcysotU9pBN2gKsNgqx2JgnlJ
	zu6zOizYymZkMnUI9cFoDDDpEb8y1opNaOW2r/EEeWGiBdQnlBpwLrTNZG58e/ds
	pBuYikmw+7r+n7Y0G0hmcLE9IiFpfd7VJEmQ17UKvjfxVZF4FfE92fyIq1o33tU5
	ApHAn2CZBILyDkNQUWJPvYWDZNpKGqDq5A6RpGzL2BzridxRTgm+RALCfWhTVlKp
	X0ZFQ21CJah7eGDfRdzGoxHjOSjtgrit+EfiQMdmHIbbuR+jkG0kDQe67Kceqes7
	O/SbxSPLVSsqQ2UCN3ysPV7MVM6zmRvfhecOhuum2MgDkfdL/ymal6ejxawAg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023114.outbound.protection.outlook.com [40.93.201.114])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gxdjgx796-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 04:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy/4rJqOE9hqm9U3qpp15CdTyogHGagPWnGMqMMOT7OW1oQekbD8s0uzYO/NmkuBdbNffS+tv5j8aoQ/5l9dRV3E+ivnpBPXFpg7NLI9xQU4tLqW43ZyRi7GV9mUNc7e6D1cJiCJi69AD5WcbGCMXBHkdHMzNvIc0SsQgs056QaT6PVKTTMWrrFmKRv//Z4Pe/Qxu+oFhKSKcFScDbFbLUcNS/CjRj/KTbAPrYt7ALwvnk7QlV6j5/Dm2MghoFWttCGAqSVULefM4/dX8PXyXXIOOHXaDykQdiK/N60Bu9UIbw/zr9NSjHhXOY1Lyx1smcc9iKdc0R3++2kBhasshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNfQjmviY1dspqj9CDQYn8lA3ifLI1i1KV+nk78xrNY=;
 b=DscVw7Uog6Imr5yfE5gU2TiMqiM8OwofFzYFTltWEr1mKYALhJQZlJ3+6K6rk7dSfqfeYAmjaTTB2LkGyghv0Ibm7gm3g8okO8IiS50MR8SGS9jN+DhzcMbfj4NEvPaALR1kLA8dFW2lgVkIq7xTA1KD7aIn/xJf37rX/74c5CsmHbkl//+MXG98PprpEHzJAS+2yyHrzPTjAcCV+NkGnY2F40PpHiilcg4GxzOQlpPucghP/303+gRabdqoVQW6bggFYwfU+oclJUsqZDBsV58Ef4tK6sJVFwy3NueOChFCpXLvmPRmjyvlPdrNsMIKSBYYSU/Zzy/tV60EnJrFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6)
 by DM4PR11MB5278.namprd11.prod.outlook.com (2603:10b6:5:389::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 11:59:17 +0000
Received: from IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53]) by IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 11:59:16 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, sunilkumar.dora@windriver.com
Subject: [PATCH] opkg: take the default architecture from the target CPU
Date: Wed, 30 Sep 2026 04:59:03 -0700
Message-ID: <20260930115903.1902975-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::14) To IA0PR11MB7910.namprd11.prod.outlook.com
 (2603:10b6:208:40d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7910:EE_|DM4PR11MB5278:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf8644e-21e1-4440-712c-08df1eea40b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|52116014|10067099003|56012099006|11063799006|260925021311599003|260925021911599003|260925022911599003|6133799003|12006099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	MYEodsjCDXcbBn8e+KduVDFdjW15LrD4xiquItNgpJiJKabgJ7FJgF4JSwFiyEdtniCZQ6IWTc8bg11WOjvNoA3VWBVSPyNA24zGhIG3GHL6YE77DAGeqYt6OkDteRhbwubRLdODt7tGrJrP5nfZWeLeLAcnIfMwNPdG/ARApcuErqQrh0lYqIKxp9dt6HnzqwhmImKHYYiW14o8+NHGXmb4TWvNLGK+lsQZLFG4i3E6xtCMokZ/G9hlZRNWCWUCrS/dH81rPhANiGTJCJf6iVONlfLy4/GP6scxG83CmBWWQ9nxnKkyuFaq57P+AFu92qJVsG/juNtufNpfK8Gp+SHU4XGeW9ulEmiwdqyh86JEZrCzfGlUkA0f/+K3HI+rwwnr/1uAv/Mgpe5sEvR2hTJr/uwH/eZ8FSyfGAQdzV/xio1yWsMrr4xEBOGTir8UYnvNbpuHLbmdf9NOxIP69NtgwnVj3mfvDIoCtcpyz/ToW8b2ZdeDI1OvvqwloLmt0kFsSkhDCwFDSSAuznA376vwsZoFFH7Qs3rkKcPT1aLerT6NDbWE5T9Tym7EQZHzMlMhC/W2ua3HpNEISgzQv7HHTa8FSsi0ALPDTi+jk9lZ9hYhUsjJaZXISRPvXp3b4v1RHmYdISB9IOlqo+57XHA3CcsC2ItGnzP1UDx9RuM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(52116014)(10067099003)(56012099006)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(6133799003)(12006099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3N1bed4NHpTI0Teo12uJFU5wzYo2r9HmRYyxN43iabHGy96Iti51D7FtDVLB?=
 =?us-ascii?Q?Wa3d5vxAM7dPAtFLgdr0f0NBv3c8NEz/3FjrHqp77Ajh7gTNsssrcjmYYwHZ?=
 =?us-ascii?Q?wLPgwqeezWvUkY1zf4hnGz4e6AYaJFhSGvYqKRbkSPOjnkbUzqJpnj1Nca7B?=
 =?us-ascii?Q?3iDdS0rJHh8YYndKl/1xnuACzH+u8Sp27cQAsw/dcpKfU0FL8XfAmktaM9tB?=
 =?us-ascii?Q?eJld00Fb7JPEXV/Igysm/IbibJMaFYJ47in5JSPWo7dxlhDv659RAdplMy/X?=
 =?us-ascii?Q?LSTsmLFovPeVxVL+ST1WubSpi/dPkZvYRaFjF4NXecVxiRokuksTgTHLkTdJ?=
 =?us-ascii?Q?L4dE6/PdEKn5Ec5/08DQB6yxoXzNhkoei/Bc9S+FO5InV6+XBIlaJf4CG8ah?=
 =?us-ascii?Q?3ALj0kw/YhnIaYtx86/9F3nssBUj7QAohFWZehvV564G3sY5kQ5vHmDBtd4M?=
 =?us-ascii?Q?Hl+qlnsC8MZc4IJrwP+VFzGfIVgRbV4JzqNfaCbX3CS5AjVADeeJoX1C6lwY?=
 =?us-ascii?Q?PZPOLUfhYSWAfRDUt0adzoXlm2HWw2zALX55RYuiClxLGtkRNumTp2y+kM4b?=
 =?us-ascii?Q?W5P6NbobXT++ENJxApratVZ6xNTu2WKoYnUliyHlFANjSpS4pFkwlhzNcH1x?=
 =?us-ascii?Q?j84qfkB3nvD93CSw6JlkO0g3QZmyYXCNwzASCseJehRjL6VArr79gtrc3njM?=
 =?us-ascii?Q?EMMWjnkuS0rg7doNW8tjf4l41H63nhlaKGGuMwAsUcN5W+WqHoROFY8Ex8ov?=
 =?us-ascii?Q?kBkSJE50pac44QHSn2ilc5U6hyp9MxnEWx7EjuXxV+Z+I5zEbgJCkaKgN7GF?=
 =?us-ascii?Q?asGWiC7B/POkbfX4DrlpK+wkPavwLUxWLfzagG2++TWdR22CXFSiuxIXnxHh?=
 =?us-ascii?Q?+kmhkCR7BoNpmThLhyuouIjXriePstkUgZ8Jqwb0Az0o8sLhWrnECNf2aZkt?=
 =?us-ascii?Q?biViZ1edVwl98HiMy4fL7qTMnZPRNBVm9vuu4jE2WNO5gcNhytmqgeEHgP0B?=
 =?us-ascii?Q?UZp/eMjiSacbAc7W59PreKRWSFBuZhlTMYQj6JNAhFq8YJ+EIvFqLMetS18D?=
 =?us-ascii?Q?FVipUA1iZ9nqMv6DgJ2jo6zjpL2FXxJOKXlpCD+VnlDPzeVeLPl+vagc1Tak?=
 =?us-ascii?Q?mGF06yfuN+7F7oFnpixOuym99qtMTwJyHHdCqusI3joG8DwpOLlXlvrSlsFN?=
 =?us-ascii?Q?EmNfGAyhdJTgdfH+IJkYycAg4mZCzXkqqVcrRy4qWO+lpyPqBo06ul5meYig?=
 =?us-ascii?Q?LAWT6jY9qW1MXxCWJBvTozl4OG9YUXgk8QMEebBBlfbBf/CCwcM0+obM8Nad?=
 =?us-ascii?Q?rIWkQfjHHUzlclDiS+NN5TXrIKuMnxHDy+b1H26v31gTtk8TUyAmojsoIjNa?=
 =?us-ascii?Q?2BMcUVS838ngZ+uBBr0HvoOfNo0Zv6ddF1w98eiYQ4zAVdMzke0ofZoSkmEz?=
 =?us-ascii?Q?H2iijtIbp33V/rxTq4LvEgr1OrhzI6YStWW8Ha75yeihoqnCpqsmcURC3JXi?=
 =?us-ascii?Q?q1scKgqDMZEYHFxRXw4vqaOO1b6AqxJrJhTtqSJd0VhQXh1kKOlzHYGn+86s?=
 =?us-ascii?Q?ky1vTZlevJQQhJWLRL365dUfM0lIIHlKusxq2LIheSA4WKl+AcEhQovyhBow?=
 =?us-ascii?Q?FcXzFtRUmZNQpZoPO/TR4lgBopDaCiGMQpbQXRXCWv0NvMHa7+a9SjCoKZwx?=
 =?us-ascii?Q?xPz08yAmewI36MBPGjTWslzKKdTuWRNVaZww4QobgKnE+HlH+w6GZRzdw8W4?=
 =?us-ascii?Q?yjO2DAHQtpNIITaya/HCZKsnPfj0b1U=3D?=
X-Exchange-RoutingPolicyChecked: 
	SKNPQvkDE7i7tqop9wHE6YwqgjPYl64X2xPlkY/Pbjio9+gelL23MuUHW20j3D6UgTefd0LeXZuX/Q5ShpQSovmZR8d/x/+xUqlUU064r/5OBWVNNl0s7sHdKgudlZ4o5zUkIhkKuX5poAzFb5A2Vj2JddiXNVTsBTBid6op14g/hsKOMB9G3k63W8FWhhccDH0U4FgkW84lJfuJDa7BwtCV6YvA9S4KdqRf2c1k0mDUDkuQH1fG7aGuNV/FxVgi2UundvcRBxpRB8/0atoR5TgRsJlocchdXVLbP8pF8zQGfzqn1TLaMVYRsqlMxnJsyqOlpZZ6m04icdB/jd4FLg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf8644e-21e1-4440-712c-08df1eea40b5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:59:16.8199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52shKWy1YZ+c90LsQuXH7L3WJ6eH6oLsUpF7SLrv7vnNcw5YKxgkNnfiCK4WCXM8AKYClOuekdu9GwFfKG8DzCftONzjfu25GYxdTdbFjbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5278
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=C/F8WgP+ c=1 sm=1 tr=0 ts=6abcf999 cx=c_pps
 a=1bfLZ9IPuZA5gEd22F+xnw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=geDs06hvAAAA:8 a=8zTdFUhVWWYvO6uGftUA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=7yvi0DHx91fDKfvzWsLo:22
X-Proofpoint-ORIG-GUID: uxkli7lu1wF1Vi-Ii8ZXerJQ44ced8Ty
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX+mquaN/jTrQW
 cO2kMU7jcrxWbkySAEjFSuNnfGmrPOm9pfUzHPoU65Qy8vgM1D6BIETpoJaDYmtKgediJssR9vL
 j1lPo6ywmjaxZlp7AiFIMaQBNJ/QpYTamXBNnRjDY6kMAyM9Sicb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX155K6/UaSmAm
 wjoRaSlzhBt3GfMgHfnu9s5LpZIi5+jD5VnORZQuVTdqenWrUndKcS+nkGJmD8zGNr406qTGuKq
 ZDLij6MMYTJyoJtw0CaxT5LeHPg+e3WPrI5S6UDr49CiLJYQqc698zsc95/Tn3jCX+0edvP2sHs
 w7HnS9LfxFpup0XEYRRabDB8U+DlP1tRfrabamvqRRDHIJH5I1U68333i/a71jc9l3vo6QwhKCB
 +oaPhH5XYtNCDN6XIEXZxx/Y6cK2T4YOzIFP5KMnv0adXMqx9ZFUAcdcGtEkyL2yBvQtAM/DDVF
 XDJKS+es5AOEDFJkuvOCGbffTwffugtwwdFTKbabdTVVjvdCJoVBRfiM81Qi7N5LxiXENRQlzrt
 oFDd80RWRrbwNAemmoC26WbFMGGZr9JKavf0u+3c+/Rm7ctLT35a7C6hHVd0K6oKCbJ7t4bJxBQ
 CAbqIRuLUw2MnNKSaEA==
X-Proofpoint-GUID: p9mHI-qPQ7reZPTCONmFf5tj9q5PuC83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 11:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246961

From: Sunil Dora <sunilkumar.dora@windriver.com>

opkg sets HOST_CPU_STR from the build machine's CPU, so libopkg built
for aarch64 contains "x86_64" on an x86_64 worker and "aarch64" on an
aarch64 worker. Carry the upstream fix, which uses
CMAKE_SYSTEM_PROCESSOR (HOST_ARCH via cmake.bbclass).

[YOCTO #15784]
[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...the-default-architecture-from-the-ta.patch | 45 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.10.0.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
new file mode 100644
index 0000000000..ee7d35e34c
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
@@ -0,0 +1,45 @@
+From fd8b3359e9e26a6a81f5f7cb04346c7bf44de279 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Tue, 29 Sep 2026 23:55:32 -0700
+Subject: [PATCH] CMakeLists: take the default architecture from the target CPU
+
+HOST_CPU_STR is the default architecture opkg accepts when no "arch"
+lines are configured. It is set from CMAKE_HOST_SYSTEM_PROCESSOR, which
+is the CPU of the build machine, so a cross-compiled opkg gets the wrong
+default and libopkg differs depending on the machine it was built on.
+
+Use CMAKE_SYSTEM_PROCESSOR, which CMake sets for native builds and the
+toolchain file sets when cross-compiling, and stop with an error if a
+cross build doesn't set it.
+
+Fixes Bugzilla: #15784
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/218]
+
+Suggested-by: Alex Stewart <alex.stewart@emerson.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ CMakeLists.txt | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e6deba8..7da091d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -45,8 +45,11 @@ option(WITH_GPGME "Enable signature checking with gpgme" ON)
+ set(DATADIR "/share" CACHE STRING "datadir")
+ set(SYSCONFDIR "/etc" CACHE STRING "sysconfdir")
+ set(VARDIR "/var" CACHE STRING "vardir")
+-# This was ported from autoconf (it used to be "host_cpu"), but it should be target_cpu: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15784
+-set(HOST_CPU_STR ${CMAKE_HOST_SYSTEM_PROCESSOR} CACHE STRING "Host CPU architecture")
++# Default architecture: the CPU opkg runs on, not the build machine
++if(CMAKE_CROSSCOMPILING AND NOT CMAKE_SYSTEM_PROCESSOR)
++    message(FATAL_ERROR "Cross-compiling requires CMAKE_SYSTEM_PROCESSOR")
++endif()
++set(HOST_CPU_STR "${CMAKE_SYSTEM_PROCESSOR}" CACHE STRING "Default package architecture")
+ 
+ configure_file(config.h.in config.h)
+ configure_file(libopkg.pc.in libopkg.pc @ONLY)
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.10.0.bb b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
index 0631868a30..8563c85780 100644
--- a/meta/recipes-devtools/opkg/opkg_0.10.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0002-config.h.in-add-missing-WITH_SHA256-define.patch \
+           file://0003-CMakeLists-take-the-default-architecture-from-the-ta.patch \
            file://run-ptest \
            "
 
-- 
2.49.0


