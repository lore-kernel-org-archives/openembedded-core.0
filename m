Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0DEC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 13:07:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.39411.1745327260979403986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 06:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6207e2fc58=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M3wkKE011803
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 13:07:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 464121k0wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 13:07:39 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MD3kLZ025267
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 13:07:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 464121k0wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:07:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuptgOgsGorN3pJnGDwoC72DtKQrJzFkdISsxa3uJl0CRzVb3qYjEiEIxNjSjrQf6BIX2ZqOUemmq8ta4FnONFIAmrv9Jo3x6X0rZzWOwve7c30m63WQ6aWma2RMp8msaG7KSrPt43kNu0CpEGeoKSgAO6RFCS90k+B6Dvz/HbhDu52uJ6gN9bKroZt5Ld3wotelPZnPSE+NEeo1koCdW7AKyKgAIGfbNIinszx2tbKzmHNj6rDf84bgKdMZOrB0ECMP9cuZshVRNBJj0CwCuqBhumqgGs3XI1KoI36gCv2EILH0c1HxdG7LlxnhpUZ37srk96sK1a6+tpHNJaAr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvjVvnFmXU2nNAs2o1ePuAwLsma/EOapQnWDzcB9EwY=;
 b=DgQHekhrXS19qKb/8a8VWdXqqDBfja1affXFn/y74Hh3eQEhFwLTFyfHWfeq2yxYJt7HiroObFSFJ2gugCxzT8c71PxL1/9yHBYZrsfqYr/+whFQjEt3QRpN4AMk18onrEDgJQCR7lX+Apfd+x2uJxgu+qPft/oYnL2SkUFdPMCf/5K+Cla+BlSTDQ0x2QDc/igFevirDScoOTwnUB8p26XzkyydIh3LNYd/E0V1fKDaiLbFFIrkHC3sUo6ks8/XPBla0lKu0tU5P2wq58z940/zAhEowxwcu+1nga/USjGWEvV92XQXYBqc4jHK6sn4DR2FXnNDRuvQ8Iqt2QmsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA1PR11MB8811.namprd11.prod.outlook.com (2603:10b6:806:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 13:07:37 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.8655.030; Tue, 22 Apr 2025
 13:07:36 +0000
Content-Type: multipart/alternative;
 boundary="------------07kudMtAVpROgLuSuzDHK5Ev"
Message-ID: <ccf80247-a187-4f55-9ffb-6fe0751187bb@windriver.com>
Date: Tue, 22 Apr 2025 21:07:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] icu: Add coreutils-native as DEPENDS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20250418081919.382562-1-changqing.li@windriver.com>
 <0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org>
