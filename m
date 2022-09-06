Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF7CECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 12:22:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3225.1662466915265535756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 05:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=XSxDxWnq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6248cdbc61=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 286BEwGj019453
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Sep 2022 12:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VqTkZCS6LKX+w4okoymR0nGn+F2/WDcMosnjR2RWiBc=;
 b=XSxDxWnqyzdD1onM1hz8kTGQDsQu2ObgBHXCXfEUlBmec+IEqnFbTxAedGOmy0W6EdF7
 O40H/tzkmtBc1NkmarYpkS+mp9bY7wfyEsEw3NZ4H6NALG4gkVoyPG94bdYqWde54RTS
 8T7/hLfyS4zNfaLj9+Y8uJ3TML8E2GpcILzMcUde34XQnfuqrHaBGaatfw60meobS4tX
 h2Q/Tlsa3Rmq/M2PmEnROnoHAhMnxC+cl/LQxYHTFkutG++C/04cfgrUi29wodInqhCM
 vRBvR56/UMioPFE8/lEErIB2nzGdgJMXoTDvD1hf4Pn0z/XaCmPFBn7f/5M/iXSIjSX6 dg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jbww7agt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 12:21:54 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 286CLrjK003779
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Sep 2022 12:21:53 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jbww7agsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 12:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isz3rlHF2M8gZxYrx2JBTkJdN3GvrTpOD2+1Hyp9qRurEaJwcp/zbnADPuvipLtidNawTHROJjuwgv0Gxv5bH7ln6v+pbqKnLNQgGVAnzxpM90xYchtlJ1so0pH69uBrRACrqDQEM7bHJtY39vaknrAtRH7mje0w98s9IjegDrJZapnFFbBOLi1VK8AVc/xfHs+Iy2mCn+eE7faXkdcJsZ/5VSXJkZ+mGkIJxCfiO97i93eZwHQlzWoR3RYa5UXqkszxU8KrFayXwgdJLNGapqpfbBxshB4YmyFXHshz3z3dITaV51Z/TN2ktqtq5Anxq6r6M1aoetrD6mmPEVdRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqTkZCS6LKX+w4okoymR0nGn+F2/WDcMosnjR2RWiBc=;
 b=RjD45B1m0/7a0ISWUxgf9W0qiSZ4V7/gBeF8nJUI98gQHcwjLEaPzETLMxfj+BTE2N8B1mR+T7ubv7pX9pOZQPVAeffrgR0roNdkRdG/1yCSbWVDjGCSePiqIPXrfQ1rQBXSqs51MvWXZX1OcTkj22bIpbgk9n5xYe1zosCniTAT4mi2rgz+m2yQ4xzFG8AJuCX0Lx8jzfAlgIURbvM2kIpltWbWbK51ZTQ1hHeWHyGtv49Jy5PTIGqNgfISw0+343wZw1j8ti6N/r28Z9YQZt0ytrpbB1Y1S2h67DxTl4yVPt4ZbEs70Kll5XaoB2chQm1Gis2g660CDT0Ndi37lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN2PR11MB3694.namprd11.prod.outlook.com (2603:10b6:208:f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 12:21:28 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 12:21:28 +0000
Message-ID: <940b7e4b-02a2-0892-5d98-967328676180@windriver.com>
Date: Tue, 6 Sep 2022 08:21:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: Fix for the linker issues
 caused by using the shell
Content-Language: en-CA
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
        openembedded-core@lists.openembedded.org
References: 
 <a4f110ea41a9653e8fe894fabc7bf5a180bca30f.camel@linuxfoundation.org>
 <8827.1662361955840912678@lists.openembedded.org>
 <c8062dc0c019bd8d09ef417d26cd7e83630baae4.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <c8062dc0c019bd8d09ef417d26cd7e83630baae4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::26) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c5cfea1-bfe7-469f-09f3-08da900252a5
