Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C997C5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 12:42:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5113.1748608933951576660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 05:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82453ef46f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U8xxiM006064
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 12:42:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5396gy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 12:42:12 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54UCgCLl015101;
	Fri, 30 May 2025 12:42:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5396gy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 12:42:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpkrm+Ek6LcD9G0WfmWCk6GGNxChu8iC9C2D6ddGSQ2qESZzf16lMADjY+WbKVWLmibfWs0tUzLR8yaHPtn3C2KZM0+UYxHjYjogW3+ZPx8FwoEIaHg62IDBpHhheJAnbKKY+Q3pLQvKkmMknx86+NXZcfTXaCQCZv/nIDQ2GlRjnQZ8/Qi7kj8eo9J+oka9+eYnrZjrBBr/yQcj1tHpt+RJWvCkGIxAHO+jIe0jWAEz7ooxVHATbyY/e528rnG21qSr6UqqcjKU6NqoRj77qa1phThEQ7Bmue/gsRhvFAhqI9/ss2jYe8mBdJIlBjdzUoPhgtGCsT8Fn9Qd3ZWeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fy36Xmxw37caLqCkRdZCRCiBxxlW+2b7Tlw8Dj9idMo=;
 b=YXkL6WMiQ6KPiQVXwpYDBnQMf9Q+mr9XKghvCJNxSyceo6BpZGYwuXm8nJiYU6/n8lmG084OpiGq23MXs0G7vdFprGnUCAGH5CXG/+p1MvIwsT599jtJRRAqCxowOm/szxBIqSoV/tZlOr/LylMcPZyVNww1KLWhVGWUTT1ygpYuIzTs4Pfh50oj4Sb5uuxBjdi38PrT5tLVtpTUZmQcu3FfxYqGnXin4gbPlFhjUoFrsZRlsWczZkN8fLzdG5fF80+sqm6MtRA9mepJISUGBJyvYB6W3EUTP3OEj6viC/ne+tKQehbHUkNwTP4XRTV6q8hPlnXLwxeyn+Oy3FK+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by LV1PR11MB8818.namprd11.prod.outlook.com (2603:10b6:408:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 12:42:08 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 12:42:08 +0000
Message-ID: <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
Date: Fri, 30 May 2025 18:12:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Khem Raj <raj.khem@gmail.com>, alex.kanavin@gmail.com
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
 <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
 <7571c07b-2225-4449-8169-08b044208072@gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <7571c07b-2225-4449-8169-08b044208072@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL6PEPF00013E0B.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:10) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|LV1PR11MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c5dcd1-d320-4dc8-5173-08dd9f7763f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3NBOTFKbktPajZlWDUrZXIrdENvUG01aU42b0twUVZ3SUV0YUxmbGdCang5?=
 =?utf-8?B?RG5Yelc1TW9xejVqQk1tZTVPS1Evem81SEwwMFZxUHYzOG9adU1HaFRaOHFO?=
 =?utf-8?B?OFpyL3Z4WlAzK0tBcUtUeW4wdUJCUFE4RmNvTzJSSkJkVnJ5S3FkaXhFQmV6?=
 =?utf-8?B?L1RFNHkvN1NsNG5PcnMrQWV0WmcvdVVzTXp2UXpubzlnTGRYcjAxY2JEYW9U?=
 =?utf-8?B?TFdGaEVaaTNrK0Y2OTc0WTFPc1g0emIzdTQ1SHRMMlVjZlhtb09ULzV6SkR4?=
 =?utf-8?B?VEJjV0p6WGF0V1JKK3Q3aTdkYTJUR3JWd2Yrd2k5WVllbzZDWjMxWUw3NU92?=
 =?utf-8?B?VVNwMk4vRmVxY3M5WmRyd3Q4VUQxa1Faam9McFlQdkpHaHBVaWRmdVN4SFpE?=
 =?utf-8?B?Y2Rnak1UYTVJKy8xRVFlS0pDSjhENlo0MnNvNSt2MStiQWcrVy83aHZYZng3?=
 =?utf-8?B?N1Zzd2txQWYxTFhjUkR6S285dG1TMTRIYXNmQ3ZqOThRUENOaDg4QnR2UDZO?=
 =?utf-8?B?V05RMldRN0piVUxRT3I5SzhWNDQyTHhXYUxCOCs0azZvS1hmTWdRejBYeDhC?=
 =?utf-8?B?V0xCL00yanY5dXRyQTVWbXd5WVhYZlM3dml1Qmo5bEpQREtZSmFnZjBBN0Js?=
 =?utf-8?B?ajFrdFNXUWkzcGNVSU5CazZWMWp5ZHpyRlJGY1g5bFdOUnJXNWIyWmdWcDdZ?=
 =?utf-8?B?VTUwS0RVUTZVci9lQ21hcWx2cDByb29LR3pHVmtBaFlzQlVSTXo5Nzd5RjYr?=
 =?utf-8?B?TjloaWdiRnp0NGxPZm5zeDhZTEU3ZnBVUFcrS2NQTG5sUG9pUTBVTWlNY3FU?=
 =?utf-8?B?eGdHa0pFbFYxdVFYemlBUXZZV1hXVDdXZy9UZ0tKNlI5dGNVTmNGYlRwSXJB?=
 =?utf-8?B?MUw3WncrcG9XNkJKdStMRFBuUWtYTjFWWW1JM0JkV2RNcWxjaVYySVd2UE90?=
 =?utf-8?B?MFRpMlQrRTROT2tuY3FOajA3blp5SnQ4djR3TGpneHdQTGdPODZGTnpJLzRV?=
 =?utf-8?B?ZFZROTl6eTJrZEJrVTBKeDZxZGVleXJSZHFhSWU4Z3BNaUlQL3lDalRhQ2hk?=
 =?utf-8?B?aVdBV2pPcExSNVI0emVLT3dIaEM5MXNFLzhnRmh0alR1NFFrRkRsQWNqVDFp?=
 =?utf-8?B?NThXTXoyeDhKTEJLUXdnRmo2UndRVExWN1BRUWlVeFQwOU03YmRlcEtEdCtM?=
 =?utf-8?B?SnMzTzFLQlNsb20xeG5vdmlYMTZ3OTArUTRLKzVqODVya3U1Ti9iSjNMSDVl?=
 =?utf-8?B?WExzVDdORnZRS28wd0V3NjRqdE1jdzBScWk1STdDMS9Sb01wS0dkejVaMUcx?=
 =?utf-8?B?Mk9RTEVGYlRJK1I2SjI0TGRQM0pkRldpck1HYlFIM1NlNG1xcUlGMVZLV293?=
 =?utf-8?B?YjIxU2krU0RqOW80U1FVVDZ1bHFVKzFIQ3p6dEMwcUZsM1ZNOEpQMy8zUXVa?=
 =?utf-8?B?MWp3aktJV0tkWHh0Vm0rMDB4VDg3UUEzZmRDYVdtSlFKUHI3NWFaQ2cxZkdB?=
 =?utf-8?B?aUJjMDFQS0p3Vk01MnF1eHN4aG5FSVR1UXFrSytLYkhLTVRreTJvbDBEb0JU?=
 =?utf-8?B?UGdjOWg4NVAyTmtjOWVDRHhLN2RzTjhKNDBRa3oyWmZFaXgwdDBrWm9EQ1RP?=
 =?utf-8?B?NzMwNVdrZ1Rsbmk5WnU5dFIxcm03K1kxUXVVOTJYd1U2MlZaSnhJTkp0bXJY?=
 =?utf-8?B?WlJaRFVhS1lqb1VJOFZCb0J2V2Q4V0paR3BYK05RbkFyNWhoaXBiaWRGT2Vw?=
 =?utf-8?B?Snk1OE1FQTZjRSttM1d0dUdLQWs1QTltSU9tMnREMVZjYzIzbllzYmhmeXdE?=
 =?utf-8?B?S25rcFJDc1FoQWk2ZWRFRVE0OHJqZFl0STBmSHBpL1ZCUHBGVHBSVEJZK3pn?=
 =?utf-8?Q?ARdIocEIODsjk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWs1RkhkR0NCRm00RXB3eCtnemN2eks3ek5UYm5TOFFCeVE0OHlrM0FFVzh5?=
 =?utf-8?B?MGpHNXZYTitQNExTQkdBY2pYQ2V3VTF1UnhmTXRPR29TVkxBcTVtUm00citq?=
 =?utf-8?B?WElQYU1RYnkwQnh6clVKNC8wMjc1aFAzaVpxKzFTOTVsUlZKVWQwajdXODAx?=
 =?utf-8?B?bFF0U281MEFCS3FDSFB3Tmd0ZTdGSmRhVmNhRkpLd2NUN0R1MlllTEtwdlhI?=
 =?utf-8?B?cG96K2lsNDRPS3k0aDlvc2tQVnYvQkhoOEVRaHFDRXZ1R3VwVitHSmdHa1o1?=
 =?utf-8?B?bVdWUFJNQmpGRmgwNHdnUmUrYjhIcHc2ZDI2Y2dPYXJkY2VmQUoxR0dubVkz?=
 =?utf-8?B?RnJMemU3T0NtYXNaUVNXUzZhTUZMTVV0SC8zR2FLWFpDdFhTbG1IWU1wYnJJ?=
 =?utf-8?B?R1pPaTBoN0lTQW1obWxxWmJlUk04ay94Z0UyeVd5dVFmNlBDUURFckV4eVpK?=
 =?utf-8?B?c0tsZEljd3Z0WHh4RGdxTlk2VG9JV2ppR0UreExyZUtFMnRMdVArUmljaXlM?=
 =?utf-8?B?b1pINXVPUGpNSVdnQ05ZaTBUQXhtTFpWbzYrTWtrMTcvRGQ0eFo3VmNTbHJh?=
 =?utf-8?B?bDZOd0NyeXBTMlhYNFpTWTdpL05mVDB6R1FaVlU4c3d5TjVTRUxzMzRXODgr?=
 =?utf-8?B?ejgxdSttSWtnem4vQ3F2VUdrMGM0MFFJK21TUTJ2djVudnNIVDQwNEdzcmFJ?=
 =?utf-8?B?OVQ2Q1VZWTlHeXN6UHJqa0dyZ3JhYnVDRllsWHhmVEQ3Z1dCZ051VHFGUEtH?=
 =?utf-8?B?YmJ3RTgwVmV6cXg5YmF6YkZ0TnRFems1TGRVcFdXdy9ucktlVFh5azFiNU1H?=
 =?utf-8?B?c09GNDFkdGRYQUR1b0tOR3QrVFZPVW0rdFhmSlNtVWdKR2hybkgwZlIwajYw?=
 =?utf-8?B?NHNuc1JqVHprUi9KcFZGcGwyVlM3R1dCeTRWckx4OWZBUjFqSVdMU1NHWE1w?=
 =?utf-8?B?RWE4Zk54eXp2UzRad241SS8zcWEralpCcUtsQWR3S1Q2WnYzYXZibnVwU25Y?=
 =?utf-8?B?SUNHRHVWQ0YyNTgvajlwd2txSlpqQ0o5dHQxVEZubHBaYmRsejhKZU1VcnU0?=
 =?utf-8?B?dFd5TXZUaFBaaVZvc280elVCNnpGcWM4ZmhRaCtXNk5jSDRNTXhCUkRlckh4?=
 =?utf-8?B?RGdBVXVZa1VaOE02bGxsZHV2QnN2T0JzWDBpVERkOE5JbXorTHVXVWllZ3pU?=
 =?utf-8?B?eDU5VTRsYU1RZHJjSGZkOGo4V1VnenlsUzdMZUdUZkQrODR3d0pvMUJkN2l6?=
 =?utf-8?B?ZUYxQWIrdCtjbXV4TGw1WXhQdHZXeVpqTklRd1YwWEFrRFRmZ0QzL200NFRq?=
 =?utf-8?B?N1VJSm9YejFDTy9yc0VCSGFsRW5KTEZ5QzFvRHd1UUN6ZVZzRXlhSTBDSnRn?=
 =?utf-8?B?MFBWSGw2V1NsTThkeXRiU2hXRGh4YmpETVBvbDArSjg3bHlweGh0RWtuVnpV?=
 =?utf-8?B?L2tCVEpVbXFTOW5QN3RXWHB4UG05L3hwM21valJCZlljczRFZW14WndOKzNM?=
 =?utf-8?B?Vm1sQXV4WnI0Q1FCeEdXdUVRSnd3YkZoY2xqUnl4TDI2MmpyTVIwSlVYajRa?=
 =?utf-8?B?NUp3M0ZnbWY0SGxyMzdSUEtYeHNwRHJ0d1IzVVFpUVppT0R3ZXovN2NCeVR4?=
 =?utf-8?B?WVB6T2RKMHI5cmxGV2FYNFp6L1FoVWZUMGJxV280N3NLVjBPSEZwWWJFbFBx?=
 =?utf-8?B?Smt2eGNZOUswc2NBSGtnUXBpenVuM3RSVlA4U3Z4MDlMQUFLTnhKdnhScmZk?=
 =?utf-8?B?NmF4Y1JGckJhS1p4SENuRHRFSGRlclhtTWhxZ3F2RUlUQUJLazZZZFhoZmhj?=
 =?utf-8?B?OUxkbGgyKy9FWDFRMDRPSFkrTzBTeW9ZQ1ZhTzU2UjFHQ1djUWNIemRSL0VC?=
 =?utf-8?B?dytVa1lzQzZxTlRManV0NzVVWTFzOGNDcEViYXhYTzU2bFJMOUtVSnpBOG5s?=
 =?utf-8?B?UmkzUXUzSVVFR0EzdmFMNndzQ2NEaCtHRzRsckxpZUpwY0l0NDNkS3U1R0ZC?=
 =?utf-8?B?ZDBOZVZGTTNpa0ZJUXhEMGtkaGlzKzVxZE01RGpQM2NQVnUyTGRwRC81TUQ0?=
 =?utf-8?B?RlZXNjV3b2IvSW5NOEhWMmxxdGU0RUw5aTM2SjZOZXZXZVVkWTVid043NGlT?=
 =?utf-8?B?MW8zSjU4cU5SaHFMZHdvaWc0d1VqbnduSXYyU3F2RHJCTWpiaDFZeDFuYUFr?=
 =?utf-8?B?eUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c5dcd1-d320-4dc8-5173-08dd9f7763f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:42:08.5855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJQ/yaz0ZaNXOvuU9/ckLUEWSaTNEyGTaf+mWx9q4CrM9TLO9m/LkG2jWsQn7QgjkLwzdQufvMn4/lgEJ0h+4CLWr+0f3f1NnnI61/gLCEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8818
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExMSBTYWx0ZWRfX4FpqGUQNF92j HLs3oPBcoBHg17riK9Uiyl5GYdRhsn2I18gsPsU1nVNyOEqGX5pHwBvH+SoaQxm2Tgwxipbhh9f l6/TvBKSLPyUdRIztUq6DZdJnz0VHfnj6Zz4RDjQTE1POlYXuDv/FDriVzcOdes65gOQ1+0wMdT
 KTYRbJteL4vzkHW8FFGg9MegkZlbLzwnMneM7QLClFlK4l6W26KgHfFC+9PHx8gn7Y6yyxMvtx5 pZVvr3X8ZfNrkyxkbiYZUuUJPVDTNOTiPl17ImNijpkjpKttCZrvxEM5HV9r3CbGq0CwqEuXtBf 7gKsKCAX/2nAjhUJoAWLP4xSfDDkNx/GJI3FEe0YWXxh5/WYaC1Vvgoxa2xHf+skFYCq7LTOV/1
 Bl1SCK0VUzxkrtJGdTYA4ExsFw7IqymHZO2uZFZlx+ZBR6nj7Z3XNLT4nAXiU4W5NGsKXjqH
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6839a7a4 cx=c_pps a=muyWlRJPjsGQ5kGVdURxew==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=4BcvXn6bacUsJDxYj04A:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: x20cW__puqEpldQpEwCBIUXXtdtt6QBe
X-Proofpoint-GUID: QTGQmJw8kzLNNvYORGSxy3O6sey2r9L7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 12:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217503