X-ClientProxiedBy: SI2P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA1PR11MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 3019b24b-ac16-49b2-d761-08dd819ea721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2sreVlUTXJlTGJEaFhRQU1xUkJSdm91bnFDLytPVGE4Tm0vRkNrRFdxdTJl?=
 =?utf-8?B?UXRWVWFCQUtpd1o0Qy9wL0xSeC9pUHMzMWZMVHlnUlRBK3N2WDcxcHJoVkNC?=
 =?utf-8?B?MHBabzNEOEhOd1ViQncyYVBtQytHbSswaW1jWFoxRnNOY1ZNL25aZjVTaDJL?=
 =?utf-8?B?MWM0Z2pDWkp3OWJsRDFpWlkzcUZSNVROOWdkckxpak5CeXpiQ3Q2K1c5c3RN?=
 =?utf-8?B?ZGFKL1FHSHpOclZrMGk4Zi9weG0vRHNQR0JiN0llaEQyei8xNis2UHJnRURY?=
 =?utf-8?B?d3NGcVRhVVF1dGd2cnN3bjcvM2tTT2pFSllDd2RsZDJrMHZuSTl6cVF5emFY?=
 =?utf-8?B?ZTZJWnQ4TGtWR3ZIVUlOcEJibGVzRlhxVDhvVkd6ZVhSL2RmU2w5clF4aUJn?=
 =?utf-8?B?WmZZcDhObWRWMlZwdk42RWJQQUJIWmpSUkZ4Y3k2ZStrdC94UWVIUjQ1Qisx?=
 =?utf-8?B?RlU5R1prbEM5Tm1IM0t0Q0wvT3c0UjRpTHh0amltelVYbnZsZityanVFaHdU?=
 =?utf-8?B?T2c4NDhuSXk0Q1JJdkdtWjAxTTlpRnFRcGdGR3pnWFM5WHJtbTdzRExHdGU4?=
 =?utf-8?B?c3I0L3RUNU10RENNRitYeXo1bVZ3SjBLYlBhT25vQjY0T1dtR1p6NmZEbU1i?=
 =?utf-8?B?RFBHL2JPK3I0UlVHTHEyYlptZ1g3bUNCMHpVQW1YRWJJb1RkTDhERGJoako5?=
 =?utf-8?B?UHJkZTcvM3dnSHF6WkhaK1F1MVgyZ2ZjZUFlZkJIZ3pxbkhuYjdrOVhmdjk1?=
 =?utf-8?B?OGVuQ2V1bTlLbzBaVnFtbkxFM25yU3BIdmZMd0NlWWpoWkNIdmJ5d0o1R01Y?=
 =?utf-8?B?NllXYkZVajZrOTVZcXpDR1NLditWU0tUcHh0T3BoSWFvcjVYaWJXcG42S2ZM?=
 =?utf-8?B?SGdXTnFrWUM2VXozQXhrTWhzaDdTZ0VZclB4UnBkTm5WZ0pWOWNkaWh6QWhM?=
 =?utf-8?B?cHJNSCtCT1hteDRyZTlNS2FUMkx0enB1elhudkRBUlY4MysvRG5EeUhmdk8w?=
 =?utf-8?B?Q3RTa0d0RjdjL0NNQkthSmdtNUw3TkZJVTlaekFLd0s0a1FyVWs5YW84eDRo?=
 =?utf-8?B?c1d4TU9tV0E4SWY2elcycEY5aUdXUlg3RnhsRUFsZVkrYWxUYVVIVm5oVnJH?=
 =?utf-8?B?dUVXUWtoR0o0bzhMVWVCTS9YS2pwUUw0SUtFeUpJenFPYjNSNTRkZTgzTkY4?=
 =?utf-8?B?ajZEblNjQ0JzTEIxbCtRMnBERTNsQ0ZNQkxZYVR5cjFLVnRBNjdIZDIrNlJI?=
 =?utf-8?B?VloyQitkY2ZRek1oUG5mSnZ3NkdCSnRKL1JKcmpvQTdEWHJneXVpS3h1ei9L?=
 =?utf-8?B?ajBFdkE1a2VvQlJwSzF2U2Y1M0l2VnRvdTZDcUhsYUk4VURMNXVrVEpjK2Fl?=
 =?utf-8?B?Y3R3V0ZjbWZBRXZyWE8xbG5xOHduWCs4TmNIMzkrWHE3NG9TVyszRVRXM0pY?=
 =?utf-8?B?ZFA5Y1RKc05UWE83NDJtUWZraEtlZ0oxUW1BdHRGa05WaTc1akZ5aFdYUy8v?=
 =?utf-8?B?dERTQzQ5V2hiS29FUTU3K0R2R1ZGUmRENFhoTUZmVDVPcEIxSkUyN2Z1R0Jw?=
 =?utf-8?B?MVdZdlZybnlmSzFKeFpGZ09kSmU5Vlh5a240SWZDSWRUMkxoMU56VzZwcUNn?=
 =?utf-8?B?cjEwTktJaWMyc1pKcHRSRkRDcHJGUU5jc1lJd2xBaFNjWms1MG9QRDFQbTRj?=
 =?utf-8?B?Z3k0TmVMd2JVa0h3d3l5VkQ2bERaWCtxbTdqT2k5aE9Nc1RpQysyTGIxbGJ2?=
 =?utf-8?B?U1JVczZhTkUzVHBQWkN3OXJiTnNCeTJyT1cvSTZJRy9hWEhudzU3aXNmTHFY?=
 =?utf-8?B?eUJPK2dxa3FqSkVnbGYyV0EyNEd2QzF3ZitUeG1raWEvN2d1cUIzY09JUTkw?=
 =?utf-8?B?SmpIWXgyUHN4UC9kWjJycG9idXlFMjhWbHVOK29GVmRzZmNtdjJMbEx0U3Er?=
 =?utf-8?Q?Hi5UG+3I9Ow=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bUREcW5kRFZGbzRMYTk1T2hWOU9zSlNIU09na0VQYUMvdVNTTCt2YWhJSHY3?=
 =?utf-8?B?VVNmRFpGM0tRUWVjNWhHTVNzTHJJaTRzcHRhb2c5U0wyVmh5b1N3TWdRMEZC?=
 =?utf-8?B?Tjg0YWhUSlB0bGFyMUFmNXladmtNbGE5ckJSRXZocEUzMGtETE1aVWRjVVh6?=
 =?utf-8?B?Q1pVTHJ2QmJtcnFXak1tVWphemhrMGczanh2Rktsc3JPYXI4SVdTSlRPVzZL?=
 =?utf-8?B?dXdrLzdGN3orZTcvNzZydENHNDBBczc5Nnoxd0IvbXdDTVVQWFR0SkJsNXMx?=
 =?utf-8?B?c0hNMzk2VlZLaHRWaUpCK05wU2pmazdjOXIrNUJOMlRJbjNCOHVjTnpGdFBn?=
 =?utf-8?B?RkxKeFRwdm44V2tTZzdxSi8vU0RvVm9DdjR3ZmlOSU1hNllpRWFPcEQwVHlN?=
 =?utf-8?B?bGgyanRlR1kxMWg0eDJkNE54MEhGc1FrMnRET3dEelVZSEdNaDc0QXpiS29G?=
 =?utf-8?B?NXI0NUxrQklsc28zZjhWTHRGekpkYVMyalhUOXpOQ2Fob3UzNm13QWdyS2JJ?=
 =?utf-8?B?cURSTk8rUHUyR25JZnJ1UUhwbHdxcm1uKzhFNFVuNG5VOHVYT0NHeVUwcE1o?=
 =?utf-8?B?ai9iL241S3A2OHJqM1dmb2pWTGxralA4UzlsUVlNbjMrdDRjYjNOcXMvNlFF?=
 =?utf-8?B?a1U1QmlNQi80eU1oZDZ6emZmMkhVU2tQRmNSQWJDMzJTSXBiQ2c3dXhkV1lm?=
 =?utf-8?B?WXFwamQ2SXY3UUl6cktpVkdTZUVZQWtoSVpyang5UnJoQ3VlMDQzbmxKVGNN?=
 =?utf-8?B?RUhWanNyNnU0SE1DRGJzWnh4L2JuRzhINndPSW9ibU96L2VKMHU3Mk9GSmtZ?=
 =?utf-8?B?bmlVZldXWkc4d21xTm1XQWg5b25HREhBRko5UlNRWlNwaXZ5dVRkcnRFRlNE?=
 =?utf-8?B?NDhmT3I4cTNJNGlVVmtGT2tCaW9LYmxxc2JyUXZpcWQxa1Fjc01mOXg0Sldm?=
 =?utf-8?B?eFdlcjErd0RZSUFiRWRYSlJ3ZDBqYzFQMk11S3ZoUXhOb3cvTURpQUNlMVRN?=
 =?utf-8?B?U3RsUGZoZks5Y3I4eFY1enpaaS9YOVRhd1ZOcEZNSnpGZEpDdGNGVlIzSVdI?=
 =?utf-8?B?N1l2OG1SYjU5aVJqVWt2V2QwNDlJazVpazhwY0tHZ3lyeVNLcmxTbVdNSngr?=
 =?utf-8?B?REUzL2dpbWpXOE9qdEVvUllrRXM3emRtWmFicGpBcnYyOStLblhUVHVTOE9j?=
 =?utf-8?B?UXZIamZtaHcwWG5oRVpscEhadzBQckk2ZFRRMmxDUWdrR01HeDIvcnhjLzRq?=
 =?utf-8?B?TlFFOURLaUdNRUZLc2JFMjBqaW82dzQ3NkVlMUwzT0Q0NXZmT3puVmZrSEJV?=
 =?utf-8?B?TkhJSUh1d1duU2IrL3hmcGRhK1Rvd1VEcTFsU1RRb0lLS1Ruc3BDZUc3YlBJ?=
 =?utf-8?B?ZS9IVWhoT2I5U0IvYkZWTWZCSDcvQ3RtZTN6SVBvcFZ0MWpvNVdTMis5Q1Fz?=
 =?utf-8?B?NUJWUEFEWnVXUnNlUk8xQjFpN24rOVZTaS9NRDlvREo3dTJ5NnpaZlpIK01q?=
 =?utf-8?B?TzdWaFNtK2xvUEc3bFI3REtPQ3NjWlYxdVo2SWk2MGtwcFYvOGRxTWI2VGZn?=
 =?utf-8?B?OVpTUThDYTY5SXBGWi91MmgyTWlaRUJKWTZ1ZHMyWTc2K2RIZGhWT1RGSHIr?=
 =?utf-8?B?ZmYwUHdXRGhXdENJVXVMRXlyS1pNNzBybjRydDYyeVZIUFlCTHczY0grVWZl?=
 =?utf-8?B?RkZGUWNrYjMvWXhRMWhZN1R5bUNBOGRXWS8xRXdlNm9VeUozTUxhOUJjK3I0?=
 =?utf-8?B?aEtSVldpbmR4QUVuMStsVTFDTG1vOTl2ZDVtWEJyVUs0a1g3c2YrWDBKS0hN?=
 =?utf-8?B?U3d4d09kd1lnNERZeXRsUkpyVzMxb3JZazBPeVhWVnhhdytUUG1QTWdzamdB?=
 =?utf-8?B?VnA4c25NV0xlbEdseTc4ZTZNdUp2eXdnYUlQR1NMQllkcjhaMHc5UGZhK3pZ?=
 =?utf-8?B?VW5ObERKampPdzFKUVRzRzhXOG1sbVhKbi9lYWg1cUpPMVdhVjBwbDM2SzNL?=
 =?utf-8?B?M3doMndHOEZ3ZDc4ekpabGFjRWl1SmVOZGk5dkxqL2E5Y1IzVVRPSU90STBu?=
 =?utf-8?B?N0x2SFA3Vno0Qi83Szg4dXc4aXRWbE9SOGVBRTBCcTRUb3VpaWRuSitUT1Z2?=
 =?utf-8?B?MnNIaHVTVG1UYWF4T2RSVDFCdUZnaWJDdGgvSktkMWNuVXZYUXIrN05IenNm?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3019b24b-ac16-49b2-d761-08dd819ea721
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 13:07:36.8989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ez10uA3WNRAm7QxdUp0O5Wgz9a9I5jvtsSSIVbTuroHe3M8nmnXO5tqFFnxcVLlcPbBfQJOnx7Gj8F8kvpaf1Z0+2doTHpwh4sBsPGjnWKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8811
X-Authority-Analysis: v=2.4 cv=QZNmvtbv c=1 sm=1 tr=0 ts=6807949c cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=MExtCd46UHBcOEm37zIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=EYtcSKvZzzfVfT-D:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: kKo6-lKwUZl_Qq4S8gj2MCmGljTXlWxC
X-Proofpoint-ORIG-GUID: xA8cMU2FZfMNs_ytqXiVJYsfp05WJYS5
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504220099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 13:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215207

