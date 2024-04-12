Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7267C04FF8
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 14:52:44 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.80])
 by mx.groups.io with SMTP id smtpd.web10.49063.1712933563598627822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 07:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=KlkoOI1m;
 spf=pass (domain: axis.com, ip: 40.107.105.80, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E35QlJfIUGAY+0BsosMvQDD0FykX52C/5rL4jsevjlez012UD/KWP4w32huycubIuJZW4Ou2SiTRvMb9LqNBZtbkgZcGqeCqTs5psUqTyWX8VRpq2tBsbIvDRdUaj4Rqvw5LmHKGNSeTXv0Y3sJrBFAri9RYLpZ0E5I2WfxP8aiK+ZvsVZtDeSov+ucs4n0NvdbhZX8i8Ujez1oZcENOb/pcqGV4BIaLjrbIaL4XliOaUj+XT0eOZo5+gw2p+GJFkKZyC9f812Ug1hWxVOvO99nclGViQc5A2Dr17f4eNu0ZfLA+OFMnuoPdzR7P46vablZxAVV5xSZSDakGNrsE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqSpB2Bz65HXaUiTB+cjQtmCDon2q9G2UBpwhTBWaw0=;
 b=PgtzO7KQxZPEqhjKvpD6GvA2f3qQda2358qeOcq/D3LV5/Z6MLv/N7kfQ6TpjN64nLWjyfi8sX7IfNMw21ozEMlDuCCPjpNzj61BU2sh0yMgq9tdUuN3xgP/21gJIJlUxjBkzxARtgy/hFpiqTuR+PqRiDCuwewY2OcUvZVwnCdxP7igkpYUvsbIHegy7QiizfTHPwN5kbCBoQLM1JCeKeGtUuSQbRj7EcdFZW+2LDDdDH2zzGvRuVx5r5TG879F9/ejkE+9c5aYor0GNCVb9JUBLfeEffB+WkDyLxJYqWomzfN/lWCKv6O75cz5dj7S3Hn7tECT/Qox+CU4bX+k0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqSpB2Bz65HXaUiTB+cjQtmCDon2q9G2UBpwhTBWaw0=;
 b=KlkoOI1m/Ur2mhOuGAj2TlEAP0/+HLKnrWgY8DE37CFBr3yKbh6ApuEiL/euOWTGXt9WXGq4FdFvOXXnxPYQ0Eu1w6E5HnO7YGk7IYpW3oe5LXLR4nAmdgBIcgrb37hfueilfJzi4xlIdb6B6EpZkEEeSMXsPbO4pYArs7V4PF4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB7225.eurprd02.prod.outlook.com (2603:10a6:10:25e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Fri, 12 Apr
 2024 14:52:40 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 14:52:40 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: K Sanjay Nayak <nayakksanjay@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] Replaced :append with += in multiple recipe
 files under meta layer.
Thread-Topic: [OE-core] [PATCH] Replaced :append with += in multiple recipe
 files under meta layer.
Thread-Index: AQHajJ97PdRWX/2s+0eiNXrQYBzTybFktvyg
Date: Fri, 12 Apr 2024 14:52:40 +0000
Message-ID: 
 <DB5PR02MB1021397034DED4791C21D30BEEF042@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240412060536.34983-1-nayakksanjay@gmail.com>
In-Reply-To: <20240412060536.34983-1-nayakksanjay@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB7225:EE_
x-ms-office365-filtering-correlation-id: 4fe0b7a0-eb4d-418b-99f0-08dc5b00337d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JQHfxjYog+lTUT/z/ZFUwu9KOh1w/CEjD+pAUpNSKsH3ssrLep5u4am5X3Zp2+VVlV1hx6Jjs1gVjQNrWiObU0jiDiIqBlA1f9dsdMy16YzBtUkrarhh4zR4r8d/4umeS9mQTG17HyNseKh7Ovh/oWoSkdjXyfnw386V7YN4ydf3fMZSG84bhB7DW8v4x5juiCOqQ4fF/OO7jgMVk7oiGFLpMOpO+PutZFxaxDvANwdouZm6cXSbyh0r8zXpNzRA5utC+lgS7qrjqq2swgQCVZnrPMVPcHp1sk7XG6njFY/NEIcnvNrTJxJapIMdykzr9QiWC1whDbgweToFSPPWyytK5AUcwen/kBk6zVE3LJTnO7JmE9DlEDDdzF6FoJBCctKYPbMF4Go9GNqtjCgSNb22QU86yuIVSM3K993U/1UOn02TY03/sdQcSlizCOI6rsqAPz5RLem3ug5l5cFtLUIihU8uhDxDnKbEjnWtuJkuh/C7Km8pM3d/nvzwAwckZEiNOLKx6tMbOntmz2tyPGuB4rc5iyzROKh1LVaE9pr85tUbOAbc31yO4qUNMiN+3185PaSv/RWb3axmWJuXWdGmWxbyjWZXLNqOSbV/5z7HmJu4HXzw/N+s0bTMOrZ1R6ajBk34aF9Nqjsvozu5dCtpbj5ZPFJ49hoi/hYXWU48ctCsICbIIsZkZXC9UxQT88yGEQaY+me+YwhpIlW69k0ghkUVrVPeFePz9O5ctZA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tURChpzPwCP0NHFQIc9rIg82f6AhfHjSw4hQ/N2LdUyujdI4Uz4rj5lwinHe?=
 =?us-ascii?Q?agg/zmAbvYjAwoSdiJLkHG4+FsitSvEM372zEhDthx79eHM8gkPWy1Pue3gI?=
 =?us-ascii?Q?NUXcZg/LGgcaemaoTjNRGzRbATK6lB/E+GONb+MlIrHSct8qGtVPc2rawdcB?=
 =?us-ascii?Q?gNXL3H18FruB0bq4tR9XUR8mstygdKSe/Pc63aQaJRoaEKJCHd3jjwEa/8l6?=
 =?us-ascii?Q?G9IQ1nT/O1TnfzpeEYeZleeQxIZWiCuwXDxK1Ift+ljjZqsgugwup+0TcUgi?=
 =?us-ascii?Q?4yAvlk85th/0tz2TcdEgL78FexwM2enCmgdyPwzzcTw+WxSRkWG4lF6F8I3p?=
 =?us-ascii?Q?CJu4eZa/l7494bM1f4/WNb5mBp5Sye7xKhZ1GBXWaYK7fbjNWepgdopY+c6E?=
 =?us-ascii?Q?8zvdFVHoQ+JVQuWZVHYc2IiV+Nt76RhmQaX7ZSY6fCrb8jucJxOgon71mSNG?=
 =?us-ascii?Q?yMVeL+/ZRv/SzKBbOR2lqpXr2m6psFND2MOU2QVt/mMsgclQapmN11PZ+f0D?=
 =?us-ascii?Q?CR4WL9capgEkDhNGvMbXFU3MacAkVLNwMqJIwFmmiKgFfY/qdJqxEmgdggvD?=
 =?us-ascii?Q?KWmIINdL9aBNqPz8urWya4jP9AhbVQsNmoK0WhuNu7etYhtjqQ6EhsmbL4tZ?=
 =?us-ascii?Q?HZ6Uiz73nh3ElMf4iJlufEX1gM3pfhWwFo9xEWuYpsRQIdJGehUwtmHLVfqU?=
 =?us-ascii?Q?Dsq9yL4vMZ1E+W3dQliYLliIGKKHyMpmrocQn1gk58hrvJWHwdGf1qmg5FPo?=
 =?us-ascii?Q?yVY5ZtBJrnmOFUfyS86yM/ayk2GnsT33qNCEQjztsfu/qe0wWUCRKYe1/Z9Y?=
 =?us-ascii?Q?lt6z5vqNqYjSlONiLALJ6jF3BGdB8OTQPI6HqbQ5LSZWqHSImRs3uoytRNTA?=
 =?us-ascii?Q?P34A3E5AT5c2ztBPk3nt6wJ4BoWLKBY6Trp0B5hD1C/AIY0/+kPC9SONmGCw?=
 =?us-ascii?Q?LyA6wKylvsYuk8GGjBFkz2dLLO5jxQzc6MXqJRMlA5GirWjbhJryE4EXUw5D?=
 =?us-ascii?Q?rdyrdd4CILn/eqiOIxgRFaGRdclgak3J7qZvPhEm8GwFYPu7HdL6E4mlbh3t?=
 =?us-ascii?Q?+Mzt4wByoYpXYozvW1j6+DNgojbt+29E+3ZljsHUcQ7AL3SvBLq3H8OkqYcg?=
 =?us-ascii?Q?OU2GV8yec37FBYY6jYrjkLdf5dRNx8oDZIvk2X9nZ4m4MEpubWezfJGrXKqg?=
 =?us-ascii?Q?BBkSnqr6H0MX8L9i4bBOhFpNHR7qbGIfublQOhUWUwuer1KVg4tn3nCSpE+J?=
 =?us-ascii?Q?0USVwrKP+S+6SRKU1ria6zhppyLwpRR45mt7+iELD7hWlAfPe6pCb1jEVvDD?=
 =?us-ascii?Q?vjUYcwQ/OuVxvqbSL9CxeD+5r2pP4JmXYE2CwwFzZutsZRmt0L12xuCZ3jrH?=
 =?us-ascii?Q?ICeN1R6zoIANXv0I5R7gttFRv/E/Y0eb4Jdq1oeEiRRIkpaOcNqFiQP7Wmc1?=
 =?us-ascii?Q?zG0ai05kFrOh1DCiUyWp0eMNm5cj6VXpc0kcmi1JvL6h0e/TrTyTQzhPBmmu?=
 =?us-ascii?Q?sD9HwvGBryLWzWwQBoN2ZjnxZBQrA+zJpl5SRe13uW1hm/LYHqLx6885Zq3C?=
 =?us-ascii?Q?Q3qi9UzfTqGyQDDPuFA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe0b7a0-eb4d-418b-99f0-08dc5b00337d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 14:52:40.1622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7LlAtGVMaxrP14H3w3WSQOrohMPiGG95s8aWVjslrP2p1X2NLzBIpvyPY2UUXYUV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 14:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198172

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of K Sanjay Nayak
> Sent: den 12 april 2024 08:06
> To: openembedded-core@lists.openembedded.org
> Cc: K Sanjay Nayak <nayakksanjay@gmail.com>
> Subject: [OE-core] [PATCH] Replaced :append with +=3D in multiple recipe =
files under meta layer.
>=20
> Fixes [YOCTO #2951]
>=20
> Conditional operator is preferred over the append operation,
> hence modified multiple recipes under the meta-layer.
>=20
> Reported-by : Christopher Larson <kergoth@gmail.com>
> Signed-off-by: K Sanjay Nayak <nayakksanjay@gmail.com>
> ---
>  meta/recipes-bsp/grub/grub-efi_2.12.bb                          | 2 +-
>  meta/recipes-core/initscripts/initscripts_1.0.bb                | 2 +-
>  meta/recipes-core/sysvinit/sysvinit_3.04.bb                     | 2 +-
>  .../baremetal-example/baremetal-helloworld_git.bb               | 2 +-
>  meta/recipes-extended/less/less_643.bb                          | 2 +-
>  meta/recipes-gnome/librsvg/librsvg_2.57.1.bb                    | 2 +-
>  meta/recipes-graphics/waffle/waffle_1.7.2.bb                    | 2 +-
>  meta/recipes-support/libgpg-error/libgpg-error_1.48.bb          | 2 +-
>  meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb         | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
>=20

[cut]

> diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld=
_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.=
bb
> index 6832ccc541..f66581cca3 100644
> --- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> +++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> @@ -25,7 +25,7 @@ inherit baremetal-image
>=20
>=20
>  # startup code for x86 uses NASM syntax
> -DEPENDS:qemux86:append =3D " nasm-native"
> +DEPENDS:qemux86 +=3D " nasm-native"

While there may be cases where the above may be correct, I do=20
not think this is one of them, especially as this is an example=20
recipe. The above should be:

DEPENDS:append:qemux86 =3D " nasm-native"

//Peter


