Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D3FC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 15:34:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.19])
 by mx.groups.io with SMTP id smtpd.web12.11212.1633361677724229771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 08:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=FBE1v2Ci;
 spf=pass (domain: outlook.com, ip: 40.92.66.19,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyKkRj9+tzSHvwJTydzyoE8887CZODJC4F4uHTilkmje1M9/G7G3ax6URJeobT8jFs5qveiT49I1B1PXNiE0B20CqFDITkLB/aRHWXlrhV9PPmkKAqGePLuo5xInBTbofDOXaJzKSfoiW8rjZe7G4uM4le9STm7UaVAVIFthE90L9lyMJzeATTsqybdOMy2J3mRtfN2pIcLgtrBHVMHywHuCI9pTpu5z/PTAm3Rl1aa5cVDCw9WEZIjrWI0/onmu4xhObKuV0qnoxDl++MSxzCzd7y4jnKORFq1jBENDtmJLYZb9Bh3v2zu73xm6m8yUauz7IROZyBe+ITeKmq5J/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg5F4EXjVQZOOVvIVqIldd6+EMDAZaJzhAxamj8EvBQ=;
 b=CHwZAI1cl3tuyYoG6EEzuip2vyyQJsKdF1UjncvaWQjQouQMmghXOElWbtMKKZggmo59xEUrajkX5UHw1C5BmF4KT1NjqfClvqtsDIP9Ug2IdnY8Gu6xwTdzvjkNSsNYTF6z0xHjlcxM/Hi4T6HBOMNs7ybq1fH5xFqNMkVFLZTMVl3Ljm0PkuEnV+7nT3SOovYjojh8eQszoOY6ePLzKHJJKBc6rnymgb18qIRW5REPG6B1tc2o6Pb3QO2jPK8bL1fR779s91z8te3e96SA48VpKJkb2j2x0ohSstR+Iq84BzUaBQNGYW3ftSya1zRKqxX5b/B+hsLuVpcXkPGM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg5F4EXjVQZOOVvIVqIldd6+EMDAZaJzhAxamj8EvBQ=;
 b=FBE1v2CiAoCFQLhmC8/NiQBxb4IxwaiY1V4zcavfDKZ5guWDZnhiNAvj9NqL6KA5e/Ts0ejuz7oWGqpCbajOPbH6NjhMBXF8GNJrjOycvlxCAMjVe7+oCcT5xKz7R3agmF1YAlY3bRVEFgcUKtB5qUyqUMf0qk9eqaYKXvO9jCHNUj91UHcr6qTBJmsQ+S7P42OQzmv+6/3duYxAXAtgdOtceojXl9Sy5zZ/F0GcmlXG3F9I+nTzovfsjet5+x3lYD4F8NNJYECmy8YsV8TKN3SyI6bDqdQL+VHBF/mzCuG3QUMzSb7zG2Ho/dRVjIN251ye75ndY0pL9AIutz+obA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4292.eurprd09.prod.outlook.com (2603:10a6:20b:164::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 4 Oct
 2021 15:34:35 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 15:34:34 +0000
Subject: Re: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS
To: Martin Jansa <martin.jansa@gmail.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20211004132853.30543-1-kweihmann@outlook.com>
 <AM9PR09MB46421376B722A7A7A315BC8CA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <2d32793c8dbc47a0afced79d07377812@axis.com>
 <AM9PR09MB4642623841A0B2B3EDDE44D2A8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CA+chaQdjdwmsiSnyVsegyfEG192mVrBdyX0ayrQ7L==f24ypRQ@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46423E6D87FF5875BFE4334FA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 4 Oct 2021 17:34:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CA+chaQdjdwmsiSnyVsegyfEG192mVrBdyX0ayrQ7L==f24ypRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [a+a//oqTRy367XsjVp108ZGZyvfCK8JJ]
X-ClientProxiedBy: AM8P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::8) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <127efd6f-02e1-ded3-e488-168a76ceb9d3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.43.125] (46.114.34.242) by
 AM8P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::8) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Mon, 4 Oct 2021 15:34:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77907300-7d0e-4fee-672b-08d9874c77d1
