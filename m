Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2386AC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 12:34:09 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19845.1782822838516045720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 05:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=cKXSJ+EV;
 dkim=pass header.i=@bmwgroup.onmicrosoft.com header.s=selector2-bmwgroup-onmicrosoft-com header.b=CWWxO4U4;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=634d33241=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1782822840; x=1814358840;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LkAvrBwsfASd/QUa5oR7ZBsoZYzE309UYR+epv/3UUw=;
  b=cKXSJ+EVJXK5xzB/BpiW9nCbCDaTPBCW/yzWvKzRrQlc+4ilr0iosEZH
   FhLNExsdqGl6BpgTIpHKAxozx0YAMs1lJy9HwphDgfLOh43RXTqz56lYh
   zXR4/qKKWt8C9L/lYUEXnbpnZPAPuP6pLKfgHmH2C5PAGO8lgjoBK9eLq
   g=;
X-CSE-ConnectionGUID: 0FwR+h6HR9ycU3Sad0ro/A==
X-CSE-MsgGUID: u5nC4MhjQ1uRr7fZOxyT3w==
Received: from mail-northeuropeazon11010057.outbound.protection.outlook.com (HELO
 DB3PR0202CU003.outbound.protection.outlook.com) ([52.101.84.57]) by
 ob1.hc324-48.eu.iphmx.com with ESMTP/TLS; 30 Jun 2026 14:33:57 +0200
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com (2603:10a6:102:4c8::8) by
 PAWPR09MB6690.eurprd09.prod.outlook.com (2603:10a6:102:391::19) with
 Microsoft SMTP Server (version=TLS; Tue, 30 Jun 2026 12:33:52 +0000
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::78fa:1fed:9dc1:fd99]) by PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::78fa:1fed:9dc1:fd99%2]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:33:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTdzuqrPlmgg/ix8ekwQ5C/y7+az0VTIdTTKbHn/JYvd3kED/XUF3jw7QW5l+zzLXyQ5hKeouVUvIFytw4ksqmc9Kz96XYGUGwMWowwKips/19LJ3deI64lKUCZ01D8dMtzunEFVQds5DmPIkd7bVJwvTi+pvaXTmBD38Pc8dSkkcipQAH5ZZr7ct6fYnV7XU5ti/s2p+pZcbYRpqgXAwYLT3axF3RqpHmaLPx4AayQuhNTw80nE4Cf6J60+dENJ5CFAf1f26Efg3XR9HJe/pS7KeScSy+vhIXBWyCkvPlBCMUIWvSB281NKCP9sPuMQ0n9AvJqXjknwhPsNqlKHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkAvrBwsfASd/QUa5oR7ZBsoZYzE309UYR+epv/3UUw=;
 b=yiNgupYZLSKFDEdx7p6uW3pJY3pVo5r6J2xrRKP1Zkg3Y6KyyoIUJFlarEHfvBg0z30qYCOUnUH953w64F5Rhc+BlXIyu695t3vljUUaOKqBxZJVPSfdwNN2gvU/zem4aAHF4R+0SV5FKV3cK+OZA1a4+qstfVloMW/0tNb9RqlycyoIw3qvnWdsW2Jxlg6edS2HGNs3/YfkHTdH68mGW0oJtn8qIqBNWZPsp0OsnpTrimwnhoFOMoirVxmJI/DkPUh6f/gWmYe0iOF86r2Lnu7X+k4E2E6N7fxVUaNz7TOi2IwqCniMqlh5iVZCEbmVwMd6umSdi1VJj7V5ywD+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bmwgroup.onmicrosoft.com; s=selector2-bmwgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkAvrBwsfASd/QUa5oR7ZBsoZYzE309UYR+epv/3UUw=;
 b=CWWxO4U4VHuDo7wh72ntbbfe0qy/7oGkHMWX9VVSW6Zcot6HRUEJFOHjXAWB+wava07L/gIrsJajuZOAc6Eyrvnj9/bs6xO/Co63bigL8fifkxy3gV6aXJ9NqbKF2RmrjQncB7n6y69aeP7niXxAY6xp+AnT91V0JwGuYa5HWK4=
