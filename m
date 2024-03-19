Return-Path: <daniel.ottiger@schindler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E23C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 17:11:51 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web11.21714.1710868302887669662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 10:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schindler.com header.s=selector1 header.b=XCTgKNzw;
 spf=pass (domain: schindler.com, ip: 40.107.105.84, mailfrom: daniel.ottiger@schindler.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HofOKlcP+jRmzy9xGFjvtf83H8PNs4xYiw1lcxWpMNH1KPnDCbrF3r2wQAcnByf9edPIMYQ6STO/jZMG56PRftx5h3jRyLIU8gTk15Bn0VOpXTEqb+szukArdpXVXKlsvcLmmO6eqO7NIMtx2c82YXQw3dB++hM7CsE195LXkO5+7zkvuzILAcdKXZcn7HPqojKeaFM+xu6AYeP+DTzKrXQBZYDy0hRq+4CESeQnGHlC3chSeR0g+AEO6JN5qiFlsbVziiH2OZ7MLWI87aZD82vjoNjWp6jyqMkjf8WlXbPcHS8u5H52NJgCSrFl8fYFtsJUsshr1UsUWjeCIpx1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDleDz9hYA+FrV9AO5cltmmTqR3nd4jJQTLdiW3CZqg=;
 b=cFil/Gv243lLbgk+yTcVC3nBT56ATuNS7fS+DTUe0+ZchcIvlloYsn5YQEZfXyjXgb1+jLwQXiWA9cikt5CTtBuJp2gzA2uuZ9btUY8bXNwWTPULPtikOkIgijArARmY5h/RGDoevB4eBwoZ9TRphMWK2JgpTDpiifJwf79wq6s52ExKTWlafYBcepsLee5LTAgqJkHeEc41zv84rNSC32zBHNrzFRZjzrZ+RFsEujUe2AnaxHoVPmmkwoa2SQ0SSkWGhIkK9kWp+W/IB5eb6bxIcixydET9p2re57EM1IJGc9fPdFbc+b/9+1N7B14Hp1RqCKfY8lMECjTjhUtO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schindler.com; dmarc=pass action=none
 header.from=schindler.com; dkim=pass header.d=schindler.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schindler.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDleDz9hYA+FrV9AO5cltmmTqR3nd4jJQTLdiW3CZqg=;
 b=XCTgKNzwyF+6SZu7cLFJoWaP6/wg7u1Xmf+HfEbgyh75vqpwWKTkQMEfc5A0O7XfT3b3z/1HjKKlEqVC7sKrawAfXBQZh9XmMQdO733TcaTR/ZZcoOQotRwag/qwXglv32+ezNudwcTPcpFyZFImOohzCQRTI3hlX+9/dhx0oe7cWc5J1NmVqc/yvQcwlASLaJC+rfvCHjAsWfDxJemmfWqpMaW1qr9jihN2YOA8knM8e4ebdQqnK+faG/KbYdQbaRbotymeFaaoIRFKeUhgLhPArSTES3bng+n+qn8Mq2o66J2goMpaQhQ//l2B7SvfdpEEDf/p1iIb5GWWx1VqJg==
Received: from AM0PR01MB6514.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:16c::19) by PA4PR01MB9065.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.25; Tue, 19 Mar
 2024 17:11:37 +0000
