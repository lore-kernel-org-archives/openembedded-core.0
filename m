Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD46C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 04:16:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.84])
 by mx.groups.io with SMTP id smtpd.web11.10717.1713759380630987897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Apr 2024 21:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=KUQ7F9ae;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.7.84, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfI2CuKGQTUBEwXo5Rv2t/RfmjLNw04fzC9MgwTJwaql0FJRAr33RKPHlVBdIXFBG7EtfZ6gKfPobgvyZ44mJj2wPZtz1m9sPvG6jWE3ki026yqeS4psvc+wjoIyiVzvpsJ4U7WD3wZgbz7ZTD0muhPz+GHIUuq2nF8GwuH3ycH+WTye5nvdqlJsEaaCSAiET0L5MOoVXCExvSNoXo9mAzajvU5rz8kkh183e3VKmr2o1e+DnR22nNpMlMJJvn0PsHXgveoMUCajkF3+j567Pk9HXFAZVjU/Au/gTG4tORU3jAgxjCOsKaMzwf+bUN0cOybp6Er3rjh+UuP1drAQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRnD7qaO2jEMD28kg3y+1z9FmO9h/7GXfrCya6lRC1o=;
 b=PHR7OHVhvqbSNEXy6KG5FHc91T4MChfYTG1m3XASvFiX3BrFRJoDQk5UofYDi6pg5/8V3Pirb9skfO6ZWC9Y1UcCBPuUgvu9tLZVISZfL6GwbwAwyWGp8XVtIOKFKlBsik62JT1D/ZsbtIMYDsHEmVpET0xX1TIQoz6ZzDDFybhVvnOfaXFfgWqXy7veGxxqEm5jy8aiK+BnFZkASqhrjPNM1FaQbjn3WECY4keNkh2wV7Y1TQoGHEtq6MQziCb4i7eXqu3q7JzYayMOGMdD/1QbF+oBFaxPktAoYff0/7dW3kFLqvBOcn6RrTxmU6zR+/WvP31AUsAbhgr7ncUHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRnD7qaO2jEMD28kg3y+1z9FmO9h/7GXfrCya6lRC1o=;
 b=KUQ7F9aeEzWVUnNQPrPU1qfJZEb1nlKAjRotXkGsYwPsbvrLYcia6dXUnaWSKizEg5+yqbUFSIF2JLt4eY9Anrpi4S5sVV8/HbobgG+tL3501Kp46nSq8NkUB9ASuULEJ4f2ySTB3mDvd5Eyosd/fxJof3MA4Owq7OAUyGpuUPo=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by DU0PR06MB8478.eurprd06.prod.outlook.com (2603:10a6:10:355::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 04:16:15 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d%6]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 04:16:15 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v6 0/3] pkg-database and systemd-sysext image
