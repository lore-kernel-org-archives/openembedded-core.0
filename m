Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7132FC4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:08:53 +0000 (UTC)
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com [205.220.173.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9026.1784750922950841215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=IkkCtZ0J;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=VLpRRqeL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.173.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187215.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MCwSK23633346
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:08:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppfeb2020; bh=7TllgMiCebCmq1gPuFayXY
	oXS4U4vgjznI65noT+xao=; b=IkkCtZ0J+zRANW7g9+vw6Fnge89c2+i7Mi27aJ
	qfwNhd+eHf4QDjbCm2N1q6UeibxOr4RjcEN7NQEheM0wAsxSa5EbadpE8QSjOTpw
	zN2WMBjOF/RktNCK3+0Yz3AAnckIa4TXnadQcdFevkfnWELaBd9aXy5ou2DLOPIy
	CO3H/odOBAXTr2LZ9xsnMgatgMmJ6KdFAxroiu/uG+q2SBNcqtGrDEe/MKvrNW8n
	xNXNkR5iSwSnY4SIeYv7ysnJhdcgZr37RFk07ek6aoAjS+/x3bscgZ5G8NXBCm0P
	P0GTVLU9gGiVKcPC6gxX2MpKSLaSK72NOdS+XjFayZihZ04w==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011019.outbound.protection.outlook.com [52.101.57.19])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4fjv7ahwds-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUZVg4nDTTEoW1dJJrtQcNd+e7AJTsWGBBWMLZ0U9Ia58UvKhU7TXADf8zSyeJwy4tftbev0/QReSHRxPkovKmtd2IQha6C1EolrxumjjrijOGjFqxQsGYBA/6ka98AP+Cy17Mntf8PjkxkB1vqHRCujhwDCRt0IRLnskS2qJwkJ5NG/q2F2kQKtSWUs7Vrad5qyEYX1Iwiq6BRWiXc5eiO5NZxpTytYMNl+/rzyb0yHiT5Wvr0zuKeH6uLbhwBErRjO2+2b4MCmDQrb3t8FPXeG1tlq803KsPRG7LqBABaz8S3dU9NCi50avVXy5ck9dtqOfs6sccqZC/W0UzjU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TllgMiCebCmq1gPuFayXYoXS4U4vgjznI65noT+xao=;
 b=T8TQBIPJ22YA/bfhIp7el3cwX4p0yz1IfDkApYCpELvO9MydHLXDJPbZ/MeDYKUgTVPfR/TLnLg3mSkN6Oz8JTdLxhK3R1SjKbwhHb3UfvaHLJrC0YMJSIqvqHBiW1/T+Nc/11Vtb8QjVzXhfj81UZnVyARV0M9CNLOnaO1QbftJ8ygD1o6YLuWHudCXDtvC6hc1qFDqh7jKaNti3d/vGnDR1Ztx91iaTc2LsIxeU4nKFnkXCfBPiZ2QlENtg7R5AioNdSace3rtUcNc1F5M6XizoSSsuDeHiO16k6jlzyZ/xLR8CqF5PPCZS4dEucaXJL67WIr9L4qabTJMBaGkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TllgMiCebCmq1gPuFayXYoXS4U4vgjznI65noT+xao=;
 b=VLpRRqeLsSvqNt9mydEZDKoUdS7mpZDjPR7BC97rsU9UGS2/YYzy6unpJfToIWF/hJrlDbSEKulE4oDf6PRiRh5SvFA6lH0vrb0vHfr//7NnsySFGdV3Hth+JBhK5dZcShvuT1Zwyc/4imPUSQkOWJt1O0LE0bxt/j0QTDeBaNs=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by DS0PR17MB6981.namprd17.prod.outlook.com (2603:10b6:8:162::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 20:08:38 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 20:08:38 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [PATCH v4 0/3] Create selftest suite for go-vendor.bbclass 
