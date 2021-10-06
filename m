Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A38C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 09:17:59 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.50])
 by mx.groups.io with SMTP id smtpd.web09.9316.1633511877698643796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 02:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=A/deW4Yg;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.50,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LE/Ntuk1L3HhowIOaVJY3wcIWZSIe6legpkrCeBa1FjVfDnH++fiIUcLc1Dn6QT5P24w8D33UpADi9LNCcpzLJdxReU4euUxDDo5DJ8uSr+PqjlRXKP4LmTl38Yg5Ev6bANqnLxkXTvFsarE5bjMgOr+91O4I9M6FG/L2IsPpIKOWzs9PF2l1uWKtohJ7/vrZSQIDwCPCJNSDCntdwYkLY+kN8WIYRnmB4qQLXbBU2fUAeEP+zL5usSo3pD/9zgteFhxBaQyoNQ2r36zIgnx7XB5Y2o07nA3sGFGfyAztcBJWXV7EclNsUYWkZEbR22ZaG1SuUrJrjgOvlVN2WyizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgE4bRUovdT8hV2QIiO0wMtjUFFVTTDl4gUxGzra1CM=;
 b=ROEb/cWUEPEZnxHwv6VWagzLNZzd0ggCP9MokPgbdf4clogkwseXRqb0QZXxGQF5+TQpNrLKBczE00edZ+0d9w1mSXWBSaVJeqQGuJdZf1sS+Ci9TtEZ3W5RqBD6ya0QJKN9ZyFerh4T7MZ7ZmdXv8BIqOG600HVmiclrsW18qvglVomljsnDC0uBPXQtcxq2/70xn2x7HPDX97CdrEBdlp25We4U2FrjyiNlzACqsNwB9WaOzU+Q3WkscNFtVvK4IUUhOvNkQsFSpk14wSS+igotsYAff4aFWWRIFUCRTLrhy/xgRd1fc4ckjOEheQ/FYflBkfhYqq2nYAsuvBIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgE4bRUovdT8hV2QIiO0wMtjUFFVTTDl4gUxGzra1CM=;
 b=A/deW4YgLvZdqIDjvCPyclDYuki5Uqt5VMC2SPY/MvlGXkVywhXhzYhUBYy9VXF+gAfVDUaR+/BVUoXdCrUBJklMHWT9QB6s/qtejka8vYhDcIGX55hsLCnRllOew4Fvct/bdoFKPLBcm948Jy04a16irpbHUbAGi7skDsRAekM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5675.eurprd08.prod.outlook.com (2603:10a6:102:8a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 09:17:55 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 09:17:55 +0000
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <21e1d312-f84c-69a5-98da-af74a20cdbe0@weidmueller.com>
Date: Wed, 6 Oct 2021 11:17:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::33) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [10.175.8.182] (87.129.248.106) by
 AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Wed, 6 Oct 2021 09:17:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c005d7c-3bc1-4486-e76f-08d988aa2e16