Thread-Topic: [OE-core] [PATCH v6 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHajvpz9JBybeqRQUCc1ZekhXRyvbFzOTOAgAB+SVo=
Date: Mon, 22 Apr 2024 04:16:15 +0000
Message-ID: 
 <AM8PR06MB75217C4D3821ABA099FAA452BC122@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20240415060203.2961-1-johannes.schneider@leica-geosystems.com>
 <202404212036253f0987d6@mail.local>
In-Reply-To: <202404212036253f0987d6@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|DU0PR06MB8478:EE_
x-ms-office365-filtering-correlation-id: b27889f6-c148-4024-0176-08dc6282f390
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?sSAagJogSw4ApDB4BypGwF9wspeD5FlLE6ytfE3dV2iDRq2i3R/javXG?=
 =?Windows-1252?Q?vv5yeBQwXyW/Xzg5oxnH3XKpu/dXBRmFCzO0KWpk+v2gBYXAD2AOXWzE?=
 =?Windows-1252?Q?o8oOIU1K40ryBuwbxTqw5WLqCKhS9caGi9asALjKYf8Ibv+FgrANozrs?=
 =?Windows-1252?Q?+ISDCK2JelXECk70EZ2Y08wyA1FXG73tBXmEtlfAcGgJBHacG7mSOL7j?=
 =?Windows-1252?Q?FuSLoAs8WJcNbREhp437sKHN4j9e6iQt7HQ+AriN6EN0ZGv0vAMc/njD?=
 =?Windows-1252?Q?N/mBgoMf39UrKy1GpARXaUgHT1TsxKPGk3EeeCGz4jhCXcRPvpQdJ5rP?=
 =?Windows-1252?Q?RD6D7citj4nNEXBjUkouGqL155CyX44JyjdT0ISscZFB/S6zRqKvuUPX?=
 =?Windows-1252?Q?AR9mOWRYCWB+e1XaGr7TrbcjoPDO9HziVc7thr7uBVUoSYjve4n2ozVv?=
 =?Windows-1252?Q?HFCPq31D5dnlW9JBmfI9lqYIE4OmwFI+3aYcbxnoTgyjCMnqwKqmZ39X?=
 =?Windows-1252?Q?4305hNcpQnxDqh4tQlCswtlle1JTxpAxX7VNsELOscShB9LA1RDV/xan?=
 =?Windows-1252?Q?xeLF77sJM6zgNuMY/q8Rl0LrItFXJ93nRdH6N3pTAU9crngm2iLKEqt9?=
 =?Windows-1252?Q?IBumxQ/KikEYQAVXCHy85FFCvm5Z3go3Ppplv3eeuaKDjqa1byYQV8Ur?=
 =?Windows-1252?Q?Hu8luYq/CjIN4in8YQePFiFZscy7dELnW1WN0h9BhW2XSSJDkUnfDIks?=
 =?Windows-1252?Q?5myKvJEXZqvttM7yj0Kru0nZF7iEpGhJaXBrJtg4PaC9oTIy3QEPZAWs?=
 =?Windows-1252?Q?5qZPqPS12rWfveFvcIz3B6KR2cGUU5lQDCItyff8sBFiB79VdSwAFCPL?=
 =?Windows-1252?Q?eAqStJ+trfcikEll6OMdJpxwFLO7+7/rBIObMnPLvObMwRkFP74juAir?=
 =?Windows-1252?Q?2rf9vp05jAar1zcgX1plfwPkHMn/Li0U1pXCGbCJVAL6XYdOhnMMqB10?=
 =?Windows-1252?Q?+N9E+Uwdr4H7Sz6DaN6vIkj639/fBKKfUw2R9oXSpO7eUps9V6QD00Us?=
 =?Windows-1252?Q?TqfhcdNwWzFVXUI9l4VA4Lvv5x3LUl7mTWC+qCQWj1ti7RNcTM2HBBdl?=
 =?Windows-1252?Q?ijHrXnBI7Noga/AmAni3qBk98xJKdN13ah/2gwqAsCO4afV0nV+s+6Pl?=
 =?Windows-1252?Q?6nVVMF7uOpQwtz8qbAdPIAF5BmIZq09anjFXvvHGhORGS/VNkWHnb64O?=
 =?Windows-1252?Q?u/tQ/jD4rQkYvuVldvsm0CbqUtDToAZQShiyzIfYgx5lQwvE9PuzBOIc?=
 =?Windows-1252?Q?5I2e/SUfRdQbVh+Ui5jyyl7mNlPj/qYUFug/FwwB9lfl4UyKB0W5fFed?=
 =?Windows-1252?Q?sPfbKhy5XsVoDg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?AVZjsGKdUsQOdlc/zhBDFU9fOjKYoxxUJ6y5rCHxlQrxtnG2Mqf6pN9O?=
 =?Windows-1252?Q?u4gjrFvSDeBFAZRVeLYmMSbQNSGXQLtzMq9dEMZkpS+Bvoj2gqCq1Ieg?=
 =?Windows-1252?Q?8MkBZRRQ0PBGNwiazxTXRgi+BijrMmyQVk+wUaw6a+fAlF9cFJ0vKqLZ?=
 =?Windows-1252?Q?bmYRXliAnzA/7NLBPvoLFUE8O57sdvGcoNIva6Ln5RwrSX4/QqGs+j7k?=
 =?Windows-1252?Q?y8L4WhFIM53AQjoaWKftjEcojxYIwnrXv3wNlp6Eg/xFFLnIsZCQShIs?=
 =?Windows-1252?Q?ccqVInrDJtIUtuecvhBxXfrbFeBQ9bX6VG6eKrzfKmnO/Bh3qCNz/8Sp?=
 =?Windows-1252?Q?45AhQmNIu+k8fdBthC2WwdJcSPigDITU8CImDCrJnxXd87Da5gY5cQIu?=
 =?Windows-1252?Q?GTW1Qqup+nAd3fU9VSlSgjQ7M/mgqzmFsq5ibLaVb9sNKIXfN+azg9Vn?=
 =?Windows-1252?Q?PwjDtmdYZ3tsEezdoezKJutukltRjrOeu49tJFdUf479TGHbTHqrUote?=
 =?Windows-1252?Q?/ZvzU3VnOHW9kbGaE+RYmhlp1jRIlHn4xo8VmujgYISxLj0+B8PeOkm2?=
 =?Windows-1252?Q?r8nS6ufGKM6BjNM4z6Naxdkj6UdoAm3VB/VFfu5KuTuK8JPOOBiZgjxc?=
 =?Windows-1252?Q?7MJSEDWVEkHckOxwX4gTL8d1pZb1PY+UC9pC7x1d0ML0aLgRTEkKIMVN?=
 =?Windows-1252?Q?6EKpeanCrlup6qARynppVi+jldQDk4fmGh83LeYWwcqO10RB3ndKQ+5K?=
 =?Windows-1252?Q?94gWHDiCiTFa8l7rrdOfrFcPrGyDDAbjWkULRhiklHK3pVVd9u+bjIS0?=
 =?Windows-1252?Q?9Dqnm14DAagPUDU5WROzeI+/Pany+vxXMthv85O5iSQ7yI1j+Z73OuhP?=
 =?Windows-1252?Q?jAAhGOoSApLKyjOmz05JDVrpUfT4BvXWrVsZlSiqB37IT6M1SWHG53SR?=
 =?Windows-1252?Q?47hu1/7DsE/PYrIQEWCJfB4j1ps2SyfwIZigKqOzW3lQfHK39dc3/e4t?=
 =?Windows-1252?Q?LyiAAu9namP6tM5DkOigTaXfA79DHmV7o1lf7QZ1Ored4qjny5swdR4R?=
 =?Windows-1252?Q?nqVsM7sNiecfrYYZyq3Mi1VayIYy+teoHGD/wW6/xnr/J5BilUZ/j955?=
 =?Windows-1252?Q?Gr4MZg2vh9qsLJ8vGTmP1hLBnQXeYVjQ1YKWDDs03qbojQxSERY6Dluo?=
 =?Windows-1252?Q?mSJLz3oZEjAYagD59qCJSMiZvlYGgDJpUrQ65kzYNM3QpvR8pcHb7Kc2?=
 =?Windows-1252?Q?HuInTp39hraN++LUvU5ZdLbDfeSHbV54hrcdcA+4uhmdHmsGQEHYnU43?=
 =?Windows-1252?Q?aP3vjTt0WpzowgOe2X7bOk0k6ENQ2/nOhWkihOGkgrqsc81Fou9q0QTO?=
 =?Windows-1252?Q?IcC8cvns8bjqEtK7qqPnlZo9yNHD0qPfwbLBh7ApcvOFpL1yQct0eNtD?=
 =?Windows-1252?Q?6c9to3eWTQlORrolbKus1iD+9uuC4iWYXcAlfKtoK0a7vG9e7hVINL4m?=
 =?Windows-1252?Q?m16aqQPk5qnHQiA6HVJBUil/gqWjXKdU+8XMSdngc6S/HKxnMtKQebIa?=
 =?Windows-1252?Q?zqm3DzHIgyA95E3a0RJALNHTvyrAzdfcB6szjOWrBAe5BRNnoVR0ba0a?=
 =?Windows-1252?Q?bD0zDaaXjn2NrzwoEXlxxTCXroYBaxe+YfdpGNWoI36RQz47ccVvP1w1?=
 =?Windows-1252?Q?sG4493cBkPIkiQEwn9CcEeXbctxLJHvpZe1hoxvundDbhzn3lICQnBsC?=
 =?Windows-1252?Q?hNG5HTl4Saqg4wgNkkM=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27889f6-c148-4024-0176-08dc6282f390
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 04:16:15.0877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LaFAQI0EmLEhu8yXjVFLqGV33nWXEo8mX/xneJQXqh4a6Lk0Gg1IkF64Wlf2XUkJGVaHIZTbqJVnYfpVR30y4NpokooqO/rcFgO4koeUBItJBtSplm2lUI2juSgcecH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR06MB8478
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 04:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198580

Hoi Alexandre,


and thanks again for pointing out the build-failure.

but since the recent test restructuring didn't help either... i could use h=
elp to reproduce what the autobuilder is *exactly* doing :-S
because when running the tests directly, they pass (see below)

my guess is that in the whole/complete test-run the autobuilder pulls sth o=
ut of the (sstate) cache instead of actually building the image with the di=
fferent feature-set?
or could it be some other side-effect when the whole test-set is run?

i had based the testcases for this patch-set on the others already present =
- so the same logical flow of building images is used (or did i miss sth?)

any hints/pointers/thoughts would be greatly appreciated :-)


