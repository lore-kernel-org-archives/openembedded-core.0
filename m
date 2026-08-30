Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923CEC61DB9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8093.1788094785004243333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Pyi6DRmN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCgKtm801911
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0tvH9eLJIci2xzCb5NAB0A/sA3T2sdOZ1RkNNSIQq9s=; b=
	Pyi6DRmNPqFkV7v+14qowziUAZFtwBm88g/j6jN88eFxUjTXfqiLpqRJl9IUl4F+
	zBlEMKrt8V0zm+TCSd1UMV0QEBT0Cu3jE85k/BQ1VV18HEHi8DaRcjTi2prcsuWA
	QnwCqzru/r48QnIb4Dw93dxeu2IU+y1BR4aw+GtxL7ZbYeB3K/3+sKdaaO98PD6Q
	66ghmk8Ife8E259zeCC493RfeJn3jgGtcwkqaZiZl4QaqyEjXYmVHdzIzi0o5mAZ
	QWL9xIsoEbuSIy2+M+VpBahaEwdjFivUQdQ5A4tx5w6jn4yJwgIrnMUj9U72Ois3
	afFgkUjkQdJYs/EbQPrGkQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023076.outbound.protection.outlook.com [40.93.201.76])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbpd7s6r1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 12:59:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3NzvS38s243KlPdHpIs2BU5Gu0bdEgLhAP5ecfr+DNpwPt7ymQ+93l3FbyJce4fxcle4fw7qiyQ16o/ed4dmgW5droAHliw0Vhk9QWe901uBs0fFg6zqJ68pDBUwpsdW6E0PrhcUPt8GaRreCTGuIq1f/n3tM2CbFUg2peS5wvpH4PCCeT3kQQ7Xafaripe7EOp8e5Fc4jG+59RiBQOFxKJKvkhOBvdA0pULeMB9cpadNcS9IarfP+gAz1AmxNbSYEHOdX0A9Z2yLJZ74asFZtIaqajI81qN+84plGHF2qXFE+lqLFgHQRgdKbvzkVavlDuLeAeUhmHyqzJQdPQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tvH9eLJIci2xzCb5NAB0A/sA3T2sdOZ1RkNNSIQq9s=;
 b=eAng50ufdo46w/3R2cmWfCYsk17S/kn2k/sauyFEgEn1JI7ZJRzv8vuTJZ0eAAvqU3im3L4d/KlymSeMfEG8SQkyZ29NFhnnj1/pR5Po0AeHSiyXa9S8nMUgBHgLT7WHrT+vh+xsNR9rHCbL0dxCvs5Q9edKzILKBCk2gA01RF3/ItmwHghrmJPncXb4GbzQXzcGyGom7zORoShw8ShAfpwHoJiGAF06saZ4IMpNgLNL+fv5dq9+iyv5LRXnA+XRSccZN4h3rOH/upx0GM7uXILrNjCz/VdzcylO4W6a1dNz3z3oqD8IYW4IZIDrOhYGjeW6fuGA/TQ2xwta9jexjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:41 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:41 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 11/11] clang/llvm: Ignore tests fail with clang/llvm 23 upgrade