Received: from AM0PR01MB6514.eurprd01.prod.exchangelabs.com
 ([fe80::3333:fd10:f938:da95]) by AM0PR01MB6514.eurprd01.prod.exchangelabs.com
 ([fe80::3333:fd10:f938:da95%2]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 17:11:37 +0000
From: Daniel Ottiger <daniel.ottiger@schindler.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace
 "pulseaudio-" with "${PN}-"
Thread-Topic: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace
 "pulseaudio-" with "${PN}-"
Thread-Index: AQHaehf8bRsj6AL+Xkm80yiengiiI7E/PL2AgAACcBGAAARnAIAAAhP4
Date: Tue, 19 Mar 2024 17:11:37 +0000
Message-ID: 
 <AM0PR01MB65148EFD114484DC62231CFF862C2@AM0PR01MB6514.eurprd01.prod.exchangelabs.com>
References: <20240319161026.2900153-1-daniel.ottiger@schindler.com>
 <CANNYZj-yPRWBUL8tOoUudWEV0w+067Eb6vJKBV1e1nZmVzaHWQ@mail.gmail.com>
 <AM0PR01MB6514572B842524D5F2C7DE73862C2@AM0PR01MB6514.eurprd01.prod.exchangelabs.com>
 <CANNYZj_MC05-jd5=3jB5DUxzx=XkupN05mbZ6P1PE43LJf44+A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_MC05-jd5=3jB5DUxzx=XkupN05mbZ6P1PE43LJf44+A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_Enabled=True;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_SiteId=aa06dce7-99d7-403b-8a08-0c5f50471e64;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_SetDate=2024-03-19T17:11:37.137Z;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_Name=Internal
 and external
 sharing;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_ContentBits=0;MSIP_Label_1dc4716b-92d5-4aa9-93a8-2ed8b74a3ef4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=schindler.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR01MB6514:EE_|PA4PR01MB9065:EE_
x-ms-office365-filtering-correlation-id: f25536b3-5ded-492d-b067-08dc4837a2f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xzMVOK/x9J4/AUlEPL/N1XUL7BEuiXPdKo0mZgQdXYIB2b4XzB3IlKmDsD9EGVSzP34MLRaMYw8PKeWkGv5Kd7l2kKm9ZnCFl6M5sZq+F9JmNiJgSVaYJ98N+omcqGFmhyx0kYzSw9x5L/+IXOWcGeyZbVFjS0td7E8Hv94r0rsDWT2iV2cZ0Bx4pTEyGVFgh6WsDsFdGfajXJJjgcqd1lZ+bJJY/GfSXeyUFSpjvgvuIHXRX4h8rNf7R0x2k+FGowKGpLh+LKUHDWYyvyY9FyDYFMHdZ9W6yJUKylNRRDPxS/kYOn5r46gz0RnW4PLNy+lFCT9RJUU4dM4++t9O+ATkkn45RvIiDBa1c+PN07MSihyxkvntnLNE7I05WWkVp4E12GP/UX1G7haaYx/GZyMZGzJc9ZuSVmLsJ0OxYiRumX2JyETIPMpl7uBF7TRQ8p9dwv+Z3YNOknQe6RHdXS39YyzRxxWK68GbYb2uOTZJQ38ZO/IhSGve0ux9TUm9mnSaixMxYH5QYEHCRQ9ciLJwT5QYfatjrlEfadj4WRE1YExSDHJcihAtH5P+/8J/THoVohYkeaA47T1yrX3134c6rkS26YsJuHQcrU8puBLGKy+IIOm/FPDYEPGgU2csSbpMgypNxXtdfl4nDPgyCrvAoQQZW/PiAB2aLrT86aI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR01MB6514.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?a9WODvsJcc5yDrfLIuUnaTa4/RnKftNqI7AMfe/kdpgUtBooe9ybqI2/?=
 =?Windows-1252?Q?i1U8ABD1150xQxLy6ekngyifRWc09hRBq/FGTKvHMO/Ut1qjAAzrf6v0?=
 =?Windows-1252?Q?eIDvfruKLLXMRVuzUWYCwfDWdUD2Mc89SV+PP9dAvhfnvX9b6IkH3ZMK?=
 =?Windows-1252?Q?UiBP7Bc7v6Xx76V7AU69X9sO6w4cZ6O+IFOsiDwa7VUod8fugCV3HCSo?=
 =?Windows-1252?Q?VgfBD8EYMFHyPSKQnb1SCN/HJXqRAdLfKfHWP31IJSCIb0z3ssU12qAz?=
 =?Windows-1252?Q?AYBoc/D1mqNqpwi2Uwcy+PNhaiV+lOzFwBp+/Hx1KQF+ooRhGuY6hcAn?=
 =?Windows-1252?Q?VnQk0wmoqM63K3pGDAcsDPgIDR51PSbdHMPLm67OX04lLmV6eZYeBpI7?=
 =?Windows-1252?Q?sBSkVK0GNpY6iHCagptaLB1bTmqzmdG3UVYG8gwKq6UKVJ8ChLOuUbTf?=
 =?Windows-1252?Q?TFMRYn/M2Hxk6R3rpvcwHkhkc6fqkoXWuqQtA0ipyCoad2qHWTTlEhdT?=
 =?Windows-1252?Q?U0PJG1HntHb+j5P9dt+yUchLuG2sitZdkKON1vxlwUaePn6kMlkorfE4?=
 =?Windows-1252?Q?0WjWAcwk/rO8lLuYo14bK1nid63cf4ibeWq5+8nOSj9lkDJCBZhuc8do?=
 =?Windows-1252?Q?Naya7BTezjFiRooL+K2kUwGlDXKKAjIbNFLSYd/vl7w9IeLVKfJuHbxU?=
 =?Windows-1252?Q?ykRKrhxQY2mbgUorlk+tN/WT3bWqRhaDO6W5i2HM12choZIGpxmzo0E4?=
 =?Windows-1252?Q?xZK4bnJseD9+Gz/YwDRPRZMfyqlHMfhetd1NGmIz1n3bKUoGdpXjdoqU?=
 =?Windows-1252?Q?PKGaYV0VRES2pBlUamHptio9H/If+mMHK9b+/JCWWKr59h+2tRHCBsj0?=
 =?Windows-1252?Q?oEtM1YBw5DMReJl1Eava1RBXoc32mhJ2lj8PdbuKl0zJXmhjgRi9wYC2?=
 =?Windows-1252?Q?Ejmdg1guoV61GA1t8nFqwnV1wHyPCiaheLPKqiu7P883/VITUww0ATHi?=
 =?Windows-1252?Q?bj4g6ar7sut2I4OY1Hs0X3oRu0jzqa4GHyRZmfLeLb6fZ4ONOsb5nPeX?=
 =?Windows-1252?Q?eUpljUFX5W82IRqAt8ubQhSXn+rIp4D4HL+i8lvnTwkOAeRminOfXqXy?=
 =?Windows-1252?Q?gkYfJhSYQErRjtu3r2ep3E1lK/UvOc4N4yTyZwBuAH1Jagl6UM9hve4U?=
 =?Windows-1252?Q?Wj6UPTBS1B2shkJacAG+3CarVDCdvTQaNzGkVrNYxK1azrXT3RiRt126?=
 =?Windows-1252?Q?PiK5FTtriaKua2E6ee8Hfqz5etQClYlnzv/dJPRuOHNhFz1Nc3v+6JWr?=
 =?Windows-1252?Q?KeFGqYZqUUTZNSNd/HBpZKpvfrObPwSGvRqUAjX/4HsNALckUvjmCK4A?=
 =?Windows-1252?Q?4TW5kN5wi65iTLJYr9jF5tWtSQtuUMsvHEfme7IzCux1kVfEthYVdIiu?=
 =?Windows-1252?Q?mU6I62Ch+DHtz/L0iJn5qbEPmjczi3IkyO5/DfIXcXeZzAnWIXD8Z/dv?=
 =?Windows-1252?Q?XVL1iGfzi6nc9vePp0LVjLb84bL33KaNsKF2jV+Rbm4TvqPTeqL8zqTz?=
 =?Windows-1252?Q?h+iNDVUAl9e5wbyU1DMA8/A0/1QItPBZqWo9kqdqUPXvLiNsiY35QTK2?=
 =?Windows-1252?Q?UCJ1rG+6/rZYTUFnoh9gyqEeCmR/8jJtzebUE4QLjbD2k9AcSK2Fjtzf?=
 =?Windows-1252?Q?lzLxHipdyTkdHt/ddXQNEGW0oKebGp4UaHcEYrmVKiFRN2Pke/Nspg?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM0PR01MB65148EFD114484DC62231CFF862C2AM0PR01MB6514eurp_"
MIME-Version: 1.0
X-OriginatorOrg: schindler.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR01MB6514.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25536b3-5ded-492d-b067-08dc4837a2f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 17:11:37.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: aa06dce7-99d7-403b-8a08-0c5f50471e64
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ndb4qYbS+Lky0mZj7G39oI3/H3qW+aj6XLPfTvzmUfw1VYRieaIqUKvphDtESOaPPMGg/gTp3eDszkY690z8gmHnb67ih15Oz0kSKZEcEQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB9065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 17:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197328

--_000_AM0PR01MB65148EFD114484DC62231CFF862C2AM0PR01MB6514eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sure I try as good as I can:

pulseaudio is part of my DISTRO_FEATURES, therefore "libao" depends on puls=
eaudio.

As far as I understand that is because in
meta-openembedded/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
I find this lines:

PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio'=
, d)}"
PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
PACKAGECONFIG[pulseaudio] =3D "--enable-pulse,--disable-pulse,pulseaudio"

