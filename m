Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49671C83F25
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 04:55:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6680.1753246550027193274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 21:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=929959909f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N4U8lY1889998
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 21:55:49 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt1qgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 21:55:48 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56N4tmDh2214458;
	Tue, 22 Jul 2025 21:55:48 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt1qga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 21:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idFh/pFXMvapSGboTUtMtW+8fmbPMLZ39BJJcMmg5mb6gFPr0ThyqSN9/utcJTXkhElBdH83LGsd1wAAkAdvAoi9A7uyuXi9c/Yeq1aKC/BcrgUJyByKh0mWHzdSb6FmtbdW4R3RTNtodbzZIqmlEO+w1cTI6x7OYgg3TMMO/xl5fq0d52TfG4a591uOe7UrTAgvB3VYEVF4OcYvjVRB2gdhE+DhZrYAj9iz2lHVKdCOgELcUjIOP8VuxJXP0nVsR8QmgWyR9h86eVFZcz30QHaVY65MUavw8uwGaQU4KcwZQNPGrxyYRUk3K2gZmuc8tcEMc/3LWyh0Sgds972+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inX7I0j5WiwlnLAF/gjaGKjHHD3lyX3pZw+QWFkpJZ0=;
 b=vcB79xGQ5NAEmNKnFGYkcvR2Ukx0skdf03QV1WI3TPCGzQGawu604xsdN4YN2izXyJgdSb1HWMNUbRwOu5Fi+uD1DIWwqNQBpRERt3FgbpruPPix+LhF0gStZy06GWquWM0QDDWwyG8McUcRnamCw0p9fVnBeHMzjdpKX/Owxhq6evT2y5Hth2T5RfMgI4WV3qbfcUFwcWawYZeVN2dJc3L6sQPVyNpEtiVrAM26NGMEBqbYO9V/ljkrl87zl8YahisPv3YvFyjdI2NKDJ+93QmUMDvzCBcMH7rWh3dwSE8RIUo7RbNkMrrzUV6KB9NEAeIvii1JRM+m/84r4HrVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 04:55:46 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 04:55:46 +0000
