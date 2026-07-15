Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A12C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:20:37 +0000 (UTC)
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com [205.220.173.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8121.1784128831683851507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=kG+7VEmm;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=mvzVn4YU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.173.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F7NxLC3544546
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 08:20:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppfeb2020; bh=LkAf7HwhU39XqOGBoZHnCt
	MyPmC2wLJKBZBEkMhyjOE=; b=kG+7VEmmSR7Our2Ci06dJCHUCoyzWh1tOKHQ6y
	1m4KYZ5iPHU8aT9JX4xXlhlFMyXCwGTRot6wcHIFiMuk0Kt2X/lh24ro16zDLtAI
	5xEYsnoPZV1l7feMYG/e0n1Ekh3Cns6dIpJb/0hzpQhneKYmeG6CJbaosKAwr2Fi
	tgDEqIMIdPIFE+FPLTRRV2dUVmFe5t0qi1ppTcx43fUPz9UDuJfbERm5/lIGlR+G
	vrsrWlTt9r7WsownYMHmHqqgyGYiEE2I2kUmYP+NXbOjjjPPptd2mET1Nv1El9ir
	f77JOr71IgCd3WjQ4XgpwcvnZyVJkGOLLxOlt2xYZqwVDPKQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4fdr9qkj34-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 08:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mautvh7efifP+BNbsOkbpRzfTlKLKSwWvvHsH2tiUalX0JQb8XMnP808q8s0OpuKdkTuoT+rl7l1jr6QP4drGmoqZ/DZPOHTG6EX04cpQ+N69O8FYnRjjjjWIGiTrdd8ZVHW5f3vOnjZvS+mAT4Tn/G7YltWTf0ga1KbIBvhjQqeh6T7NLwNtCGg6xNe8zKwR5pzTO8JmgTZ7LGjJKnepGm7WpPLaoGHDLhEMhJghSwvBoeq6tadCi22WPNIwCcufnMruhnFqycj0PMj1tChjayoYVsb/hp7ZPxCDfEh6Df1DUVAOKqvfVyQsHK4Vp/xVe9blFDbI8wgD/Ul/PVbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkAf7HwhU39XqOGBoZHnCtMyPmC2wLJKBZBEkMhyjOE=;
 b=cerDMAe+DZOm1jQ6XlYU4tW7PC+OawGAXlaRde+SuYikDjPMQCzgQszrwcBUNy+jgJJM0P4kN4McX21z0c6aJGNN1H0pHGloiLYBIKd5sHSxGo5OQm45WZd5D88Tr/zhQuqt111sG1mh67ktQ2We+JeWZrhPQhD/Qrk59PP65V2akle6zLfUu7V22bCSfB5lvMUwfgUU9k+K2IUQCSql9HpmHvHXWule02eOdC0r1BHqQ7Q7oC9a6nrtCpk9rm0lsv7T3PYqd8ItJFrtYHv4OBib1PTauaa/eI05Uh5kvB+bXrOlX9gnk65sLalDwCiqF1Ao8WbNSayuqZ0BPqa22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkAf7HwhU39XqOGBoZHnCtMyPmC2wLJKBZBEkMhyjOE=;
 b=mvzVn4YUE6rdQHfSpW4tGaAXgOunqYREqchGwc6hUIlrFEKsoLtbqys+MBfc1HgQ4G5oKFLGxIx7Z5+radRkBVMBgUYLT1bqjiyMFDICd3oThghTeaxG4CWilTg+b6iAN2QT9P8h01ECOj2j3DPjeQNR/wkH1AukQAy68UPBMwU=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by PH7PR17MB6739.namprd17.prod.outlook.com (2603:10b6:510:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 15:20:23 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 15:20:23 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [PATCH v2 0/3] Create selftest suite for go-vendor.bbclass 
Date: Wed, 15 Jul 2026 09:20:06 -0600
Message-ID: <20260715152011.3542412-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0077.namprd22.prod.outlook.com
 (2603:10b6:930:80::29) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|PH7PR17MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 351890ad-623d-41dd-0b6a-08dee284975c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|10067099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	s19iA0KjO/LogKNE2lMvYjY67GrJCby7vQuXDWvI/111DDjwzlp86U1aQZWC7YlVi/m7cuXPGqy27BZ9MpNpF8MbOIU+JXIMRPR83/asgRXALub+HDixU8JDfwOfOD0jkNojsBD9QJr5gXmxTCUDUDtRjiFqWNNPHwRR0cCLClcfC4AA1noL/10szWy6AtUs0BvZN10I2ntgrXVTRag/mkArYQfwF4l3zrwJMSq0RcCeSHVcadeAS3YPD6KK3H/6IQmAmKVx8jFzM4+dUD8sOwlOlF2vzUgkrBr+VUH/dELr0VxRC7p8zunwktvLVjjfrRczBt34I05EKu3aIRjsqrjEXr2caCRyiS09Hu2nM/GRmdwY19EGzBvDZzNeigfVlRZ2735kYSgCxmw4WKoaT3xz1Wrg6XX9+gcG9bFmWWRPSd9fkLhIpx2DT9B64IvHVce7d/B6aaZRx5j1MDlL/QFgDTQ+IrxRXu/5JrDKMne95v885OjVm+qcHU8J4z6TY7b63gf8Rh7R8o7WMmy2JbISs+Z3+s/Db0/Insl7HGKbjeKZ/9ZJeehabdizuVBXgxfZpk07ySUAnFra6hjBKp5ilSlhhqZhwlclmwMEyEzpmEQpIP1im+QL2/49ER+DkF7zZ2g3mJEPpjbAlFzZjtLuBy44m9CMglrbpAnokDY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hxMTfkjr4jwP58d6DlDqgWYbVzNk3lCBqqQFb9Q7zWDBbrzdIBk/4aOtavEm?=
 =?us-ascii?Q?jCuw0WEoF5JKVQgFnZxcSex/Ky9m9KptmzhGuaunwPxjHPl/jxF7saycfC93?=
 =?us-ascii?Q?XKYgii7uTVVQ5pfyo9X0fMvFAnHDmBP8d8e0a1gPI/itXtyPbd0kriUFq9HG?=
 =?us-ascii?Q?JEUxtciPXFfwpqvbXVjopTndmqnpcKKgQ64FetdPLOJJkmMBtzojyK6GoHFq?=
 =?us-ascii?Q?zo5z5HOa3p88Xy/b+HkmpG4PdLlXI2e9WOEhi85N7FtT/IkZu78w3Ed6m9fX?=
 =?us-ascii?Q?C4LWomqLtONTiys8DTqaVCYKppPAfi9Z1qKY1KhZFz2IKaDGzH8pCaOxUCjs?=
 =?us-ascii?Q?rDKxRnmYu6OdSRTDD972Z0MgKng9v+s/efEoDwOoBOQMwqglfDXs+rf0WItC?=
 =?us-ascii?Q?WJathHW9jZE0EZmO+IEf90sBQhGK3i6CvIwFqVQBcOwDfX7r19FxeSOIVuwm?=
 =?us-ascii?Q?Z2Eqm4StnY27n0r/g9/wZgbMZsUtd1L8O7X5Bc7Ds+tFOOG8PxnP0ilotmsT?=
 =?us-ascii?Q?g7BjspyQvpYRNpYV+/U0PCEFxmEuaMRPHBmSAZ9ywKi5ZH82OlWy11Y7Mi9S?=
 =?us-ascii?Q?r1AyDwk47Ye89RYwNLm/dmxK0+xTnjRHhLh0cWffCDz2q9d1Tdcb/0T83lNG?=
 =?us-ascii?Q?SEc4/Hha/UGwOZFdYLfvq3e7Q4AdA90PI3Fy6Kr6iJECrHcDqgZZunwpToeB?=
 =?us-ascii?Q?hktl7UuaGy1Hj9JK4nUIxYMYJbN6RrxaVsMHYMX6gnr4KnBtAP9M4KTEuMVm?=
 =?us-ascii?Q?HnuV5AMtKRxO21XibIxc4Vt2QmZq/oMAzWFGmEKXLQKQyS2LoS/3r8nfyQSv?=
 =?us-ascii?Q?YiZFzlfzPDqCSLW72JNr9KQgn1B7Q0UNmzu1MXWBHP2rmHJdN5isXVlGRuBW?=
 =?us-ascii?Q?aNvA88wMSC5/2Di4VREXzCKMh/FEvcWP+sgbkzVv63YYduCci0N1qjDYQw8P?=
 =?us-ascii?Q?iOFKZUeiB0olewGbwLgn+pOc2CTSShmiQvZ98XNXrt75JSIf+lr1Cd88Mgum?=
 =?us-ascii?Q?4tTl4QN/5/gtqqMTaFzvi76p21o0dfmB+G8JZBVJSyJ2KkKt8XkCD9TNmheJ?=
 =?us-ascii?Q?Fl+VJhMsw7dRx4IYeRO+KDMO3Q+41Q6UuluiLqlkqxMy2ea4frfntLLDWu1w?=
 =?us-ascii?Q?5v87TUyLFmWfzZyCo4V3ZYuRm33QFonPIYI8377R2+ONmyt+xYwvOFsyIfz3?=
 =?us-ascii?Q?vxwzihD3OzXILqZKxmQZbo5gnfqafK5S7wpDmgPXuGEP2L4VfYxe8GJhJnH+?=
 =?us-ascii?Q?FGm4qVCgqUCvQAx9gSBgbLisK1DcCSO6LlRq3/4/LUgS95sLdZP0Oj2PL4KT?=
 =?us-ascii?Q?ezJBdXZPS9YaLor3jIHUErPYBTIeuLryE3TvHnl1G8yruYw7Y6HDTgbIzDFj?=
 =?us-ascii?Q?d9yD5tzh2RXDGNgUjH3BxQ9K1H4DuO3iCxjEd7gcccfm45tpSVPVnma3kcWK?=
 =?us-ascii?Q?YPUbJgwUxJkqwdx9/7omwd2iWBjqtM+uFInztspvRxkWqPF6yuBOl+sXID1s?=
 =?us-ascii?Q?JHMuDWaeUW5JWrv7JYD1pxlND7rR42JLKqNLU2qQWd0X9716GIbvvh9+pNvn?=
 =?us-ascii?Q?xPCYsnG9DC6YRkjIdPDM5wnAjlu9u9tjx84KnhpodcTUHMPb0SwyIms8UXoX?=
 =?us-ascii?Q?99qPy21jmlGFdLAC6c2LSfj8TmluCn+Tbz5G19zE79Hzwc0qkjC4nQvA8SF9?=
 =?us-ascii?Q?7XYaPveUn/sASeK4E7cZwcitTeSdD9TKaOmz8CHdOLdZ0/rUe5mmymE2P/cK?=
 =?us-ascii?Q?urxaEplvIA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	VhBx6nGCd/n12cdLAJeeQKvwmZtg+Io7eJgcAOq0fT1wMKrZZ4f+NYA0QdSHwLxae3oglBDgYgNrU1gzYVkSC4cm+LrLOmYd46oeyLSEWzDJx4XwFK49BPD142tSaxSv8FVQJR6jvPf5hw/NaU2UpFgpCQpW8ePZZZRjMi+BC9OylRmxQ//QweUIztZUb38UxT6vXp1sEdOVfqlkubCIW7r/pifvxdDZQIw4rkk8DTFCtMnr6ZDgfJPPsvHCxTmJmm4zQimKB7tG5Z3Iv/ugNzjB6N5i8fgsr3n7J1ilMYOy32JVFT6pu+o2CsuPZPWz6OR26keNaE+341P7qkrBIA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	oXwvZ06/NTHX/aWssvp2DU0xQTe41CqxCZr3wgmsy/jv6iZQPF/YyUsLwpJ81aVCp+86pvfili38AjBIcxW1Tlk6q+nNS7Lz2shP4/biAacVO7xHNs8Cu/ItBjZ71oe2hAJgc5DzXkVJKpqMOZHo94JgB6BdEs4koAx6WCgVH/cHTaxBKDN6rGqh72FJLlMJ4tUvk8JpIHzh7GPOAlJEV06Wih9OHSTnSAgUkCViWofslDoK6EQtv3GAMu3tKwLIo5gS/y9ZeztkGswV4121NOIu2epAV5o61SiePwrzwVcZhUmyuaIqb5SgZ6RfziVWZGsFZO2EW++hh1Eubc2GXLAMlgNuhO6eHCQAL8bimGtR774PG0Ks2YWMKHDAbN+bFheYTk3xO+x8Vy9jE6Xs2KgAadQPb/SWP8FFEn/PlHX9AqDCEOTUiQKzydpugWcwlaJmSlAFS51/cxYpaA/X+Etdzs/VcPGJAE+NGBxN00s1gORUwBOAxzykTys8WDYlVIRGyNsJK5K1FZMZUDHw+xeAvDH3lwmdx7ECWvbY9FrGcWXTTUbM+PyhRplmugA1nUFtRziwBYxy0A0ClusWyzjMfnY6Yx5dDXcu4T4Dc2QwAfPLJN9967N/JK9Gg0iZ
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351890ad-623d-41dd-0b6a-08dee284975c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:20:23.8551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXGV7zsgv8xZSev/yT82R1kkuNMd0kd77xVxXQiYm9oIJIDQr5kiQF8bmgdulCS2q7+Zt/EixSXNVsohksr7WMq0SrqYWkEqgdn9hBaJXKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR17MB6739
X-Proofpoint-GUID: L2po3eaIrKP6o1YvfhBOyGJIvOcvxELa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE1MiBTYWx0ZWRfXwgmrbZ4MLPpo
 iUmBPESdTwKUoihENk/iRqSxbAoGM6TvIXTVnrqG55uELpUBk3MVdIQlDf5DG5D152B3bGC5A6Z
 JSRk0etUAsBQXYNdrr7N4ycelUb8rIg8+OYkgkZkVuiV0vg7mem6
X-Proofpoint-ORIG-GUID: L2po3eaIrKP6o1YvfhBOyGJIvOcvxELa
X-Authority-Analysis: v=2.4 cv=H7rrBeYi c=1 sm=1 tr=0 ts=6a57a53e cx=c_pps
 a=CgODY3tvNtn0KPtxrBvszw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=ylRlBDd5bHdllK8znExr:22
 a=qq2s7GKWbMUuupIONFYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE1MiBTYWx0ZWRfX3tEgD+4JI4Kr
 C+k8UdyJ/VXEbiNyI1J46Fsl6IMHZLA8EJs1IINabQcJ0O7YkTsAdm5F6E5mwdm/Nd8CDMnHL8E
 Cz5w2Sp56XkU95g5vZmeqPdn77vDMs6NxeenNJc1T27HkGmejh+SAmfiJitJcu1Tlocb2wlBIdS
 lydL9KyThCP8b+vYloaNVaBJXmgnXtJINx7Q3hXCWQrmOffZJ7p64hmiVTt4iAwb/uURzsYCCQw
 lvbj4mHSfdgduPIc7g2iribL5b8nj9+tk300lfW+agHle4+p3GO5xx+6pTjlGRw+1Fpq4l5P8YR
 L0Y/aA06eUFHPw1I+r8xj5y1g3P3wPNR/YNapZLFhGuZbE++CcRKGNe/0n3OiCLhY29ZxSxqVIl
 G1ztTTqLmBS3zufokZsP9BK89AzN9Q/PY37VidY/d8j4d6QteRzaY729Mwb9MI6u3btW00pQATF
 meKHWYUJZzkLUWk08Mg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11847
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240977

This patch series adds a selftest suit for the go-vendor.bbclass and
fixes a couple of bugs in the go-vendor.bbclass.

John Ripple (3):
  go-vendor.bbclass: Fix test file exclusion and license propagation
  oeqa/selftest: Add go-vendor.bbclass selftest suite
  go-vendor.bbclass: Run vendor_unlink task under fakeroot

 .../recipes-test/govendor/files/modules.txt   |   6 +
 .../govendor/go-vendor-src-uri_1.0.bb         |  13 ++
 .../govendor/govendor-real-test_1.0.bb        |  20 +++
 meta/classes/go-vendor.bbclass                |   9 +-
 meta/lib/oeqa/selftest/cases/govendor.py      | 169 ++++++++++++++++++
 5 files changed, 213 insertions(+), 4 deletions(-)
 create mode 100644 meta-selftest/recipes-test/govendor/files/modules.txt
 create mode 100644 meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
 create mode 100644 meta-selftest/recipes-test/govendor/govendor-real-test_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/govendor.py