In addition vorbis-tools depends on libao, because in
meta-openembedded/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-to=
ols_1.4.2.bb
I find this lines:

PACKAGECONFIG ??=3D "flac ogg123"
PACKAGECONFIG[flac] =3D ",--without-flac,flac,libflac"
PACKAGECONFIG[speex] =3D ",--without-speex,speex,speex"
PACKAGECONFIG[ogg123] =3D "--enable-ogg123,--disable-ogg123,libao curl"

Therefore if I would like to build
vorbis-tools-native it requires libao-native which then requires pulseaudio=
-native, at least in my case.

Since I do not know those projects (vorbis-tools, libao) well enough, I can=
not tell if this dependencies are really required or not.
Of course I would be happy if I can work without pulseaudio for this.
One solution might be to remove it from my DISTRO_FEATURES, but I cannot se=
e how I can do this when I need it on my target.

This is based on this commit of meta-openembedded repository:

commit a8310f7f31acdf273a3f51a75c74cc957375426e (HEAD -> scarthgap, yoctopr=
oject/scarthgap, yoctoproject/master)
Author: Khem Raj <raj.khem@gmail.com>
Date:   Sat Mar 16 19:52:58 2024 -0700

    layer.conf: Prepare for release, drop nanbield LAYERSERIES

    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Thanks a lot for looking into this.
Daniel


________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: 19 March 2024 17:38
To: Daniel Ottiger <daniel.ottiger@schindler.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace "pulseaud=
io-" with "${PN}-"

Please dig a little deeper, and inspect the recipes for vorbis tools and li=
bao and their respective source trees. I=92m just saying that converting co=
mpressed audio files shouldn=92t be requiring a sound server and it would b=
e good to understand why it does.

Alex

On Tue 19. Mar 2024 at 17.30, Daniel Ottiger <daniel.ottiger@schindler.com<=
mailto:daniel.ottiger@schindler.com>> wrote:
If I remove my bbappend file for enabling native compilation, and I try to =
build "vorbis-tools-native" I get the following error:

bitbake vorbis-tools-native
Parsing recipes: 100% |####################################################=
###########################################################################=
##############################################| Time: 0:00:05
Parsing of 3691 .bb files complete (0 cached, 3691 parsed). 5918 targets, 1=
137 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot: 100% |#########################=
###########################################################################=
##############################################| Time: 0:00:00
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'pulseaudio-native' (but virtual:native:/home/ottig=
eda/workspace/yocto-builder-scarthgap/meta-openembedded/meta-multimedia/rec=
ipes-multimedia/libao/libao_1.2.0.bb<http://libao_1.2.0.bb/> DEPENDS on or =
otherwise requires it). Close matches:
  pseudo-native
  pulseaudio
  usbredir-native

In case this is important, I also have meta-openembedded layer (https://git=
hub.com/openembedded/meta-openembedded) added.
Maybe the dependency is from there ?

Daniel
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.c=
om>>
Sent: 19 March 2024 17:14
To: Daniel Ottiger <daniel.ottiger@schindler.com<mailto:daniel.ottiger@schi=
ndler.com>>
Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org> <openembedded-core@lists.openembedded.org<mailto:openemb=
edded-core@lists.openembedded.org>>
Subject: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace "pulseaudio-"=
 with "${PN}-"

Wait, what do vorbis tools need pulseaudio for? It=92s an odd dependency, c=
an you check?

Alex

On Tue 19. Mar 2024 at 17.10, Daniel Ottiger via lists.openembedded.org<htt=
p://lists.openembedded.org/> <daniel.ottiger=3Dschindler.com@lists.openembe=
dded.org<mailto:schindler.com@lists.openembedded.org>> wrote:
avoid preferred provider warnings when compiling pulseaudio natively.

Enabling native compilation was done in a separate bbappend file for pulsea=
dio:
----
BBCLASSEXTEND +=3D "native"
----

pulseaudio is a dependency of vorbis-tools,
from which we like to use the native version of oggenc
in order to convert wav to ogg files as part of the yocto build.

Signed-off-by: Daniel Ottiger <daniel.ottiger@schindler.com<mailto:daniel.o=
ttiger@schindler.com>>
---
 .../pulseaudio/pulseaudio.inc                 | 78 +++++++++----------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc
index ae16056d243..85515b3581f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -145,9 +145,9 @@ do_install:append() {
        install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/de=
fault/volatiles/04_pulse
 }

-USERADD_PACKAGES =3D "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server =3D "--system pulse"
-USERADD_PARAM:pulseaudio-server =3D "--system --home /var/run/pulse \
+USERADD_PACKAGES =3D "${PN}-server"
+GROUPADD_PARAM:${PN}-server =3D "--system pulse"
+USERADD_PARAM:${PN}-server =3D "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

@@ -166,12 +166,12 @@ PACKAGES =3D+ "\
 # RDEPENDS we define for it in this recipe, and thereby ensure that when
 # adding the console-kit module to an image, we also get the necessary
 # consolekit package produced.
-PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseaudio-m=
odule-console-kit', '', d)}"
+PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-module=
-console-kit', '', d)}"

 #upgrade path:
-RREPLACES:pulseaudio-server =3D "libpulse-bin libpulse-conf"
+RREPLACES:${PN}-server =3D "libpulse-bin libpulse-conf"

