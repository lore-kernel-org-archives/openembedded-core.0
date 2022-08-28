Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE3FC0502E
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 00:25:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.54773.1661646303135697044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 17:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=F2XX60UG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5239896f74=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27S0NJX4015216
	for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 17:25:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KTbqsLRTOigfjdIY4cUj5REWXIuEFavhe0IEsZwaQoY=;
 b=F2XX60UGSrTYDGGIV0Gh+NcV2h7TP/sbKluJ8gtIWFn7Vi14Bt/q/WpNijaLah8YxGWn
 BAfINEJWvkfNE+GXWm1+6FlpSIRGIfUQbMo37dHWp6o74g8wxkvauuU2LJPtsRkcKaIm
 s3bMMWeFuJyapHcv2IyIzp4sOLw5tM4yfzTDcw/D1P98kM9yR5z70oYRq4aL6T6I+Dj3
 Bjr4A0S1HEFgBOKCNf/Cb/YTc7VLF/EC2SV53AanqZCifqY7TpB6GxDuK+vz5apzyxkd
 wU2ts27B+VillwVUzk7cXqsng02ocBRPBT7UTycsa84oOtsbsLApWUXkWjLEj/j4pJe+ zQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7jsk8bc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 17:25:02 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27S0P2MN017133
	for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 17:25:02 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7jsk8bby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Aug 2022 17:25:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/dRZOQYe/88aPBUWNyUov8BmN9aXxDefeKIC2rC8Lg7uyu0/mzwpf/MFZKnNEpWN1tURQn9VQumCGOEUSOpRJs40TYXhnQhZJiUGHySrXbdEO711yPPCPlTVibwATiycPwq/BdHK6iew1hfzdg2SaNJ90Q2r+AdKeWGafLCMElk+a8kqrCAgeUorSa37qSJw6+vQSzqGx76T1NHDYh8UNjtqQnumhzKUV363ws+vQU1BebcCwmWL/P1e/1332ORi7cVrCD5aqu8JzuTi3hT2oUr4PMthzHsQbtXAMaNLdaQBitFTzSVQU2JpM8dFhPifwo8qHEHjh+xOXjsU8aOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTbqsLRTOigfjdIY4cUj5REWXIuEFavhe0IEsZwaQoY=;
 b=AgHax1O2BVSS+OqB/Y4b9Y/g4VWVOg6y3XRJLryVDhDjPWo/YcnOBR3wibJS/6DXJItuboj5ULvPb5YCRhrwaEhRYwnJc45AQGuRngHZG3vFTOghhitRCW54r+iR63x7hE0toyAeYReYSz2O/b2N7KQmtR7rY7GysfzboPz8tbLVRic9d8zBNQJtFDqjX2ggaR0b3UziQnF6J4COfgmXEOKgNdUbg8vtRc/bcnzYD6WS2lcH6/zYLdEiHZW+8+Ne8e8RxcUcfDgQfRFB0BBAyi9oj3z7ckhRvxwGdVWi/7ProNyWgKHNGS0TxRdVQi5+JmVYK6Qm70UeeR0XkVuikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN2PR11MB3790.namprd11.prod.outlook.com (2603:10b6:208:f6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Sun, 28 Aug
 2022 00:24:58 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5546.022; Sun, 28 Aug 2022
 00:24:58 +0000
Message-ID: <aa641d1c-5ac4-ae0d-b495-754ecf0121a1@windriver.com>
Date: Sat, 27 Aug 2022 20:24:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe-core][PATCH] packagegroup-base.bb: remove wpa_supplicant
 preset from packagegroup-base-wifi
