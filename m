Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCA4CA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 19:37:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4900.1790710633821723864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 12:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nDIIhNvb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47326640da=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE9Av92053464
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 19:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=W5fcuPgGlBKDa2Zsx3Gv4n
	Tm6rU162Qi5T6Y3Iio1LA=; b=nDIIhNvbIGJHO4+Hj9HL7jpzUDAz0zs76XmhE9
	U+NQw+nDIXHSWtFOqKOuSEcAcKl2AvPjZUbGy1X/ROADA9IwdpPbxpmZ9CPmPg6S
	KnE6IN3rHROgQI7OYbmkSayVZ4tYpn80VIntZ6wQhSd8STupX1i48eMpifnviysM
	EViTS5FEbrL0Foy/Pmh+h9lPw/x6h8CH80faORfBowe3D+qTUgD44foacBO1iu0O
	KDBIgGgYpkrpiVsLjWnChjdBXNnrLWF067kLQfiVrWiyoAQdcb5D7ihdxJb66eWb
	p5rXbWwzVlIrSfdgKOCDZLKwVEysitvdpoE+adlhJ0xMnipQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020086.outbound.protection.outlook.com [40.93.198.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515d760-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 19:37:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceiAYufoPlfB9GQU8j/1IR68Sb00Dekfa9KKJn1QDOeYNr93d46Si8L0o8L8TNlnakOS8jUposcL3n1rZRtGlluJaMug1YSXSat8Ngw0nnkvFGYQN9GCHpVcDJ7q5feYI8v9xnti2iUxf0ckovWTt4d5TH9bJxsrQanJvXLPMTrp9r/kQHAoe1vYezjU7iuHVDZRgLeiZs+DtCBHp6XD+k/g0XCE/PWYNdxnnvs9+QzTJKjyeVc/Kkkto50ggeh8Y4zs/s4wpIKOnctMRkQhL3pTsSgoliSjH60FZOh1T+6Qg4+xG5w8tfe+hX9fiE6hHFF2Nct/+UfnrbcXExnH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5fcuPgGlBKDa2Zsx3Gv4nTm6rU162Qi5T6Y3Iio1LA=;
 b=i4sXekgBSOFPMJDmtdzvxOKuD7PYGB++ChL2GNFeLxS1hPoTwRuCrjidN7jfBD8AnAcY1aG1A0ugmmlr5lEnqUNawrIfgxHsLqnCefR83MqQobe/wIoLzgr6cpLd8/mJuGTI3+Ez9j0E2r8q2WintwxFvUNfkT73USk7mbzaeJdb6H/ysVwRviC8fHPFYYZ8fYELqGQvDhHVn/pWddIvV/BtNjE6WqaswRxwzASEB3ZofJ9PtjoLGzaa9A6regvnzUxfD74LLhU5Yvlbs/UYfUZ7/chDTdqo6mQkKTKpjUbPMUGOdzIfIuZyynWgvP7lFmnGrUqe7XG2duNI3lUsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA3PR11MB7583.namprd11.prod.outlook.com (2603:10b6:806:306::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 19:37:09 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 19:37:09 +0000
Content-Type: multipart/alternative;
 boundary="------------Rl1c5MzZ80fwIC7gO0DVPl1S"
Message-ID: <aea86997-7b25-4f1e-8826-c9881e2acf33@windriver.com>
Date: Tue, 29 Sep 2026 15:37:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] less: upgrade 704 -> 710
To: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
References: <20260929160148.1379655-1-sumanth.gavini@windriver.com>
 <9a6b6928-0db6-4f88-954d-870ff32f8348@windriver.com>
 <0920899b-01ee-41cb-abb1-98cf2c0877ce@windriver.com>
 <f2dbc6adfcf389177181ae799179b0c4bb39b51b.camel@linuxfoundation.org>
 <9a92e609-4409-4cde-9398-b7269b200714@windriver.com>
Content-Language: en-CA
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <9a92e609-4409-4cde-9398-b7269b200714@windriver.com>
X-ClientProxiedBy: CH2PR14CA0015.namprd14.prod.outlook.com
 (2603:10b6:610:60::25) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA3PR11MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9b3a6b-63b5-4753-f724-08df1e610cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|13003099007|260925021911599003|10067099003|260925021311599003|260925022911599003|11063799006|56012099006|4143699003|22082099003|8096899003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	sTHE7V5nzVa6pGOD5NeDQGpgV/UqplOS14kN2YobBGpiZSub1WJ06AqDYrWOQ7JJFS5tVQTIA6pK5IXu/aPUXQPE9L47D+YKEGdxPcYOdHiJswnvq9gaS3HckoeBZ3rGihxYUvRUYnQHokeZxeIu9EZcdU2rz7EjQ25AGV/JXaKSd/EnsvCZRsjyjvDhgGjQyWStDNz4rbN//7DjEt/YiucLZrn3xig9qjz4f0Bkk5GlArT25ONQzruFQL0RllhtBwMWAShVHBR7kS2I7464rzzNJejaDHAF6YonGEX09YYY+GQ9IF1eVWbRr/700ami+HY2IEx4l4Vb8sYcbVC1d0dZCI7bv3EChMuqyEO6jDbVh1DQsRwmgHuS19k12QB/LaYQg82hNHsV+0ZAS+hv882A7bChqmZ+UVbErqludZOn9iKpL6i0Dz/XsbNfnZcGpaFVxhXIoBkKSOelJiysYD54ZYXJND/dPPT4VOpOB1Ax/wGwIwgdgJp+qFEid29xOsQOBTuj1d4fLgk9dyDdr/+ImcZg9k7HJeQS8UhrQozed6ARW2Lo4CJ0XTzIPYbMIzjqpxwlj0I9uTZmlPXKv3m/zc5E0snr5YYMnZibMYw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(13003099007)(260925021911599003)(10067099003)(260925021311599003)(260925022911599003)(11063799006)(56012099006)(4143699003)(22082099003)(8096899003)(18002099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEVxa0g2U3NlUmliRzQxczVHSCtIVy9VZ0g3SnQwSGJHdTdNclZoYXY5TFZu?=
 =?utf-8?B?SHBFV0gxVGpiVVZoWEVqdU5TRFp5VFgyUEtLcWVWOEVVbmVMV2R1VXU2TWtq?=
 =?utf-8?B?alVLRnAvK3ZIYWp5M2FjdFlpUktQMi9tWWYzRmV4dDFkTnpzTElmRHRRRmRT?=
 =?utf-8?B?RW82Q2N2bWJuMUNUZXJHRzVVdGFaVmpUNFI0MzlFdWo3WUwyQUFLZlVxa1pK?=
 =?utf-8?B?amRlaHQ0TUU4OU15SjVmdkgwRTNOTXBNc2FjdVU1WTNpcjc1Ung1Rzh0eVJL?=
 =?utf-8?B?ZVpNc3JQV21rbkxZeFJ3TyswNE9NQ2JXcXB6dU1kbExVTWlCbDlldkhraXlQ?=
 =?utf-8?B?NXp0N2djT25pWENiRm81UWVZbFBDN25FUkdoOTdHeXdCTlJOWUNFM284N2tq?=
 =?utf-8?B?bEp5cWdyeFFWUDFSWS93MzVRT2xnUXJxL1F5N1dRUnArOFRiODZ6NEFjUWNP?=
 =?utf-8?B?MzZobjQyNGdCYW1rY0REaDZhaW9IdEY3V0hvWlBVU2JQTlFsd25mMjMvM1Vl?=
 =?utf-8?B?c1g1MUxXS3dBRG5MN2UvQXprRzlGR05TdmdXS0ZWSkNkVEpNMHIvcHhGd3BP?=
 =?utf-8?B?bmtiOC90dnlrRjltTHZUcXRkeVpleFd4c3RZU1lQeGZxWlAralkzTGx0akRq?=
 =?utf-8?B?Y1RHN05nTFd3YTBmZW9SQjVDREFiZWsxRDdVTEx4SWdnT1RFcTFSUVdnTlg3?=
 =?utf-8?B?S1lhUW9WdkxrVHNCb0xWb09UZGo5ekdqazBiUTJ1WjZmMnB3enM2cm1zelFs?=
 =?utf-8?B?YU0wRjl3djdaRUlQMlU1VjM5UENVY01iV3daRzFod2hNMTJXMkxHc2JyeUVz?=
 =?utf-8?B?REZpcEVXc3lQYjd3SHB0QTdZa01GUTZYcENoQ1Vtei91WWhyK0lISW9vTjhp?=
 =?utf-8?B?Z3oxTlByS0lvUmVmUFRBRkQ2TGlTR0M2QzV1Yms2MXRINm5CenVZalk3OFZq?=
 =?utf-8?B?TUowOE5GeGZMOGwveURSYXhUSDRaQU14Q2F5TjkrWjdqR01sQ2hRSkJSMkZ4?=
 =?utf-8?B?ZnZCOWEwTDZaZ0ZTbFlpemZyK3ZESFlvUStwaXhmV0llQUVYWXIyNXVhaFo1?=
 =?utf-8?B?R29VMk80UFhUK3NjNkJsOFdSN0sxa0RwYmJGMEVNRW9YSjNhdXpxak5ORnZh?=
 =?utf-8?B?MDZFeW1PUDVpTzY5UVZheHN2bFI3WDFSZDdnM3B3TUJ5Uk9SZlI0cUVjMndj?=
 =?utf-8?B?Vk10R3VTYlRPZlpSZkl4QXlhNmd2NnhKSkdHVU9IVGNRRjBhVUJEMFhoUkMy?=
 =?utf-8?B?OHBmSzdUck1LZTcwRzRibXl0ZE4rM0hZY3Z0Y3d6ODRWZW54bklwNTlTRlQ2?=
 =?utf-8?B?YUxKRTRPdll4MlUxSFVCYU9uZEtKTWtiTmlBNW56cmpBYW5wczBwSkJCRHdF?=
 =?utf-8?B?VS9rUDZyUlR5Y1ZNbitkYWp1bEJKOWhTbHRmd25BR0dtWjBxSUxNVHNJOXMw?=
 =?utf-8?B?ZHV4UnViMW1iL3BBUGFVdEpxUkhlNnI5L2tMM3NMSWJtVXlPT0tPcFdOd0JP?=
 =?utf-8?B?dDkraENQRjZlcVR4N0JkM3N6QURaaWhVc2p4TkgzTjduK2Q3Q2JmeXh6Tnpk?=
 =?utf-8?B?TnYvMVFOZExmdHNnNnRwZTMxdnkzMnNtMDUyNlhSMVlCaXJvUEI2ZEFpVHRY?=
 =?utf-8?B?RE9wVzNRV0RpN3UxeUpreXExaDJJdzdOcnA3SjdnSU9IcnNjN1diczV1Uzl3?=
 =?utf-8?B?eTVIY1BtL1ppUmxWOGJkMjQvZG1QcjF2amxhMzYzSGdMaU9vaUlOb3JPRGFR?=
 =?utf-8?B?M0poQWxpelJGTjNQQllwa1lqRzVjRm9PSlJ3Mkd6VUhCQlBRcmw4NjIzVXU4?=
 =?utf-8?B?RXBjelNVVUtBcEkwUGpZcWJJZXVNaDB0Z2EwazZVOEZpUUlud0RUSTRKanlB?=
 =?utf-8?B?SVd2VzhIZmxXV3FGS2YzYTNBTkpMSDJjdEM4MHFhS0g3eUZKaGc3bWFOTnZz?=
 =?utf-8?B?WUwva1ZaZ1lMdG1aTHN2ZjZFT2ZhUzB5b2hsTDNkeW0rVmlqbkwrcHRFVi90?=
 =?utf-8?B?OEZuZjBzenlXTlhpSTEvNTZoaVBIazd2L2tveWp6WmozS3B2MWdrTmdtMUl5?=
 =?utf-8?B?MC9LRjgwM0hJd1NLcHoyMFJEaHFCU1QrTGhMVXB6YVVocnVCSEkzYjUzN3B6?=
 =?utf-8?B?YmNSc0Urakk5RzMvUkRuWnNVa2VFQk54MGJmWU5mckozTFlMZ2EyVG5YV3RV?=
 =?utf-8?B?WDVhTzB5UTFXbFdMUVF3dTNrVVJ5YXhBakJMZXpBRVJqN3RyWUFqZTJZMk5H?=
 =?utf-8?B?RjluTDAyVFQ3RzcxbWpadVhuSGhCbVZjZVlRcjFGVjVDa2xvZlZOVE01YW9u?=
 =?utf-8?B?cTgxYXZSWFUwY2JwSjBTdUV4aFVzY3dadjU4VE55eXRPKzhUaHlRV0QvbTJ0?=
 =?utf-8?Q?o5+I4vT4P4Azrhjo=3D?=
X-Exchange-RoutingPolicyChecked: 
	C4Hl6TykyAMKKCUZrIqFVcqKtK8ySjIYATsp6uIeETqsITpkE2fnnMEHs96QtncnaMPlHOH2ZS1qk9rL/CeM1IwO2WzpLYBtRs3GXak1zqRdc1PnRj2fozISHFVozP6MlDSM7W9YkVsSo7/dBkrsTGr/NyeV/B7f3PUVXM4yI05sIBP5k1AGjAXV3eSqkSmp5nhCF35BWi6W40nrMJ+mukp0ekGXw5tqmHOVjJ/lXOMwIN+L4IM5M4GL5rM0vyk7qBCs+Whl61cG0Tgyc5fRu6zR4b7g+iJTAOyDPomTdM5gypn5EJpCW2vksim4Q94TSUXvoZTOQ6w2/hqyLeuzfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9b3a6b-63b5-4753-f724-08df1e610cfe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:37:09.0326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1o7wOl1pXHoL4lCHrGIKfNt1Cru+2u3kEw+LXXYJtzxBsu+TWuqN/Qk9A22+a8Fjypys+ZQGbAKlWQVnkbIvM0F87djW8l3N2vO7WrqCCFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7583
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3NyBTYWx0ZWRfX6uFoMHrYngUG
 qxtbV8eHTuThOEZZqAvZ1L73wII/ViLd1hV5IE9O9P/sFrJG35pCL1ifMt+pVdDSLF3LrgBGzbH
 dzO0eSjhNDyoy/Iszr9zPDnfkzo9fr+hed2zyEua7tXismh4l96X
X-Proofpoint-ORIG-GUID: k6R2Ndf3tsuX3e9CRXa-2xA7_fiXAyhM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3NyBTYWx0ZWRfX9vhk61wYm8sx
 6ZTSuaGzF6lkzYHASQj9Wld4e4WZqSZi+EkR+P4TmIhG06HGsGKUyzCmxkWAEq8o7JFGfWP+9Y6
 xeZMT3YVf4JzIUNT1lZfM3Lt72qfbD8EvuXOztpiE2EawiDULpphIMQeegkjoK7GiV5icFsnBbq
 g7kESmP2RFZ5yHqRgdfJLqyNjdEC7fM0oVf/nMjKzH2tqSeQc40d7SG52XOdvf+bED4y3OMwHiH
 bkddc3bdzcyCHjDubrMvhe/kzB0i1ioJ2qcFsfE3vY5pzcHK8BLhODsvyd6nEiVp25pkLVwO52h
 mTCbmDzhCinGy8M6kL3o0JaJZloR6OeoFe1peP6eVbfRzYT+KGgU1sXB67PspL7H3v38qUWFa1Z
 uuZBgFU6P/vcu+bjCRsHF9VKC1KDTM10PjzfwinVMLgV6OHXyE7K/6JgxG4Kpkd/NjUEGnPyTOw
 OJY71oKBW+Jb4H8TssA==
X-Proofpoint-GUID: bJsNiM-jfULMgJvCvf5evSlAgwdfbUAe
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6abc1368 cx=c_pps
 a=lEAsXE5stpqivpVhnk0CUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=4avBbA3pAAAA:8
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=IvQJNAUUq8ru2VKf7xoA:9
 a=QEXdDO2ut3YA:10 a=yj-aMKAYKbz0kkd27lYA:9 a=SFCMPDM_AB6ptqXA:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FNuvnhAvCZ4ZEIA-sn9Q:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 19:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246892

--------------Rl1c5MzZ80fwIC7gO0DVPl1S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-29 12:53, Gavini, Sumanth wrote:
> On 9/29/2026 11:41 AM, Richard Purdie wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> On Tue, 2026-09-29 at 16:31 +0000, Sumanth Gavini via
>> lists.openembedded.org wrote:
>>> On 9/29/2026 11:20 AM, MacLeod, Randy wrote:
>>>> On 2026-09-29 12:01, Sumanth Gavini wrote:
>>>>> Changelog is here:
>>>>>
>>>>> *https://greenwoodsoftware.com/less/news.710.html
>>>> Recently, we prefer that the release notes/changelog content be
>>>> duplicated in the commit log
>>>> so that it's available should the page disappear from the internet.
>>>>
>>>> The AUH report had that:
>>>>
>>>>       [OE-core] [AUH] less: upgrading to 710 SUCCEEDED
>>>>
>>>> Otherwise, this seems fine.
>>>>
>>>> ../Randy
>>>>
>>>>> Signed-off-by: Sumanth Gavini<sumanth.gavini@windriver.com>
>>>>> ---
>>>>>     meta/recipes-extended/less/{less_704.bb => less_710.bb} | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>     rename meta/recipes-extended/less/{less_704.bb => less_710.bb}
>>>>> (94%)
>>>>>
>>>>> diff --git a/meta/recipes-extended/less/less_704.bb
>>>>> b/meta/recipes-extended/less/less_710.bb
>>>>> similarity index 94%
>>>>> rename from meta/recipes-extended/less/less_704.bb
>>>>> rename to meta/recipes-extended/less/less_710.bb
>>>>> index dc841a9ae6..f3f5ebd6a1 100644
>>>>> --- a/meta/recipes-extended/less/less_704.bb
>>>>> +++ b/meta/recipes-extended/less/less_710.bb
>>>>> @@ -29,7 +29,7 @@ SRC_URI
>>>>> ="http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \ 
>>>>> file:// run-ptest \ "
>>>>>
>>>>> -SRC_URI[sha256sum] =
>>>>> "20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb
>>>>> "
>>>>> +SRC_URI[sha256sum] =
>>>>> "d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a
>>>>> "
>>>>>
>>>>>     UPSTREAM_CHECK_URI
>>>>> ="http://www.greenwoodsoftware.com/less/download.html"
>>>>>
>>>> --
>>>> # Randy MacLeod
>>>> # Wind River Linux
>>>>
>>> Understood, I will be sending V2 with changelog content
>> I did already try this. The ptests need fixing, see:
>>
>> https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=2e8573035a95f386b623f64d7e6aa069fbb954f5
>>
>> however I believe that even with that fixed, there are ptests in other
>> packages that use less which break, perhaps in zstd?
>>
>> Cheers,
>>
>> Richard
> Thanks, Richard. I'll look into it. Is there a ticket for this?
>
No:
https://bugzilla.yoctoproject.org/buglist.cgi?chfield=%5BBug%20creation%5D&chfieldfrom=7d&list_id=664525

We don't need one but you can create one if you like.
../Randy


-- 
# Randy MacLeod
# Wind River Linux

--------------Rl1c5MzZ80fwIC7gO0DVPl1S
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-09-29 12:53, Gavini, Sumanth
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9a92e609-4409-4cde-9398-b7269b200714@windriver.com">
      <pre wrap="" class="moz-quote-pre">On 9/29/2026 11:41 AM, Richard Purdie wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 2026-09-29 at 16:31 +0000, Sumanth Gavini via
lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 9/29/2026 11:20 AM, MacLeod, Randy wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 2026-09-29 12:01, Sumanth Gavini wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Changelog is here:

*<a class="moz-txt-link-freetext" href="https://greenwoodsoftware.com/less/news.710.html">https://greenwoodsoftware.com/less/news.710.html</a>
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Recently, we prefer that the release notes/changelog content be
duplicated in the commit log
so that it's available should the page disappear from the internet.

The AUH report had that:

     [OE-core] [AUH] less: upgrading to 710 SUCCEEDED

Otherwise, this seems fine.

../Randy

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Signed-off-by: Sumanth Gavini<a class="moz-txt-link-rfc2396E" href="mailto:sumanth.gavini@windriver.com">&lt;sumanth.gavini@windriver.com&gt;</a>
---
   meta/recipes-extended/less/{less_704.bb =&gt; less_710.bb} | 2 +-
   1 file changed, 1 insertion(+), 1 deletion(-)
   rename meta/recipes-extended/less/{less_704.bb =&gt; less_710.bb}
(94%)

diff --git a/meta/recipes-extended/less/less_704.bb
b/meta/recipes-extended/less/less_710.bb
similarity index 94%
rename from meta/recipes-extended/less/less_704.bb
rename to meta/recipes-extended/less/less_710.bb
index dc841a9ae6..f3f5ebd6a1 100644
--- a/meta/recipes-extended/less/less_704.bb
+++ b/meta/recipes-extended/less/less_710.bb
@@ -29,7 +29,7 @@ SRC_URI
=<a class="moz-txt-link-rfc2396E" href="http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz\file://run-ptest\">&quot;http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
file://
run-ptest \ &quot;</a>

-SRC_URI[sha256sum] =
&quot;20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb
&quot;
+SRC_URI[sha256sum] =
&quot;d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a
&quot;

   UPSTREAM_CHECK_URI
=<a class="moz-txt-link-rfc2396E" href="http://www.greenwoodsoftware.com/less/download.html">&quot;http://www.greenwoodsoftware.com/less/download.html&quot;</a>

</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">--
# Randy MacLeod
# Wind River Linux

</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Understood, I will be sending V2 with changelog content
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I did already try this. The ptests need fixing, see:

<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=2e8573035a95f386b623f64d7e6aa069fbb954f5">https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=2e8573035a95f386b623f64d7e6aa069fbb954f5</a>

however I believe that even with that fixed, there are ptests in other
packages that use less which break, perhaps in zstd?

Cheers,

Richard
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Thanks, Richard. I'll look into it. Is there a ticket for this?

</pre>
    </blockquote>
    <p>No:<br>
<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/buglist.cgi?chfield=%5BBug%20creation%5D&amp;chfieldfrom=7d&amp;list_id=664525">https://bugzilla.yoctoproject.org/buglist.cgi?chfield=%5BBug%20creation%5D&amp;chfieldfrom=7d&amp;list_id=664525</a><br>
      <br>
      We don't need one but you can create one if you like.<br>
      ../Randy</p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Rl1c5MzZ80fwIC7gO0DVPl1S--

