Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50E4E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:37:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20999.1734014251480634363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=207616a842=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6brXS002193
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:37:31 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx1u5p98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=An+Fw8Zt/USh51kcOig5ym2EgLNFzkLr/OhUu6ld/ugQvhkRli14eIu8dqJANFW+sIAzv7jWXbeZe2IUtwFdXIJ0wOXO927VdZRF81TvMHw84Dbt50YHiMAOV25JJwCHx9I0oILbb7L5n3Jz6OLQ2vbElb9J30aACrZisPSt0vvToHmDuNWtOjypKrX1a1vCYm68ksnhrlqZTClrNmsA94b19byKMu1HcNJLihS6lo054UqkhXnwy9GyYgdQ7nvm7yyEV7a9YxdI9CAXvGkLTT+ucVMl2VfRh5PEkUrDcLj64Q09PNfqDmo1bV22lCnyJkekhSR+2DO0f/hYBKRqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEwgcrmBO/PC1PpXR9C6r9Bb5X5NH3ISE1xm5Q0ERoM=;
 b=QgDkhFcvXRi3EqbaCKJSYolqXfhyQU8kt54Q49NX+kmLJwHduiFheoLAbJfBOdRowF4Qeap9tk7H2TOy+HC0uSvNvTYD8IwBdWmqMHM8ntbdWTf3U7/GDZAd3xcMr6poX7308FxVW4fUjRHb0Jjdi0YmaJ8tPvbXCr8X+Eq45pnLeMVBX9T9iSmeyd0DYxqPKWgsdJKwsLxieS1jXY+Q269dnRQM33n00KJWAd4bBqz8ZT15L83Ak3dFiEkZC/SwAz3GW/HzhoXF3/vC9JBSjvoW6z+FkqnjhtmQ53KjMO69p8/rQi7TcIGul+INbX2/53xj7X+Xap+jk5cVy1c9cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH8PR11MB6831.namprd11.prod.outlook.com (2603:10b6:510:22d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 14:37:28 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 14:37:27 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix CVE-2024-53589
Date: Thu, 12 Dec 2024 06:37:15 -0800
Message-ID: <20241212143715.3626117-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BYAPR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:a03:114::31) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH8PR11MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1643c5-9d65-4579-16ea-08dd1aba8060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Qm1vQjk0dlBlRXVoTGcyRWVlZUJtMlZaMExLNU0welNpMXMrcXk3bXZ3REpL?=
 =?utf-8?B?Q3E2QzN4ZFpTZDdkSVk0RDA1VnNiL2NtLzhhaDlTcnZWWHp3ZElwNi9iZVNL?=
 =?utf-8?B?dnpPQkZxUWk0Z3lBYnpOQ25lSGFybkc0Y2lHbGxpQ0Z0bFpwR0tFbW8wTkZM?=
 =?utf-8?B?N24wa2VIYWlWLzBFOWNRNlNlSWV1Z0c5Y1QvN1h1YWhmS215NlRSTXRORVNQ?=
 =?utf-8?B?b1NlNU9jaHY1WEVNb0lvRUpxaDBhZ3BLa3V6TlJXV25UVlowOU5Rdkdld2Jh?=
 =?utf-8?B?WHE0eXRYbzdXUWZ1SzRseEp5R1BReWd1dXc1dnVpc3hrSkwzNk5EUGxuRjNO?=
 =?utf-8?B?Y1VqemlWUkdIL2ZDM0ZzKzdIMmNLUGcrTUVNYXVIZUlPZVJLMWZyaHR6Zy9R?=
 =?utf-8?B?TnpsV2dzc2lxSTlaNVNPNGpyeEE2dHA1NEVpNmRBeDhvZ1dYZmZ0c0YvWHdq?=
 =?utf-8?B?emJ1R3ZmakNBSGZYQ0ZuZjk2L1ZKdzlacVFrNFlBUE01SVlUcGRJK0NyQ1FS?=
 =?utf-8?B?RURhejV0blFEaDB0RGhiZXJoOGR5WFRIZ2RWQTk2NFJXR0d3NDM0MWZuUlgr?=
 =?utf-8?B?SEwwaVRNU3NiMEdmYzNOcXM1Mmw4R1YyTDJtREtiZlRGQ0NWSzY1YkpSOUwy?=
 =?utf-8?B?dkk4YnpjVW9zTkJCbjJzU2VDK3ZRNmd3a2NJaU1nOFc3MDBIM3NsbFlFanVp?=
 =?utf-8?B?d3BFWDIwT0hBY0lHZmVwUkd0NFovWllBR1VGU1pXK1R0WHNTWlNWZ21wVnBj?=
 =?utf-8?B?TW9aU2hTaDlzZHd5RXRaZ3M2RUROZWZSVGdoc2NXZHFXRXRtcWtNRWgydlo2?=
 =?utf-8?B?R3IvV3VsN2xxd1JTZ2swaWpoeTlTTWFnK1FnRmRKUWlPN3lGK3NsWXpGbVlo?=
 =?utf-8?B?VHVvZzE4ajA4cmJlMHFuTE4vSjF0ZVB1V2pyWlJlL1YraGlTL2JyNENOSytx?=
 =?utf-8?B?YWwreFdBWFVhbVRNZDNNdVd5ejhacDQ4WVp3RFBUTFgxcEJrZVE1SjN4TGt0?=
 =?utf-8?B?NTFteklNNERxTDNpWi9HYUxvdmlRU2NnWjJuOVBCU2RPS2MxbFNKWWhsdUVD?=
 =?utf-8?B?a21LNnQ5NTg3eURFampMZ0c2VmlJT2ptYXlBWlJacmNYZXlZYUgxTlE4YjQv?=
 =?utf-8?B?OHdFV3dNbVhpQTkvSDZKdFYzbkxwL3FqMHBKNzhqUGUzMk5kanFJb1NSYkpV?=
 =?utf-8?B?NFF0R3RTOWx1OWcwaFgrQWtVcEU1T1JrRmsyOSthZ0JBRFNoaFlOSElCQXVX?=
 =?utf-8?B?WmptMytuQXRoYXV2ci8xWnAyUGF2L3dic0ttb0dMWEpURXBGU2hPSG1PMm1W?=
 =?utf-8?B?QUlPRU1QbTAzMGx5VnFEbEFMdTE2Ulh0SUZ6endhcUZTTlI4VWFhcjhuLzhn?=
 =?utf-8?B?ZEFZT3FJQ0RDSU9xRmNqa1VSVThicmVNQW5OOVJDV2Y1bnJHZ2tXNUVFQ0hK?=
 =?utf-8?B?Z0VVRFNXenp5b0t1NGZQc0FrY0l0M1g3U2hoV1JVYUZGOEcvUmtzdVBwRHIx?=
 =?utf-8?B?Zk1ORkFDa3o3bTJLaUxWdXRqTjFnQzFGdW5aMmNUNFFnR0V2MnMzWDNBZ0I0?=
 =?utf-8?B?UTFubEJsaEVSVENaQVlXQkJrV1VxTURKT1hrZEt5NmIwNWtSWFBaZmZMbi83?=
 =?utf-8?B?UzJ0UDlHOGU1azlZdUpIYW4yTUZqOStNQnhGUWsvMEY5WUc0ZllxMjdhVE5y?=
 =?utf-8?B?YzY5YTRoUzM5dWlnbUFwNHp5dERaV0xUeVhwRXJGT2hTODQzTHNZU05sdnJW?=
 =?utf-8?B?YnFuaC9BRVJKV3VaWkk3ZDFDQTl6YmxBTWdpU0gxRVhDVGh2WmtnTkZXc0dl?=
 =?utf-8?Q?wtOZfCCz0CE+Asug9UfGBB0bQRer74EH7wsVQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WExDR1BNTi9qakZqTmpYcXpjdFJrckJlWWo1RW1reE5NTEJRc1R0cndrWFZl?=
 =?utf-8?B?Uzk5alZJZHZmM2JrQk5kOUhoNVhRbS9rWHBlQldENnhNZ0RsZGdFaGFHUmJ4?=
 =?utf-8?B?RFJ0cXhwRE5nanVJVTI4OFA2SnZtc1BVL3RCNUVZbU5OWjZQS21QTFZGbU5J?=
 =?utf-8?B?VEl2dTl6S1Zzdnlucm1ScnloUnowYWdxUlpzTWpZcC9MZHhDMW90Vkk1TVhT?=
 =?utf-8?B?Sm9KVkM4anVIckI3a2hNSDNhcmswWDZVWERNOElHcTdCZVV6UFFuUGFhMVhs?=
 =?utf-8?B?em82M1dwb0k0RnkyOW10NXdwOU9SUFhDdllFSjBMd1FFT1JncFRNNTJhY2kv?=
 =?utf-8?B?Nzk3cDJ2bkJDZEtzbmpSejFOa1JiQTQ2Sk1wRlovZnZ3dkxEaXRpejlySzhz?=
 =?utf-8?B?R0RZYUwrYXowNWRoUTIydWlOUFhXVVIxS0R1cmF4MXVRMnhWcVc0czB5UG1v?=
 =?utf-8?B?bk1SWUpiNEQ4MWVTSHVzNit6bjAvRitGZlFOdG1HWGJtT1dvOFl2cWtGQ25s?=
 =?utf-8?B?bTVrdW9lK3ByNWNuOXJvVEdKRkNyaUtJU1lpYW5rYStobFpjdVV5ZGw4Z2l0?=
 =?utf-8?B?dXhiK1FiNXVUQ1dFRy9BS3NZa3NEcmJKdEV4TkdBeFVud2gxbTQ3M0V6YTQz?=
 =?utf-8?B?ZHluU3VMVFJJVDRUS0hnWDFtbjFqaHJwTFdsK1Nub1VraWU4aGs2bDU4c1Ju?=
 =?utf-8?B?YWJ2R0xMSHJxazMwN1p2WTRRYkVNSmw3czU0VldBUXZZbjRnRUhmNVlnTzBi?=
 =?utf-8?B?UVhoVDhtZjlabFV4RWZxZ0hpWUdIUzVwRm5tb2Mzd2RVOGRTMnVtWGNEMFhl?=
 =?utf-8?B?MEVCUmROUSsrMjBBdGI0UXIxMUlFb2wzYTd4TXg5aXRZZjc0bjIvU2tSMHUv?=
 =?utf-8?B?dk1IcnVNTlZKTklZaXhxdlRiNlpYQTNwdW9PdFpFWEx2aU43QVVCQmtzTXZB?=
 =?utf-8?B?ckw3WXgvZGlodTEyblhPN0s2b0xPK3lpV2E1cnFpd0xjR0xjcFdXb2UwZEQw?=
 =?utf-8?B?UW12Qy9nbThBeDdaaTNqbHFUcHlzRHkzK0RhVHRha3RDdkMvRk1XVW02Y21D?=
 =?utf-8?B?amg3R0dFSTVlL2NMMXVYdDZMSDUvTGV2NjNsZitCZ0pkWjhlQzVhWllMWXU2?=
 =?utf-8?B?SS91aDljSnVCSEpZL1UwL3NtSFdIY2xlSi8yZXFTSEdmWm5ML21mLzhJZU5O?=
 =?utf-8?B?eUZGcmlVQWJsWVozNzYwcGRoWXZMM05mS2w1R2g4d3FzemdvcS8wWkwvYWlX?=
 =?utf-8?B?QUk4cjl4ekpBUnhWbmNZUmxoU3dIQ2t1L1IyS3h6Y3F4VXVlbmFCdHdMOVM5?=
 =?utf-8?B?eVppRVNhM001KzZRT0ZVRjd6SnB2N2tKWjJHYUlkck5HOFJlM2ZHMTZnUUNR?=
 =?utf-8?B?a2ZBaStiaHJmUnpqOHZhQlQ3YzNBM1AvTmJ1cFA1SCsvR2xSVmY3S1doczYx?=
 =?utf-8?B?bU1VdFduVnhjVkc0OWdabDdCZDNCNUIyTWlZbUh6S2Y4ejI0SUNWWDZTWW5F?=
 =?utf-8?B?OUJBS0c0ZXdnZkQzSmd6K1Q4OGNpSGRKTUo3TjF2S3hLZmR2Rk81RU1hSlg4?=
 =?utf-8?B?alBsK3dXam9CSklWVjFGNHlvZjN2NHNQYW15cFhUamZySjBDQ0JkVW9VZ0lH?=
 =?utf-8?B?eVpwamdTWVEydGxUWkxTNDdDb0hOdzlNV2lKSjFjeFAvNCtYUkNuaWF0VkV1?=
 =?utf-8?B?aTl3aDBxMmhEREdTanhOVXZXVXExSklFOUdEQVExcjlxRzNOVEFHZzNHUW5x?=
 =?utf-8?B?eFh0eHlINEFMK1l0MTVON1lpYk5OcEE5SDhOd3p6UTJINnlkR09JT0Z3NnNK?=
 =?utf-8?B?c2RDOXZKQ0RQRk90YitrUWdVWHUxLzJrL0tSaVJRcmdiNVJPSzRReE5OdlJs?=
 =?utf-8?B?dW4zQm55OFYxZlE2dGgxdFY1MU44MFpXdWlNcUMwUS95dE1jWk1jeTRacjVJ?=
 =?utf-8?B?MThMUnQ0c3pWRDRGMzZSSmgyL1hDaFZ5NHh5dlNsSFJEUEFMY2dnUTNJajho?=
 =?utf-8?B?YXJsOHVEeHRzRW52VkxmRmM5MzAraGtheWgvbXhKT24rSzZrWjQzeDc1NnpJ?=
 =?utf-8?B?ak1mb3RGQjJSK0owZ05YY2lEWjFmMExUaTF3ZVowZnhmbHZheVJwZit4ZjFm?=
 =?utf-8?B?ekI4OUhRTkpER0Q3R1Z3U0xNOEZwcHc1U1Q4V2wwL3dpNVpmVC92TlZHZm1U?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1643c5-9d65-4579-16ea-08dd1aba8060
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 14:37:27.8028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/TfY91BXhq0N0nThHuUgu2bWDeBtT7qzm7mya5e80sbsDQDveshy1aoE2P5U1Rts9Jo33KXSIHLVqfiW8xnzywEz/QjWghjVhyctOzwdDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6831
X-Authority-Analysis: v=2.4 cv=H/shw/Yi c=1 sm=1 tr=0 ts=675af52a cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QkpFdd30EMMon_xh91kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: EfwutRt5t2Dzi1frZ-tdtp3zvq6N4wbV
X-Proofpoint-GUID: EfwutRt5t2Dzi1frZ-tdtp3zvq6N4wbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_09,2024-12-12_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412120105
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BC6brXS002193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208650

