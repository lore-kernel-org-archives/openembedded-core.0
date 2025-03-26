Return-Path: <Mario.Schuknecht@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AAEC3600B
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 15:17:10 +0000 (UTC)
Received: from BEUP281CU002.outbound.protection.outlook.com (BEUP281CU002.outbound.protection.outlook.com [52.101.169.126])
 by mx.groups.io with SMTP id smtpd.web10.25198.1743002224697020289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 08:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=bhYir+Q+;
 spf=pass (domain: iris-sensing.com, ip: 52.101.169.126, mailfrom: mario.schuknecht@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+0cfkn/pAmQZO5so+7esUfq5v0aFEjXaesv0aGCMjpOuZNWL8pgNUbdEXlsc7K+7CDmnvagmcuKberm6O8yI86DlmTlBtiQfZOmQiSUX+f3kAP/ZeNSgnGQM/JEh3dt15J4agDodyVVSMwXQdkPw2NDuGd2JvUiTLlgko8nCMt1fNFKKwI7bMLEueGDHbfuWGOHvhU+08dYvU5BYG8kCkmNMRsBnoUGs/BlyQT0oILPSuEG9PCVFFCdX+oLoXbzITlIRHKwzOdjp2uaT1GtCXLrvnu/bCu2A7jyrYKjs9pfQ7Bae3uAwwyITZruThQ9SaXkWuaI91f7N27+yVvIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlFSM8SK43Ae0SMSP4Poai/XZ54YOs9XKuo5kTCkRxY=;
 b=H/XM1bSrznMXNkmzAntfo8+2gC28woQWcK5iAMgxn135KgDFaZb1WAh7aoSC3G2biwXf7q8uMianZ8YtfWv+VkMCxfROYsR6A1UadjQisIjcqBGygXgxhIR+FszzIeyhi7+YQJBsxOJoZfjzaRlaRDuc7xjMQiybt5+fDDeVgb9AswAnMEWDxvQ7JRPr4Hw/fIPETbKGzs+jZG7goolMWqQMpNolgPrEH8aKv9n0SXE4rNX22B7ig3AsDxuERNQ7/dhuvt0+flJ2GNWvZwsX0OA8Qa8CAvQ42PoZFXfH6HBGfpUDe9TRUdEhTDi0xiVrHu4Q265uOB90q2KE3wmA5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlFSM8SK43Ae0SMSP4Poai/XZ54YOs9XKuo5kTCkRxY=;
 b=bhYir+Q+frO1AMehtvrZLAHjxTqcdhgiKce1qOWI9e+aXb1lrI9TLn+3862q/ommp8ma2yxTj6bGMzHABdA2SEts9IamZvLsfzvmuV/2dExl4qpqV3kyQL0tKMip8wL8x7NnRMGWWSAfSngkEuULKnxoioFTpOO1Y3mo5dyjsfB/Iu5tv6o9oa3XGTSAa3cJJUwQjdRehfWvY7/OwShDRcJtk/yB+MaiS+tC2rL5ivLIbVFR+1VImK6gu4/xzbdmPzagiiv1yTmchTJARbugJm047zcqwcOSVBSUW2AsXhS3kIcow8GbFUArAmWCL/65dOp83vS8ehDm7kHkiV36HA==
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:34::8) by
 BE1P281MB1778.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 26 Mar 2025 15:17:01 +0000
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b]) by FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b%6]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 15:17:01 +0000
From: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
Thread-Topic: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit
 lib_package
Thread-Index: 
 AQHbmnPP0QBf95+sukinf7d01CDLErOBAZGAgAEZvy2AAANiAIAABl8AgAFPrpqAAa4K3IAAaysf
Date: Wed, 26 Mar 2025 15:17:01 +0000
Message-ID: 
 <FR3P281MB1917CC7FE52D22DAF61020FAB6A62@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com>
 <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
 <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <18300D8D696CD25C.32743@lists.openembedded.org>
 <CANNYZj8tqi5tnomg7t5k9iGHj_xCszmC6nCYfKmgh=yToiM9aQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8tqi5tnomg7t5k9iGHj_xCszmC6nCYfKmgh=yToiM9aQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR3P281MB1917:EE_|BE1P281MB1778:EE_
