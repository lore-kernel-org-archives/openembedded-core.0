Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88A1C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 09:18:28 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.59])
 by mx.groups.io with SMTP id smtpd.web10.9376.1633511906739532242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 02:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=00PoE4gu;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.59,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCWsTrJZP78BLWjstIm+trBnf6sptrdEiOf3WjtFNdaBFY4qzc8Hd70aXRFMdL/yguZsefjw1Vu4vQb5mCXvInw8aEzT30TjXCw5mILpYs2y3Ov3SXgQJMduhC6hi/ULUTqCnGvMUdgR+aISOuxhE3r9aWYfKCRm+QhMAdLr/JwR/k3Qdo9w603rv48qSmsgz6sZLznDiROvVyqgBaLpqUIEKMIfVJfjMjKsuphAFQCfVju28sZA62ACs2gHk8jXWC7ZrQPGRfJHiDuhLeChTIvWEuWpLKD5JSyCsBa0y4bE3PjkrCY9M7mZHXxAEG4XUZi0yof2vxRGF0a0iTNvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOUvROx/HSULQDVVfuSNFPJUALIWPLkgFR3Ry+uiB6c=;
 b=fTbjOj6Mb3P7lf7RoalwliQqseGGSLsD1xnv/MLam3NP0ZfMEdrhfaZHzNvI+eHckHC5moEUHXy72B3cQkcndzBs10T5pn61Fg7/kVGs/ibrue1jn/DOTol8MJllmTNBlHarGyBpDy8//fcLX1JpRwPPYjo6428xw3vK7zxOhe31Qlp3V0bbNIaTSB1ShPYGntrKaDF/sWTWZ3BiSNkCK6xJh9lGFVmdP3uzABuJFIxGRnWOGJ8TzmUadBszLZgXaTWgKNgIOudoFynqqxa5xJReYZmMQHTI/tRpGQpPZHdz/8jTcMJATmNO7XawOo86ICRvvcd04t4+grg1sd4+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOUvROx/HSULQDVVfuSNFPJUALIWPLkgFR3Ry+uiB6c=;
 b=00PoE4gu89e3vs0PcFAm6yOqNSFuq27ZuRtWLljgjlNwmdMqNo7jRpkpjcqf9ocvBTsVcarULotOhbevOUVqZsx8+/ATzEQfxVUPfMAKteXEiW9OeGjJdAKJb8+NBsTfX0aj7IG5T3Jkp41EACt21SihZzT37dKvxymzViYDeuQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6623.eurprd08.prod.outlook.com (2603:10a6:102:155::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 09:18:23 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 09:18:23 +0000
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Konrad Weihmann <kweihmann@outlook.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <71df6b93-bdcc-b09f-48c7-3ec822ef3228@weidmueller.com>
Date: Wed, 6 Oct 2021 11:18:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0202CA0015.eurprd02.prod.outlook.com
 (2603:10a6:203:69::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [10.175.8.182] (87.129.248.106) by
 AM5PR0202CA0015.eurprd02.prod.outlook.com (2603:10a6:203:69::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 09:18:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16ff637d-0ac5-45a6-d988-08d988aa3f2e
X-MS-TrafficTypeDiagnostic: PAXPR08MB6623:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6623524E20E923FE8138A77DD7B09@PAXPR08MB6623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RG+czEcy8REcFfFNvVUuRFa3xO6prz2N4Lemx26DgtlCQYZxmTXurxWeMK/As6dIC3Pe5DFRHr7CwRmmJzQdtCJvqROUdEKKshBeoBMmP1IMccJfHRCsBYDoq8aL4AmglNvPmip4nJcQFhtiKkkX/P1OFmBigQ92Wgv/9sbyCVQLkEkiCaKZPiGUW5Wn3eaS6ENPxK4co8TcC4Y9SzfkXj71UQ9l/khBE88FzJGun7cA7XU+4nIgLxbvscO9tTKo5UwgBsQ3nOHSHNxXsPbVjUn+87nb3CLPpTec0CpW2IZTDjzXWoruGy+zBK27y/8CY7Wc3Fh7I5oWmmM5hWS9iUQu9ezrHGPQZ4klllYtOGGhiYFvaXZ6jBfCFbhJpI7mphmc2CAnmFMjYHpfsnQ6kQb7bD6afD766RmlwJPw1PywnhK0Szl8RxqIxah/TmpRj715ZpkOnOI64EaulO0mN/6PRS+ysOo45CW59wwFwkaY23M4qp87P3gExII8hLMsg55hBy2f3PmdyVYgg1WF9OViwPBlWVhYbnpKEp2R4qFe7FyGgFryPRYK8WOVLPr5qESrB+XS08dkCM+QLw/zGCTjT5ltIqx4jatI4BwgEasbn52poUCnvKTB6lIIM8T0eXbdu4AgE+n9EqBYr+4bNqkvGlf5gANhC4gaoTh8Aj6DgNBn4qCF46QE3sIZH1v6iSJ0icRV0H3OoYGVuJWd3r/6eX9/usc5iYYG/AiJvk9BHFbqiB4OBdxxHqNOQrWIkfpiFGrbB0v9KB5h8lZ1fg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(66556008)(66946007)(66476007)(31686004)(956004)(2616005)(5660300002)(186003)(6486002)(36756003)(53546011)(31696002)(508600001)(52116002)(6666004)(38100700002)(26005)(38350700002)(110136005)(83380400001)(8676002)(54906003)(8936002)(4326008)(316002)(16576012)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3cf/8cz1a4cHJZSyPR/zbaLTBO+wyvNmuh5WIf5GKtgEtalrwaiPCpR1LvAQ?=
 =?us-ascii?Q?B0r6lK4qOHrRW9A0v6qFiQF8qVKzzP6MUa8J0USX8RyMk6H7Byr5JjeA9DOR?=
 =?us-ascii?Q?gjoh7iOI9ubRah2wt1HScHGOSOsa1DP6D1AUzP4glEbhvKkgB6baBGXk7pBO?=
 =?us-ascii?Q?tRflZ0YQtTFkEos+SCuq9w3sDgOU5g5WJkgWfpr/U2rinLNd8Jb59OLdImVa?=
 =?us-ascii?Q?Oq84X8J4dOBEe6xx6uK8v1k3xE7EfPtVqfVEvINly8+mWThbrQ3BWSGKf3sd?=
 =?us-ascii?Q?oMeEQZUxriRghsIXwPBSjnz3G4M4Ab/bhuyergRpGXCitYdnXOFFmT/15h3T?=
 =?us-ascii?Q?HeQwpH0qep7fKed8Du/xr8MCfFM2lc+2u5aUGV0l/yqh/CLITa2f6Z2eyEm7?=
 =?us-ascii?Q?3EPG2soF6DVhXSUD1LXlnlxlAIggeuiDHiGQ8h8/kQGO9LlH6kbdCBRY+KK/?=
 =?us-ascii?Q?/hO7ZQ5kI7Wx+Ct+E0XycFsgkQYgHX8WEVYBenFPFTilyplQNKWiix/XVIhR?=
 =?us-ascii?Q?UrH1As3ObSpsXbtRzoJIEJUbNmui+aBbwNNoYpYZAm27QoCbDkuztdkiIeIv?=
 =?us-ascii?Q?OtI7jqNwMS4PFGqWSudNZ1LTKqvBFMm1AndtN9KlB8zJ6/5Q48jlEotiNeqy?=
 =?us-ascii?Q?YuCKDTtBuXUMILwLPcUpezdsmBCwkpjRWmAKNVbVhLyVdl04W8+uunwIQWap?=
 =?us-ascii?Q?5eWIMIe8m7pvNLDzqGxK9Jp3Zr5aR/WcXEKJbuy0Qj4GDc77RyINz/Uagmf9?=
 =?us-ascii?Q?+HWJYhjBPEeQno6lAyC7XhZWSCYRi/bsUe2DCeTdiEH/kmEAOUrWZEyXF1os?=
 =?us-ascii?Q?0vhc84hAkfCLXod0oOa9UuK70rWunne620DU/3yRtk7mupyEVOp0XNFPT32p?=
 =?us-ascii?Q?692Zdc5upY2TWisaceeoYx4cjUk6bPH6NujciiUfDcf6Wlys0IW6WzACsHQ9?=
 =?us-ascii?Q?Xd5eb5BT764IEKuro/iANGl6pZIg7kvsABLvGKYhNHTX7qvgJAkQIET1H3P6?=
 =?us-ascii?Q?LWvnbDueJDwhIu+FzhKrvhbLqoFQQeuN+RiPm/DggCN3iEPZsmq5aTkhzhoY?=
 =?us-ascii?Q?zLLkqGFN117VIrdqZcBNxJpBccOD3OVFi8NeHiS+y3eknF3X4s5vx6VCCY7k?=
 =?us-ascii?Q?7P0ly8+j1cSRFVWZC+0wzU7P0vSBrlEcehOEna7A6kmq+WN0L2stKmaKB72R?=
 =?us-ascii?Q?ehjAL3uArMrSsh8szk7VAKlGJyIo6y44ilsyh/j8MyBHi4BY1cfAfr4kuc0O?=
 =?us-ascii?Q?OX0APRgwh2/K0wleWZOFQ373U/6xl45T1koUtUpK6Ec/3Y7qdIO/zZYt8vhK?=
 =?us-ascii?Q?FHa56DniQNtVw/hY4xvzUuEc?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 16ff637d-0ac5-45a6-d988-08d988aa3f2e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 09:18:23.6544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KzAf67bATG+FjBE8Ikcco+zNwe3+Qswt7y6nR8o1ui/9eJgSzOLint3jqIbe9J8DwomPoG2Up6kM8d89dDfEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 09:18:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156679

Hi Konrad,

Am 05.10.2021 um 21:29 schrieb Konrad Weihmann:
>=20
>=20
> On 05.10.21 21:17, Alexander Kanavin wrote:
>> On Tue, 5 Oct 2021 at 19:44, Stefan Herbrechtsmeier=20
>> <stefan.herbrechtsmeier-oss@weidmueller.com=20
>> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
>>
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 > A layer with thousands of recipes seems total=
ly intractable.
>>
>> =C2=A0=C2=A0=C2=A0 What is your concern? The high number of dependencies=
 or to handle it
>> =C2=A0=C2=A0=C2=A0 via OE?
>>
>>
>> Generating recipes with a tool means the tool will be custom and=20
>> non-standard, and chances of anyone outside of your company
>> understanding, using and contributing to it are rather small. There's=20
>> also the problem of needing multiple versions of the same thing for=20
>> different
>> consumer items, which oe doesn't easily support. The link Robert=20
>> provided already exposes some of the pain points with that approach.
>>
>> I tend to think the best way forward (or least painful at least) is to=20
>> gradually improve what there already is, which is the npm class
>> and devtool, and send patches to various upstream njs projects when=20
>> they're using outdated dependencies or otherwise need changing.
>>
>> Alex
>=20
> Just to chime in :-), I like to question this approach of having=20
> multiple versions of the same in an image.
> As already outlined npm is horrible in many ways, but using the lockfile=
=20
> approach multiplies that even more.
> But I tend to agree that using the currently available oe-core code=20
> would be suited best for a broader audience

But this audience loose the some basic features of OE (ex. version and=20
CVE check) and have to manual fix or ignore the licenses.

> - in your own layer you=20
> simply can do whatever you like.

But this make it impossible to share recipes. Why don't we create a=20
meta-nodejs with a different approach to avoid doing the same thing=20
multiple times.

> While personally I think in the long run, every npm dependency has to be=
=20
> provided as a recipe of its own (even I know the costs of that pretty=20
> well)... esp when CVE checking and basic packaging hygiene should be=20
> enforced.

Why should OE provide a solution with doesn't support this? I think this=20
is a main feature of OE.

> Nevertheless for oe-core I wouldn't want to change a lot right now, as=20
> there is simply a valid set of consumers missing that could enable us to=
=20
> do some proper testing. But yeah fixes/improvements for devtool are very=
=20
> welcome (also the available docu might need a touch)

My problem is that the current approach doesn't support the build of an=20
express or angular application. Does it makes sense to add this feature=20
if we know that some basic OE features are missing (CVE and version=20
check) and fixing bugs is a nightmare?

Regards
   Stefan