gru=DF
Johannes

$> oe-selftest --verbose -r imagefeatures.ImageFeatures.test_image_gen_pkgd=
bfs
2024-04-15 07:50:39,668 - oe-selftest - INFO - Adding layer libraries:
2024-04-15 07:50:39,668 - oe-selftest - INFO -  /bsp-user-workspaces/scjoh/=
upstream-patches/openembedded-core/meta/lib
2024-04-15 07:50:39,668 - oe-selftest - INFO -  /bsp-user-workspaces/scjoh/=
upstream-patches/openembedded-core/meta-selftest/lib
2024-04-15 07:50:39,669 - oe-selftest - INFO - Checking base configuration =
is valid/parsable
NOTE: Starting bitbake server...
2024-04-15 07:50:40,549 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /bsp-user-workspaces/scjoh/upstream-patches/openembedded-core/build-s=
t/conf/local.conf
2024-04-15 07:50:40,549 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
2024-04-15 07:51:03,338 - oe-selftest - INFO - test_image_gen_pkgdbfs (imag=
efeatures.ImageFeatures)
2024-04-15 07:51:03,344 - oe-selftest - DEBUG - Writing to: /bsp-user-works=
paces/scjoh/upstream-patches/openembedded-core/build-st/conf/selftest.inc
IMAGE_GEN_PKGDBFS =3D "1"


