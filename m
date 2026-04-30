Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A14CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 12:05:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18678.1777550727386340946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 05:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=TopGniR0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=958011a53c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U4k41J2372039
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 05:05:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=aEMWqmhXf4DMaT08Rex0yCicXuK95zaLHZPxExj9Y0M=; b=TopGniR0WzYf
	OR4mrBT8HMoWEPXm4peX9oKgZx/fvGaSHx0f2xWq/afy0W55vHGbd3wIeLTts682
	wHVBcrA4Rb9w2xV0tK1RJxDavbFAliosn58YTWLNKZxWm6WG+xpB9vDgzEbkx+m2
	+qGYVbITGIbaMAKtpEklyOL/EFkJA/TY/0nSPS2CFvI3XRsYyY1W4bO3hu6wdVlj
	bcNpDAZ3Z6CjUZIAxvHtKOMbRaleE7Ut9O9x+8FgHtPAsCSUWlwrxQDlBFqERW91
	UcTpM3bSY6E9/Lc488/ouCj3rb+ktmsYobYvvV5YPcPADilB4idBpzzfBDi0yYwD
	uAnxOZ4nyA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dumcvhfaa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 05:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNvdftwT3KeHKovrrXcy8jGnkwHjEO9iy/WCOBORBvOXHz2hTo7edG4/tKdEpH/cj+tv+VWjlMBEUcnbkTnU/11m9kAtooUOuCAPLmCUB3MQBOhdB7z7t3IlvpKhwStIb6aa9wYsjMmySXaYbWxruioP7KYmJqhsRm9pj3HgjBDhEOJ+hqvYFDCvH0ntm1ZfvCQua61sc1l8jJfQ8VATVL4jMUQBUPLDBss6dfPvUDFgOXU3CkbXYhlCnjXNabDOFkfaVqapVa6hfn/+4zRszTWuiipMX8KvCyoNfR7xR0uwykcVG4MNUMbHkVR86EUkt2LJt/fzflo3GmarBIkEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEMWqmhXf4DMaT08Rex0yCicXuK95zaLHZPxExj9Y0M=;
 b=XG3geX6BLFoQkBF3oYqYr7T/3X04svpq68ZfU1hhRHis+wVQfycx5t7r8oOzOIUlj+TML5+hu+5ilvqUzWHHZiktWtWfYGLc4+5tdA0V3sHMy2uWHVzeZFgG2/C6o9YO8VfNQaiqRcDOIj+lr10NnIzVX08P/myfHwfSNCoq88iBIoV+SgJDOjHb2zC7iPUOEdjluUZEyU3oNZY6SDowJuaHB6HFTSehnV4wI9RkxfLTlrL5jHbihzKWaBp8wytXQqov5iNn/mUUd0Mo4NvJwr1DUVOLle+7LGCTlvcxB4bu07mJ+t3/Hq5AzasTBOmwjIJu374+LiSeUfrRqLb6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.18; Thu, 30 Apr 2026 12:05:22 +0000
Received: from SN7PR11MB7601.namprd11.prod.outlook.com
 ([fe80::b3c9:47a7:4653:5a6]) by SN7PR11MB7601.namprd11.prod.outlook.com
 ([fe80::b3c9:47a7:4653:5a6%3]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 12:05:22 +0000
Message-ID: <29edab2d-29e6-49f3-88ec-6eb1d831214c@windriver.com>
Date: Thu, 30 Apr 2026 20:05:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 3/3] ovmf: fix CVE-2024-38798
To: Fabien Thomas <fabien.thomas@smile.fr>,
        openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
