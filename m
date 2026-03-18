Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B24DFCD0B1
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:36:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7564.1773812165109769765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=j8dKeWoC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7537b13d17=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2AVMA3408355
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 22:36:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=AOOOD8cCaC7Wi7CeLfbV/4
	oY+z670JaPlU2DV6/UPiU=; b=j8dKeWoCJPdSW/DBG6flp12hN5ssNArahgrxtR
	dQm/3IiOnuOlxx7qLv62pBQt57hmRvt1HF6IyZjUpMbaNTYSmpRYvq3l79iQ66eq
	IzN635rFo5NwCa6Eo5dI1qtgqSv0VbAmTDLB8JlLREOYGZc7N3DFkeM9qbpTHN2k
	z7PNaQq37XuO7o86WhqV4bbuWDbLQFcMGBlpze9v3+Jv6QEsrHKLEpkN121IfnHL
	emXRr6MSiYJEDKAODL/u4Ty/c/TqfXzo9fanPl7pFDi8ROtmhC7IyqZRxyer6JU9
	JL55Swi3WJUW6kdDMamoiqGN79AIU575S8RiBX4rVa4jY5uA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y14918-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 22:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fj19Ok0fLuz61TSXBUGC9m0II5a0EruBkBJRVOpixyhQ608KnnWiD0TGY6WUXHyV1g5MNBUhiQcu+1lGDdFjTvuztealQwgT/nY6JB97fMsuqixoS5byaTLdpzhZk+o8dBXplWrZeTvulWLv2OnnQ15OQDe7CAcGBzaCTMn/edr72UK9kugem9N5VD0E4QYqI6rpdfeGmH19XbP/dWq10d3yUvJfAEW8SzVARj22Ff1cJuM5bOGOzzZS0AkiGRsyXOGpQhLp8mOxMgAXkzCGfl1jvb4Xw4XlnGUO0DZjG5swy06wyigTStv0P5gJw9ZX2ZYmcqFEo5fQ84GxrXSNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOOOD8cCaC7Wi7CeLfbV/4oY+z670JaPlU2DV6/UPiU=;
 b=DkIB9MHisUVKB1gdXMLjz5S8DY9Ru3FL+mvFY5gdD5xTeVi+Z7sUStNdnle5q9cSi4fS+Ti9qTHuKm/6qXzzTLv+HFTLOB7hWVpqDHH4sd6yocTnCp3rlD0M17qkkbUASVjzXt1QnHzdKg52mKf9J3HW+pp1DOl8CFfSJUcp+veV67CaXB9TDPAWkBO3ODlJSuSUA2PaIFBrdsW0CBM1m7hWBBfp5VtX+eycoOIEDtnIqfnrep/Xr76RazsA3eYlgmqj4ie1U/pahbYN4thxjtVP14BAGtKjYi8kSFaNxQXbZ250tzBDd3lFjxg+hPaf5WFZ5RQa263cEAjjf1GX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 05:36:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 05:36:00 +0000
Content-Type: multipart/alternative;
 boundary="------------0lXjxnxsKmrzolYSs1u8SgQm"
