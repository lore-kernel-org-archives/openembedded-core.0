Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99074E9DE5E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:49:43 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127412.1775720973632494345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=YyffnkDs;
 spf=pass (domain: axis.com, ip: 40.107.162.24, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aje8T5x/S1InWzPM+Rmh4os0hGglSuqGWa9lfB1NaHTFMLMMuKlmfrNbQLOiaiWDjQw5hTrl3XheCGprWNm51FW6eI5RKNndXZNOCyDBstvSonMLUb3FePRHFaP9xeAIRHoWJfsIhJfF8tWnqsquYBB24d6TGRhAeRtT/3pfF+gzdH7T2nQ19POsz5Ow6gi3Fg54owBVL2VSEdHa2n3m5Mg+Td1JdGInsBO98p70ORihYM/sdMCfPdZHSOmWY9fCpnl1JbEK65BLzc2ZwWzlFaru7cDJQ2OKGR33nsYQniDTzc/AO/PKqf337cFumkxtCHWkrYaPPHSGYKf9l/Vikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LxKWEQ95IbOhndulQlIZHwbS8xFJjro1lS6X3hjdNI=;
 b=ev+KUFiavWxTs28KY3i8aCVNrJUp4srZfNF4z4/g+gdj1CPhsst/pM8ZKcotDIVGeav+nVbXkENXzsn00M5QtLgVZ0Rx8iYlvXivDJ2BdTiek2B4XZIzFCL+cJ6JfMR8CxlScWpiY6Gaz8ae1xHWB69aCsgAd2VCYH1VLXcErQSLaPEySWDE66eePQuSHgYrsN9QIQCpbl0B25OldY+gPUowo2cIpq2eylTVmsMU6bU0EIZ17BFC1CsFeSFxa+x6QNBRN3KK9br2+11ioje6+RZO07ZSfsw40b3k/UqqXQ1qeX0MZ+BaysLc+a8xjzvmmwsv4GRH9jkFOKJwF24Eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LxKWEQ95IbOhndulQlIZHwbS8xFJjro1lS6X3hjdNI=;
 b=YyffnkDsXsMYGONEj3tmZnOgU1OYMEuEo7J8YaH06ZhTX/gS//7TziyLHzjQ2pNSnp7RrHsemAqEPj3pGKMxuaVdkUGgGPpSB9S7I96BPitmI8xy69zXwIQUv5UA3NwZEuQZ152tqzFn6wykBXTl5SHdjWRl9jg/2mMScfR8b34=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB10271.eurprd02.prod.outlook.com (2603:10a6:20b:634::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 07:49:29 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 07:49:29 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>, "rs@ti.com"
	<rs@ti.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"ross.burton@arm.com" <ross.burton@arm.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
Thread-Topic: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
Thread-Index: AQHcx5GrcKDjlhhgMU+wBvLkmWXAT7XWJBcAgAA2ihA=
Date: Thu, 9 Apr 2026 07:49:28 +0000
Message-ID: 
 <DB5PR02MB10213895DC73E4599A411B050EF582@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260408195024.1874335-2-rs@ti.com>
 <adcqUntpjuEXPLyw@navimatix.de>
In-Reply-To: <adcqUntpjuEXPLyw@navimatix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB10271:EE_
x-ms-office365-filtering-correlation-id: 343bcd40-3deb-48a8-9baa-08de960c877f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 
 VQsQ22rnKwzEyIBq+aBHr3t0jLBUFe2303YF50SpLiLnvOXL4/L2agpH4utvDn2bNrEBOh0McSLudSUmurVbER7V9K+33Y3HF44Ds/FPD9D3rRi67C5huHo1JH9JMXF7kZeCZUshwfKcZFrdQL5aQnuhlFoIwgo2mNC22nxM1+dn/DimcHXnj8xx/WeMBr/CjawU4WwNOBr6tvEaqUxFRM6O1m+/d5VMKXBJ9tV5evM0OpZha7amZUdh52rNKP54KQmSdR95cQztxAsC3JCLVdP7kYYzEdmVA/w5gOKlsjiV9UaQc76aFg/wBoMPqj9plVETPnnw84Ttd3MzSYx1CfOZSrl40DL2LuZWMYtp3QFBNpzl532uPMHG453yQfNkp0cEPMxuI5osGz0KcNulUZckBqQyiAHHTvwnesU+Q9bHA5pOr1Wh5Ui0sFS11xA7n+5D4XfiTg9W0CfrCqIsevbTeX9TPjgEh5LCKSR0Z8QtWaR4sdItRsH+SadHVGUiHyr9N7d7P2F2iHuNPaqHz5IpIuHjXK2krE788NLWUkzosjup9Dodu6npn0FMe20VpVJLrAHa1wRZQe0BByCjMi8objs20gd8RdgS5eY/A4R0BGiPn82IN7ma25AR4uu81A3TxSciAKWzsm8Wu7T6y0776shQz+OyLOMi3IMG8skfQBlgDF1rKMa+pMarTULeuSSd/UqXGRliSeQCZO6RQD+Cw7DiM9RGxUNU83NOQrKFLQimfau0AjqLOfhZBVqujMh6BrYMUyagj36P4PBCripk6rDPVUnZdZwvRBuJo+k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0uvDcgjsvNgshS1oyW9QimLqAgEg/ErfFlf0h3YGKyebiF8qd8SkUx+6kv?=
 =?iso-8859-1?Q?4S5iwke0WPUWX3jGiFSid+ROy//YatrIyZyBo4Aaj5S44w5b6xIDgW3V/R?=
 =?iso-8859-1?Q?FbhPCpqSzbIm9ttV2u+Zh5M6MWKlwOQXkSQzNG8sQoQxnBUOyVoKESQJpW?=
 =?iso-8859-1?Q?Uc8YuwvC2G13H3SW0ljemABeyT7qQAJFlb2EKaZ2HHdNZyq4lkmeWwL/0Z?=
 =?iso-8859-1?Q?wB8tgC3aR4LTSrNP8LYl1aPNlqVAAq6azS4+dj12QTvsYvOwZDTkXWsdEq?=
 =?iso-8859-1?Q?XFxgb+Vgzpmkp29p4JUMHdCc0rW7sRBNa+JvpWNmB7E63ar+2PFIGud0f4?=
 =?iso-8859-1?Q?n0Ppv8neEA4arI8yrmgFMR/lpqT8CEJY9GpmmYQpDYnkcTOeEakRkS5lEJ?=
 =?iso-8859-1?Q?7svjcTRllgwETuMqNvY3rnVAYOx0u6XxkxF8aFR9zhYuzCqhoETwIkF/Xf?=
 =?iso-8859-1?Q?KCPrrIRi9sBhPt+oea3t5TrU+5lpJK0zbE/34JTtUo/rD2unoF850sof82?=
 =?iso-8859-1?Q?kZtNUV6n0L/9EIydFjHbiIWWrGfgrmMYUh1O36ThjDb0PYm7j2ZH68YUyZ?=
 =?iso-8859-1?Q?jzTTsui6Hkzspt/c4avHCvtKXJHP3nYriSq+rAQGqdYG30w1diPS0Vb1gu?=
 =?iso-8859-1?Q?y44Vj2jFB8MCLsrFcz8njVZYyW7ZbCHA5OdsnwDdcGdgvW42EN5AzTAdUg?=
 =?iso-8859-1?Q?bW7JH0L6NCwjfmiOPKi861M1JzaVh4SA7A6vy7/vzp5XwhP9iyiNSVmUUn?=
 =?iso-8859-1?Q?j+uBm15NXwZwbKslHnkO6MbLNFT96bQCvDvqvQ2LFZm8wpdDO7gJbgY+UT?=
 =?iso-8859-1?Q?2EOjmFyBrpeNTZiojfFenJhLt4RggKq2BCx//ogH8p4mt5svERvvAaMfOo?=
 =?iso-8859-1?Q?I5q1wvU4nTcc73G+3nrBVeHf6GyvD4y9xz0i6/7dlTSX/O3t2LfbCYhOG3?=
 =?iso-8859-1?Q?TC4yAPdGcOT5aVRG0CN4VIDRL9jPDtPZ1nat+eXfTrcrhF2WplM9JlgBcb?=
 =?iso-8859-1?Q?tspg0Z2N/9YcuUYjTIy81EAnlIuHNC33u/dD+NX/mJJwEuMN+/YGmosnFZ?=
 =?iso-8859-1?Q?SMMwVPYWkh+FfXUZuOFtDc8KkirQ3JYCuGbV3w7mpsLE4zXLSqkb9+g2JY?=
 =?iso-8859-1?Q?LbIWBg0YkEycIwPq+MWSMSeTlTQ/VLt29B8J32ierwHgrqk+pn9IRNo0e0?=
 =?iso-8859-1?Q?/rR/cTecp+r9evh4aJNqSBCNtBEgmPC1MkBuHbVBPgfOY83teN9T1XBb8+?=
 =?iso-8859-1?Q?NRcScz7dvMABh7JsqVH3U7hoJGlM5xho1cBgJZVkzGaADovjtVpcI33BGe?=
 =?iso-8859-1?Q?2fwPZaLigbjgA5sII5OkMIb5qP9z3dG9af+99A+TAlK9UKBlj/a6zDLErP?=
 =?iso-8859-1?Q?8DyZ9yV7i+c5ARXwaLpt03DM8i4wF9KsgCxOp7uYVh8m8wlUAAyiOqRaqg?=
 =?iso-8859-1?Q?rXfeeerkYEpCHwhdEpzh8qWKSBd8WCAfSaRczz5qoiNtmP+Selx4HN+C37?=
 =?iso-8859-1?Q?eJsS4xb7UrqBLKzBtR+imCw42/0cr2Zl84OlsQXk5XTfmCMQjWsqUMo0w7?=
 =?iso-8859-1?Q?mENuxFU0sab8aJBp5XhepBimsZG/XczzhqrGWDo+t7vy0EBWfAKuvI7roV?=
 =?iso-8859-1?Q?FJpt4DK8nrfJQCnnrHn/2x0R3FUTI1wlE6m4+U8SQV+iS2STMfQKxlB+af?=
 =?iso-8859-1?Q?jlKA9ytNwjZ1Aqg4LJD6jL3gBcwxjQHJ2wtm1xfVStzo88TuJ05TIgxkdS?=
 =?iso-8859-1?Q?SWF/syzoDWhEb1Jhe3MNeC6kM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343bcd40-3deb-48a8-9baa-08de960c877f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 07:49:29.0037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m3ZODoEQQrK6HcUfyzGqgDglydyXopdbK4WLFeB8spwTsUdcC/1aNDrPwivK1YsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 07:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234889

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of J=F6rg Sommer via lists.openembedded.org
> Sent: den 9 april 2026 06:31
> To: rs@ti.com
> Cc: richard.purdie@linuxfoundation.org; ross.burton@arm.com; mathieu.dubo=
is-briand@bootlin.com; openembedded-core@lists.openembedded.org
> Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
>=20
> Randolph Sapp via lists.openembedded.org schrieb am Mi 08. Apr, 14:50 (-0=
500):
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 84450386d9..29301534d2 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURE=
S', 'usrmerge', '${exec_prefi
> >
> >  # Base paths
> >  export base_bindir =3D "${root_prefix}/bin"
> > -export base_sbindir =3D "${root_prefix}/sbin"
> > +export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrm=
erge', '${root_prefix}/bin', '${root_prefix}/sbin', d)}"
>=20
> Maybe:
>=20
> export base_sbindir =3D "${root_prefix}/${@bb.utils.contains('DISTRO_FEAT=
URES', 'usrmerge', 'bin', 'sbin', d)}"
>=20
> or
>=20
> export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerg=
e', '${base_bindir}', '${root_prefix}/sbin', d)}"

This one. For the unlikely case that someone modifies base_bindir.

> >  export base_libdir =3D "${root_prefix}/${baselib}"
> >  export nonarch_base_libdir =3D "${root_prefix}/lib"
>=20
>=20
> J=F6rg

//Peter


