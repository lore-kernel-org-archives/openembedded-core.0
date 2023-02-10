Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E22C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 07:49:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9199.1676015359807663813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 23:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=tD2XJ/n5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1405f26446=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A602t3013320
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XsR7Ughz7P8WoUW8TAbNpwwMK+2T8NMB32aASBkWtBw=;
 b=tD2XJ/n5k74XAMd6MLVoX7CvREf/RDB/arY5nyHXLLx92VkgIlyyfI9GiCJU5FLZ7l+L
 QKXjyDs+E6esZTmM1xpMDGKulZt+WWKQyN15/cbh+6lymCMnk3CXoeHorryusHYGvMNy
 2C0NvdGMpyVD5z3XxCCj6sDx0osRc23JriUZFkGFo3MxNH6KQk2RoT6UTGtgE0XsjOIJ
 Qgbzbggme1urQncP1buDGe33jXLJcCGVOK2Ukzzd0XWdtYfB4BtA8DzHq8jnY3MA+eZs
 tmMPuYWeIg/7iMiugJJnweTc80WXSs7K3eJ5gs2K67/AyjSKxUhH/8+EkVQR2CEZ11RE Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebae22v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:49:18 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A7nIet010124
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:49:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebae22u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 07:49:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFRfCjoIA+j9W4EmjKPyoLxQEeobptFQUY+T+d4LUGMnp8rRisDPRv4zVff+UnlpGx75aOg29dkFifLBqzGGxXPbvDwXX37Cqj7xCd/qxic9W1OhnOe+qKVBi6s0gdDa7Jcx6zOJ8YHPBUWzqsnvgjNGmyOut2dL+MR5Zsp1SoVRuJMZNnXho30Th/A+swg/2DxYP6IhmKuZNFqYF1v+driAztDpaXQxG31oFYpOVr3OEor6M3CFebt7V4cTBppqyyxm7Zr3in6tMAhC6YbBt2mYkj/hxi5fQMOt3KL3yVZBwxa+j1oBy/kWzGHdDQFT0kw9wVUcpaRyp9mgnmkUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsR7Ughz7P8WoUW8TAbNpwwMK+2T8NMB32aASBkWtBw=;
 b=g7Rt8FNhtaTM3TkhYkhDInlyW1lZsrv30r9pxW7T0AwigbBYifDriwk+lrcYgnIhS2vMVPLD4g6uMbkSoNs2xX9ULLQgXydWRZ+NSzd1Mxcfl+yNl1gfc4XAxaCbt+9akjCpFw8GNjdXYFtHFJLjzljv0zLOp8Xj50//mcxalC2Ea3WwTx2ezCyy9tz3jKiB69QaaPCcnmfR952aaL1BjWDXC1sj3FydqJFaQINZyl9cvYgbuhAk+bv5SsPwhcYjtiOpOXYCagh8w2jad9CG7ik4BaJUCL6AFs3b5vgkxxXG6oGn7TTs2m0c2NRmhJMhPFIQ3ntpMowENyAo19JfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 10 Feb
 2023 07:49:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 07:49:16 +0000
Message-ID: <b9adc480-1eab-3c45-151f-a60387882ca2@windriver.com>
Date: Fri, 10 Feb 2023 15:49:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
Content-Language: en-US
To: leimaohui <leimaohui@fujitsu.com>,
        openembedded-core@lists.openembedded.org
