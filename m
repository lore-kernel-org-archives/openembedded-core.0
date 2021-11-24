Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3523FC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:11:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web10.892.1637773892827335441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=rfXKhikB;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.51,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXhuRR3KQ4h048MqYLzP2IVd5uvFIaEF0W6T4Ki+r7ja/IoBwb7o4LtL9RHnQZo7Bs8CmpAFhCoBUfDvVKU/kD1l4ZcggHaQ1/biLFthzZKwvQ+8imSy9zRcKO5S4hTGw9dKaZX/gJ+HyAltbtZAtmNRDgcG+j1EC4gR2Px4NgltHFNJAuJsnAJ5gKt4ZzZkyY7HRIi3wvUP2rUnWu5j972Z+qNOsdmpr/wzYEx3dvZ1NEdKvFWGRhebw2kK92AK8JHvW1qS11tT75WgVQzACM+6xgOKk33CpdpBb0AzQHb87S8jolc/8Ns+fTifKZRgaI91nK1GVW5A7sCsDR5Unw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxVURS8ZWAqpEAFQJbt97wx0lQYcJGijkuwmaK7APPA=;
 b=js859d2U90ApnS1GKFLWb11s44411SpFhYJy2AAXb14JMpOipn3BoZIMecNHyIu4WMQpZTldKvOV4+6TplZJo0A+SMOgRXUdtK9/91rFnXZ348SiuZbgrv9lGMMuEp05AgKjn0GEZenVmaLXeWNsOoezpFr/wkAFE7luf6AOfmlq20yDWtaknqFWMbevd0MlM8UrSo6H33o9xFtrQHqp9wsi7OSuRc/iGcGvQhzl+VhTLAxhknszldrWt6rik24ziWIrRqAcPUftRyQwcP6WnQMELG4g89IcjA6pUy2mnk75JXJZPp8BAqPMBc2LqNTV/m0TjMoxFf1awDXnZZ4eCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxVURS8ZWAqpEAFQJbt97wx0lQYcJGijkuwmaK7APPA=;
 b=rfXKhikBDkNdscWC5CbpgkNp30U3WEhHOuBCFOtx3h3Tbx87qb8H93Hb1PvBJpyYr74cwm5L6tvrN24XfBPjBNYly1vDMAgns1L04rbpwEQpx6ndr357wns4CqZgHTniI9CW6jzunws1p+VaHF3TCxL9bp3S+/Q23qSSq2yHPZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6509.eurprd08.prod.outlook.com (2603:10a6:102:12e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.25; Wed, 24 Nov
 2021 17:11:29 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 17:11:29 +0000
Message-ID: <c71903c8-0a6f-cb07-58fc-cc262bcc527f@weidmueller.com>
Date: Wed, 24 Nov 2021 18:11:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC PATCH 05/15] bitbake: fetch2: Support archives with missing
 search directory mode
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
 Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>, Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-6-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9JQqkh3zf9a4zCbsbAWktP4K6YpFmb8fHhrn+47Eqtsw@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj9JQqkh3zf9a4zCbsbAWktP4K6YpFmb8fHhrn+47Eqtsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0026.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::36) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.208) by
 AM7PR03CA0026.eurprd03.prod.outlook.com (2603:10a6:20b:130::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 17:11:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c663f3bd-6866-43f0-c41c-08d9af6d746a
X-MS-TrafficTypeDiagnostic: PAXPR08MB6509:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6509F5FEEE22FC0F8F1339B7D7619@PAXPR08MB6509.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tVycYzjGLSv2veUhaX5ffD4iiP6CYMPjkHwUnsU5gaaCti1d7xKM+ACvMWqXtQSqWG3sMDlPRpszG2LpM+zSmPFma4E3930pqBFgBC41WjwcY+lf4Q2vOBD9xhW6w+vkXloPUnFyRr0J+4uCwWloCzv6tNSKh/wrzgJglPxuO2NKhSw5eNsl9aMS5qFPvQhDZsgmHhbHOUsvlrphEpGnAlz4OkjJAgeSSzRpicx+TIkmj/XaifO1SoA4//50nKv5c3hp7CiFjZH3Pf+W/5rxFNZVj0HW9WldAGziUBE2m+CRhN23b+V3WPrAiX0XbfM5018wYTDD215VmZhplUrLxOV9Xf4Fj+mf6LRGxXiz2UMGOQqfR8z55cBVaaKRp9ylTSFiBHut6rIRNNHjWHWXu5kSDwGgh8OwAVSfRiywm2JX+6GEXfTiZvsW6z20VZ688M1kg106bu8eSSEuv72HZrNHCPRCoVkCfC9iYinl8PYnejqhL6joGFHYHj+XRzLgLEmYw778PAUh9yswNG3PnHLXnMmvSb3JYjrMljj8wF2a6VKwOQmW6O5OxGGBe9Mp4Sf9a8xDSTgkMUyQDBIpp2gq9zqyuNJBJ0/imFRDMigHNwi1efIwPaQFlyjL8YjM0V+QAfdZTPGmz35IPDu4GnnSyl4vD3AhtPTxk+LYcRW8Ls+9yuwreY3KptYEcKgfmco66SNBl4O0KlX2gw0feavxzIddUJOqNnXbT2FfSGn+WMYaPysxmz8YYZD4WYirLlvdsBDZZOGJqXHBvGWltRQV28Jsyb9U073f2FvatmgdGLhJvhG4oLT5wQSx/NsVbfstNfELbU7NrT13M8uRiDZYqGfXOGGbtqlVP7SlAEY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6916009)(86362001)(966005)(107886003)(2906002)(4326008)(2616005)(54906003)(66946007)(316002)(16576012)(52116002)(66556008)(38100700002)(6486002)(31696002)(36756003)(38350700002)(186003)(8936002)(66476007)(508600001)(26005)(31686004)(5660300002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z345SWhT+nskvjxO4Jeg0h0VpVHfEk19YPHHoh953ql3vIlY4+iOXxltg+eX?=
 =?us-ascii?Q?ksLhglUmU/JD9uITdBGsIKV0QV4V7iYMoYWy9Ijpf9UJTRvY46jZ5K9z7+Sm?=
 =?us-ascii?Q?G5QckM5hq7lPEBi8JJe5lsCJG5TlgK+6kO05MWS+jF3fWPSQudsIKIhNEA+H?=
 =?us-ascii?Q?nQs2Ih2XgsA3PLzzsit/EETkNeDSGF15UI7EcsIFzOlygFfb08L6f4PVEH1R?=
 =?us-ascii?Q?D/QKT6UErDFA/1xzBAVEHYoLiaf4WpDF3s7d2gJkQowneiLdUAOZ9zVjuOo8?=
 =?us-ascii?Q?OsSv5RWXVvAYe6yxC+GKHLH1v8ealfyUCaA0FE9GVCo8MPMAYRU8fPKkFiT8?=
 =?us-ascii?Q?tpMOFbJLRW2180hpwvFJukjONI28gScS8ndpnueDIT/CVRb4Zo52Jz5+5DyG?=
 =?us-ascii?Q?g0sq0JUOOdUfDgJXBDuoMFlR5WdhNI64HCjLtNGLqlcJUpOzspj/3KHOFP0R?=
 =?us-ascii?Q?/cqY5UzXlrhJjnFsaL1wz9ju1rWDRuC+i9oV4Mc7K1IZc1g95ehgruWK5APQ?=
 =?us-ascii?Q?+vFdxqsqyGSoYQFu+LpyPesDL0XKZnWsr4grW8F5faKW4o2v6MCju/nAW8Z/?=
 =?us-ascii?Q?yg8C/0Eza8nRlaTiIfFNDR3ljmZKMqH2cUga5TJpnFaHZEvLwV+0BFcwlqbX?=
 =?us-ascii?Q?AXVyYoHdRUnFKdoGyJMcBGNHvn8e/HarnsGGvurso33EeEg3Lb7g3mG7Z5Ev?=
 =?us-ascii?Q?VQ+9rZIWWf10hVyx4UYmEC7jvT8CReq0vr2pdstE/E6fgEFxV2zhGKDZszzP?=
 =?us-ascii?Q?K+yJOpQSYHHmTfKNrsJaCHk/8wCiTOR/2h8i9v60+m0xm6sLYGVhYlUqBPS7?=
 =?us-ascii?Q?yQtlVbX9NlCFMax1SWL6F+9dRCJvF25ITmN6gPrcNoTYOQ2vtWfTMtdSD8Qb?=
 =?us-ascii?Q?RYU/z7hQ2PQL1UmEnJbreehOrngsh8hib4jecSPyVJYgmpyT+cVTq7DkLNE4?=
 =?us-ascii?Q?5bg0CQ9ol1YbG7XlhDyauAbHPj0/R3+cIZnNuA8tR5La0eCgUzr+pKSlIGlT?=
 =?us-ascii?Q?56qrZJ/JWgMPLwwmDjTv1Wd/5i+0k5S404LmrjaMB6Q5clm0aXIuGx11gra1?=
 =?us-ascii?Q?RHYeo33qxOYlwu7o3qolt2wYxulHpPo/CpQhnv6zSNN3v19MtcuA8AJaOMTI?=
 =?us-ascii?Q?DjDyVYNtadzFPopEkl73zxYB8MRQSWhbl/NArlOWIqk6pM4zbSWJpE5naaDZ?=
 =?us-ascii?Q?oevmcSRcmMRLSu8WUyClrstfYLl2jDkoyHaO9JFY/UzonjU0RzXoKHcIWugP?=
 =?us-ascii?Q?Y/Dp3o5fKAGMUuWgBIBTLsr0fmtfSikYGpoqTJkIUPfVKpoMLp60xHNN4TjW?=
 =?us-ascii?Q?wQBjz8erRGhHMXZ8tq0LI0/xIqtNc9EnAL8BarzJ14fc5MNF7PyVRo2vvNFr?=
 =?us-ascii?Q?/CR3ONSa/52lWwjPEVsWzijYCbmXnReLSb+aHnLAl1UrQFP65G67MtF9JPCn?=
 =?us-ascii?Q?EPl+aDQzpLA4fi+avCl7JIiT0flhprhj3RHETI77RX1rvCCP1S/KQxtfDnBt?=
 =?us-ascii?Q?Q1aRKCo4oio2NLkfTFGXhTmPVWNYJJ0wa7nwxqJOTj78tau0lcfo5VKAzvX0?=
 =?us-ascii?Q?Oc97g6LBJqYYz7MNZfkcaremPa8bCyDGlqiseaE7i7YXc3ByNzZs5ZA1b1Sr?=
 =?us-ascii?Q?4MfUCChkHmRiRIMIIem6dcA=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c663f3bd-6866-43f0-c41c-08d9af6d746a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 17:11:28.9992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HfkTjr0Eb6BMiyuLCHLjf0nSeX47CEu3Rk9mEH3PYFTAqwASg5OTgzqohv0IRI5NTuROcUeI9jcG8r+2aj7hrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6509
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 17:11:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158726

Am 24.11.2021 um 16:17 schrieb Alexander Kanavin:
> Is it the missing x bit on directories?=20

Yes.

https://registry.npmjs.org/protoc/-/protoc-1.0.4.tgz


> If you've encountered this, then=20
> where did it happen,

cp: cannot stat=20
'.../git/ui/./node_modules/protoc/scripts/postinstall.js': Permission denie=
d

> and shouldn't the tarball be fixed instead?

How should we fix a tarball from npmjs.com?


Is such an influencing change acceptable or should I move the change to=20
the npm class?

> On Wed, 24 Nov 2021 at 15:48, Stefan Herbrechtsmeier=20
> <stefan.herbrechtsmeier-oss@weidmueller.com=20
> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
>=20
>     From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com
>     <mailto:stefan.herbrechtsmeier@weidmueller.com>>
>=20
>     Signed-off-by: Stefan Herbrechtsmeier
>     <stefan.herbrechtsmeier@weidmueller.com
>     <mailto:stefan.herbrechtsmeier@weidmueller.com>>
>     ---
>=20
>      =C2=A0bitbake/lib/bb/fetch2/__init__.py | 1 +
>      =C2=A01 file changed, 1 insertion(+)
>=20
>     diff --git a/bitbake/lib/bb/fetch2/__init__.py
>     b/bitbake/lib/bb/fetch2/__init__.py
>     index 05b2d2e924..8ad4e3a5ec 100644
>     --- a/bitbake/lib/bb/fetch2/__init__.py
>     +++ b/bitbake/lib/bb/fetch2/__init__.py
>     @@ -1554,6 +1554,7 @@ class FetchMethod(object):
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D data.getVar('PATH')
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if path:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D "PATH=3D\"%s=
\" %s" % (path, cmd)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D " && chmod -R +X %s" % (unpackd=
ir)
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note("Unpacking %s to %s/" % (f=
ile, unpackdir))
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D subprocess.call(cmd, preex=
ec_fn=3Dsubprocess_setup,
>     shell=3DTrue, cwd=3Dunpackdir)
>=20
>     --=20
>     2.20.1
>=20

