Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC18C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 11:15:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.47143.1748862950550452805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 04:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8248458948=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552BFeeN004450
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Jun 2025 04:15:50 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47019m1hp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 04:15:49 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 552BFnUf004628;
	Mon, 2 Jun 2025 04:15:49 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47019m1hny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 04:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZUVLwtFHS4Jcn74a68h/8AfRraN4VduBQmmdwhN3ADRVXWPzC8Rmp4R54cYWF75A/hatln8ik7LlWL9vSxLmTw5C30L0j9Z+S/u8RLqsxPv5JBTPWRAGgyjauxj4kIfTRIqcHo42iZp7mJypBQPc0fcLRN/TpFtKdYWdKKjUxzQkZKhcesS7+6kBVWf1kA5hWHV8SVjE7oi//kI/jtPVUG3IlMGsQaH8uKwD70BE5mnxGf+zfWAzbAVXdj6jZ6lNr8jQhbAw5DgH8aoYfXuM9mSuSd1QWHanTX3Z3f+Lkg9PmAMIjJSw9GxRhmElhP2y2JE+KR1YiL7fIsbmsNZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itJ9cYMkKfls4seBdgMaPGpTWPT5jbB1ibkb3ph9MEk=;
 b=m9jS6x4WXDF9Vk97wonFVgRQ1bWH92frR5DH41XkLxRVMvl6ETlOIvSA4lVT9tuIjgHhzLr146a8GJQk8ReeehAw/UdkEl2Ku3TBz+H9uIWnqnI3zd3cL9Y5+h4fU4uXflqyrSxE4RYtcPjiaykw9YkPhpmRonU9OCvVigLnHlx5WbEgwXjXKhoMaPDa9scUEVdRPx/cB9u7+6Xlvi3N56+kRE19r8RzX5Ah7gVmTGng2ylDLG9NKJ+6+NryDIx3E3xAUXhXANAV30GFTnYm9F6xkbdYWnODPuUP2CoTIKwoWKWeAfC3qc7yLVmK996/EHwRJMbSzLjMo7On736PRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MN6PR11MB8194.namprd11.prod.outlook.com (2603:10b6:208:477::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 11:15:30 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%6]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 11:15:30 +0000
Content-Type: multipart/alternative;
 boundary="------------eCU7vwVDf43wDJJ2Koh1hN8M"
Message-ID: <36532bcc-c9dd-430a-a932-ec81e9270f19@windriver.com>
Date: Mon, 2 Jun 2025 16:45:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
 <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
 <7571c07b-2225-4449-8169-08b044208072@gmail.com>
 <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
 <CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com>