From: Yash Shinde <Yash.Shinde@windriver.com>

A buffer overflow vulnerability exists in GNU Binutils=E2=80=99 objdump u=
tility
when processing tekhex format files. The vulnerability occurs in the
Binary File Descriptor (BFD) library=E2=80=99s tekhex parser during forma=
t identification.
Specifically, the issue manifests when attempting to read 8 bytes at an a=
ddress
that precedes the global variable =E2=80=98_bfd_std_section=E2=80=99, res=
ulting in an out-of-bounds read.

Backport a patch from upstream to fix CVE-2024-53589.
Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff;h=3De0323071916878e0634a6e24d8250e4faff67e88]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0016-CVE-2024-53589.patch        | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2024=
-53589.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
index bff97b50c3..41ed39632d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -36,5 +36,6 @@ SRC_URI =3D "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.pa=
tch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
      file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
+     file://0016-CVE-2024-53589.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2024-53589.=
patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2024-53589.patch
new file mode 100644
index 0000000000..380112a3ba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2024-53589.patch
@@ -0,0 +1,92 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Mon Nov 11 10:24:09 2024 +1030
+
+    Re: tekhex object file output fixes
+
+    Commit 8b5a212495 supported *ABS* symbols by allowing "section" to b=
e
+    bfd_abs_section, but bfd_abs_section needs to be treated specially.
+    In particular, bfd_get_next_section_by_name (.., bfd_abs_section_ptr=
)
+    is invalid.
+
+            PR 32347
+            * tekhex.c (first_phase): Guard against modification of
+            _bfd_std_section[] entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff;h=3De0323071916878e0634a6e24d8250e4faff67e88]
+CVE: CVE-2024-53589
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/tekhex.c b/bfd/tekhex.c
+index aea2ebb23df..b305c1f96f1 100644
+--- a/bfd/tekhex.c
++++ b/bfd/tekhex.c
+@@ -361,6 +361,7 @@ first_phase (bfd *abfd, int type, char *src, char * =
src_end)
+ {
+   asection *section, *alt_section;
+   unsigned int len;
++  bfd_vma addr;
+   bfd_vma val;
+   char sym[17];			/* A symbol can only be 16chars long.  */
+
+@@ -368,20 +369,16 @@ first_phase (bfd *abfd, int type, char *src, char =
* src_end)
+     {
+     case '6':
+       /* Data record - read it and store it.  */
+-      {
+-	bfd_vma addr;
+-
+-	if (!getvalue (&src, &addr, src_end))
+-	  return false;
+-
+-	while (*src && src < src_end - 1)
+-	  {
+-	    insert_byte (abfd, HEX (src), addr);
+-	    src +=3D 2;
+-	    addr++;
+-	  }
+-	return true;
+-      }
++      if (!getvalue (&src, &addr, src_end))
++       return false;
++
++      while (*src && src < src_end - 1)
++       {
++         insert_byte (abfd, HEX (src), addr);
++         src +=3D 2;
++         addr++;
++       }
++      return true;
+
+     case '3':
+       /* Symbol record, read the segment.  */
+@@ -406,13 +403,16 @@ first_phase (bfd *abfd, int type, char *src, char =
* src_end)
+	    {
+	    case '1':		/* Section range.  */
+	      src++;
+-	      if (!getvalue (&src, &section->vma, src_end))
++             if (!getvalue (&src, &addr, src_end))
+		return false;
+	      if (!getvalue (&src, &val, src_end))
+		return false;
+-	      if (val < section->vma)
+-		val =3D section->vma;
+-	      section->size =3D val - section->vma;
++             if (bfd_is_const_section (section))
++               break;
++             section->vma =3D addr;
++             if (val < addr)
++               val =3D addr;
++             section->size =3D val - addr;
+	      /* PR 17512: file: objdump-s-endless-loop.tekhex.
+		 Check for overlarge section sizes.  */
+	      if (section->size & 0x80000000)
+@@ -455,6 +455,8 @@ first_phase (bfd *abfd, int type, char *src, char * =
src_end)
+		  new_symbol->symbol.flags =3D BSF_LOCAL;
+		if (stype =3D=3D '2' || stype =3D=3D '6')
+		  new_symbol->symbol.section =3D bfd_abs_section_ptr;
++               else if (bfd_is_const_section (section))
++                 ;
+		else if (stype =3D=3D '3' || stype =3D=3D '7')
+		  {
+		    if ((section->flags & SEC_DATA) =3D=3D 0)
--=20
2.43.0