--------------07kudMtAVpROgLuSuzDHK5Ev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53M3wkKE011803


On 4/21/25 20:26, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2025-04-18 at 16:19 +0800, Changqing Li via lists.openembedded.=
org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> icu will check program install path during do_configure, eg:
>> checking for a BSD-compatible install... /path/to/install -c
>>
>> And this path will be writen into pkgdata.inc:
>> INSTALL_CMD=3D$(INSTALL-L)
>>
>> Decided by if install is installed into recipe-sysroot-native during
>> do_configure stage, the INSTALL_CMD could be
>> /build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr=
/bin/install
>> or /build/tmp/hosttools/install
>>
>> Add coreutils-native as DEPENDS to make a determined result of
>> INSTALL_CMD, avoid vary caused by the execute sequence of another task
>> which DEPENDS on coreutils-native and also independent with do_configu=
re
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/recipes-support/icu/icu_76-1.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> This needs to be fixed differently, we should be forcing it to use PATH
> and set the value to just "install". We don't want to add dependencies
> unless we really need them, they slow the builds down and add
> inefficiencies.

Thanks Richard. Currently, it will find "install" in PATH,=C2=A0 but=20
STAGING_BINDIR_NATIVE is before HOSTTOOLS_DIR,

so when there is install under STAGING_BINDIR_NATIVE, it will use this=20
one,=C2=A0 if not,=C2=A0 it will use the one under