2024-04-15 07:51:56,862 - oe-selftest - DEBUG - running cmd: /bsp-user-work=
spaces/scjoh/upstream-patches/openembedded-core/build-st/tmp-glibc/sysroots=
/x86_64/usr/bin/opkg --volatile-cache --offline-root=3D/bsp-user-workspaces=
/scjoh/upstream-patches/openembedded-core/build-st/tmp-glibc/deploy/images/=
qemux86-64 --add-arch qemux86-64:11 --add-arch qemux86_64:12 list-installed
2024-04-15 07:51:56,875 - oe-selftest - DEBUG - list-installed:
base-files - 3.0.14-r0
init-ifupdown - 1.0-r0
kernel-6.6.23-yocto-standard - 6.6.23+git0+f7f00b22ef_2d01bc1d4e-r0
kernel-image-6.6.23-yocto-standard - 6.6.23+git0+f7f00b22ef_2d01bc1d4e-r0
kernel-image-bzimage-6.6.23-yocto-standard - 6.6.23+git0+f7f00b22ef_2d01bc1=
d4e-r0
kernel-module-uvesafb-6.6.23-yocto-standard - 6.6.23+git0+f7f00b22ef_2d01bc=
1d4e-r0
packagegroup-core-boot - 1.0-r0
sysvinit-inittab - 2.88dsf-r0
v86d - 0.1.10-r0
2024-04-15 07:51:56,875 - oe-selftest - DEBUG - running cmd: /bsp-user-work=
spaces/scjoh/upstream-patches/openembedded-core/build-st/tmp-glibc/sysroots=
/x86_64/usr/bin/opkg --volatile-cache --offline-root=3D/bsp-user-workspaces=
/scjoh/upstream-patches/openembedded-core/build-st/tmp-glibc/deploy/images/=
qemux86-64 --add-arch core2-64:11 --add-arch core2_64:12 list-installed
2024-04-15 07:51:56,888 - oe-selftest - DEBUG - list-installed:
base-passwd - 3.6.3-r0
busybox - 1.36.1-r0
busybox-hwclock - 1.36.1-r0
busybox-syslog - 1.36.1-r0
busybox-udhcpc - 1.36.1-r0
eudev - 3.2.14-r0
init-system-helpers-service - 1.66-r0
initscripts - 1.0-r0
initscripts-functions - 1.0-r0
kmod - 31-r0
ldconfig - 2.39+git0+1b9c1a0047-r0
libblkid1 - 2.39.3-r0
libc6 - 2.39+git0+1b9c1a0047-r0
libcrypto3 - 3.2.1-r0
libkmod2 - 31-r0
liblzma5 - 5.4.6-r0
libz1 - 1.3.1-r0
modutils-initscripts - 1.0-r0
openssl-conf - 3.2.1-r0
openssl-ossl-module-legacy - 3.2.1-r0
sysvinit - 3.04-r0
sysvinit-pidof - 3.04-r0
ttyrun - 2.31.0-r0
update-alternatives-opkg - 0.6.3-r0
util-linux-fcntl-lock - 2.39.3-r0
2024-04-15 07:51:56,888 - oe-selftest - INFO -  ... ok
2024-04-15 07:51:58,138 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2024-04-15 07:51:58,138 - oe-selftest - INFO - Ran 1 test in 77.808s
2024-04-15 07:51:58,139 - oe-selftest - INFO - OK
2024-04-15 07:52:01,880 - oe-selftest - INFO - RESULTS:
2024-04-15 07:52:01,880 - oe-selftest - INFO - RESULTS - imagefeatures.Imag=
eFeatures.test_image_gen_pkgdbfs: PASSED (53.55s)
2024-04-15 07:52:01,881 - oe-selftest - INFO - SUMMARY:
2024-04-15 07:52:01,882 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 77.809s
2024-04-15 07:52:01,882 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)


