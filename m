Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53830CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 20:09:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28970.1759867741373804532
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 13:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kTPhjRMK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2375dc7ba9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 597Bl9a63558894
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 20:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=N7dDWz3rY36ZD4fdB9O/iX
	CiZUgsnuYwgxHVF0Ijoqs=; b=kTPhjRMKRveSv84/imAckGOiZEtvbMqqh8HpQb
	NYHC3CkkHsejDVkMordW/nri6L+wgIBZqpbS5g8ZbFTJGc2HMKZBSQMKhZYo8bqK
	im8lOwc11lQ6j8n6X5gv2/sGceVbB11dwxX1CVETZ5V5hW6M3/ikiJX9gzCzTASZ
	SviOPw1IBQdIlgP9rcNjARJo5bFaQbBzS6JAUCmEk3bvalKiui8+gwyHpWnOhfp5
	nsafeRhKCphsOhgia0I5pW8Fc6TR1hbGBYzqjRN25sBDGg2d/Cl648ZsGXyEHQ8B
	fXgG7KDcI5neaHzkhNXHE9NNiQm8H3g3x6BerGBYR9PIQfzg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012005.outbound.protection.outlook.com [52.101.48.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jrxguh56-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 20:08:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzgC94fZJn9oGTYwS+wfkd9c4Td87+rHiucmxjk3lDLa2PRGLX+a/WMVAYYIWii22GCSq+ytP38SqacmOoKEcMTR3AtuGUTFw+zt9c84dxRoslU/eTiZ/WeiTUeqiRmEiI28+7U8zCoEN5cC2yL6vFK6Q2SG6MWE0ZtVOziHoALAgXB5d+HdN1rIEKgIi+eYhA6syEcA3YyoGZz8/QnR7SD7LqVynaUC4jBQiKnYIfoQqAK9zcqTrJg4Yxf+k0UjdzVhjV7FUVUfDeGi39cth+eiPPsmSBz7tumnFvlQPzjrxSlrWhzjh9O+/alRei45i4ZeW08Z+7FHuP0GnPnb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7dDWz3rY36ZD4fdB9O/iXCiZUgsnuYwgxHVF0Ijoqs=;
 b=v3ucuEmI9hSxRrpMQqvXhe/+4CC3dn9Uq/q8FvgeDpqVaJVSdRDWLEslapVYnApWWK9X16/SCPqY8mVCNV5bjssDg6JnQ/Mz8fbPZ0ZJ4te/dykXRAHVzjTWGAQy4tzNIzdItYoDieNqNfVEaYkv14exXXoujXFC/DPoR46FzBnl8I7RZ2rWR08a/KAbLWx4vrn1zF7r9JA+fgg+b1iQ595LzvWl4dBSfhHXxGitiQUJYe7nF/hYzsOY06qrNv8X9hV1mPG96HNFUhGzlypdjlG2QzbxNUI13jZZJ2GUf2ecNkXFkpESosYpefbTflrV+bFCw52FO20AuTvSBhgj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MN2PR11MB4615.namprd11.prod.outlook.com (2603:10b6:208:263::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 20:08:52 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 20:08:52 +0000
Content-Type: multipart/alternative;
 boundary="------------G97CG4rHqNZmXQS0Lr32padZ"
Message-ID: <407382c6-317b-46fe-904e-a23543d22087@windriver.com>
Date: Tue, 7 Oct 2025 16:08:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4] gawk: disable persistent memory allocator
 due to licensing
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, Liezhi.Yang@windriver.com,
        peter.kjellerstedt@axis.com, ross.burton@arm.com
References: <20251007190923.315257-1-Randy.MacLeod@windriver.com>
 <424cb94c-6693-417a-add4-14aadb60d231@gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <424cb94c-6693-417a-add4-14aadb60d231@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MN2PR11MB4615:EE_
X-MS-Office365-Filtering-Correlation-Id: f8968821-eef5-42f5-335b-08de05dd55ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OTRsTFFiRy81UVFZLy92YlFJcFFGQXdNQ2pTNG53YXFwQjdZd1BPV2c2K0FC?=
 =?utf-8?B?RXFsNytNUi9ydFJNMGpXaUl0dWprMTlMMmMvTUNUL3VlZ0s0cEFhdU14eXlI?=
 =?utf-8?B?R0UxVGdlYTFZVHlyb3NadXBjdXRhMXdXSDB3b0lualk4cWhPMTFOU1VBL1Jz?=
 =?utf-8?B?bVRoSGdMc3VmY3c2TFhuMkgrT3N1SXdpV1M2aGE5ZGdpbCtwWmViOFNBMG9B?=
 =?utf-8?B?ZTlBdm5ZdXoxM09NNHQ2Z1o3TlhOcjJycGcxSW1UemE5eEhNcXJVN1BJb0li?=
 =?utf-8?B?UmR3L09sS1JhUk1sSEFrL2dxamlUSDRwQmVUYlI4UGoycGFCZkhTYVNwa1ky?=
 =?utf-8?B?WnluWmdCbHNVR25tcUN6WlcxQmFjY0E3WkpqUk9yZUNKdkJOMHhtSGlmUVA4?=
 =?utf-8?B?WlA1cnBxeFBBSkhoa1g5bWQ5YzF6OUx3VDhWYytyU251NHc3ZkRjOWkwSytk?=
 =?utf-8?B?eUxWYm5od3hpOTE4NThBS1RwWmFxZndiMTV0NjhTbGZ0Rk11OTUySThQSUtP?=
 =?utf-8?B?UzIwRWI2VXFpL2JmbjBWQVd2MTVOcEhzS2J1R1VCeUFEZ2xOOFdmNmZ1SXZQ?=
 =?utf-8?B?bGd4VGhBQWxtWTgvOWk1aHZ1MjJNWkExWEduejZGaWlwcG1XT1Z0ZWo5YTZr?=
 =?utf-8?B?aEgrQWE3SXhvcDBYYVR5S3FOWHF1STFURzNaMU5Pb2oreFQwM201QXhCNmxw?=
 =?utf-8?B?RjNWaVpmNkFmLzNZN2ZpYVhmWnRLRmJaR2VUTEZiRUtXanlld0xlQkI1bENp?=
 =?utf-8?B?alNZdkI1K0t3WGpqM0tFdzFQRXl5VTJZUHJlTks4aFg1ZVZhNUJoRThYWHdJ?=
 =?utf-8?B?Q210djlmYVR6cmpkUkx1RHdObGpYVjlxa2FGU1lRWHJSdFdUY045clFublEw?=
 =?utf-8?B?VkZRUUtaL0d4OUJSR2Zpd1k1Q0t0SnJBY3pKKzJRQ01LKzBRckxUc1EyS1Ju?=
 =?utf-8?B?dzFFVDBueEJTY2l2cGk2aXNPR0RJL2pma3Z6SHRGV1h4VlFhT0xNbFJlOTBG?=
 =?utf-8?B?Q2RSaVByMlRxa0plV2dlS3JWTW5qSWFTQ1prNUZxMDF3NEI2UzhQYXlzQW8r?=
 =?utf-8?B?bi9laUU1M2NydzRQbHAzRmwyeStDT090cDF4TkxCQUJiVE14OVV5UWFlL0wv?=
 =?utf-8?B?YVhlcmNJdjhmaEhJNUlma3p3S1MwNUUxc0xrTVM4Q3FsTjlBTWNHZWx5Q2Fw?=
 =?utf-8?B?OXBvdWtEU0pOeWpSckY3bWxNWDRwTEl2b2VpaDNOQzJUdzJvMDRWVXEwMGNN?=
 =?utf-8?B?MlBid2MzVWIzY0w4OWQ0K2YvRVR3OFZibmwrVDhjUkQxTjl4UTUrVWg2NWov?=
 =?utf-8?B?U3YzZEZQcjljVGNVQk43anU4TjhTZ0lQaHhGeUZ1L2hZeUVJUXJpMnVGTUlN?=
 =?utf-8?B?Mk5VeUxzVE1oSmRXeWpyblZldVR1cGY5NXBtcm5RSW8wcHJNMU9HZkIwS3NO?=
 =?utf-8?B?enJPREVuSGNaZWxacGR1TFcwNHgwTWNBWGtqa2lWViswSmdvU2ZrK0lSSmQ2?=
 =?utf-8?B?eTBrbWs5SDJIWElxOEprL3FLV0NSK1BIelpndFVNUHA3d2ZMY0dVeXZsQzBy?=
 =?utf-8?B?NWJkRktjZUJRdjQ0QmJoZjBHSlg4bXNMeWZuQUROamlxZDV6Nnd6ODZheEp2?=
 =?utf-8?B?WlNEVHRWYVJBb0RlcmdiVVBOK3pNYTdKUWk2eXJSSk1HTUpPbDg1eGhIUzBE?=
 =?utf-8?B?RmlJMklEdm04UVBzeXo1UkVJOWZYa0NZb285U2F1QVJLRVFGZWdPZkdBQncr?=
 =?utf-8?B?TXg1bEJjVWUzRlFTV2d6WCtFSWJCUWk4ek80eUVsck1OUEJ4Znk1SnZaY2Jk?=
 =?utf-8?B?aDcyL0JWalNoeXQ4eE41bGYzcG9NUmZaRlZYVmZQbGs1dlZERnNoNnZrMW9s?=
 =?utf-8?B?a0g1MGpNTWpwQjk1WXJRaTdTWlY5dDV0VFZRNlp3NzUyVDQxZEUyV2FZR1pH?=
 =?utf-8?Q?rcIJrOaq2Sc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VkMycjRSNzRuVmpIS1RVNk5ZTnBlQlNxeUg1dTluVzZHV2tRUktqV2ZaaFBq?=
 =?utf-8?B?MVF4OUJUQXVFZDYrQTJ3RzJtOFFIOVA3aG1PWlpSSG1ZY2owdEZPUXY5VDM0?=
 =?utf-8?B?blF1VlhJYzEzMThLZ21XMEZwTUNUS1ZRRS9PckZyNFoyMGNrMkU2L2RqUEtB?=
 =?utf-8?B?SWpPd1N0Sm9hSWhuZGp5RGlTbkl3YmswVzY3ZnlTRklWb2Jnc1VDM1VBQllk?=
 =?utf-8?B?THNYM2FHMlhwVlVzU0JVZWx0Rm9ITVdXYjM1RGNUT0N4Nkk5MEhyT1N5Y2pa?=
 =?utf-8?B?ai8vSmx6Q09hNHlKWnoxWkU0LzB3VWZpeGFnUFlOWk0vV1R6S3ludE0yTXJR?=
 =?utf-8?B?VmFmeXc3ajFpTDdVcFpyQ080TVE0bXlLVnp6ck1xZE5jankwbHhuVXhrc0lI?=
 =?utf-8?B?U3FGSWZFeFdPOVQrNTNqK0VyZjZuak01dm8zSDU0YmhsZk5lbGFUQk13SXVp?=
 =?utf-8?B?eHZrZDFkc2JNU0Vka2R5NDJ2RDdKYjdaNkIzeGdQdUZvSkcxZ3Y0UFF1TWtW?=
 =?utf-8?B?OXNFcCsrT3ZmaWhMQXRFYitrRnd1VzBPcmtMVlJBL1pYQmpkRXp5T2Q0N3Rt?=
 =?utf-8?B?L2hNek15OVcvQWNUbVlPa0NGYmFpQy9EUEp0cmFuSWdWbjRJcHZWcy9Hbjdj?=
 =?utf-8?B?KzZ2Q3NzdCtMVytKQk9IZGduQmR2cmJodkdibzVBZ3R5aDFsZU1pakhIWnVF?=
 =?utf-8?B?N1NFVVRhMktGQmJ0YWZmd3lPdGFBTDhlQjBhbkJaK1lGZzNnVXdhbklFbnlD?=
 =?utf-8?B?MEwrV25mNHhvQzBEWEZWcDI1RkJ2aStKMCtOUSt4NjlUeC9XQjdHMVBVRnJh?=
 =?utf-8?B?YVAvT0oxeWJzOTV2WXdFU2E3S3JxOVlwbUpEMHplSDMwNC9LQ1pOWnNlcitz?=
 =?utf-8?B?RTQvbTZ6YnhMWFV5VjFmdDJWVHdSRXdWNWQyWm9BS2FZRjJlMytSVEpMUmZL?=
 =?utf-8?B?S25RUnRxZ3VyTTA5Rk53dUcrbUk3WkhtdkJ1S1BTbDNGSDBwMGgzSHBqNkw1?=
 =?utf-8?B?WVZrTHR0Z1JHbFFXeVF1ckFJenJTdmw4Tk9qOUttZjAvbFU0T1RkcDJ4NEhq?=
 =?utf-8?B?eTNiY09wck9JK25GaGtudkxuRW9FcDM0bGxCdWovblFQQmZQSWVONGRtVk1P?=
 =?utf-8?B?UmlkZ09ZczMrbUgzdmZMVzc5N2RZMnpxUmxCVFVkQ0VhYTZxb20xNSt6bkdq?=
 =?utf-8?B?VFF4Mkp5aE9ONmpkUUdJVHA5SmFTZ0x0QTdYYUpiTktrRDVDbjFRS3NDcXJP?=
 =?utf-8?B?WE0yY3YycFd3QlNkaVE4REI5MVVVOEd2STJjOW1DdGVRMlFuR2JZQy9kOHZ1?=
 =?utf-8?B?QWYxOXVPdWxZZWdURldpUlo2MzNLMHZKTzdxZ1FkQTY3aW9lZGlSc0VnN0xz?=
 =?utf-8?B?MnNFOHRTMERrK0xYU2ZJN2NubjAxS2IrSzRBTzR1V3pPaG8rL1RuM2JaQWVs?=
 =?utf-8?B?SlQxYzFFMEx2WWIzV3RPQ1FtN2lYbU1zMktWT0pZU2kwdWo2MXNLNzhYbDUv?=
 =?utf-8?B?b0JpdUZOS1FTUjQ1WHJiYm8yWGIxYmh0bzhQdDl2bFNwMTFjV29hWDNSdSs5?=
 =?utf-8?B?UmN1VjZsZlBvWHQyNlFseFlBUmlmaGpKRkV3aUpCOXp0RHJBTGlRQTdiTE1o?=
 =?utf-8?B?bzRVZGI5S1FWZkQ4alBLVGdUdkQ0QnBtMUF5RkVTYjR0d2I3YmFvYVVzaWxx?=
 =?utf-8?B?Vld4bHFGbFNWUmlOVXB0c2k3NXlOYnFZMnRnVVNrb24rUlZpbjc2NHZiOEtn?=
 =?utf-8?B?TEl1OUxmUElRU3lZeExEOHZ2aVNLT042SmNTeDhmOEFFWXdCVHZ5VFhzRC9U?=
 =?utf-8?B?b2UvRW1zN3VsL3BramErN0lmNTFiZndYV3hpNm5iWHlPVFBIWjZqb0JyYzFM?=
 =?utf-8?B?eWJqRE9pcnFlaUhmVUJ2QlE4RjdpUGVBekRiWTFoLzVZTW54R1ZDaUJJd1Vy?=
 =?utf-8?B?Nlh3UFQ1ZlczTy9IZTlodU80d3FldGw3T0NkK0YxTXRPem42ZGR3RmxkN0th?=
 =?utf-8?B?eUhkZHdtYlBkNXQ4L042Y25CNEdzcWwwWWRBS2RKaW9kMHlhT2YrUzBpRGtR?=
 =?utf-8?B?M0hkSnR5bXhOWnl0RHM4eHVQUGhTc3ZVRDFuQ1oxMlZLbERQSnBqS1hPK2Iz?=
 =?utf-8?B?SHVBL2ZQdHBUSVowb3B3MzZ3aG90cnZ5d3cydFRiNndUSURZaUN3ak5GeXQ1?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8968821-eef5-42f5-335b-08de05dd55ba
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 20:08:51.9716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lxlc8fkHS+19Dm2G+MuePbYIcVqepLf2q/0VUDhR0AJgVl+U7qpGqWpkrMha6x1cigdq6Ux26roop7yx+aFRcDCrsuFeJWe4SLTmRKgUPR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4615
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: PiTx_ZGrLS79pc-DHqq5qKuUi3u4A_6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE1OCBTYWx0ZWRfXzZxGS0LBYj6G
 1nNmhsGtUS806kkFuEYB77FZRos1nGpvKHOQSDibv7SBSuq51bKb6mWyd3t2q4gRo8aj5NK+Enk
 nSy5/H/50MIs9R2VrRSYDibjCz83ORLATOxlaCV49HAraKWF6qIn4SqcG4ilbOmEJdzhHNSj/so
 ZcCxW/q7CFF7XVL8d3nw7N47RdcAEnLXWh7umfPlR0yj0hCOP+tASatgRMdYDvT2NlGcw4p8bf1
 R+i02/9XSivS3serv9ZSLkQAlfIYtOLXEmpWEfQxy/dl4zfVcA1Z2GeyvuVrwVkz0pZBr6FZLdB
 rVyCPYKq3CU4EdkQ0UZUCsxR3IgepK7ndXDdTkUsutKQsSUHh8GtjvYT4BDDxp8HLFdCr4aNg9V
 vgsgaq4Hqaz15HXZe/WC62kgdqxJ3w==
X-Proofpoint-ORIG-GUID: v4wPFr_fuWPaeaN0_ub6JWGW5t8HMfcB
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=68e5735c cx=c_pps
 a=nMxr8a0Y/G08GAkVjTcMpQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Kt95J6lVRhBnbeBYf3kA:9 a=QEXdDO2ut3YA:10
 a=1N9iHcwoX80A:10 a=yLXxm-r16ukA:10 a=Gs-Rp1dgaDFg8NGOb4EA:9
 a=n-14fUgdsa4u_C0E:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510070158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 20:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224554

--------------G97CG4rHqNZmXQS0Lr32padZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-10-07 3:56 p.m., Gyorgy Sarvari wrote:
> On 10/7/25 21:09, Randy MacLeod via lists.openembedded.org wrote:
>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>
>> In gawk-5.2, a feature that allows gawk to preserve memory between runs:
>>     https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html
>> was added. The files that implement this, support/pma.[ch], are licensed
>> under the AGPL3 which some entities perfer to avoid. Force people to knowingly
>> opt into using this feature and license using:
>>     PACKAGECONFIG:append:pn-gawk = " pma-if-64bit"
>> where pma is an abbreviation for persistent memory allocator and the
>> "-if-64bit" suffix is a indicator to users that the feature only works
>> for 64 bit targets. Also add AGPL to LICENSE and LICENSE:${PN}, when using pma.
>>
>> Correct the license to be AGPL-3.0-or-later. There hasn't been a change in
>> the license terms, at least for main.c, haven't changed significantly in
>> the last 15 years:
>>
>> License-Update: Reflects conditional AGPL use and more as described above.
>>
>> Testing requires a non-root account and following the example in the link above:
>>    $ truncate -s <size> data.pma
>>    $ chmod 0600 data.pma
>>    $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>>    1
>>    $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>>    2
>>    $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>>    3
>>
>> This works on qemu[x86-|arm|riscv]64 but not on qemu[arm|x86] where the
>> --enable-pma is ignored because there is a requirement and build-time test
>> for 8 byte void pointers in m4/pma.m4:
>>    if test "$SKIP_PERSIST_MALLOC" = no && test $ac_cv_sizeof_void_p -eq 8
>>
>> Finally, remove an old comment about GPLv2, GPLv3 versions of gawk
>> since this is no longer important as the GPLv2 version is not maintained.
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> ---
>>   meta/recipes-extended/gawk/gawk_5.3.2.bb | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
>> index 833fe78bf9..ffaef93e8a 100644
>> --- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
>> +++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
>> @@ -6,14 +6,21 @@ HOMEPAGE ="https://www.gnu.org/software/gawk/"
>>   BUGTRACKER  ="bug-gawk@gnu.org"
>>   SECTION = "console/utils"
>>   
>> -# gawk <= 3.1.5: GPL-2.0-only
>> -# gawk >= 3.1.6: GPL-3.0-only
>> -LICENSE = "GPL-3.0-only"
>> -LIC_FILES_CHKSUM ="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> +LICENSE = "GPL-3.0-or-later & AGPL-3.0-or-later"
>> +LIC_FILES_CHKSUM ="file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \ + 
>> file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 
>> \ + 
>> file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19"
>> +
>> +LICENSE:${PN} = "GPL-3.0-or-later"
>> +LICENSE${PN}:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma-if-64bit', ' & AGPL-3.0-or-later', '', d)}"
> Typo: missing colon between LICENSE and ${PN}

Thanks, fixed and v5 in a bit.

../Randy

>
>>   
>>   PACKAGECONFIG ??= "readline mpfr"
>>   PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>>   PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
>> +# pma: persistent memory allocator:
>> +# Disabled by default due to AGPL license.
>> +# Note that PMA works only for 64-bit targets and is automatically disabled at configure time otherwise.
>> +PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
>>   
>>   SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>>              file://run-ptest \
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224551):https://lists.openembedded.org/g/openembedded-core/message/224551
>> Mute This Topic:https://lists.openembedded.org/mt/115642245/6084445
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
# Randy MacLeod
# Wind River Linux

