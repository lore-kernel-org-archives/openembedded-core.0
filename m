Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.73])
 by mx.groups.io with SMTP id smtpd.web12.18108.1600245445929590397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 01:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ojAFenzK;
 spf=pass (domain: windriver.com, ip: 40.107.76.73, mailfrom: heng.guo@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+nk09BrO+goEKAgHXoSRZ4Zmx8V3VAfPZ1KFP/cbPTQDRV4JAcoysN41f04YjYILB5eXStD5Ko7QvO4ElWsgPeAstffvs4zfZ8FJzxH6nWF6c/Pno8xsbMJROk6akriWvIYblKU9CiuWvVl+i9T7xQdn3KQ1BeAnWsZEwmTv3rnP/T1t7uCAX3ZUDb7qX41zZmqmEaHIX8Nwiij6rcvtvuMNqBeXtrjettXwrtfMYXcZR6BHp72DSUE6JOnM4EWFT7ZRTeFaUYH51rCC1/dfyvn1SXYgXF5Mazi56UaLtDKj7Mo/eFVjmIpgYv9fQ+0o3woBxLD+RvyYc5GMjisPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLmDEvZW5ryIMklIXruyhBCoCRChIFMzI2zIsr8wR3U=;
 b=cSeUrTgEV0QJo99WVGD5tOW+jDmHSd3drHbXHP+swtYc4fYuuyyUmuioInS2BN+6AKnGXoJzbVcs7L4oKPYnQAic/1cKQ5NpFK0VRoCKpga8eIKHbE2UDMqFkLTUvQJcCuN84Pz4De2tu9YGNeBT5Wu6m2QxGwGr8m6E+nbxGeQPyMQw0UHwRo6xV2auQCM/bYnzkBUarHBbiulmP6cJ2uEuO8gItRvwRnsC8ATa1gk1IJgcpD4FVoVZLiRJfBbQnmh3i9ZO28gj0vB/59xQWUpWsIB5N/J00mxIMZmh7O4e0CCnDlDDPt56u2e9b6Z1m+EWb7/k6M6Bg6eFkFbXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLmDEvZW5ryIMklIXruyhBCoCRChIFMzI2zIsr8wR3U=;
 b=ojAFenzK+QiVwDknjJMaf1P7VHvLfhy9Qd6uQJRMQ+u7xllNYS0+AJvI7lupVvGLh+K3y3X+vgBCgNmS6PVI6W9+7ZFVBUyHTVbhuh8y8o3URquvtozQwFaLL8CoGBVGt86JmPcn+LLcNmfHc3tkSPwj6Cd2ja2EGwD3xeqzBYg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3404.namprd11.prod.outlook.com (2603:10b6:5:59::29) by
 DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.14; Wed, 16 Sep 2020 08:37:24 +0000
Received: from DM6PR11MB3404.namprd11.prod.outlook.com
 ([fe80::a9ce:cc5b:a5b1:6e35]) by DM6PR11MB3404.namprd11.prod.outlook.com
 ([fe80::a9ce:cc5b:a5b1:6e35%4]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 08:37:24 +0000
Subject: Re: [OE-core] [PATCH] python2: fix segmentation fault in ptest test_bigrepeat
From: "Heng Guo" <heng.guo@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200903092448.26165-1-heng.guo@windriver.com>
 <029196ff18a0d039ea41d70db9497c0a8c0db1d0.camel@linuxfoundation.org>
 <c549a7ab-0b5d-3763-c745-70c7abf4eb92@windriver.com>
Message-ID: <b4806c79-9f1c-6fdc-07bd-91af19fdb23d@windriver.com>
Date: Wed, 16 Sep 2020 16:37:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
In-Reply-To: <c549a7ab-0b5d-3763-c745-70c7abf4eb92@windriver.com>
X-ClientProxiedBy: HK2PR03CA0045.apcprd03.prod.outlook.com
 (2603:1096:202:17::15) To DM6PR11MB3404.namprd11.prod.outlook.com
 (2603:10b6:5:59::29)
Return-Path: heng.guo@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.155.91] (60.247.85.82) by HK2PR03CA0045.apcprd03.prod.outlook.com (2603:1096:202:17::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5 via Frontend Transport; Wed, 16 Sep 2020 08:37:22 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5582b84-3500-45de-baff-08d85a1bbbd1
X-MS-TrafficTypeDiagnostic: DM6PR11MB4644:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB46446FE341BBEA01FE04CFCC8C210@DM6PR11MB4644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ISHC26wOmR1zxWh2OCZ+mMW4NLjaCnbuoRevrEc7BD9fP/Eedjp7LwOLBkZu6ASaWabDpZVowQQIbp60yGB/3c3uAOQCVA8aAsC9CjNFboZ7L5tIOZQ0dkytBvg8ISoOoq/W6gVxUTEt90pm85SgDHU1YMBe28r9n+INLGDN6m8OenSEaqgfqaEGZF3TPt7QTYOETHPcDWPHFSBiDzBJqUJBRwcrte6HetapVOYEN/qrFYdyO10u1jxDRW6f/5ridw3YeDySY4e+hp2sgaGfiQ/tcgB9C4nKANMp9GOGMlrTM/oTXP6jQzpnCTP/OWpBbAnXjxJ6KMpV2LYfnwd+EpYgSaUm0UPNzsI8sgSmlENcwz06IkpsnYUBKN+OifI9y9xDCCV3ulDPicrgFrH3aSomQKZ/mdxCoTQkIhp4EatKVbD260nvSzDPQaxX4Et3Mkb+fcUHTsv0vbGu9f8bag5kDS+lxGKqm2NyQx3lyo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3404.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(316002)(16576012)(8676002)(6706004)(956004)(2616005)(31696002)(5660300002)(966005)(478600001)(66556008)(66476007)(16526019)(6486002)(86362001)(66946007)(52116002)(26005)(53546011)(2906002)(6666004)(31686004)(36756003)(8936002)(186003)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ClLO5KKfj5wss/t2N9lpen3B48CzsI0i7rM4JawQSa4TmzsKIAsvzRir1y0QSbbSSy74F8n46Ko1GslCZ29yl8OC6Zjdzuxq7iUnK3xK+PpdXpQLl7uiatd/chTdkQA7tlPju4M+/ineCMOPUy5v76Wy/wTAGRsMEpkUd+1DycMQz8Nv3+08s61kz768rDZLtcD3Kht6tz1xCXGJoDqAEXsIWyhMPKS0zu6NQB8ryqDjaP+bn33/jISaJFDTghusEEPieU6ZdnBpIzrpkP1Jb/wgQO6mmdbsTMjHtQvNseXkv6uOG8JW8xffKP8xUupVMylXPOKIkNAJSvnxE8IRzR6l46zKM5KdFUoMHz9Tqvhy2x34qvkB4drA73x77hqi0JqIJqQC4q9PhYx5SCed8ZwyAo12Oyx0At3Hl1bxim9uP1uFWNlPQAfRvhtNcezigWJ8OKjCkbl9ARdfznPfNGgh9wwYtm3DjN2o9HEng+9rducMAXUJLIuwYa4lizl3fCK9fMus2UfYRJ2DW++d9+9ZfDiZ3wPImcaLx4coLgAGPXVSPfRH80sd3rWEbxMxEEALz7AMnZe0hvULGV9pWqArIfDBf1p8FAErlZ8N8+ycjvzFRR5lm2rVNVNf9zpGgwFwvT83+Xvr8aZgzUoJRQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5582b84-3500-45de-baff-08d85a1bbbd1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3404.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 08:37:23.8094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjzfG+c5niiFKeUBLS0NUBL4aWQsLClgo8rU27oT9Vjp+NOOLZCQ1/1LXkBTVCyckFGChQ8/yHiEjoBPYLYpng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Richard,

The patch is for zeus branch.

Thanks,
Heng

On 9/4/20 9:59 AM, heng guo wrote:
>=20
>=20
> On 9/3/20 7:12 PM, Richard Purdie wrote:
>> On Thu, 2020-09-03 at 17:24 +0800, Heng Guo wrote:
>>> Segmentation fault at case test_bigrepeat of python ptest. a similar
>>> bug
>>> can be found at https://bugs.python.org/issue33153.
>>>
>>> tuplerepeat() in Objects/tupleobject.c uses a questionable check that
>>> relies on signed integer overflow. A singed integer overflow is
>>> triggered by ptest case: test_bigrepeat.
>>>
>>> Python2 is out of maintainus, so backport the related patch from
>>> python3
>>> commit:
>>> https://github.com/python/cpython/commit/c04ddff290fc203d05b75c8569b748=
525fb76b5b=20
>>>
>>>
>>> Signed-off-by: Heng Guo <heng.guo@windriver.com>
>>> ---
>>> =C2=A0 ...segmentation-fault-in-test_bigrepeat.patch | 33
>>> +++++++++++++++++++
>>> =C2=A0 meta/recipes-devtools/python/python_2.7.18.bb |=C2=A0 1 +
>>> =C2=A0 2 files changed, 34 insertions(+)
>>> =C2=A0 create mode 100644 meta/recipes-devtools/python/python/0001-pyth=
on2-
>>> fix-segmentation-fault-in-test_bigrepeat.patch
>>>
>>> diff --git a/meta/recipes-devtools/python/python/0001-python2-fix-
>>> segmentation-fault-in-test_bigrepeat.patch b/meta/recipes-
>>> devtools/python/python/0001-python2-fix-segmentation-fault-in-
>>> test_bigrepeat.patch
>>> new file mode 100644
>>> index 0000000000..45087bfb8d
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python/0001-python2-fix-
>>> segmentation-fault-in-test_bigrepeat.patch
>>> @@ -0,0 +1,33 @@
>>> +From 031d06e1e670d40b6500cce4134ab35ec8858a8b Mon Sep 17 00:00:00
>>> 2001
>>> +From: Heng Guo <heng.guo@windriver.com>
>>> +Date: Wed, 15 Jul 2020 15:42:13 +0800
>>> +Subject: [PATCH] python2: fix segmentation fault in test_bigrepeat
>>> +
>>> +Port from:
>>> +
>>> https://github.com/python/cpython/commit/c04ddff290fc203d05b75c8569b748=
525fb76b5b=20
>>>
>>> +Only merge codes related to tuplerepeat() in tupleobject.c.
>>> +
>>> +Signed-off-by: Heng Guo <heng.guo@windriver.com>
>>
>> Missing Upstream-Status tag, also which branch is this against? The
>> recipe no longer exists in OE-Core.
> [Heng]: https://bugs.python.org/issue33153 the same bug is reported to=20
> python2 over 2 years and on hold over 1 year.
> For python branch: remotes/origin/2.7.
>=20
>>
>> Cheers,
>>
>> Richard
>>
