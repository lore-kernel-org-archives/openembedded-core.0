Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392DCC3DA64
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 02:37:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10462.1721356661699096325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 19:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=793023b01e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J0iPdX020918
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 02:37:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erhj157u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 02:37:40 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46J2bdcs016081;
	Fri, 19 Jul 2024 02:37:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erhj157t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 02:37:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfrW2s7hPtcl1CohNFv4j3UqjgEEULZvW+X1ZSBWYelPnnMIzjQA5CQsZWhhvg5R4mcSkFi88bQGA/EDdWMufKHv6Zgmx5kmebkOou+nmvkBD59MTJ24qaI8ipM3s9hV8Dnr886ky5l3A/lCi7C83bVtLLZmBClMgxiTMgr6O92Du2/cg6mVE0JN2wicFXdxSalt3Y4HGTlscKgUxktOg9EE9Z1PXVdmMQ2u5WArhV/1VENOLUhnbPL7MOqvXOxva/jbBRy26KhfboNr11BcGbgYynkw9XEfkfngV8Up1IHXwS8fJevBO6/DDuXHd7BZwptvMtgHH1qlorVcAPJiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8exzcZAgOmtaFDqgVTtzEe3gR156WuqkeUoa8N4BA4w=;
 b=L/Xs5hzA83wTdG+CQXhM1ZmqcYiatkKhTHvoCJeCLDN2l0LTl1xcx0y2dhiv5taAFMoA4knWXrlvVG8eNOxWp3QOZC9NZxcAyoDhGmBUiKVzXAaI7l1cmUSvFceT8yLmGTzW8U1E+zO8bISmHZoCrmISoNMMP8VsAngilB5f9gwDe5zcy7OQhEBN9FIYwecb7ygG8PVxYY3HCYFM8coKeiL/BTZG5K9mutSMSs8k8VWbPgB3zmjfsm+SCicXink7dH99tfWcrD0WLDnAdXAJQ42kXacTewZeOMwxDjLfxc1of+lA+VkBjqPWT6QtMA2yR8Fl8rIzi5UxP5leypcuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Fri, 19 Jul
 2024 02:37:37 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 02:37:37 +0000
Content-Type: multipart/alternative;
 boundary="------------4V0Jw00vF3S8jxGe4574UDVE"
Message-ID: <3fe5d761-fcb2-4d8e-94d0-4fcba4cb98e8@windriver.com>
Date: Fri, 19 Jul 2024 10:37:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][PATCH V2] pixman: update patch for fixing
 inline failure with -Og
To: Ross Burton <Ross.Burton@arm.com>
Cc: ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240716094909.3536953-1-changqing.li@windriver.com>
 <135B34F4-47F3-48E5-9AE6-9CE0C7F6DE38@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <135B34F4-47F3-48E5-9AE6-9CE0C7F6DE38@arm.com>
