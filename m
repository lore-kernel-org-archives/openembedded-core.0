Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66288106ACCB
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25678.1773331895622554764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SIvFwR+z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312e9bb6=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9XEm9008800
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0HFTEbwehpt9Lya4f6P1BTi2RI/IKRw+JqirqKGKASE=; b=
	SIvFwR+zweVX4LS0JjczduNtN5ScbMhGEL7zcN+QeemniD0NiAc6Qk/pj480sO92
	sUIPYGdTTFh23YyCSsKvofUYprIxGtJPvXV1D5AjLeD+yCkeHoMsbrAk2NLiuDSl
	1Bj+PpgXXbUaFtfzZMfhi5kjXSI+3VllNo3MgJ+EbfpnzGbtmu/Q7HylSbHtc0IX
	jMrIcCMROxgLby9/+hqUINRgFrTJLKU+6dMFCP7GEzyyYmp3r2XSMXaCaeOn0cPL
	1K+laKXp28pOW6i0wmRtY0egx5uXvm4ym9D2CVRpDueI/8VgirREG8g6+Mf0MnpD
	IjEl0J6gRo4JNiSs7pXxew==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqrewn-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiAXn7AbJJDOt2miI03TuvHdAgO3GOGCWQ8pdEY67+DGoqDz+1IgbUEJ4sNqgKhPtDVQ7jqQsRKrsNtqS6o6mhz10s6mrjg5m7XksLBwHwFPORLuP+7WzVvUeLhKpsj4BoEpuEb5i8eGr6jIdO4CJvlfoGxGX5IAo8e06yiWVEwAGM0aezGp7ry4LvIC9XDlyJLPjrinibmXy1G6RR4oCjh2wTUQToATML+Ad3k3zwy6Lb57OTO/UA6Rn4gB04z0vbvRCbeIZpYZpoJbmkUFnVskeTLZSpRk86HRIyFsEX1F/LoXZk3YcTccnDX2n7FhixXyDN7/I1Kt7RWZkPGkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HFTEbwehpt9Lya4f6P1BTi2RI/IKRw+JqirqKGKASE=;
 b=Jx87LLfOlrbE+YwVzVcqjnHQrxHtECz4vhFQMsQ7R1TZr52CyAgQ9XAan6PQQkdCakKQfvcASsPwQdAFJ3qf3NtONwmHsh/DGNps8JRQLdBKlg1RnC1kv0W0kVqj0P9KMPv+yAhmUDc7QIkvAjpWFx0QlNNHA5OaSwbCzXrIAh6/cHKkDBmbWJX/cL7LVnYfPldCeqr2civr9G0q2pJXFl5b9Cuy2zR1cTuvGikcNLzq7s5owKU8gnOmcpgnUh+ZWd8olVhr7RkLJy59KyONO/pXw8c2bDX03rfd1tgLBD8tCyBkuT7U9QBYkmAdhxi694AsgdF1Ws267TtK5Dy7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 16:11:32 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 16:11:32 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 7/8] glib-2.0: fix gdatetime ptest failure with glibc 2.43
