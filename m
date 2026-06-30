Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EA4C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 10:47:03 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18114.1782816422156365619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 03:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=cecwtCal;
 dkim=pass header.i=@bmwgroup.onmicrosoft.com header.s=selector2-bmwgroup-onmicrosoft-com header.b=3u74UZm2;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=634d33241=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1782816422; x=1814352422;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ruGtOJspz6k+Aye1DlsUnQEbrzdS4X2RZS7+dXSWo1c=;
  b=cecwtCalr7HQRvW4bziE0RI765gdoiQytZ4r52m8x8fSqPcX40M8EZrW
   jT2MpS8gZDMmF4Uy47pzBNOlZ9FRJTr1zvXy4V575l4UiYbH4HsuzWbVz
   Q33/UCaE2pogx8XUL8y8bKemWjf0AdR3J8AdpHxAyBPmefGpfU/7K3YSd
   Y=;
X-CSE-ConnectionGUID: 7aZbUq9+R/SZa/Wv3fY74g==
X-CSE-MsgGUID: NUpmcuSETruVYDVY4EZrVw==
Received: from mail-westeuropeazon11010046.outbound.protection.outlook.com (HELO
 AM0PR83CU005.outbound.protection.outlook.com) ([52.101.69.46]) by
 ob1.hc324-48.eu.iphmx.com with ESMTP/TLS; 30 Jun 2026 12:46:59 +0200
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com (2603:10a6:102:4c8::8) by
 VI0PR09MB8450.eurprd09.prod.outlook.com (2603:10a6:800:2e6::20) with
 Microsoft SMTP Server (version=TLS; Tue, 30 Jun 2026 10:46:57 +0000
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::78fa:1fed:9dc1:fd99]) by PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::78fa:1fed:9dc1:fd99%2]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:46:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMBBEmFiKCge5Xo8RR2pMCtLr15GsFZG6bJbwuYBv3yBdTiT7jOhHLMJ7NjJ9CVYfEgKrCG6ouKLvdwnNMNCshkNf8cW5wMH24D7cBdr+erFhgnfWvvlMFMNsFvaq00Xh4fiAXD6D5I68+SCtpL8NZSn1KAeKe8O3qK1/nz4L0hhbXLdddWHL81cty1y85UPJQYxHGJ3pHS5YXgUyOJWbTrFpmH8knXmNomIi7fG3A8K/Pe8Z7IIqf5LPoL40ArY9bwRzkFkUjoZxOMERNO0qdS95nsCsePhxPaYdn8ko3r4yNJjeL2/znRjD+s7YqKbtHUbL9D5YcfzS2rX2VRXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruGtOJspz6k+Aye1DlsUnQEbrzdS4X2RZS7+dXSWo1c=;
 b=LTM9wAUIb9QZwo5gEVHPWKcErWPwr+CvHgpgGoJ5vAdGUX/jzzTScgBSq3GUenQF3lYY3hN09TFacm9+IgVnhttgN+02+2qgPD29ymJBviVlPyeVb11mkuhAPV+wLVp5fHuQ3zBzEXRrCXpoPjZo2n858YRwSK0TtOq5t/dpon8GPrrATKG3NcVz/pB3sAJIJC0jGlOH3rFMlqiFq9aNKmX21HP0z1dnkmSLr6/Oh56mdStwZjHuIzh8cwIUYXkI5Yc5mhEjKcpW9HUYptaXpi8Q6pP1M7cRX7B4uwBeFNR1Klyjx8zy+0RXXJwzzugxP8ZAKypa5OkMXveYZfNWVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bmwgroup.onmicrosoft.com; s=selector2-bmwgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruGtOJspz6k+Aye1DlsUnQEbrzdS4X2RZS7+dXSWo1c=;
 b=3u74UZm2rW9fNzEdB3aeOLDg1wKuKknD8C+1nceiU+JHKb6YhVgNew/mtV3LUuZMZMpAN9VfHc9w5a437qUXCXQ94XebQqcAvvHYPDZQs9dBM5rfPQ+WD2Bb8qwySzq/lu231mb0dAzQjbBqOjryKm0wnm6B8Vysov22udNkGe8=