X-MS-TrafficTypeDiagnostic: AM0PR09MB4292:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k1vnMGvNmAkWj+BAOFG3vOhpLiVwOxklAUs7nAagIv/VU1qBYwYDS06U1zpCvAAR/vHcfwPUTuMpApygG5HKqJZa5qNdz7D9VTourmPiYmX8iAITFki2HmCJbID3KZ3jpiJ8ufz0izcQRH3x7iXIL6eEYLg0gbXbobJ56gWszucRupnfVO8uE3AwZutj6HxvtPHZtXTIpvWca0IrtXWiOZ6wWr/8j250iPkfWImQPefajLFcR+PsWTG0lLRUOdfddNREyep5KyEah1PZ0sgSgKDt3K4yhGdjK+rs3nGKYIpMRZ/0J4vD7tA5qaAnJJWvO8SpYjE9n80YAer1gf2NIc72tdYgNQcq/qmv20UqDB2xuMKxZa0qgLut/tybFDtsHB7wVLNYGXi+QvOkf72fWQN2awATA9L4ur6+HaEDx+geQneu8vAHn1NBj1Y7ct7/gCxhUvfUlT9Evz1L+cWr46llXjcr+QnpsRO5CNwKhYpI05ltbG71nK5L6iWFDnA1O8HOgYruEaOQC9laRwdffw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	h0VSz/Fq90+z0Nlnjk6NehwmvKAeMeFYwAdNIB8GPhee3sAgCYP4LozmdUoaTM1dWLIlVTLbFo6DN4vjhTu4k08ZkC6o1ZQsTNaTVin0BTF8BhdBztU9TgVKSUTdwOffGytJbKapW5SMWiYUq7xytw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77907300-7d0e-4fee-672b-08d9874c77d1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 15:34:34.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4292
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 15:34:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156613



On 04.10.21 17:29, Martin Jansa wrote:
>  > Still this is very prone to errors, so I personally rather have a=20
> space=C2=A0too much than to few (esp. as the else clause doesn't add a sp=
ace).
>=20
> The missing space in else clause is often intentional in cases like=20
> this, so that the append has no impact on value when not enabled=20
> with=C2=A0GTKDOC_ENABLED. Why should it add useless space when not enable=
d?=20
> Just for the possibility of someone adding something to else clause=20
> without leading space there?

Partly yes, I found those conditionals rather hard to review, esp. for=20
more complex scenarios, so I kind of would suggest to add the mandatory=20
space for the append operation all the time and add no additional space=20
in the stuff that is popping out of the conditional computation.

But I'm also fine with dropping the last 2 patches of the series.
Only the first patch solves a real world issue... the remaining two were=20
just a result of a linter scan

>=20
> On Mon, Oct 4, 2021 at 5:14 PM Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>=20
>=20
>     On 04.10.21 17:08, Peter Kjellerstedt wrote:
>      >> -----Original Message-----
>      >> From: openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org> <openembedded-
>      >> core@lists.openembedded.org
>     <mailto:core@lists.openembedded.org>> On Behalf Of Konrad Weihmann
>      >> Sent: den 4 oktober 2021 15:29
>      >> To: openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>      >> Cc: Konrad Weihmann <kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>>
>      >> Subject: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS
>      >>
>      >> fix the append with a leading blank, otherwise this messes up
>      >> DEPENDS when globally inherited classes add dependecies of their =
own
>      >>
>      >> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>>
>      >> ---
>      >>=C2=A0 =C2=A0meta/recipes-core/glib-2.0/glib.inc | 2 +-
>      >>=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>      >>
>      >> diff --git a/meta/recipes-core/glib-2.0/glib.inc
>     b/meta/recipes-core/glib-
>      >> 2.0/glib.inc
>      >> index a34776b083..3436645f15 100644
>      >> --- a/meta/recipes-core/glib-2.0/glib.inc
>      >> +++ b/meta/recipes-core/glib-2.0/glib.inc
>      >> @@ -30,7 +30,7 @@ LEAD_SONAME =3D "libglib-2.0.*"
>      >>
>      >>=C2=A0 =C2=A0inherit meson gettext gtk-doc pkgconfig ptest-gnome
>     upstream-version-is-
>      >> even bash-completion gio-module-cache manpages
>      >>
>      >> -DEPENDS:append:class-target =3D "${@' gtk-doc' if
>     d.getVar('GTKDOC_ENABLED') =3D=3D 'True' else ''}"
>      >> +DEPENDS:append:class-target =3D " ${@' gtk-doc' if
>     d.getVar('GTKDOC_ENABLED') =3D=3D 'True' else ''}"
>      >
>      > This change is not needed as there already is a space inside
>      > the if statement (in ' gtk-doc').
>=20
>     Still this is very prone to errors, so I personally rather have a spa=
ce
>     too much than to few (esp. as the else clause doesn't add a space).
>=20
>     IHMO it should be for readability purpose rather " ${@'gtk-doc' if
>     d.getVar('GTKDOC_ENABLED') =3D=3D 'True' else ''}" than like it is no=
w -
>     but
>     that's just cosmetics and I'm sure one could discuss about that a lot
>=20
>      >
>      >>
>      >>=C2=A0 =C2=A0GTKDOC_MESON_OPTION =3D "gtk_doc"
>      >>
>      >> --
>      >> 2.25.1
>      >
>      > //Peter
>      >
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#156611):
>     https://lists.openembedded.org/g/openembedded-core/message/156611
>     <https://lists.openembedded.org/g/openembedded-core/message/156611>
>     Mute This Topic: https://lists.openembedded.org/mt/86066304/3617156
>     <https://lists.openembedded.org/mt/86066304/3617156>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [Martin.Jansa@gmail.com <mailto:Martin.Jansa@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