--------------G97CG4rHqNZmXQS0Lr32padZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-10-07 3:56 p.m., Gyorgy Sarvari
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:424cb94c-6693-417a-add4-14aadb60d231@gmail.com">
      <pre wrap="" class="moz-quote-pre">On 10/7/25 21:09, Randy MacLeod via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

In gawk-5.2, a feature that allows gawk to preserve memory between runs:
   <a class="moz-txt-link-freetext" href="https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html">https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html</a>
was added. The files that implement this, support/pma.[ch], are licensed
under the AGPL3 which some entities perfer to avoid. Force people to knowingly
opt into using this feature and license using:
   PACKAGECONFIG:append:pn-gawk = &quot; pma-if-64bit&quot;
where pma is an abbreviation for persistent memory allocator and the
&quot;-if-64bit&quot; suffix is a indicator to users that the feature only works
for 64 bit targets. Also add AGPL to LICENSE and LICENSE:${PN}, when using pma.

Correct the license to be AGPL-3.0-or-later. There hasn't been a change in
the license terms, at least for main.c, haven't changed significantly in
the last 15 years:

License-Update: Reflects conditional AGPL use and more as described above.

Testing requires a non-root account and following the example in the link above:
  $ truncate -s &lt;size&gt; data.pma
  $ chmod 0600 data.pma
  $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
  1
  $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
  2
  $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
  3