X-ClientProxiedBy: TYCP286CA0230.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::10) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ2PR11MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6fb7f9-f9f4-43b9-70f6-08dca79bc072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UTlvK00xbmhab1ZkYmtyNjJuRnc3dG81MUE1Uy9VaElBSG9VRU9DLzBtR0tM?=
 =?utf-8?B?bFRqR0VpZ0Nkb3Z4dGlhRE5oMThwd0xKZWZ2aUhRV0tzS0JGSnMyS3pCMVpQ?=
 =?utf-8?B?Z0FZT20vNjE3OW4zeGwrMXI0S1VPbFpEeklPaFFHK0liQTVTV2N6dzFvT01H?=
 =?utf-8?B?cG1mZTBqOFRGWWJzRlpMSzhMWVNBVGJDTXQrRkliVitBcHI3emIwc25ZaWhX?=
 =?utf-8?B?N1B2MDBlUG5qNDdaUDhNdTBxTEZVT3RxK1BDMjUzWU1HcElUWG52UW5HTkpS?=
 =?utf-8?B?N3VFa3BUMnJVYUtKNU1zVmRLK1AxeUJvR1NqamdRMXZ6WjJFUjVZN1BaU2pY?=
 =?utf-8?B?TXFQMWsvRFVWRDhyd3ZkVi9pcm1NdHRBU0wyaXk4NVkwejdNc0hKcWsrQ3J0?=
 =?utf-8?B?RUJhT2Nyd0xDYXhYYTkyUC92b3BpQVE3cmdTTGRCU3A1T081T3JicTJoQ1Bz?=
 =?utf-8?B?VGVQMVIyS3J5QlU2QnppaUJraGRzeUJiSkJLeDRaZWdZMlptbUM2cmZFMTRD?=
 =?utf-8?B?MHdPaFY4RHphaWtpT0NWRU5TTkZwYlJiMDVQaWE2NEtXRjJ4cmxuRzZWQ0dK?=
 =?utf-8?B?VEwwNFovUkhMMStKZVg0enovaDhwaXFWcHhuamYzZXVZdWprTmVuRXNRTjdy?=
 =?utf-8?B?am0yQmh2RE1WcFRwOGxLQkZJTmkvZlBjVmFRYTMrcGNROGpieTNzZXdiMDBl?=
 =?utf-8?B?RXdhcC82SmVMMDcyR1FGemxSOWVoYVl5UGN2RlFYdFFmbFFkT3h5L3BPTXN2?=
 =?utf-8?B?NVBvSWR3N2hlWmJmSHY4T1hRMEtiRVhiMTFOMGJ5RzY2L1NVOWsydWFtelVV?=
 =?utf-8?B?bnliWXZiNzFZOHlJN3JBQkk1NzMzajR2YVozWUtaZkZIY3pNdDJnYWN6dTdP?=
 =?utf-8?B?S2FTSnhDd2hKeGthLytuSzlpRDZzUzhPZWVoOFhIZ0RmamJ0ZUJhNThqMDkr?=
 =?utf-8?B?YnAwRG9ZampuMHRjY0tUOGhtS24rMnhtbExGQ3RrQVJLRDh1N2lXT3BhR3Za?=
 =?utf-8?B?YzNXdXB5eXZzNWFkaEJ6aEFXaXpVNklKQVdCNENsKzhBRHJNeE9YUis4Z0p3?=
 =?utf-8?B?TU5EemZEL2pmTzFnYnpJdm1mZ1lVcTl5NVhlM0E1WTVRRElnSVhtd3VmM0VM?=
 =?utf-8?B?czlBSmxka0RUL01uZUkxU3M4dkhYTzFSb3FSdEtyNHVxZ0hqOEZNTDl0ZXdl?=
 =?utf-8?B?MktjOHllQlB0Zk1sVnZ5Z0taK3hWbG1jczBXbS9tSUt0RUtlam1GNW1kMzBr?=
 =?utf-8?B?aWdDSERPejBBS05kNDE2YlZTSUpqNU8wUTFhN0tiU2g4NHdRNXNtdXYwL05K?=
 =?utf-8?B?cnFBYmxBc3U4WUFxc05rdVVmd21VRC9OU2VXTDExOEtPUlc3dk1LZWxSb2dx?=
 =?utf-8?B?VVRnUlhacHQ5bTB1RW1pTThTRXFYSkF4N1grN2NNM3JMejZHSERVWWs0SkVT?=
 =?utf-8?B?eXJRMUVmZ0xXRHZPeUZSdWY0VEw4a2w0QVNqUXlsakJmRGdEYmx6NG40STR6?=
 =?utf-8?B?cnhFOUI0RmVBL2xRYzhsUHpyN1RoWmdxcW0yTmMwOFYyUEN4RkczZCtYSW8r?=
 =?utf-8?B?S0paKzhWMlFSMVdEMGtyZ1drT0pBQnBpcmRKVW1Ub2U0UDFOL3RDUXVoUWVW?=
 =?utf-8?B?WWs0U3ZoMXhhWUJobTBYR3JmZ0Q3SXMxOGo0d1pTaWpOeERHcGRyZ0V3cXMy?=
 =?utf-8?B?QVMzWU5wZkc4SFlENzh1WTZpdytTaEVaNHNYdGovL0d3WXdoT0dGSkZuK3d3?=
 =?utf-8?Q?77EH7lGleRC3guASDY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3RhSXgxWlpKTVU0UUJ6K1VPdHY1TWdsZFd5dVFMVGpxUkpwZTl4a0JtWkxj?=
 =?utf-8?B?MDQ1bVM1d0g5RWtBZEZqdG5YV0xOcHZVN1pUMnJnYS9BajRNVlB1Tk9yOWcv?=
 =?utf-8?B?TnlFWFF4a0kwN1ZsYjV2VnN5bXJ5WGdyRmhlTzBlSE1RK1NSL0F4dzZUVHUy?=
 =?utf-8?B?Q0lrMjdoMjlUbEQrZUU5UDQvR0IyVWtSZXdPSjVhbGtjL053bWNJQmlCNEc3?=
 =?utf-8?B?UDVFMnZ0NElGVlY5S1YrVkJaUk5QNllpYWdIdDBRaEZqbnZ0SXpnY2ZTYmVk?=
 =?utf-8?B?WlVwZnBpU1M5NGJqNDQwblE2ZVl6bmwxNTlzVGZkQ1ZzOGpoanhiU2J4cUhP?=
 =?utf-8?B?SnVDV3c0aFNsMkFITHJqaTB3aWlXZ0h5b01iM3BTL2tyRUJrc2VLOUh4eDRY?=
 =?utf-8?B?UVRUdXRWbVliUXhjb0xnQzdwZmF5eVY4cTdwOTZqQmJMWnRGdVJlQXNNQVkz?=
 =?utf-8?B?czZ5S3IrNFBsTXFPQ216cTRzTTdFYUlzME5NVy9mbnlqcFVrcUV4WGFSVGdO?=
 =?utf-8?B?eGRRTGNnUmZ3bkwyQW51L1ZkczhTVm9QcDFSZkdrMnBrREFLcGl2R1Q2emxn?=
 =?utf-8?B?TlpWdlpnTTBQc3JMZ25qZytaRjFVODEyYlpqSzJpazY0TVQxY1U3bUpyOEwv?=
 =?utf-8?B?VWFMQmROYlUxK0ViRjZVRVdlYWdEZndTRjJjQ2NXN3U0OWpZWWFmRXh5YWIr?=
 =?utf-8?B?K1NYK0VjQzlvb0VSYW5PeVFjbk85Mm1hSUMxRVE1QlpJZjBtdSs0MTMveE01?=
 =?utf-8?B?SkwweThXdEVHVTVyeXU0WVQ2amZORVFrNTFESFkrYk9oR0k2b1Jub3poUERH?=
 =?utf-8?B?RkYwS3NOM09qVGc3SW5VZGwyV1JPc2ZzUlJIem5LMTc0U2gzTnhNWkp0b2FF?=
 =?utf-8?B?N2dYRE5iNk9DZDU1WnNXN3RjMVdsL0RnTVRPQWpML0dDNDJsNVNCOWNERW9k?=
 =?utf-8?B?SDVWZVEwNHdZRFkwRUw3U1UzVndQNEdsOXNQRHhRc2x4WkRlUjlqeitJYWR0?=
 =?utf-8?B?c0UvVHRRMjhaaExQcUV2cURhTldSRlJVZUQ4WHdUWTM0bEMzNHJnT0J2ZWps?=
 =?utf-8?B?eVhBRWJnNE5oeFhzb29OajlnYy9MVWJYaXBOa1JwQ254MUFYc2kwbVo4L2la?=
 =?utf-8?B?NWs0NWlMRXdyTTVsRjZkZHZrc1dGOEEwT2NWUkhTcUVDNGpaSmlNcUZwNkNj?=
 =?utf-8?B?ZjUvMldDWEcwbXFvaHZ4aUllSmRTU09pSnlVakVnVklaMGt1VXdCKzRJM0RN?=
 =?utf-8?B?N3ZKRHhEQVB6c0pnK2hUbkM0SklwTmVWVDc4c1FtQUZmZEc1YU9VVUpuRW5Z?=
 =?utf-8?B?RFp1OGd0MXVQSHcvb3FlWFY2SmNEbitOVkQxSUhFeklRTFdpSVBiUXh1YVd3?=
 =?utf-8?B?cjI4c0pNRUxmR3puYktFeEVkTFU3RndTWUVkY0xHdFhHNUUyZXlXMG5sWlAr?=
 =?utf-8?B?QjJoSUdYTFhCL0FLZ1FaWnRheXlkZDNqMmpDV01sQ2lyb3l0WTV6SHpoZWNr?=
 =?utf-8?B?N0FsdEJzZkF0RWUxNmV4ZHNaZ0RCVlhlYXZta1dLZk11bjQvQkRaWE5sVUdl?=
 =?utf-8?B?SXNHdVpaekRtQVM1REF0M1pnWThWRjFYSTVIdkkzUGhYM0c3VCswTy9vZUtK?=
 =?utf-8?B?WGZIV1EzMEV6REE5ai9qTHphUWhYRnhHbnBTRzZMWE91d3QvVndMd1h6YnlW?=
 =?utf-8?B?cmg3dk9EU0liMmR6OXA4SEJOTkVxaHFFNU11WWVKdm85T3AvLzFCS2dKb215?=
 =?utf-8?B?REk2MHl1Y3pzUUN4Yk9DcU1jRzRobVJGQk9oeHJLYWJxNVM3QzFpekw5ZndT?=
 =?utf-8?B?dnRIdUl6U0JDaHRMNEhEU1ZoWUtoOFdYdFowcG81aHhpQnlJTFdZZmdVWVF0?=
 =?utf-8?B?MUtCNHhQVGhpZmtPRTJ5bWxXbVpqR1VRb2lVTWJjcFFEb1FBUjZyeVcyVEVR?=
 =?utf-8?B?RzQxcWJXN1Q3b3MyL0FNamtrQ0tDdExjbWM1bllHdzJlN0grT012RjRML1BG?=
 =?utf-8?B?RWNBL2VaRlVJT1UydjYzWUNmZzZhRStkclpKblF4ZXRkZDdXNlZhVThwK1lk?=
 =?utf-8?B?cEREb1lZT2M2ZWJ6dTd5UmgxdmZFaTFkOTFrTFF1UTlCc2hXdzloN3kzTDRz?=
 =?utf-8?B?d1FoZWFPcWNoVnNCRGhidWxBbDJ6T0tvMXczbEY1Q0s4WXZyMldYNkZYWTlB?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6fb7f9-f9f4-43b9-70f6-08dca79bc072
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 02:37:37.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwtjx+asnjlEczxpCgjWldyhZZz6ZE+erINOh3IlbDhdPDdTF1yEnGGUldSqFuE1LvW7yVl243vknDtmegJRmfLsalHu4OvO7CPAfIml6dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
X-Proofpoint-ORIG-GUID: 9hgUykL1j_pNghjKTDzZCAG4ScT4Yttm
X-Proofpoint-GUID: i1XmXOjM23VtRxS12P4MVy2payoaTDCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_18,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407190018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 02:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202246