X-ClientProxiedBy: RO2P152CA0027.LAMP152.PROD.OUTLOOK.COM
 (2603:10d6:10:2c::32) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MN6PR11MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc8d6fa-790d-4886-98b5-08dda1c6c8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejd1K1VvRDcvTFRRc3VyKzluMzBTYkIybm9kSVVKK2xjWVNuSkRscEptQU1a?=
 =?utf-8?B?dlVrSi8yVzh2cnhaTjNLQ3JUYnFENW13R2dCc1p2UDJQZjNXZktRMVU1TVd5?=
 =?utf-8?B?NU9YLys0OUU0R2Z0ZjlHTjNiZ2ZKdE9DZG5nWkZBZ083R2V4K05kSU1FR1Nm?=
 =?utf-8?B?K0hKNVV5TituTXR2ejVocCt1dTlxQkVtamdYcnBjT3VtUndZUTdPQkxCeStN?=
 =?utf-8?B?bVFoQ251NkhaQjBTOWR5M3dsWEZEdk9mN2ZZZ2tYZjllYWI4SWFVTHlTVGFi?=
 =?utf-8?B?amVHVVl3Q0N6Y2Y3VHV5eVg3NG5CZzJWVmQyZmlWNkRYNnQ3TitVNmxLNGJ3?=
 =?utf-8?B?djRweDVSMytrMmNXVHp3d3lVdzFvaDhIejR5OGtMczRMc2lJZitKV01xRXVI?=
 =?utf-8?B?djJtUUQrRjUyQXlwVXJNbDI4dWFVN2Q2WDhqTGpVbDk4K2htTEhwc3RLeGpP?=
 =?utf-8?B?Z3Y4a1doNXdIdVpOQ3BTYjNFYmpjdlhyWWpMbStrT05DVnlmNDVaSmphcllR?=
 =?utf-8?B?WlZ1RHRTdXlGTi9qdzBiM29BWk1NV2JmeER6dC9aek1XZStnbk5PMnNNT0lE?=
 =?utf-8?B?OS9XZ1Rrb3pDaTlFVmcwOHQ5dGNmWTFWQ2xDNDVocHVrTWZhdEVjWmE2STJo?=
 =?utf-8?B?YUhjVUJsUkRoSlVkNUJlRUU1YmJPUUFYYldBTHoxTVlCc1RHdmhNdWVqOWlV?=
 =?utf-8?B?QlU5MTJmclozc0NreFFGZE1iMVhhcmdreVBNS1crNHc3Ymt5MXV4cW03REhO?=
 =?utf-8?B?ZGFsMW96NjNoVngvM0JSemRvUHFqcVVDeTg2QW1hU3Mrdi9hSjlOeVlmNjJR?=
 =?utf-8?B?R09waThkZkdzMXA2RExtRCt3bVA0Ym9DUitNVUVKMUUwNi9jR0JOR21xY1Vw?=
 =?utf-8?B?WGhoZDZhKzVaek0rYlBLNjgwNE4xR2JoMm44WmNMVE5PNGZZYXAwVGhpdE12?=
 =?utf-8?B?K1E2N3o5SHU0ekM2c1BJcklUNDBNdnZxK0hDMVRIY1p2a2NISmM4Um9WOWhE?=
 =?utf-8?B?MUpQcVVjNFlGSjVCMzZES3FueE5tQzBqR3V1dmUxRjhTUWplblNyT0dmOGJ4?=
 =?utf-8?B?QUk0ZWtNc1JzYm1DcStZeVA0QXlUUWtnd3FLRDNnN21qd1hkNEpnR2ZZRlMw?=
 =?utf-8?B?Z2dNMjhYVTZzRXhSMGhZbnpGQy9xdDdaellKZUQ4RmpzZEJiMDJqazAvTkNi?=
 =?utf-8?B?M0ZJTUNVQ2pxTTRYcm5GUklIakNuMjBEYmxnM3FEM2syRUFBallYTklQQlIx?=
 =?utf-8?B?OFExMHBKbjlYc2RTWFgzZkd0QlluaEJLd2dEVmFDZXVRVnhRa0VLTTJrNzA4?=
 =?utf-8?B?bVlMWm5DbGFncEtkR3JrZ3dRNityNUZEcnVTVVU4Ui8rOHNCOTlvUDFxU05X?=
 =?utf-8?B?R1FKUEM3V3ovYWpqL1J3YnBMVVVrNS84NGpLTkZMbjdNeWdPSVQvVVFsR1M0?=
 =?utf-8?B?WGVPSytOaTFSbjlWc3dsOWFVOUd6U1NadXFMSlp0a1FQWjVLSWc3Rk5zcUoy?=
 =?utf-8?B?endVMldtdjR6d0JXWVZzQjEyOTlQN1JJSGxaVzdFRXBKRjArL20rcWRYdkFP?=
 =?utf-8?B?ZGtPTGNYbXE3ZUE4VGVCMWFtZWVFQXdxcEFQRWlsZlMxTXBaVE0xTjcwK3d0?=
 =?utf-8?B?UmU0U1FzdVBoOFlYbVI2UVNDa2xvVmJPQ0haMWNpUnM1dVVyb2IwOUtaOWd1?=
 =?utf-8?B?alBGdUR6LzRWS0luc0FOaUVCR01qR21XMFVNSll3SFNjY1dxUkxuVUc2NVF4?=
 =?utf-8?B?THR2UGF1U0pVWFlWWXBJUy9lN0k0Y2JSMVdzWXpERmhVbEFJTlMvMzU2eGIx?=
 =?utf-8?B?aHN3U28rYi9URW9lQkZzWkxScHViSEl3MlNpYlQ0Yzdya0VKY2dsYVh0UHdS?=
 =?utf-8?Q?KBASiCiWns5RY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2NIdVNYb0J6SU9aeXpqQmJPaWRabWtFc1AxWU5jQXA5cEMvT3d3WEVVcFRx?=
 =?utf-8?B?LzBxR3ZiMXhwWDN0WDkvSzlWdjh3MDJTY2Z5aTRsUVREUGpWV1VSODhtYjNk?=
 =?utf-8?B?MUNnK3Z6YXdIV0FmblNwWm4wWDFzQTlTbzk5MHExVVd2RFBkUXBUT1BEVis3?=
 =?utf-8?B?QndldHlCaHdLTExsU2xjdjdHMEV1eFovUy9sV1c4ZDNvRTVxM0FGTW9NUXJU?=
 =?utf-8?B?VytIWGZHSW1LUUNESk1HdE1BT1kvNWc1MVo4UUZ3TjRZTHdqd204R3U4OS9O?=
 =?utf-8?B?S2pUWTRNejBpMUNDUHJxWFVVeWJaSisxQVgwQVllM25OVUcxZzNQeHRXWHRE?=
 =?utf-8?B?cTZ1WDBWZzJwalIxMUJaQmRWcTV6dGNHUXgrNWtVVHJmVEtraFpCUCtiQnEx?=
 =?utf-8?B?enFIRjFSbTVrVFhIeVJDcUdTU1BDNDhUaTJNSU4xek0wK084RjYrM2J2TUJY?=
 =?utf-8?B?bHZrTXJmMklERjRhVDBHZkZiTWVDeGRwMXg0TFI0UXl3TVJJYVNUNDdVcnJu?=
 =?utf-8?B?OGo1VlIxYlJrWUxwTDVoR1o4UFh2QVdDdmhGQlFpNVNXekU2dUdBdC8vQ0xu?=
 =?utf-8?B?VWNEYk51bG9kc2tQVVpIbU4zdkhPZWc5N2l6ejMrbG9PRXdZT3J6ck5WK28v?=
 =?utf-8?B?Y21xbTY2ZWNwUFdTT2tVSFlKWWJnTVYrWUhyb3hPQWpkTGRwQXNLNjd3ZFlk?=
 =?utf-8?B?enBraTJ4eUl3RmgwQXp5QWg3MytMdWFqRjRWY2FuT1JMODFlQUFTVGU5dElT?=
 =?utf-8?B?QTRVUU92QWUvc2NBa1JYQjJYL25LWE5BMXVnM2FaMmVUaENYSy9QMWNvd2or?=
 =?utf-8?B?MUpNbm5EVHQ1KzRjTktuVHVoZTlKcHJCQ0VJS1FFVEl2RUdzbTZYbmtDbkU5?=
 =?utf-8?B?OFM5dS93L2gzQUFRaEJvWFU5dkNleXFyZloyYUZzZ1lyOExXRHJlM3NEdXFX?=
 =?utf-8?B?aGxwTWl0VlEvdnRGcWRYbDVVa0xxeE9mc3M0Vng2M0ZBa2Fnc094VGFNR3VQ?=
 =?utf-8?B?R05yUzJpTFBUQXZLQVk1OFN4UXBXVDZ1dDJMWWRzNUhaWitBZnJ6SHNJdTRC?=
 =?utf-8?B?ZDVGOE9nT281blFlVk4vTHlKY2lYQ053Zzg2bXR5STlsaUVSWlZKdUpVNEpr?=
 =?utf-8?B?R2JWNkNiaFB4SUNUQ1hoWHRoY2R6d3MxTHk3dVdmMndYM25CUk13Rm56b1dq?=
 =?utf-8?B?YmpONm16NUM2bjg0ZjZZc0w3TitvT0l6cDYvV1UrbENYWkwvOXpzc2xWaG82?=
 =?utf-8?B?dTdqRGxrOVE4Q0IwU2U5bkd0Ym1SVVd5SFJHNTFxbGR0MkViWGN3Q2pFZWtS?=
 =?utf-8?B?OGJNbU9ZZUFQYVpJajEyR0RUVGRobnViS0VieXdYQUZRK3UvR0FYenp3eVE2?=
 =?utf-8?B?NGZENnBxQ255TnRNWVhKd0p5MnkwWDdnMVgwbHFrbGJaUFFMYjdRVTN6K0pT?=
 =?utf-8?B?RDcwNzB0NFlBNGd6Q1oxR0thd09Ba3draVY2QXJ2cUxORmVYZXdUSlhMcERa?=
 =?utf-8?B?WWVyak9Ob1VMY3IxSmZTZ0R1ZEhHTlR3VlFPOUFWWmRwNkNUQmNJaW5Lc2sx?=
 =?utf-8?B?K0ZKVm5WbFUwNmU5THBOenlFVmdGeTdCWXgveFpZMnQ3dTRsN2hqalRJakx3?=
 =?utf-8?B?VHBOODVYZ29zL3JVbzQ5dXZ6cThtc3Q2VlYvaGFBejBYMXdzRnd0MUZjZ0dE?=
 =?utf-8?B?eTV1SGM3eU43cFJ3SmlCRnJYeGFZTUNmcGRWcjA0U2VOOEtkRUhwcEg5Ym43?=
 =?utf-8?B?UEJNSllWaXBWQ0lQWHdUbnY4d2tGQXNicGYyV3VKakpjOU1YMTkvc0JKYWdC?=
 =?utf-8?B?RFY5OGFRWk80VVcxQmpXUWdPWDluRnRTREIyblg0bDBtNVV6SXdWYWllalZE?=
 =?utf-8?B?aFFFWWlyeFlySE9MRGJwcCtlOUJQRldKcUlQaG0yV05nQml6K1diODRmQm5C?=
 =?utf-8?B?WURXbWxmTnVRZ1Fxd083UWhOWldzcHpNK2VJVEFBL0o2a2ptN1BBbUI3RWJo?=
 =?utf-8?B?bzJWdUpCYzFvN2FqYU1CSjdlUXJXeDdodklRNklVRjU3SFJCQ3huSi8xamJ3?=
 =?utf-8?B?MU5zdWFITVc0WlVjdHUySnFuZ2VqUDRraml1akhkWldOU3FzZ09hYkI2Mkx3?=
 =?utf-8?B?V1ZyQjg1R21QNzVnby9KRFZ3NFVtWk1yY1lzV2pncWFRTTdWcHl0UE42QnJV?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc8d6fa-790d-4886-98b5-08dda1c6c8b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:15:30.3742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INRtCDFtihqqstqKKVJwLNGIwWTny0LpubaeE713FOqQdVjz2LPxFUWUXldd/W9LfNVu5PJFHwdFm5OHmjAE61ozZuaxdkkppsiFQYnSXjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8194
