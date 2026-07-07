Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1623FC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 21:15:23 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1038.1783458913168077904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 14:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=sFOAcrkv;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=nvyngx1A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667KiJSV240806
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 14:15:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=; b=sFOAcrkvD6EUhUDx
	fp9sKJtkM54xw0S1Tp9HQxJYHD6huMlUtLmG5cDOS2Z1VgrTknD5sFZc4AbOksYB
	eggt5JCitfFNLn5aHBnHHcTbnSTpOsfAdbB43BjhZIlD01YMnt3fGZTtMMotOahR
	AQJpnEpQkcP7tFTtBzjxDYyxrfKuGqUvWzL6/+531yFLMGVXl7YBt1YSrxf9ormy
	/WKxa93PffI13Qm9BnG/9jE7RE3txoq1G4zuxSeGQ/QG/cDccAVcjzWmuYyD4oH9
	kgKiSQw/WL9J0uzQIG+TIXbHrBw/UNZlIg8BVdFHmhpdyCzH9mRtvrvlKm6iNtAp
	viBVDg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4f98rmg38r-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdUqzA2XyMaaRPAFGJqUk1kAWmJNvq5My3CuEYL3eA4EUfC5fAyI49E+RxDEe0VCu4zcKkp7HCkfRdBFtAeRRZgSnumQc5JndjxtZ7dRPCLAEHLBwBMn8MdO8hGO5VZTgcVlcebyaAGNDxHvST/2TH2tLi8xmkcNRVw5x34g7Pu8eoZcKkvUEnI9VLr0azU+bF2HHUblZ9PqOKFcqyeGKr/M/Fakdiuq9l80xnrs2R4g+4NXlSfJPw9HKdbPQJTmzyE0VkbHEsOQgFbelgTlmLii4sLEvfktw3c17JWI4SkqftN/UZChBq5GMNjHEkQ49CeC6iJSKG0OeDt6zdITFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=;
 b=iRCLGsTWFpII/ye9mS32nXjJQ5L8imi/iyS7fJjftrpSyXEheEPBDflMWq4fVYm/cLc4s0pGgkix6CV02FAQGmiGtSM/XfOHHUmCHEhuSVVIT/SICsFOYioLX9+gsgSMPxt58N8wrx2e85BZkvO8XFuRFQRxcBWbwTQSKVXh98X3yU1xG2YNGhnxqBqIg49PJ4ZmjCeNhOgFdQOmeaOLTOKjEn3Qo4dA+BYKDggtG3hOgkJeffLFWwhTOnHPdNtdHyGmlDGCQqQRCBjI6s/RWX0EjH6+wz69Ez1T5dq5E24lxcH8yAV+NZcZ3HXzzwLtMTObFUAYctrd2HybWbDntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8WnHZ2THrBU1OUp64yid8GTRqDyzwEJufA4gW9kyJ4=;
 b=nvyngx1ALMNQSch7nheesovYNHITK6LqBZtr2xHGF+PjJ2w20MmPD8LyRYMB+w8AYgHx3Ce2kw48JtbjNsCLDL5tP/37f4QIpIczP11gCMC45DOY/8laSV+gWH+BH8L5jxIGznn8KlH+2Pr4IyyWSYYrzbzlcv1286j8FMBeUZ4=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by CO6PR17MB4900.namprd17.prod.outlook.com (2603:10b6:5:357::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 21:15:07 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 21:15:07 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [OE-core] [meta][PATCH 1/3] go-vendor.bbclass: Fix test file exclusion and license propagation
Date: Tue,  7 Jul 2026 15:14:54 -0600
Message-ID: <20260707211507.2585072-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783457902.git.john.ripple@keysight.com>
References: <cover.1783457902.git.john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0162.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::13) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|CO6PR17MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f508ce0-75f9-4475-f078-08dedc6cd22b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|55112099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	w3LK+bAB9cRKzW9wE3W+UCk29/uwRLiEmUkFG84WiYalKuhCUcR04isMx11HhRuy+Yh/OwrgpGeFH71JTdJmeYUsZe2glB0jVD5+rwGY97Hyw0L/m1K/K46IbIbanqavUvc0H1+6CNAUNS1r2qYmQlXa6+Iez4AI7IauA//xduhnMPfGU3ojLm7KaUU1UXA1pp92eXA3K9bZ+hIWVcckunDsMUBC4Ok7ZpOHpfK8kqHOhKTUO/W57DzY5tvCBmbZDRSItMkjtaeSkUjt3ijUiO8u6SJ4dwojlN8bowJR1uhG+Jhr/GSd54bj01iHGhBPShTiJedwuQnTsYmtLzR/VchTnicTSMYtQ3cQkTUOpWO4wOv8t+u2BSfQXl6Xnu2I//N2A+zVDdGZDgSKwz1eQMhIw8lITV6EgwNp+gXFqGeTuAjgkz1E5+Gc8kMtx9EueBCk9jws/sa63OzeeAiUs12SPlN0fba3juXf7KLdfsV0POC01HDCAXqOKukO9/L1T0E2WZZm35h60aqYkyD3jks8FUdPRN1Vx+jodjtjeTBPnwxO1Z65W7bh8LEKbzA6Vo09AQs7XFE7+LTboMSTLronJYpmbdvVunO2xLsBPmQWTKzwjjmR88uK4g9CMhgT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(55112099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x0+ig+sE0enQkU1uSZWcxNDK4Hg+uQ4LgJ1JuNvH6O2go5UcNqGp2ddyNcf3?=
 =?us-ascii?Q?X0cfdrPUXICa8X9GTi+3cYz6Aisu8umoCsKTJUlqNLVlPm97W2v9bTrmV+Nm?=
 =?us-ascii?Q?K1nGoxWA+gdvMVgWOi+9eiUx+wpAZ7mrzjupTy7twSLdakO5I+hFzSAr+JNg?=
 =?us-ascii?Q?aQgelQpKOPl9estZvgMHdkNtmG2HOiZzxegf9obQgsuVQJGCBAKeczI2xBx5?=
 =?us-ascii?Q?Am+bQMBBa+oqAHiw2M1Nj59LV2zw+a69FmInBCaZe2BW561tfewbK5UEszMt?=
 =?us-ascii?Q?8rUgRl4HvZB99oc5Kpdna+IEt2mnpa10brs24CuDtNLJR5kdkGQePlybA/oq?=
 =?us-ascii?Q?fPCxrCHBD+BrYcDsI9sXkbRv6gPqtH7d5KuYaTr8OgaSBgTivB9JqxqvAUBr?=
 =?us-ascii?Q?KFck6SISRQ+TSecMvr0SM4l0m/KdRkJEKrnEEru6m0neaQ5VcgMNkWPsqOgZ?=
 =?us-ascii?Q?U6cw0dv3aod32U2L0rE6yqRhJQGWywOWVIQYBtc2i5xcjN7xyJrD4/Yo9cBd?=
 =?us-ascii?Q?fehFFMoztqTr3SYQajvmLtiN6/NkRmmoczsrbsqZUNMTgV2adz5Y5W5rpoD9?=
 =?us-ascii?Q?F9lK9jPvky1Am8CJtNdc7ljUfm31X5BNr9GE6eERahdvRGNQlMueLl4HqAxh?=
 =?us-ascii?Q?EE8Iswu7o0w3Xox/VAUFcaJGY3hKVQUilCsVg4Ck8PVOlwMbLcrEv5xw1iKI?=
 =?us-ascii?Q?WX2GtBlxlnfEiIv+XQZpFuuUeEHAAJS/hbA1NXq2fdg9Dpk63M+TVao2Q9ir?=
 =?us-ascii?Q?M6J+V4Wsr1dHhYGVWSVvyH3elX0GTeEiCT+etWWqRZXTZMcYH1ztqgFlM6v5?=
 =?us-ascii?Q?3YxhrH0r1u/hZDY7AN9eUkbW1JPv/0RrSYeZ3C4797MUCVyUqcNQX4Lq1GSJ?=
 =?us-ascii?Q?LNVrrC2uzgOxYJSfORDFg1Nh7my1JH/Bx1w0+TxCei4wj+/2U3guXc7BT8Pj?=
 =?us-ascii?Q?/+Yp+1P3ZRSLJhxcbzbHERU4FKzebhU5sUQPEnOQC/OazWAbrZ4bRHX1cMEX?=
 =?us-ascii?Q?9ZV5wIQdyybALeakP4xPfepLED00BLjGh8fiiq6ScyVBcECoD6INKphckKut?=
 =?us-ascii?Q?c2W1XlZt4zFVxGtrd46PvYlJYWOeuGB/9qgy8Nf8A6Rk5FaRrRgEuGXr+cYK?=
 =?us-ascii?Q?DWBCMkmQj37s8o4boO89a25NokUIk2YWg0n5OcAGB56wRMdrydndXqCUGf3X?=
 =?us-ascii?Q?eESBUIWfZzEbW7hPlkDKv/yYa23E5nOc9HdpvE3lknou5PPYUhGjRinLcnh+?=
 =?us-ascii?Q?PNvi/522B0ZO0PfXigIjYsQRvSOJeDJ6xr1xyP4xu3zSBx9mJWPnhJu1VgCW?=
 =?us-ascii?Q?bAWOMOXZDo5nq5oMylUc+b9He6CACzgs01lui6doGRMcBxOxNh6FU2PQQpl3?=
 =?us-ascii?Q?9AP1BXKyFJLlpxY9f7gVwgw7YsLYBB4vuFXQ87vq2UzObjZfFshSIjt1ZMEr?=
 =?us-ascii?Q?w7y7NwZIS4VlV0QIp40cZxmGtO6pOUgkvn4Kqz239gkdCukaTzyvd+VcUOwa?=
 =?us-ascii?Q?Bpb3fDKsn7wpCuTxKMIMesJOlPO0cM10Zwq3pxjH+eUvuhC9fmgyrJsZjYyr?=
 =?us-ascii?Q?M/BJn7uXgQs+gr9+HXQtBfDEQ1F7Og90/TT1VUx3hveCnhTHwx2lQkInwJP9?=
 =?us-ascii?Q?tm3cY7GDttI/9yhKIOfcyvRj/0dGPvntTYKPsRnksmnlJc0w7AZS+7YZVy2e?=
 =?us-ascii?Q?gPgOrYEd59ddUrq3QFCgSCgUA/HmiuKCUofRExSWVA7+qKa/3L9bnHkU+iis?=
 =?us-ascii?Q?IYqBg++qtg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	rhtFY9ZfSN9qhgXEK1/inLOK9xBcOJfUWGCCtTntCXbNGAGY9o2g/uhepR18dlRfwPCnLdhJTfYGmUZNOeJ44X0/GDJmCGWuuN6nP83woLv+QVC0qpv1kHWL5TtRkZ3qJqPlrqJ16azlhkEZS6dCsqcAJZ+nzrcwjNyzO3uTLGYdL2emx9wCeYVq78IghT5m8zqc84/5kw5XapUCB/XdatzwAHKn8YSjNfvj13ZPl/xgJGI9V53vrd85zCwgXCOkYjJtrfzn/EmMFlDb7ATicW3mcdE/b0fg7EpicoISUjjBX0xrIYEQrfJjic8Gec+8a3H3RnFNgJ95avpW6cUW3w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fl9kXb43VxmE5EG5ubCeZ+2C54JPbyytc2Kmk8anfM9JLfqz6vlJPzPfxBzHdwV2SerGM3QoDwHJDx5k5VbP+k146eAinLoSy6/jTcZx5b2Z3l2V7EZN/akgZjfUeTdcs0xLelV5SNgFqQPPFWTpPNy7bHTAsKh8ZYC2BbKnznCOrSrYuzgrXlKaBzz8gZj2Ymk8X7dkPulTpYON+b0jErLi/nnolfCMrqdxgtsomKLmL62zdfCosj032nWCXOERKiCSECYDtO7qM5CjcYMJC/aRPSoG7xxHfRp4mjDWrMeyt0EEbFiI6zLSunL8Im5GpP3m9n8YPgs2OyFI6PE4/a5e5QbvGNBWaFz7BfHGeKcmEO1gid8yAtLF4tCqPj9FkCbBe+dC3v5nbf5Pc7xxuvweoOcJx1wufDlDvHdKeak5HIORP+B2iLMD6ZOuc6geFUyOkTH2jXb9JM+63adWfcGdQjTw9U+rVMltee9DPKJEFN9XPnVVm3ARe+oOPDdDkHfYmiLUnqDAj8GoVLtS0r1PuT2uqNafuJQyl3x1PxmHY7s02+9wXzktw3qDv9E/IXQLWreo3Ctcl6U2qdSS4pr34m0p2HTstg3CeuVM69YYQgYeaioFAFE5AOWkGkbf
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f508ce0-75f9-4475-f078-08dedc6cd22b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:15:07.6093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59uBKDaqWbcu9jKimRuCSiZRNozbxrCxlvdWFfSU+Rt5Zxf8TQzxQWb7Tlf3kIEhneQ5Q6PKfYOCI0BAHARVvxpsQ6eEFaTRJHiwsHnt93w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR17MB4900
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwOCBTYWx0ZWRfXztzNK1LPEJbl
 tfcmGYkTwHzxrfmh/iLzfz1V19pMgevdVu9LD1DA2IPydQ0yYPz1H+h9NjHikVNGRbd0AqT+Y3Z
 5a0LLfPFusy5TFupVD6Ii/9Pdd4E3EP+9+iAW3IID5lwr0banp6P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwOCBTYWx0ZWRfX874KV+1JKbBN
 o4g/DIFgb4+MJCFZSO4FilzZIPRLNkpDc6G2jwhnV1yHOLNDih7gyxbtr2lzaFP0PaIABUazPVN
 BUoUmjaI4hlgaerX0ys7y5Z303LQWXAqhGcxIRzvLm3qnjtY4vV6CKAbwruIUBhhOzNL8juSZnI
 ZhrnoToLPXfoUPKzb+Q23pgUdY2z4nx70xksbx8P+gp2xNa0F9Jyo3nzTiy4ebmfh+Jv8zWDyhD
 snXQSjuRXKgXxTlyHsrHYeRwHWrWcEDTfp6ZaZVWyOqrfhabd/8VY7ovrSU0u8bIg/5SHBK8HGB
 I1uKIkjI5Dxib+UQ/FT6/1Eqg3rCJl8vb40VaoYM+SVHCYh9A+Lv9V7t/K++BngGLPh/M+0C4Lg
 SBouf+Q3Yv9SXVdD7qqdz1erhlL/XV2aLnA54F/SWwmqoxgkyhuXHfEf11Y5+vATZfnZF/S+T4n
 fhzv2ggjcJ/k/oX2rzg==