Message-ID: <bc0f01fb-6a41-4e3b-9db1-6981d89d8b63@windriver.com>
Date: Wed, 23 Jul 2025 12:55:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] e2fsprogs: 1.47.1 -> 1.47.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1753105314.git.liezhi.yang@windriver.com>
 <0d519f7e190e5ee58ed27cec1fec99af3c88bbf5.1753105314.git.liezhi.yang@windriver.com>
 <d58efabe75aef969f44ce5e3c557706e5c9e3ba8.camel@linuxfoundation.org>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <d58efabe75aef969f44ce5e3c557706e5c9e3ba8.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SEWP216CA0098.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::7) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CH3PR11MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 7575a923-beb6-432d-a18e-08ddc9a52f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YjBBZXdUckhWR00wTzFaYnR4bnJDOEl4c2lCWDlaVGExZksxZ21hUVVhSngx?=
 =?utf-8?B?VUJPMGtSdEdsSDVzeDJXaXZHV01vdkVLMldOcnpGbktFWUVtZWgzNkZJa0lU?=
 =?utf-8?B?dGoyWmZxOVVSMnBHUGdNNzEyWWRKdVhBTjdEV2IwUTVFODJIeWNlVUdHT3NH?=
 =?utf-8?B?Y2Fva2J6VEpZMnhIMlNWZVJwTGVON3hORXc0VTQ1MDlidXI0U3huWUFpRkVZ?=
 =?utf-8?B?REh1bmJhZGx5QXRLcWRxRHlzekQ2WUNaNnpFYU55UmRJeVRsTDhZQnlwZ1JQ?=
 =?utf-8?B?K1hraDQyc01xdi9VdnlnWjdGR3djTHZUVnVpTUdRckdJZmlrUHFqTmtkaXdY?=
 =?utf-8?B?SUZTVkJSTndlZjZGdXVtUVhaTTloYkdWUU10OVBWdHVFcDMvRmNtQjJyQnRp?=
 =?utf-8?B?SWozeGhjM1Y2M2JKNEtHRGZ3ZjhZeCt1Rko5VlY2LzgxY2dBeU1xT2xMUXND?=
 =?utf-8?B?MzF4WDVQYWJJL1gxTUhBcUEwYjRaUWdPdzZjVlA0dFNsTlFvbWdISTc1TTln?=
 =?utf-8?B?V1JMdHZPUGFaODBOZWV4Qk8vUnBLTTY2b1RLckovRDZHeVVHUlArb2QyZHR3?=
 =?utf-8?B?SGxCbElmVUVYZ3pjbklQNHNFYldEWVBqakJ6RHBwSjYwOFExck5SODUzclBI?=
 =?utf-8?B?aGYrRTZXVnZkY1p1VzdUK0NvdzFVU3FJOS8vQ0xnVGtUQmRLcDZwcnYyUjlG?=
 =?utf-8?B?RXo1VWRxRDFqUlNka1laVXJmRlM5dUNNMlY2VXpvTnlBMytkSGZ1OGlpT3Iz?=
 =?utf-8?B?S0duS0FDeDJBenlGS0NmRVUySkJyNEJrSys5RXA3K1NuTG1qQ29oOEk0YVQw?=
 =?utf-8?B?aThVUzIvV0dUMk4vSmdyZzRZLzEyYnZtQVJENHpvUm42ckgzY3MzcUZaeFlQ?=
 =?utf-8?B?cUZYeUtLQklsOWpubWlZWERzMGljOWFyTzQyZHNiWHpvTVFyS3J1bUhLVDlh?=
 =?utf-8?B?dEpJRFozRUN1Tzc3VXUvOWRBazE2OTVBMjRySGErNE1Ddld2WDdOZmFBRkFJ?=
 =?utf-8?B?elJDVjE1YWNVbEhTY1BoNFBYdEdRRS9XQ1dOQkQrWncvdVVWSFp5SjgrUEhX?=
 =?utf-8?B?WDZNWnpIWUZMV1Q3aXdHUjdTOXlYK2l0NDNQSU1YYjAyc2V1VHd1STlYWFZr?=
 =?utf-8?B?RHJYRk9qeFg2S2NSZ3BYcFJmV1dGeVRZRW1sUWo5YWR0VHpsbjJrQjRWZk9l?=
 =?utf-8?B?ZzM2M1hnTFZKR3h6c3ZDZE5iaDlmbXNPUlZXUGZyNDY5N0JQYUdOZGdwb0NM?=
 =?utf-8?B?Q3FjNitaM29mYUFDanlUWUxUMlZnZmc0Y2xFZnRDQkVMOUJhY0tPR0lQclNu?=
 =?utf-8?B?Z2YzaXZsOXJxVXpLbjR5MStuYnZkVDZWb2NDZlNUOFZCMEZPQXd3eE9tU1F3?=
 =?utf-8?B?aWdVSWNnMnFVZkNWWGppKzN6SDRiN2FpYmZ2eXdhVEs5REhpV2JsNzBLa2Zh?=
 =?utf-8?B?Uk5sVFBsYU5qT0tKM0RsaG8xekx3Nm92YnNka1FvUWpTbkpEaGs3WEpDV29E?=
 =?utf-8?B?cVpYWVMwcVc1SmJiaDFxYzVkVkEzbGt6NUVNbWZZSjNkTEkyTjRlbFVHTzZE?=
 =?utf-8?B?akt0OERVOWFxVjhLa0hDOExDbUwwTVA3NVhKeU5YbU11WDg5V0taVjJxSVVS?=
 =?utf-8?B?WWQzZkQ5cUhkOGkydmxIQnhLSDZuNTBUQmc5QlFqTU5tN2VKeGx4VGpTN2pP?=
 =?utf-8?B?TFNMZXRQbEt1MjFyUzRwZXRDNTl1VElTSi9uZU9Ld2VYZGRxMzJsbkszNXJy?=
 =?utf-8?B?T3h1ZmNaK3Q5c3pwS1JjdkdwUjkrVDNoQWV5VEhIZU1LM1dQUU9xWHJqbUZW?=
 =?utf-8?Q?VXa3XIGbEAzrx1YeJPkQMVJVoy4dAVS1IKxYs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnFFOS9OTGtrSk9NbmMvU2h3aFA2NGx6YVR3TStKL3BPNDdVOE1mT0hzcGdQ?=
 =?utf-8?B?OEFWWFJMY0NqTDk2RWZkbC9zYitsQm1manJhcFR6UEhKb1VLL1hIR081ZjZB?=
 =?utf-8?B?V1VPTXlZMEZKZkxSS0RTdXl4d2lxRGVPUXp0TG4yK2p0UFdOM1d0VzBWMzcy?=
 =?utf-8?B?SW9HSGpzT0RQd0xOK0IxSjc1aW9DREhXcnhZMzkwMEtxbTBTQTZOeWdSUXlK?=
 =?utf-8?B?bHo3Q21FaVVJSk52aFJlS1dJT3VTK2tvNVB5bHBMamdycTNseHdaWDZIdGpX?=
 =?utf-8?B?K25XNXhVSXl0ZGF0WXVQL2RSQzFlYWpmSHNqSGVhaUo3OG8wUThsNUdpNFFL?=
 =?utf-8?B?SUx3dDZQSCtaTWU1YWNHTkdLRFRnYnhSYjRMOHRqRFlqbVMyMlYwd1J5akJZ?=
 =?utf-8?B?TDFROENaVXdSTWd1RXJDTkFFV2VTNzJKNkFiaTQyeFRVbkpTNng0dWo5dndH?=
 =?utf-8?B?TkM1UnpDMGY4cGc3RmZGanUzc21tR29iczNMV2dETUgrQkczUVRLNWJhVDNx?=
 =?utf-8?B?OFRpQjBtN0lSUTBxS1lPRHlOMXQxWVpyWmJTOHFUOWZldXhlUkpDdjRxc3FM?=
 =?utf-8?B?cW1tTXNBdWNyWnB1elNKZWNZbGpVcUJBbXVTUnM0T2x1WXVKcDAxamlPRlU0?=
 =?utf-8?B?MkZPb2ZDaHc5RU9BUmZJc2l2c2VDdFdwVlBtcW95em9XYmd1TFM4RE1ESHJN?=
 =?utf-8?B?TEhHV2R4MkpUaVRBTVNQNjg0UVhaNEJ1QW9Oc0hjdEhqdGpVV1IyNHBZVlcx?=
 =?utf-8?B?VGVzaml3eU9TWEk1WmxYeS85eEdyYVhGZlFEa3pDM1JQQTRSdXprb1I2REVF?=
 =?utf-8?B?UnEyMG5EWGt4M2hQbVdxTTZTZElmN01WVHpaVkRXNElyRUpQTDNKLzhpTzJC?=
 =?utf-8?B?bzBLMWxJbmExelNlUTBONUhQZWlkSWR2Y0IvOXZFcGhCU2E1SGlKWXRXZlBY?=
 =?utf-8?B?V1kyQklMUHQyOExhRHZPMis1MHp1SEpRbjZYSjNSU1RrTmt4WTlyQWxRblpo?=
 =?utf-8?B?TDBaRFRBNVJCdnpnVnlFQzZTV0lOc0t6b2djTHpOUTNpRGhHMXFlUUozd0Z2?=
 =?utf-8?B?RitKM25RWUxyOFJFaHBJMUxLblhPbUNYblpuUHd2WlFjQW9FTmZjWkpZbmow?=
 =?utf-8?B?NW1OaW12K2ZHMjJONlA3NGQvR29Yb3N4UkRITmM1aEtEODNQZFFOSnVSclFO?=
 =?utf-8?B?WFNhNVMrOW5lVW9mL2ZBaW1DUEhqUExHQ0xHKzhmSXh0YmJWczRxNGttTjhK?=
 =?utf-8?B?YXk5NEJianFNTkxGdUFHZGVyVVdydjQ3WWZoNVJLL0lZemtWc2tUQ1VIKzMr?=
 =?utf-8?B?aTZYalEvaDJtdGlQYmhrNXJWZFRvTDNsdmNzRkgvUVFMd1BHWjFVNWZWNzla?=
 =?utf-8?B?TldETGJ5SkdKTkczNmhZM1BhaWtFbjZGTHYxUmdVOGNjYlVOZ2pncm9VYWNY?=
 =?utf-8?B?ZUhVcW1OeS92VVE3WTJEaml5dWIvaUEzKyt4NzhYZm5RWFd6N2tBaFkvNzRJ?=
 =?utf-8?B?cDdwZlJRY0RQMkRLcEVra2J3aFU1RTVaN001VFpmL2RYZUpYekpzbWRMOU9x?=
 =?utf-8?B?ckdEYzlySUVjdUcvdjhyeU84djJnZ050SExOZEx3RmlldmNleFluY3JjeVhK?=
 =?utf-8?B?UHlMaXBJYmczY21IUnBsbUxoUFpMRStkaW9PRGtvdHJwaVMzSWlLZEhwU0gx?=
 =?utf-8?B?OEpvRXdWRllCTGduNGlBbFpsQUVISHNPQ243K1ozTHVKdHN3S2JBZGovdXk3?=
 =?utf-8?B?VGsyTTlJSlBLYzV0ZXRCdUo5YUtCM0VaUWFGcHQwdktXY2g1TGxQMmJCZXk0?=
 =?utf-8?B?NTNvTlJGa0pPaXJsOWlrN0Z0RlZaSDhrSUUvU05aeEVGaTdrN1NCRnROOXZx?=
 =?utf-8?B?SjkveHN5YlcwaE5rOWNZK3dOcmVTcjNBTkN6aU0rellDZ3pTWURYdFdScXVF?=
 =?utf-8?B?MjJNSWU3OGd4cDh3Y2dlanJtS0Z0M0JEQXpjSTE1Z2cxS21NRzVUQVVHS3d2?=
 =?utf-8?B?SnpDbXlEd1RGaXlTSXRSVXpQakZTaEsxaXEwTUgzcXRhZUlrL2lCVGU4dXhq?=
 =?utf-8?B?SmZMOEg4cDZKRlVkKzA1Rmd3Z0hmNWRyYm55U2pQSTRwenVrN3Urd0VPYTVQ?=
 =?utf-8?B?VkNwOWRqQ3RXYnUxZXRrQ0pURTVDcWw1clJLa1RUMjlPQVBoUGdwWDhpT1hM?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7575a923-beb6-432d-a18e-08ddc9a52f4f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 04:55:45.9911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYjb+U5mZpnedy89LLhNdizdx9sOBNbFlQcH6iA3skot+fDHb7nGoycQ79s1KfRrwADqJ8A5J2VxNj4B5qPnjY2B7nPbITKrvmwBXrmqies=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
