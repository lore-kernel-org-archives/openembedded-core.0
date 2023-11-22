Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FA5C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 14:18:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20396.1700662731454330881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 06:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=FQHGv1YY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9690581b78=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AMBgocD028376
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=GpQIu9gZiyo7sTx7TgiQB9dpmQe2af/Y6fQogBmhu5k=; b=
	FQHGv1YYdQtrN641hhhRYzaq5VeotSt/GaCX+3D/xM5cN9Nhqhao2kulU3fk9Jxl
	Az/atEc/8jOi/tgS+4itj72k7TD2iVi2EKU6uw8nRakGtB3xSQp08WwuNUmxJbps
	pJ0tpAcRXOfjPOJqlKeDZfRlKQVNH5NZSKPOLMWhB6ELNnQkE/vs65rTDM6GJQJm
	8hHlqfMsBkvvEXRFXwk6svITZNaAqq/bY7mO5CA3LksL26Cc6KPnW3p5dRS2pO50
	TvDSzslC8kvs24bH6PNN96GcT9S+hRIYDZgIa3u2iHeAW88u05MeQmk33bN6gIWJ
	Dr2F3Lu8YFTTPqBVUFogGg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uejfwujrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:18:50 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AMEIoBt030678;
	Wed, 22 Nov 2023 14:18:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uejfwujrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 14:18:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XY2qlmsNEHD5361hPaPKjZcT5zeJjP+uNmtncGbSIe1U4Ob+UamBv2/MlwiNoH30ZMTfpfXssthFF2ovfgC5PqLm3F0Za+qJxppePDRKe7HTLw4lv8ghIZenZGxHozwVteE2hvxOGnGxG/wX21508L0MS8/QNvJRRQqrD+m63FpzrPOnzhz/DaPGElpshwEp1358FwTD7bhhqufofiWHam//L0XjVDatClF/q+sK9XldVDxVUo4gWgQM3vcR4XD3HtvzjIj9BKCpt4xcIWxQkqql0SCIkGJHJZU2rV3cP/R/uN3gw/m2MSRN9fDCu/bh2FaaxAx27mYm+55SsWOKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpQIu9gZiyo7sTx7TgiQB9dpmQe2af/Y6fQogBmhu5k=;
 b=iJyTw8NKsgZ6NKp+uQgDb24DJWzeIqrISsV1y6merIEOU8I7nRf6AA+DrVF9gwqEYUn38aAhfQQ/LQb7wt7wZYK0XBKHSr/AXiJvOY1x7Ol1fMpfgu8QM5inlrRBWy1wn9Nl8wB/ozsQeneFaObppHj3N7hUqol9IFoXJj7cqLRBB4iYFHdQ9rBX6Z0wIYn6Vl2CWyEyONSUTTEOpEjhgyObkif/PG2w9Rek7Z1OLVNmmIPMpVTXoLqc9l7In9uzTHe2WZhjIbcEpLjui1aVlpFa31TP+0AGkQQve2Y9WFjzJHfSegUpy1Jm55rEc/XKorRumm/n23sMmz8HzI0Pcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 14:18:44 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 14:18:44 +0000
