Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20834C27C4F
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 02:36:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2502.1718332588460501086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 19:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6895928f3b=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E0eNj1007798
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 02:36:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymcgwwnmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 02:36:27 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45E2aR55006695;
	Fri, 14 Jun 2024 02:36:27 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymcgwwnmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 02:36:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVFsnsHwNaU3Ldq2xvi8g4SB4KvymobAZ0pc5w5SxYHM6HXF0rDsfWX7y4aySUWZ9+nKj9TGotn8RnfXXxQJIahTTWGLVC+o/qPBOYWo+0eb2CaAum17yKz7VT0FtJAmD7UADBHSLR8jXqKZbvcpVbHr86nsuX74pU9Ah7k9C9TXm3M5q7XCzprBjT9zS6taELcHLKEm3EXVWHOPk9AID+7llHgXTPh8pftd+TN94+2tKNBEYw5dLgcJLGidZ4noEGvYQPsiMz4zx8pBpYufSLggX2GSMc8v2i/cdgaytjlBlyMSlHnA+Foam6tBZ1990rkNihlA14BMqBFPELPm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWlDQA8CZ5uQlTBghnRVcOAYLNuqcWJmcFTSxJQpWX8=;
 b=PlR0rscmx78ZEY539OpTnXvgPPzTGdK/kqnI8mG2q7CgBt7r/35EaPibS12GIPbGgSPBkSxeFN9ovKXDmfXXRv9RrhrOZ403UChHHrv2uyuWciR6JaNQAF5ho2ox53qe6fKLAoquPHhMG4s9WhsS/62Sk7+xvHX9Q3bzEpH0Kz49fgb6p29G7x9nYJYH1TIHdRuNbLVECZ206I4IEfUAyRhyOE4Dp8+eoN/2VkpxU6Wf/YgT27/eJIFiwDiV0m8i2IoYs3BQXWHZy4IqUay8XAmAwKYFtkgzUXIc3d9Ngi1TXHMI8Y/F7XXST1n+8YKXFOxuIbPPSm808H5KDB3faQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 02:36:23 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 02:36:23 +0000