X-MS-TrafficTypeDiagnostic: PR3PR08MB5675:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB56752D3D397651472FEC3276D7B09@PR3PR08MB5675.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bm2Hs7/5sRInKIHpSTByDxGf6BtWo+2irrsM6PQdpJka8JIECaLyIYl4HqJhpCKfTee7OMClrBIEyrqy+RhSh9lP1uMRQxwK59UKkMWV2bPjcCzsELQYc8v7JSigsBDeBnC5VFsomDLUO3zWz/fJYG2TP3TeQk3iEc1PhuhpO28OfybUyxLChjnxnd8tISCewsQaJxFHCn0mszZciYOippPS1RiatvGlcCENYqlrt4AhfEDznPQ0ahXfSY57j3GsC7rRbmwuFgf495V/17O2ZxK+7hjKrsgfFVLPeV0ZkhaW15Ex4PYTetqhH9/xXlMm65N/3/K1ji+wxUy9RbBqogPDBcKZ+qI6aAtmKXiPGKd4ZxzlpmJH6zfNmrbcqC0NQDKo+FGd7cgh4M258RaonLoN8T1fnKvh3KZrVZXnTWoiaJYxIeAK6+WyHjZ/XR0d+yfXIazytHOmxQ3UAS8Lu9JN4+vdnmLoJsTVrJgExZZIEgLF1K1E48bNa6I++Y9TB4Rg5vRwVmOsQawvcJvHwlQex+rToFoF6zwmMrqSYJ1japHUu0X/j8vJENdvHsy16+JcmRJ2yshw6oLT8kL8UFHD74pHCBQjZ+gUL/+QF4NRPWLfGyPBPr1289TltJnPM5IdZbSOjLZsW0fF8vArvSKpC2L7GPTVqO05oPkHiXM1dzGICZbbJsNQmsz8N5O4izKSWolIqssQw0Q3p4OHfO0WLC7XaqJsjL4yuXfMmscWei90tMmUE83dY5SvwQy1AAs1gXn6hzkN6kkbi6lOpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(52116002)(54906003)(16576012)(26005)(8676002)(316002)(8936002)(4326008)(66556008)(6486002)(508600001)(5660300002)(31696002)(66946007)(66476007)(6916009)(38100700002)(83380400001)(2616005)(956004)(86362001)(2906002)(38350700002)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3ZyNlM1dVV1UzhNbTU2QndlNHVkQ3lXTUF3d1BjQ081TnE5SkJ6bUt0ckJs?=
 =?utf-8?B?b2h1Q2dGRm51Yi8yWTBWemtuVUxtNnRLemg4WDBOazFkU2hvb1AxajR0MzJ5?=
 =?utf-8?B?QnEzTlNPYWJhUFNmQmNqbHkwaDZjdGlzbDdvdVhWSzF1eGdtMjNEVnhSSzFm?=
 =?utf-8?B?ZlJaYisxRDZjZmtYVytDTHBnL1ZFK2ltdDBhckhENWtaM0w4WjZxYUlEalRs?=
 =?utf-8?B?MG5wNUU1U2QvQlUxemR2dSsyNE1OR1YwYkl0eXRPdjN6WGlMRkZBUVJ4Ujc5?=
 =?utf-8?B?OHo2WTRYVDFiZUhaVzFyR2g1bXcxYkRrR0YxakJYT2pJQmU3cmVSYTZ2cHZD?=
 =?utf-8?B?NFBvZWU4S3plV1pmNmNLSVE0RDd0aTUvWk9zNVlqczNBZm1MbnJHc1I1NTBz?=
 =?utf-8?B?VngrZlpEVXZ5aUVwcWpOZlVDL2FEcDhkeVdFbDRTditNWlZEVUlWTnlCMUFV?=
 =?utf-8?B?MWw0R053UVJmckhzY1pRTVpwTWltWnJtWnh2ejRFaTkzRzlvemNyT0MwQjlI?=
 =?utf-8?B?MjlWdGxnSEFGWkM4aFFZa0hWWHFHWk02NW5uL0MwQUtaelQxdVR5ZXFqeUQy?=
 =?utf-8?B?SjVseU5lcVZJWW9WMHRDM2krblBGU3hzVlBaOG1rNXVQZ0lqWEtkZWZWK0lz?=
 =?utf-8?B?bytRbzFZODV2czh0cVM3L3pSQmhnZXV2NTJFY1BsZ2tNK1NtckJrN1V6b1ht?=
 =?utf-8?B?bkJOclZ2VE5ZOUlVemgzWmticmJzMXpseFZwSytDaEI5cVRiUGFLSU1lKzlB?=
 =?utf-8?B?UHFGbkF6SHFlSm95VTBNK3Z2Q0d2VEsyYXBUbzVqcGNDRXplWWlyUGVRdksx?=
 =?utf-8?B?a05pUkNQb1hONVV5Q3V1RWhkTml1SGVPTGszTU5vMUx3U2ppK0tJYWRvc25l?=
 =?utf-8?B?TUhvc0QrVWp1K0E3V1F3Mk1BWlNxOHd2NUdyTGNCSWpMRDdLczkrRnFCQnNG?=
 =?utf-8?B?N0loNi9WdEYzd0hnbzdBMFpGa1VCWGlKNStRZUI5KzRjZ0xheVpKeXBBdzV4?=
 =?utf-8?B?V0RqeURlcCtNWTJDeDhmNW9uUmpmNHdCWHdnZDM4TENGWmxkSmx4NTdTMVVw?=
 =?utf-8?B?c2x3S2RmYlZJNUFBTmVvRXREVTRETHlHMmtUTWZYVW5QQUNDSzVwZnV5WFhS?=
 =?utf-8?B?ZkFxQzZwSkpjZno1K0NUejYvTHdZOFp4VDN5eWxza201dU9vSXAzZDkvbDV3?=
 =?utf-8?B?MG16K3NNa0c2cFpFREQ4WUFJczJQSDNEczZPY0Jya0V3cVdiSHdoUHp1OG43?=
 =?utf-8?B?QVI3bmdJaVJ1b0NQSUlVL1BwNkR5T1NZN0xYMGpMTUtaaVFCODM2cUdkL0RN?=
 =?utf-8?B?TVNuM0tMb25ZS2g2KzNyYXJ3YUJ5RmRjWXpRdjZ3c0pXU0VaWUZPdkNDS3lB?=
 =?utf-8?B?OW5wNGpEUGFBaXJrVVM0V0lmbUlJdHNIUzYzemdGazViTGVlMXBDVFZNN0s5?=
 =?utf-8?B?cW11Y0hOaWlWaTNtZGt2ZlFmVW84cGVna3JaZFVlRWRxbUw2Y29lbzVoV2JJ?=
 =?utf-8?B?cHBXM3cxWERWbkNROHJyTUdtem1Yd3F2c2Y0Y3dqNTUvUlZ3bjhCTUxFM1ps?=
 =?utf-8?B?ejlKcnlWYk8vTjVXbFRrVTFneXZWVTUrTGxkbzF3V05NM2t5N2NFVUVqTkYz?=
 =?utf-8?B?UEVjMWxKTGtscTBFcVd4KzZBMDZOa1lCZmg5VkNMbVE2eVIwcFR0aGlEaVlN?=
 =?utf-8?B?T25wbEF3Z1FocmZENVpOOTJKYklUOWVFT0g1dEVUdmU4eUJWUHJweUZ3d2lN?=
 =?utf-8?Q?NZ4L7XEzCiyZft9ngkz8Ej6FFpTxb68y7J7F+PM?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5c005d7c-3bc1-4486-e76f-08d988aa2e16
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 09:17:54.9423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bqPM63bSEIYhoM+ePC1kGusgXbRyAEua5d+bczJ6BU6brqotLUHChWtvPOYeAQb6VEwxYIKWFnCA1xN5BlD+3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 09:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156678