-PACKAGES_DYNAMIC +=3D "^pulseaudio-lib-.* ^pulseaudio-module-.*"
+PACKAGES_DYNAMIC +=3D "^${PN}-lib-.* ^${PN}-module-.*"

 FILES:libpulsecore =3D "${libdir}/pulseaudio/libpulsecore*.so"
 FILES:libpulsecommon =3D "${libdir}/pulseaudio/libpulsecommon*.so"
@@ -200,7 +200,7 @@ ALLOW_EMPTY:${PN} =3D "1"

 CONFFILES:libpulse =3D "${sysconfdir}/pulse/client.conf"

-CONFFILES:pulseaudio-server =3D "\
+CONFFILES:${PN}-server =3D "\
   ${sysconfdir}/pulse/default.pa<http://default.pa/> \
   ${sysconfdir}/pulse/daemon.conf \
   ${sysconfdir}/pulse/system.pa<http://system.pa/> \
@@ -228,38 +228,38 @@ RDEPENDS:${PN}-pa-info =3D "\
                           ${PN}-server \
                           "

-RDEPENDS:pulseaudio-server =3D " \
-    pulseaudio-module-filter-apply \
-    pulseaudio-module-filter-heuristics \
-    pulseaudio-module-udev-detect \
-    pulseaudio-module-null-sink \
-    pulseaudio-module-device-restore \
-    pulseaudio-module-stream-restore \
-    pulseaudio-module-card-restore \
-    pulseaudio-module-augment-properties \
-    pulseaudio-module-detect \
-    pulseaudio-module-alsa-sink \
-    pulseaudio-module-alsa-source \
-    pulseaudio-module-alsa-card \
-    pulseaudio-module-native-protocol-unix \
-    pulseaudio-module-default-device-restore \
-    pulseaudio-module-intended-roles \
-    pulseaudio-module-rescue-streams \
-    pulseaudio-module-always-sink \
-    pulseaudio-module-suspend-on-idle \
-    pulseaudio-module-position-event-sounds \
-    pulseaudio-module-role-cork \
-    pulseaudio-module-switch-on-port-available"
+RDEPENDS:${PN}-server =3D " \
+    ${PN}-module-filter-apply \
+    ${PN}-module-filter-heuristics \
+    ${PN}-module-udev-detect \
+    ${PN}-module-null-sink \
+    ${PN}-module-device-restore \
+    ${PN}-module-stream-restore \
+    ${PN}-module-card-restore \
+    ${PN}-module-augment-properties \
+    ${PN}-module-detect \
+    ${PN}-module-alsa-sink \
+    ${PN}-module-alsa-source \
+    ${PN}-module-alsa-card \
+    ${PN}-module-native-protocol-unix \
+    ${PN}-module-default-device-restore \
+    ${PN}-module-intended-roles \
+    ${PN}-module-rescue-streams \
+    ${PN}-module-always-sink \
+    ${PN}-module-suspend-on-idle \
+    ${PN}-module-position-event-sounds \
+    ${PN}-module-role-cork \
+    ${PN}-module-switch-on-port-available"

 # If the server is installed, it's usually desirable to make ALSA applicat=
ions
 # use PulseAudio. alsa-plugins-pulseaudio-conf will install the configurat=
ion
 # that makes the PulseAudio plugin the default ALSA device.
-RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
+RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pulse=
audio', 'alsa-plugins-pulseaudio-conf', '', d)}"

 # pulseaudio-module-console-kit is built whenever dbus is enabled by PACKA=
GECONFIG
 # but consolekit depends on libx11 and is available only for DISTRO with x=
11 in DISTRO_FEATURES
-RDEPENDS:pulseaudio-module-console-kit =3D+ "${@bb.utils.contains('DISTRO_=
FEATURES', 'sysvinit x11', 'consolekit', '', d)}"
-RDEPENDS:pulseaudio-misc +=3D "pulseaudio-module-cli-protocol-unix"
+RDEPENDS:${PN}-module-console-kit =3D+ "${@bb.utils.contains('DISTRO_FEATU=
RES', 'sysvinit x11', 'consolekit', '', d)}"
+RDEPENDS:${PN}-misc +=3D "${PN}-module-cli-protocol-unix"

 FILES:${PN}-module-alsa-card +=3D "${datadir}/pulseaudio/alsa-mixer"

@@ -270,14 +270,14 @@ FILES:${PN}-module-gsettings +=3D "${libexecdir}/puls=
e/gsettings-helper ${datadir}
 # running for the duration of the user login session). The device-manager =
and
 # x11-* modules are referenced from the start-pulseaudio-x11 script, so th=
ose
 # modules must be installed when X11 is enabled.
-RDEPENDS:pulseaudio-server +=3D "\
+RDEPENDS:${PN}-server +=3D "\
         ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '\
-                pulseaudio-module-device-manager \
-                pulseaudio-module-x11-cork-request \
-                pulseaudio-module-x11-publish \
-                pulseaudio-module-x11-xsmp \
+                ${PN}-module-device-manager \
+                ${PN}-module-x11-cork-request \
+                ${PN}-module-x11-publish \
+                ${PN}-module-x11-xsmp \
         ', '', d)}"

-RDEPENDS:pulseaudio-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
x11', \
-                                  bb.utils.contains('DISTRO_FEATURES', 'sy=
stemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit',=
 d), \
+RDEPENDS:${PN}-server +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11',=
 \
