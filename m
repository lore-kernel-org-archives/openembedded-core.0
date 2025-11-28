Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64FECFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 12:30:39 +0000 (UTC)
Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14849.1764333031407130016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 04:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=lij5cyYH;
 dkim=pass header.i=@bmwgroup.onmicrosoft.com header.s=selector2-bmwgroup-onmicrosoft-com header.b=dmNHfzNQ;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=4204b036a=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1764333031; x=1795869031;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=zOr+WoUfrMOPvtGD3EMXupetXyok+dE0OLdhBbQVogA=;
  b=lij5cyYHES1O2FrE+Cd3jLvatQSqKgfep8bJGth6PguPKfeMNDvlc2+r
   v0+ZD0weZ4iBYPkOUAbZwI6cyspMlFvZp7hQoyqN3PC/sjODFzcMS3sgp
   Luxw9tW+eXAe/h3ZMJutKNcTtP/hdDyCo+uA/Fb1kVRmI5+Ttj4aNEH+J
   s=;
X-CSE-ConnectionGUID: PfFFcZPnRYWhlFHi4iq78w==
X-CSE-MsgGUID: qpEV6QObRuq0X3ak5xE/qg==
Received: from mail-westeuropeazon11010048.outbound.protection.outlook.com (HELO
 AM0PR83CU005.outbound.protection.outlook.com) ([52.101.69.48]) by
 ob1.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Nov 2025 13:30:28 +0100
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com (2603:10a6:102:4c8::8) by
 AS8PR09MB6259.eurprd09.prod.outlook.com (2603:10a6:20b:5b3::6) with
 Microsoft SMTP Server (version=TLS; Fri, 28 Nov 2025 12:30:26 +0000
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826]) by PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826%3]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 12:30:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrsB5y0h1VV/cUIYsJ1VKFxJDfLUiZThfji8lvreG2HZ6CPr4M5ZIKy6tUTlQ+86lo6+GmPQ7Akh7RUKoz1jB+LXF3KB4S8laBd08Ll4vf3FS7/XvZfhskStUps5S25PqqPA8MH+Pcm46uRs7y3oBVN7ZL+pYuRDoNsBaNSquB4Ppo1ftIANlzhG4y8n6Vb9etASf/JMDO0mv/XFSP+oJOQqA+6EeD8bLlCQueNZPir4mA6ZzLozW8iI8s0LFYWBRJ75uxssuvlFnEkDUZ7276BH1tYI4SECJlfv4olXLdJ6yyEgddiDpCDXxZJFhS5ecq8YMMrmtppoTDqbICxhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOr+WoUfrMOPvtGD3EMXupetXyok+dE0OLdhBbQVogA=;
 b=OaN4stJHleGRpd0mR+dfE/ipVZsGVjdU8ukjTIpsj085fDbe3DLfVfX2MWf+r/ITQwkw6xIPvwEnZqsxta1JoLt6fFUb8EhLSUI45b92XdtGAWVRy5xefWl4GuIgGJPRZrfjVOe7Erf1SPkQWJA96lBAMnuirYxDBq4V7eNckS4/06UtUUl3OKMhOyWjKGmU1Gr0cSrzvbKgj0M+7r6TCVhvAnhCeM0Dxvy+aOF2lYFVYILTw65XF1vGvvqEmuO11fcEHrd7l8OnsVRhx1fzuUUwtzRaEaaOMQZWigEJNffTx9J8Jt7INhLgNVNJmwDV4ICcvTY3aYTMTg2cBIWM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bmwgroup.onmicrosoft.com; s=selector2-bmwgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOr+WoUfrMOPvtGD3EMXupetXyok+dE0OLdhBbQVogA=;
 b=dmNHfzNQaEDueg3TpYF2QPSNFHl30+h93tg8wh8S6PyPzf7T6oUztMu1ypnOFIHL6Hw52CrQijR84CISnNKMp5iD9RyuaRQQ+EYtm+dy1TH8BPJsjr+oKTpoAlOEhL6xZQ8VbKiX5C4LH10NxW4o2BCib5maOGSs93YBl0yY3oo=
From: "Haase Moritz, JD-61" <Moritz.Haase@bmw.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Changqing Li <changqing.li@windriver.com>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: [scarthgap] Backport request for "curl: Ensure 'CURL_CA_BUNDLE' from
 host env is indeed respected"