X-Proofpoint-ORIG-GUID: -VdVHtOTl09Oev9EOqEwAJLffcwBHmM3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAzOCBTYWx0ZWRfXwCBF7jFvv9qd
 +nhLVUb7CAY7mSUWZNZyBo2lYjZtSe5dNcXIhpHTTDPMpUAWIdkymVmabG75zeSBVtvZxIWy8zg
 LHThzA4Bl63hmfXAPPnE2pLyICgUdJWW1y1taiLDHX5nBXbRLnDH5TNHL108d1Mdvg2elPi8q3k
 yJc7X3ZnuowsTs1n20Md8A2+Q96+HdXDzag6DnBMkUXP3QQtRU64QKoiIPAWeydRSfA/6XF7p4L
 qpdTdh/FVPAKpLLU189U/nxe/rnS58/6xgfiiNSGskpINrYnCrkJ9cWPFNJkht+dg/2JcwWdmvB
 z7EbYZLuP+82cOpCzSQJ5rfMf1kb8+OukmLHpgwjen1bkfD5LaIjr8G36whT+295WzY7JSSIjFR
 gdGuV08n
X-Proofpoint-GUID: 7u21gJxVJY-33Y5wL1zSGKSGZ64eD_tL
X-Authority-Analysis: v=2.4 cv=Z9/sHGRA c=1 sm=1 tr=0 ts=68806b55 cx=c_pps
 a=AGF89FsVm9+G2LWTQtfgrg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=EZwZrG4ACwFSB0DPxsQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56N4U8lY1889998
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 04:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220785