+                                  bb.utils.contains('DISTRO_FEATURES', 'sy=
stemd', '${PN}-module-systemd-login', '${PN}-module-console-kit', d), \
                                   '', d)}"
--
2.39.2


*****************************************************************
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you are not the intended recipient of this mes=
sage you are hereby notified that you must not use, disseminate, copy it in=
 any form or take any action in reliance of it. If you have received this m=
essage in error please delete it and any copies of it and notify the sender=
 immediately.
*****************************************************************

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#197324): https://lists.openembedded.org/g/openembedded-=
core/message/197324
Mute This Topic: https://lists.openembedded.org/mt/105026949/1686489
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex=
.kanavin@gmail.com<mailto:alex.kanavin@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


*****************************************************************
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you are not the intended recipient of this mes=
sage you are hereby notified that you must not use, disseminate, copy it in=
 any form or take any action in reliance of it. If you have received this m=
essage in error please delete it and any copies of it and notify the sender=
 immediately.
*****************************************************************

*****************************************************************
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you are not the intended recipient of this mes=
sage you are hereby notified that you must not use, disseminate, copy it in=
 any form or take any action in reliance of it. If you have received this m=
essage in error please delete it and any copies of it and notify the sender=
 immediately.
*****************************************************************

--_000_AM0PR01MB65148EFD114484DC62231CFF862C2AM0PR01MB6514eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
Sure I try as good as I can:</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">pulseaudio is part of m=
y DISTRO_FEATURES, therefore &quot;libao&quot; depends on
</span><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size:=
 13.3333px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">pul=
seaudio.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">As far as I understand =
that is because in</span></div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
meta-openembedded/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb&n=
bsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
I find this lines:</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">PACKAGECONFIG ?=3D &quo=
t;${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}&quot;</span>=
</div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">PACKAGECONFIG[alsa] =3D &quot;--enable-alsa,--di=
sable-alsa,alsa-lib&quot;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">PACKAGECONFIG[pulseaudi=
o] =3D &quot;--enable-pulse,--disable-pulse,pulseaudio&quot;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">In addition vorbis-tool=
s depends on libao, because in</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">meta-openembedded/meta-=
multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb&nbsp;</spa=
n></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">I find this lines:</spa=
n></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">PACKAGECONFIG ??=3D &quot;flac ogg123&quot;</spa=
n></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">PACKAGECONFIG[flac] =3D &quot;,--without-flac,fl=
ac,libflac&quot;</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">PACKAGECONFIG[speex] =3D &quot;,--without-speex,=
speex,speex&quot;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">PACKAGECONFIG[ogg123] =
=3D &quot;--enable-ogg123,--disable-ogg123,libao curl&quot;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">Therefore if I would li=
ke to build</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">vorbis-tools-native it =
requires libao-native which then requires pulseaudio-native, at least in my=
 case.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 13.3333px; color: rgb(0, 0, 0); background-color: r=
gb(255, 255, 255);">Since I do not know those projects (vorbis-tools, libao=
) well enough, I cannot tell if this
 dependencies are really required or not.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">Of course I would be ha=
ppy if I can work without pulseaudio for this.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">One solution might be t=
o remove it from my DISTRO_FEATURES, but I cannot see how I can do this whe=
n I need it on my target.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">This is based on this c=
ommit of meta-openembedded repository:</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">commit a8310f7f31acdf27=
3a3f51a75c74cc957375426e (HEAD -&gt; scarthgap, yoctoproject/scarthgap, yoc=
toproject/master)</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">Author: Khem Raj &lt;raj.khem@gmail.com&gt;</spa=
n></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">Date: &nbsp; Sat Mar 16=
 19:52:58 2024 -0700</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">&nbsp; &nbsp; layer.conf: Prepare for release, d=
rop nanbield LAYERSERIES</span></div>
<div><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
0pt; color: rgb(0, 0, 0);">&nbsp; &nbsp;&nbsp;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);">&nbsp; &nbsp; Signed-of=
f-by: Khem Raj &lt;raj.khem@gmail.com&gt;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 13.3333px; color: rgb(0, 0, 0); background-color: r=
gb(255, 255, 255);">Thanks a lot for looking into this.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 13.3333px; color: rgb(0, 0, 0); background-color: r=
gb(255, 255, 255);">Daniel</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 13.3333px; color: rgb(0, 0, 0); background-color: r=
gb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif; font-size: 10pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> 19 March 2024 17:38<br>
<b>To:</b> Daniel Ottiger &lt;daniel.ottiger@schindler.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [EXTERNAL] Re: [OE-core] [PATCH] pulseaudio: replace &q=
uot;pulseaudio-&quot; with &quot;${PN}-&quot;</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto">Please dig a little deeper, and inspect the recipes for v=
orbis tools and libao and their respective source trees. I=92m just saying =
that converting compressed audio files shouldn=92t be requiring a sound ser=
ver and it would be good to understand
 why it does.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alex</div>
<div><br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Tue 19. Mar 2024 at 17.30, Danie=
l Ottiger &lt;<a href=3D"mailto:daniel.ottiger@schindler.com">daniel.ottige=
r@schindler.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left-width:1px; border-left-style:solid; padding-left:1ex; border-left-c=
olor:rgb(204,204,204)">
<div dir=3D"ltr">
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">If I remove my bbappend file for enabling native compila=
tion, and I try to build &quot;vorbis-tools-native&quot; I get the followin=
g error:</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)"><br>
</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">bitbake vorbis-tools-native</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">Parsing recipes: 100% |#################################=
###########################################################################=
#################################################################|
 Time: 0:00:05</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">Parsing of 3691 .bb files complete (0 cached, 3691 parse=
d). 5918 targets, 1137 skipped, 0 masked, 0 errors.</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">Removing 1 recipes from the x86_64 sysroot: 100% |######=
###########################################################################=
#################################################################|
 Time: 0:00:00</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">NOTE: Resolving any missing task queue dependencies</spa=
n></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">ERROR: Nothing PROVIDES 'pulseaudio-native' (but virtual=
:native:/home/ottigeda/workspace/yocto-builder-scarthgap/meta-openembedded/=
meta-multimedia/recipes-multimedia/libao/<a href=3D"http://libao_1.2.0.bb/"=
 originalsrc=3D"http://libao_1.2.0.bb/" shash=3D"KZWScHPZl54kGLSl2U/Q+GIoeY=
RIsUsM8jaM8KXJnBOoOCZ07yUmMEA0vF4tefl8pM3lwui/Qu9tegCG7f7JhvIqzL5okT0TD+5qs=
4M3KQe76G28vxkf6rr8z8y4FBp8in32xLjMkNbfG9RSK54/hGKwEkEWEugiOpYvOvqqm/0=3D" =
target=3D"_blank" style=3D"font-family:Arial,Helvetica,sans-serif">libao_1.=
2.0.bb</a>
 DEPENDS on or otherwise requires it). Close matches:</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">&nbsp; pseudo-native</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">&nbsp; pulseaudio</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">&nbsp; usbredir-native</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)"><br>
