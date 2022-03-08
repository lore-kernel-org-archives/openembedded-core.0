Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC63C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 07:40:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.39])
 by mx.groups.io with SMTP id smtpd.web09.5909.1646725241644247548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 23:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=TeX5hw9k;
 spf=pass (domain: outlook.com, ip: 40.92.90.39,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ent9ihP7NEfddx6jVQgasSbuDZ9C2Qt/7Bpurtobfit0EUgWNw6eLgs636JqflK/9GpxnN3KDrgfXhVCdf2bLj2DznjMKGpdCh/pH5NYxEfppPSkfRKNk2uILy9sybSU0tm20WNhePt90QdpFfVRdU2n5RiZqkaWQGwjN9oknZmFQFfRzzgsWX2KOJ4ffdDKlkpFrAkqDf/7w+ElFQlj9byZq9TC2UnEdHQIBcOa32M6o+/Zevv+rNuafuIkyTSDqf21BbeTEbMpOpUp2mmlWP8wh5DpMkCGyRnWLNma8ISSG6pXjBzxWkZOqw8sC6t8S6hsPPpx7F+W7FsFAIffBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HS+tt0jcw/l0AMSrnQtl9QMflal7U7sFP7bwIdsOXWg=;
 b=M6UwbsCt6HUEoVjzQ+I9w3rvuI1Urc7sqr2oxHtiktyTluR4VWsQu0u/+9ibbz21iU527yhJnfVgL5vuQxMqpTzcA7KzK02mqZ4gZNtOA0MvzJDDjJ+d4pO7riczWejE8k1GEMJkO5Dp0VxnmpBAQAyAJ7pkmMGeqFSveDrVxjeVkDkLXGoNf/w4kiNOHqWU3Xp3b8cS1hwaqEGwULoHMS4EMihzyr9gVK0o2ClnFkJbEhITTP+M0FHwkRrLDVTRK1alHqjUr77b6lhQ4/Kcf12DEDpWuG0noYkpFUCZAOF+oIsRe4BB6OcLf07I4JEFsVmumDn1+zX94Wlyt7q5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS+tt0jcw/l0AMSrnQtl9QMflal7U7sFP7bwIdsOXWg=;
 b=TeX5hw9k/CmotjRiAAec/yYYErTzspe3yaL3bLfplInG8KqgqKmVi0p2xIRP/FlFJj6e5sJ+T8k5m0cWUR/uWgj1villTIw7GLmUnmsuumVUvlL99gWMy4JcdNRe8OWCkz25dapMW+5yNiNobGlGbcq1JBQRwm0d9kqp86XvE/DqZ5whaMZYjC89EuS7MLKrO8blkWS//kqlTVbg1bNQcJQb2UMY5dBrxWcg7ynARIWQWGxTqZPxb8oSAP7HDyl7wDDuKi/aRZwv51ZT0n4qShVZrWp5N2NPNEVSze5lj+RzSRrLGkyPLywR5h7Cqh0Jx7HuxKE5FolrdMRRCvNeSQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by VI1PR09MB2350.eurprd09.prod.outlook.com (2603:10a6:803:85::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 07:40:38 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 07:40:38 +0000
Message-ID: 
 <AM9PR09MB4642625B1CC2A410991DCF3AA8099@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 8 Mar 2022 08:40:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/4] pip_install_wheel: don't lazy assign
 PIPINSTALLARGS
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
CC: openembedded-core@lists.openembedded.org
References: <20220307194236.3837684-1-ross.burton@arm.com>
 <AM9PR09MB4642242FEC1B96DD9711A1C8A8089@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTt9RmJY4ab8NOk7s-UDXg+fLV3=VxWfAqFP_0ygVKsN-g@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAAnfSTt9RmJY4ab8NOk7s-UDXg+fLV3=VxWfAqFP_0ygVKsN-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TMN: [QIdxE9QNiFXJNnDK9ZW5OlAfsif3yRdkiAyAeefHURvi8ao3edE+SSvvQvwz3RQY]