References: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: a87ad3b2-6d2e-4be9-e7a9-08db0b3b4f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xTN+PuueEWg41P89uQ/Vst+BJdrcMNX2cKYyl9SWUccq7WbnIDLB4V66ge6Lg0y//7mOy2sCIxJtK1newWYuYGnB2pG92nbRiecHSN0lhLCNFLSEQ/dcHrB783+v13WWcYjyrsEyEXy4tqTiTbA8nW6fytq+OkvqyFRhMxQ9YHOhsJmSCQZfghkrugy9st96c86Ajx7NYU5xOKrqRjrYZL0t8pNZyc39F4DXIqklxaKpqeuEVUPn24GKxrFH2c8rIH5yJdq7+mrtiQ+QKIaA+kajT/Yj8DV/quBtUPx7AXB7Tb/zzMKlNqYle5O2arACaOp+ZUzCwpuQzKf31eRfW7H0gn4pJt4uGSLqkxlGaM39c5CvfWE/8EmeTpyCcP8nEUYYTs59pUGkDlGx/ScykLfZWnhROt0h02V8ivZGGaEwl6jzYDuciB0xv34gsvjlDudsc+7GLLwdsxgdAwTWhd4WHwM8E4qiKCOnc/XI1i5rMEOAxej24Pnv3DPvpNOm9DP36VBYoRNQaoZRFL4LGor6h8fm8td/lsO1T3W9XZSvDpZTPWMwtxg9ia4Wc3zEqLf057qyaygIsPZRy3JkFWN4nFQeagvb2QfNTwxIZ0IapzHxcLIcEMlB6bPU2Hj6Y3Er3CV2lrWAf7Uta5nt92+iaP1fKHWwOjWynjXZcWa+zIam60bJ2+Jza17gjskB6Zl1OxqYz4uRVI4uiQVUouteAEp1MdgMYuEv9XAD2B/9o/q49gaOZg/ICLESJhAb0PigNFsmfHeMLXJw1c6i3peQU4CSIg4VC0EJA4hYdYFvj/SYmTQGVP/bkqu8OZbt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(376002)(39850400004)(346002)(396003)(451199018)(31686004)(66899018)(2906002)(2616005)(186003)(26005)(53546011)(6506007)(6512007)(83380400001)(478600001)(8936002)(6666004)(5660300002)(38100700002)(66476007)(66946007)(66556008)(6486002)(966005)(36756003)(31696002)(86362001)(8676002)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MlhxSWxSb3VxZUNXRFNVeUJmeFhCMVFJR3U2d1JkYVNjK285N2Zoa3FRQjFG?=
 =?utf-8?B?TENMbEN6SHZRWVlRVFlEMjUzdWFUSFJ1OEJrNEZxaHEvTWJsMlhGMHlLZkZx?=
 =?utf-8?B?enNKbmt0Z2JOTzIxWUw4cWsvdzJLeUdXVDdxM1pmRVFlOTRCTXpyemR4S2Uz?=
 =?utf-8?B?ejZqNC9jcEQxN2tGdHloQjRCcUU2RU5yT3ZzdlduKzc1cWdGSDBGVkxkTldO?=
 =?utf-8?B?NDBLM3NablBoa3VYSFV1VjY5WEtTL3RsMnprcjB5NStKYld3SjIwQlpmOFZz?=
 =?utf-8?B?RnVSdDl4WG1seG1nUzhBeUlpelpHUGpaenZaa3E2QTlmT3ZHMm1jYU54Zm5p?=
 =?utf-8?B?N3ZaaDhTTXRzL1NIa1FoVWlFOC81N0dKSTU0L25zNUt5OGljbWVGMmxqZysr?=
 =?utf-8?B?eUdCbEFWeHZEYXEwSlMwMWhRWGNBWnZ5VVNmME9TMDlHb3QxMUUyYUJkVnVp?=
 =?utf-8?B?eGlGZjlIRmZyQ2xoeVhQckpaUjZ5OXVidVRBUHZTWWNQRVhqL2NwWFpjVTJR?=
 =?utf-8?B?UFBsY2VaWURIOVJxdWpQTEtiQjlYTEcyY3BDL3NDYnhqVjd6NW91Mm1IZGhP?=
 =?utf-8?B?Y3E4ZGlGTmtjS09zOG5PS3Buc2I0ajB5SU5iVWtnTzc0RlZTa3prTDhLd1d0?=
 =?utf-8?B?T0xZbERzNzF5NCtSZDY3ZTFuTDdrRWJ3VkIxVVRraS9tSUU1N1VQWmVCTkxO?=
 =?utf-8?B?WVdtdmJDMWtJR09vaVZybDRvN0xQMFgvWHNNQkVRbGFqaDdKOCtWSWlnRjZi?=
 =?utf-8?B?dVAxV3ZsTHF5WmlabjJSOHV1azFrSHhjOHM3L2QvaTJXQ0oxUkhod0dXb2Rz?=
 =?utf-8?B?M3BOTU1UT3BwV2VlRW1pc2t5UTNGZGdqMjF4MzBmc2tiUEIwckdNaERiK2Rh?=
 =?utf-8?B?QjRoY3FyMWFwVURJTWxkSk9NbmhUakRvcTIzOTVMcDNYTXliOXFqYUUwaHRJ?=
 =?utf-8?B?WDFIRmg0M2p4WURSKzlaK2J1TmIvczFpRG5tenhEWmdMeWFDSWVsWjRRamw1?=
 =?utf-8?B?bE1BS2Zxajcycm1NaVZvd2FyQ0w3Rm8valZCTzlYMEFrNHFPZS9oWHhVRkpx?=
 =?utf-8?B?a1p4Y1RrSUlMMWhEMVk1T1pkb0NBdURDN1diVnF2cWVCMkNJTVFEQVJxOW43?=
 =?utf-8?B?Q1N0MnhpZWluNnBCY056d0lEN2Ryb3JHblFBdzRzZnY0MnRFcWxkS0tjTXJZ?=
 =?utf-8?B?akx3ZTRJdTBFampXOHdyTjZBblpjWHhjaFpSYjNXMU5JOENrVXBUNCsyNENy?=
 =?utf-8?B?T29nTnhzVy9TVHRqZXFUZVl5V2t5YU5LVjNFTHJsYThsSDNkZmpub2Vnek40?=
 =?utf-8?B?ZjNHdzM2WDBmZThKM3pXSkhGcC82c2NCTmZaR3FxQXBuSnJRSjRKQ2JMSTJ0?=
 =?utf-8?B?bVNWMUZyMjJ4eGg3NmJlUGFvSW1LQWEyNU1qbEpnRkNNT0xZeWVWbHIzS0gv?=
 =?utf-8?B?RjNMWFc5VExGMGxQNGNoSmxoczg4UzAvNFBCVXBuN2ZIVE5ZSmR6UnNYMUUx?=
 =?utf-8?B?OUZSV1orSzRCckR6M2dCYkJWdDIwYWxuUmhyTzhZYkIrR0dBb2NKWGVjRFFD?=
 =?utf-8?B?QUcvNUJ2dmk2MGRvcVpKd1lMaVhBL0pmaGZDNHVKdWNOOHFGM0dIem5kQS9K?=
 =?utf-8?B?YlZodW1GVFhOSlhNNEY4ZUxXTTlUaHU5VjRvdkVoSk95K0NoSmxtQWZPUmI3?=
 =?utf-8?B?M1pKUXNNRnlBQkRoaDlINjUvcmdCL2FVZmdGRTBTb0NPczVlbkYvMFNBWlJF?=
 =?utf-8?B?QzhDL2ovYTZGSmRyVDNtRHZqYS9kTWlZQXZTeWFmSGVxS0t6RTV2N0lMeDh0?=
 =?utf-8?B?MWZpdm5ubGx2OWlJeFlsWUZ1MDI5VnFYOURJNmtPYlFKU0dzMEVxWVpwZC9o?=
 =?utf-8?B?cDFOWEwvTjNhclRoL05qT3lWVnhjWWp0V1FpMGdhRzFPV3FDMUFaaVZkNlMw?=
 =?utf-8?B?UnF6OHNVdC8vTGlSTnJHNXRFS0pyYjhHMnkxR29KY3RMdXZhdGVVLzhpcXBW?=
 =?utf-8?B?Q3k4Sm1jK3V0YU9hQmtiTVNPUWlzUDArZkVnRjQzSnlna0svRllVWkpJMTE2?=
 =?utf-8?B?ZU5mdVB5SXlnK0IzTTA4SS9Bb2lJbXZkWHE1WEhna1NPZGlXSUhkRmdhRWVW?=
 =?utf-8?B?eEltNlBoZDZtWjYxZS9waDN5TzdSQkwyYW83TXpZbzYvWEhqeVk3TjZXbGNw?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87ad3b2-6d2e-4be9-e7a9-08db0b3b4f20
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 07:49:16.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMzMxaDToYdO6uRXRayJ7ZZlteDE6Ahixfn7o+cntBSBKTgmMs3KecHr+UlFRo/0HpVedJNdCLitiq6/QLrLHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
X-Proofpoint-ORIG-GUID: ZKQ9AbM9MICbGYt0ez_5BxeJUz6WrQsw
X-Proofpoint-GUID: VLuBCiNOaqAJTYE-JewaJgKkQmw1lvNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_03,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=857 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302100068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176985

This does not seem correct. These two packages have FILES specified, and 
ALLOW_EMPTY:${PN} is set to "1". I suspect the actually problem lies in 
somewhere else.

Regards,
Qi

On 2/10/23 15:34, leimaohui wrote:
> Problem: conflicting requests
>    - nothing provides nghttp2-client >= 1.51.0 needed by nghttp2-1.51.0-r0.core2_64
>    - nothing provides nghttp2-server >= 1.51.0 needed by nghttp2-1.51.0-r0.core2_64
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>   meta/recipes-support/nghttp2/nghttp2_1.51.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
> index 8ddb851f71..72a4372214 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
> @@ -24,6 +24,8 @@ RDEPENDS:${PN}:class-native = ""
>   RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
>   
>   ALLOW_EMPTY:${PN} = "1"
> +ALLOW_EMPTY:${PN}-server = "1"
> +ALLOW_EMPTY:${PN}-client = "1"
>   FILES:${PN} = ""
>   FILES:lib${BPN} = "${libdir}/*${SOLIBS}"
>   FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176983): https://lists.openembedded.org/g/openembedded-core/message/176983
> Mute This Topic: https://lists.openembedded.org/mt/96872036/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