From: "Haase Moritz, DE-811" <Moritz.Haase@bmw.de>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] json-c: upgrade 0.18 -> 0.19
Thread-Topic: [OE-core] [PATCH] json-c: upgrade 0.18 -> 0.19
Thread-Index: AQHdB45PbeuN53Q/ek6llaaMOlNNPrZWwskAgAAm8GI=
Date: Tue, 30 Jun 2026 10:46:57 +0000
Message-ID: 
 <PAWPR09MB8030781990889EA67DD21074EAF72@PAWPR09MB8030.eurprd09.prod.outlook.com>
References: <20260629061229.702229-1-Moritz.Haase@bmw.de>
 <DJM8I70PCCB1.3GWRSQAJKNDNE@bootlin.com>
In-Reply-To: <DJM8I70PCCB1.3GWRSQAJKNDNE@bootlin.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR09MB8030:EE_|VI0PR09MB8450:EE_
x-ms-office365-filtering-correlation-id: 58fd914c-289a-4668-39b8-08ded694e878
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|19092799006|1800799024|366016|376014|23010399003|38070700021|6133799003|22082099003|18002099003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 BbySeix64dZ5OepLxIxgvpu6R4feo7nw0KvPtLMuCucBLgM67FtyLO/oZpVO8Yv5znlzACX5aHJ758Z3qVeRwek9shXj7vicjJX/rDLjyeGet5pA7xOKLWBbNYzBCSXFYdHnt3oldKX2DgJ7qXr1P7k3Dqa7YW4Hi6YVadZKFY8Bw51ACxuaIW4hamE7j0xP6XGD9Clr2B8Yg+ygWAUDBDyrvF4nsRl1CuX0mDPklIYLHNbbECCYVBgc9aCMkb8lzh/9fvJJT7tn3DqjJ/38VDc/AKpMxlT6SdhC5MzE8NMy1bdvfJ5pR8Zkjx36GMjyTC+ScQujuefdwgyjAEk0LnbuUbHF4KiW0xryamYtpRzkdlPikS5lt2FdP9hFYlSgD6M3BSxi7d0i0gMdEW+A2FTcyIeIrfi9Yrj9tZdQ4DZQn4Caa5GXim1M6NJKt2+7PkJQ5WRNwz+AOFqw6Mm3KjMufCNENzJOOKiov4Z5ht4IfNlFOVH+jUY5BUl41YFbL5ERPaBgQsBzXeeHPdKQ2a+eANKacwcF37nAbphL/YdyCmYWVY+4tua+TYyNcNWdare+UhAPHwrnDFfu0JVzBz/jOmUFqjRuJnSuxrnVXOR0xX1jk9A31sGJoR2lagBpv9S6k0df0jT3YTG8YWezKu2dcMDVdwhPGg+wMZiV9dpEnc/c9j1pAXhKp6B+f7cFTMt8icRG2RNsROT0oOfla2VUk2YhgT0nCniZCNDMlHs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR09MB8030.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(19092799006)(1800799024)(366016)(376014)(23010399003)(38070700021)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?c6oJY/BLNmhGRYDyS1QUdz/tFmBqogZk21PZlzJV9WyiZ1N6CN0h9r3Mt4?=
 =?iso-8859-1?Q?eLYLfks4b3q+HUoOrZj5qMBVRlOGTAGOYAB0vN9ssRHTq1/U0pO6O4jtYG?=
 =?iso-8859-1?Q?v8FUmeCgCwlutQfOms1I6gsFihA2isfZoSTHGalAL31wT9mnlaSwuQ81an?=
 =?iso-8859-1?Q?wd2C2X6PXTbCMGulEFdo0h/ld34MO8QqTWnRrNt+SjcqRvsI9YMfFxhVqT?=
 =?iso-8859-1?Q?P05+wSDntuz9vjlPrmDLEGQwLWZ8fcY9CRTIa/YV4D2XLcVosLUESsraCc?=
 =?iso-8859-1?Q?o3eCTYJi412DUiLKbETml/erWkbDwUeVihD4bOMJPLouW39JKa3w/0U+DO?=
 =?iso-8859-1?Q?4cMdnwbH9S/YlflB2kNKu/brwUTf5Z7X7yCJGIRtGUA1Mjk9THwT0iE1uI?=
 =?iso-8859-1?Q?6N9oFh8KPgwKNV9nZXaoVMZX+4DakRi9nCp9bBLWMrqJrwhYtasLtHqwYz?=
 =?iso-8859-1?Q?qXu8a3ke/yOA0AWGzSX3YkULaGgPgmS+O0toP5t3fnnjpuEZiynT5Bpb5y?=
 =?iso-8859-1?Q?gT8e08eRV5LwoRtmg79uNl7uWqgPP+QDcmj9fmY5O/F/zjafMstBKDm7ku?=
 =?iso-8859-1?Q?M8XIcG0MDmKMri1r5bZJzxEgR8KksaWkfEmNhn3yWW5X1lf5PXqvVDGoYx?=
 =?iso-8859-1?Q?QL6gGBnHW0DWw0W+ZMKWf4kkejolKAZOQjaLPyqVsDBInIVLPY/8PWUWKj?=
 =?iso-8859-1?Q?1D4c/pQmddORjkeZHxLCP2W9g/UWbQ8m7F8IWZNsXZNmF3DRsYFrevmMRG?=
 =?iso-8859-1?Q?6DJa4cHyfC9ewQGTEocSuJb8IOxmC4Jr/qyU7kCne2yOR/zz/kIQiDmNuV?=
 =?iso-8859-1?Q?0xma8EnWM0u8DuhM5z0/jat1zNk/G97O2djnwPGTOOFgIZhEtVkRBsKe+X?=
 =?iso-8859-1?Q?joo8/HQgq+PvxmJF9LBR2ydpIccLPBdBF5muI5fycyt8w5RJmMsOq7yHUr?=
 =?iso-8859-1?Q?nNC/AyDkXcU7y/u9YjSlNS4TwWdb0CVdqKHe5rECEcBUp+ArMI9DIxd56s?=
 =?iso-8859-1?Q?8QwoS69xOeaqYptywySgDxthR7FwTo2v3x+fV0bnKmKonzW+5lR/yXWveI?=
 =?iso-8859-1?Q?a+lGXbHc+/sC+cWjhzLiZG/zpqd5xSvNYnhDS+EV03c1VLjwpmUZ95t00Q?=
 =?iso-8859-1?Q?gAJBiU3Qb0e9G2072YQtC5GduSYUkmD3gRQSyxrEKq7qL/KWQPehIJr9pI?=
 =?iso-8859-1?Q?n/5HPUKt7YLlCK6giqamXAIcd2amAGJ2rQhoizmESBUInZRnytFyLbbaZg?=
 =?iso-8859-1?Q?MlfHHVvwYuWNhrSNrJMsT401Cw1zxBifadflZ8znzDm00fB72YaufmO/cu?=
 =?iso-8859-1?Q?VfKm8+oBn3PWxWUjUzgo8w2uuhYnNoCDLMWwH58YshQ57qqri0+SWOIhet?=
 =?iso-8859-1?Q?woINjQ/Bo+TceUvy3ve9sT0KKPRAq4EJwvNKZWU4aXoh6hXPbMFbU6A1gG?=
 =?iso-8859-1?Q?gMB7IBo4J8YhxC38ttR01iaZ3TTakJxAhSPFPwJkuHDZZflcBER3ioNrw0?=
 =?iso-8859-1?Q?O8Hg3kuVTH05oRC04+FQyyYYQYR3HX/FS8K2lkaoc15TA10Lp9fnRm5Bxs?=
 =?iso-8859-1?Q?6XCKelIpkvQbERQw16DhPcrwWyZpB4h6hi++SM9LHSkfByJvaqDH018rUW?=
 =?iso-8859-1?Q?Fbf7f1C1s6Mx9uWy0YL8G+phwfYr30IWQcaKudRrcDC2OUQd4MCydXmzOa?=
 =?iso-8859-1?Q?+1bM3sMhBaG6MQXQLMZN51L2GrEvu0k8vt8iwZYQGadtyqeyqfaCXIRWEX?=
 =?iso-8859-1?Q?RlWI2h9FctyqpRqOL1yiM5JxDxONzwcOSxUHY/6iO6/vqAC1I5o+DLyS7F?=
 =?iso-8859-1?Q?RwkI3VqX5jw58P876Ix8N+c1gg5044ipD4+R6YBrPVwFCtW+Y6F4?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	OnSDnYc29olBsoX9lPRaSj2Qr9PBZ2LIFtu5KcY+VSQV6IfKMiyeHQZytqdjbxK5NWlbG6UHjxAOFzYBpGtKM92XRXDGO1LTkG0C+qO/jUaMvLJ4USfRVPRFnWjdIIVSPwUw5j+2d2d4oKyz6HHbWPaw4x93AE5IerQpl+J86yrFHzyUX7F3+aYF0BHLY0DDyGzt/quI+eFKOaZGhUNyrgdWErUVJKzKedezVXo6UW17aXmEMzZYaFBqz9BKAypUNGOAxwNpcBkE2uyEZhP96pvjF6AvouCSkcXBp1Z0fjHjPmxPWvPPhtLeAJ0uwDQhcViXTnOv+mlqrs8OsPfslQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2f4oQkh3f+gSr0EhqUhK3dncIstJvsMMV6E2MhbROnyjAZlDEJMX0kDp5vRRtswbsMG6z6xDjx7EPqP4r4mEw2QJCaAwJ21hoj8q4WyLEAQN1XAXBGHxsKtSPGI2TQEtyBrSrDHdd08GRgH4IkPmAWyblQCsPy0frzFgcDzonc1Ntx8bh7aEtxcrxBUUUMn3mqIdMB9xOip+NKrQkXFq02SF+l+xJ7ElFJ0Ufwi5Z6/6jzk3hNWhe01mEWRi7dpoB4CPBpM4Awch43wD2HQK5uvs1nI2w/hYTss8yw+CxW6Ca5FBggHF5HEQCJmFGCmdJmt9vWc6gvPaiUOqYhtxeXDDSs40NUnjawssxSjyG/ksUEsEXfPKgczuQH5zRDWd0URN7E1zztCrAO1WXXMkCmP2EcX4FpE+O9v8fESuHAOKx4dVwHnJ/nU1PQn/WZ3RsnIp8wFj9gaifO4iwfN6/P9LFUJ/iL6ET9BFTmEAurbyc31M3zhJqJwVnLhWLXxOvj7EpU+IDaVdgljc0Y5oOLCmu1GAfQyYPW1W3x8jFaS4zyj4fHHAGVtMYvKp74esC0zvpaZBuc7zgKaTLJ+BlFU1rQhFLHGbe3jkAPf30pPuhH6i+xQemSgg8hAMsoESmy5pTAxTlaxmJfBfY+cHMQ==
