Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA915C71130
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 05:45:11 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web11.12115.1751953510432436181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 22:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=HmaNP0hi;
 dkim=pass header.i=@bmw.de header.s=selector1 header.b=msIfdMAi;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=277728930=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751953510; x=1783489510;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Tv+08JkqRLXDvBXQVpKZ6v2BuSUFTdizD7ucq3K0VwQ=;
  b=HmaNP0hi30+sylCAunR1RiuSqwRHq+IYF4sRbpeOj9rIftjXykAqHj5O
   JAetzVr0ueyMKSrvGVbiY9uXEOhzNeJFgv7N783FkYreehcYs//DG2Hs8
   mxKv69qjrf52W9UFDb0As+4ShVoTOQrzJqbdIQiYrHPy79naAzuX60R76
   k=;
X-CSE-ConnectionGUID: kEdtzLxhT5+ny/AXRHuWUw==
X-CSE-MsgGUID: JNvdJrbfSZ2Jd8i3G7qZ9A==
Received: from 160.46.252.39.spf.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 08 Jul 2025 07:45:07 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw4.muc with
 ESMTP/TLS; 08 Jul 2025 07:45:07 +0200
Received: from smucmp17e.bmwgroup.net (HELO smucmp17e.europe.bmw.corp)
 ([10.30.13.155]) by esabb3.muc with ESMTP/TLS; 08 Jul 2025 07:45:08 +0200
