Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA67D2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:12:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10927.1765354350411942124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Dk7GOqyP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4439c05937=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6SgKr1432127
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 00:12:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=r+D1SVne4ca0Ixlj4Mba3N
	DUzum3LjRkXeSIjKWoOrw=; b=Dk7GOqyP7hVlUDsyhe4PIpKf8m+mvND1ftOqVk
	lBRhcu5k+JpV/N+7gm0eMhQ3UXIvf2SAheiqZ3pDBfk1v6AD/L38e8JjihRzsvmF
	yRT2aKjwqFxmYPc6i2SwWX1uXJMwuMBTGHygkOGLgydEh1purdZlK0YkRsbl0Pd7
	LGBeY8sCmtt1ohiqVTCGWzCa5jwjoxkUiv5VRRpHRIk0qb7tA0pNagW3RrSeyUAA
	XU2ZCTPVtYMHylej8vL99rM4Rdyc/Z3DfCel0SpYOI4lOwJ0pjPz59UQpluouVWo
	lGMsGKtOwWh1A/bWUh0wtkNQLePiWFHKMIE9kkV826ueAzVA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07u09ek-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 00:12:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vx/SmilYldITKUv4nX0jIleZ6C2t9sLko78Pju6/wwjryV1KmFT0vVJMSe/ha9UYLyvvOTBwMOkGuxAy+CH/XSaiGthbOfJwIpg38Inb6UixCrzRuYEafLL63rwHvjqYsNoSnZUS3n3C90xZPO4WFFzQwpKawj9hVvlMaaDNNW8q+anVuU5WslzVdVLKV1fpMpIslU8RrCQvaDmfIK6yxBdDFCPFbcSenNfcosIiTzLGnS7Bt+JWPSa6aMGfY4irakOjSeCUeROq7O1dVtbb8HZIJqeJ1iXCFaRbKq5QPhk2B3LnXf05+Gb7EwuQDLAiODV+Q3kxRLDht9Xf4Fw+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+D1SVne4ca0Ixlj4Mba3NDUzum3LjRkXeSIjKWoOrw=;
 b=dTUNce5Mz7K5K+3WvU2phzVrN7U/g2OOBDBvv09d50IgFaPp5xby8gx9ZadlfVmsPULpjBpOhiWqyh8MyprnYJ2hhDXmASrbSi4B292eVL8Nut+lhZv64KwY++cylfl7BcI/qF+80SLmkPGIj8V0uuFzYmaK2zXbLx0kMn7sz38WS/8IZvsTgpypIVn2ujIMjehM3hZqoy9dsFdfZquXx29TeGTgGaimRfZdoe6/QQ/q7eCt1/N/ABxW6CKLv2TmqrPfQpMKet9//ljFhLDiTaLDOY8404o45BGIyHaaQjvXMVLIROyHXTdiif69di8JDHBS1fUyy3j81n87SOts6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 08:12:26 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 08:12:26 +0000
Content-Type: multipart/alternative;
 boundary="------------0qq6hCorpgDlCanfvHHZ3OVs"
Message-ID: <25c26c3f-1236-4c35-b5bb-3ed8c5118d1e@windriver.com>
Date: Wed, 10 Dec 2025 16:12:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] itstool: switch from libxml2 to
 python3-lxml
To: Alexander Kanavin <alex.kanavin@gmail.com>, randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <20251203082404.2732162-1-hongxu.jia@windriver.com>
 <20251203082404.2732162-2-hongxu.jia@windriver.com>
 <3f6b542b-4cc3-4c9c-a4c3-6e20067626bc@windriver.com>
 <CANNYZj_AoTyv2H6gvu29OThVKEAqr7dats9+V8kMH==qJi7e5A@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CANNYZj_AoTyv2H6gvu29OThVKEAqr7dats9+V8kMH==qJi7e5A@mail.gmail.com>