Message-ID: <26429db3-06a7-459c-b17a-bea4af0cda3c@windriver.com>
Date: Wed, 22 Nov 2023 19:48:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC 1/5] valgrind: make ptest depend on all components
Content-Language: en-US
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        randy.macleod@windriver.com,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <1795D005C571B567.15940@lists.openembedded.org>
 <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com>
 <CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com>
 <685c9a01-2160-4f1d-afd0-cec3593b1be6@windriver.com>
 <179867874B67F596.6542@lists.openembedded.org>
 <CAO5Uq5Tn=M_P5ZqPobN8nsu1KtgvHgZhPhQWpvUSR-6UmFdzeg@mail.gmail.com>
 <2d435d97-a7c0-40b4-88ea-6e8b9f245dab@windriver.com>
 <CAO5Uq5Qq1V0pWT4F915QSG6rkjMwJU7BukBAXPVAO6=07YpOSA@mail.gmail.com>
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAO5Uq5Qq1V0pWT4F915QSG6rkjMwJU7BukBAXPVAO6=07YpOSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6401c4-3337-4ca6-cb1c-08dbeb65eefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q0N4obgJHB1P+Y+kPq2T0SlUF6XqebjgI5m84RhB1JMXgVY+3aug2sZEnUCS6YjenTnLesoyQzSDBkaztJtjc2v5XW8SVQExi5d6pQxm07GPI0PlVlVC+tspKInaD8Wqi2HwlLVljI8Pu0FGGL7efODEOcxKUzqWoPE7pEja9g1rY52DF+C+y7JGB5UKlw1vR+PqDJQDSeWdNC/1wHU4EHWQ6swds4BClN7y5NkwjPbyBRkZ/Z5O72qkoGgMT8T1FM3Z+zUQBhWyyneBqWwjpYQJNM54WsPFhE7Hesjrxp01NdMMha1Z3C6aR+qQXBR9GUoXbNT1DOQrbutTBs18uUdH+joY5oQs+52sF5skrISl1ozsNFUNU2/OvltWEpNXwST/2jbJCXsvV4gFna7HSsHZhJIpyP4NfCYA7uqJXrpW+WiJSBD96DKgn5JcvrU5jo3ddMb9pf1gwxieq18/C7szTTrvzwRuMe1KJz3Vhw4xwzih9qD6hS4keSKF0MnGRhC7mWDLC2AC14+MAo2Og/rssKXojiBf3tLX6gIUns001MOuyVjMNsW901vw8Zc8i1sb5QR0iNivFYPwrBFNiv7MZNMIgSFdnyDUWH3P80KFfcUK1sAP+KFafitfDyD5f0/ENpyeKuq9wf2n72A2mL0172diLUq3Kg/DBNcY3vxafxEWe3gdgcyAOVCJLaHB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(346002)(396003)(366004)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(2616005)(31686004)(86362001)(6666004)(316002)(54906003)(6486002)(6916009)(66946007)(66476007)(66556008)(36756003)(31696002)(107886003)(83380400001)(26005)(53546011)(2906002)(41300700001)(5660300002)(6506007)(8936002)(478600001)(6512007)(38100700002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2NSMk1EZk5vWFlySHNUeFdBeHRkZ1BJcW5iNTcvamlEbEQ4bTluVlFqSFJK?=
 =?utf-8?B?eWZVRCtXTWFhdFc2NGFoWHdEeE1HaFI3WmZnRGt3bloydWhkZUNGRUxPMndM?=
 =?utf-8?B?bFZKYWtZbkYrdnR1ejgweU5rTDZjVFV5S2pONTdDcjA0WEc3SXAwWWlnTWdM?=
 =?utf-8?B?UFo1RHM2dUF1S21DS2YxQlhRanFZQlF1WU5BbzYya3F4eWFQTW11QVdTRzNS?=
 =?utf-8?B?WE1COHpVU1p4MGV0RXVJS3hZdVpqSE9xc0wrT2hnUkhyQlJBNWwxTC9HZmxt?=
 =?utf-8?B?c0w0T2dRRzcvbUJLMnozQk45Q0ovQ1lxdjRFaThNald5Yko1K2JIM0dTMTRF?=
 =?utf-8?B?SVpYeE50NXpCUU1YN016M2Q4UFZvNVc3QTFSMFZpbEUxK0tHa29pWTdxaGFs?=
 =?utf-8?B?aGNUYy95N1ZxQlhNYm51TUYxR1YrbFlpR1FmR2dlWmNRVHQrSldIZVdIS1Jl?=
 =?utf-8?B?WHIrL2dySUVsbWRPdUo5NkNHdENZMWV5bDFNL2xEdHFWMGpvdCs1TkF2cmE2?=
 =?utf-8?B?MHRLYWROais2TGNGVitVVVI1aDAyZW1pTTBwRUxPYjlNSmpLSFV0OUk1VU95?=
 =?utf-8?B?QXZCMnduaG1TMVlkK2FlMllSb2lWOEZ5Y1hiZFEvUWFQQ1NDK1gyVXdtd0s5?=
 =?utf-8?B?eW1KN3U1YmtmRUZ1OS8yKzcyM2VjSnZnQml2SGttVFViUjkwSEpWdEpYQ2E4?=
 =?utf-8?B?cFhxeUZaT2swWXh6dEtNVHR5TVRlallmeE1hWXdmcDE3aSt2WlVIVnUrS2lN?=
 =?utf-8?B?WnR3RUV1UUdORnBSdG1sSmcyYkllS25RRmFEM1hOYVZiUXovcUxiR1JldjN6?=
 =?utf-8?B?akE1MUh2YnJiRHNYUHZjRTRaLzEwZ1lMb0xNM3V0WXFUOFBjK1JwNCt1QXcv?=
 =?utf-8?B?NVBJUHovTGN0Smc5M3IvUmk0U2FoYkhYcm5MUzJha3Era25oTXdGaG4rN2x4?=
 =?utf-8?B?SVZGT2U0VW5NdDY0dUN3VGwwQmphSVgyMmcvVXplelZ0ZVgxZldhanovRzM5?=
 =?utf-8?B?b2gzSm43QkF2MUlNTmpiUWVDaFhOTFM0Mk16c0k0TjduTk1LSko1YS9ySlNv?=
 =?utf-8?B?SHVYTDFDVlp3L1hKM1RWZ096SCs2enNycjUyZzVDUk85bzVxMlhWR2R5VlZ5?=
 =?utf-8?B?dUJXR3VEZG5td0JqeUdacmcyS284SHVyZVBNRHByK0I4VGFTNmJFYytIZ2hN?=
 =?utf-8?B?YU9Wek9EZE56UXRFTUhKUG9QU1NsMEZXakxVWTBORGRGNEJpblVQLzEwaVF5?=
 =?utf-8?B?cFptRHVZZGlaM092S1BOdktqRkRGZDZnRS8vb0dRdUJDNWVnSHR5TmlQMkRQ?=
 =?utf-8?B?d1RJZTlGb0lJRGlUMTJ4enU3bVRBa0FGQWNlOFRrWVpmZHFEODBDTis4cmw0?=
 =?utf-8?B?aXdMempwZXB5bHRST2JVcGdDQTZJVUlaTk42RXNUUklUZkJBWFBkdk10dVlO?=
 =?utf-8?B?UzlaMkdoYmlCZlVJMUpnczBJSTFQSjdzQXlMT3BrVDdGNU9pbVE0UCsydzhQ?=
 =?utf-8?B?WTQvTGxvdWZlYUI3dS9zY0Y2dENxZGl3R2RGMThJLzUvZ1pXUWZjVVBmQVhO?=
 =?utf-8?B?b1FPMHNPUTNrcTcwaDJWazlpL0xLRWR1OGRGdHJmZ2Rlb2Z5WEFRYkVmL3Fk?=
 =?utf-8?B?aWlUOUhpbXZXdUd5Uk1RTG5DVnJmNGtrak1KM3RkMjV5eUxHRWpiUFl4d1ZX?=
 =?utf-8?B?WlBEbEpsSXZ0RUhEZ2liN3p4K1F0Zm5wNE5ORWEwcXBXeW95cE1nM1VsVFZm?=
 =?utf-8?B?NG4rZWY5eFhoSmdZN3N6Nk0zWDNPQVF0RUo4YjhpWlFzdi9sN2hCNkF3Tk9Y?=
 =?utf-8?B?RE0yZ0VwRkNUQTQ1dVcrMkNOYzhRVEZSZUxTS2RRZzJnUDluUEZ0U0s5V252?=
 =?utf-8?B?YWtqVGtZSUoxZnVnUE1RRHFzYXY2WXE5M2dwN2NFYVNCK1VXVjNLdFdnSWFo?=
 =?utf-8?B?OW9KTjJnSmN5Y2NhZUNjMTdSSFN6MTRvMVdLQ1dqTzdvOFBWOE9aOGlPOFFK?=
 =?utf-8?B?VWtiVTI1bGIyVEUxRTZsaHZhTHl3WndGc3MvbU5wUDg0UHQwTG54TkxOQnEz?=
 =?utf-8?B?N3BkZzB0ODRJazlaTG1vazdoVTduTmkySldUUjZURW8yd2Z0S0hvR0F0Q1pj?=
 =?utf-8?B?ODAwbHNlbStxWENLSkdaeTlRTnRUTTJhRjBhdDdwQXJDc1RDMXZHY05oYWIv?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6401c4-3337-4ca6-cb1c-08dbeb65eefe
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 14:18:43.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OizME3tor07jvpzjRi3reqkWOXmGI4o+Zel/9AvmbCjWwQm6Ydl20vhpxOhf2QNbMcUal9v6FqCth5w7OV3OT2xG15H6CjyxqEivELAD3jE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
X-Proofpoint-GUID: xYGM3l2L8o8djr51lgYBEKrD_lHFdb86
X-Proofpoint-ORIG-GUID: 4xDU28csL6CESb4pVMGcL0WoQnLSNkxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311220101
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3AMBgocD028376
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191110


On 21-11-2023 21:27, Alex Kiernan wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Nov 21, 2023 at 11:30=E2=80=AFAM Yash Shinde <Yash.Shinde@windr=
iver.com> wrote:
>>
>> On 20-11-2023 21:57, Alex Kiernan wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> I've finally got this running in a way I can usefully inspect and try
>>> things and it's beginning to feel like we've headed into something
>>> which simply isn't supported.
>>>
>>> The failure is this:
>>>
>>>     thread 'main' panicked at src/tools/compiletest/src/common.rs:519=
:30:
>>>     no entry found for key
>>>
>>> Which is empty because the mapping list is collected by running rustc
>>> with -Z unstable-options --print=3Dall-target-specs-json, but that fa=
ils
>>> because we're not running a nightly compiler:
>>>
>>>     error: the option `Z` is only accepted on the nightly compiler
>>>     help: consider switching to a nightly toolchain: `rustup default =
nightly`
>>>     note: selecting a toolchain with `+toolchain` arguments require a
>>> rustup proxy; see
>>> <https://rust-lang.github.io/rustup/concepts/index.html>
>>>     note: for more information about Rust's stability policy, see
>>> <https://doc.rust-lang.org/book/appendix-07-nightly-rust.html#unstabl=
e-features>
>>>
>>> Basically feels like running the test suite is only supported on the
>>> nightlies...
>> I saw the same error earlier.
>>
>> Investigating further, we understood that the issue is not related to
>> running on nightly channel. The '-Z unstable options' were also presen=
t
>> in earlier rust versions and removing of the newly added -Z options
>> after 1.70 also didn't solve the problem.
>>
> There's a fair number of changes in the test framework around the code
> that calls out to rustc with new paths that use
> --print=3Dall-target-specs-json unconditionally. Assuming I've read it
> right, -Zunstable-options is only evaluated at the point where you
> actually try and use such an option which is covered by
> unstable-options, so just passing it in doesn't get you a failure.
>
>> On doing further analysis, we found that the custom target config/spec=
s
>> were not fetched during the rust build.
>>
>> The log for reference is as follows:
>>
>> Building stage1 library artifacts (x86_64-unknown-linux-gnu ->
>> x86_64-poky-linux-gnu)
>> error: failed to run `rustc` to learn about target-specific informatio=
n
>>
>> Caused by:
>>     process didn't exit successfully: `
>> build-st/tmp/work/core2-64-poky-linux/rust/1.72.0/rustc-1.72.0-src/bui=
ld/bootstrap/debug/rustc
>> - --crate-name ___ --print=3Dfile-names -Csymbol-mangling-version=3Dle=
gacy
>> -Zunstable-options -Zunstable-options '--check-cfg=3Dvalues(bootstrap)=
'
>> '--check-cfg=3Dvalues(stdarch_intel_sde)'
>> '--check-cfg=3Dvalues(no_fp_fmt_parse)'
>> '--check-cfg=3Dvalues(no_global_oom_handling)' '--check-cfg=3Dvalues(n=
o_rc)'
>> '--check-cfg=3Dvalues(no_sync)' '--check-cfg=3Dvalues(freebsd12)'
>> '--check-cfg=3Dvalues(freebsd13)'
>> '--check-cfg=3Dvalues(backtrace_in_libstd)'
>> '--check-cfg=3Dvalues(target_env,"libnx")'
>> '--check-cfg=3Dvalues(target_arch,"asmjs","spirv","nvptx","xtensa")'
>> -Zmacro-backtrace -Clink-args=3D-Wl,-z,origin
>> '-Clink-args=3D-Wl,-rpath,$ORIGIN/../lib' -Csplit-debuginfo=3Doff
>> -Cprefer-dynamic -Zinline-mir -Cembed-bitcode=3Dyes
>> '-Zcrate-attr=3Ddoc(html_root_url=3D"https://doc.rust-lang.org/1.72.0/=
")'
>> --target x86_64-poky-linux-gnu --crate-type bin --crate-type rlib
>> --crate-type dylib --crate-type cdylib --crate-type staticlib
>> --crate-type proc-macro --print=3Dsysroot --print=3Dsplit-debuginfo
>> --print=3Dcrate-name --print=3Dcfg` (exit status: 1)
>>     --- stderr
>>     error: Error loading target specification: Could not find
>> specification for target "x86_64-poky-linux-gnu". Run `rustc --print
>> target-list` for a list of built-in targets
>>
> Out of interest, did you try 1.71.0 to see if that failed? Based on
> reading the commit log for src/tools/compiletest/src/common.rs, I
> suspect it will fail.
>
Yes, that fails in 1.71.0 also. The 1.71 build progresses to check some=20
test suites before failing as follows-

.........Test cases running from different suites like codegen, ui,=20
mir-opt, assembly, incremental....

test [incremental]=20
tests/incremental/issue-79661-missing-def-path-hash.rs ... ok
test [incremental] tests/incremental/remapped_paths_cc/main.rs ... ok
test [incremental] tests/incremental/lto.rs ... ok
test result: ok. 161 passed; 0 failed; 2 ignored; 0 measured; 0 filtered=20
out; finished in 12.51s
finished in 13.102 seconds
Check compiletest suite=3Ddebuginfo mode=3Ddebuginfo=20
(x86_64-unknown-linux-gnu -> x86_64-poky-linux-gnu)
WARNING: debuginfo tests are not available when testing with remote
running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered=20
out; finished in 18.92=C2=B5s

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 finished in 0.147 seconds

Building stage0 library artifacts (x86_64-poky-linux-gnu)
error: process didn't exit successfully:=20
`build-st/tmp/work/core2-64-poky-linux/rust/1.71.0/rustc-1.71.0-src/build=
/bootstrap/debug/rustc=20
-vV` (exit status: 101)
--- stderr
thread 'main' panicked at '
Failed to run:
LD_LIBRARY_PATH=3D"/build-st/tmp/work/core2-64-poky-linux/rust/1.71.0/rus=
tc-1.71.0-src/build/x86_64-poky-linux-gnu/stage0-sysroot/lib"=20
"build-st/tmp/work/core2-64-poky-linux/rust/1.71.0/rustc-1.71.0-src/build=
/x86_64-poky-linux-gnu/stage0-sysroot/bin/rustc"=20
"-vV" "-Wrust_2018_idioms" "-Wunused_lifetimes"=20
"-Wsemicolon_in_expressions_from_macros" "-Dwarnings"=20
"-Clinker=3Dbuild-st/tmp/work/core2-64-poky-linux/rust/1.71.0/wrapper/tar=
get-rust-ccld"=20
"--cfg=3Dbootstrap" "-Zunstable-options" "--check-cfg=3Dvalues(bootstrap)=
"=20
"-Z" "force-unstable-if-unmarked"
-------------: Os { code: 2, kind: NotFound, message: "No such file or=20
directory" }', bin/rustc.rs:230:37
note: run with `RUST_BACKTRACE=3D1` environment variable to display a=20
backtrace

Build completed unsuccessfully in 0:06:09

Regards,
Yash
> --
> Alex Kiernan

