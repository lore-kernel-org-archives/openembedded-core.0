Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5538C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 01:53:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2528.1666662828946887906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 18:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=r+cTO5HN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=729743166f=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29P0vEgj019145
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 01:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=bmwh3GZHiTHtAqqFO6lmBZ9OEOUPXyyEbYhxTXszDeI=;
 b=r+cTO5HNoPi/fCdDJy0PcfhjSFPf2fORRAtAuhiLo3N3Gb0OA2Y22grH6byo2FahLDTM
 dHGJwQQM0w5UTHDCWc1tud+JXYzl05px7AsQHurGZ0E/I33mD6uPOZ7kkoKBjVv5M82N
 2tufW9jJGDuP4aRTv1lCrSi0bkt5WMnTggvxfAYTKi2p0pVh1/eplibX4F6duX1eMULS
 xJ5qMZhAh36c422lCotZULM8NDxZlk25ZmWnmrbhbb6CEHzjVQe+Qmngi+i430VmUhZk
 7quLrLl3PsZ5hVmdDCFqJLcdrcc9oPuaIWQRKE3266fJt/+R2q7zRK53yRNhpTD1tL7v kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc7g9tu57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 01:53:48 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P1rlsY009389
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 01:53:47 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc7g9tu56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 01:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIy3LvSId8hMBvkraaEqAyKkQcHozU1KQfYZ8B5c+rRX1tutCZof5ns+8705iOSuvkCNR8rdHaN7FdW51tx2xz4RZ8aaelb1totFy0/7LKoabnHfRkTNpBHn3Tu5/yg8dX6j7qjOpxT9pIA4jdYaIxM6KV8X9Dtgiw1xobvH4aP1NFcxgHuaOxoa7qgn/iZdnx6VPc+FygtK6vloKcWizzS/hHjzFrmRJ28rOU/yaxXXMiROSquvBvTOMEDTDOBZNiH6WS+Ntee8eCqjGft9NrFZLVw46DIzB4hTSO6xaBI6topVN9eI14eqX3dpeEcJ6arRbCdGAsOIZQby2OvgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmwh3GZHiTHtAqqFO6lmBZ9OEOUPXyyEbYhxTXszDeI=;
 b=H7sT2srz43PC5APB/2RUyqbeZ/9PIbNZK7gQtEYzF63awsxKaofFyyVpc8u1mBoYbRCEnzt2xA3cQk3gZj5fd8rKdA+lbVyDgx+pvS1+LjxseU+18XRa+Muy5uNj/wLE3rTdJ7MSR+eiMtVLXHhqNUucXuUS/wBvXsRhSJdZzVgv99t2yYNC8BXaG0fbpJRHLPIq3uNRl8Ast+ud82uO4E2xnH6IpZLiFlgi1ebuLilbbM9INy7ENsMxVL3hE0cjSkHxaUQGjKWCn75m1v/91bP8gDpzNF/N/wfa6hMFoeQzCVZDwkTTwyw+I4NPXAQRBHYMfH8ubVbm/iCbMKncqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BN9PR11MB5274.namprd11.prod.outlook.com (2603:10b6:408:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 01:53:45 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::cc33:6961:2b8e:3de6]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::cc33:6961:2b8e:3de6%5]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 01:53:45 +0000
Message-ID: <4f20bb3f-555c-3486-1e4d-7bb0f6faefb9@windriver.com>
Date: Tue, 25 Oct 2022 09:53:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] python3-psutil: fix failures for running
 psutil.tests
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221021090112.2373113-1-changqing.li@windriver.com>
 <17200AA16F7D89F2.17514@lists.openembedded.org>
 <CANNYZj85tT57+kjq1WADCJQ8Xf8Y9Y4KdR9q9BHdR8eBOBsxzA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj85tT57+kjq1WADCJQ8Xf8Y9Y4KdR9q9BHdR8eBOBsxzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0201.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::23) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2548:EE_|BN9PR11MB5274:EE_