Date: Thu, 12 Mar 2026 09:10:22 -0700
Message-ID: <20260312161038.2578649-7-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
References: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: DS7PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:8:2b::19) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 54cdf090-1a4e-46b7-7a80-08de80520322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	IM6BhOjU5uotbv9GjalMgdnDujAJwHVt2Sy3cpXyAkzmQri8xpVyqMlZnN5aYGLpTVMDdNjt3YFnJZLxIkaif9RgaLRy+pNgYUZv3vHpiH9WsCbbEDGj74G2nMOv3M/lBjzOmy00u2MlJGgNV+1/9hrLc2emNghjcA+35WbuS4rai3LM2M4t58cTSqyWep2m92fZ4EwbfEv4nUGKM8joKupqRGn0uqWIxa6Lb5x439/+3JWQHRTyPbBzQqXSBxa0Q9U0gK/6p9L2MUbrAHO+Sm15sta7mAQ+7AQ/0WQEkVdTl+XuoMbsBxFlUjecu6UQH7y/iOEln3j8B4beHBsMmtUzPsGE+gUgHRWHSAKXYYXU9i1QIrWZl9kHZPhousReH0Axwuot27g1XwFtGaREzuqdQdgJv/kW9okjYv4MepBxCzy2q0rBiKksqL7+CpbAHFv15wEV85uZc9pqhp7a6B711nXWARLQM0wD/aZpY0giPBL8oV4oBT0j/4nFfvUrN9BppVtMOuiz1F18fEpf11xwVY2XA6fyaYIXSMO3Y7F7wUE1YfvAtHxveZXojSOcH/rQSC8CE3l/nDI9qbviJUI96mmfqVCuvOc7SyLO/o+3v8ZxXA/T6TKhKzcj0sIaQt06745OXRL5Vtmk88qYgPh5TipCzNYJaI+6HC6S3t7H5cerPjxRKvI6jcUdIpIPxhiKAO3qApAc3BQfIx61rsup2tiUBaoRpbyvCnwkuR/jn28peT9S/Ii2QvXR3Sf1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZTJVSjFIdVpzNDRZdUJVZjkzWStLTzUwR3dNY3lnTTdVaVV4UGZmdUNGNFdl?=
 =?utf-8?B?ZTRmc2xEOE1zZk00Y2VoQWcxc0ltNTNXY0xHdEg2WGlXdDF4NWVJbi9hcTFQ?=
 =?utf-8?B?RU9seW4rakVFeUUrTWVKSGZVUUVHNzNhNGsraERmYUJ4YkNFbGNYK0tjY000?=
 =?utf-8?B?ZnpNT3BnWWVHc21wNlNQbTBGbUxLc2FSc1hScG1OSlh1NzdRSkdtaE9tNkxB?=
 =?utf-8?B?TnZ2eHNMWU13dE1Jalo2ajluMnR4Q0xtUjdiQ2NSV0lneG9wMkFrREwvbWxy?=
 =?utf-8?B?aUdmQmlkMDAyU0Y0YU1zbmRsVmJBdDlpa2VzYkQ0dy9oeVBOYkpjZG5lV0VE?=
 =?utf-8?B?bndwZTJtN1JUcGI1TUZBZmw4SGt5eUdnRGlrNzFMQkNVQWorUWpnK29FQVJO?=
 =?utf-8?B?cW1pTTk1d3JKc1JLVENDdWdKbHoyVVVWYk1kRlpMUkJPUm1vV25DTjZMaHNm?=
 =?utf-8?B?alF0OUROdEthTTdUazcvYlJ5WE5ueWtGWXZMaUJaYU5NNWY0T0Z0RlYxbGJC?=
 =?utf-8?B?Nm5MTVVkT1N3UUk5cGhBdGEvNkRSdVFEN1NrMCszL1pUQmRiY01WMEVpVXR6?=
 =?utf-8?B?OW8xckQyZU9WTnFwKzBzZVJtaDhzTlRrWEdldnMwaXRZZlRTM2l0MjJzNUlt?=
 =?utf-8?B?bXQzQW5xdGRWT0VOeTlZT3pQOGFSTTI3TWhzNzdPdWl5OFpiODZIc05BTmQ3?=
 =?utf-8?B?aGMwa2xoVzZ5TTZuVE5KZXJhbEJzMGhQZXhjaWxEajdyQ2VGYnFXK0dibjhU?=
 =?utf-8?B?T0I2N0p3Y0pndDRJYmZFVUk4L3paejNJL3YrQ05SQ0I2cWZiQjF6YTNqTDZl?=
 =?utf-8?B?SnBJYm41QTJmVHE3eHdVSC9vS0tPZllKeHVXbGEzbGJQK0l5bnNXQTRFUGpM?=
 =?utf-8?B?bkZJZmJLdElIbDhpbk5CUTVhcHB6L3hBZ1dSeVAyYjZkU1hrVkJud2IxQTlF?=
 =?utf-8?B?bDl4aFU3VjJ2WUFhZEtEQVY1dVBqNXJhU1NHQlV6WDdzNHluWWorR1lBMDN3?=
 =?utf-8?B?Nmp5VG0ybmRBNTdPNU1icHlFU01pMVhIN1NWb3JOMCtneEl3SzRZWlpXTTZl?=
 =?utf-8?B?Slhrd2JjVkR4d3JFK0k4NWEvb2Y2OU5mcGg5bEVPc1NHdk9IRUJpNkZ5OW9k?=
 =?utf-8?B?cDZwdGpFdkZZYzFBZXdldTRKQituQXBpRERtT09xUVFpNHVDUm04NWZlZTlJ?=
 =?utf-8?B?eURkWHhheVJLeTBnb0VWVWp4UnV0ZzRTMVpmcUlPc1RCV2R2Wm93ZlBNUHdo?=
 =?utf-8?B?R1Z3N2hiVUZ5L3p6QWljY3cvb2pCd0trSUhVRWxISERWWG44SWVhS0syaGhK?=
 =?utf-8?B?LzJXM05LU0t1T0N4OU9XQ2wvTWovbW43ZUtESEFzOXlXSTFPcVFMd243S3Ri?=
 =?utf-8?B?cElTSms5WmpGZlBscGZXRUsvWWJSdHZEbkJERTcrSzZqRXBxeWdkT3lpaHdx?=
 =?utf-8?B?b2RkZ3FFYzc4cUtyc2tNRVg5Smt0c3l2RFc2eFM3bWZ4c3lmZ0FlYUJDOHdm?=
 =?utf-8?B?RGc2MTcySkFFYTJYdTZWdTBPVnByMjVaMk1tQVR2Ty9OSmxOaVRNd0YwMXdQ?=
 =?utf-8?B?dmMvdVZZdEhOc2FDU1FJbkxYYmFuMTZSUlN3d28vV1d4OFNweC9XM1ZXNXFQ?=
 =?utf-8?B?ZXFURTdYY2xSNzEzYnA4SE9XY0VERTJDSVVyK294VTRrZjVHeHE2L25DbDl3?=
 =?utf-8?B?bjhVNnpRbzNJMy90bnJqRHpTYUxSZ0J2RWV3N2tDNVEvUFZaZ0oxdVlQem9i?=
 =?utf-8?B?T3dlQ1hNd2pGTVdMdGhwcElLMGR0SWsrR24rdFJnRmZSejlLZDFCOURYeXRZ?=
 =?utf-8?B?T1N1ZEx0U25iRVlEM2FVNjFTR2VGMFBETDBZcmRVTFpNamk1cTZzcThGVVFQ?=
 =?utf-8?B?Y3RFcjZheVZHR09aUm82aGJQQmZKTUk3d2RJdEpKazc1OGIwakR3elhuNGRC?=
 =?utf-8?B?ZndQdGQrYWxrSlB6WmJkNlgvQ3J5dUFVVUJzbnVHeHk2eWZoeWJqQWtPRjF6?=
 =?utf-8?B?YXpraFR1MWQ4cXduNEFMU20yL2E3RUk3WkFJMVZ6V3pCT3k1bE9vbmdEeEhI?=
 =?utf-8?B?cXlZa0FRQmR6OTVPSkVncWhWWlFLVEZxSUFHZzZDVzN3V1h3YVlBeXUwRnho?=
 =?utf-8?B?eGVLcG5UZml3c05Qcko5M0ZTcGdpTy9SbHYrYk9jdG1XVW1QUXIraE8xdzlx?=
 =?utf-8?B?cmxaTmtxenExeFFUcUpka01CSWJ2UVhhek93Tm5jQ0VHaitBOFp5ZVg0ODFR?=
 =?utf-8?B?Z3hkRXpVd3BEaWlVdXdIbTkyUmdPMmlGTnpuQWZBNllZOTJkM2R2UU1uYlZk?=
 =?utf-8?B?a3ZPRjkyK05nVjVwM1lMT2VXSEVJMXFZNVhTMHVNYjQxMmo2V3lIQ1g3NVov?=
 =?utf-8?Q?Vfz89wPM5hLxO7NQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	uUIXqkNmY11b+8f2xTboNXlwtEPdTt5WaPAoZvIg9kYgJZ6lq4CQtL+KBAIoTFF7S0ODSF24Pf4UJe5Z3Q5xdLqNH8JLyvl43newAWABdLXALEiA16UCbPqibZWJy0Asgz6gSLb1kd4WMZ3JjO3u9TsYOppbsOpMANVQmt72k4RULh6qmuMEDfXsS2b5Z4MONl14mTP9kUpq3K0UUrgui5m5Eie4NUQndAOw/P1H7SVbVWLlieyqmfkSXuLOE/ePRnInFUF2o7jiy8jrrcz0b+W05+JgipMhTN1RHrY7FgEr/Gwci0/nlcyTf9mgdOWbnJjr+0kp1B0v5OtwjkRXeg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cdf090-1a4e-46b7-7a80-08de80520322
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:11:26.7992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnKthJg1oQVFs9UmFZJLgOmEHhuczdlHCVSSy9Au2yODR0a8zODxeSNxjNU6q1TalTkOm6z0b4C4c1ucB2FEygsRF1PtMiTxte23zGwBy28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-Proofpoint-ORIG-GUID: vE5KcVwghnigAocRxAFtnU2n5e7TJ81u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfX2hkHqxIXysuR
 WxoVUMaF1nvSPV+XiG/as5fWHor9LbOx9/lsXWsOA80v/lZDxoAc7rNwWuyCIWvigsP2CHP6583
 JX0tFLVekk+EyJtnYBg0zo63g1WCb0Cwt/XcQA9HKwxiGHzJVrWUgWP/F1zUTQCyyMIe4da04P2
 5aHKCYurfToHw4bPDnj6xXxFHg0gnNC6X3ZJ1bqaji+4x8bLm8IT0ZTXNBUGhBK1FWfExvnW8zs
 Zm5FsEgA7tiR+Qfl3OkqahX6JvUPNLmsDfspwV8oBC1/mQnKnU8+mFyJxIYJvQgiX8QAs4nezQM
 4HBY66sONwM1YG9hqhFCvdjNH78/iiPYMtyfbp7UHdGwG8MgJfzGeTwX9420Vj1MdbkMFbA2MDd
 cW5OAqSxrs991WExC60iiiqM28CfwJddFKWqqyQ0Ra1547aCIiJ69YULOzUttu7/Mvt68fFCYh8
 Sz7X9+uWCLBPPdR6S4g==