________________________________________
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sent: Sunday, April 21, 2024 22:36
To: SCHNEIDER Johannes
Cc: openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundatio=
n.org; alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH v6 0/3] pkg-database and systemd-sysext image

[You don't often get email from alexandre.belloni@bootlin.com. Learn why th=
is is important at https://aka.ms/LearnAboutSenderIdentification ]

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


On 15/04/2024 08:02:00+0200, Johannes Schneider via lists.openembedded.org =
wrote:
> systemd-sysext allows to overlay another image (or multiple) ontop of
> a "base-image" =3D the current rootfs, via the use of overlayfs; to add
> tools and features meant for development purposes.
>
> To quote the documentation on systemd-sysext:
> " ...addition in order to make debugging/development easier). System
> extension images should not be misunderstood as a generic software
> packaging framework, ..."
>
> To build a lean image, that only holds packages that are not already
> part of the base-image, a snapshot of the package-database is taken
> after the installation of the base-rootfs is done, and picked up again
> when collecting the rootfs of such a extension image.
>
> with all this in place an example usage could look like this:
> some-core-image.bb
>   inherit core-image
>   IMAGE_GEN_PKGDBFS =3D "1"
>
> extending-image.bb
>   inherit image-sysext
>   IMAGE_FSTYPES =3D "squashfs"
>   IMAGE_BASE_PKGDB =3D "some-core-image"
>   # the above pointing at a package-db similar to:
>   # build/deploy/images/$MACHINE/some-core-image-$MACHINE-20240210172305-=
pkgdb.rootfs.tar.gz
>
> then on the device, running some-core-image, with the extension image pla=
ced at FN:
> $> ln -s "$FN" /run/extensions/$(basename $FN).raw
> $> systemd-sysext list
> $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge
>
> As long as the VERSION_ID of the extension image matches the os-release
> in the base image, the above commands return sucessfully;
> for details on the compativility check see the docs for systemd-sysext.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> changes with v2:
>         rebase from 'kirkstone' onto 'master'
>
> changes with v3:
>       incorporate review suggestions for simplification
>       add task dependency handling
>       add oe-selftest for the pkgdb handling
>       add variable documentation and
>       some more comments, and examples in the commit-msg
>
> changes with v4:
>       rebase onto 'master' =3D> no functional changes
>       fixed patchtest findings
>
> changes with v5:
>         rebase onto 'master'
>       add '.sysext' to the deployed symlink name
>         sidenote on the tests and autobuilder failure: run locally they s=
ucceed, e.g.:
>           #> oe-selftest --verbose -r imagefeatures.ImageFeatures.test_im=
age_gen_pkgdbfs
>
> changes with v6:
>       restructure test to call 'bitbake' only once in the testcase itself
>         (in hopes of solving the autobuilder problem; local test runs suc=
ceed)


This still fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6607/step=
s/14/logs/stdio

Reached login banner in 3.26 seconds (04/18/24 18:54:41)
Couldn't login into serial console as root using blank password
The output:
root
Password:
Login timed out after 60 seconds.
Poky (Yocto Project Reference Distro) 5.0+snapshot-0ee872ff1baf43e5436ccbd4=
c9ae4d733289e05e qemux86-64 /dev/ttyS1
qemux86-64 login: <<< run_serial(): command timed out after 120 seconds wit=
hout output >>>
2024-04-18 19:17:59,061 - oe-selftest - INFO - 6: 20/46 379/588 (131.80s) (=
0 failed) (imagefeatures.ImageFeatures.test_image_gen_pkgdbfs)
2024-04-18 19:17:59,062 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa=
/selftest/cases/imagefeatures.py", line 342, in test_image_gen_pkgdbfs
    self.assertTrue(os.path.exists(os.path.join(img_vars['DEPLOY_DIR_IMAGE'=
], 'var/lib/opkg/status')), 'opkg\'s status file was not present in: %s' % =
tar_file)
  File "/usr/lib/python3.9/unittest/case.py", line 682, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : opkg's status file was not present in: =
/home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3638382/tmp/=
deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-pkgdb.tar.gz


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198219): https://lists.openembedded.org/g/openembedde=
d-core/message/198219
> Mute This Topic: https://lists.openembedded.org/mt/105530718/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