X-ClientProxiedBy: TY4PR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:405:372::13) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ2PR11MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c5030d-b2bf-4388-5619-08de37c3da8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aDFJdkFRaTN3SkpCYmxRMkVBa3JUNVpWMGtKcTV6ZVU0ajlOaDY0RnhObG0x?=
 =?utf-8?B?OCtMMklQVGpYSzFaM3FQVzQ2dzFJZmVnUWNiL3RpNDl1Ymgyd3FnMG5SMFVq?=
 =?utf-8?B?Q3BXblFaV2hCemY1SVlrQ2kvNXhjeVdnQUFRdDRQNVNWN0MxMDE2ZGFsenlv?=
 =?utf-8?B?cGtxenV6b1J4eHdSa0dBM0VjNkVxRzJxSE1HYU1XWCtzOStrcFRxM292Ny8y?=
 =?utf-8?B?eFdjL3NnRzJnc1BRNXF0Q21WeGZNdS9qcjVnVitXek1nVjNyMWlHWU1iWDI5?=
 =?utf-8?B?L0pQd2hETW1Nd0psa2NOOGcvSkRjNW1GNm96QVRucndnRDlXbGJ0YUMrNWtm?=
 =?utf-8?B?YnB0OEFwVkhyWVo1R0hIZk1CUHVseTJ3N0FvSjZkdTR1dUw0T0todjR4QUEy?=
 =?utf-8?B?SUQ5SkZaL291WXJTZTNlb2V6bW9OeWRrUXFZTFVNVWxTSUkxaWMyUFVEaWRs?=
 =?utf-8?B?bkhWRlhMb05LNmxLMDBxWW1RNWsveHRNK1NnUXNKZjdXekR1OWE4ZGpGT2Ry?=
 =?utf-8?B?aHNpVWhNSnVwM0JXc2dwbXA5elFTc0xBNFRPSUVTWDJrQzhVQ2dmOEFiN0FW?=
 =?utf-8?B?OVlibFhaUXNZdS93ZGloU2F0UENBanRMMCtEcDRLNFZSZ3hsRWZCdTZOOTA3?=
 =?utf-8?B?L1RIdzR4TDY5YXhDdnBSemFwRmRTcDE5UlJ0UFZON3dNeEh3VVZBSnlndGJX?=
 =?utf-8?B?Rm85bFVpVkJ2bVZMbWlUUlpkd082M1FHS0RPOWtPdVNjRG5qOGk1M1cvTTQz?=
 =?utf-8?B?TWMyd2IyVXIzSlI3YnJCcnB6NzFUZEkzNy96Vm9tVGtZNlBaRmQvNUZRMmd0?=
 =?utf-8?B?L1o4bVdDbFpjY3hYYjZxTnlnUTBEbE9GM1JFeE0vdElWZW4xbXVOeGRvNHY3?=
 =?utf-8?B?NTFDYlBwUkZwQXZmdCtzMG5iS0J6WVJud1dTcjQrR21ha2EyOEI4d0NOZm5s?=
 =?utf-8?B?UkNhZWhPZG41K1Y1SG1OeTUzc3hsM2NucVlqNlhDTFhYT0s5UGpaQ2NTZFBD?=
 =?utf-8?B?SEJZTVdHck15M09xekJEaEU3enZsVzBzWWtGQmZSemlxYzhsRzJaN1lIVW1l?=
 =?utf-8?B?UHpWQzVhaDcxalhYai9CREJQdDhYUWo0ZTMxcTh0NGdURlV2Q05hd2UzZXMw?=
 =?utf-8?B?Wml6dXB0ZTZiVDU0Qk10SkozckpnSGRXdHZmMWxaYXVMZVBhRnQ2Um9YRUNn?=
 =?utf-8?B?dEZrQmQraS8rTlkrREZIQ2dSUXZZQTdrTDNUdllRWTQyMzZlK2ZXa3pSMW1L?=
 =?utf-8?B?UmJoaktkelFndDJQUkE2Q3dremxTaEVpZnd4cy9zZ29RdHBEQTNtZFJPemhB?=
 =?utf-8?B?YWNtTDVOZmsyQ3RCTStrNVBJU05RSGREaG9Nd2hNSUJiSEtqTDZzOGJiVXE3?=
 =?utf-8?B?OW9Rek45MVB2M3c4cHZ4T0lab1lhMnFXUVRiUFdDMEJZTERuOFdQOUxDSGpx?=
 =?utf-8?B?RG41MkhhOVF4WDdDd2ZrVkc0SEZnWVUvL2c5aUdpQlpXeld2VzI3VU5WcEdQ?=
 =?utf-8?B?NE5yVVlsd3ZWalQwQmwyVXRwY21jcjB5aUdpT3dBNm1qNzNCVWJPVU5rL1c1?=
 =?utf-8?B?dHpPWGhHZHZYeC9sS0cxNWJvZXRSN3p1T1R1ZGMwQTlHajZLcDhMS0hlTnl5?=
 =?utf-8?B?Ny9QNTF2anB6RFl1bERxcWwvMzlWSE14ZE9XYmViTkxRSlMvMVVzUnR1VVVM?=
 =?utf-8?B?V01oWmNza0YrRHg3S0VxYUN1WDc4cncxcDc2UDFNNU5oNjB0ZDI4WGVDZWth?=
 =?utf-8?B?NGZQNENSWnpwUTF6eUFRWTUzRU9qUXVDUW1leXVPdXpLOTExUlZ3c29vZUty?=
 =?utf-8?B?VVpQWEx1aFNZYjYrMXRlRTE2U28veE04eGx5QldBaEp5YkllcHB2RDd1K0VD?=
 =?utf-8?B?SUVoQnk5K2VxVGRGYTJJUGtIczVTNEIrR0VXcm4xeDl4Nkg0ZS9vMnZoTnJa?=
 =?utf-8?B?V1ErdjVTdDJiblpYYzJzOHhrdVByNE15TnZXR3g3ZTFOWG1BRzJtVVZFaHdB?=
 =?utf-8?B?a0VodHdoeklRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1l0a0k3UDRwWDNNZkZHU3JUVFFUUHFmdzA5ZVRKNTZTcVMxbWJnYURsWkV0?=
 =?utf-8?B?SjNWWnVIeUxVeEpSUEMzQjgrQ25pUFVPS2lXc0lmUDc3Zkt5aXM0ZDNZNmI3?=
 =?utf-8?B?RnNPRmdMZFNubGIvSnVnd04ranpVVVk3c0MyOXZyeTY0N3EzQTFkdjRpUmFl?=
 =?utf-8?B?eGxnZHVWcDBRWHgrMjVaYmgwdU9BTHY2QjEwbWNOQUtock1VMFl5NVNGNUI0?=
 =?utf-8?B?UzU4azg0TllSb2lvTGNWWVdNNGxVSTFzUkVjMG9xZHE4eDdmWVhLRjEwZi9T?=
 =?utf-8?B?cmlhbS9XdUVTVDdHUjN4SFNmRDdhTmZpczMrRW9VVCtrWXR2Wi9CdzZFeVJR?=
 =?utf-8?B?aTV4OU95akRkcjk4RERpdUFHUE9Yd1RxVzYyT3RjaVpEU2NZR3Z1Qm1IMkJX?=
 =?utf-8?B?Y25IVEY1b1FacElYMk9BZ0ZLWmNiOXBjRFYvNGU0TE8wNjVuTnowU3JRUXRz?=
 =?utf-8?B?UlFaYVdkbzBMUEhDd3A1S1dBbnBzUXpsMS90T0ZkeWZEbU5rZzVkMllNSGw1?=
 =?utf-8?B?NDZFR25obVA1U1lhSXFZbExKMlZHRkxoN29LMEhodEl3aElyMzV0L3ZnSkVF?=
 =?utf-8?B?c0FFZGRsTzNWNkdHdjJoVW52a25WYkxpV2ZQbVhFRVhBRnMzY3VwODJVT3VK?=
 =?utf-8?B?RjdQcFRuWmYxdHg1V3R0UmVJdWZKRWV4cFhPY2VWUFFlajVMeExjNmhRR3ZP?=
 =?utf-8?B?c0dOQmdaN0w1cXhYU2wydUpZbjZBdGw2THNaZ3FaeUVlb2lpaFhUQ0RmOTZ6?=
 =?utf-8?B?SE8vVWNUcTFYQStMbWxqOXNOSFdmVkVicXBmdmptakh4bzZRSFNaV0xMQSth?=
 =?utf-8?B?TVl0MGk3RDhjcVc0cnNTWmZWanFUTGRaZnlzeUFleFFOb1hxWUZrdE9Sc0Ro?=
 =?utf-8?B?dUx5SlYvaHdET2ZRWjR2TllsTEo0NGJoemVsc2VsZGdZakdTY0ZVTkZFMDZQ?=
 =?utf-8?B?c2NEekF0cUlDS0JVVFFINjhVb0FBNkxERHAveXBHZmlCTjZuU2NRNGhVb2tk?=
 =?utf-8?B?QnlmdXBXK3dhdzRGcjBLb3g2YzFrZGUxTlZOVi9lclc2MzhTLzRMbnZNcTk5?=
 =?utf-8?B?Y21WeHlvYmo0aHlKTkRrbUJQUVhXN0d0R0E4aGk3Y3hMTnV5eSs0UEJwUWVZ?=
 =?utf-8?B?RWdhYzN3TzJ4SmM0MUNEWTBCMDNNbC8rSmUvVzh1RmVqbXhkZCttelR3b1Vn?=
 =?utf-8?B?NXFWMzJLQUNheXhHWDFxRDZ6aWR2aTkvSEFUZ203ekpGeG5Zc29PbzFQQWN1?=
 =?utf-8?B?MVplTGoweDNIbFlaeitoSi9rN3JoeENqVU1HMm9CdjUvbGNVd2VnbHVhQUpj?=
 =?utf-8?B?bXhKSCttR2RzVFhlbnVhbEVielQyTlBBeFJlSGFZU3NOOHdWQ0dRMkR2R282?=
 =?utf-8?B?c3NxWm43QUkxbGNrRmY0Nmw5a1NabTY4RWpTQU14dGY1UFpZK2RRTTl0RStE?=
 =?utf-8?B?N1lCTjlSTHR5NFFHSTJpTHh0QS9meWFVSisyRk41eXRQYTJjZjBSRWZweWlB?=
 =?utf-8?B?UXBoZkdTZmZ0amYrc1NmQm5GT2NtK0xlWXhraGlwNWZ1YXF2STROWGQ1NG9m?=
 =?utf-8?B?NWIvbjFOZEJaWGswa3JRakk2TllrL0xGZm5RMDdzeGw4c2VzS3JLWXJSZGNC?=
 =?utf-8?B?QjJsc29vWXZwQ2RReWcrN2wyZVpnZFFDaks3YmczK3dMWis1bkZSTEdhSSsw?=
 =?utf-8?B?Mi9nSy94VlNhNmZVbSt2azVINDFkQVlsZk5oRm96Yk1zTUJlb050MitrRk1B?=
 =?utf-8?B?eGM5Wmg3VTNRcVR0VnlyN21XTGIxTW9JN2RLNXdFTjRXYXc0RFJKdDFTUjRU?=
 =?utf-8?B?WGVXZHQyTVB3SWFmcHVYQWwxdTNxY21Sd0RNVFRsWFJ4bzV0SDVRUFFKeXp3?=
 =?utf-8?B?SlVQMHpuaVNtL2hqN1Q1ZmdGNFA0b0RoOU11WFVwVlBFeVJUUTF4dk5Kbm1C?=
 =?utf-8?B?RjdxaDlLaHAxWHVZeXR6UXF5TUNMTk5lYWR2RUNWbDFaTXZoYk82VGtKeGhT?=
 =?utf-8?B?TCsySFJUK3h5WWIvamlGSHRSY2E2WmNLKzJ3cjlLeGpMaUE3V0wzM041RjJu?=
 =?utf-8?B?djg2ZnBnU0NHTEVEK3hDd01Ka3FxQzR1UE5rUjQ1T3M2Y2dxaGJsU1BBOUVY?=
 =?utf-8?B?R3R5SDVUL1FuV3Z4c0ZVSE8vVkN2QWhvcEZYaUtLZzU2YktNUWRyUlU0U1NZ?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c5030d-b2bf-4388-5619-08de37c3da8c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 08:12:26.0513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AKhoLlomX5PaTVh+D1J243ZTh2gbzIzURAhzI0rwiU4zPM+sCBtZDUfNYH5kZosn5mUQW45nssDzWvKwarG+vYJWnH+cLw+XBadNfBAEjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: r_uhGfN2C8sIq61HSzdMX-2fvLr13aRq