References: <20260427045650.2365793-1-hongxu.jia@windriver.com>
 <20260427045650.2365793-3-hongxu.jia@windriver.com>
 <DI6DQKDSGHF1.244EBN969P2YA@smile.fr>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DI6DQKDSGHF1.244EBN969P2YA@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2PR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:100:55::32) To SN7PR11MB7601.namprd11.prod.outlook.com
 (2603:10b6:806:34a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7601:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ccd34c-eb6b-48f6-1422-08dea6b0c135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	IaoRfQZBPDvURXLhOEor0rDLCgWSMTZ6PQsTQ7Mre3tQFhRiNsDb+qxBgWiATyETBwLE2Dfr2cvhgIC8Wk2uB79/+KqygW5ELyBPeb598Sn/GdToTkwJHQbdNL0H7mDKmF2WsH53nAqIVFC9fqFLYZ7tFv2LzEsNa6agwXLiA/3zLe1VECHQIzuelFFWRSpaAlOgrS7US5GTmbmJNEQUcf0YoCp8J4zkKUiyI1pZYOr1n4kg92BO19CgYq07lsORy2m1ROPxz3Ij/g+fGyvFnEPWPliBKk/LVywyYQstmtcu84zsWr5uChh/GOAWhAPOqUFssHk73fJ0E41GpMg69dLFqIgnhkQcVyf4HRDVWzqXn3scJJCRXdiLxxauvL2wFxBgHarKrhQ/jMhIOPF7hRWWpDj3QdL3pIsDyGIPXLuifVzd4d8eMD/PTEskhhD1e2s0ftR4H2dXxeKUjIR/aYE7OOxoe9Rc44l2YL+tQpKqmEd3N5MO9tKu3pg+DyFQLZt/Nh2kgMB3qs6ugKZ+7jAkrbeTBiCqQnFu0iFdz9yQpd9btPA6ZwRDN6RbPqCzlXvDjOIWRqdWX7/YxMvj9mOR0faI+wb//Tn3nGBfnGPuSwwYLblBhVeg2+ybC5As9JWKAYFNyK40AMcv5KwPgyE1iylAw1MlxSbdPaJvAttKTs4mLG/s6qyD7NcrjvEfQ1sQrrH+5evT5rlTsaYho0KcazJidYvbebM7P8XLW5grSmqnd8XgMDj6jikJZXUo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7601.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ty9SUGNzd2U0dEdoeEkzSDVYNEZ0L0FhYm5LbEdNak5tR2kwN295bzFtMktz?=
 =?utf-8?B?QlFUNTJRd1hxREwwYWZEV0lUL3lZa0oraGNFWGpvcFRlQmVNMWtmelgreUNW?=
 =?utf-8?B?ZitUam5vM1VrNVcwNm9obDBpZHc2dlNEc0p3VEp0T3c4VUFvb1RNd0FFRHJF?=
 =?utf-8?B?eThJR3c1YmV6dm4vRFQwYi9nYnh4N0llNjh6UHZ0NlpuUU5OWjVVc0sraFFa?=
 =?utf-8?B?ZWVhUGZDMm1Ja002M1phZE1MZHZiaUpqcW5ZM1dVNVpSR1RtRVl1SU9yMGpQ?=
 =?utf-8?B?U1BMN253VmI5bG4yemJUMExpdlAyR0ZVK21rbGRpb3hwaVEwekVlb0xBdFRY?=
 =?utf-8?B?dENjQTV1dUIvR213RTVMS1dmV1MzSEJnYXl3aDBjTG9nNWN6RThrWXJrUENP?=
 =?utf-8?B?aVlONXZhc1YrOWpPVTQ0VnBZaWpNTU40Mkg4dkoraFIydUxvNTIrZ0lsTU81?=
 =?utf-8?B?aElxWWlmam1XREdEYXl4eGoxcGxmTjZsMzN4cXVTa3BSNFdWV2lTWlBKVktt?=
 =?utf-8?B?MXR2aFlIV04zYW01MFBYQkhpRkUySlZmSjdwaW5DZmdMSHBWL2xEelJCQWE1?=
 =?utf-8?B?QUxXeFRpZzRzbVZZTXFVQVpnMHVvTnZEb1FyU0QyVUNCQ1JVY1VGZUhtbElm?=
 =?utf-8?B?c3prL3JLbE5PS09NeTFKd2FpanpGZm5zNG0ybXhlMUNrbStwV01aS3J4Wks3?=
 =?utf-8?B?SUI3ZmZKM1FpT1VyUlFPTk9CS2dpcEZMNmZIMEljNzc3UTFML0NTeFc4TW9t?=
 =?utf-8?B?VEFXVm9IM3BSblhaMDRjZ3hncmxOeEkwUEF4U29LNHRKLzNGbHd6RjQxSjdR?=
 =?utf-8?B?UkhEcE1EMFBzeUt2cUlJYXRMRG5OcGVjK3dSTzRwM3oxNFlLaVZzSnJYWGwz?=
 =?utf-8?B?SUNyblBKYzhLVFVOeUVUMitEZjNlR3EyUnZmdEdub1hlNkVuMkNmaHRMUVc0?=
 =?utf-8?B?SHA2VWE0d1JuM3FTd1N4WDN4YUt3RDRGUEZ3cFV3ZDdaWGQvSW1nNVVQQkpX?=
 =?utf-8?B?QWp5cngvVTNzQnpiNUdOM0VuL1pkZWZmUGptZXIrall4QWR3MWYwN3ZTNnZW?=
 =?utf-8?B?OFoyT1NqUHZDYUM0cjk2MkpZMHF1cUpFSjRudzhNVEpoL3VzS2ZyY1pGUFdR?=
 =?utf-8?B?WjNiQVlMUDUvbHhkcXlEUGswUjZEc2daWEl4MGxQYytJR2pYU1A2QzNEZ3lB?=
 =?utf-8?B?aE1IbktZWjMxVzV3b1AybU5DNkpzSzYzU2lrVk4wWUxrZ1R4SWllcXNocnBI?=
 =?utf-8?B?eXZ3cW5DQUhTQjFwbXdHOHZzbHQwSWJvd1Y0OEJQTE5ZOXZjNVFCSlA5Vklu?=
 =?utf-8?B?NDJTNVVkVHFEMVBpdzE0eXcrT214Y3pXUzF5VUVNUnFETk9PZDNJRjhCWUd3?=
 =?utf-8?B?WnNpQi9RYWZPL0hheE1EQ25LZHl2cUxNUmZPY08wSkpVclUvWXM4VkVyaXF4?=
 =?utf-8?B?bFBWb3B0aHovbEMyMUk4UGZVSk1nTXJVeERGVDRYc2JmQjYvVDM0OWRvVTMx?=
 =?utf-8?B?RUMwVGx2R0swQUhIUWptUVg0SitPVWc1L0t2cW1uZDJaNjN5aDhudGFZSFQv?=
 =?utf-8?B?aU9sTFVHNElFTEFLeWZDVityK3Y0eWQzSHd6QkZZMkRVVC9GYU1JMEMybEVi?=
 =?utf-8?B?WUV4MGhNQXRkN1lKUjNhZXVZSEc4SysrZkNzZ1FvTUsrS1oxK3VoemNoQWhs?=
 =?utf-8?B?UkNYQ3RsWjZ2aTBVdWhWOHBxV0c3ZlczWnZjN0pmZmc5UHYzdVR3R2lRa3Zj?=
 =?utf-8?B?MnluWVlkbTU5T3dwL3d6TlJaZ1dEWlptNk9jYkVjTG53bi9JNVRKU1BKV2dP?=
 =?utf-8?B?aElkNzVTUUJBcmZWeTRISUR6K3NUM1U4R3FXNTFEOGtYTEtyd0EvMHBmdVY2?=
 =?utf-8?B?Wk5pWlZ1K3dzNE0zUTN1dGJYT3RZc0RKc1ZidzQyeHA5YVBVT0FjVFFCcThC?=
 =?utf-8?B?KzdkblJETFJZNW1vdUdUdEZMRkVZaFZDYmNxcWVQSGdicDllOCtiRTZGZkxo?=
 =?utf-8?B?VXVJWnJhdkpnei83cGFWYTJlWHBTNFZMQUE2UmJyTUo2YmM3dVdjYUUrZU15?=
 =?utf-8?B?TGlnK3hDV2dkL1BhN3g1ekM5dEQ1a0RmdzE3RTJMS2cxTWNudllkdGd1R2hz?=
 =?utf-8?B?bnR6QjlEczhlbDhzUDFNam1JMy92RE56KzFRT3R4cEZ6Q0xpWldrTG5BSE5p?=
 =?utf-8?B?RHd0N2l4TlNXQmp1dXdLZ3FtYkErbjZyWDgxbFpQMWVyakZERDgzU3IwNVZ4?=
 =?utf-8?B?R0UzSnh5NnpmdEtNNEhWQnU4L1ZFTzI0bVVjWFFqZWlBZ24vaGlPSytsRkRa?=
 =?utf-8?B?bnZiNm9nZC83YTBJTkh6Tk9haElTWEJzd3VERU9abEU3bmVGVDBMZz09?=
X-Exchange-RoutingPolicyChecked: 
	cBewgBEQkCaECIq4j2mOHCmuN5OSL76egskQb8pd3cSpK/9JkZU2VjecM6X3xnW7VlI7LXehUimes1d9i9yW8GfHXf85mph0f21KQfrtTLrtIMahGRCoM9jjFs49fuZ+JrgqpXh6VAzA7Zb7RpI8TU+/ydpJqyx6zHqwVasB0fNoPRzEmsMVsdiLnQvKObBRlWtek0P3fz2Wx5Ckiv/djQH1DArd/4QQks0Mx8mYeT7c3Dm4GTFAbVbuCmB6+lQvA9nDRoIttotKc6nOJO+E4kc/sQWBY5UOAoHOLBayQXcJv+tYG4Lx71nYnADN3niKdFgeco2M3iTG+GE8BeyZCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ccd34c-eb6b-48f6-1422-08dea6b0c135
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7601.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:05:22.2179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q169P9NnpftTmNX4NGkf7IYTblfWlZH7nbgYo2lRpSkWso/tlTnkUSHnnzTzIjYu/0HzeDmQapQjG7HQOcjRTtsjYC1ND+V3eeGrnluf+mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMSBTYWx0ZWRfX31f/W3cHElvc
 1d1cP2TWfNOur8GNCtSB0VPNTzlOPX+0Qy7T0LlKGEXv/hGIcZ1b8BkfWwpkWcJQ6WP8xFvVqif
 Ka+jQI7KFjJvMKYFcX6+gonmMReV597AUr+Ek+j4L43UEoyKESDeTFEVapDnI4f2pihQWCxpvZf
 dXnRr36rk8TFZjOgJnJEl57J/FYzO3wFmCQcKk72PSCin4QpfdpKAQr3OkNWILyY8igzMLpIdYZ
 UcaYLcx7wnjKmlhUsga3GgleNRgigptz9/+1LxHOf3x4DgdCw0lGd+JTal/4JtiTWPOnBX8pY7K
 DegGwKH0OeyrS++bqOqH/QW7O41L+/S3JG+mM+CmfAbA0O+PfIGpAbOqGq73nk1emIG/w9SkJxf
 +tBlyDKisBeEMDu/qEx1h6t1gfD1OnvbUD2zrxy1a1VV+zxkySDsXSxIxBYWK+RC9qMAly2VLW8
 6q8hqjQn+pSJZARFGYw==
X-Authority-Analysis: v=2.4 cv=eYsNubEH c=1 sm=1 tr=0 ts=69f34586 cx=c_pps
 a=0qEcZjvAL+vPLqsQtgLcWw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=c-OXHmbyAAAA:8 a=Mou-ifQtxcXWToyeQKcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1BV3uS847Uy0Hebj2SdW:22
X-Proofpoint-ORIG-GUID: D4UrqOUbAx54QHFf1CU91aXfCblhuwRM
X-Proofpoint-GUID: RmhBDdTS-eku3r3V7T_vSN66jCQg-2ZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300121
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63U4k41J2372039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236159

On 4/30/26 17:25, Fabien Thomas wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon Apr 27, 2026 at 6:56 AM CEST, hongxu via lists.openembedded.org =
wrote:
>> According to [1],
>>
>>    EDK2 contains a vulnerability in BIOS where an attacker may cause =E2=
=80=9CExposure of
>>    Sensitive Information to an Unauthorized Actor=E2=80=9D by local ac=
cess. Successful
>>    exploitation of this vulnerability will lead to possible informatio=
n disclosure
>>    or escalation of privilege and impact Confidentiality.
>>
>> Backport a patch [2] from upstream to fix CVE-2024-38798
>>
>> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-38798
>> [2] https://github.com/tianocore/edk2/commit/0cad130cb4885961da201bb9b=
08424b3fd3d2249
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../ovmf/ovmf/CVE-2024-38798.patch            | 116 ++++++++++++++++=
++
>>   meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
>>   2 files changed, 117 insertions(+)
>>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch
>>
>> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2024-38798.patch
>> new file mode 100644
>> index 0000000000..2d0a73c7a6
>> --- /dev/null
>> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch
>> @@ -0,0 +1,116 @@
>> +From 81263e46ad8cf2a6c7d86bc51c95342d07ec31ca Mon Sep 17 00:00:00 200=
1
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Mon, 5 Jan 2026 13:04:18 +0800
>> +Subject: [PATCH] MdeModulePkg : Clear keyboard queue buffer after rea=
ding
>> +
>> +There is a possibility to retrieve user input keystroke data stored i=
n the
>> +queue buffer via the EFI_SIMPLE_TEXT_INPUT_PROTOCOL pointer. To preve=
nt
>> +exposure of the password string, clear the queue buffer by filling it
>> +with zeros after reading.
>> +
>> +Signed-off-by: Nick Wang <nick.wang@insyde.com>
>> +
>> +CVE: CVE-2024-38798
>> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/0=
cad130cb4885961da201bb9b08424b3fd3d2249]
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c       | 2 ++
>> + MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c        | 1 +
>> + MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c                  | 2 +-
>> + .../Universal/Console/ConSplitterDxe/ConSplitter.c        | 1 +
>> + .../Universal/Console/TerminalDxe/TerminalConIn.c         | 8 ++++++=
--
>> + 5 files changed, 11 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c b/Md=
eModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
>> +index 981309f..32757a7 100644
>> +--- a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
>> ++++ b/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
>> +@@ -650,6 +650,8 @@ PopScancodeBufHead (
>> +     if (Buf !=3D NULL) {
>> +       Buf[Index] =3D Queue->Buffer[Queue->Head];
>> +     }
>> ++
>> ++    Queue->Buffer[Queue->Head] =3D 0;
>> +   }
>> +
>> +   return EFI_SUCCESS;
>> +diff --git a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c b/Mde=
ModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
>> +index 81d3c6e..e03c88f 100644
>> +--- a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
>> ++++ b/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
>> +@@ -51,6 +51,7 @@ PopEfikeyBufHead (
>> +     CopyMem (KeyData, &Queue->Buffer[Queue->Head], sizeof (EFI_KEY_D=
ATA));
>> +   }
>> +
>> ++  ZeroMem (&Queue->Buffer[Queue->Head], sizeof (EFI_KEY_DATA));
>> +   Queue->Head =3D (Queue->Head + 1) % KEYBOARD_EFI_KEY_MAX_COUNT;
>> +   return EFI_SUCCESS;
>> + }
>> +diff --git a/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c b/MdeModulePkg/=
Bus/Usb/UsbKbDxe/KeyBoard.c
>> +index b5a6459..7df1566 100644
>> +--- a/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c
>> ++++ b/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c
>> +@@ -1840,7 +1840,7 @@ Dequeue (
>> +   }
>> +
>> +   CopyMem (Item, Queue->Buffer[Queue->Head], ItemSize);
>> +-
>> ++  ZeroMem (Queue->Buffer[Queue->Head], ItemSize);
>> +   //
>> +   // Adjust the head pointer of the FIFO keyboard buffer.
>> +   //
>> +diff --git a/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitte=
r.c b/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
>> +index 0a776f3..5c1a35e 100644
>> +--- a/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
>> ++++ b/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
>> +@@ -3537,6 +3537,7 @@ ConSplitterTextInExDequeueKey (
>> +     &Private->KeyQueue[1],
>> +     Private->CurrentNumberOfKeys * sizeof (EFI_KEY_DATA)
>> +     );
>> ++  ZeroMem (&Private->KeyQueue[Private->CurrentNumberOfKeys], sizeof =
(EFI_KEY_DATA));
>> +   return EFI_SUCCESS;
>> + }
>> +
>> +diff --git a/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn=
.c b/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
>> +index f1d0a34..8aafb4b 100644
>> +--- a/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
>> ++++ b/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
>> +@@ -760,7 +760,8 @@ RawFiFoRemoveOneKey (
>> +     return FALSE;
>> +   }
>> +
>> +-  *Output =3D TerminalDevice->RawFiFo->Data[Head];
>> ++  *Output                             =3D TerminalDevice->RawFiFo->D=
ata[Head];
>> ++  TerminalDevice->RawFiFo->Data[Head] =3D 0;
>> +
>> +   TerminalDevice->RawFiFo->Head =3D (UINT8)((Head + 1) % (RAW_FIFO_M=
AX_NUMBER + 1));
>> +
>> +@@ -881,6 +882,7 @@ EfiKeyFiFoForNotifyRemoveOneKey (
>> +   }
>> +
>> +   CopyMem (Output, &EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_KEY));
>> ++  ZeroMem (&EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_KEY));
>> +
>> +   EfiKeyFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MAX_NUMBER + 1));
>> +
>> +@@ -1032,6 +1034,7 @@ EfiKeyFiFoRemoveOneKey (
>> +   }
>> +
>> +   CopyMem (Output, &TerminalDevice->EfiKeyFiFo->Data[Head], sizeof (=
EFI_INPUT_KEY));
>> ++  ZeroMem (&TerminalDevice->EfiKeyFiFo->Data[Head], sizeof (EFI_INPU=
T_KEY));
>> +
>> +   TerminalDevice->EfiKeyFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MA=
X_NUMBER + 1));
>> +
>> +@@ -1142,7 +1145,8 @@ UnicodeFiFoRemoveOneKey (
>> +   Head =3D TerminalDevice->UnicodeFiFo->Head;
>> +   ASSERT (Head < FIFO_MAX_NUMBER + 1);
>> +
>> +-  *Output =3D TerminalDevice->UnicodeFiFo->Data[Head];
>> ++  *Output                                 =3D TerminalDevice->Unicod=
eFiFo->Data[Head];
>> ++  TerminalDevice->UnicodeFiFo->Data[Head] =3D 0;
>> +
>> +   TerminalDevice->UnicodeFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_M=
AX_NUMBER + 1));
>> + }
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ov=
mf/ovmf_git.bb
>> index f0503db9fb..85b3d7c911 100644
>> --- a/meta/recipes-core/ovmf/ovmf_git.bb
>> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
>> @@ -36,6 +36,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;b=
ranch=3Dmaster;protocol=3Dhttps \
>>              file://CVE-2025-2296-7.patch \
>>              file://CVE-2025-2296-8.patch \
>>              file://CVE-2025-2296-9.patch \
>> +           file://CVE-2024-38798.patch \
>>              "
>>
>>   PV =3D "edk2-stable202402"
> Helllo Hongxu,
>
> I'm filling in for Yoann while he's on leave.
>
> It appears that the patches from commits "[PATCH 2/3] ovmf: fix CVE-202=
5-2296"
> and "[PATCH 3/3] ovmf: fix CVE-2024-38798" do not apply to neither
> scarthgap-next nor scarthgap branch :
> `Patch 0001-AmdSev-Halt-on-failed-blob-allocation.patch does not apply`
> `Patch CVE-2024-38798.patch does not apply`
>
> Could you take another look at this?

Hi Thomas,

I could apply the patch on latest scarthgap, I am afraid it was caused=20
by the `CR' at the end of lines

would you please apply the patch by `git am --keep-cr 00*.patch' or=20
cherry-pick from my github by following steps:

$ git fetch https://github.com/hongxu-jia/openembedded-core.git scarthgap

$ git log HEAD..FETCH_HEAD=C2=A0 --oneline
405b06db9d (scarthgap) ovmf: fix CVE-2024-38798
5b951e8d74 ovmf: fix CVE-2025-2296
2b93d45cfa u-boot: fix CVE-2025-24857

$ git cherry-pick=C2=A02b93d45cfa=C2=A05b951e8d74=C2=A0405b06db9d

//Hongxu


>
> --
> Fabien Thomas
> Smile ECS
>


