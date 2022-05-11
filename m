Return-Path: <mark.asselstine@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D888C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 20:37:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2048.1652301433232962834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cMWbT9l3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=213085b3ee=mark.asselstine@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24BKH3g8007005
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:37:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=v+MYVARsuQPPgyq+Mys1E9Le78N80VPciuQHApuesis=;
 b=cMWbT9l3kbfhv/qDimAeWnvyzigXk/bFipIN2QYFjZhU/hl4omoLGG3fxXp7cU6qr+xa
 hLWEziJkvb/Gzo91QAwO7pvHBk90Dyc2qh4PnC6iQQkeR0tGamRCS5pzmKETr5TKvgxZ
 /N1bGBH0+Q56CaV/vpXlsXft7wSNytkauAH+C3Bn4kEvxXZefCYpfBGfhd8SpsX7hTot
 jNK5B3Z7XVZ5pjFtscDWINg0dPipxX3ja4OcnRzxa/3O1pxoIPBnKfvfPWlYqPw00QLW
 bjj47x+THIFVOY6VlJ1To/71VFxM1liQdtBEhbKrT1sP8vM10MbREY4hgeD9Ps2OFDTy aw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwr9k37hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:37:10 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BKbAlX023426
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:37:10 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwr9k37hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 May 2022 13:37:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMZ1yCm3RqIOl/IH1dUU7/JZ/pOSQ7ERvwuytm8kMNL4jhcH+s7Oa0MdjMbFej3CqkGmwPQbIvvMyKsEN28NH8nBtB2HueUgzo4JG1gC7HBcqZs2Ez09DG53FuI8UHQqa5N4Y5bUYNnRI9qx0qRByKRnAV/wvF6QkbC6NKX0UEYS6eKKf6aEMp1w7DdgQQT7seLTuB81y6blCaJv0nE83y7zgN6cv4gdmTc6vWCVAjLN9gI1VeQ6L3Fkbs2NbnSvOCb5cXutz+QDTe6Yl+U9Qqp2KDsWNLUYLhi6B5e829Mh0oHVNcmTUkvlgVKWTDoD7kQQnoLrE/vMzOWA1rCx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+MYVARsuQPPgyq+Mys1E9Le78N80VPciuQHApuesis=;
 b=BiQbORHUEWKNWwZkEWUggWYF5j8Z2rYVWsB44eifKSTt8CT/Q4jN/4HrfzRo722gkL0svZZuVEKoR3PBPZXHOOTIJKZVRdf/y4q64bH/eFcEBm8fp8RQFOMmTq2Q/E/IwRwgnWurHX+rmz+4lvHvrrdVuGjFDV61HVBTGctfbXY4MNlDEsKlLEvDB0Q5SBa3aPBQwin8iMBFJSuAmmbwWc/+dEyR3uJOycNj2yf+ducH6bVssYbZytGp8O8qTyjlrewBdfWnAreBOePP9xIJ4tMb744KbgRtAaqLi9CDilm0FjxnM5Oo9dV4Cvk8z0ERocoaXAklOkZjLsk8jESO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 20:37:07 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 20:37:07 +0000