x-ms-office365-filtering-correlation-id: b72daf48-a57d-4374-face-08dd6c79420f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?MKbA4wOvyl4DsYfDiiyQHFX+GYotUCGYdJCu6n0mxrsuoNukVCE9Om/OSj?=
 =?iso-8859-1?Q?BR8Te8rQEoKojOF4W7WAQGIKSvvYhIzP0FweglvXQkN3oTIGtOJ1EqL/Yi?=
 =?iso-8859-1?Q?dQBCeiSr/i36UZOFX5t8aOtxnlV1ua387NGD3ri/gpQPdU1K299vgWLOrh?=
 =?iso-8859-1?Q?4VlhtzFEhr0aSxhOyN657cvKAYL9bScvZEd9K4W7m2SNx5x9Kyw1hdQgwu?=
 =?iso-8859-1?Q?dmUJZRs5BY+hDZ+GSnLXOye3FOtbgFWypAn7deuf4VvIcwBMod1Ec482WK?=
 =?iso-8859-1?Q?YtWBdMwH2+JOkF7bXPHxofSZrn3nrvcTRKCKvPcLGErHe58l1Ks0exg/SY?=
 =?iso-8859-1?Q?NWF3i9OHsN2XSQckH7pHUn1jpe94qajuW9iYlJbGVOjB7t8gxY1fXH6Fz9?=
 =?iso-8859-1?Q?+TWg/d1W7wBDLYEzvoZTsds86MW1K0sLmdHQGAuavomIsZGfyXt5U7WQNB?=
 =?iso-8859-1?Q?AFoOgWXfg4SkDhvjn2BgVMBFZl/fuo6MGcQPpftBVan5QcovFoGMCQn6xI?=
 =?iso-8859-1?Q?BT039k3UjCXRkiDd7ikApGSxZ3o9wbBuotiHw23sXHz0x5U6Rc8xuKxWWV?=
 =?iso-8859-1?Q?iHc6lgWIZ02k1HMtZ1fmOCSz/zDcaK3KMaAlgytEhLEeNId64HDmn3adqg?=
 =?iso-8859-1?Q?2yJWO0KzJ6/Qf06AlR+f4c+OA4R9fQF3vtqSolGX4R3eX5lq+rgFXfj+0m?=
 =?iso-8859-1?Q?HD3WI5l5K9uVxDcGtBPvkml1MIUzvcisJ3mo/9r4yAjrtGqsnsRJNKM2O1?=
 =?iso-8859-1?Q?jfRpN2Q4umiQ78/kLh8GR3+Fw5tqazQC4xbxbmTbkTsuiIFh5Y9X0i2srr?=
 =?iso-8859-1?Q?6sX+EHTyrVb5QJ/iiGVg+d6yfm8tADrX/Q6ZhAFQf/+J2B2x15rSY8Lm7a?=
 =?iso-8859-1?Q?l6o1Evtk+iiNsFqyjtHh58tE45BhpWR9TEYpNP5E8cwCdpTDOi/eCgjkDB?=
 =?iso-8859-1?Q?4cKcpd1zHcJUzoo4DMrpjLTI1f75RfbAepLElrgiseDiwOlC6ur+pYjuNV?=
 =?iso-8859-1?Q?ecEma2hxY5IcU8/AbBTt1pLS1HCg+OGL9tEJJasQWK2SoP+9kgnpLphIXf?=
 =?iso-8859-1?Q?p78mwUW3NVTFvorX2t+4kRg9O3maZy4sw7vUcoQWdAin5NBeSUfKUlL4HA?=
 =?iso-8859-1?Q?S3QopnFLmu6On9DtfBkMn4e66eZoy4Rn8wBt0qGQsa7LpJZXTCzslgKuZU?=
 =?iso-8859-1?Q?YQhLvWnN3GgOBFDZ8cF66uC+Tti1NGfn8kpSlEeWnzZeJFLpZFvhwr4bLk?=
 =?iso-8859-1?Q?Ro2NdGSy9lucQI5pf0lNmMdwMaz0O9CUVmTrFsa16+VLcb2e25mzU94hS3?=
 =?iso-8859-1?Q?kGt9GGO142yGQmYR6OQSoaKfaQF7ESk/gOahwsk0dd+g7qhQDlnejtCUX4?=
 =?iso-8859-1?Q?LKrG0ks/vL2KAHQx7ijcVzEEXI9Ye4nY6KbZmIfiDdyI886vyeYEEJ7QZG?=
 =?iso-8859-1?Q?TJGMFZWUx9CyDQr39tcdFnEqDV/RpKt/IVM6cP4RxcvgO/whOUD05jEvGq?=
 =?iso-8859-1?Q?bKBDHlhcDTnPr2XJKaRlRCZi5FFYUoBiuw5vAj0miRdA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?LehonFMzn82+3knZG8J+LDBmb/oJOKFxcFxei7uB63fdpiDa8nqgUba7Zq?=
 =?iso-8859-1?Q?PfC7wT1QvrmNapQk7PpHYxHwN1MtfIpXf7hM41+8P1CusfY9YygyiRNWAH?=
 =?iso-8859-1?Q?ss7HQUJlF0riEsm2e8Ela2bIz5VkdLjxiiilUogSzGG6/vovtTXNbEuBer?=
 =?iso-8859-1?Q?/7uPuwAFBcX6aEv//BIVpnZ1+YLC3p+Sfp0qqcHAfBdC+tkqK6VUwGqigx?=
 =?iso-8859-1?Q?4akbaWB6e4OAjkJ/QRUFa5Efp2sRr0kFVi72NkKMgfDq3Edy3oWcSaUazL?=
 =?iso-8859-1?Q?jg4Kh/Fbj8XUDnxRcdEAmR+oKb9vJt2kqzf3EbmtR5fC9qE4uhojdahl25?=
 =?iso-8859-1?Q?ML4xt9qqSfA7XansH9Ca8/CVEtMh15QN+ZrW9QLPgPGP+GvJn2DwKvZspK?=
 =?iso-8859-1?Q?TockhAiX2UCDcQmBXkKk0+1NlbxxIX1pCCTA2PjWH3m3YnI/tNFP4/ezBY?=
 =?iso-8859-1?Q?dkDee3xBuaLgAa0NzL4rieQ+uvUCLkE3QnApruLc6O6GOt3HzcV8XmN9zG?=
 =?iso-8859-1?Q?fDHjtRtinbbsYCi1HME2IHPaBrY7elyz7sw6bk67uehFQci26Jv8BhThlC?=
 =?iso-8859-1?Q?fh3WHJABbW2VeS0J2uNR4DwNUTfq0MTsKevjStLGUlP982p6JJBJ2wvrIJ?=
 =?iso-8859-1?Q?usxvOSS18abCxKwk9Qn1TfH3oL9fSfLMqTCjccB0iZm+afWjFYWf7WPjty?=
 =?iso-8859-1?Q?Ku6aN1PdWlbWlNqq5/Mp9FPpvVa4ewlY+z3x/ST/L5n0kZRpMJ3abElQql?=
 =?iso-8859-1?Q?9+lr5nWim3qeVQ5h3uR8mcus7RrfZaxCpIBapwJUKZOYLnAOQi5AdE+AQU?=
 =?iso-8859-1?Q?mekcKTdepl884/INbvYrmem7AePX0K/RTRwO1WzzvXt2Wm9BXuoUK9bu4M?=
 =?iso-8859-1?Q?4KtyiWoNGD1jGHeX3U+/Ca1gp5/u0aqAnn4O9jZzBQTCOEJSfk6sc2oacP?=
 =?iso-8859-1?Q?cmyrhKpAlGyYqdRKTlR8B3QPPaL+ZGUBeY3xmJQulw69aauSZsadEYpHNt?=
 =?iso-8859-1?Q?hQTHEXN4rCGbrSp2v66R09/gan8kkYyblIRUn61aUFUe04kUBF8+7gYmqN?=
 =?iso-8859-1?Q?d/7bPkYhVYnsG/29NEIly9ydG0mJM2feHGqNDUM25GsLxDZbdmiLbt9eiX?=
 =?iso-8859-1?Q?x69EdnhZ4i71bQ+jxY0TOPXINIaTcDlJPhXR54XQgIXe7yGvcXmfKJX74E?=
 =?iso-8859-1?Q?lYwJqFZD41ikoqaQx+UgZisqRE/JYu3XoR4XIMrAREGN7sH2n7f8EyFlvb?=
 =?iso-8859-1?Q?CAMOTpDExsEf1toTlQQjEs4TySlGDJaXWwWWnjx0nCwbqMzaRaHWYU1U45?=
 =?iso-8859-1?Q?AYl5ldDQIeQbUzpJjqmQznZScGdtLbaGaFAcM+CiWY1EoY9llzs78qrZEY?=
 =?iso-8859-1?Q?MoiUVC24omhXlcHUUGPmudigeSQBr9gpX1TojjEF/O2PnSu8mjfRpya0oP?=
 =?iso-8859-1?Q?uKyl1DSGwlnpXYr9xYQHQv0MdPhSFg0B+OVcj3rfogMYMmLM7tXd6USGDL?=
 =?iso-8859-1?Q?3d1n/+Goj1nQxXYKbpBuUvrrMvAumgVbnCs97/ew+MqF5PnJuIr1wHihzc?=
 =?iso-8859-1?Q?phHD2o/WmNATFcimGLRI1YNyM7hyCa2s4B3u1OK//DRd8dKOgcxap5I+MM?=
 =?iso-8859-1?Q?SODjXzOooPNmUdtHTjm+M/DYCWkUhGmS6gUkyrB2LlOsGfmaSU8tzSag?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b72daf48-a57d-4374-face-08dd6c79420f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 15:17:01.1022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7qpC+z4WDwgAbCAbmzkwSLA8iSaGYDVY4YZokLg140zZ9vUwZ106B02xUCR0CsxLtz+i4ycdl9PLrBPAqASu4NT7xUBWGmfHTEdUpXKl57jeeDvhVRXJEy3esA6Y8WbA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1778
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213650