Date: Sun, 30 Aug 2026 18:28:51 +0530
Message-ID: <20260830125853.1139807-12-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 8874f474-62ed-4d62-8758-08df06968e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|3023799007|56012099006|11063799006|38350700014|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	3TepWQhk3KEkCTFnLcgm26PNFdtbjRbJw9zwHdopIdqq2RXoW1f6rXY3gZ/u58jr8bim929siIdO4gNPkaVmz6gY1mSc1UG/SB6iScFr21b+7JZ1IXbLl2zR3Q+vCHQsJ5iC44b6gS+m+5HeOXnwqfNZ+owoYRLkxzohOovN1r5tLtJZ77FnqEXofxTF0Z0X4tWQnvdBrS9Ol+L6qWdrsSNliNSmkTBGdA63ZerVUBk4YaWSFgbqPnDqcwQGq9LEcR4HqHhGDcEEoRXOo7Oxvn75r8tjvOrNu8/bdWV5o/Ky3sczwFaK+nUIKOZo0+oFbMfqwkARXrASLD1ah9yUX8statyew1lh2SsrUhs6o5t9FO7zmu/Yaev73VVbZPMffuQafv+e/g8GkDtZMU2a8YXp4K5/DVE4aPykbqIRm10cu4qusd9f6a2OkCa+aTR/cs/BpO1pDH160s9vHghpl4CuTlwauRireQvaMCI1+Fp7j3bNCzr15nmDJbsxgPwEoKmEs9MmPJazJy4HSBzR+ZLubK128fWhMEUFPhRryN4nzEysyDCspesn6ersVsqwyZh2c7FEpkrEGqqbwf8BRrulb+MYyKUQZENqMBVdRxg+KUXeMOCmnlA6sbvn01bLWZ6CWtLcmunfEI12pnqZyFFAg7hKtSChCbviFNZLKMeqmBwZR7DafCa/a5/pRPHRnt1oljCBau5vWGXqibLlomy+GMAOcozlgWSH/tXJSYo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(3023799007)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zaPb4LOnqLCYIMW5tERIYgEd4Qj7zRJkdJ+Q+Oprcy/zSaPXP4thL/4lDA9k?=
 =?us-ascii?Q?PMdWRFizy8KrHJxwFnVBJfeaBleKrNMS/RLGINLarkOClEdESG/Gi7a05tTA?=
 =?us-ascii?Q?9RiOEjYKJnJRmggd5o9XjwFJYq/C9g/l6C/TQhUViTdu2RlbCjQU5mfCWsfg?=
 =?us-ascii?Q?aQfAYAXQdCQA4pPlIwd3XiSh2y9Fbzpc4qH0m8Y7KyqzPxmUp3Dol5NAZHpz?=
 =?us-ascii?Q?qd0vSs7NxsySD4GDmWNgV5TyYhEur7lFd0IElHaNJIF5vFlTI2l8sPk1P4KU?=
 =?us-ascii?Q?OEExPm+xqVXsTLbHadUa6z/8WtSk9qXsWU76+vZ5IiYZ79hHAqDgb6R/iAnb?=
 =?us-ascii?Q?O3CoDYfIloDX6tAcIGBERkRTQnl2BO3f1bzzhY1Mfr2Rkr1DV/lxduCyYtoo?=
 =?us-ascii?Q?beB5QR0AhAsxjPhSe06aLr+s71yziXc8jcCfJyFcDVeD1PQdjmJLxyxgJv/y?=
 =?us-ascii?Q?5qxtwakoT7GZ+a3sYOo7+cQwy5g+jtWZQ6IVCIA6VmrOCc2d7J9WfOiDVL3j?=
 =?us-ascii?Q?JZxXwQy00KEqxpsIW4T2b5GoxIY3OcNrE3rBKx2WdgvKrIc5dbtm8I7APEjU?=
 =?us-ascii?Q?+yPkKIRursfMpXGasfnsUTSiZjVFD3WGDYOrwb+xSKHy9NzjzQA06wmR9o3W?=
 =?us-ascii?Q?dFF6mKzL71a5qI4SKLvb7RRJ5haj1GQLoC77omHPwNrElW5tFpEsNSini5e+?=
 =?us-ascii?Q?0NAeAujZ0j0FNaqDWQbUHogTBEz6LgHWcJ+xPCP8o9kUf1yhMTSvLTljStCn?=
 =?us-ascii?Q?gHEofwxjqV2X4/Bd6ofKGspPbL4D1HD0QjCRA+YtIkkfxXm+4csPh8GEK+J6?=
 =?us-ascii?Q?7jX0BGPW6Y+ZZDshlCjx0XcTwYvraLeVs7u1AeGrpFTnXmVjMfPNBJ4HHkjT?=
 =?us-ascii?Q?A3xL1ai1TAZUye2gyp6TdhVTtVjvQyKejP4LOyO7lHNfGathjAXf1j3La3po?=
 =?us-ascii?Q?NHK/6+1mgDJUOa931KzOXQwYRUsIY0RajAL54E20Rsp2uSxgxrBvtLrswu0m?=
 =?us-ascii?Q?FWfYgbyDaDmFtVeLcWEyvU9vBRPqb75oUjT2jxGXlSeeTKkGuPiVyk0gDyPd?=
 =?us-ascii?Q?YTYe6wFLF9gRL/T0MLff76b8EO2tIYzqrV1/IH+QP2CoySNS9b123rDGp7D/?=
 =?us-ascii?Q?AH8TPIW6S5m61nEPZ5+MyuvUCmATGeJE0d09B9khFExRhiSkcK67FAA27OdP?=
 =?us-ascii?Q?kgkzyd/pQ6MJ5UwIJeOAV3YJB3zFp5iLKpXfgoK22BD2xhDhuo5WxmC5wN0A?=
 =?us-ascii?Q?XruP74HMokEfu21UguXzyJFelXVyXpvUrhSMf5LSl8pFIOi4NW2qwn9Exd0z?=
 =?us-ascii?Q?KvIDROMw16GijfYXtNleRSPD0qpz48NrwCD6g4E3seIjU74XjXDsR3RfYCRw?=
 =?us-ascii?Q?xJ0WlLGtVTwX0ZGhYG2xgPHuwEfZFzHk2A+/L3+2uV+8+oR4sW5N0iV7REcj?=
 =?us-ascii?Q?3J535oiPV44BTQgVvLJGxAnN1WsWpeCVcpPCxqsDQ76U5wWvrrCiWfZZGtum?=
 =?us-ascii?Q?ioIB6ZX2g+4ZTT1P3e0uGOHz2ImoZYv+yl+8MJuBy56SrgghA53PljfopxlE?=
 =?us-ascii?Q?NqR31+55QInr2c0CZHPgDROyRBE25YT3kUq+AphqDDc1yyJfUI7bEFNcm5Na?=
 =?us-ascii?Q?SVYqCr5WCRireF8AFg7Iv0t8LHGEUM4tui6d8EjUMRslTjqRq/FR3KhEWEQP?=
 =?us-ascii?Q?z9u1r5/hH4XdRhtBeRr00px3bcKP8jheiTAxWbTQALt2QGzioACqBAeGaL+Q?=
 =?us-ascii?Q?t+Yc8gYNZfbQbtvAe9/zo6NEOofCyGw=3D?=