Message-ID: <08dd72cc-7183-4dcc-9435-23d76a2de431@windriver.com>
Date: Wed, 18 Mar 2026 11:05:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kernel-yocto-rust: Move rust kernel
 dependencies to bbclass
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20260317180753.488090-1-Harish.Sadineni@windriver.com>
 <CANPvuRmtjsuAQtpv11A6cqwAow3mjMsErkH9hB3VT=j2KNgpHw@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CANPvuRmtjsuAQtpv11A6cqwAow3mjMsErkH9hB3VT=j2KNgpHw@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 634824aa-89cb-4fbc-820b-08de84b03cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	3rYu9oLPOu5hUuz9idnGLCa1U7iOGMorQgZNYx9KyNeqbgBvNEMV6GipBiu9qyGA93sULbEBdloaQaW2zLm2DcG2rNaE3uAW8DWsQroU3KxTYEZXKs28Bmyc83l0yolR8kOcG4dGfrwAw/IMF1h3Ig95xVESEcXjn2YYBz5PGLWMomvtGxxFkBpPFp+898/Z5NC9mpzeR2YO4SXw3RqYzBg0Ba8e2Y7PCFX7FNk3RZYN2qmS0W/NM3drBt7Fks5E4MrVrW+8EC0d28E+Qcv6Eo1BidPGVddBuzKDTx3LpSF2sUtFcWJC0kR4Jk3bL4OCsA/lhL7AVvLrmiMB+vNJyFXUVSLZaIk83OcTN8E5Wo5f1hFoDmhxAmDcdcxFjGtl8m7pcYP04TlkMuTfqBXAWykOiptEbA+/QeaA9B7LQqPCp9qOuCX1wiXoCe8wLutuxsG3VwUGBMxN/+IravoyVVbvsuTmCR01R6CaHTeH283z5pSzvPB4/+R2+Ul+B2sBSNzWQC7vaIT3eJiH4uC7EsqUj5j0S8bLnCnZ7mfrGNttPBROF4RoZVA84KiNFAc8mhgW0XsRKo2ewojYwyqr7RmfIDeA05CHX/DLx39dVMHubwdjjXyHDvZbWR1VmlZvjgOnCg9fiU6DrjhwjMZRojjB3QHR678hbGzFB4nWjmxJgpaV1KHDUR2FBhQcu4PZcoYRyEuQgiV19rO1NSBH4hh15fEit/U6JzKNpYKjikk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUVBOFJJMmdjcUdQaTZzTFJZdnNwTUk3L0ZwbFZERDROeVdQbEpHK0szbjR6?=
 =?utf-8?B?bURkK2dSSHYwZGFQNXVOczBVYnM5eDJTUUFVTnlVam9EZU1mNDI0TmRYdmdU?=
 =?utf-8?B?NTlsSEFWMjM4KzdyTURrRmxmWjZUbjg3dENUZ3NkcTNHdkJ4WmNWcTQweWVZ?=
 =?utf-8?B?KzdUSVcrNkJTMEhETU9EV2hpS044dWtRMWpLZ3VEdkh6bWxnWGhMTFowT0I1?=
 =?utf-8?B?Sk1FL2pLN01rU1RIRzQ4c3VZaUFPK05ZVlZXS0xqODA3eTI2Z1JzK082ZnhK?=
 =?utf-8?B?NzFBNWxmR2JrbG5EYnRpQXUySitHc2ZKUlBrRVFaR1VrSFhUSmVQOUIvNG1F?=
 =?utf-8?B?Y3hOVWdzUEFSbGl4UXNXRm44ZHlKek9BRVltNkw3NFJ0QXdjWkUveE5VZVRm?=
 =?utf-8?B?dTJKQjR1NGJ5dHNOamIyZmNPMWlkazkxMnNkU2dCeVJ0VHVmZy9QVUZCK2Qw?=
 =?utf-8?B?RnU0RFU5OHgvTFh4RGpDTmNJeVV1ckVDeVVxbDlTS250S1pjSnNUdEQ4Z2xu?=
 =?utf-8?B?U2k5Nm5rMWo3WnMyd0tqd2VLNzNoejdtT1pucVhkNWRoZ2xYc0xKWWw3clpz?=
 =?utf-8?B?bTRXMG9EQkM2WWgwUUsvYzlmKzNZT0FyRzVOUU13dHk5N0QrOTJDbFJqc0dN?=
 =?utf-8?B?R1EyUGhWV1ZSditqNEFBVDcwcVJtUFRMNHdPSEFycXBxZlg4R2IzSjEwbXZu?=
 =?utf-8?B?UURSdHlNdEwxTFNISENlT0VEQkRRMm13d1dQUU9seURRcnVOWHVzRkxPcUxt?=
 =?utf-8?B?RVNlNG9qcmcvSCtTU0pnY0prL1lieEk5TXhKL0FIYmJtb25JZ0hZQ3VOZjh3?=
 =?utf-8?B?UWVpTzBhNTFKSGNJaXdIYkhUZm1KTmRlbmYvRDgwWTluOXNxZ3F5WEFqRmc3?=
 =?utf-8?B?bXAybGM4dVRpcTRqMmcvTmZNcm5uaW1vTzMwczdINnYwMW8vUERpbjJnOTNS?=
 =?utf-8?B?bU1iTGFDRUpnOWUwQlo0UUJCTDlRVWUwUzdBSnZ6cUw5c3ZKRlVTQjh5YXlH?=
 =?utf-8?B?L3NaK0cyK0swZy92THJYYndwaGVTUUJ4U0hRSmFFMVdjWTlKVllJN3ZKUU90?=
 =?utf-8?B?VHRkMmRVZEs4T1lkRVVZbldpT1luSGhrR2F2UWh3elBWK21YbGFRRGxkZ1JG?=
 =?utf-8?B?K1IxanI1N0pXOFloUnlNdmJMUlRzOSswd3VQc2x6QmlYUFlDTVhYWGRIS2tB?=
 =?utf-8?B?Q2R3eXc1L2ZaejY5Q2dxbDVqRnRnRklCSVdYdlFoMHR5eUZWR0N3VVJhUnVC?=
 =?utf-8?B?dUx4b1FQTkRBK3gxS3VYdmFIRmpRNG90U3RNM3VYc1BJSVBYZTI2VUFlY0k3?=
 =?utf-8?B?SzZXdVY4cGVBYmt4K2I3TEpoaDZIaklSeXZQSVAzU2lOb1VDZXZvV25VMnI0?=
 =?utf-8?B?Tmt4dTNSMkFVOWdBUVp1RzREaXVqcjNrVVQ2TjBWUi9XVlo2clRYd1JaM1ZQ?=
 =?utf-8?B?SDVPWGlNSzlOQW51R0ZZbE9vV3lWN3JzbUNxS29vRmppQ0sxMzBSYzJsREF4?=
 =?utf-8?B?MHpwdy9ydGE2SHU5WDE4RjNVdTJHTklEbExHUS9pUUZIL2s5cUdsNmRXTmRZ?=
 =?utf-8?B?eVZGMWxZMGhaTGtxaldIcTJMZCtRN2UveUNyc0dITmZ6REJjOURFdWdOdnhJ?=
 =?utf-8?B?YlhVYm4xU2x0SDBKVXFGRWlZQnhVekN4L0RPQmRkN0Vtem1VaHdmZ1RKNjBn?=
 =?utf-8?B?MlA5OWVCUGYycCtpdzhnRzcrdVFHL0lOZ3IzV2VWZkgvN0xnaDdreHhhOXoz?=
 =?utf-8?B?ays1cmFVeTFURDRwZkhIUXZpNURhc3BWY0dOS2RxemZTOWFzTmhVV2JiNnBw?=
 =?utf-8?B?bzYvcDcyUFlZWUw2dzk2cWJjdU1KTzBnMGpTM2ZlM0xNVWhIZ0dXSm1rbFZQ?=
 =?utf-8?B?VENhU1ZDRjEraklmQ2I4MkNIOWVtL0hzcU1icXJWQWgyMnloZ29qN21KQlRP?=
 =?utf-8?B?dzd1eFc0QzNRSFZJcjljTk1FV0QyOGtETUxLRU5zVDJoVjBZM0NFbkRIaWsy?=
 =?utf-8?B?MmR6T3ZOcEZsa21nTUJEUVBWR2daaXFjM09UU1J4WEwxUjhwVGRjaG1aY0Zm?=
 =?utf-8?B?SWZNb2lBZzNncmFkT21XNVBENnNrYXdXc3k0RjNkL3NzdzlsaHJkRFQ4NzFN?=
 =?utf-8?B?QkdiaW1ITHJFb2V2bUZEZk5HYVJpaVlmcjA0bWFUUWphRnRycXZkSm5ZNWs5?=
 =?utf-8?B?ckNvbkxibXA2dk1LY3JBNGp3aEVMeWw3eGtRZy9PQ1hkTVVzUkN1YmQ2cWg3?=
 =?utf-8?B?aXBZU2JWUStXWDZFV0NmdXdZQ3hGNjFzNmx2bHZGNk9mSkgxSGVnaHFsVU0w?=
 =?utf-8?B?MzlxcXhXY3VrRTZrbUlSWU5FUmpFSFZQa0NraEdCOERVRlJZcitjcmF4VHlB?=
 =?utf-8?Q?/vRX8rgsiHGi2n2I=3D?=