X-ClientProxiedBy: AM6PR0502CA0061.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::38) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <dbb0c826-4c9c-7dbd-22f6-0d36c5646ccd@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 722ec810-8365-4733-fa5c-08da00d6f02d
X-MS-TrafficTypeDiagnostic: VI1PR09MB2350:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hD39uzFUNvgxs8ezw2DBaa3P5x5PDXyX1pjMC1T8igRdOutkBSkP5A7kWRwd5TvHuvEh9o8S6X51zKVJk0Zb9BUboff7bkdNf89/MWtEfg1SSkSW0zxUjHBitiJ+YUhuTcqN6eJxFB2GB26bWqu6gSayDxcieaVrJ604YZrydosyGQ93LFP7ByjbSQNTrPSrvBvuIClOYN/NBc+VJCBHi1NHtF0nax4b+7WgycflnoxqjytVgyge2ekFiUftolrHjvD8vNjKLoFRtCqKPZ+SODCHhynWoi9FGSHByY6Fo9OG8mm3aDd1/axR6p1WpggHMWey/rfLG7RL0XDFNqawxyq+oj6ECwT4WVWwRJIweqSLJ291X2dMjJpUeANe1/BjBvkicK5fwcnH8uNYlwyfAtijDTYlDNZICGnsPHkvzsIqM3aiYCgar4lEROrvbKPLGD5ibabqe0SS6jLn1J+ak3vSfpWZoD2RKVW/uPLt/AWgSIAeplWI8PaipssMp+QcxcoDFpwDwUuKif5raVFJn/eg16VU7v9WPz4qOIQV7eCvMDVrxCUn6NIAMRE1YItxkiL3N7ufNY6OTgJGw3PZU25bTgri8yl5kvYcgdO3+6jOgQLQUGY4Tw3PU6c5PJyEXsVeG/F+ek7A+n8i6hMGXHxXdY5fhHG/3rsA5vWAmAg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ce6bqkXOdD8+CTRL4bM+9ds3IK2yQQ/nR6neDN2JkrBpvIs8PGDP8kw6w2ca?=
 =?us-ascii?Q?LLgjnlJFhKHu283+LTxsbjWxcFpkoe9KEFfuPfnTqjhLI/fHTcchN69IOrF1?=
 =?us-ascii?Q?jmCPynpRdKhN6Dwlh91q+vu0NYdWM6RngKalSr4a2sUA6OUiuPAhgnnM58Y9?=
 =?us-ascii?Q?px+DYV/FptpbdQVo00eIJOOaH+DQ2CWuDYNhw2KXcjfL5LMSL8KwAt+jhH4y?=
 =?us-ascii?Q?xOB21DNewermor7CkPjlYc/rDJmwhOQmG6ps7/lhxYNP25JAO+ZYWJO5LIHj?=
 =?us-ascii?Q?PapypepUG1ntIO8ua963iseRfRdPOp02VQvDp22d4hFpZeUmT39wkCsT+vTi?=
 =?us-ascii?Q?V0WpZb1eKEdCP2ddIW7d1wke6YOKOphnRt9PCfeSSLLyh0hWvS09Gcbgw7Sh?=
 =?us-ascii?Q?3LQDJPvxqu61Q0UKh6WBzWXUDA5rFv26ZduPxh6tIcJ02OSkYG6VASzZ/OvK?=
 =?us-ascii?Q?Np7XER2cG7B2eGuVMbgC4rAsqm0qrgXd0hrFWSqH77BV51h17lA7xqPDQ24e?=
 =?us-ascii?Q?a4YdSWcr9YQz4KzpVL5fuq2MzrtiEMAZa9rzMTXfGlAg+eT23mXicasjkGGY?=
 =?us-ascii?Q?bfTPn1gjajYi3yQee0eZTOq4/E26UPiOOeA4kQLrMGswjwhZRyTci4Zf/83F?=
 =?us-ascii?Q?os9EzDRJb2sr3ulOXFaDzfULrepcE0cdViv8Ax2YN4maYEJdAf0VJXy8EKkI?=
 =?us-ascii?Q?ID1ZXOSLFKhtEsyiuRRlQ4c3qHT9odFCyO0X64BqJZQ0hmWM3ScLt8DtZvhs?=
 =?us-ascii?Q?b6/yn+n+aQkAe5ZWkQx5VCop3d9wsNP9khLKrFu3PY3nugfzBD9ENV/u17ta?=
 =?us-ascii?Q?BG8dETgwaLp6r0K+UviQVx+Y4vn/ay3YF1RzRTVhGuzz0pnlDYtTKK14gsWX?=
 =?us-ascii?Q?eGN+xql//SEvIrFi/zWmkgt1y+n8zRXHHyIltwroexxxDekKeUGrzNlpEcgW?=
 =?us-ascii?Q?B9L8R5j6u84ZH1Zz+/8hApYEozAZxUDKSLa0rWE4Yr5VgE0+x9FBmwuCTc4C?=
 =?us-ascii?Q?+ROaLIdhDQSGkk3PlkrRcnPYeA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 722ec810-8365-4733-fa5c-08da00d6f02d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 07:40:38.2341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB2350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 07:40:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162874