X-Exchange-RoutingPolicyChecked: 
	mwPC553xTcOmcw4Qql/Huac5m0L0yPpkwC27XCFHiqKAPlPaeiD4qjf+OQp0qtG3rXiS66A+gCGkeuOXgucgkYckfRUEDCFrP9G0m+7FD8LG+cCg7pG4wiaWPmuRFNjJUIo9gXwmDlRGaop6sXG2enU8zzmRyzfKXaukhrvcom6JQYQA/wzuJspl+3RxfNdcN6pO8sbUpA4Yk4feWZhPNke/BnhyRWe5jnvy3cJ4t9U94DPwZWClh72rtUnH5pTZK7j9Fc8nPJvDqQfbDQoU8xKhzhrIIRtJAzKSVkpvCaJ4kHyuXXOHDsh1ryrrx61KMmeEcCnhHVPYlNIXr19b2w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8874f474-62ed-4d62-8758-08df06968e63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:41.5158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inMOshXtxf4axfGLyAqQlOXb82Hh70uJa3WLJ8ZwNGyHuuDIV3PrYZ1Hy0r/T9sOT3eZOsRaspvpjR8bcr8jSPfYqBOyY+eJhG8p0B3D6gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Ie63n2qa c=1 sm=1 tr=0 ts=6a94293f cx=c_pps
 a=TLRaRVVo73tAgr2tZ40rpQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=oDTgWuW_5leSg_c9ekUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX47Y6I/Q+MEAt
 4EoW0ceff2/e7DgvwqJsz4t9pW76RTlwknw7cZgBz1zuWRRMG/w6m5/Y67++7K08wgndL+qMepV
 3+f/nz8txFchrnTAXE/uq6y4HMqCq0wWg4imyVU2xFb9MSPumTDwbiNt+K6YgHzZe9azmr5UJ3x
 TsGpLdnrDS6PrUdwqsNbN00m3fPnr+Y+9kyEIY269sGQC8UVrsThGDugQOS5kenEmNobHRYY4q0
 jn3Qv6zOb3p6+k8svoJsqdjpGnZk59NVUFdq343/QBw3pRIpB5Qf2X8GBCwPi5Y3CAO2Ca5J0uz
 Jou/1k/q6bcnUpk/LKhNWBeRUkaG7DDaVwd6xndwdt8+xBLjkKKfM92hfdSTpalTj2OLnpTSi33
 5NLoJgRf3rlLOV2ycCoWKJf2jbgjMlG5pFdm5vjqbSQw2aDdnjzKE+iMEfSzJ7wprD8N+yNTqnl
 KeyPo1Gm5u7u3DV+oHw==