X-Proofpoint-ORIG-GUID: kuhYVMvk8tGDy8EaD6CisPp5wZTsRSQX
X-Authority-Analysis: v=2.4 cv=SpqQ6OO0 c=1 sm=1 tr=0 ts=683d87e5 cx=c_pps a=HM8KeKQHP11Uti6iLAcMXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=J5I3tF3D9P31g6wmZAYA:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=4WhkF42OMS36u3g0:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0uRNeJkqslilXjdFUaKJGI1TsUDQPzTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA5NyBTYWx0ZWRfX2khZtRki1Z54 e6qo07f1vC/NJwMEkfinJBjMy0ULtfUspKaDX6Zt0+eUh/mjeDslHTD4BHqIfG7wnpvShAfzrHq CR2Ekzt41HEHP9kGvlbGvCzZuzYCXJu1gssPP6GHOGblj/eYny4+uFU/pXRS1Y7zCkisUTY05FV
 nBRyYWriyUuGHPqjBRQ/8P+hGMGDsBmrr2sAoOOtXdLR6kHnrnUynEqLibBH23gE/Nj5wYJLMnF /EYdeAt2yagNGp5Vs3FClzsZJtWqpxy1l1YWyjPiI4SY8jzCIoLYj1mpSBLF3N01te7KyBe5pBC h2VaG9/lSCN9Y9mTfGNCQdOfkuPzyTMIiTFs0FrbArRvpb9mAZu7Pv8Hqcw0/P+RKbsrg3NrjbK
 GBGOJQ4LUcOVrR+/bq7r0DVFSwyGf0IHsuxHH3KQ3WC0Z2GLd3V3WaEDaAraH/9zk7N9L6mU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_04,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2506020097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 11:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217714