This works on qemu[x86-|arm|riscv]64 but not on qemu[arm|x86] where the
--enable-pma is ignored because there is a requirement and build-time test
for 8 byte void pointers in m4/pma.m4:
  if test &quot;$SKIP_PERSIST_MALLOC&quot; = no &amp;&amp; test $ac_cv_sizeof_void_p -eq 8

Finally, remove an old comment about GPLv2, GPLv3 versions of gawk
since this is no longer important as the GPLv2 version is not maintained.

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 meta/recipes-extended/gawk/gawk_5.3.2.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
index 833fe78bf9..ffaef93e8a 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
@@ -6,14 +6,21 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.gnu.org/software/gawk/">&quot;https://www.gnu.org/software/gawk/&quot;</a>
 BUGTRACKER  = <a class="moz-txt-link-rfc2396E" href="mailto:bug-gawk@gnu.org">&quot;bug-gawk@gnu.org&quot;</a>
 SECTION = &quot;console/utils&quot;
 
-# gawk &lt;= 3.1.5: GPL-2.0-only
-# gawk &gt;= 3.1.6: GPL-3.0-only
-LICENSE = &quot;GPL-3.0-only&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
+LICENSE = &quot;GPL-3.0-or-later &amp; AGPL-3.0-or-later&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504\+file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19\+file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 \
+                    file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19&quot;</a>
+
+LICENSE:${PN} = &quot;GPL-3.0-or-later&quot;
+LICENSE${PN}:append = &quot; ${@bb.utils.contains('PACKAGECONFIG', 'pma-if-64bit', ' &amp; AGPL-3.0-or-later', '', d)}&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Typo: missing colon between LICENSE and ${PN}</pre>
    </blockquote>
    <p>Thanks, fixed and v5 in a bit. <br>
      <br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:424cb94c-6693-417a-add4-14aadb60d231@gmail.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 PACKAGECONFIG ??= &quot;readline mpfr&quot;
 PACKAGECONFIG[readline] = &quot;--with-readline,--without-readline,readline&quot;
 PACKAGECONFIG[mpfr] = &quot;--with-mpfr,--without-mpfr, mpfr&quot;
+# pma: persistent memory allocator:
+# Disabled by default due to AGPL license.
+# Note that PMA works only for 64-bit targets and is automatically disabled at configure time otherwise.
+PACKAGECONFIG[pma-if-64bit] = &quot;--enable-pma,--disable-pma, &quot;
 
 SRC_URI = &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#224551): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/224551">https://lists.openembedded.org/g/openembedded-core/message/224551</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115642245/6084445">https://lists.openembedded.org/mt/115642245/6084445</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------G97CG4rHqNZmXQS0Lr32padZ--