</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">In case this is important, I also have meta-openembedded=
 layer (<a href=3D"https://github.com/openembedded/meta-openembedded" origi=
nalsrc=3D"https://github.com/openembedded/meta-openembedded" shash=3D"AD0kn=
c+iAo6f9UY2cn1z+eg33l5kduF6Nd9Bora/y7bpEcG/y5VH+56oj3rD+zSYU7nBNvYOWCvzQHIl=
Ncd/BQVme4Ai7m7EnVle8tO5gwtcMqHKy1On2V+fjJbGnoKGqTJ4pqXOnFyjzHZqxymdmtDbHpe=
kE7pA1emV2Ip6ALQ=3D" target=3D"_blank" style=3D"font-family:Arial,Helvetica=
,sans-serif">https://github.com/openembedded/meta-openembedded</a>)
 added.</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">Maybe the dependency is from there ?</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)"><br>
</span></div>
<div><span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt;=
 color:rgb(0,0,0)">Daniel</span></div>
<div id=3D"x_m_807662092402552831appendonsend"></div>
<hr style=3D"display:inline-block; width:98%">
<div id=3D"x_m_807662092402552831divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt; font-family:Calibri,sans-serif=
; color:rgb(0,0,0)"><b style=3D"font-family:Calibri,sans-serif">From:</b> A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_b=
lank" style=3D"font-family:Calibri,sans-serif">alex.kanavin@gmail.com</a>&g=
t;<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> 19 March 2024 17:14<b=
r>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Daniel Ottiger &lt;<a h=
ref=3D"mailto:daniel.ottiger@schindler.com" target=3D"_blank" style=3D"font=
-family:Calibri,sans-serif">daniel.ottiger@schindler.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">
openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembe=
dded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family:Ca=
libri,sans-serif">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> [EXTERNAL] Re: [OE=
-core] [PATCH] pulseaudio: replace &quot;pulseaudio-&quot; with &quot;${PN}=
-&quot;</font>
<div>&nbsp;</div>
</div>
</div>
<div dir=3D"ltr">
<div>
<div dir=3D"auto">Wait, what do vorbis tools need pulseaudio for? It=92s an=
 odd dependency, can you check?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alex</div>