X-Proofpoint-GUID: 2lETViq-By_z5u15dXSiNWFxDrdfDps5
X-Proofpoint-ORIG-GUID: 2lETViq-By_z5u15dXSiNWFxDrdfDps5
X-Authority-Analysis: v=2.4 cv=HuFG3UTS c=1 sm=1 tr=0 ts=6a4d6c60 cx=c_pps
 a=pvbKGUK/Si0pumwNLfsG/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=mOSSRekXLlsqcmK058qe:22
 a=plf8rDjJAAAA:8 a=F6MVbVVLAAAA:8 a=CKkP6PFZCmJgk5SHP5AA:9
 a=JWTSs7K9Rhv-lrTctFka:22 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11840
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 21:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240408

Two bugs in do_go_vendor:

1. The shutil.ignore_patterns glob was "*._test.go" (with an extra dot),
   which never matches standard Go test files (*_test.go). Remove the
   extra dot.

2. The license-propagation block used os.path.join(src, "LICENSE") as the
   copy destination, writing into the already-processed vendor.fetch source
   tree rather than into the vendor destination directory.  Switch to
   os.path.join(dst, "LICENSE") so the LICENSE lands in vendor/ where go
   tools and licence scanners expect it.  Also fix the guard condition from
   not os.path.exists(subdir) (checking an unrelated relative name) to
   not os.path.exists(subdirLicense) (checking the actual target).

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index e879d629a8..85a3c1b586 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -141,7 +141,7 @@ python do_go_vendor() {
         shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True, \
             ignore=shutil.ignore_patterns(".git", \
                                             "vendor", \
-                                            "*._test.go"))
+                                            "*_test.go"))
 
         # If the root directory has a LICENSE file but not the subdir
         # we copy the root license to the sub module since the license
@@ -149,9 +149,9 @@ python do_go_vendor() {
         # see https://go.dev/ref/mod#vcs-license
         if subdir:
             rootdirLicese = os.path.join(rootdir, "LICENSE")
-            subdirLicense = os.path.join(src, "LICENSE")
+            subdirLicense = os.path.join(dst, "LICENSE")
 
-            if not os.path.exists(subdir) and \
+            if not os.path.exists(subdirLicense) and \
                 os.path.exists(rootdirLicese):
                 shutil.copy2(rootdirLicese, subdirLicense)
 