--------------eCU7vwVDf43wDJJ2Koh1hN8M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 30-05-2025 18:45, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 30 May 2025 at 14:42, Yash Shinde<Yash.Shinde@windriver.com> wrote:
>
>> As Khem mentioned, setting lld = false in config.toml doesn't build LLD.
>> Furthermore, using "use-lld = false" ensures that LLD is not used as the
>> default linker,
>> causing the build to fall back to the system's default linker. This
>> restores the earlier behavior.
>> Also, the package QA error for rust-lld is not seen with this.
> What about build times though? Are they back to what they were?
>
The build time differences on my machine are as follows:

rust version
	rust upstream builds
	rust-native (yocto build)
	rust target (yocto build)
v1.85.1
	10 mins
	20 mins
	33 mins
v1.86.0
	22 mins (with "lld" and "use-lld" set to "false")
30 mins (with default settings i.e lld = true)

	31 mins (with "lld" and
"use-lld" set to "false") 	43 mins (with "lld" and
"use-lld" set to "false")

Note: The machine being used is a shared resource and fairly busy. Build 
times may differ due to other user's builds.


The FS usage is as follows:

Rust version
	rust upstream builds
	Yocto rust builds 
(build/tmp/work/core2-64-poky-linux/rust/1.86.0/rustc-1.86.0-src/build)
v1.85.1
	4.6 G
	6.3 G