Content-Language: en-CA
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
References: <20220827050842.5781-1-f_l_k@t-online.de>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220827050842.5781-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 908d1566-e385-4473-8c8e-08da888bbd3f
X-MS-TrafficTypeDiagnostic: MN2PR11MB3790:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z+irs0tdTn7IaVs1sYz9LXZMoqtEKi0S7VNXmYnnTObnyWnRqA3fjA/KaCTLYMgxmltb6N/KPaPoOcYbojSksV9OdfC0spYKAImnNiOT5ESe3JHtoWm8BawdF22MZeOx0MO8cQYRnW9HIdqMwT27NLXgLL/Itaw6Pv46QHjEF974MmpHghpBCa9cy0pejFXze0agm3y7okcvTp+osSQ6s5K5/Ut/D9YQd+l4Be15xcrfjXhkJjOGXinUd3hlrD8d8CaUX5Dhlx7Qxp99ex/FtlbEH2MknRSppb+vhuzT8rVWeFefdq5dsYzNQUccTDdaXnm1/8jRZC+s4H6PuKAl8H0PuPIbI3y25cKsNobPb+rDyuu32TPneCzj108BqVSw+7O5jSaFAHvUBguLDAZ/7lIxVK5sGKNfLsRZcYC/heqyIinbQjtZXu3jFu5Zo8/8kv3x+yYxKrz+uNbo7wm+Jd4RHebrYqxm2yvunaE5QPYnKihGjDZrJGLdCGN1xRHp2lumCMHWJchYTf/8fBXvfiMg6yNpS0DeleRsogKurG1MWI/72KZY4GshzgDfUE7ZQmorHpDPXvt39ZHGB1/t6rQEQqtTeS9XcWQxkM/ViVM/FgGd7a9aE66f8w4LlElx5veqmZ9LPDVzJUkD4aB9u/Bz8AZggldUS+jMTXxcKXwQwEek3TJUMZk0T4EWD+YbfIvia4HuAtBXHJ7Jv1/1R2141j+d/qrQ1SyVlQQexGesuTCIxXQtASFv52Fi2OuaD1AKqiz9YloDZtj7aK8r8+BMvXhr8UIKblVBkms/hkl3YTup2ksEmMke4IQzsHAZK9e8B1RzsMzijSHrjpp7++WeifJFvAs55fG/36AsAA+hvN8Symt62dPnuc9NBANDqVlVaj7gCeZuYuTH6ejJbg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39840400004)(366004)(316002)(966005)(31686004)(86362001)(6486002)(8676002)(66946007)(66476007)(66556008)(31696002)(478600001)(36756003)(8936002)(41300700001)(5660300002)(38350700002)(2616005)(6666004)(38100700002)(6506007)(2906002)(52116002)(53546011)(83380400001)(6512007)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3BiOHBXUXRIclZGaldLL1Vxajh1dVBJeGR2S2dpNU1Oa3R1VkRmYVhNaGR1?=
 =?utf-8?B?TDdDT0dpdWpOdUdSK2lFYUN0R0dyZ2g2WVJVZlFybXY2MC93SlVUamVuTWpC?=
 =?utf-8?B?ZDNDWGc4UmNUVHpVemd0THBSMXBsTUNHRnZJcVQvbUlJQlpvMEdnQWw2ZXF6?=
 =?utf-8?B?YjdjK3AxTjhhcnZicW10L1RDTDhjRUpPZ1U1MmRLNWNxanY0ZHFXb1dsQmh1?=
 =?utf-8?B?Q0VET2N2NVlBeis3TUxBSmhyS0dFZ1gwNFNlaUxDbVoxbHA4VnFWZUE5QTN2?=
 =?utf-8?B?UFcrLzJibmdXZ2tEV1dYZXJYWjZ3bU01ZldPNlBxamtyMVBuOEo5NnFDU0Y0?=
 =?utf-8?B?MzQ0NUVsM0VmZVFUa1llSDZKWjhabUlzZXllVmZBZnFyZlRZYVhkQXl1aEJT?=
 =?utf-8?B?QW5jVi85K21NcndYYXZ0SVE0VWFHTHkxajgrODc1QVoxY0FoK1pWWEswOTU2?=
 =?utf-8?B?S2lBRlZRckNjSVJMM3JhL3Q5eWRzL09xZkNLT3dRZVJIUlErSkc5VlNUbTBz?=
 =?utf-8?B?VFpqQVY4VE5ZTy9aMlVhM21xUWR5ckcxVWVWSkpHSU1wMnJ2N1p5Qk5ZS1Rv?=
 =?utf-8?B?QXVIMS8rOG5pd0JLV1hzRTZGY1lUZnpXNjdYbWplQnlwa1NJL00wR0daSmVR?=
 =?utf-8?B?UkJ3VUlpMzd2d1pSRUFldEF1Q0hkdnBQOWVhSWFiKzhsYmhRa2hWeUFreXk3?=
 =?utf-8?B?ZHd1a09ocHBCR2RxR1FUbFVIZXRqQ0d4a1VxV0p5SWF1TVlYbnZ5cTlRUFBF?=
 =?utf-8?B?RUh2S2RwSFc3UnlTR1l3eUNBSS9BQlZHeFZYSVRGUjFvMHRIOEpibnlSdTdw?=
 =?utf-8?B?MHZMbnZYV3YwakpMWlhYeTI2Qlg2ZHBMOXZlL3NleTR3UlFSQmtMWmFsUDJ1?=
 =?utf-8?B?aXowanlrMnNjMWk4bXpJQjB1eGRLQ01DallvcjM2aXNpY2crSDdkR0FKSWxU?=
 =?utf-8?B?WVBKRjZaRFYvRzExMkR1MkhsclA2Qkd2UFpsUGN2cjhGeUZIZmw5Z0xTb01X?=
 =?utf-8?B?STBzUXhuZVlyNk9DY21pMUp1Nk0ycE51VFpvY0ZCcTFZWUhqeThCMGxWMWtw?=
 =?utf-8?B?NVMvc2drbTJOb20wOTNzNnlNckIzRSsrWkdvS3RtYkNzdHc0SWNycVRRQVNq?=
 =?utf-8?B?QVFqTVRPOGttUUZqbnFTellxU1R4Snc4ZW9zSzQ0T0NNUlF0SnNWbXVLVFM2?=
 =?utf-8?B?OFAyRUcrL0FXMXFwdzJ3WENXazFRdkNQdlVLOFZBTHRXRjZyaXN5Rjh0YnZm?=
 =?utf-8?B?ZDEwd0hYdnpDcnArQ3liNjZZUnB6ejdrMENPcTlUazhLR3oxVTdPc3JYOFRL?=
 =?utf-8?B?ME01TCtqcUdVZWYyd2E4N1FXRTR5MmN2MHlZbUF0allqMkQxWXRpTjVaaytm?=
 =?utf-8?B?WTZjSTdPQ0NPVG1xM1E3a2pOaFpuQkdQcy9sdGtaSVRWSlJuc0hzRlM2dWhR?=
 =?utf-8?B?d1paS1RDc2F1Ykp5TDkzTXFhbTVWQkRENGc2OFVVdEZVRFdKUWp5RVRCdVc4?=
 =?utf-8?B?dFkrUWxqdm4vdkQxWVBZNWsyYnB4VmJRdDA4ZWNhZTJ2cStoK3ZjK3phWnVz?=
 =?utf-8?B?YkV0U3FQcGkvaGQzKzVaOHM4RDdsckNSdFkzSi9YdjV3THdBU0pXcjhXbWpI?=
 =?utf-8?B?aTBSb01kN2k4ZmhlZThQdWhndUQ1amNZVXA4OUw4MmlsZ3NwbzVNVW9DSGRQ?=
 =?utf-8?B?ZTJzcUovZ29TM3o5OFFzTWxIT3FVei8wQVhSQVdQQUt0TGwzSi9MYWFRNWtB?=
 =?utf-8?B?LzlKSFlndTAybWU3ZjNlMEJ1bWN0TzA0WWc5Ni9ENTVnMGdNZnR2RGhMT1lS?=
 =?utf-8?B?dUlvc2gyMTQvUHBGQkVKaVJzdEV5ZjdhU0UwQUQyL1h1THBrcS9LOXlUNlY2?=
 =?utf-8?B?cVV1bHkyc2d2aThReUFpRkpqKzBtSnFlM0hqclQ3R2xRUDNkTEdZRXdkd3g4?=
 =?utf-8?B?V2ZDK0xHRU9UdW5PNmFpSXM1dVAray82U0Q1RFMyVHVQYjNjbGhHTlRGYUVo?=
 =?utf-8?B?MHpZaWdRemRQYnFpekZXRDJ3YTlKaU5EbVMyamNvK0ZwWTRMN3hsN2F4QkZy?=
 =?utf-8?B?eUoxSmN6QkNnbGlUb09VNUR3WENVdDh5UG1TWFlHeGRQQXhrdFpPQ1RRdVcz?=
 =?utf-8?B?Q0tXT2JZSDlkWm5JQURnSXBPOG0vUWNGYWFoTEl3b1pTUWlpKzdTNVdzNzVN?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 908d1566-e385-4473-8c8e-08da888bbd3f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2022 00:24:58.4955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SrHpv5kJTuNQLYJ5FtPsQWhdWbEQZUcqxUU+AAU+Be79UMaw51akUPLL+uOrmt4Axtw72Fh8K6o5ttaJtIQwxjmPbyxaSY3CgbGMmeg5VT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3790
