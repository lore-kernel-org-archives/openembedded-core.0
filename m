Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC03D10F41
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 02:30:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32221.1731897001355760822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Nov 2024 18:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105279e00a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI1XxPn004657
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Nov 2024 18:30:01 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq0yg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Nov 2024 18:30:00 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AI2Tx9o019652;
	Sun, 17 Nov 2024 18:29:59 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq0yg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Nov 2024 18:29:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzkRjAkAgnq4c24prjMUknaJi+vMB6SFqJejQT+ROdR1/blac44o/JkcOGFxQEUVoYiCctFrbqyTusdyDbgc21Qr+iJcv/tMvACRSGHfrmHw1fGHUn5IzprWvfltlCcPXUfZnDM6v0OqEMsAYsymEEnakb0PjDcXl5TQ0lGjFP1tmdpIKebeuYQVFqqC1AKR+EvW7u+il92Pt3UYR4Wi8sR7BXPniq5MBa6K/WDChrayTjPClZAknyFzGFYPW1I0y8NOVyvjaFlMb9+AYpGCVpeutLg0qzOYQ6nz5TYyYiedp5YS9JrK0NMzfwf8GccgbIETV8aVss9I1wGWBqBFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9qjm/ISD8itgrrP+DdSOIv1IHkRSgy7KWKyv/QUMYQ=;
 b=ZGprVJPOArXngHFgnBlLp/qykg8ocdKLgE+V+tf8+H4rBJ8/+5h1ViJ6m8inxIgPyhEoVdmmN0Ig46bKxM0JxKhItD6fooUOl9bUKIf0VGciHzmO3z/nmfdf8WJ3fkc0nLrHAA2D1Zj5/vELHp+G48oJOPGGzjMFBhQzngKFgA6gr5EuU+hI66NDaxXf8EHSLIz/lic2+fDHFF3NtGcIA1I1A6j0mCJqEhUeDyfdYnCt+QmphOMKLG/gEV9F27yA2n6PDKnTTZway882wGftyGj3Y//0MEXAWd4FFv/kQ2bqzyzg9QdslfaJB6hh8f2HyfASBo9BKrmxm7t080/O3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 02:29:53 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 02:29:40 +0000
Content-Type: multipart/alternative;
 boundary="------------P0N8ThgQFrN9K0JkXaoi1C8p"