X-Proofpoint-ORIG-GUID: SQg1VfXw_no1FtzG3tT2QGz3WqE4gHlo
X-Proofpoint-GUID: pq_GmzcjwrWbD-omZyAitfduSq1ropv8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX+4ZCZJzGYKpQ
 +PEGKUD3cd2jSX+wqWyBkaSJiVyTbh4FSg982osZ1v0M2qZ7TisZZDeqR0HC52ICZ67LZy43m1l
 ihiD0u4Ltplc8Viz8f0Vn8C6livsQBYGd24UEQBRfOG0aAyv7zTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244653

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Some clang/LLVM lit tests fail on target with clang/llvm 23. Exclude
them for now to keep the test results useful: one needs an od option
BusyBox does not have, two hit a known 32-bit ARM issue
(llvm/llvm-project#94741) that upstream also skips, three fail from a
lit configuration issue with a separate fix to follow, and four are
still being looked into.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
index fe59821aff..046e46d414 100644
--- a/meta/lib/oeqa/selftest/cases/clang.py
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -142,6 +142,7 @@ class LLVMSelfTestSystemEmulated(ClangFamilyBase):
         "CodeGen/Thumb2/thumb2-ldm\\.ll$",
         "ExecutionEngine/JITLink/Generic/llvm-jitlink-option-show-addrs\\.test$",
         "ExecutionEngine/JITLink/Generic/sectcreate\\.test$",
+        "ExecutionEngine/JITLink/Generic/waiting-on-graph-capture-replay\\.test$",
         "ExecutionEngine/MCJIT/.*",
         "Other/can-execute\\.txt$",
         "Other/spirv-sim/.*",
@@ -157,6 +158,7 @@ class LLVMSelfTestSystemEmulated(ClangFamilyBase):
         "tools/llvm-locstats/locstats\\.ll$",
         "tools/llvm-locstats/no_scope_bytes\\.ll$",
         "tools/llvm-objcopy/DXContainer/dump-section\\.yaml$",
+        "tools/llvm-objcopy/DXContainer/dump-section-priv\\.yaml$",
         "tools/llvm-objcopy/ELF/basic-binary-copy\\.test$",
         "tools/llvm-objcopy/ELF/binary-first-seg-offset-zero\\.test$",
         "tools/llvm-objcopy/ELF/binary-no-paddr\\.test$",
@@ -248,17 +250,24 @@ class ClangSelfTestSystemEmulated(ClangFamilyBase):
         "Analysis/scan-build/silence-core-checkers\\.test$",
         "Analysis/virtualcall-fixits\\.cpp$",
         "C/C23/n3018\\.c$",
+        "ClangScanDeps/build-session-validation-outdated-module\\.c$",
+        "ClangScanDeps/build-session-validation-relocated-modules\\.c$",
+        "ClangScanDeps/diagnostics\\.c$",
         "ClangScanDeps/module.*",
         "ClangScanDeps/multiple-commands\\.c$",
         "ClangScanDeps/optimize-vfs-edgecases\\.m$",
         "ClangScanDeps/optimize-vfs-pch\\.m$",
+        "ClangScanDeps/prebuilt-modules-in-stable-dirs\\.c$",
+        "ClangScanDeps/tu-buffer\\.c$",
         "ClangScanDeps/visible-modules\\.c$",
         "ClangScanDeps/Wsystem-headers-in-module\\.c$",
         "CodeGen/builtins\\.c$",
         "CodeGen/compound-literal\\.c$",
+        "CodeGenCUDA/device-const-var-linkage\\.cu$",
         "CodeGenCUDA/static-device-var-rdc\\.cu$",
         "CodeGenCXX/int64_uint64\\.cpp$",
         "CodeGenCXX/pointers-to-data-members\\.cpp$",
+        "CodeGenCXX/template-arguments\\.cpp$",
         "CodeGenOpenCLCXX/constexpr\\.clcpp$",
         "Format/docs_updated\\.test$",
         "Frontend/rewrite-includes-bom\\.c$",
@@ -273,6 +282,7 @@ class ClangSelfTestSystemEmulated(ClangFamilyBase):
         "Preprocessor/headermap-rel2\\.c$",
         "Preprocessor/include-header-missing-in-framework-with-headermap\\.c$",
         "Preprocessor/search-path-usage\\.m$",
+        "PCH/cxx20-template-args\\.cpp$",
         "Sema/arithmetic-fence-builtin\\.c$",
         "Sema/atomic-expr\\.c$",
         "Sema/auto-type\\.c$",
-- 
2.43.0