Date: Wed, 22 Jul 2026 14:08:26 -0600
Message-ID: <20260722200830.2917254-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0224.namprd15.prod.outlook.com
 (2603:10b6:930:88::19) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|DS0PR17MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 208f2995-ca88-495f-3a1e-08dee82d04a5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|55112099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Tt4Ax4bRfef0UlbJrkfSUKsedJkBqIDdpbUiFrIDkN3jPqDOjuXn/YBIkcHISFuJpHsu5Ziyf87IRBQSnYXWz+iSrS+Gtzhq13P9B+PP1TVRq6xuirHy7X6EUAzOxsYLf3D/RCCHZGQxf2hKiE7vDOt/m+Aras4a7KZ82BWc3Ym44d/R03mEgl5W/GC+aS3FTpKykdYviSO/fxj5JvCbIbeKjsOF/24PsuuyLwGwpPGoQpn3qGxyD0cOjjwELChfbc5IWALchkBiF2DjyjZ2SH9YUsH/5qQGQp7btznbVGDXLXRYiQBd0SAoXJyOwOOWNY/2yctSbeiSgWNvPcXgBV84F2kGg6pEuBcVlyWyiANvKKXensXaG+H2oee6O+J+s8McZMClfpHBpznVBYWHYA1e9iF8RGWOzC97DRhZt037hxdXzOX9Y7v5PNrS1J90XXTGOSs85cRhkDbZXKnVsUWC4okxHDdqtYhiwIDU84poJ3oCRpSH8A4C9QUEdu6HlQWhpKvVczI8qIFILuK+Ry0kTot+H9oKrl8pdj7zCXL9/HKwd579kIA0+gjZTSe9+lc798J4r8XiIRpVFK1I6XjsXYrahNC7VkWKFOwGXw/UrTWub+FHjT9RFmhMVVt8bVumZ9/85MaSyjcYJEtx54J254L10NJqrOoTd5yMeEI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(55112099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ETL3s3aNIBwMTBs0SVEt0h38p2sTs+j72+ayBtdP3J7Go4Tfe5ADl81lQrfS?=
 =?us-ascii?Q?daxiz3wKLjuzS1UGi1MJihcOgkvXGa8kNAYyqz1wjnfQmO1eeE2bwKydbbAC?=
 =?us-ascii?Q?odb3RVipWkc0VJFg4xgSzGX/wS9v8+aBgdXj/w8t814Z8NFl+K/P3jzrCEAk?=
 =?us-ascii?Q?S4MC9CXRse7iFcvzC3UroiQX2dvp1w5g0CPyhcoyV5aFWK7T6wciLwwYqFtV?=
 =?us-ascii?Q?cPhGAzS0qJyaTDiE3lHvNkyTKLlzuTMga8c/h+KPuc8Ooa6s44h4mlB6s0QZ?=
 =?us-ascii?Q?s0EPuOXS39HDYO6hzxGPY6wg/ABi9+7W4f0vTeYVOKRfDzvy7uiPwyuYFYt9?=
 =?us-ascii?Q?PTxTSrBLnFWTbjpZ2cYsqfOv0jtLZT/m/0e4o032L8quJBa46Bd0aKc66Rov?=
 =?us-ascii?Q?4BcUOkmiL1pFeWfQ96qb7E8x5DRVnOmn52EH86r7zD5aOzv8qPTCnJcz94Fk?=
 =?us-ascii?Q?TpVXtRMukD1/1OqqDge1AowgxQZ4Ku0l04ciG87Re6AX8M6Gg4t8z3vnSzrZ?=
 =?us-ascii?Q?W8kWbni6eqT06r++NwRolpJ8/Ghn97GFqkJDMdfysGBZ43B0/8mRAOmybUtL?=
 =?us-ascii?Q?8YGP/alVYnhmrMvYuG+BppY2jZG3/hUYECMlf+xZtFSup5Hs2DNuSP7lTKAx?=
 =?us-ascii?Q?k3znXwonDKBa1fN7ebriWHfStf7LzPZlolyMvPt8JrguSwcD5G1dkcXbtsx+?=
 =?us-ascii?Q?8ezYrmsq6pH/4iytgNPsE/SKgxKPE6EEpnDCKvSUApwi3KnLNMaDtyVHk0On?=
 =?us-ascii?Q?C0WMjUUq57p6wa9gu1df0wPuQ7MgcEfU4r/y/6vYMZUYnWbR9gUArxeSoXYA?=
 =?us-ascii?Q?dyvLwJzeqRo+7cYL3mD/AaVGgsTXV7p4TPfkRHOmLM1qNLJ86wy4zEeRxNmU?=
 =?us-ascii?Q?NWsCUImHprn6WgfgDxwjqd68HYpohR/m+KkiOz2sBpm+cmGHVKOFoyP9aYJw?=
 =?us-ascii?Q?DL4oAV6KV97RiyNqUUq6SROeB0jHe22xliRKqCqWpCP72WKsTaL3nJTksn1f?=
 =?us-ascii?Q?SUwwjQQuFyO5oHjAUXclLfN4VzVx076kKb4e3N35/u162Cb2RTJGcH5D9w66?=
 =?us-ascii?Q?95V8qz7Ek29jPY6APm1doaTqchNUmWxIMGVnk3CxuqeeNU3l+FnGDIYaOK0H?=
 =?us-ascii?Q?k28149xau/Oei3+W/FL3pWEJ5uf/VkXbNJ8WFfiDlhiIaaYgPgmGqSsTXL/b?=
 =?us-ascii?Q?KJ3kyGSYl6NISKu8nybPDAxd2hjBfxxtWkBuW9moQFHC9nbN+ecOV/HIRkw6?=
 =?us-ascii?Q?fWjnmBc4NXTw5hiqK/dHcdyEbLSEjWH6cVd3lyXVIDG1DfuFylgOSPDni1cO?=
 =?us-ascii?Q?bfqDLw4HhGpB85HVStHaQfPPYam+9/b2x7mdd7j1aF7jv4tMSVJemVhZG8//?=
 =?us-ascii?Q?uk1SUTjEyT2lkWbD7UHsm31WxD+tATyW6HixY/6ydqE2d8TKngNc0YNcSGxi?=
 =?us-ascii?Q?mlkGXyLMQ+OGv9EzxiS1FLkEzVQcNFGkqPcsIFnf0kf1FxE/uBQjLUYdB6g5?=
 =?us-ascii?Q?8kbgpl/s9wC6FTNg3hfw/9oZZlcaI+hliOY/Enc8V2nvbUzHm09uceu867KC?=
 =?us-ascii?Q?S411//wdZ/D7UN7F8UH2zCodCtFUgEuflVgqC0dZ05jZDvxluUGPWSwuDVjC?=
 =?us-ascii?Q?bG7l+BR0+M2NCf5iyRKbCZwjAsouJNMYVFtDNluM4rNrQ9FJcyQUYeIKt88r?=
 =?us-ascii?Q?cE5E9lWWwsmZCgjcRbRzz0JMrS4DN5njuIvuQY1vpcEIIPODh7BRED/WPlWl?=
 =?us-ascii?Q?WHP1gHzjpQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	ILOZpLDATAkoK8c45uMV8OvdeAovQ0tpPRRsEfRsKmjjs1Rud2/tjFE/ZetxlvXa2ujP89o2b57KGw9/KQcD1yDcH/6kRpHrwPpdhjoZUM5AeVM+bW7kbmDAn6PcaemIvVjktm8xC/x3wX1rPiUToCEKsf3wi7nMp6cdweOiB4QN2IwJqLj3af8MDpKo4C0msFZ7gG8jqy7Nq5wS9hkOzB3Br1DuS80BS9jw3sMAT5IwpYHRep3hwZCACH8OSuA74rB4zfFgOuYgyTvpuxNnx93lkf9Lq7xMtfgpJX8m5ad3okTtc4qoWLv7pOyO+71SAnckwL2lZwnem62nvTSIDw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	K9cO6SjEmQ0MEsW43xRB9kBmOAU3MZ0VdXdU+Mz9b4F1Lgx+iPGbMUX52UoMdavOSGfZ5cmbrD0EETdmFJw4kI2VVR6dNWPYz+kQQGeW8/8Wzqqw8z61/jYR0g1OciO7x9hSYly7kV54djBVyaB6kYw7bBdRxA0DK1HRH4duoSEEm+f1505HTONxDEUYmxtYfoUXZXawbK3O847L0WaUHKMR1q8osvh3eibE5Pv/9ylhdPgIBg111rf4C8gg5zAwCswGqwb95x1Lu/mxLqUweNTeplvsn/B+II/7YG3zdxJrF59kXd833R68aHeHjA4QPywJQk0j7o1uDOr4cE+hMpLHhAKB5Zy9mrFxcCdpeOTBn7UGHlPFtpSHl1+jn0GHVkEgDT9ltLDPpZiUBpahVEt69c6l41g6BuFJhajFXhqh9803F7zd+2ueRCCYIWPitX5KSVp6+c3ZSdazKveYNab3NvHnkdBRgkEe0HcLydVIR4OwfYKubMFrqzzV8ebN+SXLJTFW0aOhk1mEoZvgVGgqxqLPYFZBOCPST2llcYfLZMBWNtUxi/4u/NRE0E/ZUKxs76SqqXYSHz5WugW7CFyd2AVrjZQCYHXCWRpj1itj6GDv+Lmm8e6hmuUFY9BP
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208f2995-ca88-495f-3a1e-08dee82d04a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 20:08:38.5630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zracsUOJ1W5HQcP9MTCPtyN2ALbsrlvCskjKq97aRddWGlZ7baEjSwY7+HfgpsZ4xopBys+uhwct241or6ZvvH6XIdtOEjs3JnoqTMnwhxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR17MB6981
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfX4cSh+ewWKj+y
 UZFgtK78+Qkh1HE0lTEoHCcQTUFcJeom7hOdBuNw+lGkDMXKEBr4budD/7FFLK6ZvHUr0wOxjgI
 Eo0Gj3lbfxLnN7Jh69BevbkduYmGctFfqlhPOh9FHVXCnyds2ovcziSemiec+fz61rJ45T7HZV1
 0xDSYwSdcnAPCPOQEMdsLSHzRmLCRI+26Qsu102JROZh+hbynL9dGNKoGsLXSfopt2SoEic4GT7
 9K2iFbVXLUXNC7KqwPs3v/J4b2ut13o5mraqLsjqrR3RsUWQFpKU/oWDqGDoA6j1FIrg2Nbw3fr
 9wMarSBMrnoyHrARuubZ5BKoGoM6Q9bK+k2g5pkMg5kiOPz++vqm8Q05VkpHJ2LPzTuxk19WHwo
 swhNLM65PKJKFp0TB86BtNvHsyqPx3TzLMBl3j7VoUYF9rUCcy8BoyDth5/CJHmXq1norQbcBEy
 18emMSn7ZOvE/LsBYfQ==
X-Proofpoint-GUID: Y4dT7gGcxCmsLP7MQSAlVOmghRWimI6s
X-Authority-Analysis: v=2.4 cv=L4QtheT8 c=1 sm=1 tr=0 ts=6a612349 cx=c_pps
 a=C4vld1iEI+sMWzcozXu8ug==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=Q6H1dDa11V4-0TjPv-Wb:22
 a=fYFQMlVL88K2E7uCSmAA:9
X-Proofpoint-ORIG-GUID: Y4dT7gGcxCmsLP7MQSAlVOmghRWimI6s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfX8gEarbo1FNQh
 x3ZBA2a9XMEL/cjc2hR/AwNBl0wBS05GhYr0QOYTe+3QbntwILLNIex2g93WnDqGAq/FSvRJ0bo
 MzOGeGTOYACyE3hGbgDdkt9joUA5y3kOQZUPGy113pdZqeRL7yOA
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11854
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241741

This patch series adds a selftest suit for the go-vendor.bbclass and
fixes a couple of bugs in the go-vendor.bbclass.

v1: Initial patch series
v2: 
 - Remove patch that requires no git history for a layer.
 - Create go vendor recipes in meta-selftest instead of creating a dummy layer.
 - Use fakeroot for the do_vendor_unlink task.
v3: 
 - Exclude go vendor test recipes from the world build.
v4:
 - Use common MIT license for the go-vendor-src-uri recipe.

John Ripple (3):
  go-vendor.bbclass: Fix test file exclusion and license propagation
  oeqa/selftest: Add go-vendor.bbclass selftest suite
  go-vendor.bbclass: Run vendor_unlink task under fakeroot

 .../recipes-test/govendor/files/modules.txt   |   7 +
 .../govendor/go-vendor-src-uri_1.0.bb         |  18 ++
 .../govendor/govendor-real-test_1.0.bb        |  29 +++
 meta/classes/go-vendor.bbclass                |   9 +-
 meta/lib/oeqa/selftest/cases/govendor.py      | 179 ++++++++++++++++++
 5 files changed, 238 insertions(+), 4 deletions(-)
 create mode 100644 meta-selftest/recipes-test/govendor/files/modules.txt
 create mode 100644 meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
 create mode 100644 meta-selftest/recipes-test/govendor/govendor-real-test_1.0.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/govendor.py