X-MS-TrafficTypeDiagnostic: MN2PR11MB3694:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qPE9QjdDDuEff6p89jygPV1TAdBJzNtqsGdGHyefuQ3Ry2MRkpEsHG4+IL4g1ONQ0NZhHoU0ZmxbmNNKg6Awnd1UBIDnQo8QW7nTe9lCIRWNBxunvrCetINEVdoGAjvMDcj4+6L5FqLu/P6Zu7MCcnZGcwhmHDggoy1dUsN4zcunt58/CC2Y+Cpe0RFnXjOphkbuU/zY4jsviz/M1rW86PMTvET8w+UdJ4YeWZ1Ohr2JqmezwF28QLCTDJNJHYK8M8DDvdB6+BzZktHw2TKa9VJAPax2UYy+EzJE9xZaKBOisaX79qqaKI0c4i92qVsiStha6VMFAI8qSnaDY2yG+h3b/TiKbn9cefTV+TZg0+t5Ckn7YIscxQDJndeotMianBlzTpAK0brRhOuml5nGrsbicEXBliVDWDmmS/8YagDctOvMBw8kxKneJAXM2XUDDr4svBj2y+IefjCdBq2zKIUD63MrH8FnyerCiCH0J3KkMLX2nupc+Y/2Iy+YZJnktxkccHlR2GBEakNo6Bb+2cZ5qwswGfaGsvn4MEaX/NSwlFGyhXzc3Oiv4A0p2Z6O3fzshpsmsSHEH4cytts4Ztat3g28207S69Pighw12B/gPRNeQsC3UU7+jeSDxDuIoK5GgVSwCbXdVGHg5mdlzHUQIHeO8rSGJSBLQRsg7cIfh+h3E4e89tMplBz/c9B1B1ZB6siciGb78mmOkJB2kjQqr7mO5AFr2eo2OR1YqO3hvHZFL2GG0g6cx7YS7qGzh5YwH1GZ7uYF0rgqXiZ2AWi1/rnr39Y3w3LLl+edqvUJmK6mH2tvMfb8ahloCt5OOdSq3RORahLqYJn61BzU/+9KlElAfMw1vUodWMoY97I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38350700002)(38100700002)(2906002)(66556008)(66946007)(66476007)(8676002)(110136005)(966005)(5660300002)(53546011)(26005)(6486002)(6506007)(186003)(2616005)(52116002)(508600001)(8936002)(6512007)(36756003)(6666004)(31686004)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGtrTUYxbURUekFaWmZlVzltcWlMQUtTazhUWDFwR1NKY2NMbjZNTDBKcVhl?=
 =?utf-8?B?WkY1OTRBZXBHeEYrTmovUEtUc1AwaVpwb0VESjk3NTdQUTVEc0xYR3dIQTIv?=
 =?utf-8?B?TnNzcDEwUkpLQy82aEQ0eUpzaWxTWHd5elFtcXk3T2UrVllldSt5ZStNMzRZ?=
 =?utf-8?B?MjNwYW01ZWxsR2N5K1AybUxESGYrVExqczV3RHBmVVZaOTFJN1JYREUzRkJ3?=
 =?utf-8?B?T3UyQTMxdzJLbkN5WEdGak43UUh6STNwQ0tZZjhwUHgxVUtnM003OHpLc3A1?=
 =?utf-8?B?dEV5OW9XUG5FUzVkK0h2dTFpQ2RSNWJaVkhUd3MvN0tBNzI3dVhjamVJZHFH?=
 =?utf-8?B?bzJmbkVVUGo2aTVIRFlPTVdaclpLWXVvY2o0cUE2cWRxWWxQUkhxbllPRkxw?=
 =?utf-8?B?UXhpZEwwY3RBaWM3RzBhaktwRzlob1JQZ28xWjgxUmlDWkFJcm1Ja3Y3U3dx?=
 =?utf-8?B?dy9pcy9ZYWR4OS8zL1NWMk5xWmhYK2FCVWh6QnRtbCtianlJL1RHYktOODRt?=
 =?utf-8?B?NDF2V1kxRTZqM0JOV0FDcmZHT21oM0I4Z1dXUURFdjVja2huejlHdThWbGxQ?=
 =?utf-8?B?QlU0VExqZHducVM0c2R5ditLTXBDNzUzbDFiUVZnYUdSUURnZVVtNHRGc1NO?=
 =?utf-8?B?OWV4RFRHTHp4K1hLNnBQYjhteUVuelhLeEVuY1FPZHJ6OEoxbjF5TDFGdnFy?=
 =?utf-8?B?K1dUUVA1a2JPNUtVNHRMbW9ybDdyYm1FcGFKQ3AyaytacUR1ekRWdmRtc05F?=
 =?utf-8?B?dlhoeE9YREJNK3NiN1JXazlMK3dMaTAwR2lHd0ZzaEd3bm9SVE5WRFllbFVl?=
 =?utf-8?B?VUVLTVRicWlWdTNSeDBQcGJJS01IdlQwcTdNN09oY1lkSllEcmR1c3FZWmo4?=
 =?utf-8?B?WGlwak44Z3lqelQxTGozNURoVjB0Y0JURWZheUpyZnJaczE2MHlyQjNmUjhv?=
 =?utf-8?B?KzBwREwwN0tOVVErY0RpV1JJMlBVTjlCcVgvcmNHbmE0Z1BFQm1Tb1l3a2R5?=
 =?utf-8?B?My9RTFRGaXJGeFlJZHJneHI1am94SDZUTWlzbzVkc0lNR1B3L1N2OUw3a2d3?=
 =?utf-8?B?eUFiWDZJZFNkK2dTVml0Nm1waVU0M1dFYlRtYmhmK1k4cmtJeVRDWmN3RUJi?=
 =?utf-8?B?TFpSNHRPTU5ST09hSVNGS0JNcDdtNU9NV0xWOHNjbGUxNUJiYTJ2SHlNOXNn?=
 =?utf-8?B?N21zdUhQTlhxRlEyV3hCcWRUWDlUd0hnc205Y202V3djOXFNVXpzOTdEeFdF?=
 =?utf-8?B?TVVxNElPcGtvUWdXMXEveW1NendKdyt4TDBPRG1iNDFoNVVtNExxcHk3NDlr?=
 =?utf-8?B?cjA1aGYzTDZ1bDlzTDVyUWxoWjdXVFgvK2hSOEFsblYyalVIa2tORjRnYURq?=
 =?utf-8?B?TWkwREswT29BWEZ6UDV2T0JYNTR1NHpPd0J1Rm1KUS9lMEU1WHYzVDZPZzQ4?=
 =?utf-8?B?SC9PR1hVTFBTTkdIZ3FDZ2xPNHZyVFdFU2J0VnZNZjdQMDFJSk5naDdjWnhF?=
 =?utf-8?B?ZnJGV2VMZzBRMVpBTUxPcWI3VUROWmJNQmxINXhUdWVHek5vdFhUOC8rejFt?=
 =?utf-8?B?b05hUC8vSmFVR2ZhWUNlQkpST3EwUHM0bjRodE9SbkRZZDNYQmhxR3Z3Znow?=
 =?utf-8?B?U0t1ZXhQb2J2UmEvdXJRYjlqblRDTjNZQzlKK0dRSTVyRXBES1RNZk4rbmtz?=
 =?utf-8?B?b0xrRWllVk04WjEzaDdPelpYMkNDNzdkOENXRmhKZEEvL1QxV2dTdUxwL1pq?=
 =?utf-8?B?UHFPRVFFbUhwMFl1ZU4yN1hJWjB6QjZNdlRWRGhUOERkVUh2MnU0aThHblll?=
 =?utf-8?B?WkFvTGM2MjVlK0ZjUjVXZStScGFFTkN6dXArVUhrSzZYS2s4NTk1MHBFWkIz?=
 =?utf-8?B?aWVwSTRCZE5mZmU1SkNhYUJ2dEZGMEtyclpNeksxVE5xYXdiU3BaK2lMTUhM?=
 =?utf-8?B?eHg1c0paR3lvNGR3R0VsV0RyUWpHZVlkQ1gwU1d2bDB0M2hBdEQxbUtIaWts?=
 =?utf-8?B?VldabGJ3aVRUeURZUit3dDlmcmE0N2tSU29Banc3bDJzOUx3L2FXZkI5SVZ4?=
 =?utf-8?B?RExLR2tpUTZyV2JhM3BYWWZQcVUzRWJRcllqZTBuREdNK1B6bEZpZlpVUk1D?=
 =?utf-8?B?NzY2TmNNRGV5Nm0xMTJLTGFjRFU1T3VlMkQ2NTNacHJTZGs4dzFmRzRWZkVF?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c5cfea1-bfe7-469f-09f3-08da900252a5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 12:21:28.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MOZsC2sYD1hT2zOaYv0hRXlPO89Fsc5n4CdkEd6dxnzdLqiHBKqCaVCwtTy8yZpKKS0WKY8m8e/w43QIt1cLPABGTWDtkwrf9fVVAxUGN+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3694