X-Proofpoint-GUID: vE5KcVwghnigAocRxAFtnU2n5e7TJ81u
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2e5b6 cx=c_pps
 a=Z1Yvi+W4mc/VVWckEa0YUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=GHR8O2WEAAAA:20 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=aiIX5UjjAAAA:8
 a=nPgS6P5Hp-ZAswZympYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62C9XEm9008800
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232993

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

glib/gdatetime.test ptest was failing after glibc 2.43 upgrade.
Backport upstream fix from glib commit 7c837a52.

Upstream: https://gitlab.gnome.org/GNOME/glib/-/issues/3895

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...tetime-ptest-failure-with-glibc-2.43.patch | 78 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-glib-2.0-fix-gd=
atetime-ptest-failure-with-glibc-2.43.patch

diff --git a/meta/recipes-core/glib-2.0/files/0001-glib-2.0-fix-gdatetime=
-ptest-failure-with-glibc-2.43.patch b/meta/recipes-core/glib-2.0/files/0=
001-glib-2.0-fix-gdatetime-ptest-failure-with-glibc-2.43.patch
new file mode 100644
index 0000000000..f023e687f4
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-glib-2.0-fix-gdatetime-ptest-=
failure-with-glibc-2.43.patch
@@ -0,0 +1,78 @@
+From 7c837a520f51db74e482bc8196ed5ff40e432307 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Mon, 23 Feb 2026 12:30:08 +0000
+Subject: [PATCH] gdatetime: Fix comparison against cached LC_TIME value
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The string pointer returned by `setlocale (LC_TIME, NULL)` may change if
+other code calls `setlocale()` again. But because internally glibc
+implements it using `strdup()`, the pointer value itself may actually
+stay the same even if the string contents change.
+
+This started happening more commonly in glibc 2.43, due to an internal
+`malloc()` change which happened to trigger this latent bug.
+
+In the situations where this happened, it resulted in an outdated cached
+era value being used.
+
+Fix it by taking a copy of the `LC_TIME` string. Unfortunately this
+means a reachable (=E2=80=98leaked=E2=80=99) static string allocation at=
 the end of the