On 30-05-2025 08:02, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender 
> and know the content is safe.
>
> On 5/27/25 9:26 AM, Alexander Kanavin via lists.openembedded.org wrote:
>> On Tue, 27 May 2025 at 16:42, Yash Shinde <Yash.Shinde@windriver.com> 
>> wrote:
>>> Yeah, that's the reason.
>>>
>>> I am not sure how rust-lld is installed in ${D} now. A similar error 
>>> was
>>> previously resolved by using:
>>> "+TARGET_CC_ARCH +=
>>> "${LDFLAGS}""(https://git.yoctoproject.org/poky/commit/?id=cc24a0ff76f2e227cc3a0f478d078b2158299a80) 
>>>
>>>
>>> LDFLAGS are explicitly unset in rust recipe.
>>> (https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/rust/rust_1.85.1.bb#n194) 
>>>
>>> I attempted to remove the "unset LDFLAGS" in rust recipe and exported
>>> TARGET_CC_ARCH as above, but that didn't work.
>>>
>>> Is there some different or recommended way to pass LDFLAGS to rust that
>>> I might be missing?
>>
>> The issue isn't about how to pass LDFLAGS. The issue is that something
>> triggers building all these additional things, including rust-lld, and
>> you need to narrow down how and where that happens, and how to go back
>> to the install set (and build times) we've had in 1.85. Please get to
>> the particular point where that decision happens.
>>
>> We can't just double the build times without a comprehensive,
>> convincing investigation.
>>
>
> Try adding
>
> [rust]
> lld = false
>
> to config.toml, but lld might speed up rust packages themselves. So
> perhaps this should be capped under a packageconfig or such, provided
> this works.
>
I investigated the commit histroy between 1.85.1 and 1.86 and found few 
commits related
to building a "self-contained" LLD (rust-lld)as part of rust bootstrap 
build.
This results additional installations during the builds.

Here are the commits and PRs:

https://github.com/rust-lang/rust/pull/135001
https://github.com/rust-lang/rust/commit/8744b44e6bde053f7656a3c727c968177ee8e4b6

Additionally, there's ongoing development to make LLD as the default 
linker for x86_64-unknown-linux-gnu.
https://github.com/rust-lang/rust/pull/140525

As Khem mentioned, setting lld = false in config.toml doesn't build LLD.
Furthermore, using "use-lld = false" ensures that LLD is not used as the 
default linker,
causing the build to fall back to the system's default linker. This 
restores the earlier behavior.
Also, the package QA error for rust-lld is not seen with this.

Regards,
Yash


>> Alex
>>
>