HOSTTOOLS_DIR.=C2=A0 According to your comments,=C2=A0 I send a V3,=C2=A0=
 force it to=20
use HOSTTOOLS_DIR/install directly,

please help to review.

Regards

//Changqing

>
> Cheers,
>
> Richard
--------------07kudMtAVpROgLuSuzDHK5Ev
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/21/25 20:26, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 2025-04-18 at 16:19 +0800, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

icu will check program install path during do_configure, eg:
checking for a BSD-compatible install... /path/to/install -c

And this path will be writen into pkgdata.inc:
INSTALL_CMD=$(INSTALL-L)

Decided by if install is installed into recipe-sysroot-native during
do_configure stage, the INSTALL_CMD could be
/build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bin/install
or /build/tmp/hosttools/install

Add coreutils-native as DEPENDS to make a determined result of
INSTALL_CMD, avoid vary caused by the execute sequence of another task
which DEPENDS on coreutils-native and also independent with do_configure

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-support/icu/icu_76-1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This needs to be fixed differently, we should be forcing it to use PATH
and set the value to just &quot;install&quot;. We don't want to add dependencies
unless we really need them, they slow the builds down and add
inefficiencies.</pre>
    </blockquote>
    <p>Thanks Richard. Currently, it will find &quot;install&quot; in PATH,&nbsp; but
      STAGING_BINDIR_NATIVE is before HOSTTOOLS_DIR,</p>
    <p>so when there is install under STAGING_BINDIR_NATIVE, it will use
      this one,&nbsp; if not,&nbsp; it will use the one under <br>
    </p>
    <p>HOSTTOOLS_DIR.&nbsp; According to your comments,&nbsp; I send a V3,&nbsp; force
      it to use HOSTTOOLS_DIR/install directly,</p>
    <p>please help to review.</p>
    <p>Regards<br>
    </p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------07kudMtAVpROgLuSuzDHK5Ev--