+process=E2=80=99 life, but tooling should ignore that if we mark it with
+`g_ignore_leak()`.
+
+Debugged by Sam James, Wilco and Douglas R. Reno. See also
+https://sourceware.org/bugzilla/show_bug.cgi?id=3D33899#c6.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
7c837a520f51db74e482bc8196ed5ff40e432307]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+Signed-off-by: Hemanth Kumar M D <hemanth.kumar.m.d@windriver.com>
+---
+ glib/gdatetime.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gdatetime.c b/glib/gdatetime.c
+index c4d7445432..8d67354cf2 100644
+--- a/glib/gdatetime.c
++++ b/glib/gdatetime.c
+@@ -65,6 +65,7 @@
+ #include <langinfo.h>
+ #endif
+=20
++#include "glib-private.h"
+ #include "gatomic.h"
+ #include "gcharset.h"
+ #include "gcharsetprivate.h"
+@@ -2981,14 +2982,14 @@ date_time_lookup_era (GDateTime *datetime,
+ {
+   static GMutex era_mutex;
+   static GPtrArray *static_era_description =3D NULL;  /* (mutex era_mut=
ex) (element-type GEraDescriptionSegment) */
+-  static const char *static_era_description_locale =3D NULL;  /* (mutex=
 era_mutex) */
++  static char *static_era_description_locale =3D NULL;  /* (mutex era_m=
utex) (owned) */
+   const char *current_lc_time =3D setlocale (LC_TIME, NULL);
+   GPtrArray *local_era_description;  /* (element-type GEraDescriptionSe=
gment) */
+   GEraDate datetime_date;
+=20
+   g_mutex_lock (&era_mutex);
+=20
+-  if (static_era_description_locale !=3D current_lc_time)
++  if (g_strcmp0 (static_era_description_locale, current_lc_time) !=3D 0=
)
+     {
+       const char *era_description_str;
+       size_t era_description_str_len;
+@@ -3061,7 +3062,9 @@ date_time_lookup_era (GDateTime *datetime,
+=20
+       g_free (tmp);
+=20
+-      static_era_description_locale =3D current_lc_time;
++      g_free (static_era_description_locale);
++      static_era_description_locale =3D g_strdup (current_lc_time);
++      g_ignore_leak (static_era_description_locale);
+     }
+=20
+   if (static_era_description =3D=3D NULL)
+--=20
+GitLab
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index d1f25ef8f2..ea3ab519dd 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -232,6 +232,7 @@ SRC_URI +=3D "\
            file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://skip-timeout.patch \
            file://CVE-2026-0988.patch \
+           file://0001-glib-2.0-fix-gdatetime-ptest-failure-with-glibc-2=
.43.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
--=20
2.49.0