Message-ID: <8074f29e-89ee-4806-8011-21fe53f66e3f@windriver.com>
Date: Sun, 17 Nov 2024 21:29:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 3/5] ninja: build modified version with GNU
 Make jobserver support -> (jobserver, loadfactor, pressure and all that!)
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Martin Hundeb?ll <martin@geanix.com>
Cc: openembedded-core@lists.openembedded.org,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        Khem Raj <raj.khem@gmail.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>
References: <20240404111613.2574424-1-martin@geanix.com>
 <20240404111613.2574424-4-martin@geanix.com>
 <202404251130553913ebd5@mail.local>
 <f47e5c53e97b190852dc5578e0c3f0fe140803da.camel@geanix.com>
 <2024080210413291c61aec@mail.local>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <2024080210413291c61aec@mail.local>
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a4c93f-ee82-48ca-ec59-08dd0778da70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bTNmRFpzVmp2MHNzTkdxWnlsSVNPSFVLb0hwcU43aFFqRkVsZ2t5cURuakcz?=
 =?utf-8?B?YkNOZmNkYlBic2JyWG5zU21vQzFsVHRIY1FXa1VOVkFGTzZuUjlMZUhkK0d2?=
 =?utf-8?B?ZVZjZHlyVUpjZGN1TUJldUJuZFJEbDNQQzMyUmFya3ZpVHRybHFnbDE4bHcx?=
 =?utf-8?B?MjJiV2YrTU1KbTdoV0hYR1lvM3BxZHBwMmNIMEk0N0xRNG5OanpHRmgwOS9h?=
 =?utf-8?B?amJEUnRyUDN2L09yOWpqSTIrdGt4Z0ZuWGVmR3FCdGF6RUlhbTJybmVKYkRL?=
 =?utf-8?B?NXVpV0FkTFIzTURWdUlPVE1NVXBLaXh2bzYzcXdMZnBldnRFSVZpZVk3a0da?=
 =?utf-8?B?aXhaUWFzN0NCcnFJeTFMcWpHL0R1WUVMbkw2b1BMeElnZncwVXFpLzJmWExD?=
 =?utf-8?B?a0hLcmlsWUpKUE9xS0JlbHg3cEs3aExXbEFXWkdiTzVGOGN1cmtCMUtmditI?=
 =?utf-8?B?SFAwYVV4SXZNVE5QeEpFMDlaQndnWklPVmh0OWhReDZhZkd6S1ltQ1ozdnFw?=
 =?utf-8?B?L1BYdnNPL2xETkRHZGcrMEhsd2lCWmRxbmkxRlNkM2dhZ2t1djlVemJIeGdj?=
 =?utf-8?B?WUpoZkhqSkFuSG9sSEcraThxa25iVGlCYTVNUnI1ME1nRTJmVTdia1g4QVBq?=
 =?utf-8?B?MUhReXMxYW5QVkRicTdjdFJETlJvREtxSk0xaW5UMG9WRkNNVGJ5M3NOeG1G?=
 =?utf-8?B?SXczRnVGSWpSRkZPaVMwYWFkU0gwdzg0cFdTMXg2ZkR0dnJUV0lZYmI5Y1g1?=
 =?utf-8?B?bmRQSXNtQnpqdWVzbDVKNDBuSFIxaTRkczlHcEV1ZFJiajNmR0Vmbmw3QlQ4?=
 =?utf-8?B?L2l4aDM1RzFjUGpDa0VyZU1HSmtRZjZ5b0hQRGszZjVaUlhyOU95NThmNDVW?=
 =?utf-8?B?VUpZakJpa2VrcHR0SGZidUtBOTE5TkJtazdsc0xKb25hNHQ3WXNPbTI1VGNU?=
 =?utf-8?B?bkpBdnZReHU3MnU4RDI2ZGkrZWZ1bVk4b2lXdjZpUzR1Z1Ura2ZCdVMvN3JW?=
 =?utf-8?B?cHptcHQzNUdBM1dJTGorTk50T0d4UUFHMDlvVkZuTGs3c2kyRTZvMzI5NlA5?=
 =?utf-8?B?QnBTSE4yY1p1UXN6cFNlcElnMllGRktzSHc2ZFdSZ0F2MUYza1VFT2tmSWNi?=
 =?utf-8?B?YWFyWWpXcjVnYmNqOWtYdXhPVXNNMTB1TUdYM0NGTFZTaEp4NG1IbGd6L3pT?=
 =?utf-8?B?OG4zeWZkeUQzMG1wR3NQMHZPSnBlZGRWVDVEUWZiT01TSUxiMUhSRGVrblh2?=
 =?utf-8?B?T0czc0dvVnNhU3VteTVnS05QalBnWTQrZjFCMVM0VlAwekNmTWhNb1h6S2pZ?=
 =?utf-8?B?Umw5dFFDck95ZzdqZ1JKQXNyUmNFeTlOZHJKeWxQelVyb280bjMxemFWdy83?=
 =?utf-8?B?R25ySndnNjZvbHpBVG5kK01tbmxYMU5BQS96N2VZdFFQRjZ1TkRPVWJEVjRm?=
 =?utf-8?B?eHdUSFdTeXllNjh1aHQrejJ6akJLcnUyMjl4a0pJZGNyeGpKRGR2U3lsY2hF?=
 =?utf-8?B?d251cHQ3aTdISktIV1RnR1lRWXZuSVBEYldTMXE0cnc0aWk0ejFqLzIzNEFZ?=
 =?utf-8?B?SmVhV2UrZURaekh3V3BZYWRPbzVMMzZ1NWZoazBXOUxoTFREMG1heTRKb2ZP?=
 =?utf-8?B?SEtYbjI4Q3VxK3FHV1o2WCs4QmhpNHpWYkN1MUcwa0E2L2FBK2l2cHNGNk4x?=
 =?utf-8?B?VzVkOU4rcEJKUmM0TmJjbXQzbGpxbGl1endBRVlXelMvckdwRU0zTVJBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDhkN3Y2d25ybE1GdThZZUNWQlAyUFBIeDVyVzArUUhaMlVMSDFzOXZrODN3?=
 =?utf-8?B?NzFLUTF1ZysrYTVpSlFobUdQRTVKaUExZE9Kd3p3TDRzOHRVOUJXOU5qYjN4?=
 =?utf-8?B?Z3ZEbk5TLzRMdy9Vb0VwNWtoSnZhQ3hobGh2REtBMnNKeHJnNkc4Yms4U1FJ?=
 =?utf-8?B?bDE2K21IVUN5ZGRrTXJ5Tm9VMmkwZzNxZ3hxRnVKbXhVLzJLZVdxdzliU1Ja?=
 =?utf-8?B?NDk5WDhOaXNPOVpYajZ0dzY4UTNNVTlsZGxlSkFxNGVwZVdTT1lNdmV1RWpn?=
 =?utf-8?B?eVFheSsxN2wwZDJyMFlsMklGOVJta0txa1kzSlpvdEJPKzYyZ0NGSVc3U2Zh?=
 =?utf-8?B?OVo0eURQMi9JWFlOUEd3STlUY0ZnVHk4U1VpRzdOLzhqajVRUXUxaU9GbEZS?=
 =?utf-8?B?c09KM1NGbjlDMnRLSW90VHYzbUdFNlVONEx5WVNhUkdRS3NPZVRPMDNFSTkz?=
 =?utf-8?B?Q0hCdm1CT1BOaDFOS3dhenV6MEdEbkZXcG9OdVlqY1BSYTl0MU5XOGErM0pl?=
 =?utf-8?B?MWgwcFhXR0wzS1NLdzU0UzZuakdnSStHSVhkWjh2QU9MbE50N09TQ3JMd1Rw?=
 =?utf-8?B?TWI2YnM1L2lpVk5WTkZwUVJSM2M4T3o1T2pUaGJqVkhSTmd6ZWs0WTlNTVJ4?=
 =?utf-8?B?VXFhZ1FEVWZsTlM5MUk4cDNBR2QyUUdFVlZWVHJMaTZLVE9jUlB6OXNKRXF4?=
 =?utf-8?B?R2NJWDZPVmNWV1NOUHo3TmNyYmJhQVluclpCaXZ6WHZCa1BHV2owU1BFNlhX?=
 =?utf-8?B?MkxJUFMzcG44SWxZLzdWVm04dS93RWlkWjFDUlYzK1dZZ25PVGlQNDhUK2U4?=
 =?utf-8?B?WmdXVkFkb2s2WlhMc1hZdmx3czZzSC9ZdDVSdHFpWnM4OENxM3BKRklCcmxR?=
 =?utf-8?B?Rit3Tk96T3hSUnJPSFRnVFo0NWtwTVFZRzUwc2RtUlY2SVhXT2lSNldjUjNq?=
 =?utf-8?B?T0FkVDNxMDVwWGxES1FsTWtkY25vbndUMVpTRnA5K2pwS0Y4eFhlcXdqMlN0?=
 =?utf-8?B?TCtONm9LZmVNUTJndDNhb2dzVXd1bEFaeGZyTVd5TCtwQTlJQmlKakJtQmlL?=
 =?utf-8?B?YXFTZGhZZytyL0liU2JIWDE1aVUxZlFzWjRlN2wxSTJDNDVTN0gwdWE3c256?=
 =?utf-8?B?bTZhbUR5d3haZEFaeXYvWUFnaWNwQXdhNFpqbFVkSTZnNnNKZ1FNOE1YdW8w?=
 =?utf-8?B?VGNEUGtDM0NESHo0dldjelJtUzlHWmVtUk9STTNiZmg1d09tTGJkYzJvUnhl?=
 =?utf-8?B?RTFjUmNzVFRzTjJIN042T0NtR1hDalZMR20rTHJhakx2WStlMlJiWS9aTHNY?=
 =?utf-8?B?M3kzYWljSUJWVGFOMkVJcjVNMWZIWXN0MmJ1Q2JKd05DKzhvcFlqVWNEL1Nl?=
 =?utf-8?B?UERxYkZOWGY1TFpLK0tiNWdHci9UM3pad1pLaUJkemtNU3ZvcU1BVnZQOTlD?=
 =?utf-8?B?Z0NXc3NWYmdKdXBpYnlyY2ViNXBLVTJVM09Qc2RYZlhqNENGUjN5eW9sQzlI?=
 =?utf-8?B?bytHVWs3ZE1LTmU0Zm83MlUzRTJFdXQvWUtuZVNXS0p1WkNWanNIQTc4RHEr?=
 =?utf-8?B?SG9FaE96V2E5NDlKbEo4NXBYY1lHYjJNZGhsdzg3cVFNZ1dCVk5hWHZhQnpR?=
 =?utf-8?B?SEIzMmpsK1VzMlltSExnUm9TSzBGdHhadjVWN3UvOXRaMEhleS9wc1hKbEZu?=
 =?utf-8?B?NUxzZ3VDS01xSlpOSU9vTjNCUllVZ3RjY01id2NFL2ZaMURadG9UaW52RzdW?=
 =?utf-8?B?Q0U3bGw4TDBNM1Z2K2Zpb3grdURUN0lJd0t5N2thZmVSYUR4MFZ1UVNmNHI3?=
 =?utf-8?B?dTFFdTA2VERqeUNDZ1dxbjQrcVFMNGVkamFXdVcvUTJvd3pNZG5zUEFXcFFo?=
 =?utf-8?B?SHZFV3hheTNyR21zL2NKOHlycHR2aTVUOGRxamJaM1hvNHhuUERua3lURU9V?=
 =?utf-8?B?c3RybnFZNkV1U0RrSy9iWlBMN2JpMkJEUGhCY2l0QTZiMVNmRU00NkowVC93?=
 =?utf-8?B?dEtCWWRKNWZSU0gwWEdwcXJuYmhxK3VnSkRLRUZIcFJwMHp6cUE1WThUanhC?=
 =?utf-8?B?UFdhWjlBUnRWcmtpbVVkWTdPY3ErcEZoTE1HZnJsSWprYTNwNUNkSlFqQnpM?=
 =?utf-8?B?Skx5MDVaWE1uNjRUTTdCMEozNHVIb0NTcGxtUzMzcFVkL0RWSWdSYWRxNWpt?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a4c93f-ee82-48ca-ec59-08dd0778da70
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 02:29:40.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybjkVQLmiS73eTBZkLVS4byFHLEFwY+ijeDIO1wOqxCDzHo6gsc+dcIK2EUI3w9/3ITl5qVIXcRbuQvX1a2rHaxtQqy4gA3l55I3HZNQuPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186
X-Proofpoint-GUID: -lAa72SGYR9lxEUtFN3KoNKqTIhCH7y-
X-Proofpoint-ORIG-GUID: 9YkIVb6TsYgkd4p1hHk4dPsJ2vvuw4qs
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673aa6a8 cx=c_pps a=wXDgSYWbwZencpnnUUTq5g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=kTakKMPAAAAA:8 a=p0WdMEafAAAA:8 a=YRHvXXt1AAAA:8 a=Q4-j1AaZAAAA:8 a=ilKATfAMAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=_tzIdW61ykdlOWKMc8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=eUJYh00j-qPtM9Wpr54A:9 a=Nk0rDE4xZRAiSmpG:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=uLSFYZeSjgb_eomtY0KL:22 a=9bw_jnHfPby8klRCszyn:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=73awMTU50e6eLoBjGbzZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-17_24,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411180020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207200

--------------P0N8ThgQFrN9K0JkXaoi1C8p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AI1XxPn004657

On 2024-08-02 6:41 a.m., Alexandre Belloni wrote:
> On 02/08/2024 12:24:06+0200, Martin Hundeb?ll wrote:
>> Hi Alexandre,
>>
>> I see you keep carrying these patches. I'm still working with ninja
>> upstream to add jobserver support there[1]. I was planning to redo
>> these patches once ninja merges that. But I can do a respin with my
>> patches added to ninja if you like?
>>
>> [1]https://github.com/ninja-build/ninja/pull/2450
> I carry them so they get some testing, I can drop until you submit the
> new version.

Hi Martin, et. al.

I'm going to do some experimenting with the job server patches for a
talk that somehow got approved for the 2024.12 YP summit!

https://pretalx.com/yocto-project-summit-2024-12/talk/WGPUTX/

As expected, the patch doesn't apply with all that has changed since Apri=
l.

Do you have a a branch that you are keeping updated.
If so can you same me some time otherwise, I can rebase and fix things up.

I'll of course give you all the credit for the real work.
I plan to mention the performance/behaviour improvements that you=20
mentioned in your cover letter:

---

On build machines shared by multiple users, a single jobserver can be
shared between multiple builds (using the JOBSERVER_FIFO variable).
Running the above build in two different build directories at the same
time gives a ~12% improvement (43:17 -> 37:55).

Finally, the memory pressure from e.g. compiling multiple c++ based
projects is also reduced. In our case, a cloud based build machine (with
32 cores and 32GB RAM) fails to compile llvm-rust-native (in parallel to
nodejs) without the jobserver due to a lack of memory.

---

Is there anything else you'd like people to know about?

Does anyone else have jobserver, BB_PRESSURE_*, BB_LOADFACTOR_MAX use=20
cases or benchmarks
that they'd like to share with the YP communtiy? All input is welcome=20
and appreciated.

Thanks,

../Randy