X-Exchange-RoutingPolicyChecked: 
	Ntu+h0aoZH0pRUgzwSYItvz9U33ar21yNf9xBJ/m0Z15RhPVRmBSR92EQNZTHEdPrqnyTlT3F6RrrTY58OcDdavEa55ZSLjNuY3x4K6ZJO39SXj8ZdoHoHfi96Jl7DaUltvNDwcBhcnJt50K64zwqN8Uzj8JzZT6PxFY4ILb/H91RieTldJF19xIlGkNB/k29bkk9cBqh25ufuF475PD2AddbIDyXbquCt4ev+BFZTlTxm8L37La3UeZrnT+6T/gIOJBm9lJA7gUy1idTW3LFCvzmAfIjXndCzL+hs6HeCzop54CsBRTuj3Z26uO2Pcwt9YiNDOP75scY86RiToTeA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634824aa-89cb-4fbc-820b-08de84b03cc1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 05:36:00.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pPPeBmUQNN+r8IvwqGD7pMy0JYI/wH9WWd+bPOxpr5WsAnklKT6TZk0UWGwP5N/GYzXDRPfOWL3ZMXyhZQbqiVTzvNE+CUFxEYlTOXdV3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69ba39c4 cx=c_pps
 a=j0PM1b0aAxJgDjDzr34Dzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=1H9S5zupAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=i93dJGmBTYYcoMvmr_0A:9
 a=lqcHg5cX4UMA:10 a=PRpDppDLrCsA:10 a=O9Trw71uoXUA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=J4BESLnmobuwI1jA_H4A:9 a=LTrWyeBhj_mKmbqy:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=KJqDGGnLsJCYSyNEcnDM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA0NSBTYWx0ZWRfX56qnq9Xvl0AK
 nj2SlkiLwBy9BcE+44S4ZjTZqQ0sBfX7CkZ89xGzyIhjLNRN4OC71WGhVPji7LYj27kVXjWb0BS
 nKrksYA9bm+srwvyxv+DgJdl3HZUENG2XcdnqBNOYiCcdwmpH709rY3YhrkDcW05rNWHvfj7qvv
 AgqTVX7WLTV4oKacWIM07VS1hFDGCxY1bnnqX0ge1TH9ILlta23l/w/zAsL/Vu/PGWZz2OTa5VY
 x1N0TxnmbZ1Fy5IN5UKaByZ7gX4y1Y3WDFQKirOfkHabdz3b/FET06qhZ9TNDaexAv1KJPTIEiI
 mC7Hj8a/iMR+VvE6SetHAgsMZNwVtO8FDCq8pnYgnCGtbE/wO3Cb946uHdFxPGUCJaSwul2f4Jy
 mccJA4Tvg7tfYH8EZxvKF0KKf7gxRZdpJ8GWZKKUha3dBjgjGSTFHB9vpG5wI4C+afDze61fZzK
 43/QVsJGqD4OIoNy9jg==