From: "Haase Moritz, DE-811" <Moritz.Haase@bmw.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: [OE-core] [PATCH] json-c: upgrade 0.18 -> 0.19
Thread-Topic: [OE-core] [PATCH] json-c: upgrade 0.18 -> 0.19
Thread-Index: AQHdB45PbeuN53Q/ek6llaaMOlNNPrZWwskAgAAm8GKAAAPhgIAAGcdd
Date: Tue, 30 Jun 2026 12:33:51 +0000
Message-ID: 
 <PAWPR09MB80303C3EF3D64358FDE169D8EAF72@PAWPR09MB8030.eurprd09.prod.outlook.com>
References: <20260629061229.702229-1-Moritz.Haase@bmw.de>
 <DJM8I70PCCB1.3GWRSQAJKNDNE@bootlin.com>
 <PAWPR09MB8030781990889EA67DD21074EAF72@PAWPR09MB8030.eurprd09.prod.outlook.com>
 <CANNYZj81bU-dwR1Y7kzQXkHCQ4QwNCiT5diZ2USYzr8PoBzM_g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj81bU-dwR1Y7kzQXkHCQ4QwNCiT5diZ2USYzr8PoBzM_g@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR09MB8030:EE_|PAWPR09MB6690:EE_
x-ms-office365-filtering-correlation-id: 28604d8f-6277-4b6e-c9aa-08ded6a3d7b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|10070799003|23010399003|4143699003|11063799006|56012099006|6133799003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 N5rlUlgKXQAVzRD+uQ1A+9cvt2K705nMYt0dIrn4G5IdTxuw4llWf2QoiqGBD/vShmTKer8qyTZNtFXd2ML61PsHOWz7sdripG0TtADDf+pVbEEH6SbmEcLxaPt7mHr3athjE3UpSAqrxXz/LAsgeJuL/piwp3TkNLLYOjdldkr/rbUyUHeAq+fYhwq/TclEPmrZCwiYkK7yavKU8VMXXew61J3NDVw5UMmqa/ZxSdqz/m5sWT04WdKlP/IW2Ru5CiCIQYMrb6SKFUH8MX7Kc754wN+rLr6GGvxC22rmFgPSWfOsrs9BnhE5g65aui+awyk/zt/U/Fwp4r2KkZKUmbacsBJl6nYWTIzLhpJdLBkgpqbkrnsU6KS/LS6UMln/jaE5EIAjH+eh/OI8dxspI1VtbkYKu5KftClJrAd3prfWxZ5fLkbpauPsbY2T3mnb5MeIRJT+kGVkJdPo+k8oy07mpLHZ5Hs4FUfSdF8MnRo8mKyV9FPkNYQ+jAKAjrRBkCGTOfUa6w8gqJ/M0ZAVgMM9tmGGjrpquJMVmrh9ch3z6EGkzIZW4zkzJc8zXp3k9oSHzvEyW6e0DTBF+anxHTT6oOrnY9lUftBtZXvEzwInKbmADDCDQlQLO6LCG/vgw2WgwPbkevLELNPNnn6qhKC8YBNWNlSx6HTZ9srrby4tKREOzEnF/ebUdKfHLJNMpc3lHaLY95wcDNReLHZmec3Ia8JabTdt0tNM/6uk3zw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR09MB8030.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(10070799003)(23010399003)(4143699003)(11063799006)(56012099006)(6133799003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?oAQUCCabUw+91Bz3vmb84eD3VvrqFAhBQt5t3FiNVZWSXny5904ko6nK0I?=
 =?iso-8859-1?Q?ddqxoVs381J+c2Ig6fwm+9yXgDzVEABWT/nkp4b3gfn7LONEpnLh3pi5Xo?=
 =?iso-8859-1?Q?/yw0BPIMTkZIDryk/H95f7Pw4DqtJM/K2PdBseSyDMPOZCaEKMqSugkpUi?=
 =?iso-8859-1?Q?IrT9kOzUfD1eWawrTNp+75oSaa1K2N3ofYHplVlLEixUFYzCyrxTOwi/Bz?=
 =?iso-8859-1?Q?vlx3O0pR5CvT6ITUkxV/fnd+t778nnhFLixrZ1NGfu/tmxy/fp5LoMBlKs?=
 =?iso-8859-1?Q?x49fz9/TkBsKAqwZzeXfrXgAsdvQ6Avnl7nWLTFA5cXI86H7KBfQzYhgx9?=
 =?iso-8859-1?Q?L/G0r16ZUk3IZXPtx2SRbctWtashvP2IrVYMsBK7wWVwk5a8EelII1riAn?=
 =?iso-8859-1?Q?UeO8o6ims1+0k/FqQ0mndaQ6npq56UUV/2nBgC6MbHywRLBfxdqj3NwgwZ?=
 =?iso-8859-1?Q?jka6rIwXVXqUDqEJY9sB8fSq9cape6jd06sdL5L5YJrQcWeUUrKHyQbBEx?=
 =?iso-8859-1?Q?29aXBD7phKgIDwsehu0rDQr1Y5EWtK+coGww40mDYnDsjNCdnq91+5BWPU?=
 =?iso-8859-1?Q?4K5Da3OJVh47d9hIIdQkijTTqdX7mdaa7OFKfvjLZsK/xYVFnln2McYFzq?=
 =?iso-8859-1?Q?mZYzj0Xppk+4UQLtdaHJLmet9eP+bs2KaSSHIOzLJ4hu91npdOw2JVLM52?=
 =?iso-8859-1?Q?//wFoPk+FpOeA03JQ6VViJdYFvvWAoJLS73dd/aVi3xjwjaq7JKO7S0cuV?=
 =?iso-8859-1?Q?4qzMJetgO2qlse1VuntpARFGMjObeJPIxaLug4COddxbV4ha1FNPREwNGq?=
 =?iso-8859-1?Q?Sw/isJEuNOBpSU3B17Xzp84jJ7nknN3jyOBFSKodihM7wOi61EpNZzEhfe?=
 =?iso-8859-1?Q?CFdgwdcM+x6cloKyZtENfC4/ZmQzHjE5Uixv2vKpmQoW63HBmNo5er/Jg1?=
 =?iso-8859-1?Q?pdD9M1EoU2DPqEMu6iY6DkLL74s6LB4hZvr7JwiHPgarMK6cDSHEK7sXWY?=
 =?iso-8859-1?Q?WBdchi0csSf0n+x4WgbTv0XI41o3kq0H1WMTrTqXRfd9gm6JtoQSoqjkh0?=
 =?iso-8859-1?Q?oMg0FtngFc3E8/SyKYKMZGy648ckUg/oL3xkcn2amrzyfwL7EkxnSzpQlv?=
 =?iso-8859-1?Q?cU82jays2PX0XL3xf1AlOQ3wlx+FwILhK2cmiiEVCKJlqmCQKMBWCvRxJt?=
 =?iso-8859-1?Q?7THMXpmikaZP12nCIv/PCEiPrqRZtW6zzpLLNTrLf/4CAaEGs4+xEhyNZW?=
 =?iso-8859-1?Q?0yd88hlVXswwZvcOp8WtH5Cwb0KWHI06921RhhRTGsNm+TvZKr5hcbsqbO?=
 =?iso-8859-1?Q?fhrbcd5jwvcb2dIdeidh/iYVuH/fvsdHwwprM3H8x4UTEfRMpESvHbAjWS?=
 =?iso-8859-1?Q?7CrLulIYUWDWp+A2hNXUq1CCeeYL8H6QGr3vvM2C2M6m1xcYlE0I34B82N?=
 =?iso-8859-1?Q?p2f+WUO0Fd2DY8KYUsg6CHy3ttrqYW9rzW+G0SgfZ0WKwip2fwJw6tkT2a?=
 =?iso-8859-1?Q?+i5lWNhdhdQZSsYwCRRcw/tY/bgnPIEPY+ddbwrAFteBsBUGKNW6YuLFb4?=
 =?iso-8859-1?Q?0QDW8L3NSK6nAJIc8WA5aXqziZVkMNQ3kGJ2WtcpTZ3OvMJoOkiZCyhjbu?=
 =?iso-8859-1?Q?7txOe9PE0oY5cAn3cNmoagX1fmBJvTbdGcArZtwkrcHkJx+rlVxZG3Gsx6?=
 =?iso-8859-1?Q?nUOtV0JdtpB9hf+jmDLGGHz+BEFEntufipYU187oAWPJkCu2qxI+rX0+bi?=
 =?iso-8859-1?Q?ffxejLeS4JDlCE+ikFsostoDZ2LGQ1/pnrQqze1QcrKEa5kxwwH0VLlNd+?=
 =?iso-8859-1?Q?UTHwPG3n9LhGNb2Kfw6zS2M03wJgGwZK6TLnOSnvsmnILFzE/UhJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	YFRXmH2Qhdhb50fhhp4gMyXEM1UC4Enn6RpIORUGZh/9w+ROh/7GHH0sgbZxxssUQL7LCoGUI9/jUvJJzksNmLQ1/J/1omOGbCclKq6rFNl3Znx1SlcpEV+1cpAm5FeXcdz+LQ93vntkcDitKmPFfTwre1pW70m3m0MWqMtdFJ06lrnl2JvMdDN/KLDVz7kPBYx32PD9YLs+N2WrRaqi3c3IsrxcXmYQF4CkiEu76ECHslE3DM2dMXU4liTptXAvvsMXrwnlI6OyYd6DayemhUt5JLoDZsBA0nqjlp+4vfUcxIeYPQX2gCTXfjU63t/21jVEAwxd6Yr+BNGSILGDtQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jp6/YXUGXwX1aelCpEgfWrcLTE9dtP3ca/v4CrIfnhobvsPT5qtwgrZPRy0erN5aRQAYDC7dEWe/vskZYMaykVglmQxas0IDN2x503f3HNKDGUEGPcUe44PnBs6itaIjDlOdLG8rgpgAeiEITZ6z66bbm+OmYcXzPd+gEeZKegKCfMsRrbTvbjRDiVf77Wy5CLafz1s9bjRXGgtt8xwglysesY5LmoFLsb5flxSHvgkwuSn/2llLcysyzr1JOz4uXpNVpLm1ClgcF/9+clvZUnDHit54U2CH/ytYIn0VauqgFFpFgSi2EzM1WkLFHjWLs7Jq+OR2j+lDPO3towT2T/y/u89/FJd0eL69TwwQW/BjxwdnCoWd7qD8SKDTf+N1HlU9eA6tWFvbE5YhuV+CbqfKi8BeWbhMZsCWlo6FXILuIEsprMNsVaHLrswDHxvjV94+C3y9iRgPm9YfG7y4XE2/gDtU9hEqlaxfgbElt/IeDWhl3B1TEeoqjhLPTRsMxhgVaBL1dcoj23ibj5JlJH7VpgTwD4SZxtJEc3FhELCZOo2DhiCdvg0nduAtdZtMQPAED3x5M/O6jjrsORzcIDL0iAoYmVJnctcZRGZ2RmDCfswvixm3kQC4dnIFFKuJ9NIbN29n34/+3SmuU48HLg==
X-OriginatorOrg: bmw.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR09MB8030.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28604d8f-6277-4b6e-c9aa-08ded6a3d7b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 12:33:51.9619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: edtQxzp+k+4FlEJ23Jbm4MZjZJ7bw2n+DjFP86D6TmT6F4fqt+SK9SMlcc79QG1pWy5Qf6l7wpBip2nP5Rvuyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR09MB6690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 12:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239885

Hi,=0A=
=0A=
> It would be better to enable the apps, package them separately, and=0A=
> make ptest package RDEPEND on them.=0A=
=0A=
just saw that I originally disabled the build of the apps as part of the=0A=
CMake 4 migration, since they were not packaged and upstream doesn't=0A=
consider them ready to be shipped (see [0]). This hasn't changed, the same=
=0A=
text is still there and there are no install() rules for them.=0A=
=0A=
Should we still try to package them? Even if we did that, the test=0A=
itself would likely also require patching, as it tries to execute the=0A=
json_parse app using a relative path (out of the build dir I guess).=0A=
=0A=
Moritz=0A=
=0A=
[0]: https://github.com/json-c/json-c/blob/7cee5237dc6c0831e3f9dc490394eaea=
44636861/apps/CMakeLists.txt#L119-L121=