X-Authority-Analysis: v=2.4 cv=Cb0FJbrl c=1 sm=1 tr=0 ts=69392b6d cx=c_pps
 a=0NiyxO+pn7gKe2yT6URb/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=ycG4skZOWCxxvRKrWxEA:9 a=QEXdDO2ut3YA:10
 a=pGLkceISAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=8_hxcDUJc73TN0YI:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: Vz_3-T8dmPruRfcpoklOyocsBqf15nTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MCBTYWx0ZWRfX4tr2it6crmJ+
 6VyMIluZFRBrV8QAKyvbG1r3GlVZT8LcOKzYnX08uI24C/MEe0EW9mCbXS83rjRDvMgxU06l2mb
 AbZBat4BhB+KZH8Ift9lpc8jKJUueTxIqu6zjVHyBdokzfdvTTmFaymtCg3twq1hzLty3n5mp9l
 BO+Dy/ZsLDrhzkHShKIJY8G4ji2P8sAgK54M7PkiCHwZi0xaeVCWR2qAfhF5XMgRO+Ys/61je7Q
 ebXwbyoWU+aMKkirA+MTHFkJnOGWGMrDPrvuwCakkh+pjJ19bl6+PdN9dqkuIYZqip4FV4STFtk
 ILx3YN5nNBCkmYDQ+vCy6A0lNDEnlHj8sB4pKHzz+kKJCZzvoIdta8kmnLBk3wWEKUZgj/CeoHQ
 d2g+YSzusKvXWkeuLamSplSPYiLAag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 08:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227459