X-Proofpoint-GUID: F0P1_yZtIMAx_L4zysOqVgpEgT_vw5ZU
X-Proofpoint-ORIG-GUID: L3p4a0tqY6oGhpmOFL73EE0InaOouj9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 05:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233358

--------------0lXjxnxsKmrzolYSs1u8SgQm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62I2AVMA3408355


On 3/18/2026 1:31 AM, Jose Quaresma wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> Sadineni, Harish via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRg=
NbFlqz30xa1maTf9B_kjeB1qQ$>=20
> <Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> escreveu=20
> (ter=C3=A7a, 17/03/2026 =C3=A0(s) 18:08):
>
>     From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
>     Move the rust kernel dpendencies from linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbF=
lqz30xa1maTf9B9txvlTIQ$>
>     to
>     kernel-yocto-rust.bbclass.
>
>     This centralizes Rust-specific configuration in the dedicated class=
,
>     which is intended to be inherited only when Rust kernel support is
>     enabled (e.g. via KERNEL_FEATURES).
>
>     Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>     ---
>     =C2=A0meta/classes-recipe/kernel-yocto-rust.bbclass | 2 ++
>     =C2=A0meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbF=
lqz30xa1maTf9B9txvlTIQ$>=C2=A0
>     =C2=A0 =C2=A0| 2 --
>     =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass
>     b/meta/classes-recipe/kernel-yocto-rust.bbclass
>     index 608ccc4609..49f2bfc1ae 100644
>     --- a/meta/classes-recipe/kernel-yocto-rust.bbclass
>     +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
>     @@ -10,6 +10,8 @@ RUST_DEBUG_REMAP =3D
>     "--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC_DIR} \
>     =C2=A0KRUSTFLAGS =3D " ${RUST_DEBUG_REMAP}"
>     =C2=A0EXTRA_OEMAKE:append =3D " KRUSTFLAGS=3D'${KRUSTFLAGS}'"
>
>     +RUST_KERNEL_DEPENDS ?=3D "clang-native rust-native bindgen-cli-nat=
ive"
>     +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>
>
> Any special reason to have this RUST_KERNEL_DEPENDS variable? It is=20
> not used anywhere else.
> I wonder if just the DEPENDS=C2=A0could be used directly.

