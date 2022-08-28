Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D575ECAAD1
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 00:37:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.54874.1661647058184885610
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 17:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=hhn4DtfZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5239896f74=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27S0YEWG001585
	for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 17:37:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=iHE1gmUljLIzIHLyv2nW7TacaWBMQRzxVwRt+m0GroI=;
 b=hhn4DtfZrrS1LEMHXcK+6l7Am57AKacaeBYWw3o/cR2ovDSc/1TWUdoS9Is+zUW+BY3K
 w030SgI2gtN8w6eRmKN/fjE934L00KeP9lN0m2IhdJ5Z/tPN2hCXvbPwoUnT/kigjWal
 W1xrVR/ycDZNHsf4xJYfVcQDOPnpM6RZkB2f8IwxZNp4+nRbnXJyNWAiU1dRWE17mOg+
 GkXmLgeMET+ECxSvIHFFzDCeyeRQ9SF1SoYlZJClmdWVK1JqnK4o7KssJl/wOP5jxpxK
 pb5h4EOr/62Y1DS/KxHlr8dWl9NeOvWCOug+F2+tFDSGJ6ltpSh/jcTx9GQBalB2/f7/ aA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7jsk8bjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 17:37:37 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27S0bbLu006880
	for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 17:37:37 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7jsk8bjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Aug 2022 17:37:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guroMZr90TAdKV1ZIFx4yZ3GiU6lPojRhvx2CAIzkUu4Te1eqcjxN5koOsUqoo+aZnYS+4KjlKGwT8viHO66L03gSDiu34gZUbgzqa1hkhkgf2iAAoQduMJ4CZs1OwSxqKrJJekH9FcL9JoBOc5mg9rm6Kgfd5zXt+lnOXCcDeYqFXroya2hNVwtmnwOSRt4EMVzN184WoCDQyGeh4l6ptVL3M4zRDxLx/n6MYsupqMcOv9V/OvtQ/mDn9Fob/hnxAUFhnFrPtVd2qg0yK2GB+LWB5lQLVfLNyPKq/WL/tLNln5DjvynnN+QNViIb8MbYZoCKJkpNmc25yHmC2X+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHE1gmUljLIzIHLyv2nW7TacaWBMQRzxVwRt+m0GroI=;
 b=Oj0p7kFRtnq9CFKYXH6ogq/eJTeQuoDB3cit3UBVkHE0nrCLnKeGzTQMN0pxa3NHptS68RZL9yvXwrARwujlGpBzDxQD7//os0FAsgvbnntjaq8SZBtDJPR8O2Ml+Jxce7t4zj3VAH6YdCgYoYovzhwG+u1hp46/s4WVBzJscGbfH7K+y5eW3/zFFqJInAF26JFngnf2HUsFNAMXzY/igF3arBQT+6g2o0ZRm/8bdYHhKqCnwJoU8KHS4BCbZ0Hy8YjkvmngsFSyR2S/nVVMNaWpOPE/eN41+DQ+mxtehkahxYyubD7XFC6l8upMFiE6A64CymMtswUim+KkHVAuoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Sun, 28 Aug
 2022 00:37:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5546.022; Sun, 28 Aug 2022
 00:37:34 +0000
Message-ID: <eb4e1ad8-0006-3fcb-c45c-23c53876e8a5@windriver.com>
Date: Sat, 27 Aug 2022 20:37:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] xz: do not OOM with 3x builds, lower memlimit
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        =?UTF-8?B?RWR3aW4gVMO2csO2?=
 =?UTF-8?Q?k?= <edwin@etorok.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <2ed08c8656181cf2b4495978e28e70c5274fb7e7.camel@etorok.net>
 <CANNYZj8GigGudbwsES8zvfKGUs9sr+wHTRZMP2uut45JtDgOcQ@mail.gmail.com>
 <e40af25a1dedc9780f107df17cfb81320235653e.camel@etorok.net>
 <CANNYZj8Wa7-u08yzSNEYUOtJBMYO5hNEiWWjAPjB0ieytSBQbg@mail.gmail.com>
 <2e91bec4aeff2002d84b96f4c7f06b99119f948c.camel@etorok.net>
 <CANNYZj8GJgtbDHan0jpNXswe=A4iRq854c5N5JCHhxzPeHp3Ag@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CANNYZj8GJgtbDHan0jpNXswe=A4iRq854c5N5JCHhxzPeHp3Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceae7bcb-44c4-4cf4-f27c-08da888d7fb4