X-Proofpoint-GUID: 4fDbdLUEip_PR8sKRCCVyz81X4a3St7f
X-Proofpoint-ORIG-GUID: XKS3HgH4QnHekOz2vzAf9rqvhbJZ3B_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_06,2022-09-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209060059
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 286BEwGj019453
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 12:22:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170349

On 2022-09-05 07:53, Richard Purdie wrote:
> On Mon, 2022-09-05 at 00:12 -0700, Sundeep KOKKONDA wrote:
>> Using CC args causing linker error "unknown executable format" so I
>> called linker directly.
>> Also, I wrote my initial code without any hardcoded symbols and that
>> test code works in my local machine but when the same code executed
>> in Yocto build environment SIGSEGV faults are reported. And to debug
>> the issue in Yocto build environment the printf/echo outputs are not
>> shown in console/log file. So, I modified my code to check whether
>> this solution works in AB machine or not.
>>
>> Can you let me know what is the error in AB machine
>> with=C2=A0unsetenv("LD_LIBRARY_PATH"); ? Is it the same relocation err=
or?
> The issues would be due to the issues I mentioned in reply to your
> patch on the mailing list. The fixed length string and number of
> arguments issues.
>
> In the interests of moving forward, I put the binary shim in front of
> the shell script which can make the environment manipulations more
> easily.
>
> https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D7a1bfb2f=
800c00d3d2bea9e20e5d31d32f247129
>
> The version of the code above seems to work, I ran some tests
> specifically on ubuntu1804.
>
> I added in some comments so we know in future why the code is doing
> this.
>
> I wondered if we could make that script MIT license rather than GPL-2.0
> just to try and keep our licensing fractionally simpler?
Yes, that should be fine. The rust code is dual-licensed

under Apache 2.0 and MIT=C2=A0 terms so we shouldn't be using GPL here.

Sundeep,
Please resend using an MIT license and Richard's changes linked above.

../Randy


>
> Cheers,
>
> Richard
>
>
>
>
>
>

--=20
# Randy MacLeod
# Wind River Linux