Thread-Topic: [scarthgap] Backport request for "curl: Ensure 'CURL_CA_BUNDLE'
 from host env is indeed respected"
Thread-Index: AQHcYGHM0duMgcwYj0uzZfgwcY1lZA==
Date: Fri, 28 Nov 2025 12:30:26 +0000
Message-ID: 
 <PAWPR09MB8030506BF8C97C6737EC5FFFEADCA@PAWPR09MB8030.eurprd09.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR09MB8030:EE_|AS8PR09MB6259:EE_
x-ms-office365-filtering-correlation-id: ce2e6c5f-0032-40da-9754-08de2e79e8eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?vYBukS37Pn9N89BIj5hmIHSfn4V6eD6wn36l4hFjAUsSQZBqbLlR0mG7fo?=
 =?iso-8859-1?Q?dTh/PI2dIcfTB1wORxdALUkNjRcuoiDcVySLsQsOHfOZesqOprlD9tV7b9?=
 =?iso-8859-1?Q?zHfFDwyVpFBz/03G5Y+sSbypNmuMYAPGvrc7KMaZNiScpE7k9jqjZN5WEU?=
 =?iso-8859-1?Q?9Jeyb3t/Xx+AnjN/JPPxX6K9yUf3/FiBRyV4SK5Crg4RuVvYibZK4XG4dk?=
 =?iso-8859-1?Q?dkvK59y5Xx+e1gLa3zkGcPeY43LD9EovvWk/4POKBzSPigwwQHdvO21P58?=
 =?iso-8859-1?Q?K+9BK6L8G0X5UFF5h8R8khoK3JXUmkJQK6cfTupHpuhPH9fW/HLe6PJZ1g?=
 =?iso-8859-1?Q?5KhaqMyBov2ottXYll7Q42yHVxHNotgsVNq24k7BqdHSZu4wIn4/HnlYJI?=
 =?iso-8859-1?Q?tiopv42XVVbMJGYET2JozsAsHVIxoXatx4DLYkMuwskbaWaizRtcVVJcHU?=
 =?iso-8859-1?Q?+Ol07s9OZ8x1e13B5Kj2XkpdNgbtvA2n733Cn3pvrUvGJfUBql8vRzPQWA?=
 =?iso-8859-1?Q?9cjWVqrhdpmJEZooU5o2HV3DmO3dTNxdQF88pQtiMLHkhLeHfLd2ZliR4J?=
 =?iso-8859-1?Q?hNA4ZbfCIeZoRUsKMv6LIlk/5qKcLRe7JgRSo3w/7yc3w9tp/5oGkYz5id?=
 =?iso-8859-1?Q?Ojrp0GsKOP1rWw7nu8CF2WoedIeYSUIQFKqe5ZgMNixXlmaASgSVjHlBK7?=
 =?iso-8859-1?Q?c53dV2lR0ZbX9McYqVJG4eph4aOhSuNNsFQrHIVoNGiOgsOvy5X0IVH1eG?=
 =?iso-8859-1?Q?sb3Bc0Wa+4iR8UZ/Yz1LcAlq9KKX97JlvfUCzNYbvEo8wyAzjItRe7/V7c?=
 =?iso-8859-1?Q?eHGZESufHM61nLZhgalQGXzakfDFngzBMnjoiljjk2UIq0q9MQG69gY2/D?=
 =?iso-8859-1?Q?Q/JvgP61mIv1JPOtM3CYUDVpr6Vbd388GBuEZ6fflJWzvdhg84llwrDBIF?=
 =?iso-8859-1?Q?XvpFpmlKpZmircrwTwhUU07DKcWCkBhl7h0frcV3QvnpA11kqLN7kAcqzU?=
 =?iso-8859-1?Q?mMGr77TzpCMH8hCKq2fCWwWC5FmqWCbsQMusqZSDTsrgjBijwDvNBCy2+Z?=
 =?iso-8859-1?Q?y2+gpOnhACdZRBWgJOtrvxRD0aX5oXQj/OdyR0plvb3XCT058QwId7JRGI?=
 =?iso-8859-1?Q?Li2cmquZsbBVdmJHwd0fM8qdTLl0m6bepXldaLIq4/Mttnbm8g81lBg6Xw?=
 =?iso-8859-1?Q?WRNkJaS0w5rjvDpIAPz34pTN80LOnraf3WWKv4XfaVpTAoQgYTzFt5jx1A?=
 =?iso-8859-1?Q?jkq5sQi1Gv/Rr8P0uew3RKQIUbZ3A/T9caLhYkU6wgAbdQ1pXgNDIFut9d?=
 =?iso-8859-1?Q?9dIPGITax2yghbyttLUk61pNDbVVVRnRWQkO4oWzBZ56V0+nTzD18/lP/D?=
 =?iso-8859-1?Q?2gvcp83uLk5C8muUy56z/d+JgcM9UTXbouaMhEuiqbzo8tU2VvaUvtQxAt?=
 =?iso-8859-1?Q?/+x2AldVtXRXqxeGwJd0gdgTt6parlp5FPzj1RO4Af4DlvxmzzFkprIf/b?=
 =?iso-8859-1?Q?+jEZ3YFUio+21IFj0XbXdjDOSnm1O5YyZSLs5rBJSJ5AVpaEeihFaFogo6?=
 =?iso-8859-1?Q?Bq3MAmPX+9kMFmsTWmFV3uYO3Q/m?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR09MB8030.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?9i1YFmpkyInQb9tBHeW3iCaUYAdgBnrS3EcCed6igUjzO7yNTw9xhf1aqY?=
 =?iso-8859-1?Q?md7fhZpN0PjlMHIx3tgsBKcALvighlDCopYBkKYdHeLNlG18llqD82EtVZ?=
 =?iso-8859-1?Q?zEbsAhnnAZMaNut32RTWxRJq14KEyAM6H+pjd31qgiGZLc6wl48a/pMf5/?=
 =?iso-8859-1?Q?trx345bs6cnVipGsiWXZEjkejP+Zvoj6/jxQP3IEFQ3XcEc9UchVH89CXo?=
 =?iso-8859-1?Q?P3KoZDPcwX6OtJRgjS5m95rmQ4kR7j1rQk6EZCTrjSllacMBT6x4iR+m8u?=
 =?iso-8859-1?Q?PBmnJ4SE68kCVfew8rWEhP/3TGpukO9eDWm+xziP3vDlNxQ7edMT3UM8s2?=
 =?iso-8859-1?Q?879BZttAETPaAFmrZYaZTuv1KStitbsa6Sea8cZCaZgwcQ7uojyXxpFXiU?=
 =?iso-8859-1?Q?PzmRq1sdVu9nJrY9iYCEip11u/Bvz6EJ3I/C/VYBvDCItyGIJy757bZItI?=
 =?iso-8859-1?Q?qjCv02F+g47kQUdiBpTm9XanlL50YCz4fQB8aPX+FgJKAZKZN3sEGwZ7ht?=
 =?iso-8859-1?Q?xfwKd3WAaWa7BVpaRD44W/GoKBPZM3VH/AS4C5m0bk0NngHm+SCsU00tpS?=
 =?iso-8859-1?Q?tvaenPGEkDXEE9sPsd2jmJr9nxgm7AHUmNY1BJn9TJbuSG3mTf8NCULNQS?=
 =?iso-8859-1?Q?zgPM4x1HrrdhxfNO2NI/YP5tKA8Nyaq+dzj6XQhKU4ftRm7vybtVskBMFr?=
 =?iso-8859-1?Q?ynPxTMPeVECDB9uGdE0Uo0D60PvbBwfW6bTfYx0F+yQRtEcDZpM1iBA/mU?=
 =?iso-8859-1?Q?AiNZApXXurTMUnwQizYcjwEPc/uPjF417eyiqZJPE7KzUSO/mKU3FyKjhG?=
 =?iso-8859-1?Q?b50JIRQi9q/E/V/MGzqVy2WlbSkbWa+12jUxsDmKlbsqITKLaP7sC5z2xc?=
 =?iso-8859-1?Q?/6AKxuq/kMyF2kqzFIJSYs0uyOX/eM3rAVDCB9+XrmJxIZ0JWZ+8JebjuW?=
 =?iso-8859-1?Q?mqnhiDJeo8gdUv918lVjQyXx7olTptoWNGxV31Ek51AaQHCQtjT/JIA9mK?=
 =?iso-8859-1?Q?t04565+oN5rzTg1UHj2DzXTMgX0BUwSKolYTKG4nLNxn3Iam69n2JrtnL1?=
 =?iso-8859-1?Q?p/Z40rFnlYOpgEVweN4HXll0t/QjwYgWdNmxA7WYSjJmQQAxlkYo+k6szJ?=
 =?iso-8859-1?Q?dsGBA6VZPVImr9xL9UCMDj/lgr6lZzuxtzQODL2qSTSo0l8KNDryTK8MzU?=
 =?iso-8859-1?Q?5Nf6rp87bNoVu1yk8BLAsMlyn7faCZGhsTSsjUUkzYTQv6+ZkW8YejPbLQ?=
 =?iso-8859-1?Q?jrcMKuEbFbV/DDE2BzicKSVz2LAll+0AS/5JcX6welO6T0rF1H/QgmlxWH?=
 =?iso-8859-1?Q?c6zcYZeXn7ycJgQFabdNpmfvbhuTFJ8l4dt2WPddnhvsVqR/eYu6KSmt8s?=
 =?iso-8859-1?Q?I2+rDkFRAN5BtRYpSeEj/of0DYcHQ7Wg9Xyk1mCgPwjEuHxxlvWL67wmyS?=
 =?iso-8859-1?Q?77E8k4rlIK7uH1khVcbjQEZjqhae+9T8NRnBcmcDY1h8a34mqY7tR65ArL?=
 =?iso-8859-1?Q?vtGO9wvxH8HQ/6B8DY2shUzeHiKQLc2uxm8MIVGG8vJLqU9APPb1vH6bOX?=
 =?iso-8859-1?Q?bkygOZIM8ezDH+ZwrcnmXsIbcO7q3vA4cnfkAAk+uOtaWS4giltboU6H6N?=
 =?iso-8859-1?Q?J62L9Z32X00PblPfMa2T+yZUxxjUwElQFw?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6JG0Jxb4xtD6+2RXAzkMu/E/kDjXhVn2rRGPlmNtwQqIZ9YDAFvPSp36CN4PKTLxlsc69F4yByaMe6rqPllbJaVst/CtZYTD26IAfTNG6NcHo3avqNW8wWaQb+IJvzATFszlRB1g4GQzsF/u1R6bqYzgBp24PYBZcjx1EAhCgMvsIq5H/SDOZqi4Ow3l3S5tODKXHiK3y+Vew/6g77Lr5/aSXh35+B/pcaSCfB1A19SXHH0VZXZuBNF6ddK7Qbo0NvLhZFlKoLYcR7fbB8ctDaaIByg2rJVV7zMkKqbdSXfhSRL/u1VH3JVNGpg2uI9MDyWlmazMVqmaVKjITWZr+SpiZY00y7mVmgNLT0J55Lu3RXz7Zw3sUNpy5iooBDFEV0HCVDpXHwCxfCNCyeG568a71GV5nA64MozN9dWsb5pmxFxaf8ajMrGVjukkO5jEkClK8UaUWs//ef3SPGj3zjewYh37qj9Izs18rMdOV5Ef9Agz4sMJP/0R3hQVbDsH+mcbPDHxWuaC0/jqjQp6s2hh3CTYq88yTuPLoT5jh3e4dpmEPcq7SrkokRgN90l64cVdkbfzS4H4iIZWUfOwFmlHS86HjkQ4of5KdFDRjbQJpSYceExGaXhYPKvMuJtB4vj3foBiwnjvCKTfItsbng==
X-OriginatorOrg: bmw.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR09MB8030.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2e6c5f-0032-40da-9754-08de2e79e8eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 12:30:26.6288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBUU4OndvVDyAfKpkBUUV4aMwpOhactCcTBDSuvfku+lGzPjKu3+4ZnsUGkG8H/2yQvX8Gt5jybUgujCbIbcPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB6259
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 12:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226903

Hi,=0A=
=0A=
I'd like to request a backport of 545e43a7a45be02fda8fc3af69faa20e889f58c4 =
[0]=0A=
to Scarthgap, as asked for by the original author of the commits that intro=
duced=0A=
this feature (CC'ed) in [1]. It's a small typo fix to ensure curl in the SD=
K indeed=0A=
respects CA bundle overrides from the host.=0A=
=0A=
Thanks,=0A=
=0A=
Moritz=0A=
=0A=
[0]: https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster&id=
=3D545e43a7a45be02fda8fc3af69faa20e889f58c4=0A=
[1]: https://lists.openembedded.org/g/openembedded-core/message/226750=