Hi RP,

On 7/23/25 05:56, Richard Purdie wrote:
> On Mon, 2025-07-21 at 06:48 -0700, Robert Yang via lists.openembedded.o=
rg wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> * Remove backported patch 0001-libext2fs-fix-std-c23-build-failure.pat=
ch
>> * Fixed QA Issue:
>>  =C2=A0 ERROR: e2fsprogs-1.47.2-r0 do_package_qa: QA Issue: File /usr/=
lib/e2fsprogs/ptest/test/test_one in package e2fsprogs-ptest contains ref=
erence to TMPDIR [buildpaths]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  =C2=A0...-libext2fs-fix-std-c23-build-failure.patch | 42 ------------=
-------
>>  =C2=A0...2fsprogs_1.47.1.bb =3D> e2fsprogs_1.47.2.bb} |=C2=A0 8 ++--
>>  =C2=A02 files changed, 4 insertions(+), 46 deletions(-)
>>  =C2=A0delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/00=
01-libext2fs-fix-std-c23-build-failure.patch
>>  =C2=A0rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.1.bb =3D=
> e2fsprogs_1.47.2.bb} (96%)
>=20
> There does look to be an issue with some hosts, e.g. debian 11:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2008
>=20

Got it, I'm on holiday, will fix it after come back next Monday.

> Cheers,
>=20
> Richard