--------------4V0Jw00vF3S8jxGe4574UDVE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46J0iPdX020918


On 7/18/24 21:16, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Can you submit this to pixman=E2=80=99s gitlab repository as a MR?
>
> https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests

Sure, I will send out the link after done.

Thanks

Ross

>
> Thanks,
> Ross
>
>> On 16 Jul 2024, at 10:49, Changqing Li via lists.openembedded.org<chan=
gqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>>
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Previous patch works on fedora40 with gcc-14, but not works
>> on ubuntu2004 with gcc-9. Update the patch to fix the do_compile
>> failure:
>>     In function =E2=80=98combine_inner=E2=80=99,
>>         inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at =
../pixman-0.42.2/pixman/pixman-combine-float.c:655:1:
>>     ../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlin=
ing failed in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_so=
ft_light_c=E2=80=99: function not
>> considered for inlining
>>       370 |     combine_ ## name ## _c (float sa, float s, float da, f=
loat d)
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>> ...loat.c-fix-inlining-failed-in-call-t.patch | 56 +++++++++++++++++++
>> ...float.c-replace-force_inline-with-__.patch | 36 ------------
>> .../xorg-lib/pixman_0.42.2.bb                 |  2 +-
>> 3 files changed, 57 insertions(+), 37 deletions(-)
>> create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-c=
ombine-float.c-fix-inlining-failed-in-call-t.patch
>> delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-c=
ombine-float.c-replace-force_inline-with-__.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine=
-float.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg=
-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.pat=
ch
>> new file mode 100644
>> index 0000000000..5c79754e50
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.=
c-fix-inlining-failed-in-call-t.patch
>> @@ -0,0 +1,56 @@
>> +From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li<changqing.li@windriver.com>
>> +Date: Tue, 16 Jul 2024 15:31:16 +0800
>> +Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call =
to
>> + always_inline
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Refer [1], always-inline is not suggested to be used if you have indi=
rect
>> +calls. so replace force_inline with inline to fix error:
>> +In function =E2=80=98combine_inner=E2=80=99,
>> +    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../=
pixman/pixman-combine-float.c:655:511:
>> +../pixman/pixman-combine-float.c:655:211: error: inlining failed in c=
all to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=
=99: function not considered for inlining
>> +
>> +[1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115679
>> +
>> +Upstream-Status: Submitted [https://www.mail-archive.com/pixman@lists=
.freedesktop.org/msg04812.html]
>> +
>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> +---
>> + pixman/pixman-combine-float.c | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-fl=
oat.c
>> +index f5145bc..f65eb5f 100644
>> +--- a/pixman/pixman-combine-float.c
>> ++++ b/pixman/pixman-combine-float.c
>> +@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, fl=
oat da)
>> + }
>> +
>> + #define MAKE_PD_COMBINERS(name, a, b) \
>> +-    static float force_inline \
>> ++    static float inline \
>> +     pd_combine_ ## name (float sa, float s, float da, float d) \
>> +     { \
>> + const float fa =3D get_factor (a, sa, da); \
>> +@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor, ONE_MINUS_DA_O=
VER_SA, ONE_MINUS_SA_OVER_DA)
>> +  */
>> +
>> + #define MAKE_SEPARABLE_PDF_COMBINERS(name) \
>> +-    static force_inline float \
>> ++    static inline float \
>> +     combine_ ## name ## _a (float sa, float s, float da, float d) \
>> +     { \
>> + return da + sa - da * sa; \
>> +     } \
>> +      \
>> +-    static force_inline float \
>> ++    static inline float \
>> +     combine_ ## name ## _c (float sa, float s, float da, float d) \
>> +     { \
>> + float f =3D (1 - sa) * d + (1 - da) * s; \
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine=
-float.c-replace-force_inline-with-__.patch b/meta/recipes-graphics/xorg-=
lib/pixman/0001-pixman-combine-float.c-replace-force_inline-with-__.patch
>> deleted file mode 100644
>> index cae201629f..0000000000
>> --- a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.=
c-replace-force_inline-with-__.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -From 49a1644015d073829c17dcd977aab6fdda1ebdee Mon Sep 17 00:00:00 200=
1
>> -From: Changqing Li<changqing.li@windriver.com>
>> -Date: Fri, 5 Jul 2024 07:33:44 +0000
>> -Subject: [PATCH] pixman-combine-float.c: replace force_inline with __=
inline__
>> -
>> -Refer [1], always-inline is not suggested to be used if you have indi=
rect
>> -calls. so replace force_inline with __inline__ to fix error:
>> -In function =E2=80=98combine_inner=E2=80=99,
>> -    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../=
pixman/pixman-combine-float.c:655:511:
>> -../pixman/pixman-combine-float.c:655:211: error: inlining failed in c=
all to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=
=99: function not considered for inlining
>> -
>> -[1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115679
>> -
>> -Upstream-Status: Submitted [https://www.mail-archive.com/pixman@lists=
.freedesktop.org/msg04812.html]
>> -
>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ----
>> - pixman/pixman-combine-float.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-fl=
oat.c
>> -index f5145bc..52400f4 100644
>> ---- a/pixman/pixman-combine-float.c
>> -+++ b/pixman/pixman-combine-float.c
>> -@@ -44,7 +44,7 @@
>> -
>> - typedef float (* combine_channel_t) (float sa, float s, float da, fl=
oat d);
>> -
>> --static force_inline void
>> -+static __inline__ void
>> - combine_inner (pixman_bool_t component,
>> -       float *dest, const float *src, const float *mask, int n_pixels=
,
>> -       combine_channel_t combine_a, combine_channel_t combine_c)
>> ---
>> -2.44.0
>> -
>> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/re=
cipes-graphics/xorg-lib/pixman_0.42.2.bb
>> index 88eef50f7b..3c55c1705a 100644
>> --- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
>> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
>> @@ -9,7 +9,7 @@ DEPENDS =3D "zlib"
>>
>> SRC_URI =3D"https://www.cairographics.org/releases/${BP}.tar.gz \=20
>> file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch=
=20
>> \ -=20
>> file://0001-pixman-combine-float.c-replace-force_inline-with-__.patch=20
>> \ +=20
>> file://0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch=
=20
>> \ "
>> SRC_URI[sha256sum] =3D "ea1480efada2fd948bc75366f7c349e1c96d3297d09a3f=
e62626e38e234a625e"
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#202096):https://lists.openembedded.org/g/openembed=
ded-core/message/202096
>> Mute This Topic:https://lists.openembedded.org/mt/107249106/6875888
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[ross.burton@arm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------4V0Jw00vF3S8jxGe4574UDVE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46J0iPdX020918

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 7/18/24 21:16, Ross Burton wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:135B34F4-47F3-48E5-9AE6-9CE0C7F=
6DE38@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Can you submit this to pixman=E2=80=99s gitlab repository as a MR?

<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedesktop.org=
/pixman/pixman/-/merge_requests">https://gitlab.freedesktop.org/pixman/pi=
xman/-/merge_requests</a></pre>
    </blockquote>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><sp=
an class=3D"ryNqvb">Sure</span></span></span>, I will send out
      the link after done. <br>
    </p>
    <p>Thanks</p>
    <p>Ross<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:135B34F4-47F3-48E5-9AE6-9CE0C7F=
6DE38@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Thanks,
Ross

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 16 Jul 2024, at 10:49, =
Changqing Li via lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:changqing.li=3Dwindriver.com@lists.openembedded.org">&lt=
;changqing.li=3Dwindriver.com@lists.openembedded.org&gt;</a> wrote:

From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Previous patch works on fedora40 with gcc-14, but not works
on ubuntu2004 with gcc-9. Update the patch to fix the do_compile
failure:
   In function =E2=80=98combine_inner=E2=80=99,
       inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../p=
ixman-0.42.2/pixman/pixman-combine-float.c:655:1:
   ../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlining =
failed in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_l=
ight_c=E2=80=99: function not
considered for inlining
     370 |     combine_ ## name ## _c (float sa, float s, float da, float=
 d)

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
...loat.c-fix-inlining-failed-in-call-t.patch | 56 +++++++++++++++++++
...float.c-replace-force_inline-with-__.patch | 36 ------------
.../xorg-lib/pixman_0.42.2.bb                 |  2 +-
3 files changed, 57 insertions(+), 37 deletions(-)
create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-comb=
ine-float.c-fix-inlining-failed-in-call-t.patch
delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-comb=
ine-float.c-replace-force_inline-with-__.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-fl=
oat.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg-li=
b/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
new file mode 100644
index 0000000000..5c79754e50
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-f=
ix-inlining-failed-in-call-t.patch
@@ -0,0 +1,56 @@
+From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Tue, 16 Jul 2024 15:31:16 +0800
+Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call to
+ always_inline
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Refer [1], always-inline is not suggested to be used if you have indirec=
t
+calls. so replace force_inline with inline to fix error:
+In function =E2=80=98combine_inner=E2=80=99,
+    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pix=
man/pixman-combine-float.c:655:511:
+../pixman/pixman-combine-float.c:655:211: error: inlining failed in call=
 to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=99=
: function not considered for inlining
+
+[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzi=
lla/show_bug.cgi?id=3D115679">https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D115679</a>
+
+Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html">h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html</a=
>]
+
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ pixman/pixman-combine-float.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float=
.c
+index f5145bc..f65eb5f 100644
+--- a/pixman/pixman-combine-float.c
++++ b/pixman/pixman-combine-float.c
+@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, float=
 da)
+ }
+
+ #define MAKE_PD_COMBINERS(name, a, b) \
+-    static float force_inline \
++    static float inline \
+     pd_combine_ ## name (float sa, float s, float da, float d) \
+     { \
+ const float fa =3D get_factor (a, sa, da); \
+@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor, ONE_MINUS_DA_OVER=
_SA, ONE_MINUS_SA_OVER_DA)
+  */
+
+ #define MAKE_SEPARABLE_PDF_COMBINERS(name) \
+-    static force_inline float \
++    static inline float \
+     combine_ ## name ## _a (float sa, float s, float da, float d) \
+     { \
+ return da + sa - da * sa; \
+     } \
+      \
+-    static force_inline float \
++    static inline float \
+     combine_ ## name ## _c (float sa, float s, float da, float d) \
+     { \
+ float f =3D (1 - sa) * d + (1 - da) * s; \
+--
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-fl=
oat.c-replace-force_inline-with-__.patch b/meta/recipes-graphics/xorg-lib=
/pixman/0001-pixman-combine-float.c-replace-force_inline-with-__.patch
deleted file mode 100644
index cae201629f..0000000000
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-r=
eplace-force_inline-with-__.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 49a1644015d073829c17dcd977aab6fdda1ebdee Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
-Date: Fri, 5 Jul 2024 07:33:44 +0000
-Subject: [PATCH] pixman-combine-float.c: replace force_inline with __inl=
ine__
-
-Refer [1], always-inline is not suggested to be used if you have indirec=
t
-calls. so replace force_inline with __inline__ to fix error:
-In function =E2=80=98combine_inner=E2=80=99,
-    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pix=
man/pixman-combine-float.c:655:511:
-../pixman/pixman-combine-float.c:655:211: error: inlining failed in call=
 to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=99=
: function not considered for inlining
-
-[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzi=
lla/show_bug.cgi?id=3D115679">https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D115679</a>
-
-Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html">h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html</a=
>]
-
-Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
----
- pixman/pixman-combine-float.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float=
.c
-index f5145bc..52400f4 100644
---- a/pixman/pixman-combine-float.c
-+++ b/pixman/pixman-combine-float.c
-@@ -44,7 +44,7 @@
-
- typedef float (* combine_channel_t) (float sa, float s, float da, float=
 d);
-
--static force_inline void
-+static __inline__ void
- combine_inner (pixman_bool_t component,
-       float *dest, const float *src, const float *mask, int n_pixels,
-       combine_channel_t combine_a, combine_channel_t combine_c)
---
-2.44.0
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.42.2.bb
index 88eef50f7b..3c55c1705a 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -9,7 +9,7 @@ DEPENDS =3D &quot;zlib&quot;

SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://www.cairog=
raphics.org/releases/${BP}.tar.gz\file://0001-ARM-qemu-related-workaround=
s-in-cpu-features-detecti.patch\-file://0001-pixman-combine-float.c-repla=
ce-force_inline-with-__.patch\+file://0001-pixman-combine-float.c-fix-inl=
ining-failed-in-call-t.patch\">&quot;https://www.cairographics.org/releas=
es/${BP}.tar.gz \
           file://0001-ARM-qemu-related-workarounds-in-cpu-features-detec=
ti.patch \
-           file://0001-pixman-combine-float.c-replace-force_inline-with-=
__.patch \
+           file://0001-pixman-combine-float.c-fix-inlining-failed-in-cal=
l-t.patch \
           &quot;</a>
SRC_URI[sha256sum] =3D &quot;ea1480efada2fd948bc75366f7c349e1c96d3297d09a=
3fe62626e38e234a625e&quot;

--
2.25.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#202096): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/202096">https:/=
/lists.openembedded.org/g/openembedded-core/message/202096</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107249106/6875888">https://lists.openembedded.org/mt=
/107249106/6875888</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:ross.burton@arm.com">ross.burton@arm.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------4V0Jw00vF3S8jxGe4574UDVE--