X-MS-TrafficTypeDiagnostic: CO1PR11MB4962:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+gMHIiGXojLTge93WyBk8XKi+Y3HzpcA4FmYX4Gv+D/7+LcSzAfezdYE1mU6Tn4lijtumrXBXsCg1NupYnbKiUmaBDMP6dIIkRn15Ao/u3LhJyH57NVVrWRWB6m6+BAlztj2Rey6ABHsyNl1GKXiGrhNbdDCWddMXXG8Z5ZW8HoKiCBzGu05tC6I2I2Bfbty17J3AjSYWiV8rwAxM+lum6fM9c6X2I8V3O2cwe6TirFA3wWJJNnTqEK4jf4AIKy0W7OKO9OXHRISPA7uEaSBfl8tO8xHZXgsGMdQp8NRyHtV2T/dLTm8l+pp8UwBsm9IecbmtsFbyXLrqjP3byn94camryIO0ozMEoVMGrlB19ogYzQaIrVZZSsPgP/uRSonohTCUVudo882y8kWopKLGBDSwJ6VL8jaCadMyFYwYTiyYU73zXEiOAN9N981GRvOkHusxgHK634dWw5gJVwAEAi+uxC/z9TuXAO2zB+uzdm9WAQn01StdLynH53D2/pzDt34EC1BNO7RAYbj9RIc9zKcFdn3qAkepN057kBIZNE+s2viR/7y26/Sy2DhgkxudGe6dia02W0fl5EXVIP6SvjplthPM8bD/nP7WPfiXCWrwmEf4bowlgyEo+hUlB0OxP4XiVPPmIfIO+H55Qjl/JCF3lJGfxdZ8F410uP3t1rjS7QE6yHJH8zBIXjOSWiKgPZ9tOswB/V9gd//iRg/SVVMxAr9MnItfhCYc/O5bK0M2jVupcUf1AoK6l6LCqbaZiqhwBrQFQeeoMAgppR46fiJ43wIB0v4ZSjyHUJN2x1bw60K9suSvvB4qqD5jFvNxqew0/4zZ/kWij9OUg00ml0a073c14H46ke+ba5BcYBBA1jq52d6njO3TLJwhzjPR4cAeFJls1j8gimErslFvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39840400004)(366004)(346002)(8936002)(4326008)(8676002)(66946007)(66556008)(66476007)(5660300002)(2906002)(36756003)(86362001)(31696002)(83380400001)(38100700002)(38350700002)(966005)(6486002)(478600001)(110136005)(316002)(2616005)(186003)(6512007)(26005)(6666004)(41300700001)(6506007)(52116002)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTAvalVhQW9Bb3NZNjJjS0hTNHBURnMvajhhcWtOSmFPM1BycmkvWThkdDlw?=
 =?utf-8?B?bFpuQS9QSWdzb1d4U1ptZlR6aE5pMnlVaDlqK2J6U1JCemsxQWJlQ1ovM1Y0?=
 =?utf-8?B?YTN0cDEraStVMnRJUEErOWZTV3N0ODJSd0ptSy84RXdxbTRWaktnOWVCM0Ro?=
 =?utf-8?B?ZGo4emRsVHhFdFJZTWFEVDNqUnpaZkkvS1V4RDJvM3ZtZ2luaGszcWpybEZT?=
 =?utf-8?B?d1R4eTRJdlNVKy9TVkFWS3ljOFBHemFwTTZjMWExY3FvcmZmeGorYzU0U3Qx?=
 =?utf-8?B?T21LeW5iY2RwbEhxMkhHc0xyQURKWXpNTEhzbWFUMk5mUTFxSlk4NlBMeC91?=
 =?utf-8?B?eDVXRXJLcSsyMUZuVmVudzdRME5yNFNmVURWRmtxT01lUVphelU4Z3k0YlNT?=
 =?utf-8?B?TW1KL0Z0TzJUTUZudGhEWk1DVC9TOHNOUUFhSXllbG1URXZLZkxBT1E2Rk5x?=
 =?utf-8?B?S3E0R1hSQ3l3d1huaDNGWlhmMzFDU2EzYU9WbWZZTFZHTWlJR3Q2MlBuTjQ3?=
 =?utf-8?B?RTM5aXRLeXUwa0JsMTJWdCs0K2x4SEoxdGJ0WkxHWjJnYkZZSDJQMjRFc3do?=
 =?utf-8?B?b1I5aC8vWGRoM1lWVEF3V1l5M2lMTEh2TWxrRWRFd05MaG9lcXRpVFZ0WjFH?=
 =?utf-8?B?VnFQc2hNdk9kdTVRTHRXNFBQckk2bzY4Y04wUTRCckpzc1VUNFJiaE1TZ2xJ?=
 =?utf-8?B?STRydmIzS0R2NVhtUG9uNWdVdUdtcE5UL0t3UUVEZmNUeTU1dDVQdGIzL2E0?=
 =?utf-8?B?TDhIOS92a011Y3JxbGJLd3JLMW9RUzRNY0NoOHpqV2w0c0dMdDVrVnRwbUtC?=
 =?utf-8?B?d3VaV0Z0U0YrcWJWNm9XM1NoT1U3WENRNUlMeXlBTUp4WHlENmFRWFdDRlFH?=
 =?utf-8?B?SW94aW50MFVoKzVSVldlZEtlOXEzUzk2OG1CbjBRTWdGVWsrdGwrbHRhY1Yz?=
 =?utf-8?B?WUlEc2J3bkxoMHhjbUZGY0JybVdZaVAvdTFaWm80S2NlY1FBL2ZXdEhHeGs5?=
 =?utf-8?B?SWJnTlpuREpKTEpsUFg0ZUt2cFgwdlNOczVTNnJsME52d1d2T1lsRmhhRW9L?=
 =?utf-8?B?Qlp5TnFnZXBsVHdCWCtaTUJXS20xU0VTWmU2R0VxN0RtUURHaCtXanV3Qm9Q?=
 =?utf-8?B?OExNL1dsUWRzWHdRUEkvWE9Zc1Zud3RoQkI2Y2pUQXFReHZleFZTMlNyYURz?=
 =?utf-8?B?T0xxRkxUYS9oNUlZN05PdW53QXl3eTNTa1pDbG1adURydFdvNjdWTWdrSi9Z?=
 =?utf-8?B?bUVhUTF0cVYwOHUvNGVZRUNYeTlZbFIrNmRIR2xFNXlydFBZQXY5eFdueVVO?=
 =?utf-8?B?SXNmdHVFSzRzaERhbi9zRUtTQ0huWDNxUHZSTjM4RUpUbGtxOGhweGd0M0lH?=
 =?utf-8?B?R1NPMEdLT3p6WTB4b0VRNFBVMEl6YlhyOUdlY212bkxjOVBXM05uSkduNkpS?=
 =?utf-8?B?Z3NRd01CeHExT0o1eVVETHhzZjZCc0o0dTNYOXFWRzdXUG9XNGNGOFhDNXFn?=
 =?utf-8?B?V3YzNDZlWExwL0RjUHhaeVB1S2IzdzZWQ2RqZUFBTDBrY2YxWDl3RzVyc2Z5?=
 =?utf-8?B?ZkVmbkZoamZ4U1FYdjVQeTVpZjhPV1oyc1JNa3JodUNiM3BxdHlHMm4vMjZj?=
 =?utf-8?B?cmFLcmZkOE9PM0dueFVmc0JKS1lwOVRQdGVrM3lVSTRUSG0xa1ZVZFFCRFNy?=
 =?utf-8?B?cm9aT2tTcUVkWVBLM293WmVDL2pNS0pCdExtNEtvZ0lONkFQZGg5TDM4a3hU?=
 =?utf-8?B?MmJCUFVEYS9tOFhlWmpKWVFXelZ3QkdiMUhmYTV5RGE4UEExOU1pMnRBMkw3?=
 =?utf-8?B?RWl6UGhsdDB3RTZDZTYzRkVrUldWOHpMaStBV1RTSVIyS0FEeFJpamVyUEdk?=
 =?utf-8?B?ZElxMllLTUQyUkorNHdIb1VYS0NyVjhBZWUrWnRINDlNZUkrbTVwc1o4czFa?=
 =?utf-8?B?ejRsZGlCSi92MlFUYTQwL2ptaTVjVEZYZzhhTkorczdESDJ2NWlaZ3ljOEUr?=
 =?utf-8?B?WU0rbGZxZmdxT3hZVThxZnAzaHRpS3RJODdIK1FXakF5aHR3WFFDRlFSY3BG?=
 =?utf-8?B?WVA3eEN1WkoyU2RWR1BUdit6RmJJNGdSUWNLMFZ2M3grUC9OVUdvY0orSTU1?=
 =?utf-8?B?Tk1aYTZqZHg1V1pBRzBCcHEzNXNKdFJHcXJBWXNXcDJYWFJkSmVIVkNJUFFq?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ceae7bcb-44c4-4cf4-f27c-08da888d7fb4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2022 00:37:34.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZMQE+D99Dk6zBaI5lGt5jqAGpd4JCRnsHyLoJ2w1dnS4q4Eyk6FhrVGhjiXI/Qh8xh7bmiK3hAXU9sY3kYALIYlhMtBDgHW7nxFqjM/ck0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4962