In earlier revisions, Bruce suggested keeping these dependencies in a=20
variable assigned with ?=3D.
This approach makes it easier to customize them from bbappends and=20
related use cases.

Thanks,
Harish

>
> Jose
>
>     =C2=A0RUST_KERNEL_TASK_DEPENDS ?=3D "rust-native:do_populate_sysroo=
t
>     clang-native:do_populate_sysroot
>     bindgen-cli-native:do_populate_sysroot"
>     =C2=A0do_kernel_configme[depends] +=3D "${RUST_KERNEL_TASK_DEPENDS}=
"
>
>     diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbF=
lqz30xa1maTf9B9txvlTIQ$>
>     b/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbF=
lqz30xa1maTf9B9txvlTIQ$>
>     index f47873348a..4e230d405a 100644
>     --- a/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbF=
lqz30xa1maTf9B9txvlTIQ$>
>     +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>     <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbF=
lqz30xa1maTf9B9txvlTIQ$>
>     @@ -81,8 +81,6 @@ KERNEL_DEBUG ?=3D ""
>     =C2=A0DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm6=
4",
>     "powerpc" ], "elfutils-native", "", d)}'
>     =C2=A0DEPENDS +=3D "openssl-native util-linux-native"
>     =C2=A0DEPENDS +=3D "gmp-native libmpc-native"
>     -RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_FEATURES',
>     'rust', 'clang-native rust-native bindgen-cli-native', '', d)}"
>     -DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>
>     =C2=A0# Some options depend on CONFIG_PAHOLE_VERSION, so need to ma=
ke
>     pahole-native available before do_kernel_configme
>     =C2=A0do_kernel_configme[depends] +=3D
>     '${@bb.utils.contains("KERNEL_DEBUG", "True",
>     "pahole-native:do_populate_sysroot", "", d)}'
>     --=20
>     2.49.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#233331):
>     https://lists.openembedded.org/g/openembedded-core/message/233331
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/233331__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7s8y=
2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B_uL3UByw$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/118369300/5052612
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1183=
69300/5052612__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX7=
1oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9KMIuMgw$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-Sdd=
wJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B_ZpNUFUA$>
>     [quaresma.jose@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Best regards,
>
> Jos=C3=A9 Quaresma
--------------0lXjxnxsKmrzolYSs1u8SgQm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62I2AVMA3408355

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/18/2026 1:31 AM, Jose Quaresma
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRmtjsuAQtpv11A6cqwAow3mjM=
sErkH9hB3VT=3Dj2KNgpHw@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">Sadineni, Harish via <a=
 href=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!Aj=
veYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_Tqwu=
hSgmRgNbFlqz30xa1maTf9B_kjeB1qQ$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;Harish.Sadineni=3D<a href=3D=
"mailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt=
;
              escreveu (ter=C3=A7a, 17/03/2026 =C3=A0(s) 18:08):<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni=
@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">Harish.Sadineni@windriver.com</a>&gt;<br>
              <br>
              Move the rust kernel dpendencies from <a href=3D"https://ur=
ldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVx=
qIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9tx=
vlTIQ$" moz-do-not-send=3D"true">
                linux-yocto.inc</a> to<br>
              kernel-yocto-rust.bbclass.<br>
              <br>
              This centralizes Rust-specific configuration in the
              dedicated class,<br>
              which is intended to be inherited only when Rust kernel
              support is<br>
              enabled (e.g. via KERNEL_FEATURES).<br>
              <br>
              Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish=
.Sadineni@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=
=3D"moz-txt-link-freetext">Harish.Sadineni@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta/classes-recipe/kernel-yocto-rust.bbclass | 2 ++<=
br>
              &nbsp;meta/recipes-kernel/linux/<a href=3D"https://urldefen=
se.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GA=
O9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ$=
" moz-do-not-send=3D"true">linux-yocto.inc</a>&nbsp; &nbsp; &nbsp;| 2 --<=
br>
              &nbsp;2 files changed, 2 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass
              b/meta/classes-recipe/kernel-yocto-rust.bbclass<br>
              index 608ccc4609..49f2bfc1ae 100644<br>
              --- a/meta/classes-recipe/kernel-yocto-rust.bbclass<br>
              +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass<br>
              @@ -10,6 +10,8 @@ RUST_DEBUG_REMAP =3D
              &quot;--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC_DI=
R} \<br>
              &nbsp;KRUSTFLAGS =3D &quot; ${RUST_DEBUG_REMAP}&quot;<br>
              &nbsp;EXTRA_OEMAKE:append =3D &quot; KRUSTFLAGS=3D'${KRUSTF=
