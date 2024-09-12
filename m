Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E6CEE6448
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 05:14:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.49])
 by mx.groups.io with SMTP id smtpd.web10.40245.1726118037978873934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 22:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Jt1nzgrP;
 spf=pass (domain: axis.com, ip: 40.107.20.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyxjDuGd0GBiCzKDUrAJHc7vqhLLdtP0zxK02RdqIizNGkAlXMTxYWzeq0Dc334f1CnvZLe5c4ZVgTXo25pTlffKq2I8Ew8Po5iNB/pLhiGVyCWrVqm9KBGncQZkfTDRaRWtdfaP5Ey/eOIQ2u0/qsN/w0r0N9kmLR7Pwi95HpHRgsBMijwxhyvrx6YxQP97s8qQ4uHpN5Lg53wk8Zki8M9E6Vk+Sw9X+dy+D8XmjaAlx+/UGN4eLOCWu5mE5RQu41ZA7vIoOOWk+aUbC9tiGKNPOEq7FZF9zUIvI7qHu9ePsxa4e7QU9rXofh2VxvIHIStzdm9jyjrQB2ldctPfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VA3BuyTk7Ep0vr26nU0AByHhZj714eOJ2LbsbtEhbh0=;
 b=ahk98KIQJd8kx0twTE2qnl255OSYN48L/Sax9H0Pev2hQpFrMR076y8o9YzwUnlA9OsMEYp2nHeAKWHFuts5rRRKv9Lr8dknHxXpmxYYjZ2Ak22XzmhgcGXp4jElg8BVBNlGumHrX+wQDWN56TLVjZUM+xPtTDgpu97wDsUbItZLKFMt9iAinDBN87AJ8cB/u1iYRq3tk2wG5cV1kze7PRT2eb5mQiEeMQ2jfHyPMLUmRjY0UzGU2GC/Fa7u64NKI0h3EBGJj9gA5bRbCkcTxfvWefqnnK+5Yx7mNkX8bNsbsCriWj0PoMbREKcC+ZF9LnLAg77VkmV566as0NWskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VA3BuyTk7Ep0vr26nU0AByHhZj714eOJ2LbsbtEhbh0=;
 b=Jt1nzgrPUgQFA9vKn+StJjf6nmPD53MBoxe2pVspGW4lnXxnMgZzdqojdQDqgfo8Xt3Y1FoSc49aBbm/C0m6o64qPXeLteg5peW+sArA99jZIFluUxc8lRvtQ9xeirsHx5msoBRj46yZqF5dC4qs7GXOxC47t9L1KiSPhhYZYYc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB10442.eurprd02.prod.outlook.com (2603:10a6:800:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 12 Sep
 2024 05:13:52 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 05:13:52 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: RE: [OE-core] [PATCH v3 2/2] lib/buildcfg: Add
 is_bitbake_in_separate_repo()
Thread-Topic: [OE-core] [PATCH v3 2/2] lib/buildcfg: Add
 is_bitbake_in_separate_repo()
Thread-Index: AQHbBFgBK1IPIoXXaU2e1iMrjC39xLJTm74w
Date: Thu, 12 Sep 2024 05:13:52 +0000
Message-ID: 
 <DB5PR02MB1021387DDF9A7CA5E3FF95BF4EF642@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1726065189.git.liezhi.yang@windriver.com>
 <46758adea9ab24c5624eb1953ba8ca5143036e5e.1726065189.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <46758adea9ab24c5624eb1953ba8ca5143036e5e.1726065189.git.liezhi.yang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB10442:EE_
x-ms-office365-filtering-correlation-id: e5a61e20-92e8-4547-f98f-08dcd2e9b127
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?LlJPYF0qZgKYw7/glRS1vFSQjlMV0zxfIG4KmyukfsH1+G5hmxyYZMpiurRG?=
 =?us-ascii?Q?NkfKgsv9r7shI0YZqxep0yskLjmlQdz3iG3RU5nFDC7gBliVmslzSIUFFz25?=
 =?us-ascii?Q?yXMq7mBHQaMRLIBfW/JvO2UFlkTg7XIaBqU0nxbOUIp1LL/VBwJ8bNZrEsem?=
 =?us-ascii?Q?tAksxqarm/paifFDepTEPMtJqVPnO0n/rHOCUWhZo/8QV6aPeYUqGoWWIwoh?=
 =?us-ascii?Q?aG0JHfho6LDwG/97hye9FqlesP1v+tb0+iB5kw3iuzNYklhCpihtJa+V+9l+?=
 =?us-ascii?Q?s2ZjuH20YW33bX3E1avZ7XDv9qbe2dRwNSXaP3Oastu6nEuuotoZU73jkteK?=
 =?us-ascii?Q?+y77+Bjt0VbD6vQP4mKmYL/1YS/yeiLGl6mldsz9jM4tyHG6UWT8GgmP4mVq?=
 =?us-ascii?Q?vsqjsjlsetB2Wv9wG3RbBUNEJHmTLtnwG3FOwWz+f6gCMvbd4hFU6T9JR52o?=
 =?us-ascii?Q?ubHMW+DjZRPAJfe3OyJsovL+eAiBx65VwIqSVSTGxxYiO+8tVRGP70lTizNH?=
 =?us-ascii?Q?t7trUPj6esprILzDJGN6gDgx/0i+5q7I39qyiJTZQT6OMiwrE5zqA5HrvXET?=
 =?us-ascii?Q?NdS86rgimTqHS/82/osevv285Sv08VygvcMIQvC1Se2w4pgph3uEsT5Yrq7R?=
 =?us-ascii?Q?MZCwIiFrJYNTegICxLLBJdL2pkGh20/eIroTsgbs8s9v05f/97a/lrNdxdzQ?=
 =?us-ascii?Q?hn5BdpRk3M3NtE5OHOafao6+Ttt6nMaCD2mUzicALvUaT7GTpRAoXkmAjYVD?=
 =?us-ascii?Q?h1PRiU8JtY7iUQcPd+KLSuBg0m5u3q+cbWlKvxqi219rzUOizq9UwVydF0gQ?=
 =?us-ascii?Q?v/nTz3Gg9BOC402ixkFtQcKV0jpmooSM+edkI4Nxy9parroJ4/dQxB4EYC2v?=
 =?us-ascii?Q?IbwR6n3Iyq00/6yz5AB5B+fCOe5IXFzrD89PMQCE59E0KvqLqZX3HmjXerIH?=
 =?us-ascii?Q?DfvtaoiGe4J7/Dr8mgKG8acF8jDvZpTOBPuZPSW357OnTTzewf/PwEnwF+/d?=
 =?us-ascii?Q?4IXqdpxiloStH3uctrOYh8gyqLGLzw3iCD3EyoxgpTBirCxgXefcJa5L9GUp?=
 =?us-ascii?Q?3bidf64PAio29pt30AkrcnqqWvv9XjiUR7i6AaMz+3U+3CcqTfvxtW0rO9p/?=
 =?us-ascii?Q?jSDZSGWBkiV+JNdJuMUgxmilcxqBq6ttDJX1Zq9HteEK9IxrPaJaSbO4ppS2?=
 =?us-ascii?Q?I68rbyjrMPB+t1skUuzw2Dx4nwzkOoUDujZNfTxHdc4Ub2KFy4+efQfywh18?=
 =?us-ascii?Q?mgzvB1OyJ+7SEA14oZEPRoFXBmIXQdECSfkpWNLR36NEIe5j7M5RiiJz/JpY?=
 =?us-ascii?Q?MNwGUFSjGNh0Ja46A/wrovO7kKX7c1DyIPrp2EroSv3dPTXc7s78HE8uHkSM?=
 =?us-ascii?Q?M8j4TbplvBnfDWNF+mdHvzvrh+eaBPCEQ+oz4usvDErdVMH5ww=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hvWLfUFqsB1epiDl7YRIu5jwO/7hQBcLuO+ROVKF4zzRDvMd8vXbuTZaMGTS?=
 =?us-ascii?Q?MY57EN6NIqOftGFnMnBoqF2XbuG72CoYt+k7AsfkLMuCmDMkcaaCSlkwnzNZ?=
 =?us-ascii?Q?NiQdo1Aorw1VaSan7YjzU8LEh3R727g5GEzEFZbADOL8iKiIfe74YRDLKEvq?=
 =?us-ascii?Q?GZ6EoY+SMm6d5rX9Lz2tactE2XZhi3n+ovW0bLRCgmejo5+PhN2Nh+FU6x7L?=
 =?us-ascii?Q?3qpOQc4AS51jQFYyVMeNj1qPL3tEUP37aoHDFE+qUCddrK0JefTc843dAVvY?=
 =?us-ascii?Q?RZuTo7/nCajXNMuschSCC0V7qtMaaTjPieZwtfsJXtK1DQZLoyZIPJk5AZMs?=
 =?us-ascii?Q?ezOP6wfofHjCJScqArSBvkyVaNYZaZs7H8bIJPyR+I5ZIa7OV28U41Jmj8GU?=
 =?us-ascii?Q?O1hoVnbgXCR5/SWK1cVZe1eWurBZ8qWaDf2DK1pvQtn2s/8PUNqKNjd6dcC/?=
 =?us-ascii?Q?ta/e4iPUgIfBdbQTjGW065/juBJEaTAj1a9aH4Iu0cuVYniBfRQnRFzyMuV1?=
 =?us-ascii?Q?6Lenw1Cyu2/mr8eb05+tP4hulSe+QUihLM9ZEQd465IO4svB7PwJhUjFv1Fu?=
 =?us-ascii?Q?cj5u+Z2/xM5sL/iPC8oEkJ4aQ4B933gWn2BoizjIcSGsCTWHl0rso3bCRN9M?=
 =?us-ascii?Q?2ZPWk3p0u+YppWC0Rdyhj+cthFCBfh1Cw6HAHE5GqQzk0vLGkYtCc7932sx/?=
 =?us-ascii?Q?R8bDvmR0VitfuSsLkj4b7qN+NJ6yfNSugGzMRBK3rfDDmGNqzKfCsuRKoXIz?=
 =?us-ascii?Q?rSOpDyeONqg4nFJOQFcw8uW5ndHH/C6J2qCV2hyj1DoUYgq9T2sUbRkO6J3F?=
 =?us-ascii?Q?sDVOv4u1zsCMpCZBnitfnY3ibFhr36NHGrKzzfN/4EdxAGn35di1+vZmd7i4?=
 =?us-ascii?Q?Dza/vHfcMECB0P8kNTqwnxHe5WKcWEGW8wyy35vshjs3Bb3ubncJQVhjsvKU?=
 =?us-ascii?Q?mAJAedDSFfwSBQ+KRmcR1m69+r0wQQCQvFQ8jqZPQ5zBklu/Qt3aozhB0XZW?=
 =?us-ascii?Q?Hh5AkI+f8R2vmTpCw5QZ3JN/kU5FFo8EXvTOFWIK24PP/iojY1WohVGT44BS?=
 =?us-ascii?Q?RTGrqi8fJRrR9bsAB4c5ETvHd2mSHSRkTGUBj4kIzyIDUIrPV7seREC9p+nF?=
 =?us-ascii?Q?iQH4HUHEzx6raVOH1sP3JU9sy5Bq9hRjhzrroXOFtQ92i8R9K5c1s7YMvM3+?=
 =?us-ascii?Q?eu2M+oa3vvSWJcBLlp8TvV9P+7u++sTY8NLZ1SOBmBNfzV0Ubb9WxEpsdUH/?=
 =?us-ascii?Q?SCk6i34rexxHA4+DdySDDpaz5F11tilFSFDG6YN5d6gInz/Sn1BAmoqJYyfw?=
 =?us-ascii?Q?kZOttrmSUNAsl76utbwE+KWg9RD+mrYdtMasCXOzJck2+dCcbnfQJapkAymo?=
 =?us-ascii?Q?U87H6kmcS4160Pq3ZSN1qMhBxcL8kTgMICuEjO30bFkqFh+MGyf4c381nsAE?=
 =?us-ascii?Q?LIrXcc9ErdHCZgL6Wa5cwpRi8YUJibLdp6GMn777bPlggHXGt/KDp3BgrLwQ?=
 =?us-ascii?Q?q3IGETBux83J2D9JFut1ufzUZX3Ss6ULPqf5KSV+ScwcXHGXOJnDjICUoWNF?=
 =?us-ascii?Q?sfWVdqbnUQdThDdWsBE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a61e20-92e8-4547-f98f-08dcd2e9b127
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 05:13:52.0837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6ACGjnxJ4pJQTVI1DbXA95atlWSyiGxjFEx4CUZtlW7xxSzWLy1BEjCmzTBornt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10442
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 05:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204419

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Robert Yang via lists.openembedded.org
> Sent: den 11 september 2024 16:36
> To: openembedded-core@lists.openembedded.org
> Cc: alex.kanavin@gmail.com
> Subject: [OE-core] [PATCH v3 2/2] lib/buildcfg: Add is_bitbake_in_separat=
e_repo()
>=20
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> This would help various tooling that is being developed for setting up la=
yers
> and builds, or creating configurations for those tasks out of pre-existin=
g
> yocto setups.
>=20
> Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/lib/oe/buildcfg.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
> index dab4aa7831..9256b327ed 100644
> --- a/meta/lib/oe/buildcfg.py
> +++ b/meta/lib/oe/buildcfg.py
> @@ -71,6 +71,16 @@ def is_layer_modified(path):
>          # output and a 129 return code when a layer isn't a git repo at =
all.
>          return " -- modified"
>=20
> +def is_bitbake_in_separate_repo(bitbake_dir):
> +    """
> +    Check whether bitbake is in a separate git repo
> +    """
> +    bitbake_git_dir =3D os.path.join(bitbake_dir, '.git')
> +    if os.path.exists(bitbake_git_dir):
> +        return True
> +    else:
> +        return False

That if-statement can be simplified to:

    return os.path.exists(bitbake_git_dir)

> +
>  def get_branch_rev3(revisions):
>      # Return 3 items for each revision
>      return ["%-20s =3D \"%s:%s\"" % (r[1], r[2], r[3]) for r in revision=
s]
> --
> 2.44.1

//Peter


