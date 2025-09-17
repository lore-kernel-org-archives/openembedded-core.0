Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA466CAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 09:24:41 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.37])
 by mx.groups.io with SMTP id smtpd.web10.18575.1758101078659490482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 02:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=liJ7Fa9p;
 spf=pass (domain: cherry.de, ip: 52.101.83.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By85CzH9C5fUir7OD0w/dbtoK37VN7WT7Q0TZRF3MMobe5Cu73+VRqVNqEPp3W6CZluvhnGRDpcyYJ+k2+SL7X8/l6oeFm/9RPkR7y2W5dsi5cNrk5W3hz3X6W5MT1Y6dPK5BcJyJDfVIVhdBMEANDaBwnocmPCHjFFrPRwhzXjBqH6V92Z7lI/UHyguS6pKDsjZ6JLkp1V5nRkgqGjha930izVCSHaMn/yjOnP6xoJWEyCQWDV+IfI779pwxvUO8CtOw8nqWAuzNJHqqa0z5wbXOf6v2jZkSHELSWtFmG3VzXd0n4XV0S9xWCXK1lYao8lkpDNzvrqHf3hE5Mb62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbbBt+BtzSOTclWUYdNDe1ep9O0BnpVk4Op+0VeSYqE=;
 b=nIow0PPT3xZXW0yvYtH9wr96Qz3cAHZZff8Y5GChl/emCJZ+Mp2JpgYU7ephwOvVyNiiChorkABQi6gRewS8aUQLyfml7NBZakKd0wjjMSFjAdM2e/KCDT3Pcp6ltY9vEppkZZ90BMaQwXyatFeU4zsa0dyiv5PWieinuJP2476O0aJlwA9PXDjYGV0OzS4XzHbkAbVajtXwVIOGaclSPdZFl78GUQCIBfZg6fONsQSw0eU0b3zqp0ml+fX0I5u0YxCvFTUUrMWOdUdINgttufvyHuoaZublcEiBABEmbR0otRQ3bXsZ/rbRnN1tMN6HhdlI08QVNQwOFC51tyiJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbbBt+BtzSOTclWUYdNDe1ep9O0BnpVk4Op+0VeSYqE=;
 b=liJ7Fa9psm+dPjxZupe0gef5CII/PKzSKZxjsl3wFt5v29Q4N4I493sBC0A0N34imAt0YDFQKYHtWjP8UJhyT0+NOw5JoTY9m946oSG9lWnNYUwHtP1e9NxByPQ9py7x7WWPD6wlVfPKMWaS/rKKdd2Coq5pUyGZCCfwIzkKA60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8564.eurprd04.prod.outlook.com (2603:10a6:20b:423::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 09:24:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 09:24:33 +0000
Message-ID: <d1df751b-3937-40d6-9546-0efee512706f@cherry.de>
Date: Wed, 17 Sep 2025 11:24:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO #15965]
To: Barne Carstensen <barne.carstensen@danfoss.com>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
 <1865C555FCF7D165.11775@lists.openembedded.org> <aMlo-hknGOEJqrGP@nuoska>
 <DB9PR01MB721006FC2064A4FF2F7AA6288717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
 <b26fc568-4afe-4de1-be63-2f53e3468617@cherry.de>
 <DB9PR01MB72102C7EF8F8862F583523158717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
Content-Language: en-US
CC: Mikko Rapeli <mikko.rapeli@linaro.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Randy MacLeod <randy.macleod@windriver.com>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DB9PR01MB72102C7EF8F8862F583523158717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA2P291CA0030.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::26) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b2899f-a1e2-4f10-cc29-08ddf5cc02db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7jGVzlcqSX/J1eL/7+os4LPrVVYBF8BvhQqI70Rk2PoPI2+A6jzG9EzLwPT1?=
 =?us-ascii?Q?hV9Efe+a0GG0/+6j8B7e4IFCfRhQeMmuPtePLFsJXXoT2PbEqzGsdApTA1yy?=
 =?us-ascii?Q?xc1WpWWr8tTznPqSANUKFwFFJDw3kj6IJ7P7ckdDNduvAdqfd0VZ8I+Urmkw?=
 =?us-ascii?Q?+1yna6asmy/wMxLw23SQZf0bUcgEsh2MMzfm8HRD2sn7hNPfHwIkpFCRlbWV?=
 =?us-ascii?Q?F2/7VtLUHq4Vh4n0O5uYTalUZzhagMxPWfpOk68dG4XXIwgZc8pk7Ln4+uo3?=
 =?us-ascii?Q?UCQBU9cyawGrk/Y43T/r8FNvPmGwNRkV5R4w5yrFZX94JhXsFMGu9RBSWqdC?=
 =?us-ascii?Q?VLMxgqQwuBhXwIcJIviAD5chzORRhxAvVVLvIU45TZZKOCCCsOI0ryipxrvM?=
 =?us-ascii?Q?eF3N4BToqOarx5gwyUyicUZmzk+IF3FRpjjrqooZxeafNU9JPlU0AChfN95G?=
 =?us-ascii?Q?FF7RT1s9f3enZHnU7yGkSmtzoHbE0k5LPbWk+A4at8K8KO+MaGWxG8IpwIol?=
 =?us-ascii?Q?K/SYxPhuLKtL7CF1KQm542x7KIOIHOJaaXz259zHyUrRyQ5IThmNq1Omm1Rw?=
 =?us-ascii?Q?7Lkq0ZYPsNSSQlU5Mf6cIPjFZio8Day2r4JY/VcxJUCcZrEF5mP0TO0cVA4k?=
 =?us-ascii?Q?yvqecFYHqXURGrYTEzd+ppWFqtjePVNTbHnZVCIE1b3r5dj6W1N5R8pxFlIx?=
 =?us-ascii?Q?LEJO69Q6hhOxlLmCFFNe/Dr803UiItdzqlM5Jhvf6oojCGbJQBgsfxS6VcnM?=
 =?us-ascii?Q?PKXq1hZ+v9fDEXgVcOQOvVKRrXY5AFhg/thxVi3B4f06bMsKL8ik+T5do+T+?=
 =?us-ascii?Q?D9MIQ/CF/lmn4tK00F/FfNMiqBiFhGwb9SKX+T7HMLGAgjMUigb6KbcCCbbl?=
 =?us-ascii?Q?FqFuBC1rKxyXamQSoiInKYaWYVh0kuEKcflCfI/iOnuxpvx9bVjZ5dEn5I1l?=
 =?us-ascii?Q?ZK8fkWPqtAtIOqUGtCQ8XYGi5GQ44hiSk/uixGxKVQbVqfS/4m44UCaN9L6X?=
 =?us-ascii?Q?QkYcOZL94VGFw5h+DdqQf9pZNGXIR8pjNS2tjKrAubWndzrA3MGjF4EEmZ/a?=
 =?us-ascii?Q?b1sl858x6/UO7U1fY+vUbr+K1hvBnxT5q0El8R+4HJtGxzVu+tGNg7swkwga?=
 =?us-ascii?Q?AF59NxTJUTSalNRV0ouXmZZATZVYJDNNtCQCNDhFUk3BiMtN0vfKlzaKRYi1?=
 =?us-ascii?Q?IlRLp1xUwuyPl/xf8bB3pEP4hxIizTGapr3yzIr+w1vSvKO/vwEZm1XjE8O9?=
 =?us-ascii?Q?xfVdUg1+jocbXi2SCkCBjkZlofNKGW9LFWansh27G9Y3ui5GgmJhdXx/VJAI?=
 =?us-ascii?Q?/RGTA1RYzSnz0SfEokN24dafFTBZyQPl6Gl2Nt+crrOUjtLyvuoRuYhtWxsf?=
 =?us-ascii?Q?bukhOYw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4vhYFovAsXbyryR6mqhRSzog0+hh7cC9WGqYhPilsjbXo35NpgH2DS/qHUk+?=
 =?us-ascii?Q?sq7y56ZcI1CPwO00dr70br/HPlZ7w27HAnvAnTtj9ZgGQgxfrE++Rp757thq?=
 =?us-ascii?Q?zgY91TrjrBvM9741TuPyT42nEBCA0uzD0pTndbaLPXD0z5///sq3BDLT0RZl?=
 =?us-ascii?Q?3XR5HejjnU3tG48N5BYC8Qps6IZAqovh+iuZg+xkbC1TkYNT2Xy/y9bfSjzJ?=
 =?us-ascii?Q?yDJc31MtT2JOWvW1MMcv74GVy4vwRxKjbtC9DxOozjk/cFymY8RdEzapDRVR?=
 =?us-ascii?Q?dc91GC8qrJGgMQh/aMUWXObMKv3+j7Q2+AvQMyMUhGoprhHx2IfCbjjc+046?=
 =?us-ascii?Q?Fsn8Fj0rdRlC1upqSDLKIqn3B7z6z1mjW3twyEmwAYfr7cqCsRP+yPf6MczW?=
 =?us-ascii?Q?2fAqG8DjTOEO8gM0w4PXCyLnTRJP1Jdxuc/MOrN2NT1zMS9MDLrUEfJq6nWn?=
 =?us-ascii?Q?Uuht+wFpCQn8BWZ7jz79mi+A/02wZIsbJ9tLNolmvsWzdhGaWrEn2c/lPB9X?=
 =?us-ascii?Q?owzPoNBRgJPaIlPMhbpE5qKn/5NXtr5WlqrWNQu0+O9Oy7TE/3/h049Vz6qf?=
 =?us-ascii?Q?gjU9pkCjNdYLMt4kmh7fhzZdKUMfs1bp7657x+w8zJLL3xQAHpTHrQTICWHb?=
 =?us-ascii?Q?qBueKMCx9eak4z1gvRNzhTiMps+lrX9ff29PlnJ3fLvrQXu7CwBpEp2Enogw?=
 =?us-ascii?Q?hLT9mPVuxPPUcvfrxSaWqW89BeExvfmKqFSCzBeRVwgehxc1lBHsoB1+8ANe?=
 =?us-ascii?Q?aP68F9N/1vEHPBxhPuCPclxh0E/6LvMVtaVEkRwB1ZjE3Z/lh14ecIefIznQ?=
 =?us-ascii?Q?hoB6ssx0e50FrL+UHCFZyVLWLGAyrrSlLws3jiHJa/bWFvocKdfkUA85cPaK?=
 =?us-ascii?Q?VHpC656fyxyal1A1DIgFjE+s16rFSR+2iguKMe1zJgXJxtj4WK7/eEMenHzH?=
 =?us-ascii?Q?8CYqnT+eVIa7MDo0m1bEz6wpGdxPzUsAl603L9mJWwFi/5XGD9OEbz26Qbln?=
 =?us-ascii?Q?8uSR9K3a0hBjDy5xqNhE67b3wSej8ctRKmVinECFzTSN5AUoZcgKVGYHTrTP?=
 =?us-ascii?Q?squAMF6KfoWcvVfShXUa3Wdu1lzTw5tLS6RUG1lYmGbQMesLoo3pg8K3OQXg?=
 =?us-ascii?Q?vePNJqppWo8Phfa8EyhEkq+sd9AuyW8pfQb1dCcokpRm7DPMlujZclX5ueNT?=
 =?us-ascii?Q?u0vIvkFpfy5jctC40wthvTy/2tiL82lZSPEC8xKMAGv22yCOpJ+WNHaoBpxG?=
 =?us-ascii?Q?Amn3Pxo2/f2s0qJX5XvjNoNinJYGovntj5IWgc3w5pQQPBPD7HGe+HzP8MSM?=
 =?us-ascii?Q?S2m7PYEYdQJNHPjBh6xIw5AlouwRlJ8z1xAD3RV/HNvocTPhAFrE7WEHgYs9?=
 =?us-ascii?Q?BCQpaD68w3mu95RSRqZKt+r3GHprFw0dEpT6PATZ3iQcRNTzcWnTa9paOp5U?=
 =?us-ascii?Q?yGUa53aIrjaFhreF5p5CBni0ESgto5yp1ZVFmCVcBhhwTU2NQO+eItrmBPoG?=
 =?us-ascii?Q?pUxt6CSPQyT95RkkguAkt623MHnDRIHnBt2RyCO/oR/x94zev0nxD9F7C+7h?=
 =?us-ascii?Q?XDiJccdOG9iQMplDyQlLmUj9nSmRUQVusdCcnA2GUFgSgqqPLqI44kpwBNEI?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b2899f-a1e2-4f10-cc29-08ddf5cc02db
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:24:32.9584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ELVdcVWeMsI/etOeQM93YDSphZ4uuivaN8IwpeQatL/4viHon0wcXX10eM4V9gA+RKutmmwx15tGlOjnyULMPwUA6GJAvGDHOu+NVCde7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8564
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 09:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223587

Hi Barne,

Please always use "Reply all" when answering messages on the mailing=20
list. I'm re-adding everybody in this mail :)

It serves for archiving purposes but also offers people the ability to=20
correct me (or any other recipient) as well as providing additional=20
context, etc...

On 9/17/25 11:12 AM, Barne Carstensen wrote:
> Hi Quentin,
>=20
> I guess I was missing the information that the first line of the commit m=
essage will be the subject and afterwards follows the "detailed description=
". Having that in mind I would go with your second or third suggestion:
>=20
>> """
>> single-line summary
>>
>> Fixes [YOCTO #bug-id]
>>
>> detailed description of change
>> """
>>
>> or
>>
>> """
>> single-line summary
>>
>> detailed description of change
>>
>> Fixes [YOCTO #bug-id]
>> """
>=20
> But that would still not clarify how the subject should look like.
>=20

In the same section a few items above in the list we have:

"""
You should prefix this short description with the recipe name (if=20
changing a recipe), or else with the short form path to the file being=20
changed.
"""

Did you skim over it unknowingly? Is it too verbose? Not clear enough?=20
Would some example help?

It's good to try to be in the shoes of someone who's not used to the=20
process, hence why I'm asking a bunch of questions so we have some idea=20
how to better formulate this section of the docs :)

>> 5.3 is not out yet, so I would say not specifying the branch is fine as =
that would be master. We're very late in the cycle though, so not guarantee=
d it'll make it in time for the release (but >may be a candidate for backpo=
rting. I'll let Mikko provide background on why they thought it isn't for m=
aster (did you (Barne) try pulling master and applying your patch on top of=
 current >master?)
>=20
> Yes, the patch was made on top of the latest master commit "ba3bd832e810b=
fb96bfa6fcd52710de185dbee22 overlayfs: Disable renaming of network interfac=
es"
>=20
> So, is there anything left I am asked to do? Is changing the commit messa=
ge now enough, to update the subject, or is there more I should do? =F0=9F=
=98=8A

You can either send the v2 with a proper commit title already or wait a=20
bit for Mikko to provide feedback in the next few days on why they=20
thought this would be targeting older releases, up to you!

Please don't forget to have the v2 in the mail subject, see=20
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#taking-=
patch-review-into-account

Again, do not hesitate to provide feedback on how we could improve the=20
documentation for the contribution process (or any other part :) ). Feel=20
free to contribute to the yocto-docs as well directly=20
(https://git.yoctoproject.org/yocto-docs/).

Looking forward to your patch(es)!

Quentin