Message-ID: <1a0666a0-8ed9-4000-98b3-85161b39bc0d@windriver.com>
Date: Fri, 14 Jun 2024 10:36:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] gfortran: update runtime dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20240613115159.3660790-1-kai.kang@windriver.com>
 <8848eb364f3c60d5883cb0cee25afe9e70d63a54.camel@linuxfoundation.org>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <8848eb364f3c60d5883cb0cee25afe9e70d63a54.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY1PR01CA0196.jpnprd01.prod.outlook.com (2603:1096:403::26)
 To SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: d21a1f79-0142-4a28-b4d4-08dc8c1ac7d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UTZnd04vQkt4QjJXZjNHUXZDRVVqcHF4YWVRUVE3bnlJUkNnbjRtTUZGZmxz?=
 =?utf-8?B?NnRhczBkeUhDYlVUcGNtdzdCUWtvQ0J2d3Naam9tTUQxNE84cE9kSGttSElt?=
 =?utf-8?B?c3NEcmlZN0xQSFc3T2NGdEMzbjhCS1RTQnB1SkMzbmlXUUVVRmpLdzVCVDJz?=
 =?utf-8?B?NmNscWFKcUxLMWtlT09GbWhEczZCNDZwRk9vb2NxZFZjbGpyRlorNWl6Ukhq?=
 =?utf-8?B?Vzg3NTA5YjJVMmhaNENKeFZuNmI0eUtDdnJjUmhlQ2RSa0wxcExuZ0lrWXFI?=
 =?utf-8?B?RE93MTNka1V6aGFXc1lQYWVrSDlibVZNUmxZTFZVNjVGc2w1ZG9UOE9tTEUw?=
 =?utf-8?B?WkNJcEFVbDRoOGorRnFjdm5Xb2thS29yK2wvSUg0VWM4UURUOWQzUzIwdDVz?=
 =?utf-8?B?K2crS0hBTGl5dVp6OW4xT2xrMjRJaGoyTVNFdTdTeDRKR3U1TkUrTkw5ei9i?=
 =?utf-8?B?YVhvN1pERmUzeTcycHJWWnFWbVp4R1RGaGpFRUp1QVhCeTNKdHJoRzAzbTRT?=
 =?utf-8?B?QUFROVVsM25XYXc4azk2RXBjSHdiSmJ6SFVnY0YxNU41TkxOeEhxTGs0MlB5?=
 =?utf-8?B?UVhvWTBNQlduUjVKbXhyTDFPQityMHIwS0VTZG5IOENhU0FGc2hGU0EvOEJ0?=
 =?utf-8?B?dmtFZGFxNG9PZGZKeUcxb3VuV3ZhWFlLNE1WRG96K2poc1JUVUwxUUMrRGQw?=
 =?utf-8?B?N1lmbnJhYStGNE9DYm40THRIRkZvMTdBYkFxZXBaM2xtSlpPN1hWVXlKOVJl?=
 =?utf-8?B?VGxNOER0M0EvbVB1WU5BWnFHYUZOQXBmWmlvek15UldDcUMreEpzTHltWFJX?=
 =?utf-8?B?UHRHc045eGRWTDFRVnVDbVRVTzFRZFZQZ084c2R2eG9IaUVRZCs4bytOVHkx?=
 =?utf-8?B?UVNhOW1rR3RFVGRydG1DM2pJTmxmeFhRaVFnYUExem5iMFRDN242WXluMVUz?=
 =?utf-8?B?Ym0zZ1M0aVVuUlFQcTNueWdVTUJxUkNROGpTN1FwRWNDeHJka2dianJjejYw?=
 =?utf-8?B?UlhIWFlUL0p1dFRNcWpqMmdheXM4ZEtHcWtrS21PcVBQVTkwa1F1RGR6Yy9n?=
 =?utf-8?B?OFBVNnJ4Q3loU3Y5UnA0Z0pyZGc5V1lrVUJtVVZlVGhiWDJxQzllZ0RFUzFK?=
 =?utf-8?B?ekEwaVprNkxCdC95K0thNjFTVThHQVd3aTZRcE91bGtEU3EvYitvMEVMUTdE?=
 =?utf-8?B?cW1KTHdlMjIrVVB0em5veUxUcGg5SmJYc1pZWWNiS2RYNDE2azFwai91YzBJ?=
 =?utf-8?B?cThHcnNyWllMQWcxTTFJRFJsaUhNS2JOS01kc0YxcVRZdE5JMldvdjIyaE9n?=
 =?utf-8?B?QWFFcm1tZml3cTQ3SGN4R1BiMEh1V1VuTnh6RDNYdVFaOEcxbS9WakpSanlj?=
 =?utf-8?B?MVRBVXdydy9iMTRaN0U1S1IxV20rd3lFVlRtd0hVUUh4L1QyeXpXMis1QlpG?=
 =?utf-8?B?SSsvQ082bHM5eDZlTkxRU0FiOFlnYmJReWg0L3UzYVhuY0VkQU1RNmNmdFBa?=
 =?utf-8?B?UXJMbUhPYTBCcUFHY1h2NGJWRUhlVzhzMjVNaFVTRE5XTHVvMThRbUZqbkNQ?=
 =?utf-8?B?TGRDY0JUVTB6d01DT21QU09NRTdkWWhQcDJKd3ZkZ3VGcXVFM0VzUGFQWTR0?=
 =?utf-8?B?MEgwY0RFVit0ZHM5N2l2K2xkY0diWlF5bnpVNmdYOTBlT0NaSXc0L3VaU09l?=
 =?utf-8?Q?i/5IZusu15x39NjK99ib?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(1800799019)(366011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzlneThldjZUeSt5MEltWGlzZTAyODZRK0REbkRTY1lqUHU1N1hWaCtld0d5?=
 =?utf-8?B?WTRyblYrRmFmOXIyQXcxTnl3L29nLytnMjU4UGZqb2RWdmNpMzZiR3c0K3pY?=
 =?utf-8?B?cUtoQS9odGxUMVZ5ODRUUk1pNFhEa1RkVjNhS1M1WEdBRHJtMWVPaTBoVnpP?=
 =?utf-8?B?RXFvTDJlUXdodHlJTkhCby9iakJIeEFaK0oySWFTNzVzcmdMOUdhTHVCS3VV?=
 =?utf-8?B?YTNZeXorU0YweUQ3VkZJVHJ0Tlc1aTl6QVBzVk41cFVtUG5Hdy9GcDJqRGVJ?=
 =?utf-8?B?U0c1TVN0eXZmUEJZNEZRakNmSmxUeXNVSnlBU2wxNkVCTGZMWWRRZWZPdGFV?=
 =?utf-8?B?SksyR3d5OE1BQ1dkM0ZOTTU5REhocG51K0oxUm5iczZnSlNxSWY2eFVCOGl1?=
 =?utf-8?B?cW1CK2svS1YwZ3AxdkJWU0ZheDVjNHJGZkQ1ZTg1Q1BUSjJ1ZEg0Wmw5Rk51?=
 =?utf-8?B?djF4dlVQMmQzaHR4S21uMzRCSVFyMVRWZlU1SVVwOEg5S0VMYkwxVlpCVGJO?=
 =?utf-8?B?bE04cGc2TllYNGpxVFZXbWpBY0tkMzJtd2hYZ0NrelZtMGNETXM0Y3YxVXc4?=
 =?utf-8?B?ejBqRTJJaGNKNWpTR0h4UXI2V0x6cWN1cURXdkh0MUFFc2Q3b3oyMEVPcHFQ?=
 =?utf-8?B?TDRNbjJCQ0lIUDBzTDRVTldWbmpZVFlpd0xJWkcyWDVhMkJiR3lPSFE3T2o1?=
 =?utf-8?B?WHd2SDJzSEdWR0dGMEdtU2FpWFBUSlp1a0QxRUt2Vjh4T2hqTkg3ZXRyK0Va?=
 =?utf-8?B?RjR6WTRNaE1ycFFMQzVYT3d1bHd2TnZnbGJSZjV5ejd2R2NMbUdqUDZXcFI0?=
 =?utf-8?B?ZkdlMTFuMVN5bnhOQ29iWFFINzNKcmQvS2JSWDA1YlpFUU90MENoNkJLRFA2?=
 =?utf-8?B?UjF0NXF2Mlg2TEU3VzNORG10ZGZ3eHV5S3NJeWtOZXZNMzFmaEJDaWFieVph?=
 =?utf-8?B?ZjMvdStKUFY5UDVnM3grWnlLUHNPb0dYOTB1UElDa3ZrZzNWWnFtUlREandh?=
 =?utf-8?B?aE14RFlvOU0ySGdYZ1p2MUs0bXpOREtRSVM3WkRlY3RUbXBHWTRqTjdOUC8z?=
 =?utf-8?B?VGVwSk5VaVlnM2V1N1NPWmZtWk40VmxmMnpOUnJTLzczRXhKbTZBamxUR0xn?=
 =?utf-8?B?U2pjdlNxUTg2cHM5UlZ2WmgzaERrc0VrU29EWmQ2dGlCRytBaE1uMksyY3Y4?=
 =?utf-8?B?a0YyOWNybWxUOGlMK0U5RVBYeXVpL2Y1YVpUMjFGcmRNbnBRSnEyQzUwWWZz?=
 =?utf-8?B?alBXeWY0MkdMWmdKZTRtUmU0Znp1MjczVkJvU3hFYk9DUHpCUzc3TGhEUk9J?=
 =?utf-8?B?c2g5c2x1UUxhTVlndHZ6bHVEdFd5cVlrR0sxZWhLSTVEN1RJdjVBZXpnR0FD?=
 =?utf-8?B?REJERnNGWEQ0SVNDN3NxSzlhTzZVWFduUDFVRjNLNlVoQWMyckdHYXZkN3Bz?=
 =?utf-8?B?eDRJaWhha2ZxY2p4d3ZCVFlVMTNKOGJtSW1XRWNCNEVkc1A5ZU9aNVN4cm1W?=
 =?utf-8?B?YmRJUGdtSFY4bzMwV1ZkUDhiMTNTN295dWtNZEpSTkpXZ1JkL3lmT3ZmdzUy?=
 =?utf-8?B?dXMrSmNjeHJUMEU3TzFwdUc3TzllYWpMeDVMMWNleVU2eEVFbS9FazluazlG?=
 =?utf-8?B?SFJvbU5NcmxNYnR5dERWRHgydEtxbEhFeUNoNXBNWHZuMzN6a1NpcHkxVlht?=
 =?utf-8?B?N2I4dFhGcDNMakdRbUxXZldiWTh6S0JuQlBZWjI3QnNwVXllc1lUZEszTXo2?=
 =?utf-8?B?eEp6RlZUSFdZWTVubEpvYm4rWFBUZUV4LzFGbEVHNiszbXI0VWRZazcycGk0?=
 =?utf-8?B?SkdTMTVwazZsVDZWNThMSW5YR0xaUnUrYkNPMWtrajNJUCszZUMzSDF3THFk?=
 =?utf-8?B?STBxRytFb1VWb2drZ0taczhHOXJXNjNHcEk0dUFkQm5EWHVoZWl0OGhHL3ln?=
 =?utf-8?B?V2V1ak9uNWZOTGdjVEphQTNjZm0rK3cwbEszK1RsUllaa05oV1dHbDhURWFa?=
 =?utf-8?B?QXFnT2w5SkN4dVdFSEduU2lSUzV2c3p1TTdYbE5qaUZPemVUQTY1MGpvMnl1?=
 =?utf-8?B?T0FtVy9ieE5lRDU4NklUaUdIRlR0WlpBUHVlaGxGUnhsbERGcnUyOG1KcXN5?=
 =?utf-8?Q?tBUQNNVf8qesaaDoNI93V8RW4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21a1f79-0142-4a28-b4d4-08dc8c1ac7d8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 02:36:23.2417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXxece8QpLlRqb8/BJZN9h4fnRUjuImlcCdlwrF3I0zdEk269l3dHXmxKT7ItEvciflEe5O2gTGzIUr7AGMOQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
X-Proofpoint-GUID: FyKnUkmXuti3AAsUYARLRzU_CQq36YT_
X-Proofpoint-ORIG-GUID: _lCbOgX48ZBBdu7qWXaXZC6dTOoZk8Dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=985 lowpriorityscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406140015
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45E0eNj1007798
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 02:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200644

On 6/14/24 05:56, Richard Purdie wrote:
> On Thu, 2024-06-13 at 19:51 +0800, Kai Kang via lists.openembedded.org
> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It fails to run both `gcc` and `gfortran` with errors:
>>
>>> root@qemux86-64:~# x86_64-poky-linux-gcc a.c
>>> x86_64-poky-linux-gcc: fatal error: cannot execute 'as':
>>> posix_spawnp: No such file or directory
>> then add binutils which provides `as` to RDEPENDS of gcc.
>>
>> libgfortran-dev provides libgfortran.spec which required by gfortran:
>>
>>> root@qemux86-64:~# gfortran hello.f95
>>> gfortran: fatal error: cannot read spec file 'libgfortran.spec': No
>>> such file or directory
>> And gcc provides liblto_plugin.so:
>>
>>> root@qemux86-64:~# gfortran hello.f95
>>> gfortran: fatal error: '-fuse-linker-plugin', but liblto_plugin.so
>>> not found
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  =C2=A0meta/recipes-devtools/gcc/gcc-target.inc | 7 ++++++-
>>  =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-
>> devtools/gcc/gcc-target.inc
>> index 82da5ef82b..6ab83449ea 100644
>> --- a/meta/recipes-devtools/gcc/gcc-target.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
>> @@ -61,7 +61,7 @@ RRECOMMENDS:${PN} +=3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0 libssp \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 libssp-dev \
>>  =C2=A0"
>> -RDEPENDS:${PN} +=3D "cpp"
>> +RDEPENDS:${PN} +=3D "binutils cpp"
>>  =20
>>  =C2=A0FILES:${PN}-dev =3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0 ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOL=
IBSDEV} \
>> @@ -94,10 +94,15 @@ RRECOMMENDS:g77 =3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0 libg2c-dev \
>>  =C2=A0"
>>  =20
>> +INSANE_SKIP:gfortran +=3D "dev-deps"
>>  =C2=A0FILES:gfortran =3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/${TARGET_PREFIX}gfortran \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951=
 \
>>  =C2=A0"
>> +RDEPENDS:gfortran =3D "\
>> +=C2=A0=C2=A0=C2=A0 gcc \
>> +=C2=A0=C2=A0=C2=A0 libgfortran-dev \
>> +"
>>  =C2=A0RRECOMMENDS:gfortran =3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0 libquadmath \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 libquadmath-dev \
>>
> https://valkyrie.yoctoproject.org/#/builders/10/builds/56/steps/11/logs=
/stdio

I've figured out the root cause. v2 will be sent.

Regards,
Kai

>
> (and may more similar failures)
>
> Cheers,
>
> Richard
>
>

--=20
Kai Kang
Wind River Linux