X-Proofpoint-GUID: jAEsybfjdrzEFyRKn4qvQ4rxn9Pp_ZlW
X-Proofpoint-ORIG-GUID: 4HFeK0pCCg7Zil15vKpSdk6hzX-UQiQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-27_10,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxlogscore=848
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208280000
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27S0YEWG001585
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 00:37:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169975

On 2022-08-27 15:20, Alexander Kanavin wrote:
> On Sat, 27 Aug 2022 at 21:15, Edwin T=C3=B6r=C3=B6k <edwin@etorok.net> =
wrote:
>> If XZ always uses 50% of available memory then adding more RAM won't
>> help though. The only safe value would be BB_NUMBER_OF_THREADS=3D1.
> But does it? I wonder if reducing XZ_THREADS will actually reduce the
> RAM consumption as well. If the problem was common, it would be
> reported a lot more, and yet it's not. So I'd suggest you run
> experiments with XZ_THREADS first.
>
> Alex

Edwin, Alex,

We have a shiny new hammer called PSI=C2=A0 or /proc/pressure (1) and I t=
hink=20
that everyone should use it! ;-)

We should both try your build to see if it helps at this early stage but=20
3x builds on a 64 GB machine does seem to be too much.

If not, maybe we could make a decision about the % of memory /=20
XZ_THREADS more dynamically based on
available memory or even by making xz be more aware of limited available=20
RAM somehow.

../Randy


1) https://lore.kernel.org/bitbake-devel/?q=3D%2Fproc%2Fpressure


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169970): https://lists.openembedded.org/g/openembed=
ded-core/message/169970
> Mute This Topic: https://lists.openembedded.org/mt/93294351/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