LAGS}'&quot;<br>
              <br>
              +RUST_KERNEL_DEPENDS ?=3D &quot;clang-native rust-native
              bindgen-cli-native&quot;<br>
              +DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>Any special reason to have this RUST_KERNEL_DEPENDS
              variable? It is not used anywhere else.</div>
            <div>I wonder if just the DEPENDS&nbsp;could be used directly=
.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>In earlier revisions, Bruce suggested keeping these dependencies
      in a variable assigned with ?=3D. <br>
      This approach makes it easier to customize them from bbappends and
      related use cases.<br>
      <br>
      Thanks,<br>
      Harish<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRmtjsuAQtpv11A6cqwAow3mjM=
sErkH9hB3VT=3Dj2KNgpHw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <br>
              Jose</div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              &nbsp;RUST_KERNEL_TASK_DEPENDS ?=3D&nbsp;
              &quot;rust-native:do_populate_sysroot
              clang-native:do_populate_sysroot
              bindgen-cli-native:do_populate_sysroot&quot;<br>
              &nbsp;do_kernel_configme[depends] +=3D
              &quot;${RUST_KERNEL_TASK_DEPENDS}&quot;<br>
              <br>
              diff --git a/meta/recipes-kernel/linux/<a href=3D"https://u=
rldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wV=
xqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9t=
xvlTIQ$" moz-do-not-send=3D"true">linux-yocto.inc</a>
              b/meta/recipes-kernel/linux/<a href=3D"https://urldefense.c=
om/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7=
s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ$" mo=
z-do-not-send=3D"true">linux-yocto.inc</a><br>
              index f47873348a..4e230d405a 100644<br>
              --- a/meta/recipes-kernel/linux/<a href=3D"https://urldefen=
se.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GA=
O9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ$=
" moz-do-not-send=3D"true">linux-yocto.inc</a><br>
              +++ b/meta/recipes-kernel/linux/<a href=3D"https://urldefen=
se.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GA=
O9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ$=
" moz-do-not-send=3D"true">linux-yocto.inc</a><br>
              @@ -81,8 +81,6 @@ KERNEL_DEBUG ?=3D &quot;&quot;<br>
              &nbsp;DEPENDS +=3D '${@bb.utils.contains_any(&quot;ARCH&quo=
t;, [ &quot;x86&quot;,
              &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-na=
tive&quot;, &quot;&quot;, d)}'<br>
              &nbsp;DEPENDS +=3D &quot;openssl-native util-linux-native&q=
uot;<br>
              &nbsp;DEPENDS +=3D &quot;gmp-native libmpc-native&quot;<br>
              -RUST_KERNEL_DEPENDS ?=3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.uti=
ls.contains('KERNEL_FEATURES','rust','clang-nativerust-nativebindgen-cli-=
native','',d)}">&quot;${@bb.utils.contains('KERNEL_FEATURES', 'rust',
              'clang-native rust-native bindgen-cli-native', '', d)}&quot=
;</a><br>
              -DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quot;<br>
              <br>
              &nbsp;# Some options depend on CONFIG_PAHOLE_VERSION, so ne=
ed
              to make pahole-native available before do_kernel_configme<b=
r>
              &nbsp;do_kernel_configme[depends] +=3D
              '${@bb.utils.contains(&quot;KERNEL_DEBUG&quot;, &quot;True&=
quot;,
              &quot;pahole-native:do_populate_sysroot&quot;, &quot;&quot;=
, d)}'<br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#233331): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/23333=
1__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz=
-LU_TqwuhSgmRgNbFlqz30xa1maTf9B_uL3UByw$" rel=3D"noreferrer" target=3D"_b=
lank" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/233331</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/118369300/5052612__;!!AjveYdw8EvQ!b2ICl_fi=
jVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1m=
aTf9B9KMIuMgw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">
                https://lists.openembedded.org/mt/118369300/5052612</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!b2ICl_f=
ijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1=
maTf9B_ZpNUFUA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blan=
k" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">quaresma.jose=
@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr">Best regards,
              <div><br>
                Jos=C3=A9 Quaresma</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------0lXjxnxsKmrzolYSs1u8SgQm--