Received: from smucmp18c.europe.bmw.corp (2a03:1e80:a15:58f::1:5c) by
 smucmp17e.europe.bmw.corp (2a03:1e80:a15:58f::1:155) with Microsoft SMTP
 Server (version=TLS; Tue, 8 Jul 2025 07:45:07 +0200
Received: from smucdzmp12.europe.bmw.corp (192.109.190.62) by
 smucmp18c.europe.bmw.corp (10.30.13.161) with Microsoft SMTP Server
 (version=TLS; Tue, 8 Jul 2025 07:45:07 +0200
Received: from DUZPR83CU001.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.62) with Microsoft SMTP Server
 (version=TLS; Tue, 8 Jul 2025 07:45:07 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 GV1PR09MB5922.eurprd09.prod.outlook.com (2603:10a6:150:95::13) with
 Microsoft SMTP Server (version=TLS; Tue, 8 Jul 2025 05:45:05 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Tue, 8 Jul 2025
 05:45:05 +0000
X-CSE-ConnectionGUID: NO829KbmRx+XAXzS9DcVdw==
X-CSE-MsgGUID: wf16/oFJS0a9P8XLHZ9OTw==
X-CSE-ConnectionGUID: 9mStOuzWTfK9G+PciY/4ow==
X-CSE-MsgGUID: /Uib7b9RS3eZ88CfFF/pPA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrPFNwywFzBBmCJu8Y/8oPIcxWvOqj2MLitt71LPVwq3EVX8voZtoRt5OBAcJ6nz7bWW0QkFnPUPD9jmiuhlwpk9wHiPSOPBU/Ysgc2EjJKQGg180Mf3UNbjieC69IQwShaDbr8O/RorzTvp5HkdWPNnyweIrO96VYtxJadDKuLQdToixVCYD76LQyQRcpA1pV8IN7tKhN7YwgSjMLGif/4PS74gvHU5qUquYnK4ACel2pBkDAwCfiCIDwTQovCLn1Vr4jN11cgidPA82cnyuibn9wvrPyw0umPKfRd5ESz3N23dbRk8a40u/L/6fPzbekG2axx/chupQJu355sOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tv+08JkqRLXDvBXQVpKZ6v2BuSUFTdizD7ucq3K0VwQ=;
 b=bFS8MtbrI+MbW3UnlUlf2P91OBSJOd4rLBY9sYgMIdYN1BeTnX8xasNrtG5d11PA3V9McK8hMoCU6urhHVU57XsomllBgnniVWIN9y8SmcsYzM7t/8mqAQtMCVdqb9LgS+ecRKZ94MNNDLBqDjadelSudBEaKvmVe4sWm/ZIEa2R0Mz0LHhhev29bzSgddWieyfGiHGf3X3cwZPTVrOSl8YgeE1n4NquGuxySthgomKDWWj0gfSRntIS/MZiswlNC+1wLVs6U0ryNKYWvgGca8R6YRsp1VgqXx+gJs9jujBKZKHSagQvbb51hs+RXAztFLcSkrtP/SB9KbkXePefZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv+08JkqRLXDvBXQVpKZ6v2BuSUFTdizD7ucq3K0VwQ=;
 b=msIfdMAi+38FSY6rVr2XqvVTK38fXuOnelwPJ2o/CW12ICtmCSB6WujyTYTUD8U+3JTcg+eLYm3HMiAlBrHnfMsiPgrj+IVK6q6MSVqp4G1eaDPsBcDukpJ3mKJMrJInYIQbtcps/P75VsRU+rl0gmfPFE9sSXBOFWEx4jCAgVfsWysmt5AUpX9in3npFBzvpr/xwTTxk2rpK7H56ISSf0gkjGztb0oI/2VjH+UnMFWIG8bsBiF0n21jebbouozkKR+XZshqjNITBVn7/x1bSlVdMkpsrbfucZxiX/q8E7PmuYOjoqX/Kck15RHZN1QcGiQlNWwQLvCv6osbxqrnqA==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "quentin.schulz@cherry.de"
	<quentin.schulz@cherry.de>, "antonin.godard@bootlin.com"
	<antonin.godard@bootlin.com>, "Peter.Marko@siemens.com"
	<Peter.Marko@siemens.com>, "alperyasinak1=gmail.com@lists.openembedded.org"
	<alperyasinak1=gmail.com@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
Thread-Topic: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
Thread-Index: AQHb7B5CjI6NXM094ECHIurQrbECvLQm5xCAgADTGm4=
Date: Tue, 8 Jul 2025 05:45:05 +0000
Message-ID: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20250703132720.3378569-1-Moritz.Haase@bmw.de>
 <CAMKF1sr80kZEZunuw4mo32TbKXdrGUb853J8sA3EHuvc8suN3g@mail.gmail.com>
In-Reply-To: <CAMKF1sr80kZEZunuw4mo32TbKXdrGUb853J8sA3EHuvc8suN3g@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|GV1PR09MB5922:EE_
x-ms-office365-filtering-correlation-id: f30e4510-7df7-49dc-4f59-08ddbde2974c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?utKYJnI6mRcaErfRplVbCSaVyhtfoCoRLoSVPw9Iy4VS1MUsdnm7YnECXo?=
 =?iso-8859-1?Q?kdtu63SMNvrduFhq61ErYAPw1NEzpZahHbwwJMn0gDbRq0edgF1Uudx/PY?=
 =?iso-8859-1?Q?k0TpbE85v3n5eGGvk0ADKRxCkYWC5K8qSexdelb4+cAJKbdHZwa8XofOvF?=
 =?iso-8859-1?Q?gnDtOmqAr3aBvHW0v+fCdoyCyb5WxFeUFZseRGnwWWDylOhaRbfBkmjYXj?=
 =?iso-8859-1?Q?2jFyqpj6gkid/iR5OVmm2qJ/LrpNJ8cAFSUDUb1RIoRwdwnqVoEvkuJbxI?=
 =?iso-8859-1?Q?cWN+oExH0tRdTsy4/ZT8kkbn/M+su83LyNqcUjYPDclERvV2rBKDly9qcP?=
 =?iso-8859-1?Q?k8jyGx/r8WCRt0fQp+DYhTfEmJtfnD9nyXopc36e9DcpsJH6FF3y+T5tcA?=
 =?iso-8859-1?Q?MBdOSy0qzy5TDm9YPtANyM9IyaWUrPclLdgSrJikDNNi7JXNzyXfI12GTi?=
 =?iso-8859-1?Q?fNjqmF//mCFwDlQ5a3OSgUfjM7ySTQ4msP28Jo6/TGbvKUrXxhJP1aP7ZH?=
 =?iso-8859-1?Q?/tzO8epAwaLYwUIomS6yBinLCCiC8SiHZrf542NY/dZuA0WTd4oy7q7s4h?=
 =?iso-8859-1?Q?aeGjW2E1dzlaLZ02GQz1CZ+T/XVFpT70kFdVMDoYM1UtyQxNbz3HsPTSSC?=
 =?iso-8859-1?Q?UFX/nU/L8KCheYDdacavuqBr3FUDslnQPoluHE1erHPW0uOGRyIihactN9?=
 =?iso-8859-1?Q?vfwY1SHRXM3/mVqSaW+AOUkiiOvZ8Hg4MpP8VUl0VNUHKG5JJvuzy+vsXD?=
 =?iso-8859-1?Q?aAXQz5hhRmdU50jceQg6Nadxvbee2SKAEO4QXTMW78MzbZiMmIHkpJ31QG?=
 =?iso-8859-1?Q?eGwh1nQgLA+rklomPwaG6gymDO4dVwf1ggdYFxxNNz5tZYQEdXeDqQsWnW?=
 =?iso-8859-1?Q?XhoXmlsnmLmMKxNpqWh8fTqhvpIShvR91VeiNVUH0IcTGOGjcDK5URgheX?=
 =?iso-8859-1?Q?u6z1BFYNhyRvGkXwA3XXY0GoXlZ/6o0jAURhKYO5WM7eSh/YCceekDWUF4?=
 =?iso-8859-1?Q?0pAe42U6VIV7Jztl7koFSjIKL2fohOUhFR9Fg/Khvu1/Uu58Tu2syfSn9R?=
 =?iso-8859-1?Q?Wwgu2TL4hFnE0ckbLUm4GK2NSafx1Em9AGU3RRWCOuGrL6dHxzoyciVYSR?=
 =?iso-8859-1?Q?YorVvHVGeHKN/jlgpRLsL3hDOA31yeaxoCOQjMJ9JIBzEdZkwpyfF8VRRp?=
 =?iso-8859-1?Q?hTBbH7NzUDnZ8VelMwRqKoj9CZqRFBUtLOXgsFE7l1D/x4Yhj/tokfuIVr?=
 =?iso-8859-1?Q?IeBEFx0KB2/AQB6Po6ffGjASQTYQeY9ZNwzFT2cnpktZvsRxVOkCt0ps1e?=
 =?iso-8859-1?Q?dhP2GX43jnn/Jbl3qOSbAMVt9E8czt5uqcQqC2VSgcG02k0trW/5wRXami?=
 =?iso-8859-1?Q?3gJNMD6ElbLWeaIG+CUHevyWxh+uNFkwhW5ta4I+Zoz57cM05yAlUH5UXi?=
 =?iso-8859-1?Q?cKbLL630YBNtinNAbRfPdwRTo6FvtlFVQtzl3gqZZcb+FrWe3idDpNc6m7?=
 =?iso-8859-1?Q?E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?V37j0CuOeRMgpB8T6oZ0dO+tzjd+HbdverYHaccsDtvMUTDcx9mhBp9BfL?=
 =?iso-8859-1?Q?l8tiLMx0dxd7iKk/zevCljFSZiRsq+2pmXeGHp12KnMiMjSv10twnx9GWT?=
 =?iso-8859-1?Q?Qd9nk21aYrbt8jBwIKkfQuJiNIDK7WqkmO2CtC7pGtQCwufrCR9RDEOUT+?=
 =?iso-8859-1?Q?T/XfMNmtdXE4VV4uE2FjCEwAmLXi0uu60/SoUSoBeyaUN9UglIQhhcqq4t?=
 =?iso-8859-1?Q?CpjWgEv5GunikL8x3GmJfO/LYUyKPWZvTHZISM1FK1lBneu/b8JhSAGIgp?=
 =?iso-8859-1?Q?SZBR8F02DQpaVKt9mILhW3RbvmzPwN5mqfyidrdoqjDy5oNoxWr2KRVjds?=
 =?iso-8859-1?Q?ZyAYYbimRiuHL3LzqPC1josOxw6P3OpgbF0Y//GLJJHktj/OR0RoKgSbF4?=
 =?iso-8859-1?Q?Peg10HWMZew3j1cTpkr+WS9MqCk5cnZFhdmfWn1eAnZt00Z7l9AhjY/tS9?=
 =?iso-8859-1?Q?OuqCXatXxN8D5Phd+H9YXn0QtNEHa4jxvc9uplXMzQTjD8og1DOaEhY2LL?=
 =?iso-8859-1?Q?pjigJ3wcywdJcj3ZERgBZ26JNYJJHBq6oSFGUFhE74Lm+r9KnQG788aLh1?=
 =?iso-8859-1?Q?QBgGKv3TB5bMWbgoVJROAggnOs3Yc6JJiMywWirXL7wfkLs/Mo1NkG7Cjf?=
 =?iso-8859-1?Q?UIZoPFz0T4u2MpSzPdm2lhvvhICj/pyqopDgH4R4YGXEUUbKRH/Sfb/URo?=
 =?iso-8859-1?Q?erEcIgOn4x+eHJNsbijXG9eqfQo0h3eqLAuaaoQhd5WGYjuc+wBzWkRmIA?=
 =?iso-8859-1?Q?FttTVh39AHUN3+w/wrf38U3F9OT1pedqxSmOdXdRlVSSOunXTFVcrz2fbO?=
 =?iso-8859-1?Q?tFbYwHVLfFDGrd4skn6QFuj5+KKmaY/bS+eebTUp5QPwTTMCslTtypCCq5?=
 =?iso-8859-1?Q?ifet4whB3LCFIu8JVY6Q6fh1ESCX9TDya6D24Fei+xM6f+r7ejruHyU0bh?=
 =?iso-8859-1?Q?1m/eYx6s2inXX9QimCeGhbrVvGvt/s68zxZZOfh0Zia/IpWVkqsOfJcDA0?=
 =?iso-8859-1?Q?52ngMy7Wdq+XjXEktyQGLvEBb7Zk/06GK0FHR3qgySc2jeFN+MHVsJL4Tl?=
 =?iso-8859-1?Q?hY4/tq55Ew0cYJt5j2YTYPQlAEk4CzPp2JzJumZ6iFllD3XffZg1AGlShu?=
 =?iso-8859-1?Q?tayRibDMKWiOf5LyGkz6D3klS79XN5EJi607dZ6xivSYhQO5VYVNB1bxrQ?=
 =?iso-8859-1?Q?hilmZ4rtNrIwkrNmYm8cW3O4RdeBNgxmU1skDqOq12exCOUpfZUt/39G05?=
 =?iso-8859-1?Q?SvRL6oFVqfOq9v1mQR0e2Vtq4CWVfyuueaLcQgTAvbhHzicaFD0vx3F2p5?=
 =?iso-8859-1?Q?gVENJp0noCkoJyTUucRSfdkzCGz29wblsBnvFcDBO60zbkiTUpJL1KDvWi?=
 =?iso-8859-1?Q?wyvlb1AmxSpzKc0QIt2Tkz5/tIbSZWI8JtzowBhxK+NKGApFbV0l3iWYg2?=
 =?iso-8859-1?Q?v97Po3xEY7XH+EQt5aY9+mWDQdDrpWsZfsLCZYojKJZEwTNCickiTTX12Y?=
 =?iso-8859-1?Q?RmN73iZeRmN+B9sL7pncb1DdnCw/DbEJhlEq/qY0bE6fYz2nQddIAD9Tny?=
 =?iso-8859-1?Q?0xvxXXb5LU3mRagPk6XRIlV8X8/CCRxUKTpbseI++lbLRHg/rbSg6kcG47?=
 =?iso-8859-1?Q?u74Eqn2Ke3k8DepwDgKwoMihVeihBqDk2E?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30e4510-7df7-49dc-4f59-08ddbde2974c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 05:45:05.4489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgJM6appZFZH17XicWlKaJppHeZ7Eq2/Ks/O3QnK0vI3LBcd4euYEDRivqUg+kHiJOZQkJovaGzy74LQHXiE1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR09MB5922
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 05:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220008

Hi,=0A=
=0A=
> While this change is a good one, this does have some implications on=0A=
> the recipes especially from meta-openembedded, there are almost 100=0A=
> which are failing, perhaps some of them are easy and others are not to=0A=
> fix, but this does look invasive in nature. Like oe-core has been=0A=
>fixed, I am afraid we need to fix meta-openembedded layers too. Here=0A=
> is a sample world build logs for qemuarm=0A=
>=0A=
> https://errors.yoctoproject.org/Errors/Build/210889/?page=3D1=0A=
=0A=
I'm happy to support here. I'd agree to what Alper said though: Some way of=
=0A=
coordinating this effort seems to be required. Given the number of affected=
=0A=
recipes it'd also be good to have a temporary branch / fork to prepare the=
=0A=
patches on. Are there some pointers we can follow from previous changes=0A=
of the same kind?=0A=
=0A=
One idea I had to possibly speed the process up a bit: For starters, we cou=
ld=0A=
try building the "broken" recipes with=0A=
=0A=
-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5=0A=
=0A=
added to=0A=
=0A=
EXTRA_OECMAKE=0A=
=0A=
possibly via a temporary 'cmake-4-enforce-policy-compat' bbclass or some si=
milar=0A=
mechanism. That would be faster then checking upstream for CMake-related pa=
tches=0A=
and adding them to the tree / recipes.=0A=
=0A=
Moritz=0A=
=0A=
=0A=