<div><br>
<div>
<div dir=3D"ltr">On Tue 19. Mar 2024 at 17.10, Daniel Ottiger via <a href=
=3D"http://lists.openembedded.org/" originalsrc=3D"http://lists.openembedde=
d.org/" shash=3D"yDMxr0d1ohGh624i5hG2ZBGOJxXUw8zRVQhWLak9htmcQs9xwV4+ZZq49s=
3qS65vNjTiGF345wjp5PrqVfAS7r8lLjeK8NzPr5Zu/CIT5dc9fvHv+Wz6zA0FFCuaQa1TGClR6=
xwMcZPNjZUMhtwKIMUFDp/V0OFrJRNPddxyqMY=3D" target=3D"_blank">
lists.openembedded.org</a> &lt;daniel.ottiger=3D<a href=3D"mailto:schindler=
.com@lists.openembedded.org" target=3D"_blank">schindler.com@lists.openembe=
dded.org</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex; border-left-width:1px; borde=
r-left-style:solid; padding-left:1ex; border-left-color:rgb(204,204,204)">
avoid preferred provider warnings when compiling pulseaudio natively.<br>
<br>
Enabling native compilation was done in a separate bbappend file for pulsea=
dio:<br>
----<br>
BBCLASSEXTEND +=3D &quot;native&quot;<br>
----<br>
<br>
pulseaudio is a dependency of vorbis-tools,<br>
from which we like to use the native version of oggenc<br>
in order to convert wav to ogg files as part of the yocto build.<br>
<br>
Signed-off-by: Daniel Ottiger &lt;<a href=3D"mailto:daniel.ottiger@schindle=
r.com" target=3D"_blank">daniel.ottiger@schindler.com</a>&gt;<br>
---<br>
&nbsp;.../pulseaudio/pulseaudio.inc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| 78 +++++++++----------<br>
&nbsp;1 file changed, 39 insertions(+), 39 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc<br>
index ae16056d243..85515b3581f 100644<br>
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
@@ -145,9 +145,9 @@ do_install:append() {<br>
&nbsp; &nbsp; &nbsp; &nbsp; install -m 0644 ${WORKDIR}/volatiles.04_pulse&n=
bsp; ${D}${sysconfdir}/default/volatiles/04_pulse<br>
&nbsp;}<br>
<br>
-USERADD_PACKAGES =3D &quot;pulseaudio-server&quot;<br>
-GROUPADD_PARAM:pulseaudio-server =3D &quot;--system pulse&quot;<br>
-USERADD_PARAM:pulseaudio-server =3D &quot;--system --home /var/run/pulse \=
<br>
+USERADD_PACKAGES =3D &quot;${PN}-server&quot;<br>
+GROUPADD_PARAM:${PN}-server =3D &quot;--system pulse&quot;<br>
+USERADD_PARAM:${PN}-server =3D &quot;--system --home /var/run/pulse \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--no-create-home --shell /bin/false \<b=
r>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--groups audio,pulse --gid pulse pulse&=
quot;<br>
<br>
@@ -166,12 +166,12 @@ PACKAGES =3D+ &quot;\<br>
&nbsp;# RDEPENDS we define for it in this recipe, and thereby ensure that w=
hen<br>
&nbsp;# adding the console-kit module to an image, we also get the necessar=
y<br>
&nbsp;# consolekit package produced.<br>
-PACKAGES =3D+ &quot;${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseau=
dio-module-console-kit', '', d)}&quot;<br>
+PACKAGES =3D+ &quot;${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-m=
odule-console-kit', '', d)}&quot;<br>
<br>
&nbsp;#upgrade path:<br>
-RREPLACES:pulseaudio-server =3D &quot;libpulse-bin libpulse-conf&quot;<br>
+RREPLACES:${PN}-server =3D &quot;libpulse-bin libpulse-conf&quot;<br>
<br>
-PACKAGES_DYNAMIC +=3D &quot;^pulseaudio-lib-.* ^pulseaudio-module-.*&quot;=
<br>
+PACKAGES_DYNAMIC +=3D &quot;^${PN}-lib-.* ^${PN}-module-.*&quot;<br>
<br>
&nbsp;FILES:libpulsecore =3D &quot;${libdir}/pulseaudio/libpulsecore*.so&qu=
ot;<br>
&nbsp;FILES:libpulsecommon =3D &quot;${libdir}/pulseaudio/libpulsecommon*.s=
o&quot;<br>
@@ -200,7 +200,7 @@ ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
<br>
&nbsp;CONFFILES:libpulse =3D &quot;${sysconfdir}/pulse/client.conf&quot;<br=
>
<br>
-CONFFILES:pulseaudio-server =3D &quot;\<br>
+CONFFILES:${PN}-server =3D &quot;\<br>
&nbsp; &nbsp;${sysconfdir}/pulse/<a href=3D"http://default.pa/" originalsrc=
=3D"http://default.pa/" shash=3D"oA+X+Zh/Envc02OKzM/hxyvVNIbyAPhwjGzJ0O6U8v=
GHCyjrdKcyFMFh7LKoic5FIAdSZG/IYgv7GMBGHNzLFjK7JYnweqvL+N2OGOzIwNFPY+0lakHTE=
kfsUwK99vbJFCQ2073THL1ulpAK7fCcBEtQBQVw62cx6KjSQDSpbCk=3D" rel=3D"noreferre=
r" target=3D"_blank">default.pa</a>
 \<br>
&nbsp; &nbsp;${sysconfdir}/pulse/daemon.conf \<br>
&nbsp; &nbsp;${sysconfdir}/pulse/<a href=3D"http://system.pa/" originalsrc=
=3D"http://system.pa/" shash=3D"vsoQcbnMnUYOROUVA+YjmfZo9eiYC2XYgLz+5zqUJgU=
+EMSWBw66UWZMHIzsFKhC3S4Z+taPl6uRE/KT3YR3/Z4LYb+TBwXkkpCTrLH/RsCWF5mYUpI9Rp=
M15LsvXmazpYWyFd8VgyjqhHJ9Vhyk3BfhvP1NzUBN4vpJDFDakn0=3D" rel=3D"noreferrer=
" target=3D"_blank">system.pa</a>
 \<br>
@@ -228,38 +228,38 @@ RDEPENDS:${PN}-pa-info =3D &quot;\<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;${PN}-server \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;&quot;<br>
<br>
-RDEPENDS:pulseaudio-server =3D &quot; \<br>
-&nbsp; &nbsp; pulseaudio-module-filter-apply \<br>
-&nbsp; &nbsp; pulseaudio-module-filter-heuristics \<br>
-&nbsp; &nbsp; pulseaudio-module-udev-detect \<br>
-&nbsp; &nbsp; pulseaudio-module-null-sink \<br>
-&nbsp; &nbsp; pulseaudio-module-device-restore \<br>
-&nbsp; &nbsp; pulseaudio-module-stream-restore \<br>
-&nbsp; &nbsp; pulseaudio-module-card-restore \<br>
-&nbsp; &nbsp; pulseaudio-module-augment-properties \<br>
-&nbsp; &nbsp; pulseaudio-module-detect \<br>
-&nbsp; &nbsp; pulseaudio-module-alsa-sink \<br>
-&nbsp; &nbsp; pulseaudio-module-alsa-source \<br>
-&nbsp; &nbsp; pulseaudio-module-alsa-card \<br>
-&nbsp; &nbsp; pulseaudio-module-native-protocol-unix \<br>
-&nbsp; &nbsp; pulseaudio-module-default-device-restore \<br>
-&nbsp; &nbsp; pulseaudio-module-intended-roles \<br>
-&nbsp; &nbsp; pulseaudio-module-rescue-streams \<br>
-&nbsp; &nbsp; pulseaudio-module-always-sink \<br>
-&nbsp; &nbsp; pulseaudio-module-suspend-on-idle \<br>
-&nbsp; &nbsp; pulseaudio-module-position-event-sounds \<br>
-&nbsp; &nbsp; pulseaudio-module-role-cork \<br>
-&nbsp; &nbsp; pulseaudio-module-switch-on-port-available&quot;<br>
+RDEPENDS:${PN}-server =3D &quot; \<br>
+&nbsp; &nbsp; ${PN}-module-filter-apply \<br>
+&nbsp; &nbsp; ${PN}-module-filter-heuristics \<br>
+&nbsp; &nbsp; ${PN}-module-udev-detect \<br>
+&nbsp; &nbsp; ${PN}-module-null-sink \<br>
+&nbsp; &nbsp; ${PN}-module-device-restore \<br>
+&nbsp; &nbsp; ${PN}-module-stream-restore \<br>
+&nbsp; &nbsp; ${PN}-module-card-restore \<br>
+&nbsp; &nbsp; ${PN}-module-augment-properties \<br>
+&nbsp; &nbsp; ${PN}-module-detect \<br>
+&nbsp; &nbsp; ${PN}-module-alsa-sink \<br>
+&nbsp; &nbsp; ${PN}-module-alsa-source \<br>
+&nbsp; &nbsp; ${PN}-module-alsa-card \<br>
+&nbsp; &nbsp; ${PN}-module-native-protocol-unix \<br>
+&nbsp; &nbsp; ${PN}-module-default-device-restore \<br>
+&nbsp; &nbsp; ${PN}-module-intended-roles \<br>
+&nbsp; &nbsp; ${PN}-module-rescue-streams \<br>
+&nbsp; &nbsp; ${PN}-module-always-sink \<br>
+&nbsp; &nbsp; ${PN}-module-suspend-on-idle \<br>
+&nbsp; &nbsp; ${PN}-module-position-event-sounds \<br>
+&nbsp; &nbsp; ${PN}-module-role-cork \<br>
+&nbsp; &nbsp; ${PN}-module-switch-on-port-available&quot;<br>
<br>
&nbsp;# If the server is installed, it's usually desirable to make ALSA app=
lications<br>
&nbsp;# use PulseAudio. alsa-plugins-pulseaudio-conf will install the confi=
guration<br>
&nbsp;# that makes the PulseAudio plugin the default ALSA device.<br>
-RDEPENDS:pulseaudio-server +=3D &quot;${@bb.utils.contains('DISTRO_FEATURE=
S', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}&quot;<br>
+RDEPENDS:${PN}-server +=3D &quot;${@bb.utils.contains('DISTRO_FEATURES', '=
pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}&quot;<br>
<br>
&nbsp;# pulseaudio-module-console-kit is built whenever dbus is enabled by =
PACKAGECONFIG<br>
&nbsp;# but consolekit depends on libx11 and is available only for DISTRO w=
ith x11 in DISTRO_FEATURES<br>
-RDEPENDS:pulseaudio-module-console-kit =3D+ &quot;${@bb.utils.contains('DI=
STRO_FEATURES', 'sysvinit x11', 'consolekit', '', d)}&quot;<br>
-RDEPENDS:pulseaudio-misc +=3D &quot;pulseaudio-module-cli-protocol-unix&qu=
ot;<br>
+RDEPENDS:${PN}-module-console-kit =3D+ &quot;${@bb.utils.contains('DISTRO_=
FEATURES', 'sysvinit x11', 'consolekit', '', d)}&quot;<br>
+RDEPENDS:${PN}-misc +=3D &quot;${PN}-module-cli-protocol-unix&quot;<br>
<br>
&nbsp;FILES:${PN}-module-alsa-card +=3D &quot;${datadir}/pulseaudio/alsa-mi=
xer&quot;<br>
<br>
@@ -270,14 +270,14 @@ FILES:${PN}-module-gsettings +=3D &quot;${libexecdir}=
/pulse/gsettings-helper ${datadir}<br>
&nbsp;# running for the duration of the user login session). The device-man=
ager and<br>
&nbsp;# x11-* modules are referenced from the start-pulseaudio-x11 script, =
so those<br>
&nbsp;# modules must be installed when X11 is enabled.<br>
-RDEPENDS:pulseaudio-server +=3D &quot;\<br>
+RDEPENDS:${PN}-server +=3D &quot;\<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${@bb.utils.contains('DISTRO_FEATURES', '=
x11', '\<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pulseaudio-module-=
device-manager \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pulseaudio-module-=
x11-cork-request \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pulseaudio-module-=
x11-publish \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pulseaudio-module-=
x11-xsmp \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PN}-module-devic=
e-manager \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PN}-module-x11-c=
ork-request \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PN}-module-x11-p=
ublish \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PN}-module-x11-x=
smp \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;', '', d)}&quot;<br>
<br>
-RDEPENDS:pulseaudio-server +=3D &quot;${@bb.utils.contains('DISTRO_FEATURE=
S', 'x11', \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.utils.contains('DISTRO_FEAT=
URES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-con=
sole-kit', d), \<br>
+RDEPENDS:${PN}-server +=3D &quot;${@bb.utils.contains('DISTRO_FEATURES', '=
x11', \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.utils.contains('DISTRO_FEAT=
URES', 'systemd', '${PN}-module-systemd-login', '${PN}-module-console-kit',=
 d), \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'', d)}&quot;<br>
--<br>
2.39.2<br>
<br>
<br>
*****************************************************************<br>
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you
 are not the intended recipient of this message you are hereby notified tha=
t you must not use, disseminate, copy it in any form or take any action in =
reliance of it. If you have received this message in error please delete it=
 and any copies of it and notify
 the sender immediately.<br>
*****************************************************************<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197324): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197324" originalsrc=3D"https://lists.openembedded.o=
rg/g/openembedded-core/message/197324" shash=3D"MmOoHTlXaEelfUqqkkRnu9I8JV/=
Q3SNDDwIojru4qT4rQ8UZ6j5hxR2Y9XaNC39xQFygsFApgTGjFen//C1UWkLbV8U2t2kVD2vA4N=
AUH/NJ0e10j7mrvdJOrgOc/nsglyjTwU4efijUcnMUo5m3s8IRe4mbYCNT0Yq/TmkXfHY=3D" r=
el=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/197324</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105026949/168=
6489" originalsrc=3D"https://lists.openembedded.org/mt/105026949/1686489" s=
hash=3D"gM+h6maWi3TTIB3xLJHx6S/z0mBIluNjFsPwrchcJh+Htl+Uy2BIoAM2U934O9PbmqW=
KCBTURSJGwl8vkGuX6AZnn9hArWHbIeVQpNsK/cbQBOz0ysQ4nzBjmZ4kftdvOihSZ8rluDISjw=
sjlG/bOiJSyxys+4goXoDwpyPnR08=3D" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/105026949/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" originalsrc=3D"https://lists.openembedded.org/g/openembedded-core/un=
sub" shash=3D"o6EyAqvCQCPhAceiUGrnuo5gylRSTC2NLQyu26UptdCbcaIcAE2I2Ncf+B2Hx=
Gu3t8fdjPIQu+8KRNPyMJdhAMPr26Y2FJQ1dXqy/dbVoktPrT7xhmAUhYlc51MLhGQT8eUgZAOW=
WItiWsrL1tuNHMGoYaD/xMsNTdHk3v20QKI=3D" rel=3D"noreferrer" target=3D"_blank=
">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
<br>
*****************************************************************<br>
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you
 are not the intended recipient of this message you are hereby notified tha=
t you must not use, disseminate, copy it in any form or take any action in =
reliance of it. If you have received this message in error please delete it=
 and any copies of it and notify
 the sender immediately.<br>
***************************************************************** <br>
</div>
</blockquote>
</div>
</div>
</div>
<br>
*****************************************************************<br>
The information contained in this message is intended only for use of the i=
ndividual(s) named above and may contain confidential, proprietary or legal=
ly privileged information. No confidentiality or privilege is waived or los=
t by any mistransmission. If you
 are not the intended recipient of this message you are hereby notified tha=
t you must not use, disseminate, copy it in any form or take any action in =
reliance of it. If you have received this message in error please delete it=
 and any copies of it and notify
 the sender immediately.<br>
***************************************************************** <br>
</body>
</html>

--_000_AM0PR01MB65148EFD114484DC62231CFF862C2AM0PR01MB6514eurp_--