X-Proofpoint-GUID: 7tVFTTJWwfC8iJKmTVgv4kOievot2gWL
X-Proofpoint-ORIG-GUID: 5p6qYsLdP7ove3DiaOUsEAz_eTVTqrRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-27_10,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208270094
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27S0NJX4015216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 00:25:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169974

On 2022-08-27 01:08, Markus Volk wrote:
> This removes wpa_supplicant from packagegroup-base-wifi so that the dec=
ision
> of which wireless daemon to use can be made within the recipes.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/met=
a/recipes-core/packagegroups/packagegroup-base.bb
> index 7489ef61b0..a70a107dac 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -271,7 +271,7 @@ SUMMARY:packagegroup-base-wifi =3D "WiFi support"
>   RDEPENDS:packagegroup-base-wifi =3D "\
>       iw \
>       wireless-regdb-static \
> -    wpa-supplicant"
> +"
It's a little late in the release cycle for this sort of change but
if we do take it can you add a short list of some of the alternatives

in the=C2=A0 commit log to help people (me!) out?


../Randy

>  =20
>   RRECOMMENDS:packagegroup-base-wifi =3D "\
>       ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-modu=
le-zd1211rw', '',d)} \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169926): https://lists.openembedded.org/g/openembed=
ded-core/message/169926
> Mute This Topic: https://lists.openembedded.org/mt/93285166/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