> It appears that somehow dependent packages (e.g. gnupg) aren't rebuilt=0A=
> to use 'libgpg-error0', and at the same time apt isn't able to see the=0A=
> newly added RPROVIDES that would satisfy the old dependency?=0A=
>=0A=
> I don't have a local reproducer yet, trying to get to one. Plain=0A=
> selftest passes for me too.=0A=
=0A=
I have reproduced this. You need to build the image twice to see it.=0A=
=0A=
1. Set up a plain yocto build, put this in local.conf (which=0A=
replicates the selftest, particularly in putting gnupg into the=0A=
image):=0A=
=0A=
IMAGE_CLASSES +=3D "testimage"=0A=
TEST_SUITES =3D "ping ssh apt.AptRepoTest.test_apt_install_from_repo"=0A=
PACKAGE_FEED_URIS =3D "[http://bogus_ip:bogus_port]http://bogus_ip:bogus_po=
rt"=0A=
EXTRA_IMAGE_FEATURES +=3D "package-management"=0A=
PACKAGE_CLASSES =3D "package_deb"=0A=
IMAGE_INSTALL:append:pn-core-image-full-cmdline =3D " gnupg"=0A=
=0A=
2. bitbake core-image-full-cmdline=0A=
=0A=
3. Apply the patch.=0A=
=0A=
4. bitbake core-image-full-cmdline ---> kaboom.=0A=
=0A=
Alex=0A=
=0A=
=0A=
I was able to reproduce the problem now.=0A=
And as you mentioned, PR=3D"r1" fixes the problem.=0A=
But setting the PR variable is rarely used. So I wonder if this solution is=
 okay?=0A=
=0A=
Mario=0A=
=0A=