v1.86.0
	15 G
	8.8 G

The latest rust v1.86.0 upgrade changes are available at:
https://git.yoctoproject.org/poky-contrib/log/?h=harish/rust_1.86.0_v2


Regards,
Yash

> Alex

--------------eCU7vwVDf43wDJJ2Koh1hN8M
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-05-2025 18:45, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 30 May 2025 at 14:42, Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">As Khem mentioned, setting lld = false in config.toml doesn't build LLD.
Furthermore, using &quot;use-lld = false&quot; ensures that LLD is not used as the
default linker,
causing the build to fall back to the system's default linker. This
restores the earlier behavior.
Also, the package QA error for rust-lld is not seen with this.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What about build times though? Are they back to what they were?

</pre>
    </blockquote>
    <p>The build time differences on my machine are as follows:<br>
    </p>
    <table cellpadding="2" cellspacing="2" border="1" width="877" height="151">
      <tbody>
        <tr>
          <td valign="top">rust version<br>
          </td>
          <td valign="top">rust upstream builds<br>
          </td>
          <td valign="top">rust-native (yocto build)<br>
          </td>
          <td valign="top">rust target (yocto build)<br>
          </td>
        </tr>
        <tr>
          <td valign="top">v1.85.1<br>
          </td>
          <td valign="top">10 mins<br>
          </td>
          <td valign="top">20 mins<br>
          </td>
          <td valign="top">33 mins<br>
          </td>
        </tr>
        <tr>
          <td valign="top">v1.86.0 <br>
          </td>
          <td valign="top">22 mins (with &quot;lld&quot; and &quot;use-lld&quot; set to
            &quot;false&quot;)<br>
            30 mins (with default settings i.e lld = true)<br>
            <br>
          </td>
          <td valign="top">31 mins (with &quot;lld&quot; and<br>
            &quot;use-lld&quot; set to &quot;false&quot;)</td>
          <td valign="top">43 mins (with &quot;lld&quot; and<br>
            &quot;use-lld&quot; set to &quot;false&quot;)</td>
        </tr>
      </tbody>
    </table>
    <p>Note: The machine being used is a shared resource and fairly
      busy. Build times may differ due to other user's builds.<br>
      <br>
      <br>
      The FS usage is as follows:<br>
    </p>
    <table cellpadding="2" cellspacing="2" border="1" width="955" height="91">
      <tbody>
        <tr>
          <td valign="top">Rust version<br>
          </td>
          <td valign="top">rust upstream builds<br>
          </td>
          <td valign="top">Yocto rust builds
            (build/tmp/work/core2-64-poky-linux/rust/1.86.0/rustc-1.86.0-src/build)<br>
          </td>
        </tr>
        <tr>
          <td valign="top">v1.85.1<br>
          </td>
          <td valign="top">4.6 G<br>
          </td>
          <td valign="top">6.3 G<br>
          </td>
        </tr>
        <tr>
          <td valign="top">v1.86.0<br>
          </td>
          <td valign="top">15 G<br>
          </td>
          <td valign="top">8.8 G<br>
          </td>
        </tr>
      </tbody>
    </table>
    <p>The latest rust v1.86.0 upgrade changes are available at:<br>
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky-contrib/log/?h=harish/rust_1.86.0_v2">https://git.yoctoproject.org/poky-contrib/log/?h=harish/rust_1.86.0_v2</a><br>
      <br>
      <br>
      Regards,<br>
      Yash<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Alex
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">
</pre>
  </body>
</html>

--------------eCU7vwVDf43wDJJ2Koh1hN8M--