>
>> On Thu, 2024-04-25 at 13:30 +0200, Alexandre Belloni wrote:
>>> Hello,
>>>
>>> This patch doesn't apply on master anymore because ninja has been
>>> updated.
>>>
>>>
>>> On 04/04/2024 13:16:11+0200, Martin Hundeb?ll wrote:
>>>> Ninja doesn't (yet) support the GNU Make jobserver out of the box,
>>>> but
>>>> there is a pull request adding that support[1]. Since that pull
>>>> request
>>>> (and its derived three-part pull requests) seem to be ignored by
>>>> upstream, kitware (creator/maintainer of cmake) has created a
>>>> fork[2]
>>>> only to carry the jobserver patches. Change the source uri to point
>>>> at
>>>> the kitware fork of ninja, and add two patches from the original
>>>> pull
>>>> request to also support the new-style fifo jobserver feature.
>>>>
>>>> Note that the kitware fork of ninja is also used by buildroot[3].
>>>>
>>>> [1]https://github.com/ninja-build/ninja/pull/2263
>>>> [2]https://github.com/Kitware/ninja
>>>> [3]
>>>> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/nin=
ja/ninja.mk
>>>>
>>>> Signed-off-by: Martin Hundeb=C3=B8ll<martin@geanix.com>
>>>> ---
>>>>  =C2=A0...ename-TokenPool-Setup-to-SetupClient.patch | 113 ++++++++
>>>>  =C2=A0...-jobserver-fifo-style-client-support.patch | 271
>>>> ++++++++++++++++++
>>>>  =C2=A0meta/recipes-devtools/ninja/ninja_1.11.1.bb=C2=A0=C2=A0 |=C2=A0=
=C2=A0 8 +-
>>>>  =C2=A03 files changed, 390 insertions(+), 2 deletions(-)
>>>>  =C2=A0create mode 100644 meta/recipes-devtools/ninja/files/0001-Ren=
ame-
>>>> TokenPool-Setup-to-SetupClient.patch
>>>>  =C2=A0create mode 100644 meta/recipes-devtools/ninja/files/0002-Add=
-GNU-
>>>> make-jobserver-fifo-style-client-support.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/ninja/files/0001-Rename-
>>>> TokenPool-Setup-to-SetupClient.patch b/meta/recipes-
>>>> devtools/ninja/files/0001-Rename-TokenPool-Setup-to-
>>>> SetupClient.patch
>>>> new file mode 100644
>>>> index 0000000000..a503f8c75f
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/ninja/files/0001-Rename-TokenPool-
>>>> Setup-to-SetupClient.patch
>>>> @@ -0,0 +1,113 @@
>>>> +From f5642d8b49688dfc84679451b531d92f3b6e7cb0 Mon Sep 17 00:00:00
>>>> 2001
>>>> +From: Stefan Becker<chemobejk@gmail.com>
>>>> +Date: Sat, 15 Dec 2018 19:29:42 +0200
>>>> +Subject: [PATCH 1/2] Rename TokenPool::Setup() to SetupClient()
>>>> +MIME-Version: 1.0
>>>> +Content-Type: text/plain; charset=3DUTF-8
>>>> +Content-Transfer-Encoding: 8bit
>>>> +
>>>> +Make space to add new API to set up token pool master.
>>>> +
>>>> +Signed-off-by: Martin Hundeb=C3=B8ll<martin@geanix.com>
>>>> +Upstream-Status: Submitted
>>>> [https://github.com/Kitware/ninja/pull/2]
>>>> +---
>>>> + src/build.cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
>>>> + src/subprocess_test.cc=C2=A0=C2=A0=C2=A0 | 3 ++-
>>>> + src/tokenpool-gnu-make.cc | 6 +++---
>>>> + src/tokenpool-gnu-make.h=C2=A0 | 3 ++-
>>>> + src/tokenpool.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 3 ++-
>>>> + src/tokenpool_test.cc=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>> + 6 files changed, 13 insertions(+), 10 deletions(-)
>>>> +
>>>> +diff --git a/src/build.cc b/src/build.cc
>>>> +index 53e4405..d8a6dff 100644
>>>> +--- a/src/build.cc
>>>> ++++ b/src/build.cc
>>>> +@@ -474,9 +474,9 @@ struct RealCommandRunner : public
>>>> CommandRunner {
>>>> + RealCommandRunner::RealCommandRunner(const BuildConfig& config) :
>>>> config_(config) {
>>>> +=C2=A0=C2=A0 max_load_average_ =3D config.max_load_average;
>>>> +=C2=A0=C2=A0 if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
>>>> +-=C2=A0=C2=A0=C2=A0 if (!tokens_->Setup(config_.parallelism_from_cm=
dline,
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
config_.verbosity =3D=3D
>>>> BuildConfig::VERBOSE,
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
max_load_average_)) {
>>>> ++=C2=A0=C2=A0=C2=A0 if (!tokens_->SetupClient(config_.parallelism_f=
rom_cmdline,
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config_.verbosity =3D=3D
>>>> BuildConfig::VERBOSE,
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max_load_average_)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tokens_ =3D NULL;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
>>>> +index eddc110..222b59b 100644
>>>> +--- a/src/subprocess_test.cc
>>>> ++++ b/src/subprocess_test.cc
>>>> +@@ -40,7 +40,8 @@ struct TestTokenPool : public TokenPool {
>>>> +=C2=A0=C2=A0 void Reserve()=C2=A0=C2=A0=C2=A0=C2=A0 {}
>>>> +=C2=A0=C2=A0 void Release()=C2=A0=C2=A0=C2=A0=C2=A0 {}
>>>> +=C2=A0=C2=A0 void Clear()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {}
>>>> +-=C2=A0 bool Setup(bool ignore_unused, bool verbose, double&
>>>> max_load_average) { return false; }
>>>> ++=C2=A0 bool SetupClient(bool ignore_unused, bool verbose,
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 double& max_load_average) { re=
turn false; }
>>>> +
>>>> + #ifdef _WIN32
>>>> +=C2=A0=C2=A0 bool _token_available;
>>>> +diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
>>>> +index 60e0552..6fb72a6 100644
>>>> +--- a/src/tokenpool-gnu-make.cc
>>>> ++++ b/src/tokenpool-gnu-make.cc
>>>> +@@ -28,9 +28,9 @@ GNUmakeTokenPool::GNUmakeTokenPool() :
>>>> available_(1), used_(0) {
>>>> + GNUmakeTokenPool::~GNUmakeTokenPool() {
>>>> + }
>>>> +
>>>> +-bool GNUmakeTokenPool::Setup(bool ignore,
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool verbose,
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 double& max_load_average) {
>>>> ++bool GNUmakeTokenPool::SetupClient(bool ignore,
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool verb=
ose,
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 double& m=
ax_load_average) {
>>>> +=C2=A0=C2=A0 const char* value =3D GetEnv("MAKEFLAGS");
>>>> +=C2=A0=C2=A0 if (!value)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>>> +diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
>>>> +index c94cca5..f4ab8d7 100644
>>>> +--- a/src/tokenpool-gnu-make.h
>>>> ++++ b/src/tokenpool-gnu-make.h
>>>> +@@ -24,7 +24,8 @@ struct GNUmakeTokenPool : public TokenPool {
>>>> +=C2=A0=C2=A0 virtual void Reserve();
>>>> +=C2=A0=C2=A0 virtual void Release();
>>>> +=C2=A0=C2=A0 virtual void Clear();
>>>> +-=C2=A0 virtual bool Setup(bool ignore, bool verbose, double&
>>>> max_load_average);
>>>> ++=C2=A0 virtual bool SetupClient(bool ignore, bool verbose,
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 double& max_load_average);
>>>> +
>>>> +=C2=A0=C2=A0 // platform specific implementation
>>>> +=C2=A0=C2=A0 virtual const char* GetEnv(const char* name) =3D 0;
>>>> +diff --git a/src/tokenpool.h b/src/tokenpool.h
>>>> +index 931c227..ce2bf48 100644
>>>> +--- a/src/tokenpool.h
>>>> ++++ b/src/tokenpool.h
>>>> +@@ -26,7 +26,8 @@ struct TokenPool {
>>>> +=C2=A0=C2=A0 virtual void Clear() =3D 0;
>>>> +
>>>> +=C2=A0=C2=A0 // returns false if token pool setup failed
>>>> +-=C2=A0 virtual bool Setup(bool ignore, bool verbose, double&
>>>> max_load_average) =3D 0;
>>>> ++=C2=A0 virtual bool SetupClient(bool ignore, bool verbose,
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 double& max_load_average) =3D 0;
>>>> +
>>>> + #ifdef _WIN32
>>>> +=C2=A0=C2=A0 virtual void WaitForTokenAvailability(HANDLE ioport) =3D=
 0;
>>>> +diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
>>>> +index 1bc1c84..9d07146 100644
>>>> +--- a/src/tokenpool_test.cc
>>>> ++++ b/src/tokenpool_test.cc
>>>> +@@ -77,7 +77,7 @@ struct TokenPoolTest : public testing::Test {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENVIRONMENT_INIT(buf_);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if ((tokens_ =3D TokenPool::Get()) !=3D NU=
LL) {
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tokens_->Setup(ignore_jobserve=
r, false, load_avg_)) {
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tokens_->SetupClient(ignore_jo=
bserver, false,
>>>> load_avg_)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tokens_ =3D NULL;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +--
>>>> +2.44.0
>>>> +
>>>> diff --git a/meta/recipes-devtools/ninja/files/0002-Add-GNU-make-
>>>> jobserver-fifo-style-client-support.patch b/meta/recipes-
>>>> devtools/ninja/files/0002-Add-GNU-make-jobserver-fifo-style-client-
>>>> support.patch
>>>> new file mode 100644
>>>> index 0000000000..770a53fbc9
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/ninja/files/0002-Add-GNU-make-
>>>> jobserver-fifo-style-client-support.patch
>>>> @@ -0,0 +1,271 @@
>>>> +From 830b7fb396383171c5fac2aae7de880ac83ce955 Mon Sep 17 00:00:00
>>>> 2001
>>>> +From: Stefan Becker<chemobejk@gmail.com>
>>>> +Date: Mon, 7 Nov 2022 20:45:27 +0200
>>>> +Subject: [PATCH 2/2] Add GNU make jobserver fifo style client
>>>> support
>>>> +MIME-Version: 1.0
>>>> +Content-Type: text/plain; charset=3DUTF-8
>>>> +Content-Transfer-Encoding: 8bit
>>>> +
>>>> +GNU make 4.4 introduced a new jobserver style "fifo" for POSIX
>>>> systems
>>>> +which passes a named pipe down to the clients.
>>>> +
>>>> +- update auth parser to recognize "fifo:<name>" format
>>>> +- open named pipe for reading and writing
>>>> +- make sure the file descriptors are closed in the destructor
>>>> +- add 2 tests that aren't compiled for WIN32
>>>> +
>>>> +Signed-off-by: Martin Hundeb=C3=B8ll<martin@geanix.com>
>>>> +Upstream-Status: Submitted
>>>> [https://github.com/Kitware/ninja/pull/2]
>>>> +---
>>>> + src/tokenpool-gnu-make-posix.cc | 46 ++++++++++++++++-
>>>> + src/tokenpool_test.cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 88
>>>> ++++++++++++++++++++++++++++++---
>>>> + 2 files changed, 127 insertions(+), 7 deletions(-)
>>>> +
>>>> +diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-
>>>> make-posix.cc
>>>> +index 8447070..a82cce4 100644
>>>> +--- a/src/tokenpool-gnu-make-posix.cc
>>>> ++++ b/src/tokenpool-gnu-make-posix.cc
>>>> +@@ -40,6 +40,7 @@ struct GNUmakeTokenPoolPosix : public
>>>> GNUmakeTokenPool {
>>>> +=C2=A0 private:
>>>> +=C2=A0=C2=A0 int rfd_;
>>>> +=C2=A0=C2=A0 int wfd_;
>>>> ++=C2=A0 bool closeFds_;
>>>> +
>>>> +=C2=A0=C2=A0 struct sigaction old_act_;
>>>> +=C2=A0=C2=A0 bool restore_;
>>>> +@@ -48,14 +49,19 @@ struct GNUmakeTokenPoolPosix : public
>>>> GNUmakeTokenPool {
>>>> +=C2=A0=C2=A0 static void CloseDupRfd(int signum);
>>>> +
>>>> +=C2=A0=C2=A0 bool CheckFd(int fd);
>>>> ++=C2=A0 bool CheckFifo(const char* fifo);
>>>> +=C2=A0=C2=A0 bool SetAlarmHandler();
>>>> + };
>>>> +
>>>> +-GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-
>>>> 1), restore_(false) {
>>>> ++GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-
>>>> 1), closeFds_(false), restore_(false) {
>>>> + }
>>>> +
>>>> + GNUmakeTokenPoolPosix::~GNUmakeTokenPoolPosix() {
>>>> +=C2=A0=C2=A0 Clear();
>>>> ++=C2=A0 if (closeFds_) {
>>>> ++=C2=A0=C2=A0=C2=A0 close(wfd_);
>>>> ++=C2=A0=C2=A0=C2=A0 close(rfd_);
>>>> ++=C2=A0 }
>>>> +=C2=A0=C2=A0 if (restore_)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 sigaction(SIGALRM, &old_act_, NULL);
>>>> + }
>>>> +@@ -69,6 +75,36 @@ bool GNUmakeTokenPoolPosix::CheckFd(int fd) {
>>>> +=C2=A0=C2=A0 return true;
>>>> + }
>>>> +
>>>> ++bool GNUmakeTokenPoolPosix::CheckFifo(const char* fifo) {
>>>> ++=C2=A0 // remove possible junk from end of fifo name
>>>> ++=C2=A0 char *filename =3D strdup(fifo);
>>>> ++=C2=A0 char *end;
>>>> ++=C2=A0 if ((end =3D strchr(filename, ' ')) !=3D NULL) {
>>>> ++=C2=A0=C2=A0=C2=A0 *end =3D '\0';
>>>> ++=C2=A0 }
>>>> ++
>>>> ++=C2=A0 int rfd =3D open(filename, O_RDONLY);
>>>> ++=C2=A0 if (rfd < 0) {
>>>> ++=C2=A0=C2=A0=C2=A0 free(filename);
>>>> ++=C2=A0=C2=A0=C2=A0 return false;
>>>> ++=C2=A0 }
>>>> ++
>>>> ++=C2=A0 int wfd =3D open(filename, O_WRONLY);
>>>> ++=C2=A0 if (wfd < 0) {
>>>> ++=C2=A0=C2=A0=C2=A0 close(rfd);
>>>> ++=C2=A0=C2=A0=C2=A0 free(filename);
>>>> ++=C2=A0=C2=A0=C2=A0 return false;
>>>> ++=C2=A0 }
>>>> ++
>>>> ++=C2=A0 free(filename);
>>>> ++
>>>> ++=C2=A0 rfd_ =3D rfd;
>>>> ++=C2=A0 wfd_ =3D wfd;
>>>> ++=C2=A0 closeFds_ =3D true;
>>>> ++
>>>> ++=C2=A0 return true;
>>>> ++}
>>>> ++
>>>> + int GNUmakeTokenPoolPosix::dup_rfd_ =3D -1;
>>>> +
>>>> + void GNUmakeTokenPoolPosix::CloseDupRfd(int signum) {
>>>> +@@ -89,6 +125,13 @@ bool GNUmakeTokenPoolPosix::SetAlarmHandler()
>>>> {
>>>> + }
>>>> +
>>>> + bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
>>>> ++=C2=A0 // check for jobserver-fifo style
>>>> ++=C2=A0 const char* fifo;
>>>> ++=C2=A0 if (((fifo =3D strstr(jobserver, "=3Dfifo:")) !=3D NULL) &&
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CheckFifo(fifo + 6))
>>>> ++=C2=A0=C2=A0=C2=A0 return SetAlarmHandler();
>>>> ++
>>>> ++=C2=A0 // check for legacy simple pipe style
>>>> +=C2=A0=C2=A0 int rfd =3D -1;
>>>> +=C2=A0=C2=A0 int wfd =3D -1;
>>>> +=C2=A0=C2=A0 if ((sscanf(jobserver, "%*[^=3D]=3D%d,%d", &rfd, &wfd)=
 =3D=3D 2) &&
>>>> +@@ -100,6 +143,7 @@ bool GNUmakeTokenPoolPosix::ParseAuth(const
>>>> char* jobserver) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>> +=C2=A0=C2=A0 }
>>>> +
>>>> ++=C2=A0 // some jobserver style we don't support
>>>> +=C2=A0=C2=A0 return false;
>>>> + }
>>>> +
>>>> +diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
>>>> +index 9d07146..e15da6c 100644
>>>> +--- a/src/tokenpool_test.cc
>>>> ++++ b/src/tokenpool_test.cc
>>>> +@@ -19,7 +19,10 @@
>>>> + #ifdef _WIN32
>>>> + #include <windows.h>
>>>> + #else
>>>> ++#include <fcntl.h>
>>>> + #include <unistd.h>
>>>> ++#include <sys/types.h>
>>>> ++#include <sys/stat.h>
>>>> + #endif
>>>> +
>>>> + #include <stdio.h>
>>>> +@@ -35,6 +38,8 @@
>>>> + #define AUTH_FORMAT(tmpl)=C2=A0=C2=A0 "foo " tmpl "=3D%d,%d bar"
>>>> + #define ENVIRONMENT_CLEAR() unsetenv("MAKEFLAGS")
>>>> + #define ENVIRONMENT_INIT(v) setenv("MAKEFLAGS", v, true)
>>>> ++
>>>> ++#define FIFO_NAME "ninja-test-tokenpool-fifo"
>>>> + #endif
>>>> +
>>>> + namespace {
>>>> +@@ -60,11 +65,24 @@ struct TokenPoolTest : public testing::Test {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 semaphore_name_ =3D SEMAPHORE_NAME;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if ((semaphore_ =3D CreateSemaphore(0, 0, =
2, SEMAPHORE_NAME))
>>>> =3D=3D NULL)
>>>> + #else
>>>> ++=C2=A0=C2=A0=C2=A0 if (mkfifo(FIFO_NAME, 0600) < 0) {
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_TRUE(false);
>>>> ++=C2=A0=C2=A0=C2=A0 }
>>>> ++
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (pipe(fds_) < 0)
>>>> + #endif
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_TRUE(false);
>>>> +=C2=A0=C2=A0 }
>>>> +
>>>> ++=C2=A0 void GetPool(bool ignore_jobserver) {
>>>> ++=C2=A0=C2=A0=C2=A0 if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tokens_->SetupClient(ignore_jo=
bserver, false,
>>>> load_avg_)) {
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tokens_ =3D NULL;
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> ++=C2=A0=C2=A0=C2=A0 }
>>>> ++=C2=A0 }
>>>> ++
>>>> +=C2=A0=C2=A0 void CreatePool(const char* format, bool ignore_jobser=
ver =3D
>>>> false) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (format) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sprintf(buf_, format,
>>>> +@@ -76,18 +94,30 @@ struct TokenPoolTest : public testing::Test {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENVIRONMENT_INIT(buf_);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +-=C2=A0=C2=A0=C2=A0 if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tokens_->SetupClient(ignore_jo=
bserver, false,
>>>> load_avg_)) {
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tokens_ =3D NULL;
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +-=C2=A0=C2=A0=C2=A0 }
>>>> ++=C2=A0=C2=A0=C2=A0 GetPool(ignore_jobserver);
>>>> +=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0 void CreateDefaultPool() {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 CreatePool(AUTH_FORMAT("--jobserver-auth")=
);
>>>> +=C2=A0=C2=A0 }
>>>> +
>>>> ++#ifndef _WIN32
>>>> ++=C2=A0 void CreateFifoPool() {
>>>> ++=C2=A0=C2=A0=C2=A0 // close simple pipe fds...
>>>> ++=C2=A0=C2=A0=C2=A0 close(fds_[0]);
>>>> ++=C2=A0=C2=A0=C2=A0 close(fds_[1]);
>>>> ++
>>>> ++=C2=A0=C2=A0=C2=A0 // ... and open named pipe instead
>>>> ++=C2=A0=C2=A0=C2=A0 if ((fds_[0] =3D open(FIFO_NAME, O_RDONLY|O_NON=
BLOCK)) < 0)
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_TRUE(false);
>>>> ++=C2=A0=C2=A0=C2=A0 if ((fds_[1] =3D open(FIFO_NAME, O_WRONLY)) < 0=
)
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_TRUE(false);
>>>> ++
>>>> ++=C2=A0=C2=A0=C2=A0 ENVIRONMENT_INIT("foo --jobserver-auth=3Dfifo:"=
 FIFO_NAME "
>>>> bar");
>>>> ++=C2=A0=C2=A0=C2=A0 GetPool(false);
>>>> ++=C2=A0 }
>>>> ++#endif
>>>> ++
>>>> +=C2=A0=C2=A0 virtual void TearDown() {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (tokens_)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delete tokens_;
>>>> +@@ -96,6 +126,7 @@ struct TokenPoolTest : public testing::Test {
>>>> + #else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 close(fds_[0]);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 close(fds_[1]);
>>>> ++=C2=A0=C2=A0=C2=A0 unlink(FIFO_NAME);
>>>> + #endif
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ENVIRONMENT_CLEAR();
>>>> +=C2=A0=C2=A0 }
>>>> +@@ -167,6 +198,15 @@ TEST_F(TokenPoolTest, MonitorFD) {
>>>> +
>>>> +=C2=A0=C2=A0 EXPECT_EQ(fds_[0], tokens_->GetMonitorFd());
>>>> + }
>>>> ++
>>>> ++TEST_F(TokenPoolTest, MonitorFDFifo) {
>>>> ++=C2=A0 CreateFifoPool();
>>>> ++
>>>> ++=C2=A0 ASSERT_NE(NULL, tokens_);
>>>> ++=C2=A0 EXPECT_EQ(kLoadAverageDefault, load_avg_);
>>>> ++
>>>> ++=C2=A0 EXPECT_NE(-1, tokens_->GetMonitorFd());
>>>> ++}
>>>> + #endif
>>>> +
>>>> + TEST_F(TokenPoolTest, ImplicitToken) {
>>>> +@@ -226,6 +266,42 @@ TEST_F(TokenPoolTest, TwoTokens) {
>>>> +=C2=A0=C2=A0 EXPECT_TRUE(tokens_->Acquire());
>>>> + }
>>>> +
>>>> ++#ifndef _WIN32
>>>> ++TEST_F(TokenPoolTest, TwoTokensFifo) {
>>>> ++=C2=A0 CreateFifoPool();
>>>> ++
>>>> ++=C2=A0 ASSERT_NE(NULL, tokens_);
>>>> ++=C2=A0 EXPECT_EQ(kLoadAverageDefault, load_avg_);
>>>> ++
>>>> ++=C2=A0 // implicit token
>>>> ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
>>>> ++=C2=A0 tokens_->Reserve();
>>>> ++=C2=A0 EXPECT_FALSE(tokens_->Acquire());
>>>> ++
>>>> ++=C2=A0 // jobserver offers 2nd token
>>>> ++=C2=A0 char test_tokens[1] =3D { '+' };
>>>> ++=C2=A0 ASSERT_EQ(1u, write(fds_[1], test_tokens,
>>>> sizeof(test_tokens)));
>>>> ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
>>>> ++=C2=A0 tokens_->Reserve();
>>>> ++=C2=A0 EXPECT_FALSE(tokens_->Acquire());
>>>> ++
>>>> ++=C2=A0 // release 2nd token
>>>> ++=C2=A0 tokens_->Release();
>>>> ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
>>>> ++
>>>> ++=C2=A0 // release implicit token - must return 2nd token back to
>>>> jobserver
>>>> ++=C2=A0 tokens_->Release();
>>>> ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
>>>> ++
>>>> ++=C2=A0 // there must be one token available
>>>> ++=C2=A0 EXPECT_EQ(1u, read(fds_[0], buf_, sizeof(buf_)));
>>>> ++=C2=A0 EXPECT_EQ(test_tokens[0], buf_[0]);
>>>> ++
>>>> ++=C2=A0 // implicit token
>>>> ++=C2=A0 EXPECT_TRUE(tokens_->Acquire());
>>>> ++}
>>>> ++#endif
>>>> ++
>>>> + TEST_F(TokenPoolTest, Clear) {
>>>> +=C2=A0=C2=A0 CreateDefaultPool();
>>>> +
>>>> +--
>>>> +2.44.0
>>>> +
>>>> diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
>>>> b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
>>>> index 8e297ec4d4..dbff2e191a 100644
>>>> --- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
>>>> +++ b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
>>>> @@ -6,9 +6,13 @@ LIC_FILES_CHKSUM =3D
>>>> "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52e"
>>>>  =20
>>>>  =C2=A0DEPENDS =3D "re2c-native ninja-native"
>>>>  =20
>>>> -SRCREV =3D "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
>>>> +SRCREV =3D "95dee2a91d96c409d54f9fa0b70ea9aa2bdf8e63"
>>>>  =20
>>>> -SRC_URI =3D "git://github.com/ninja-
>>>> build/ninja.git;branch=3Drelease;protocol=3Dhttps"
>>>> +SRC_URI =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 git://github.com/kitware/ninja.git;branch=3Dkitw=
are-staged-
>>>> features;protocol=3Dhttps \
>>>> +file://0001-Rename-TokenPool-Setup-to-SetupClient.patch=C2=A0\
>>>> +
>>>> file://0002-Add-GNU-make-jobserver-fifo-style-client-support.patch=20
>>>> \
>>>> +"
>>>>  =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
>>>>  =20
>>>>  =C2=A0S =3D "${WORKDIR}/git"
>>>> --=20
>>>> 2.44.0
>>>>
>>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#202897):https://lists.openembedded.org/g/openembed=
ded-core/message/202897
>> Mute This Topic:https://lists.openembedded.org/mt/105326967/3617179
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------P0N8ThgQFrN9K0JkXaoi1C8p
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AI1XxPn004657

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-08-02 6:41 a.m., Alexandre
      Belloni wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:2024080210413291c61aec@mail.loc=
al">
      <pre wrap=3D"" class=3D"moz-quote-pre">On 02/08/2024 12:24:06+0200,=
 Martin Hundeb?ll wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Hi Alexandre,

I see you keep carrying these patches. I'm still working with ninja
upstream to add jobserver support there[1]. I was planning to redo
these patches once ninja merges that. But I can do a respin with my
patches added to ninja if you like?

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/ninja-b=
uild/ninja/pull/2450">https://github.com/ninja-build/ninja/pull/2450</a>
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">I carry them so they get som=
e testing, I can drop until you submit the
new version.</pre>
    </blockquote>
    <p>Hi Martin, et. al.<br>
    </p>
    <p>I'm going to do some experimenting with the job server patches
      for a <br>
      talk that somehow got approved for the 2024.12 YP summit!</p>
    <p>&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://pr=
etalx.com/yocto-project-summit-2024-12/talk/WGPUTX/">https://pretalx.com/=
yocto-project-summit-2024-12/talk/WGPUTX/</a></p>
    <p>As expected, the patch doesn't apply with all that has changed
      since April.</p>
    <p>Do you have a a branch that you are keeping updated.<br>
      If so can you same me some time otherwise, I can rebase and fix
      things up.<br>
    </p>
    <p>I'll of course give you all the credit for the real work.<br>
      I plan to mention the performance/behaviour improvements that you
      mentioned in your cover letter:<br>
    </p>
    <p>--- &nbsp; <br>
    </p>
    <pre wrap=3D"" class=3D"moz-quote-pre">On build machines shared by mu=
ltiple users, a single jobserver can be
shared between multiple builds (using the JOBSERVER_FIFO variable).
Running the above build in two different build directories at the same
time gives a ~12% improvement (43:17 -&gt; 37:55).

Finally, the memory pressure from e.g. compiling multiple c++ based
projects is also reduced. In our case, a cloud based build machine (with
32 cores and 32GB RAM) fails to compile llvm-rust-native (in parallel to
nodejs) without the jobserver due to a lack of memory.
</pre>
    <p>---</p>
    <p>Is there anything else you'd like people to know about?<br>
      <br>
      Does anyone else have jobserver, BB_PRESSURE_*, BB_LOADFACTOR_MAX
      use cases or benchmarks <br>
      that they'd like to share with the YP communtiy? All input is
      welcome and appreciated.<br>
    </p>
    <p>Thanks,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:2024080210413291c61aec@mail.loc=
al">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, 2024-04-25 at 13:3=
0 +0200, Alexandre Belloni wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">Hello,

This patch doesn't apply on master anymore because ninja has been
updated.


On 04/04/2024 13:16:11+0200, Martin Hundeb?ll wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"" class=3D"moz-quote-pre">Ninja doesn't (yet) su=
pport the GNU Make jobserver out of the box,
but
there is a pull request adding that support[1]. Since that pull
request
(and its derived three-part pull requests) seem to be ignored by
upstream, kitware (creator/maintainer of cmake) has created a
fork[2]
only to carry the jobserver patches. Change the source uri to point
at
the kitware fork of ninja, and add two patches from the original
pull
request to also support the new-style fifo jobserver feature.

Note that the kitware fork of ninja is also used by buildroot[3].

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/ninja-b=
uild/ninja/pull/2263">https://github.com/ninja-build/ninja/pull/2263</a>
[2] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/Kitware=
/ninja">https://github.com/Kitware/ninja</a>
[3]
<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.com/buildroot.o=
rg/buildroot/-/blob/master/package/ninja/ninja.mk">https://gitlab.com/bui=
ldroot.org/buildroot/-/blob/master/package/ninja/ninja.mk</a>

Signed-off-by: Martin Hundeb=C3=B8ll <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:martin@geanix.com">&lt;martin@geanix.com&gt;</a>
---
&nbsp;...ename-TokenPool-Setup-to-SetupClient.patch | 113 ++++++++
&nbsp;...-jobserver-fifo-style-client-support.patch | 271
++++++++++++++++++
&nbsp;meta/recipes-devtools/ninja/ninja_1.11.1.bb&nbsp;&nbsp; |&nbsp;&nbs=
p; 8 +-
&nbsp;3 files changed, 390 insertions(+), 2 deletions(-)
&nbsp;create mode 100644 meta/recipes-devtools/ninja/files/0001-Rename-
TokenPool-Setup-to-SetupClient.patch
&nbsp;create mode 100644 meta/recipes-devtools/ninja/files/0002-Add-GNU-
make-jobserver-fifo-style-client-support.patch

diff --git a/meta/recipes-devtools/ninja/files/0001-Rename-
TokenPool-Setup-to-SetupClient.patch b/meta/recipes-
devtools/ninja/files/0001-Rename-TokenPool-Setup-to-
SetupClient.patch
new file mode 100644
index 0000000000..a503f8c75f
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0001-Rename-TokenPool-
Setup-to-SetupClient.patch
@@ -0,0 +1,113 @@
+From f5642d8b49688dfc84679451b531d92f3b6e7cb0 Mon Sep 17 00:00:00
2001
+From: Stefan Becker <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ch=
emobejk@gmail.com">&lt;chemobejk@gmail.com&gt;</a>
+Date: Sat, 15 Dec 2018 19:29:42 +0200
+Subject: [PATCH 1/2] Rename TokenPool::Setup() to SetupClient()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Make space to add new API to set up token pool master.
+
+Signed-off-by: Martin Hundeb=C3=B8ll <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:martin@geanix.com">&lt;martin@geanix.com&gt;</a>
+Upstream-Status: Submitted
[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/Kitware/ni=
nja/pull/2">https://github.com/Kitware/ninja/pull/2</a>]
+---
+ src/build.cc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 6 +++---
+ src/subprocess_test.cc&nbsp;&nbsp;&nbsp; | 3 ++-
+ src/tokenpool-gnu-make.cc | 6 +++---
+ src/tokenpool-gnu-make.h&nbsp; | 3 ++-
+ src/tokenpool.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 3 ++-
+ src/tokenpool_test.cc&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-
+ 6 files changed, 13 insertions(+), 10 deletions(-)
+
+diff --git a/src/build.cc b/src/build.cc
+index 53e4405..d8a6dff 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -474,9 +474,9 @@ struct RealCommandRunner : public
CommandRunner {
+ RealCommandRunner::RealCommandRunner(const BuildConfig&amp; config) :
config_(config) {
+&nbsp;&nbsp; max_load_average_ =3D config.max_load_average;
+&nbsp;&nbsp; if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
+-&nbsp;&nbsp;&nbsp; if (!tokens_-&gt;Setup(config_.parallelism_from_cmdl=
ine,
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; confi=
g_.verbosity =3D=3D
BuildConfig::VERBOSE,
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_l=
oad_average_)) {
++&nbsp;&nbsp;&nbsp; if (!tokens_-&gt;SetupClient(config_.parallelism_fro=
m_cmdline,
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config_.verbosity =3D=3D
BuildConfig::VERBOSE,
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_load_average_)) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete tokens_;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tokens_ =3D NULL;
+&nbsp;&nbsp;&nbsp;&nbsp; }
+diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
+index eddc110..222b59b 100644
+--- a/src/subprocess_test.cc
++++ b/src/subprocess_test.cc
+@@ -40,7 +40,8 @@ struct TestTokenPool : public TokenPool {
+&nbsp;&nbsp; void Reserve()&nbsp;&nbsp;&nbsp;&nbsp; {}
+&nbsp;&nbsp; void Release()&nbsp;&nbsp;&nbsp;&nbsp; {}
+&nbsp;&nbsp; void Clear()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {}
+-&nbsp; bool Setup(bool ignore_unused, bool verbose, double&amp;
max_load_average) { return false; }
++&nbsp; bool SetupClient(bool ignore_unused, bool verbose,
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; double&amp; max_load_average) { ret=
urn false; }
+=20
+ #ifdef _WIN32
+&nbsp;&nbsp; bool _token_available;
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index 60e0552..6fb72a6 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -28,9 +28,9 @@ GNUmakeTokenPool::GNUmakeTokenPool() :
available_(1), used_(0) {
+ GNUmakeTokenPool::~GNUmakeTokenPool() {
+ }
+=20
+-bool GNUmakeTokenPool::Setup(bool ignore,
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; bool verbose,
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; double&amp; max_load_average) {
++bool GNUmakeTokenPool::SetupClient(bool ignore,
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool verbose=
,
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; double&amp; =
max_load_average) {
+&nbsp;&nbsp; const char* value =3D GetEnv(&quot;MAKEFLAGS&quot;);
+&nbsp;&nbsp; if (!value)
+&nbsp;&nbsp;&nbsp;&nbsp; return false;
+diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
+index c94cca5..f4ab8d7 100644
+--- a/src/tokenpool-gnu-make.h
++++ b/src/tokenpool-gnu-make.h
+@@ -24,7 +24,8 @@ struct GNUmakeTokenPool : public TokenPool {
+&nbsp;&nbsp; virtual void Reserve();
+&nbsp;&nbsp; virtual void Release();
+&nbsp;&nbsp; virtual void Clear();
+-&nbsp; virtual bool Setup(bool ignore, bool verbose, double&amp;
max_load_average);
++&nbsp; virtual bool SetupClient(bool ignore, bool verbose,
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; double&amp; max_load_average);
+=20
+&nbsp;&nbsp; // platform specific implementation
+&nbsp;&nbsp; virtual const char* GetEnv(const char* name) =3D 0;
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index 931c227..ce2bf48 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -26,7 +26,8 @@ struct TokenPool {
+&nbsp;&nbsp; virtual void Clear() =3D 0;
+=20
+&nbsp;&nbsp; // returns false if token pool setup failed
+-&nbsp; virtual bool Setup(bool ignore, bool verbose, double&amp;
max_load_average) =3D 0;
++&nbsp; virtual bool SetupClient(bool ignore, bool verbose,
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; double&amp; max_load_average) =3D 0;
+=20
+ #ifdef _WIN32
+&nbsp;&nbsp; virtual void WaitForTokenAvailability(HANDLE ioport) =3D 0;
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+index 1bc1c84..9d07146 100644
+--- a/src/tokenpool_test.cc
++++ b/src/tokenpool_test.cc
+@@ -77,7 +77,7 @@ struct TokenPoolTest : public testing::Test {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENVIRONMENT_INIT(buf_);
+&nbsp;&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp;&nbsp; if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!tokens_-&gt;Setup(ignore_jobserver,=
 false, load_avg_)) {
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!tokens_-&gt;SetupClient(ignore_jobs=
erver, false,
load_avg_)) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete tokens_;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tokens_ =3D NULL;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0002-Add-GNU-make-
jobserver-fifo-style-client-support.patch b/meta/recipes-
devtools/ninja/files/0002-Add-GNU-make-jobserver-fifo-style-client-
support.patch
new file mode 100644
index 0000000000..770a53fbc9
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0002-Add-GNU-make-
jobserver-fifo-style-client-support.patch
@@ -0,0 +1,271 @@
+From 830b7fb396383171c5fac2aae7de880ac83ce955 Mon Sep 17 00:00:00
2001
+From: Stefan Becker <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ch=
emobejk@gmail.com">&lt;chemobejk@gmail.com&gt;</a>
+Date: Mon, 7 Nov 2022 20:45:27 +0200
+Subject: [PATCH 2/2] Add GNU make jobserver fifo style client
support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+GNU make 4.4 introduced a new jobserver style &quot;fifo&quot; for POSIX
systems
+which passes a named pipe down to the clients.
+
+- update auth parser to recognize &quot;fifo:&lt;name&gt;&quot; format
+- open named pipe for reading and writing
+- make sure the file descriptors are closed in the destructor
+- add 2 tests that aren't compiled for WIN32
+
+Signed-off-by: Martin Hundeb=C3=B8ll <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:martin@geanix.com">&lt;martin@geanix.com&gt;</a>
+Upstream-Status: Submitted
[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/Kitware/ni=
nja/pull/2">https://github.com/Kitware/ninja/pull/2</a>]
+---
+ src/tokenpool-gnu-make-posix.cc | 46 ++++++++++++++++-
+ src/tokenpool_test.cc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | 88
++++++++++++++++++++++++++++++---
+ 2 files changed, 127 insertions(+), 7 deletions(-)
+
+diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-
make-posix.cc
+index 8447070..a82cce4 100644
+--- a/src/tokenpool-gnu-make-posix.cc
++++ b/src/tokenpool-gnu-make-posix.cc
+@@ -40,6 +40,7 @@ struct GNUmakeTokenPoolPosix : public
GNUmakeTokenPool {
+&nbsp; private:
+&nbsp;&nbsp; int rfd_;
+&nbsp;&nbsp; int wfd_;
++&nbsp; bool closeFds_;
+=20
+&nbsp;&nbsp; struct sigaction old_act_;
+&nbsp;&nbsp; bool restore_;
+@@ -48,14 +49,19 @@ struct GNUmakeTokenPoolPosix : public
GNUmakeTokenPool {
+&nbsp;&nbsp; static void CloseDupRfd(int signum);
+=20
+&nbsp;&nbsp; bool CheckFd(int fd);
++&nbsp; bool CheckFifo(const char* fifo);
+&nbsp;&nbsp; bool SetAlarmHandler();
+ };
+=20
+-GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-
1), restore_(false) {
++GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-
1), closeFds_(false), restore_(false) {
+ }
+=20
+ GNUmakeTokenPoolPosix::~GNUmakeTokenPoolPosix() {
+&nbsp;&nbsp; Clear();
++&nbsp; if (closeFds_) {
++&nbsp;&nbsp;&nbsp; close(wfd_);
++&nbsp;&nbsp;&nbsp; close(rfd_);
++&nbsp; }
+&nbsp;&nbsp; if (restore_)
+&nbsp;&nbsp;&nbsp;&nbsp; sigaction(SIGALRM, &amp;old_act_, NULL);
+ }
+@@ -69,6 +75,36 @@ bool GNUmakeTokenPoolPosix::CheckFd(int fd) {
+&nbsp;&nbsp; return true;
+ }
+=20
++bool GNUmakeTokenPoolPosix::CheckFifo(const char* fifo) {
++&nbsp; // remove possible junk from end of fifo name
++&nbsp; char *filename =3D strdup(fifo);
++&nbsp; char *end;
++&nbsp; if ((end =3D strchr(filename, ' ')) !=3D NULL) {
++&nbsp;&nbsp;&nbsp; *end =3D '\0';
++&nbsp; }
++
++&nbsp; int rfd =3D open(filename, O_RDONLY);
++&nbsp; if (rfd &lt; 0) {
++&nbsp;&nbsp;&nbsp; free(filename);
++&nbsp;&nbsp;&nbsp; return false;
++&nbsp; }
++
++&nbsp; int wfd =3D open(filename, O_WRONLY);
++&nbsp; if (wfd &lt; 0) {
++&nbsp;&nbsp;&nbsp; close(rfd);
++&nbsp;&nbsp;&nbsp; free(filename);
++&nbsp;&nbsp;&nbsp; return false;
++&nbsp; }
++
++&nbsp; free(filename);
++
++&nbsp; rfd_ =3D rfd;
++&nbsp; wfd_ =3D wfd;
++&nbsp; closeFds_ =3D true;
++
++&nbsp; return true;
++}
++
+ int GNUmakeTokenPoolPosix::dup_rfd_ =3D -1;
+=20
+ void GNUmakeTokenPoolPosix::CloseDupRfd(int signum) {
+@@ -89,6 +125,13 @@ bool GNUmakeTokenPoolPosix::SetAlarmHandler()
{
+ }
+=20
+ bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
++&nbsp; // check for jobserver-fifo style
++&nbsp; const char* fifo;
++&nbsp; if (((fifo =3D strstr(jobserver, &quot;=3Dfifo:&quot;)) !=3D NUL=
L) &amp;&amp;
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CheckFifo(fifo + 6))
++&nbsp;&nbsp;&nbsp; return SetAlarmHandler();
++
++&nbsp; // check for legacy simple pipe style
+&nbsp;&nbsp; int rfd =3D -1;
+&nbsp;&nbsp; int wfd =3D -1;
+&nbsp;&nbsp; if ((sscanf(jobserver, &quot;%*[^=3D]=3D%d,%d&quot;, &amp;r=
fd, &amp;wfd) =3D=3D 2) &amp;&amp;
+@@ -100,6 +143,7 @@ bool GNUmakeTokenPoolPosix::ParseAuth(const
char* jobserver) {
+&nbsp;&nbsp;&nbsp;&nbsp; return true;
+&nbsp;&nbsp; }
+=20
++&nbsp; // some jobserver style we don't support
+&nbsp;&nbsp; return false;
+ }
+=20
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+index 9d07146..e15da6c 100644
+--- a/src/tokenpool_test.cc
++++ b/src/tokenpool_test.cc
+@@ -19,7 +19,10 @@
+ #ifdef _WIN32
+ #include &lt;windows.h&gt;
+ #else
++#include &lt;fcntl.h&gt;
+ #include &lt;unistd.h&gt;
++#include &lt;sys/types.h&gt;
++#include &lt;sys/stat.h&gt;
+ #endif
+=20
+ #include &lt;stdio.h&gt;
+@@ -35,6 +38,8 @@
+ #define AUTH_FORMAT(tmpl)&nbsp;&nbsp; &quot;foo &quot; tmpl &quot;=3D%d=
,%d bar&quot;
+ #define ENVIRONMENT_CLEAR() unsetenv(&quot;MAKEFLAGS&quot;)
+ #define ENVIRONMENT_INIT(v) setenv(&quot;MAKEFLAGS&quot;, v, true)
++
++#define FIFO_NAME &quot;ninja-test-tokenpool-fifo&quot;
+ #endif
+=20
+ namespace {
+@@ -60,11 +65,24 @@ struct TokenPoolTest : public testing::Test {
+&nbsp;&nbsp;&nbsp;&nbsp; semaphore_name_ =3D SEMAPHORE_NAME;
+&nbsp;&nbsp;&nbsp;&nbsp; if ((semaphore_ =3D CreateSemaphore(0, 0, 2, SE=
MAPHORE_NAME))
=3D=3D NULL)
+ #else
++&nbsp;&nbsp;&nbsp; if (mkfifo(FIFO_NAME, 0600) &lt; 0) {
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT_TRUE(false);
++&nbsp;&nbsp;&nbsp; }
++
+&nbsp;&nbsp;&nbsp;&nbsp; if (pipe(fds_) &lt; 0)
+ #endif
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT_TRUE(false);
+&nbsp;&nbsp; }
+=20
++&nbsp; void GetPool(bool ignore_jobserver) {
++&nbsp;&nbsp;&nbsp; if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!tokens_-&gt;SetupClient(ignore_jobs=
erver, false,
load_avg_)) {
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete tokens_;
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tokens_ =3D NULL;
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
++&nbsp;&nbsp;&nbsp; }
++&nbsp; }
++
+&nbsp;&nbsp; void CreatePool(const char* format, bool ignore_jobserver =3D
false) {
+&nbsp;&nbsp;&nbsp;&nbsp; if (format) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sprintf(buf_, format,
+@@ -76,18 +94,30 @@ struct TokenPoolTest : public testing::Test {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENVIRONMENT_INIT(buf_);
+&nbsp;&nbsp;&nbsp;&nbsp; }
+-&nbsp;&nbsp;&nbsp; if ((tokens_ =3D TokenPool::Get()) !=3D NULL) {
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!tokens_-&gt;SetupClient(ignore_jobs=
erver, false,
load_avg_)) {
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete tokens_;
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tokens_ =3D NULL;
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+-&nbsp;&nbsp;&nbsp; }
++&nbsp;&nbsp;&nbsp; GetPool(ignore_jobserver);
+&nbsp;&nbsp; }
+=20
+&nbsp;&nbsp; void CreateDefaultPool() {
+&nbsp;&nbsp;&nbsp;&nbsp; CreatePool(AUTH_FORMAT(&quot;--jobserver-auth&q=
uot;));
+&nbsp;&nbsp; }
+=20
++#ifndef _WIN32
++&nbsp; void CreateFifoPool() {
++&nbsp;&nbsp;&nbsp; // close simple pipe fds...
++&nbsp;&nbsp;&nbsp; close(fds_[0]);
++&nbsp;&nbsp;&nbsp; close(fds_[1]);
++
++&nbsp;&nbsp;&nbsp; // ... and open named pipe instead
++&nbsp;&nbsp;&nbsp; if ((fds_[0] =3D open(FIFO_NAME, O_RDONLY|O_NONBLOCK=
)) &lt; 0)
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT_TRUE(false);
++&nbsp;&nbsp;&nbsp; if ((fds_[1] =3D open(FIFO_NAME, O_WRONLY)) &lt; 0)
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ASSERT_TRUE(false);
++
++&nbsp;&nbsp;&nbsp; ENVIRONMENT_INIT(&quot;foo --jobserver-auth=3Dfifo:&=
quot; FIFO_NAME &quot;
bar&quot;);
++&nbsp;&nbsp;&nbsp; GetPool(false);
++&nbsp; }
++#endif
++
+&nbsp;&nbsp; virtual void TearDown() {
+&nbsp;&nbsp;&nbsp;&nbsp; if (tokens_)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delete tokens_;
+@@ -96,6 +126,7 @@ struct TokenPoolTest : public testing::Test {
+ #else
+&nbsp;&nbsp;&nbsp;&nbsp; close(fds_[0]);
+&nbsp;&nbsp;&nbsp;&nbsp; close(fds_[1]);
++&nbsp;&nbsp;&nbsp; unlink(FIFO_NAME);
+ #endif
+&nbsp;&nbsp;&nbsp;&nbsp; ENVIRONMENT_CLEAR();
+&nbsp;&nbsp; }
+@@ -167,6 +198,15 @@ TEST_F(TokenPoolTest, MonitorFD) {
+=20
+&nbsp;&nbsp; EXPECT_EQ(fds_[0], tokens_-&gt;GetMonitorFd());
+ }
++
++TEST_F(TokenPoolTest, MonitorFDFifo) {
++&nbsp; CreateFifoPool();
++
++&nbsp; ASSERT_NE(NULL, tokens_);
++&nbsp; EXPECT_EQ(kLoadAverageDefault, load_avg_);
++
++&nbsp; EXPECT_NE(-1, tokens_-&gt;GetMonitorFd());
++}
+ #endif
+=20
+ TEST_F(TokenPoolTest, ImplicitToken) {
+@@ -226,6 +266,42 @@ TEST_F(TokenPoolTest, TwoTokens) {
+&nbsp;&nbsp; EXPECT_TRUE(tokens_-&gt;Acquire());
+ }
+=20
++#ifndef _WIN32
++TEST_F(TokenPoolTest, TwoTokensFifo) {
++&nbsp; CreateFifoPool();
++
++&nbsp; ASSERT_NE(NULL, tokens_);
++&nbsp; EXPECT_EQ(kLoadAverageDefault, load_avg_);
++
++&nbsp; // implicit token
++&nbsp; EXPECT_TRUE(tokens_-&gt;Acquire());
++&nbsp; tokens_-&gt;Reserve();
++&nbsp; EXPECT_FALSE(tokens_-&gt;Acquire());
++
++&nbsp; // jobserver offers 2nd token
++&nbsp; char test_tokens[1] =3D { '+' };
++&nbsp; ASSERT_EQ(1u, write(fds_[1], test_tokens,
sizeof(test_tokens)));
++&nbsp; EXPECT_TRUE(tokens_-&gt;Acquire());
++&nbsp; tokens_-&gt;Reserve();
++&nbsp; EXPECT_FALSE(tokens_-&gt;Acquire());
++
++&nbsp; // release 2nd token
++&nbsp; tokens_-&gt;Release();
++&nbsp; EXPECT_TRUE(tokens_-&gt;Acquire());
++
++&nbsp; // release implicit token - must return 2nd token back to
jobserver
++&nbsp; tokens_-&gt;Release();
++&nbsp; EXPECT_TRUE(tokens_-&gt;Acquire());
++
++&nbsp; // there must be one token available
++&nbsp; EXPECT_EQ(1u, read(fds_[0], buf_, sizeof(buf_)));
++&nbsp; EXPECT_EQ(test_tokens[0], buf_[0]);
++
++&nbsp; // implicit token
++&nbsp; EXPECT_TRUE(tokens_-&gt;Acquire());
++}
++#endif
++
+ TEST_F(TokenPoolTest, Clear) {
+&nbsp;&nbsp; CreateDefaultPool();
+=20
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
index 8e297ec4d4..dbff2e191a 100644
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
@@ -6,9 +6,13 @@ LIC_FILES_CHKSUM =3D
<a class=3D"moz-txt-link-rfc2396E" href=3D"file://COPYING;md5=3Da81586a64=
ad4e476c791cda7e2f2c52e">&quot;file://COPYING;md5=3Da81586a64ad4e476c791c=
da7e2f2c52e&quot;</a>
&nbsp;
&nbsp;DEPENDS =3D &quot;re2c-native ninja-native&quot;
&nbsp;
-SRCREV =3D &quot;a524bf3f6bacd1b4ad85d719eed2737d8562f27a&quot;
+SRCREV =3D &quot;95dee2a91d96c409d54f9fa0b70ea9aa2bdf8e63&quot;
&nbsp;
-SRC_URI =3D &quot;git://github.com/ninja-
build/ninja.git;branch=3Drelease;protocol=3Dhttps&quot;
+SRC_URI =3D &quot; \
+&nbsp;&nbsp;&nbsp; git://github.com/kitware/ninja.git;branch=3Dkitware-s=
taged-
features;protocol=3Dhttps \
+&nbsp;&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"file://000=
1-Rename-TokenPool-Setup-to-SetupClient.patch">file://0001-Rename-TokenPo=
ol-Setup-to-SetupClient.patch</a>&nbsp;\
+&nbsp;&nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"file://0002-Add-GNU-make-jobse=
rver-fifo-style-client-support.patch">file://0002-Add-GNU-make-jobserver-=
fifo-style-client-support.patch</a>&nbsp;
\
+&quot;
&nbsp;UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;.*)&quot;
&nbsp;
&nbsp;S =3D &quot;${WORKDIR}/git&quot;
--=20
2.44.0

</pre>
          </blockquote>
          <blockquote type=3D"cite">
            <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
          </blockquote>
          <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
        </blockquote>
      </blockquote>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#202897): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/202897">https:/=
/lists.openembedded.org/g/openembedded-core/message/202897</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/105326967/3617179">https://lists.openembedded.org/mt=
/105326967/3617179</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------P0N8ThgQFrN9K0JkXaoi1C8p--