--------------0qq6hCorpgDlCanfvHHZ3OVs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/9/25 02:26, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, 8 Dec 2025 at 19:14, Randy MacLeod via lists.openembedded.org
> <randy.macleod=windriver.com@lists.openembedded.org> wrote:
>> We reviewed this commit
>> and the libxml2: upgrade 2.14.6 -> 2.15.1 one during the patch review meeting today but
>> the consensus was to not merge yet.
>>
>> There's a big patch that we'd prefer to see merged upstream rather than carry it.
>>
>> Upstream seem to be blocked since late May, 2025:
>>     https://github.com/itstool/itstool/pull/57
>> Can you help them get unstuck?
> It seems there's a bigger problem. The project is basically abandoned
> at this point:
> https://github.com/itstool/itstool/commits/master/
> https://github.com/itstool/itstool/issues/53
>
> We can try to ping them once more, but I suspect there won't be a reaction.

Agree, I've ping them in https://github.com/itstool/itstool/pull/57, but 
no reply

//Hongxu

> Alex


--------------0qq6hCorpgDlCanfvHHZ3OVs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/9/25 02:26, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_AoTyv2H6gvu29OThVKEAqr7dats9+V8kMH==qJi7e5A@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon, 8 Dec 2025 at 19:14, Randy MacLeod via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod=windriver.com@lists.openembedded.org">&lt;randy.macleod=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">We reviewed this commit
and the libxml2: upgrade 2.14.6 -&gt; 2.15.1 one during the patch review meeting today but
the consensus was to not merge yet.

There's a big patch that we'd prefer to see merged upstream rather than carry it.

Upstream seem to be blocked since late May, 2025:
   <a class="moz-txt-link-freetext" href="https://github.com/itstool/itstool/pull/57">https://github.com/itstool/itstool/pull/57</a>
Can you help them get unstuck?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It seems there's a bigger problem. The project is basically abandoned
at this point:
<a class="moz-txt-link-freetext" href="https://github.com/itstool/itstool/commits/master/">https://github.com/itstool/itstool/commits/master/</a>
<a class="moz-txt-link-freetext" href="https://github.com/itstool/itstool/issues/53">https://github.com/itstool/itstool/issues/53</a>

We can try to ping them once more, but I suspect there won't be a reaction.
</pre>
    </blockquote>
    <p>Agree, I've ping them in <span style="white-space: pre-wrap"><a class="moz-txt-link-freetext" href="https://github.com/itstool/itstool/pull/57">https://github.com/itstool/itstool/pull/57</a>, but no reply</span></p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj_AoTyv2H6gvu29OThVKEAqr7dats9+V8kMH==qJi7e5A@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Alex
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------0qq6hCorpgDlCanfvHHZ3OVs--