Message-ID: <a4b108ef-12e1-f58b-9fbc-6a83d8d8666d@windriver.com>
Date: Wed, 11 May 2022 16:37:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH 4/5] recipetool: add go recipe generator
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Lukas Funke <lukas.funke@weidmueller.com>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220506065917.1375-4-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj-Ve7+CDyrfdNP8rQbYO-JY+yo=n5E8A3EcHLjAyVSHFQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
In-Reply-To: 
 <CANNYZj-Ve7+CDyrfdNP8rQbYO-JY+yo=n5E8A3EcHLjAyVSHFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::22) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bac64ed-8ecc-4183-3217-08da338e03d8
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6154:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ1PR11MB61544A18E416301D9F7ABEDEEDC89@SJ1PR11MB6154.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GS3C2AyS8vowjopj2kvh8IUCkf4BzPg0O8I4UwB06Wxl2oedR1IGy6x1rbeqf3kRLorx3xp8nXAzyqqtS3Z8FOyR1bGDMukQz7rvoK2B4YHzX2MR+bdQTocqCkUZR5G6k9xkHPO4BnIVwnhJsjaPr9OvIdXo1yYBELwx9vYU7xRN1vNi0Iai+IFpX0AKTUI5HF3Nf9h9KRyUEkbA6d3qgclDo4mqpGYQ0KNsNKf3Yl5cQjQsj0P6v1Y97hxk6k95qwJliVnFDkkz7VYEwV7aIIULfppa5Gmj1UgUow+3+QVuWProykC91zqqFT5/MvwrP4UzHyi4CeUlvYs6JICTx1wgyEBuFgJmyeqlecoQS9sZxzAZkVR+iktn5KBdgZiyR4qyYg1eUp+NzW1GpVnce3KD3BQS3u5y89AzxzOpZiCQcEpyPie80rL/Pc+rgorfYbnKeeLDozIV/aSkMxkyA7k3bRaFzhDQzOsw0poZGi6oLsmkV4bRWJG9bdb1k5CZR0me9c7XeNisQSydVxXX1+exeFM/81NLmJPIJZ/8yJoJztHAyOPrl+KRLzboBxNaBtMYyrzxWdY/Ncf+nK1j9waonB4Vyd8Oxdaxu4+7AqVBS6SFMV/lV33I+HPrDNzwmo+RMdwPVLpROFIVCzktT1jDIwkrmKrNOVbXS6pS8KfNqRCC0RBt95MQp31VNH0s77XsPFa1YWO/uIf/kN9VjrSm9QEYlmdHu9PWVoIdWwdCoQ+2rSknjdxP93PCCoJUF4Sq8NwV66Pgotnh5uq1odNrf3eeuxxp9VXTW4uF4QdVsAesKCvmCwIlw/r5qJXfh2SBSSyWZtJbvcrbGJWUoiNNQCnJThQqhGzsaGkSv9s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(6486002)(31696002)(86362001)(53546011)(44832011)(30864003)(6666004)(508600001)(8936002)(5660300002)(83380400001)(26005)(6512007)(2616005)(38100700002)(186003)(36756003)(316002)(110136005)(31686004)(54906003)(8676002)(4326008)(66946007)(66556008)(66476007)(2906002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RkNENHA2K1hSYUpqYzRueUxWWmVpOHdQSThaWlkvVHhFeExlMXdmd2Z1YTdr?=
 =?utf-8?B?aHN2a0dNZmd1TlJ4aEg3K2NPN3FESW5KQmtOZ1pqZi9VZEhmWkMrcUFVdUM3?=
 =?utf-8?B?QTJtQ0JUM0wrY3dFNXVsT3lxNWsxeVJFRittYUVkMlhlU1k0RmVveWtUV09M?=
 =?utf-8?B?KzVUeHMxcFlWMERGUXBUenVhYmFFQ0Mvd08wWGUreDBuS0thdFVacy90N2E0?=
 =?utf-8?B?VnMwNnNyU0VmRU1oWjNYMHVNZ2xqdVhUMmlEQXBQeWNBbWNQd015NnVWVU5w?=
 =?utf-8?B?U2h1QjFBV21VMDgyTVhEMjk1MFRCWElpUnBldkd2N0NZS2RQVlhUK05BNGtr?=
 =?utf-8?B?VHV5Qyt1OEFDTnRXSThjaSs1OWtrNUhpdWZwTGRwanVqYlpJcDFoQUt2cTZX?=
 =?utf-8?B?VmRDTzhkWmxEQkEzLzhZMDdESEpBODZPOUJCWXQyRDRXNEc3S3ExY0hxSjd6?=
 =?utf-8?B?RW1LcXdkMWVIY1BybFYrNVJHUWhsblJJdlhiVzMrUEJMUmlNUm5LZVFOam5F?=
 =?utf-8?B?L0VZUkZMaDRTNktDS2xqMytMT21IRkxBSkxuRnBteFlOT1hYM3FFOENCbVFZ?=
 =?utf-8?B?WDRjNyt5RnNEMDZkcGwxT2djK0JGSnlmMlkzdUVTb1BLQzdjRWF4Rk04bW44?=
 =?utf-8?B?T2NGb0w3d2djS0xDQk5uRHQyZnQreFBBM3A5R2w4N0RSNktPYlhlM25mQ2dl?=
 =?utf-8?B?OXJQWDZaQnVQbzV4OFFCMy9CcmxhV3FGM1RLQ1oxdUl4ZUc3VVlHQThXR21a?=
 =?utf-8?B?OUY5dXVyWEI0aStGYWpWTjlHOVZXZXMveS9NYW5uRGNXa0Z0dk5iM0t1cUJ4?=
 =?utf-8?B?UElud1ZpVTc1QWw4Z3M2VzFiRHlrcWtjQ0RYTnNtNkN6YmU2SjhNeVpkbklE?=
 =?utf-8?B?SU55b2RzcHRHVklMUjdaRFFzR05hYk1qYUtWTUNOM1phZjZpY3FMWnhuVXpx?=
 =?utf-8?B?MVh5OU5rRkUxcFNxVE9FUHk0RExSWUkyeFgraW1TNTlhTHBRWHhNRmhVNERQ?=
 =?utf-8?B?cVJOZHplRUp0UFBHaXZLRnE0UmZaRTFYV0MvUlN4bkpNSEIzTzFvbU8wK3Z4?=
 =?utf-8?B?YkZ5NmhYdENuaDdnY3hjcUpGdjlTM1cxNGRNNHNocFkveVFhZGFxcFhFNXBK?=
 =?utf-8?B?ZVdXempTa0Z2dEdhVHVBM3ZYekN2YlM0Nmc1S3BJckFla1JmRlZkNVQvTUVh?=
 =?utf-8?B?bThkRWNMVDlPNXg3a2FXTS9SeHBJV3lwWllmMFJRSWNaN3E5Sk4weGtVMWFi?=
 =?utf-8?B?OG95RUh5eCtFOS94RXNURXA3STFqc2kxdjNzMHF4bVYxeis4WjhOcytYcEg3?=
 =?utf-8?B?cFNRdHY3Z0NPdWJQRjZYOE81OEpVNk91RHgrMloxTklnV2gvdThrUnJxUFE1?=
 =?utf-8?B?TGxDZVR0dXo2aE1lYXZLa3QxSVRwQURjQ1dscU9WcU80Z1U1bStHZ2JBNDFk?=
 =?utf-8?B?Yno1QVpNWnZ3bG9vNzliaHhHRlJPMGxxQ0xjQTBqdmVBRndaUW9UbUJVR0pT?=
 =?utf-8?B?di9Wem5CRHdONzRpbjdkT0Z2YXdEcFRjTEdMWWJHcWdrWkYzaVRydnFYTUhU?=
 =?utf-8?B?VTZMakFiVklablJDMDkzNmFQQlQwMUw0UEMxeld0MUFUZ242MVo2M3luZ1FQ?=
 =?utf-8?B?UCtTS05zMjQ4WUdpM3BhWXBHZjVUUnNZNytWTFVTdFhodHU5OTVoaGljR3lB?=
 =?utf-8?B?SkxMdUhOeGpuRFlobi9OUlkzV2Vybk9RbUllVXRPcklocTJ2QWRQVHd6RlNP?=
 =?utf-8?B?eUZsNUZCbldWRFg0VVJHK0RpRWFRdDRGK1dYdVVrWXRTWllYV3JtOGFyTk9u?=
 =?utf-8?B?aWNob3I0L1NFNk5CQTJiYnpKRGpOaE9xY1UybUJvalFJbWQwZUV6aTlxT20z?=
 =?utf-8?B?RU00VVJoL0NJdURRN1VHd3JJdmliZFBDbHFqSUdYd1NFR3djbWVWdDBKbGdM?=
 =?utf-8?B?cnhXczJvUFVuVjdFUldNeHV1aGs0eUVEdWsyK2dkVzB1V1VpajJ1L1dlTm9a?=
 =?utf-8?B?bkZPQ1p6aGdnQ3hrcS9IN2N3Uk8zQXFscnVQUzRoRVhkNWdBTURodXdKR1Rv?=
 =?utf-8?B?NEc1OFhrY05GbWF4TUhhMk9NVlFHVUdjQmpkWHVnZTRLbzB4OEhkZVArR3ZC?=
 =?utf-8?B?TFpFQzVLbTNkN0d0V1E3bTRIYWJyODlRenVDWVFxOFBEUThDOFBhZnFzNnVQ?=
 =?utf-8?B?WXE0Sjdlb0oyRUxvMHVJbUpXNW96Mi9yTzRQYmNaVTlOUDFzbWF2M1pneWJo?=
 =?utf-8?B?Rlpja1RNeUl4ZzFZWU50Y2ovUnZuaFBIam14WXF1SEpVUVlOOTdqNi9SVlVU?=
 =?utf-8?B?Wk4rcmRGRVpBRTl1V3hTV2tlQW9mMmZseTJvOGxoQWE3RWtqYS83Q3M5OFJo?=
 =?utf-8?Q?5qwWItk59QpemEk6aSVLBMfFdzz41j3klj93y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3bac64ed-8ecc-4183-3217-08da338e03d8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 20:37:07.2044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7VvksoD3BHv4WKSb7YVAnY18sKhmDhdM1Dr0otsFjQsB2aNlNgexQOD1BOUelI/3LVn3Xksg4c+HwpJDpQjSdD0OcKfrAvLzhCw2XgObyuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
X-Proofpoint-GUID: GTH-6wdG1v_GliClIhyd1zmeskv-R1jk
X-Proofpoint-ORIG-GUID: UKmvhIUdj7tmfg4LqmhW6w9QwpV4LmIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205110088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 20:37:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165528



On 2022-05-06 03:15, Alexander Kanavin wrote:
> This is a lot of code. Can you add some documentation for it, what it
> does and how it works? If someone would want to understand it, how
> would they go about it?
> 
> Alex
> 
> On Fri, 6 May 2022 at 09:00, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>
>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>>   scripts/lib/recipetool/create_go.py | 394 ++++++++++++++++++++++++++++
>>   1 file changed, 394 insertions(+)
>>   create mode 100644 scripts/lib/recipetool/create_go.py
>>
>> diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/create_go.py
>> new file mode 100644
>> index 0000000000..4552e9b470
>> --- /dev/null
>> +++ b/scripts/lib/recipetool/create_go.py
>> @@ -0,0 +1,394 @@
>> +# Recipe creation tool - go support plugin
>> +#
>> +# Copyright (C) 2022 Weidmueller GmbH & Co KG
>> +# Author: Lukas Funke <lukas.funke@weidmueller.com>
>> +#
>> +# Copyright (c) 2009 The Go Authors. All rights reserved.
>> +#
>> +#  SPDX-License-Identifier: BSD-3-Clause AND GPL-2.0-only
>> +#
>> +import bb.utils
>> +from collections import namedtuple
>> +from enum import Enum
>> +from html.parser import HTMLParser
>> +import json
>> +import logging
>> +import os
>> +import re
>> +import subprocess
>> +import sys
>> +import tempfile
>> +import shutil
>> +from urllib.error import URLError, HTTPError
>> +import urllib.parse
>> +import urllib.request
>> +
>> +from recipetool.create import RecipeHandler, handle_license_vars, ensure_native_cmd
>> +
>> +GoImport = namedtuple('GoImport', 'reporoot vcs repourl suffix')
>> +logger = logging.getLogger('recipetool')
>> +
>> +tinfoil = None
>> +
>> +re_pseudo_semver = re.compile(r"v([0-9]+)\.([0-9]+).([0-9]+|\([0-9]+\+1\))-(pre\.[0-9]+\.)?([0-9]+\.)?(?P<utc>[0-9]+)-(?P<sha1_abbrev>[0-9Aa-zA-Z]+)")
>> +re_semver = re.compile(r"^v(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\.(?P<patch>0|[1-9]\d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetadata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$")
>> +
>> +def tinfoil_init(instance):
>> +    global tinfoil
>> +    tinfoil = instance
>> +
>> +class GoRecipeHandler(RecipeHandler):
>> +
>> +    def _resolve_repository_static(self, modulepath):
>> +        _rootpath = None
>> +        _vcs = None
>> +        _repourl = None
>> +        _suffix = None
>> +
>> +        host, _, path = modulepath.partition('/')
>> +
>> +        class vcs(Enum):
>> +            pathprefix = "pathprefix"
>> +            regexp = "regexp"
>> +            vcs = "vcs"
>> +            repo = "repo"
>> +            check = "check"
>> +            schemelessRepo = "schemelessRepo"
>> +
>> +        # GitHub
>> +        vcsGitHub = {}
>> +        vcsGitHub[vcs.pathprefix] = "github.com"
>> +        vcsGitHub[vcs.regexp] = re.compile(r'^(?P<root>github\.com/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
>> +        vcsGitHub[vcs.vcs] = "git"
>> +        vcsGitHub[vcs.repo] = "https://\g<root>"
>> +
>> +        # Bitbucket
>> +        vcsBitbucket = {}
>> +        vcsBitbucket[vcs.pathprefix] = "bitbucket.org"
>> +        vcsBitbucket[vcs.regexp] = re.compile(r'^(?P<root>bitbucket\.org/(?P<bitname>[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+))(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
>> +        vcsBitbucket[vcs.vcs] = "git"
>> +        vcsBitbucket[vcs.repo] = "https://\g<root>"
>> +
>> +        # IBM DevOps Services (JazzHub)
>> +        vcsIBMDevOps = {}
>> +        vcsIBMDevOps[vcs.pathprefix] = "hub.jazz.net/git"
>> +        vcsIBMDevOps[vcs.regexp] = re.compile(r'^(?P<root>hub\.jazz\.net/git/[a-z0-9]+/[A-Za-z0-9_.\-]+)(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
>> +        vcsIBMDevOps[vcs.vcs] = "git"
>> +        vcsIBMDevOps[vcs.repo] = "https://\g<root>"
>> +
>> +        # Git at Apache
>> +        vcsApacheGit = {}
>> +        vcsApacheGit[vcs.pathprefix] = "git.apache.org"
>> +        vcsApacheGit[vcs.regexp] = re.compile(r'^(?P<root>git\.apache\.org/[a-z0-9_.\-]+\.git)(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
>> +        vcsApacheGit[vcs.vcs] = "git"
>> +        vcsApacheGit[vcs.repo] = "https://\g<root>"
>> +
>> +        # Git at OpenStack
>> +        vcsOpenStackGit = {}
>> +        vcsOpenStackGit[vcs.pathprefix] = "git.openstack.org"
>> +        vcsOpenStackGit[vcs.regexp] = re.compile(r'^(?P<root>git\.openstack\.org/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(\.git)?(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
>> +        vcsOpenStackGit[vcs.vcs] = "git"
>> +        vcsOpenStackGit[vcs.repo] = "https://\g<root>"
>> +
>> +        # chiselapp.com for fossil
>> +        vcsChiselapp = {}
>> +        vcsChiselapp[vcs.pathprefix] = "chiselapp.com"
>> +        vcsChiselapp[vcs.regexp] = re.compile(r'^(?P<root>chiselapp\.com/user/[A-Za-z0-9]+/repository/[A-Za-z0-9_.\-]+)$')
>> +        vcsChiselapp[vcs.vcs] = "fossil"
>> +        vcsChiselapp[vcs.repo] = "https://\g<root>"
>> +
>> +        # General syntax for any server.
>> +        # Must be last.
>> +        vcsGeneralServer = {}
>> +        vcsGeneralServer[vcs.regexp] = re.compile("(?P<root>(?P<repo>([a-z0-9.\-]+\.)+[a-z0-9.\-]+(:[0-9]+)?(/~?[A-Za-z0-9_.\-]+)+?)\.(?P<vcs>bzr|fossil|git|hg|svn))(/~?(?P<suffix>[A-Za-z0-9_.\-]+))*$")
>> +        vcsGeneralServer[vcs.schemelessRepo] = True
>> +
>> +        vcsPaths = [vcsGitHub, vcsBitbucket, vcsIBMDevOps, vcsApacheGit, vcsOpenStackGit, vcsChiselapp, vcsGeneralServer]
>> +
>> +        if modulepath.startswith("example.net") or modulepath == "rsc.io":
>> +            logger.warning("Suspicious module path %s" % modulepath)
>> +            return None
>> +        if modulepath.startswith("http:") or modulepath.startswith("https:"):
>> +            logger.warning("Import path should not start with %s %s" % ("http", "https"))
>> +            return None
>> +
>> +        for srv in vcsPaths:
>> +            m = srv[vcs.regexp].match(modulepath)
>> +            if vcs.pathprefix in srv:
>> +                if host == srv[vcs.pathprefix]:
>> +                    _rootpath = m.group('root')
>> +                    _vcs = srv[vcs.vcs]
>> +                    _repourl = m.expand(srv[vcs.repo])
>> +                    _suffix = m.group('suffix')
>> +                    break
>> +            elif m and srv[vcs.schemelessRepo]:
>> +                _rootpath = m.group('root')
>> +                _vcs = m[vcs.vcs]
>> +                _repourl = m[vcs.repo]
>> +                _suffix = m.group('suffix')
>> +                break
>> +
>> +        return GoImport(_rootpath, _vcs, _repourl, _suffix)
>> +
>> +    def _resolve_repository_dynamic(self, modulepath):
>> +
>> +        url = urllib.parse.urlparse("https://" + modulepath)
>> +
>> +        class GoImportHTMLParser(HTMLParser):
>> +
>> +            def __init__(self):
>> +                super().__init__()
>> +                self.__srv = []
>> +
>> +            def handle_starttag(self, tag, attrs):
>> +                if tag == 'meta' and list(filter(lambda a: (a[0] == 'name' and a[1] == 'go-import'), attrs)):
>> +                    content = list(filter(lambda a: (a[0] == 'content'), attrs))
>> +                    if content:
>> +                        self.__srv = content[0][1].split()
>> +
>> +            @property
>> +            def rootpath(self):
>> +                return self.__srv[0]
>> +
>> +            @property
>> +            def vcs(self):
>> +                return self.__srv[1]
>> +
>> +            @property
>> +            def repourl(self):
>> +                return self.__srv[2]
>> +
>> +        req = urllib.request.Request(url.geturl() + "?go-get=1")
>> +
>> +        try:
>> +            resp = urllib.request.urlopen(req)
>> +        except URLError as url_err:
>> +            logger.error("Error while fetching redirect page: %s", str(url_err))
>> +            return None
>> +        except HTTPError as http_err:
>> +            logger.error("Error while fetching redirect page: %s", str(http_err))
>> +            return None
>> +
>> +        parser = GoImportHTMLParser()
>> +        parser.feed(resp.read().decode('utf-8'))
>> +        parser.close()
>> +
>> +        return GoImport(parser.rootpath, parser.vcs, parser.repourl, None)

Attempting this on minio client

recipetool create -o ./maa https://github.com/minio/mc \
   -S b5a0640899f8f8653bcacd19791c92ca22066ba3

I am seeing

   File "/home/mark/git/poky/scripts/lib/recipetool/create_go.py", line 
151, in rootpath
     return self.__srv[0]
IndexError: list index out of range

Is more error checking required?

MarkA

>> +
>> +    def _resolve_repository(self, modulepath):
>> +        """
>> +        Resolves src uri from go module-path
>> +        """
>> +        repodata = self._resolve_repository_static(modulepath)
>> +        if not repodata.repourl:
>> +            repodata = self._resolve_repository_dynamic(modulepath)
>> +
>> +        if repodata:
>> +            logger.info("Resolved download path for import '%s' => %s", modulepath, repodata.repourl)
>> +
>> +        return repodata
>> +
>> +    def _resolve_pseudo_semver(self, d, repo, module_version):
>> +        hash = None
>> +
>> +        def vcs_fetch_all():
>> +            tmpdir = tempfile.mkdtemp()
>> +            clone_cmd = "%s clone --bare %s %s" % ('git', repo, tmpdir)
>> +            bb.process.run(clone_cmd)
>> +            log_cmd = "git log --all --pretty='%H %d' --decorate=short"
>> +            output, errors = bb.process.run(log_cmd, shell=True, stderr=subprocess.PIPE, cwd=tmpdir)
>> +            bb.utils.prunedir(tmpdir)
>> +            return output.strip().split('\n')
>> +
>> +        def vcs_fetch_remote(search=""):
>> +            ls_remote_cmd = "git ls-remote --tags {} {}".format(repo, search)
>> +            output, errors = bb.process.run(ls_remote_cmd)
>> +            return output.strip().split('\n')
>> +
>> +        m_pseudo_semver = re_pseudo_semver.match(module_version)
>> +        if m_pseudo_semver:
>> +            remote_refs = vcs_fetch_all()
>> +            short_commit = m_pseudo_semver.group('sha1_abbrev')
>> +            for l in remote_refs:
>> +                r = l.split(maxsplit=1)
>> +                sha1 = r[0] if len(r) else None
>> +                if not sha1:
>> +                    logger.error("Ups: could not resolve abbref commit for %s" % short_commit)
>> +
>> +                elif sha1.startswith(short_commit):
>> +                    hash = sha1
>> +                    break
>> +        else:
>> +            m_semver = re_semver.match(module_version)
>> +            if m_semver:
>> +
>> +                def get_sha1_remote(re, groupId):
>> +                    for l in remote_refs:
>> +                        r = l.split(maxsplit=1)
>> +                        sha1 = r[0] if len(r) else None
>> +                        ref = r[1] if len(r) == 2 else None
>> +                        if ref:
>> +                            m = re.match(ref)
>> +                            if m and semver_tag in m.group(groupId).split(','):
>> +                                return sha1
>> +                    return None
>> +
>> +                re_tags_remote = re.compile(r"refs/tags/(?P<tag>[0-9A-Za-z-_\.]+)")
>> +                re_tags_all = re.compile(r"\((HEAD -> (.*), )?tag: *((?:([0-9A-Za-z-_\.]+),? *)+)\)")
>> +                semver_tag = "v" + m_semver.group('major') + "."\
>> +                                +m_semver.group('minor') + "."\
>> +                                +m_semver.group('patch') \
>> +                                +(("-" + m_semver.group('prerelease')) if m_semver.group('prerelease') else "")
>> +                remote_refs = vcs_fetch_remote(semver_tag)
>> +                # probe tag using 'ls-remote', which is faster than fetching complete history
>> +                sha1 = get_sha1_remote(re_tags_remote, 'tag')
>> +                if sha1:
>> +                    hash = sha1
>> +                else:
>> +                    # backup: fetch complete history
>> +                    remote_refs = vcs_fetch_all()
>> +                    hash = get_sha1_remote(re_tags_all, 3)
>> +        return hash
>> +
>> +    def _handle_dependencies(self, d, srctree, go_mod):
>> +        runenv = dict(os.environ, PATH=d.getVar('PATH'))
>> +        src_uris = []
>> +        src_revs = []
>> +        for require in go_mod['Require']:
>> +            module_path = require['Path']
>> +            module_version = require['Version']
>> +
>> +            repodata = self._resolve_repository(module_path)
>> +            commit_id = self._resolve_pseudo_semver(d, repodata.repourl, module_version)
>> +            url = urllib.parse.urlparse(repodata.repourl)
>> +            repo_url = url.netloc + url.path
>> +            inline_fcn = "${@go_src_uri("
>> +            inline_fcn += "'{}'".format(repo_url)
>> +            if repo_url != module_path:
>> +                inline_fcn += ",path='{}'".format(module_path)
>> +            if repodata.suffix and not re.match("v[0-9]+", repodata.suffix):
>> +                inline_fcn += ",subdir='{}'".format(repodata.suffix)
>> +            if repodata.vcs != 'git':
>> +                inline_fcn += ",vcs='{}'".format(repodata.vcs)
>> +            inline_fcn += ")}"
>> +
>> +            src_uris.append(inline_fcn)
>> +            flat_module_path = module_path.replace('/', '.')
>> +            src_rev = "# %s@%s => %s\n" % (module_path, module_version, commit_id)
>> +            src_rev += "SRCREV_%s = \"%s\"\n" % (flat_module_path, commit_id)
>> +            src_rev += "GO_MODULE_PATH[%s] = \"%s\"\n" % (flat_module_path, module_path)
>> +            src_rev += "GO_MODULE_VERSION[%s] = \"%s\"" % (flat_module_path, module_version)
>> +            src_revs.append(src_rev)
>> +
>> +        return src_uris, src_revs
>> +
>> +    def _go_mod_patch(self, patchfile, go_import, srctree, localfilesdir, extravalues, d):
>> +        runenv = dict(os.environ, PATH=d.getVar('PATH'))
>> +        # first remove go.mod and go.sum, otherwise 'go mod init' will fail
>> +        bb.utils.remove(os.path.join(srctree, "go.mod"))
>> +        bb.utils.remove(os.path.join(srctree, "go.sum"))
>> +        bb.process.run("go mod init %s" % go_import, stderr=subprocess.STDOUT, env=runenv, shell=True, cwd=srctree)
>> +        bb.process.run("go mod tidy", stderr=subprocess.STDOUT, env=runenv, shell=True, cwd=srctree)
>> +        output, _ = bb.process.run("go mod edit -json", stderr=subprocess.STDOUT, env=runenv, shell=True, cwd=srctree)
>> +        bb.process.run("git diff go.mod > %s" % (patchfile), stderr=subprocess.STDOUT, env=runenv, shell=True, cwd=srctree)
>> +        bb.process.run("git checkout HEAD go.mod go.sum;", stderr=subprocess.STDOUT, env=runenv, shell=True, cwd=srctree)
>> +        go_mod = json.loads(output)
>> +        tmpfile = os.path.join(localfilesdir, patchfile)
>> +        shutil.move(os.path.join(srctree, patchfile), tmpfile)
>> +        extravalues.setdefault('extrafiles', {})
>> +        extravalues['extrafiles'][patchfile] = tmpfile
>> +
>> +        return go_mod
>> +
>> +    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
>> +
>> +        if 'buildsystem' in handled:
>> +            return False
>> +
>> +        files = RecipeHandler.checkfiles(srctree, ['go.mod'])
>> +        if not files:
>> +            return False
>> +
>> +        go_bindir = ensure_native_cmd(tinfoil, "go")
>> +
>> +        d = bb.data.createCopy(tinfoil.config_data)
>> +        d.prependVar('PATH', '%s:' % go_bindir)
>> +        handled.append('buildsystem')
>> +        classes.append("go-vendor")
>> +
>> +        runenv = dict(os.environ, PATH=d.getVar('PATH'))
>> +        output, _ = bb.process.run("go mod edit -json", stderr=subprocess.STDOUT, env=runenv, shell=True, cwd=srctree)
>> +        go_mod = json.loads(output)
>> +
>> +        go_import = go_mod['Module']['Path']
>> +        go_version_match = re.match("([0-9]+).([0-9]+)", go_mod['Go'])
>> +        go_version_major = int(go_version_match.group(1))
>> +        go_version_minor = int(go_version_match.group(2))
>> +        src_uris = []
>> +        if go_version_major == 1 and go_version_minor < 17:
>> +            logger.warning("go.mod files generated by Go < 1.17 might have incomplete indirect dependencies.")
>> +            patchfile = "go.mod.patch"
>> +            localfilesdir = tempfile.mkdtemp(prefix='recipetool-go-')
>> +            go_mod = self._go_mod_patch(patchfile, go_import, srctree, localfilesdir, extravalues, d)
>> +            src_uris.append("file://%s;patchdir=src/${GO_IMPORT}" % (patchfile))
>> +
>> +        if not os.path.exists(os.path.join(srctree, "vendor")):
>> +            dep_src_uris, src_revs = self._handle_dependencies(d, srctree, go_mod)
>> +            src_uris.extend(dep_src_uris)
>> +            lines_after.append("#TODO: Subdirectories are heuristically derived from " \
>> +                              "the import path and might be incorrect.")
>> +            for src_rev in src_revs:
>> +                lines_after.append(src_rev)
>> +
>> +        self._rewrite_src_uri(src_uris, lines_before)
>> +
>> +        handle_license_vars(srctree, lines_before, handled, extravalues, d)
>> +        self._rewrite_lic_uri(lines_before)
>> +
>> +        lines_before.append("GO_IMPORT = \"{}\"".format(go_import))
>> +        lines_before.append("SRCREV_FORMAT = \"${PN}\"")
>> +
>> +    def _update_lines_before(self, updated, newlines, lines_before):
>> +        if updated:
>> +            del lines_before[:]
>> +            for line in newlines:
>> +                # Hack to avoid newlines that edit_metadata inserts
>> +                if line.endswith('\n'):
>> +                    line = line[:-1]
>> +                lines_before.append(line)
>> +        return updated
>> +
>> +    def _rewrite_lic_uri(self, lines_before):
>> +
>> +        def varfunc(varname, origvalue, op, newlines):
>> +            if varname == 'LIC_FILES_CHKSUM':
>> +                new_licenses = []
>> +                licenses = origvalue.split()
>> +
>> +                for license in licenses:
>> +                    uri, chksum = license.split(';', 1)
>> +                    url = urllib.parse.urlparse(uri)
>> +                    new_uri = os.path.join(url.scheme + "://", "src", "${GO_IMPORT}", url.netloc + url.path) + ";" + chksum
>> +                    new_licenses.append(new_uri)
>> +
>> +                return new_licenses, None, -1, True
>> +            return origvalue, None, 0, True
>> +
>> +        updated, newlines = bb.utils.edit_metadata(lines_before, ['LIC_FILES_CHKSUM'], varfunc)
>> +        return self._update_lines_before(updated, newlines, lines_before)
>> +
>> +    def _rewrite_src_uri(self, src_uris_deps, lines_before):
>> +
>> +        def varfunc(varname, origvalue, op, newlines):
>> +            if varname == 'SRC_URI':
>> +                src_uri = []
>> +                src_uri.append("git://${GO_IMPORT};nobranch=1;name=${PN};protocol=https")
>> +                src_uri.extend(src_uris_deps)
>> +                return src_uri, None, -1, True
>> +            return origvalue, None, 0, True
>> +
>> +        updated, newlines = bb.utils.edit_metadata(lines_before, ['SRC_URI'], varfunc)
>> +        return self._update_lines_before(updated, newlines, lines_before)
>> +
>> +def register_recipe_handlers(handlers):
>> +    handlers.append((GoRecipeHandler(), 60))
>> --
>> 2.30.2
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165331): https://lists.openembedded.org/g/openembedded-core/message/165331
>> Mute This Topic: https://lists.openembedded.org/mt/90928688/3616946
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.asselstine@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