On 07.03.22 22:17, Ross Burton wrote:
> Personally I can=E2=80=99t see any reason to extend the pip install argum=
ents.=20
> What option do you think would be used by a recipe?

For instance the --user option is something that I used once in a setup.
Plus --global-option for passing additional options into the=20
installation scripting.
I give you that, that these are used rarely - and still could be used,=20
if the recipes would be tweaked to append after the inherit statement.

And in my mind it was always like a variable with a weak assignment=20
could be changed by the user, the ones with a hard assignment shouldn't=20
be touched - but that could be just my mind =F0=9F=98=85

>=20
> Ross
>=20
> On Mon, 7 Mar 2022 at 20:06, Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>=20
>     On 07.03.22 20:42, Ross Burton wrote:
>      > If we expect users to extend this we should use =3D, as otherwise =
a
>     recipe
>      > that does +=3D will replace the default value.
>      >
>      > Signed-off-by: Ross Burton <ross.burton@arm.com
>     <mailto:ross.burton@arm.com>>
>      > ---
>      >=C2=A0 =C2=A0meta/classes/pip_install_wheel.bbclass | 2 +-
>      >=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>      >
>      > diff --git a/meta/classes/pip_install_wheel.bbclass
>     b/meta/classes/pip_install_wheel.bbclass
>      > index c1680a24ed..febcc8e445 100644
>      > --- a/meta/classes/pip_install_wheel.bbclass
>      > +++ b/meta/classes/pip_install_wheel.bbclass
>      > @@ -10,7 +10,7 @@ PIP_INSTALL_PACKAGE ?=3D
>     "${@guess_pip_install_package_name(d)}"
>      >=C2=A0 =C2=A0PIP_INSTALL_DIST_PATH ?=3D "${@d.getVar('SETUPTOOLS_SE=
TUP_PATH')
>     or d.getVar('B')}/dist"
>      >=C2=A0 =C2=A0PYPA_WHEEL ??=3D
>     "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
>      >
>      > -PIP_INSTALL_ARGS ?=3D "\
>      > +PIP_INSTALL_ARGS =3D "\
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0-vvvv \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0--ignore-installed \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0--no-cache \
>      >
>      >
>=20
>     Hmm all of the classes use ?=3D and I think for a reason - this isn't=
 the
>     fault of the bbclass but of the recipe in the end, as +=3D is known t=
o
>     cause this depending on where the additions have been added (before t=
he
>     inherit or after it) - I think the better way would be to use
>     PIP_INSTALL_ARGS:append in the actual recipe - guess the fallout woul=
d
>     be way less than the one I expect from this change.
>=20
>     The big question is if that should changeable by the user or not - I
>     personally think it should be
>=20
>      >
>      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      > Links: You receive all messages sent to this group.
>      > View/Reply Online (#162860):
>     https://lists.openembedded.org/g/openembedded-core/message/162860
>     <https://lists.openembedded.org/g/openembedded-core/message/162860>
>      > Mute This Topic:
>     https://lists.openembedded.org/mt/89621292/3647476
>     <https://lists.openembedded.org/mt/89621292/3647476>
>      > Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>      > Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [kweihmann@outlook.com <mailto:kweihmann@outlook.com>]
>      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      >
>=20