X-OriginatorOrg: bmw.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR09MB8030.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fd914c-289a-4668-39b8-08ded694e878
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 10:46:57.5691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ieOkKeM5aEDBrK86MIF93hr9coHqgywuOrJGiwCwEXhFrPbbDn4cDStu8RBf/HN5ztlCuAOHnJqog3x7OoKiNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR09MB8450
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 10:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239874

Hi Mathieu,=0A=
=0A=
> It looks like the upgrade is breaking the ptests:=0A=
> [...]=0A=
> I can see at least this line in the logs;=0A=
>=0A=
> FAIL: test_json_parse_cli.test=0A=
=0A=
upon checking the autobilder links, I couldn't find the test log file=0A=
(json-c_test.log) that the ptest-runner generates (see [0]). Is it availabl=
e=0A=
somewhere or would I need to re-run the tests locally?=0A=
=0A=
From looking at the implementation of the test (which was added in 0.19), I=
'd=0A=
guess it fails because it calls the 'json_parse' app (see [1]) - and we don=
't=0A=
build the apps (see 'EXTRA_OECMAKE').=0A=
=0A=
If that is indeed the case, should the test be disabled/skipped? What's the=
=0A=
preferred way to do this?=0A=
=0A=
Regards,=0A=
=0A=
Moritz=0A=
=0A=
[0]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-devto=
ols/json-c/json-c/run-ptest?id=3D68f7ccf9f4c9bc4cd89b8c519f5b3b6f28a2464e#n=
13=0A=
[1]: https://github.com/json-c/json-c/blob/d9d8cab82291637671f6c90cf06e5787=
50a08718/tests/test_json_parse_cli.test#L18=

