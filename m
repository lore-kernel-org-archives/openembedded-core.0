Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2FDC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:37:48 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.70])
 by mx.groups.io with SMTP id smtpd.web09.3669.1637743067238207986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=Uya7LOJF;
 spf=pass (domain: outlook.com, ip: 40.92.66.70,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAqKeENdZwMIvFByI/0hWXdcOw+Z4nyHG4lA44V9vx8a3Ak6BKqcGx+epIt1UNwP95Xgtcg2brZMsrvMEakMexz9iK3M0a1vuj131Cy4Rq3WYfxdBLOXSjyBalZIUfB3eI8RpJJ2gC4LMPaQsnWKXbEN4sws+4hXPAE9DSFSUC4EluV4NGwceITCRopV2U9QdXl5b9k+ml81d5EXwppKfFsenUngJM0kFgCrfdW9s02EWw3R8MqAUpP5Ho+1Tzwj1gJfPKBU1KVL4/dC4LKShUYq9qZXJG7hr1sjxqKwGlFv1BMXEX2oomFwxiErAAMDeZXdW1Pa9l6zIk+vUoV+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ayXQvU3I0w04MWzRkoN72hVQ5Hhc0ClPg+UCdJirGk=;
 b=QMDtYH1cP1MPI7Yqoeea8rHkJk7In4Yp97EL1BY3r0IBneL1i0hXu21I9yWuUb3ZHX2Z372NB4J5fkxg3fm+8D6Oex7vXWphoWUxSkniHOfbUBa2beetGtVt0T4eayh/eUy4/NeKSsBPdAB5PxE2BNKPrOYSGoKc09BunnehYzwRx0eE7bKpY6fGB2c2Ar7X+SJqej9Zs3ucIn8XRnj9+LseXSRMp9cdrcKxaailFqUJqVIYuJBxd6PuhpZqZtywhv7aN39lr49bGvKVsmeD4X3RPnhbOTlW2Ju2gTgPCo29SZkrKiz9MhMA9BMUhoH767w7CmOF+7PHzpcJlZ2VgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ayXQvU3I0w04MWzRkoN72hVQ5Hhc0ClPg+UCdJirGk=;
 b=Uya7LOJFG1MX/1g443P5/EN62nwzZwZYs+7cy8orZvVDe71K3seRebboQnkwCfS3IdymtpZSHy7GBFH9joXqRv1iXMBMpFjQLuvYWQyIIramUuGCsN2vAipXyamf3nyLOrTcl+o8qh62NrhCK6Fet3pGgUZlm8PpcxJ6G2eLPeVQkZbZGBIB8nwi25jYcPdQWIUjumGOK0hCVcs9P/AEuTJEB84LgEVBYCYMN+B9e2DkIG+UiGoAD5TSM/vQly97MtWqv6r5+4PagWsHV4PII+ya+WOtgnzT1vARRbpWGNBnWHsZLncTevqFne+7arMrexmy/Uf7upZ69lyCE4b3IA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1889.eurprd09.prod.outlook.com (2603:10a6:200:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 08:37:44 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 08:37:44 +0000
Subject: Re: [OE-core] [PATCH 04/21] insane.bbclass: add a check that
 Upstream-Status patch tag is present and correctly formed
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
References: <20211124080828.530981-1-alex@linutronix.de>
 <20211124080828.530981-4-alex@linutronix.de>
 <AM9PR09MB464241613B5C4803BAFF9018A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANNYZj-eOy=xucEVL64qiOoGOv7UOROeD=EQXpE+a1hBP6_8HQ@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46426744D0BAA261DE461D9EA8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 24 Nov 2021 09:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj-eOy=xucEVL64qiOoGOv7UOROeD=EQXpE+a1hBP6_8HQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [OLewt/+Nwozvk9je3e8/R9mmzi9bmy3xI12ZHpgeW/QZExqX5XrCo68xiqxvt8sX]
X-ClientProxiedBy: AM0PR02CA0079.eurprd02.prod.outlook.com
 (2603:10a6:208:154::20) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <4641c23b-173a-cd4a-393f-685bb192f77f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM0PR02CA0079.eurprd02.prod.outlook.com (2603:10a6:208:154::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Wed, 24 Nov 2021 08:37:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc16322d-2d19-4d18-1ee9-08d9af25af8c
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1889:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gVBqbNIlASU0mIVhGU+WLtdnAD2koEglwsTAS4+WLHBXEZ9ATP0zpaIqAEgo44PzC1tgKWg1xQuZeJv63fCsg/9QETufjjfBJhZEvXlyPET4aWKMItP+kWlq4j0IF0eUxKvO9gel/vBML7OOSHBON8nqwo2dFPKcu6r4JEvC5s4JGzAZZ0uWCz9eVi/YMx+Gdb2ecYBd6vrDeZBMxhexCyAJObuDR/pOeqoEewRlqOlIq8Fq9Htw7rqFWR33Im9f9kL/jwim58f6i48p7BM5T6zWhyugSyPENizIRCcPCwLDjmJwFUNA5s9phxwChq1x156fy+UJpF6+IZ2UAoA0JnDMwMC+af0yuP8Z/m+BF54v4ays9vcDomZw+FMzcJtG06q5njWgmXBXMLd45+Rr/LanWZdIS2lBxBcnY3hef1IRnVxsA1cit9nL7oERjOnJOchLxrNbKSL8r7yOT78AMdGuVgGBijk2rJbN2rimxAMvUKnCGcwweQM23cK0EMiAEl1WL2MJX4M7gYvBgB/VT1J3AOGUF6EwpHfRKnoyFp3EyERaZGhUuewubx3wsUqAkxgJWpVjApZTUgQEJg1R6A==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zOpdbdWFUp2J+Lgk+1WplsWflYiqCUYkWhmWGLkRCznfUxLAUDZComi7P+b9cp57UytZfFgiT9VD2oFLcicH8Ug7PGH2OJHduadnzfGnsgSIYtpn+0Zcl3npXvLzV4Ik6aQwMjSFvRW0pqO6FgdhN9n2LlBn1aFjNVKmPleQQQr5cjlU1CKBn0xmCxHU4bUG/HVqRQJkyWd7rnZclNbDwD2lmPCd19W2wkP2Dahnc0mlOmgBTmivjXaA/uDvTQHZZCgeSuZ34J+Ar0DpXDCH4LLFgsHzgR89QiW/J3+BU7wn9G73X05bV8xdgyVHO4PFcaWPaeHjoitYdKLZuxFoduAyt8KVxNoQpl8cCTf2Py9x9nn6nO/TcplkokB7qnPhRYzKue0gigWA2R7+U218YWOdopQkSY2EWI99oB1V6eZyurvZnt59E6JuijXjHqQLEoq4YlVzZdzH5tOBrGEvVhjtCxLSLdgun9d5CBqRB68x7K2DSYW4A5oYuUiipy8bhmhT0AX0UBDY4bWVJS+z27IPkB2qel3U+MFHNm0KOlpPAb2rfYZvBRMCQQauiiynX3oJ0uBNF30AsWrIuAHNE/YPruRxsZRgYyDNRNMLRS81Le+xHckIX+DqKWv4dj+MTLF7ohMZcGxyl6FjPxEPvGQjgrB/geqKwRFLz8MyYsdjiCLjkjIOmx77FCYhxEzDF75KEli67/SAuXRtD14Hd8+45xaIxbvO4msHA/MJKUYHduYlC16WYwYoODxShoSdLi/GpEmxBux2q2mnZAFthQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc16322d-2d19-4d18-1ee9-08d9af25af8c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 08:37:44.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1889
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:37:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158681



On 24.11.21 09:30, Alexander Kanavin wrote:
> On Wed, 24 Nov 2021 at 09:19, Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0# skip patches not in oe-core
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if '/meta/' not in fullpath:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue
>=20
>     Can we have that configurable please?
>     This is somehow a hardcoded assumption I don't really like.
>     Maybe it's worth a shot to match it against BBFILE_PATTERN_core...
>=20
>=20
> Sure, I can adjust this.

Just a thought - it's maybe worth disabling the skip of the core layer=20
on AB while patchwork isn't really in a good state to catch such stuff

>=20
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if not match_strict:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if match_kinda:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error("=
Malformed Upstream-Status in
>     patch\n%s\nPlease correct according to %s :\n%s" % (fullpath,
>     guidelines, match_kinda.group(0)))
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error("=
Missing Upstream-Status in
>     patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
>=20
>     Why is there such a fuzzy (kinda) pattern? - IMO the strict pattern
>     should be enough, stating Malformed or missing - both cases are equal=
ly
>     wrong, aren't they?
>=20
>=20
> It's to give a more precise diagnostic. If the line is present but=20
> malformed, it helps to say that and print it; if it's missing, there is=20
> nothing to print.

Makes sense

>=20
> Alex
>=20