Hi Alex,

Am 05.10.2021 um 21:17 schrieb Alexander Kanavin:
> On Tue, 5 Oct 2021 at 19:44, Stefan Herbrechtsmeier 
> <stefan.herbrechtsmeier-oss@weidmueller.com 
> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
> 
> 
>      > A layer with thousands of recipes seems totally intractable.
> 
>     What is your concern? The high number of dependencies or to handle it
>     via OE?
> 
> 
> Generating recipes with a tool means the tool will be custom and 
> non-standard, and chances of anyone outside of your company
> understanding, using and contributing to it are rather small.

Why can't we extend devtool add / createtool to generate multiple 
recipes? As bonus we can check if a recipe already exist?

> There's 
> also the problem of needing multiple versions of the same thing for 
> different
> consumer items, which oe doesn't easily support.

The common approach in OE is to add the (partial) version to the recipe 
name. On the other side the major version of an npm package doesn't 
indicate the real API breakage. The major version is also increased if a 
support for an old Node.js version is dropped.

Furthermore I would extend the approach from the link with a symbolic 
link inside the node_modules of the package itself. This allows a recipe 
to use a specific version. It is also possible to track a map between 
npm (package.json) version and OE name so that the generator could 
select the correct OE DEPENDS. But I haven't the experience how often 
you really need an older version. In my test most of the maintainer 
doesn't update the dependencies or the package is orphan.

> The link Robert 
> provided already exposes some of the pain points with that approach.

It also exposes the pain points with the current approach.

> I tend to think the best way forward (or least painful at least) is to 
> gradually improve what there already is, which is the npm class
> and devtool, and send patches to various upstream njs projects when 
> they're using outdated dependencies or otherwise need changing.

How many patches have you send to upstream npm packages and how many 
were successful?

My feeling is that the chance of success isn't high especially deeper in 
the dependency tree.

Regards
   Stefan