X-MS-Office365-Filtering-Correlation-Id: a52dcf43-8d44-4ecc-d956-08dab62bbfe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bHLkYdwvVbMzIomu5vBThIjAyuhdVqfsjzuvR60SjOq/4mCC/TU+jwzOXM5wS4XCMaOY6BvK7GoyfV3hHYhC+fuI0JV5N7j7ABgkiZBdg/zybxnoyl0B0Dz8n10MmgNo8jqpH9+Bi0/uo0fNregfDccCSk2ZIpe1vnPJcso87O0CrMAT3BZPvyWs7mm0q8+On1ZvBz41TfCWu8mF8kj3E2de7L8v1GFtcOP60CUv8DR7388tSHmCoTi5hObEjKg/7afLwLpzuLd2dELLQI0Jxzq9CaVhzyYEFNgH4CIRWL0gLwMqdPbBm0gydkc8k5TPBvF8m0sXGVU54DHG6gF36ictysXCAoliRxsm3vUX53P5GbnGsONvwfD3+ufQnauB72PhZ4qZFwDgPW8uYLXZVy+zcfAg9Z9yICDtSX1EOqXX++2ytO0Cnxcrc2zdDRF41rRgMwo441Nty18Nuebru/fR+Y5cxlJ2s9Wmmrda9dAAZ0E5s+dwVToYfPopuScNDIjoAm7Lh+mAGd1MMEF1Sv/qF+1ahpO0cknNFrwG3C0KD578+sNcCxsonuYs6rOZNd+r/Wcff8Gs7YKzOkxkIssL93gM/M0VAP118YltZycjGMWXtr7txHxDqtABAmbHoOQlNvYRr6aMFlIEBZs1luORTHopy0h/XFL9nl2maaSlEKdW5KVk6kaoxLDn8Lc+p4P65TZjHrbcqx7mKG+NT4jHKxTvc9yYwkdWBiUibmcq91IMVAXE0eZYjUHGibmyHem2kixn352fkCE0Au7xs3Vsxsz0Swfn6rRx+KxJaEbStmlqTYEDVSdscHJ1c5adPvmNxpvljKbaqBNqZ2b2X473Qb6ahtAhG8+WW5B9F/2o2RKXMxeh0EPLH3trQYsN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(451199015)(2616005)(2906002)(30864003)(186003)(31686004)(478600001)(966005)(6486002)(5660300002)(41300700001)(36756003)(6506007)(6666004)(38100700002)(8936002)(6916009)(6512007)(26005)(31696002)(83380400001)(86362001)(66899015)(44832011)(66476007)(66556008)(4326008)(8676002)(53546011)(66946007)(316002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1htRmRFMTlEL0ZYRUNNaC9OM2tGNmsyUmxwMHlqY2hHSkdYR0ZET29zSVVz?=
 =?utf-8?B?b0tIMVllM1VSN0FaVmZIMG0wQVkybkJWSW9LdVJBM1o2cEZ5SU9Sa0NEYjFF?=
 =?utf-8?B?Yytob0hOVHJzanNkSHpkSkhqQXgyaHRBMUZkYWo5VEFWNHB6RTYyMHFITHhW?=
 =?utf-8?B?Tzh4Nmd0SWlqblBCelJtdjRacW8wWWpJMlNBaDN3c3gwcjRXR1pLOWFoek5q?=
 =?utf-8?B?b2tSRnZsTExwNno2SHF2ZXJxNHVKYkRUZlBYMVBLcysrREhjMU1nTks5R3JD?=
 =?utf-8?B?aHZxclZYRk5adVBiK29VV3ZkM0lOb3B1WWRuSmU2TE9kWmp6WUZqa0pIWXho?=
 =?utf-8?B?czdkRm00Vk40YjkxYXNlOWhFNWF3NTBEL2VnZm82RStUTWlxNU1pNlhGZC9Z?=
 =?utf-8?B?Yk5nUnF6ckZCZmxFOFRrMUx4d3BxVkQ4OE1GcTZiRzJHcmwza3RyK2U0Njlr?=
 =?utf-8?B?UXNDZUhOeTJmTzhqNWJQaHEzUnlNZ0Evd21lTW5zcldlSVQraGdpSk1FTnNQ?=
 =?utf-8?B?TEcza0lJeVovK1QzaTkvYkI3RklSZ2lKMlROME9SOUR5Nk9nc3NSNDY3UGZn?=
 =?utf-8?B?OFFmWlB2SDg0bG9pa3FCMk5laU9pWmJYM2UzZWVvcVVEQlZjOVVta2NENmxM?=
 =?utf-8?B?bFlwYUFUVWxsSUZFRUxTbkNTYm1sd0wvQTRTUU1FNUtWUUFzOTdKWlpLQXNZ?=
 =?utf-8?B?MmV4THIxd1NmdzFkVVBxNFdmaHdlQ3paaGZYblFLSzNSeGZlNWJ2UVhuTjJJ?=
 =?utf-8?B?K1ljWXl4b0RPdVNhWmMxUlp6UjRJbkVDbzZCVkoxOHlyK1FQeklsNWEwSUda?=
 =?utf-8?B?YlZjdDdkaDRwZTU2dzJnU2t1UlBzdTBxV1d1U0ZvRFV5bnYwTnRQQXo2bFVa?=
 =?utf-8?B?aHZnTWZLMmZNaGttYms5dENsVkR6UDN1MHpvOTlQci9vQ3hNTDBLNVlLQmlE?=
 =?utf-8?B?dUFCRDJ2ZG53ZWxFeXlmaWRXdnZCYkxMUDF3SlN3VElqVjJtTnpXcmluclNr?=
 =?utf-8?B?ckJaNkxERjdVYXREbnhYSzJpdHlyL2xIblIwZDRvYjMwWXYvUTdFWWdpcHFu?=
 =?utf-8?B?SnN1cmRmR2hGUXZjMSszNjg0R0hoTzlpSUFERUR5UU1nM0hOT2FYUVV1TXJC?=
 =?utf-8?B?VFZQT0JhTWxiQ0E2NUhHZEpsU3QrOU1tV3h0NXNTZGl6VHNacU4ycnhNbVFY?=
 =?utf-8?B?VFBCdjJ5aCtDbGtwVzVlRVE5ZzVLazRNam1DbXBoNkdFODBCQnl1VS9MY1Fr?=
 =?utf-8?B?bXhZWEpPL3daMERJN1ZnemtBalFEdTJCMUNkU2J0QS91M3N1ZVYrYTlFZ0pU?=
 =?utf-8?B?a3kxbEhtVWVFK0JmT0lOS3N6dC9ZYjJYUWZrT01iWnpLU2QzNHRVZkFGRFBh?=
 =?utf-8?B?cE9KcHRGcUlabWpZVjVFM0FIbXFsdHV1N25sUE1ySFU5UHE5aXViTkF4N3Fp?=
 =?utf-8?B?WS9KNWVYeDdYTDRrUVhqNTc1R1R1VXB0T2MvbmVQazgwaTlFMjZ3SjRRLzJV?=
 =?utf-8?B?L1E4WlQyaVROYS9jMDhoSHI4TU4vTzFaRnRqL2dwN0l5SUNjL1ZTSUIzZERD?=
 =?utf-8?B?SENVa3dUbUdlQ1Z2anlwMEhicWE1c2JtdkhONldUcy8yZnNTVFRhTkhlOUxv?=
 =?utf-8?B?WFBkOFpNOGMyQXNSQWlSR3FxUDJBOFJuS0YxbUNXYlZSMG9yWHF0dTB2dVRJ?=
 =?utf-8?B?RmdoSk1IcG5RS0VTdVBmRFFxNmFFb3h0TWY5Qjh1ZDNZYnFOdFhnMGF4TWp3?=
 =?utf-8?B?ZjhZU1FIa0RNRFVQNEZuVnVSbUw4TGQzeGVHRUlSVEhIV1JJWVNuOTd2d0ln?=
 =?utf-8?B?bzVOd3g3amNDNll5OVdVbnFlcWRiM1BIK3N2Z0F5NVowQTJHSGo2S2x2Skdm?=
 =?utf-8?B?d3NMc0JOZFU0M2xodmwzUkdRL2NQaGpzRCtodm9EU3pCbEN3bGMxeGJpV0kz?=
 =?utf-8?B?Q1NlK2F3aGZvRWpJdVZqSUVaSzZEMmlQa2FFNmlNK3BESHFlaGVaVUJNQUZ4?=
 =?utf-8?B?NW0xMkQ4YTBTUkNVb0JwaG5UV1Z0ZmNWek1uS3ZvNWYxaUVrdERhRndmYlZY?=
 =?utf-8?B?SDJSNWtha2ZTRStLVC9wZ1hBQWttaHVDQUE5cUVXbXVLdHhPVXh6RlVDeEcv?=
 =?utf-8?B?TVRJL0dGbytjd1JuTEFqNGp5NzRwMzdCWXpicEg1UTBSQjRJdGsxb3p0eXBI?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52dcf43-8d44-4ecc-d956-08dab62bbfe1
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 01:53:45.1694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFOV9YFxUV0+1iBylx0UOfL0H/9/kDRNmrWS9F5t2Y8Hn+MB5r3ODHEHmhWp6viUofwvN8TNOCNmSMsIUNqtBvHghNlcTaPfWp6unyMPRQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5274
X-Proofpoint-GUID: odP_uPYhh1ZszLAifv7iUjB4VfxpxmjZ
X-Proofpoint-ORIG-GUID: XvV0imLTxpwU76FAeT9dzjGEeR5NWsiH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210250009
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 29P0vEgj019145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 01:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172120


On 10/21/22 17:18, Alexander Kanavin wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> So if you would like this patch to be merged you need to do two things:
> - enable ptest and add the component to ptest images
> - take the patches that were submitted upstream and add them with
> 'Submitted' status, instead of this mono-patch
>
> Alex

Alex,=C2=A0 thanks.=C2=A0 I will send V2 after fix the comments.

BRs

Changqing

>
> On Fri, 21 Oct 2022 at 11:12, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org=
>
> wrote:
>> Please explain why oe-core should carry this (with all the maintenance
>> and rebase burden that brings) if the component is not ptest-enabled
>> and is not otherwise using those tests.
>>
>> Besides, these fixes should go upstream first, which I already did for=
 you:
>> https://github.com/giampaolo/psutil/pull/2097
>>
>> Alex
>>
>> On Fri, 21 Oct 2022 at 11:01, Changqing Li <changqing.li@windriver.com=
> wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> * Add RDEPENDS for package python3-psutil-tests to fix following erro=
r:
>>> $ python3 -m psutil.tests
>>> Traceback (most recent call last):
>>>    File "/usr/lib/python3.10/runpy.py", line 187, in _run_module_as_m=
ain
>>>      mod_name, mod_spec, code =3D _get_module_details(mod_name, _Erro=
r)
>>>    File "/usr/lib/python3.10/runpy.py", line 146, in _get_module_deta=
ils
>>>      return _get_module_details(pkg_main_name, error)
>>>    File "/usr/lib/python3.10/runpy.py", line 110, in _get_module_deta=
ils
>>>      __import__(pkg_name)
>>>    File "/usr/lib/python3.10/site-packages/psutil/tests/__init__.py",=
 line 35, in <module>
>>>      import unittest
>>> ModuleNotFoundError: No module named 'unittest'
>>>
>>> * Skip some test cases not suitable for OE
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>>   .../0001-fix-failure-test-cases.patch         | 195 +++++++++++++++=
+++
>>>   .../python/python3-psutil_5.9.2.bb            |  10 +
>>>   2 files changed, 205 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/python/python3-psutil/0001=
-fix-failure-test-cases.patch
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-psutil/0001-fix-fai=
lure-test-cases.patch b/meta/recipes-devtools/python/python3-psutil/0001-=
fix-failure-test-cases.patch
>>> new file mode 100644
>>> index 0000000000..d5e5fe99d1
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-te=
st-cases.patch
>>> @@ -0,0 +1,195 @@
>>> +From f6b9fda0942dfa7298d7bd3e1bc5d7bb64cf99ec Mon Sep 17 00:00:00 20=
01
>>> +From: Changqing Li <changqing.li@windriver.com>
>>> +Date: Wed, 23 Feb 2022 11:54:40 +0800
>>> +Subject: [PATCH] fix failure test cases
>>> +
>>> +The test cases is not robust enough. skip some cases that is
>>> +not suitable for all conditions.
>>> +
>>> +* test_io_counters failed when kernel config CONFIG_TASKSTATS
>>> +  and CONFIG_TASK_IO_ACCOUNTING are not enable in OE
>>> +* test_setup_script failed since oe don't install setup.py
>>> +* test_used failed since oe use git source for free, so the version
>>> +  is 3.3.17-dirty
>>> +* test_weird_environ failed since gcc not installed
>>> +* test_debug failed since it is designed to run when PSUTIL_DEBUG is=
 set
>>> +* test_against_findmnt/test_comparisons/test_disk_partitions_mocked/
>>> +  test_disk_partitions is not suitable for Linux nfs boot
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> +
>>> +---
>>> + psutil/tests/test_contracts.py | 1 +
>>> + psutil/tests/test_linux.py     | 8 ++++++--
>>> + psutil/tests/test_misc.py      | 4 ++++
>>> + psutil/tests/test_process.py   | 5 +++++
>>> + psutil/tests/test_system.py    | 1 +
>>> + psutil/tests/test_unicode.py   | 4 +++-
>>> + 6 files changed, 20 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/psutil/tests/test_contracts.py b/psutil/tests/test_cont=
racts.py
>>> +index 0d90066..8502f0c 100755
>>> +--- a/psutil/tests/test_contracts.py
>>> ++++ b/psutil/tests/test_contracts.py
>>> +@@ -172,6 +172,7 @@ class TestAvailProcessAPIs(PsutilTestCase):
>>> +     def test_rlimit(self):
>>> +         self.assertEqual(hasattr(psutil.Process, "rlimit"), LINUX o=
r FREEBSD)
>>> +
>>> ++    @unittest.skip("broken on OE since kernel config maye not be en=
abled")
>>> +     def test_io_counters(self):
>>> +         hasit =3D hasattr(psutil.Process, "io_counters")
>>> +         self.assertEqual(hasit, False if MACOS or SUNOS else True)
>>> +diff --git a/psutil/tests/test_linux.py b/psutil/tests/test_linux.py
>>> +index 41645e3..3bcec0b 100755
>>> +--- a/psutil/tests/test_linux.py
>>> ++++ b/psutil/tests/test_linux.py
>>> +@@ -201,8 +201,9 @@ def get_free_version_info():
>>> +     out =3D sh(["free", "-V"]).strip()
>>> +     if 'UNKNOWN' in out:
>>> +         raise unittest.SkipTest("can't determine free version")
>>> +-    return tuple(map(int, out.split()[-1].split('.')))
>>> +-
>>> ++    vlist =3D out.split()[-1].split('.')
>>> ++    vlist[:] =3D [n.split('-')[0] for n in vlist]
>>> ++    return tuple(map(int, vlist))
>>> +
>>> + @contextlib.contextmanager
>>> + def mock_open_content(for_path, content):
>>> +@@ -1296,6 +1297,7 @@ class TestRootFsDeviceFinder(PsutilTestCase):
>>> +         finder.ask_sys_class_block()
>>> +
>>> +     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS=
")
>>> ++    @unittest.skip("Broken for oe")
>>> +     def test_comparisons(self):
>>> +         finder =3D RootFsDeviceFinder()
>>> +         self.assertIsNotNone(finder.find())
>>> +@@ -1318,11 +1320,13 @@ class TestRootFsDeviceFinder(PsutilTestCase)=
:
>>> +
>>> +     @unittest.skipIf(not which("findmnt"), "findmnt utility not ava=
ilable")
>>> +     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS=
")
>>> ++    @unittest.skip("Broken for oe")
>>> +     def test_against_findmnt(self):
>>> +         psutil_value =3D RootFsDeviceFinder().find()
>>> +         findmnt_value =3D sh("findmnt -o SOURCE -rn /")
>>> +         self.assertEqual(psutil_value, findmnt_value)
>>> +
>>> ++    @unittest.skip("Broken for oe")
>>> +     def test_disk_partitions_mocked(self):
>>> +         with mock.patch(
>>> +                 'psutil._pslinux.cext.disk_partitions',
>>> +diff --git a/psutil/tests/test_misc.py b/psutil/tests/test_misc.py
>>> +index e22789c..050df01 100755
>>> +--- a/psutil/tests/test_misc.py
>>> ++++ b/psutil/tests/test_misc.py
>>> +@@ -190,6 +190,8 @@ class TestSpecialMethods(PsutilTestCase):
>>> + # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +
>>> ++PSUTIL_DEBUG =3D bool(os.getenv('PSUTIL_DEBUG', 0))
>>> ++
>>> + class TestMisc(PsutilTestCase):
>>> +
>>> +     def test__all__(self):
>>> +@@ -252,6 +254,7 @@ class TestMisc(PsutilTestCase):
>>> +
>>> +     # XXX: https://github.com/pypa/setuptools/pull/2896
>>> +     @unittest.skipIf(APPVEYOR, "temporarily disabled due to setupto=
ols bug")
>>> ++    @unittest.skip("OE run this test outof source tree")
>>> +     def test_setup_script(self):
>>> +         setup_py =3D os.path.join(ROOT_DIR, 'setup.py')
>>> +         if CI_TESTING and not os.path.exists(setup_py):
>>> +@@ -425,6 +428,7 @@ class TestCommonModule(PsutilTestCase):
>>> +         with mock.patch('psutil._common.stat.S_ISREG', return_value=
=3DFalse):
>>> +             assert not isfile_strict(this_file)
>>> +
>>> ++    @unittest.skipIf(not PSUTIL_DEBUG, "env PSUTIL_DEBUG not set")
>>> +     def test_debug(self):
>>> +         if PY3:
>>> +             from io import StringIO
>>> +diff --git a/psutil/tests/test_process.py b/psutil/tests/test_proces=
s.py
>>> +index eb17e23..b75cc92 100755
>>> +--- a/psutil/tests/test_process.py
>>> ++++ b/psutil/tests/test_process.py
>>> +@@ -37,6 +37,7 @@ from psutil._compat import PY3
>>> + from psutil._compat import FileNotFoundError
>>> + from psutil._compat import long
>>> + from psutil._compat import super
>>> ++from psutil._compat import which
>>> + from psutil.tests import APPVEYOR
>>> + from psutil.tests import CI_TESTING
>>> + from psutil.tests import GITHUB_ACTIONS
>>> +@@ -726,6 +727,7 @@ class TestProcess(PsutilTestCase):
>>> +             self.assertEqual(' '.join(p.cmdline()), ' '.join(cmdlin=
e))
>>> +
>>> +     @unittest.skipIf(PYPY, "broken on PYPY")
>>> ++    @unittest.skipIf(not which("gcc"), "gcc not installed")
>>> +     def test_long_cmdline(self):
>>> +         testfn =3D self.get_testfn()
>>> +         create_exe(testfn)
>>> +@@ -740,6 +742,7 @@ class TestProcess(PsutilTestCase):
>>> +         assert pyexe.startswith(name), (pyexe, name)
>>> +
>>> +     @unittest.skipIf(PYPY, "unreliable on PYPY")
>>> ++    @unittest.skipIf(not which("gcc"), "gcc not installed")
>>> +     def test_long_name(self):
>>> +         testfn =3D self.get_testfn(suffix=3D"0123456789" * 2)
>>> +         create_exe(testfn)
>>> +@@ -750,6 +753,7 @@ class TestProcess(PsutilTestCase):
>>> +     @unittest.skipIf(SUNOS, "broken on SUNOS")
>>> +     @unittest.skipIf(AIX, "broken on AIX")
>>> +     @unittest.skipIf(PYPY, "broken on PYPY")
>>> ++    @unittest.skipIf(not which("gcc"), "gcc not installed")
>>> +     def test_prog_w_funky_name(self):
>>> +         # Test that name(), exe() and cmdline() correctly handle pr=
ograms
>>> +         # with funky chars such as spaces and ")", see:
>>> +@@ -1426,6 +1430,7 @@ class TestProcess(PsutilTestCase):
>>> +
>>> +     @unittest.skipIf(not HAS_ENVIRON, "not supported")
>>> +     @unittest.skipIf(not POSIX, "POSIX only")
>>> ++    @unittest.skipIf(not which("gcc"), "gcc not installed")
>>> +     def test_weird_environ(self):
>>> +         # environment variables can contain values without an equal=
s sign
>>> +         code =3D textwrap.dedent("""
>>> +diff --git a/psutil/tests/test_system.py b/psutil/tests/test_system.=
py
>>> +index e130c93..fc755bf 100755
>>> +--- a/psutil/tests/test_system.py
>>> ++++ b/psutil/tests/test_system.py
>>> +@@ -579,6 +579,7 @@ class TestDiskAPIs(PsutilTestCase):
>>> +     def test_disk_usage_bytes(self):
>>> +         psutil.disk_usage(b'.')
>>> +
>>> ++    @unittest.skip("Broken for oe")
>>> +     def test_disk_partitions(self):
>>> +         def check_ntuple(nt):
>>> +             self.assertIsInstance(nt.device, str)
>>> +diff --git a/psutil/tests/test_unicode.py b/psutil/tests/test_unicod=
e.py
>>> +index 3fa3f01..2b2e76c 100755
>>> +--- a/psutil/tests/test_unicode.py
>>> ++++ b/psutil/tests/test_unicode.py
>>> +@@ -87,6 +87,7 @@ from psutil import POSIX
>>> + from psutil import WINDOWS
>>> + from psutil._compat import PY3
>>> + from psutil._compat import u
>>> ++from psutil._compat import which
>>> + from psutil.tests import APPVEYOR
>>> + from psutil.tests import ASCII_FS
>>> + from psutil.tests import CI_TESTING
>>> +@@ -156,7 +157,7 @@ def try_unicode(suffix):
>>> + # FS APIs
>>> + # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +-
>>> ++@unittest.skipIf(not which("gcc"), "gcc not installed")
>>> + class BaseUnicodeTest(PsutilTestCase):
>>> +     funky_suffix =3D None
>>> +
>>> +@@ -169,6 +170,7 @@ class BaseUnicodeTest(PsutilTestCase):
>>> + @serialrun
>>> + @unittest.skipIf(ASCII_FS, "ASCII fs")
>>> + @unittest.skipIf(PYPY and not PY3, "too much trouble on PYPY2")
>>> ++@unittest.skipIf(not which("gcc"), "gcc not installed")
>>> + class TestFSAPIs(BaseUnicodeTest):
>>> +     """Test FS APIs with a funky, valid, UTF8 path name."""
>>> +
>>> diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.2.bb b/m=
eta/recipes-devtools/python/python3-psutil_5.9.2.bb
>>> index 5b31014657..acb92965d7 100644
>>> --- a/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
>>> +++ b/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
>>> @@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "feb861a10b6c3bb00701063b37e4a=
fc754f8217f0f09c42280586bd6ac
>>>
>>>   inherit pypi setuptools3
>>>
>>> +SRC_URI +=3D "file://0001-fix-failure-test-cases.patch"
>>> +
>>>   PACKAGES =3D+ "${PN}-tests"
>>>
>>>   FILES:${PN}-tests +=3D " \
>>> @@ -24,4 +26,12 @@ RDEPENDS:${PN} +=3D " \
>>>       ${PYTHON_PN}-resource \
>>>   "
>>>
>>> +RDEPENDS:${PN}-tests +=3D " \
>>> +    ${PYTHON_PN}-unittest \
>>> +    ${PYTHON_PN}-json \
>>> +    ${PYTHON_PN}-unixadmin \
>>> +    ${PYTHON_PN}-mmap \
>>> +    ${PYTHON_PN}-multiprocessing \
>>> +"
>>> +
>>>   BBCLASSEXTEND =3D "native nativesdk"
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172011): https://lists.openembedded.org/g/openembe=
dded-core/message/172011
>> Mute This Topic: https://lists.openembedded.org/mt/94472197/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

