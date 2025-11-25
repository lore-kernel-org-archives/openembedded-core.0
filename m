Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F08BCFD368
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 06:56:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11775.1764053776727350157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 22:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=E7DxD85O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34243e2576=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP5onCv2878977
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 22:56:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=S1QTUyN5YrBVMB0Sor8PS7
	aGgRMrBTnIzKAgQ5E18Q8=; b=E7DxD85ORXglHGbdMoNvZxgnnPi/mF7a4su+22
	bjiAQ75BYDqO990LhsONy145tQLciCNSDYSUQ0skGnnmE2XM9WjovxwLIcbXSLPq
	RpqJtUTp3mUYQ9+sYHZq5LgC9dUJLE/IqTD9K4E/NPbe0ny89jRRiWt5klVwmpNR
	G61wcF72XTLqU5WkNg2nx1yQSJT+dpmWmNhc0OD40mKLg87sLcBB5yMXm0RFNxwo
	UOWwZUHMyJ9Y8LGvW5hn2h9mSDfAo2TmQEvzKSkoIgiNQjQQ5+Zigh9VkAda7C5I
	zCMKoZ0t/HK506AjIeR4h5fmQCTUz4U6z8A6s4YzBR2GPtOw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjjaeu6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 22:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJafAPW1srHkrHIsSC8VoTe+vWnCXDD1dKmSzp7nencmY2giDFWifMS6B64P/L6ptQGGv7HmgaQ6oEkuDI5wMROyzbcUjFyycbp6kBw0u7RrLovMH8EhycHITsY1Ijp4CHgcTynk/HBNTcavqRyw8adVGs3u3gbB1XL8EoHkI8xtvoJWvh9VyeC34ZBRLgQx/Sxj/nSaBo413EmZ3BYFuVL4+fB7h07QU3HF3RRI8mto/eRrmtB/dvhL9ABrK5hc4ABHTWjhQ9Js4NMUQ6aXWGpAvLbJDzWNdAHosvdatRSAD6SsVXPzi9+GKhpHqHtRJUOZrwmCrgRLI/vD/wNlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1QTUyN5YrBVMB0Sor8PS7aGgRMrBTnIzKAgQ5E18Q8=;
 b=eZ4L34FiUdk07T6Nis9PzGVUeIO1wcqH3BWFEUDMUaNn5KfwLORYG5QQgz2ccZUCQdxxoBewEjAfo+qbvStdCaRA+3eT0HIxXlrGGwqbEaWZDhF3erCUU+v62TMTz/r8bJ9ltYrXVwVCNVyVKishMBx36JzsZkuMma25BxaKWAu4m0li82xCXXYMWcX3zxElQ4916Qc0ebTW1LRCUHh1ezKHBcC1TmrvPciiGOA6gnCcBTNtuqNNMEjKcs8pRjO627ZqQq6Tt2tIBy5eyy3mVYqgU18u8Az7BQUPKNXpOBWiW86ZqUzjygatXTKvjNP+/D/ZwCEBfwdYO1P34n5oWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA3PR11MB9134.namprd11.prod.outlook.com (2603:10b6:208:573::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 06:56:10 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 06:56:09 +0000
Content-Type: multipart/alternative;
 boundary="------------JaZBScKpymEnCfHvRpgBsQsv"
Message-ID: <73899be1-bcc2-4da3-8ac2-d629742f33a7@windriver.com>
Date: Tue, 25 Nov 2025 14:56:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed
 respected
To: Moritz Haase <Moritz.Haase@bmw.de>,
        openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20251124055533.857103-1-Moritz.Haase@bmw.de>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <20251124055533.857103-1-Moritz.Haase@bmw.de>
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA3PR11MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f1389d-18a0-44b1-0f48-08de2befb6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2UwVVdjYU1SYkl2ZTc2bDZvUkZDaG41WnhINVpOdUNCL2tRRnl0WHlZLzRL?=
 =?utf-8?B?d3ovOEpWVUxsRXp1b1VBdW9qRW5KcFlIeUpBNXNndS9LT2Rsc1BpbW9kTDl5?=
 =?utf-8?B?MHJSNyt4NUpUeTg2MjVRR0h3ZU1wNmZlY1B1WlM4VmJseHFlM2J4WnV2Wmtm?=
 =?utf-8?B?cnpIK3pRMm5lMitwTEYyMmlVc2dWRExZSy9DWE5xc0QyVzBkL25TK0ZXN3JQ?=
 =?utf-8?B?by9XNnhmOWp0cWxGelBoWS9xd3BiRklaOWgzWTJYYmhlSWVEUE91NncxQzlL?=
 =?utf-8?B?Y3F6K09HNVRDSGIwNHhoYWhramZVZVdYRnEvRFFNem4vTzN0RGpLeUNKT2lT?=
 =?utf-8?B?WkFyVFlKbHlzYkFpaXRkb3NvbmZBZGhvZVZsM2Joc2hmMEpJVUNBdnE3dWlX?=
 =?utf-8?B?NXRKeGo2RllNc3ZWUS8zeS8vbzl5dU1RTnYvOHZFNVhORUlSc2hwZkZWYW9z?=
 =?utf-8?B?SjlXNTQ4c2ZiOCtjOHNvckFnd1EyWVRBMkNLc2hPZXFwbDd6ZmxtR0RCTGNx?=
 =?utf-8?B?dUdYTXMrM0xXZTgxbFBuOFVoMUxBT3RaZy9ramx6amlVQ1VPdHhHRlJNQkIr?=
 =?utf-8?B?eDhSMkRwTnFDNlhmTlZqckZCN2hVaFl3MjVLdlRFM0VGbkE0Ti9IWmFnSWwr?=
 =?utf-8?B?dmhoSVB1QlJpS0Y4QnhvRXgyY1BOR2FUK1dmK3hJY1hEVVUzbW4zNXZuSFVi?=
 =?utf-8?B?Y0JoZUVxa2phSnNsNUVIbytENmcwQmdjMksrc1ZwZVQxU1NZZUpPNlpUTlIw?=
 =?utf-8?B?b2plNHVFZkYxU0ZWMFcrNVlTV0hjc0kzSEo0NzlSQ3FSWVJheTJvU3YwMW1N?=
 =?utf-8?B?M0ZNbHh3cTBiWmlYVmkyWjR6VnN4TnZmMFYySXRleUY3SVlRUmZyYVI1Qmwr?=
 =?utf-8?B?a0VGbjYwL1RQMzFjUSs1SDF1S01ZdFNPNFhnRFJTRmtLK1pjd3dCa1BaVkNP?=
 =?utf-8?B?ZTBvM0pUTUVWaVA3M3RoTnI4eUV1SDdnWXNUQUJUbkJFNmY2SThrUElFbVJG?=
 =?utf-8?B?T2lLU2oxT2M0TUl4eEtrckVmYktydDFHZ000TCtZK3p0NmVlS0t3Qm94b3o0?=
 =?utf-8?B?TmRrOWFvVDkvemQ3Q0doRDEyRG1JRmRkbU5SaStkK2Nub0RVWXBRbkF4RHNM?=
 =?utf-8?B?b1Z2ZzZnZFZhaDk4aW40Y1pSNHZBbDY0cXUvZE55NnpzRTltVFJya25NanZT?=
 =?utf-8?B?bDJIQWoxVERkNG45OEVLYzdJVFpWM0lsYm9kMy95VFp0ZkdNY1FuZFBTNC9o?=
 =?utf-8?B?UWlOcHJoWTMvTUlleVpjb3lsbThjQS82K1V5eDVWU3ppczl4cUpVSFNHZHB6?=
 =?utf-8?B?TUxOa21UamtzQ2JLMmpwdG1UUElxZ3pLc3FnY25WeUIrU20raGt6b2dGNkly?=
 =?utf-8?B?WGpMSnJlbnVRTFVzTXpXcTd0NzNNQ2FJUW93T1RDS2FtVytUTkdSQVpDOFg2?=
 =?utf-8?B?dnZqVTdrMU1yVHBpVjVsTGdpZndwQ00rR0tJaHRGQ3lFMC9kK0Q3dmtWS1Yy?=
 =?utf-8?B?K0hNOWY0dE1DOWFwWDlGQ29XOWdlekZrMm96bkJsalV4NEl0Rkw0N2VKRHhZ?=
 =?utf-8?B?ZnF2RXRmdVJiMWdWMUdESzhWUEVaN0JQTk5QNmtZUWpBYms0aGdyUEVweUNN?=
 =?utf-8?B?NnVkN3dqNkNpelBYZ2dyNnFxRkdRblpSZ0pSVEhBMkhSQzZQaldaMmRjQmpq?=
 =?utf-8?B?clJjTGhyTVRQa1BmOExpcmlwbjcza000dGxoRmUvaFp4Z2daSTVJS3EzVzE5?=
 =?utf-8?B?YSt4UDZ3R3U1TDBrZWZWWFlRRnJTZUthZWMvKzdBdUZUUnJJT0s2N1FjcGZ1?=
 =?utf-8?B?NHVLRHdmU0VzcmlhYWdaSU1jSUFsRnVVMW1IYWpoZng2MmpXR2FVWklSUjRU?=
 =?utf-8?B?WUdHNXR6anVyUTYrM1VvcStUejZ4RWorMElwMFdvUnFEdFZHUWwrajBaZTU0?=
 =?utf-8?Q?rxOx6zoChDBfCiTAstAYAAy14xyIbz1K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N05RNTRIdTF3ekE4TDBkSG5LeUZVNmIyS1VKMUtGM2JSYzRscUtnR0dTaGw0?=
 =?utf-8?B?VzFaWUQ0L3FFLzYzb1R0V0xqTzI3TzJTanYwd2k5RjUxR3Y1bFZuUVRoS2lL?=
 =?utf-8?B?T3ZJemtBSyt3VVlGd1M2Ny9zc2Jyb3podWp6VWVITUE1Z3c0YldGSFhqQ0ZI?=
 =?utf-8?B?aEpJMGFZTWJMb0NHSWtQUk5wNTlaUExPTlhyRnF0Zm8vcTEwcmZNZ1o0WUVz?=
 =?utf-8?B?bVdja29xaEdQUVQyRDdGaUcrdDVKRkVSbkNoaHV4Y0NVTDdIUS81enQxRFdr?=
 =?utf-8?B?YzlOcnJsaFp6WDJ1YlExMkpKRHZ4Q0ZhUWg3dWp1VFF0YzVMYk1OcGVEVVBn?=
 =?utf-8?B?U3MzcUFQVzIyaWF6M1VUTDI0S2tGa0hiZlJic1JNRGpIc1AxOTdIZC9CTE5y?=
 =?utf-8?B?RW02YSt4bEtuN2ozZ3k2WFJWSXpFcU5ZeVZVQm94S0hLdnVQOEUrSEUrTVND?=
 =?utf-8?B?R3l3ZXdjWCtQV0l4dDd0bFNOMnZJWjBLLzlEREozaURTVDd2VTFxK0ZVSld5?=
 =?utf-8?B?dlMyRGhnRnZ3TXpRbFhBL0d5VmlUWDA3WkRMWjE5NnEybGZaRlJEU1Q2aTFL?=
 =?utf-8?B?aGtHdzgxNFF2WllPZHRjVnFKWFlzak9CbVdEcnU5ZzJncytpVzZVOGFOTnR2?=
 =?utf-8?B?SUpXRkVWWTg3MXgxMnk3Q2hhd2twMjB0Q0tONFFPakt2b1ZVYjVqWTBPQTVv?=
 =?utf-8?B?d0taVmNYSEJSQjV1akk0cG1SeEdwcGtCRGtwbjhDKzdsaU0yUGhvV3BLb2Mw?=
 =?utf-8?B?aFpEMERVK0FwSktCYjdRNFVrdU1LZEUyampJalNQRU5CTUtWaGs0WGZ2MUNI?=
 =?utf-8?B?b1ZQcFFXZ2VibGFETXpMMFNFaGFTemlCYVFBc2FpcVNJa1IrbFRhSkE5VG5a?=
 =?utf-8?B?bTZOd29maDU0OWg1Q3VTVTNONHduTlN4emJOYWpuZGd3elRtU3QvZ0lwN0Ev?=
 =?utf-8?B?M01rMW1Ra29ENDdHaTdoKzdXVnB4YnVPTXBzeDdGbXJFYmVXc0lMeUpMbmZU?=
 =?utf-8?B?RGVzR3ZDb1VOSVgwdzVPM2NXb1VaNEhxdW1zYWkyVWR6UmF4SFZjZDVPZVJL?=
 =?utf-8?B?NDhMZnNORGhFcE5NcSsxTWJQVGRMeHl6S2ZZbnJwam40bnVaVmxrVmI4MEx5?=
 =?utf-8?B?MEY0ME5PKzJ2OE16ZmUrWEcycUxZZXRZMG1hTXBRS21qa3FNK21MeHJuVnl2?=
 =?utf-8?B?SHVQQS9MZlpjeUxhMGtEV1NmQ1pBUmdrZ1R4ME1Ba1ZKY3NjSGw3T0ZTV25X?=
 =?utf-8?B?QlMxOWFMdVdzV09NZVJEdVpDSDh3anJxT1hySUg2QWlzb0w0ZGZrWmsxR2pT?=
 =?utf-8?B?ZERsUlEwbWx3bUtOMEMxNU8rb2x4Ym9qWVVoTGxxVGZDTVhnYS9zdkNhYWt2?=
 =?utf-8?B?WnFuSXQ2VjQ2ZzhnZEFLZS9xRlRpRkxBM1pxWDNFT1VjN3BMZlY2Ujd1akQ1?=
 =?utf-8?B?WktaQkFzelFadVJTVHExS0EvYXc4cHQ1WmdtQmx4Qkw2YmFkczBabExoLzJ6?=
 =?utf-8?B?a0R5WFJPVUljNk15ZzMybzRxWC92VlA3eDVYdC9LTHdGTlJleUoxekFkMENn?=
 =?utf-8?B?NnZqNmY2Ym1mOXJnWUtBQlZHYUJYMXZtaHdXNzdDTzZZMlJGSWRzdHNoYXds?=
 =?utf-8?B?eTh2Wkdpd1FxOGVhTGJUbEZPNlEwbnRnR0xPc09rSFVyMDdORGxNNHd5TzlS?=
 =?utf-8?B?QnVneE9jbWhsR3BsdEZtUTMwa1lKcHFBajh2UGFWbDVzbWFNUmNPdEE5R0JH?=
 =?utf-8?B?RjV2dnV1alhzYm1iOTYyd2dBUzk0NFFHQW1BRDdRdDBMQk9Ca2syRDgzQWl4?=
 =?utf-8?B?M2VKWFVVeHZkT3JabFZHR1M4TTkvWE5jZFVMVHdKZnEyRlA4bU5MWHIzOWpp?=
 =?utf-8?B?dFVleFRHNGQ4VjhZME9ESkRYWFk3dTh3OWtPRWZPRGlURkJwYUs2YmVrME5W?=
 =?utf-8?B?TE1wTllrUjRTN0hlVUxWVVpoaHo2Tk1VK016enY1R2hsbzVndm5BTXJwdUxa?=
 =?utf-8?B?MjA0NkEvc2tNWVZHaHZ5YXNjZzBGRHpCU2ljblU0QWZlM3duSjBOc1YrSU13?=
 =?utf-8?B?K2lML0RvSXZrdmM1Mzh3VXdSOGs5eFVYSkUvbGhaSWQ0VTJSZWpxRlpQekdh?=
 =?utf-8?B?L0daZkEydHZXb0VCa2M0UklNdS9aYnFSbHV5TjJOd3o2YklTb2xmR3JqWmFx?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f1389d-18a0-44b1-0f48-08de2befb6a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 06:56:09.8574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3tJdxjWMO8+0WjC+7eixzKynaCGSj734q8NawRh3n+tNWOssx+muPJImy77h+wPrd5BsbdeaketThY8EvRvrsBS9VUNkWdrFM4WhvHiddw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9134
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NSBTYWx0ZWRfX58Tq4IWfH3xO
 BesBeWoBGkSKDbK+gZfp7cDeBZ08n0A+1z7oqb5z7S7oUs6bvTh734zCzqbaPM6ap1xq9tMMgzd
 bKlQfcjzOomRqIg8nC4262zPNNqadfSn5WeqTSBXZiOfjoT+b1/KmgUN8Gjo4Kh7lAvPaoRUtpo
 UlYXb4jBC5F73ZMxJ4eOuyzxlSOlG2jNO1JZy4docvdcERDsV+MSk5WtcSdLMEuO2XNTMeIGCMF
 n8ypvXkXCxsv556uoVioby12fc4zu2HbfmDfMP+BMVT4oJ7TD1wsIkZhUseaBmXM1r2ufi1mNc5
 W1nXPD0CQwvyLilrd+vUTBaGcLee3+E0EoXcjeGnLypdlD0Cfc7PCEKmaDPHL9Y1Q8Yk7x3K0is
 Zkjd34QVGeitE2rbZ8qENvpnBIOxlQ==
X-Proofpoint-ORIG-GUID: _5FdLWbEN0_MPmOHfYkyftUd9RUadLOU
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=6925530e cx=c_pps
 a=3IxC/HLiWPPRhiYFHlIRMw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=YLVSbKSnXQcLARK_lBYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=wvPkM9v7g1_ikmSEda4A:9 a=C_JTt94QPBfM75Sg:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Sn4Z1o3Nil1Dd67wQQg1X4dN8oZHgOLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 06:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226750

--------------JaZBScKpymEnCfHvRpgBsQsv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AP5onCv2878977


On 11/24/25 13:55, Moritz Haase wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Due to what looks like a copy'n'paste mistake, the environment setup sc=
ript
> might override 'CURL_CA_BUNDLE' from the host env instead of leaving it
> untouched. Fix that.
>
> CC:changqing.li@windriver.com
> CC:raj.khem@gmail.com
> Signed-off-by: Moritz Haase<Moritz.Haase@bmw.de>
> ---
>   meta/recipes-support/curl/curl/environment.d-curl.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/met=
a/recipes-support/curl/curl/environment.d-curl.sh
> index 581108ef35..b948db2cf6 100644
> --- a/meta/recipes-support/curl/curl/environment.d-curl.sh
> +++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
> @@ -1,6 +1,6 @@
>   # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detec=
ted host cert, then cert in buildtools
> -# CAFILE/CAPATH is auto-deteced when source buildtools
> -if [ -z "${CURL_CA_PATH:-}" ]; then
> +# CAFILE/CAPATH is auto-detected when source buildtools
> +if [ -z "${CURL_CA_BUNDLE:-}" ]; then

Look good,=C2=A0 it should be a copy'n'paste mistake. Could you also send=
=20
this to Scarthgap branch? Thanks

//Changqing

>          if [ -n "${CAFILE:-}" ];then
>                  export CURL_CA_BUNDLE=3D"$CAFILE"
>          elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certifica=
tes.crt" ];then
--------------JaZBScKpymEnCfHvRpgBsQsv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/24/25 13:55, Moritz Haase wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251124055533.857103-1-Moritz.Haase@bmw.de">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

Due to what looks like a copy'n'paste mistake, the environment setup script
might override 'CURL_CA_BUNDLE' from the host env instead of leaving it
untouched. Fix that.

CC: <a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>
CC: <a class="moz-txt-link-abbreviated" href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>
Signed-off-by: Moritz Haase <a class="moz-txt-link-rfc2396E" href="mailto:Moritz.Haase@bmw.de">&lt;Moritz.Haase@bmw.de&gt;</a>
---
 meta/recipes-support/curl/curl/environment.d-curl.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 581108ef35..b948db2cf6 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,6 +1,6 @@
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
-# CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z &quot;${CURL_CA_PATH:-}&quot; ]; then
+# CAFILE/CAPATH is auto-detected when source buildtools
+if [ -z &quot;${CURL_CA_BUNDLE:-}&quot; ]; then</pre>
    </blockquote>
    <p>Look good,&nbsp; it should be a <span style="white-space: pre-wrap">copy'n'paste mistake.  Could you also send  this to  </span>Scarthgap
      branch? Thanks<br>
    </p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:20251124055533.857103-1-Moritz.Haase@bmw.de">
      <pre wrap="" class="moz-quote-pre">
        if [ -n &quot;${CAFILE:-}&quot; ];then
                export CURL_CA_BUNDLE=&quot;$CAFILE&quot;
        elif [ -e &quot;${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt&quot; ];then
</pre>
    </blockquote>
  </body>
</html>

--------------JaZBScKpymEnCfHvRpgBsQsv--

