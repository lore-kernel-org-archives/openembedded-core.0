Return-Path: <Mario.Schuknecht@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46A1C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 08:54:27 +0000 (UTC)
Received: from FR5P281CU006.outbound.protection.outlook.com (FR5P281CU006.outbound.protection.outlook.com [40.107.149.107])
 by mx.groups.io with SMTP id smtpd.web11.17669.1742979259112885206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 01:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=1UHOpeBB;
 spf=pass (domain: iris-sensing.com, ip: 40.107.149.107, mailfrom: mario.schuknecht@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFOmXTEOgYgTDvqnuQ42Y49p2T3/yZhkGDcgM7f/bbdIFKEMUovU6liwx1/Sgc7XczseJ7+6MRAKNTuU03tNIc8Wdy72ssRFaZnCUU5h+6G11rgO2nEl8LbwkCcHfVVPhBfQ+IbHZoKprcPQF5gNbOAl4V17Dmxqj1cHtMSXE1fdJKpVs9a1VWNquUS5Otxv8puQTMhatKlS8w2ekkPb6crwG8hBz7oeVJHtYymkeq5majlG4Cs2m6hGHFgNInxWsgsX3w5P6fy0vZxqdXcQ4cdbT42268C8jI7InU9hhmGBOql+evGsS65TiU/g6C+WBWhWUcIPsDzBhkxzF+po8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHcnjRClGXlUiXe8uMm1xgVw32zCzSaJRCKd9xXGJlU=;
 b=n4Wkc5EhJozeYG3h21Klb9aeg3E2FYhBr/87MSVtZuNydW5dnEmsvq6TEiFt/3OkV2dYMUZIsiK8/w+2Q40i3maUi93YMMDNYjsOIhGmLn7VPH6Bm5to+CL7aH2gU7SioPZ55mC+S+E7aS9EzXLmLp+MXJaDksGdzsIw7lh4DIB1nNm7eJsuBpix/eRvkD4lI8CdGlFGiTxndFr7MtYl6sL1X77nJoZr69VqNIHcqbYQpQ3t2KpZUnTO4bjeMhCPsQfLs64/sGUsLLR9sFG2nSOyMtV59KyAImfDXPgpv4/ejuQzX+zlUy2qDygcdxowtC7R9G2AeXzlgyJwcod0Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHcnjRClGXlUiXe8uMm1xgVw32zCzSaJRCKd9xXGJlU=;
 b=1UHOpeBBLhakGnmIxNWyv/mzcPwkTZwDnM21+QZE8jga8MdRptaVEc88sd4tHWe9PnUxTj0evBMitmPSiS5ZdFmKS1CpvaZjGcs02xC4zJ8MJOQiI7JayKvsEax6KVC8yqx+9rr1wRbtgL7+QHB5IG2oZyg564E9jvUd3SJfLfXrKPw0hi61Vjm77E1MWzWukeq3ZoErHsNMB8vhlqVA7gKBcfMM7YWCIyxs/aP5scsCCkmnvoDkG1WKLZbdo1udPkgak9Q/mSsCd7vO+80/atUqRUr7L/FQmwoF72Rpe44jBrnr41TGaJmUVvvhrTqPf5WerHEyDPxrQ2SStwpSGQ==
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:34::8) by
 BE0P281MB0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:12::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 26 Mar 2025 08:54:15 +0000
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b]) by FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b%6]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 08:54:15 +0000
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
 AQHbmnPP0QBf95+sukinf7d01CDLErOBAZGAgAEZvy2AAANiAIAABl8AgAFPrpqAAa4K3IAAAU9s
Date: Wed, 26 Mar 2025 08:54:15 +0000
Message-ID: 
 <FR3P281MB1917F9FF291572262E0E2260B6A62@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: FR3P281MB1917:EE_|BE0P281MB0035:EE_
x-ms-office365-filtering-correlation-id: 93ddb666-13f7-42b9-3dfd-08dd6c43c974
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?BPLxPM85B0O6lO35ZP16dWN2QBPlnHOudzw8oSEEMn72YgLbOkoKj7TJay?=
 =?iso-8859-1?Q?+bQsPsPqLPBOuni24jn5BaCATtPxI3xp9Ra98Ig+nMG+FI0+nYh8gcWMqy?=
 =?iso-8859-1?Q?GLIEUnMkX/aQCQWqX/sJOeT92WHiF27Bmc9wV10YoNjlpP7MMUb2Oe/mWw?=
 =?iso-8859-1?Q?Y9b7JlO7+XhxRThjHpIBa2fGRiFwtHT6bqO7XEa+EYZQIxP5K/duzchHlP?=
 =?iso-8859-1?Q?7pVyxnJyJtG3rGPy9yMixDeIy9aJSC2wjKNcP6KGXIxuqa3isinyeWCoGf?=
 =?iso-8859-1?Q?726sQcH5GJ1LaaVA5huRbHs+ofatKecmoRjyX0puaO/2G/o/qGDXxkaLLg?=
 =?iso-8859-1?Q?fJQHYOUtoZXp/ENiAoqOpIwIbbGWoY3NJdsj4vE5QBciZ6CU+suP1P0qj0?=
 =?iso-8859-1?Q?5tuwj35FlbeP75zgsIj/89BQQ74++yFDGUSvG7JSjF8bvjUgn6H8A18Wze?=
 =?iso-8859-1?Q?OFRoRU1ivK0+NbiUFZ9pvdoc+9SJpHkByMsbEvqJbY28ILK2glcm3yfL3y?=
 =?iso-8859-1?Q?zs9W7hfOBDl1FYirKlOhMVqDIR88ZttkYkluZq+qyfAK4xF4kaixwwpATa?=
 =?iso-8859-1?Q?1Yn+14WcORoyXfR8rev16k8ZVepmtI1IqzAZIaQ6fsiuqyPpBb4A+CGCj5?=
 =?iso-8859-1?Q?fY8PrJdmSv8yPIe3yTzoM93wcoQCDPea6QgebEUvaRGtqVAw4WpEdcMefP?=
 =?iso-8859-1?Q?YZtfFIk0H5ZJIkOsr84DjfgBQluRzqgvVvSNaAzTkGQJ7MK49cIhOCWGFC?=
 =?iso-8859-1?Q?1hZyuJMa+XTsJ8AsYyBq9AQoLrekodljCBAJmAUZAgZswx9K72pCeM9dC4?=
 =?iso-8859-1?Q?TaR1fi4upgrjKsJRN/o8o6nha7P5d7roKovx3oASzuBv0cgppH8nqH9eF9?=
 =?iso-8859-1?Q?xAStETHYxjFkOBIAkWfPWx1zWNjccXomkDoqSu4UBn/uOE/qh9+3P0h65k?=
 =?iso-8859-1?Q?P1lB0rU8K1RVF6reMSl9JEQUqJ1vAwe2bIEsYFmwWhYqg0sH2GE24tlIpA?=
 =?iso-8859-1?Q?puah//x8dOuLx9qFiIsMvs7fuPvuMkjz7/RWLKRdRD/LNsdEjysd7rkzFn?=
 =?iso-8859-1?Q?KVXDF/488nqT1HX8UVNNKN3PsWa1PqwG1JAFFtncyOppztsFbmdSXgsnKV?=
 =?iso-8859-1?Q?5SJpRnyJXoEQHlIIJiACObvbkvXfgM2wpeobbb/CPGeetxxC9AHNcNfUt3?=
 =?iso-8859-1?Q?wawRZsXace19F6SGHIGiMF+0U78RQ3+LAQV/xtDJZmdJGPOKLowh1JqfFu?=
 =?iso-8859-1?Q?YI2lTuBlkeWygeRGUR3zQ/Igcg/UO745X9Ef6MS1Glwdur3qVK1okkUbnD?=
 =?iso-8859-1?Q?8exBct5toTrak0YROwTcEdAZokLjptFITLJ8fv1rLdyST+e2+mhlD5NmFY?=
 =?iso-8859-1?Q?dIOKoeE3Fy5fEEmtixr8XWrGoG4IRmXVp+9oC0PDhRK1JUME5AiXSfSbaY?=
 =?iso-8859-1?Q?iZUvixCztIjvcn+q7fPCOZ0jnvi3bSLotUziSYmPZ0vZb5J3jsnG0fmH58?=
 =?iso-8859-1?Q?D2FzxjYjzcsfd4ZU6QD6lCpDsd0n/xPiwW1KGmNqK0SA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?USnmLs1Fl+aYwn3G0Rh5UbcaKp8O/0PbAUnhd2QmViGT7f6nVlPJ9qBSrA?=
 =?iso-8859-1?Q?JP/MXv9tK4PoTJFJQ3S3piRWKM7v8G5ssHX34twh1LqUOaGvkitBLrOYtj?=
 =?iso-8859-1?Q?SwXw79giDXB5BSffsKo8G6xfRL1OC0icLsoZDivQvF9tkuPDXQrfgqSmY1?=
 =?iso-8859-1?Q?ZrVvqI6VsqwNHjVkuveNoVQzrMMk1SUH+QGT1c+k+aw/JGzdF/tw52ArAr?=
 =?iso-8859-1?Q?oPsrF3qCJfjqlKxNkzWbCsfsd6x0wB8bUHadrOqMiZOq/XTIQjRWtaiQmv?=
 =?iso-8859-1?Q?/TI3fYLQFUhCliVduZLX3kf8R9akVHXoqgZo5SBb1SlS/H3DEsv8GJpAvA?=
 =?iso-8859-1?Q?gWbERKsskvFfSTrws5wn0jus/FyTvcAQfkt3pEbdp/0qnPY5MMZ3w/ZBLB?=
 =?iso-8859-1?Q?Tzv0mem2D/G4Y6OHNx4Chiwysv1xN7noNLWAoY4Gl9THfXYfjcHYFMNS3e?=
 =?iso-8859-1?Q?wF8KZHRY0AZvg9HModwE0LD04PuTMMVbj433l+I2SGw0ssB5YlaA5v4ccX?=
 =?iso-8859-1?Q?Ze3m9LWz5caOe0llFvGPgWakBEEOC3oLIi0Ajpw2MnXpbFI83ML4nwSSba?=
 =?iso-8859-1?Q?bKJPw2JuQWflFq63S8gxeY4zDAvEGZA1InEigMJdiVZ4nrpfKetHmqRIKd?=
 =?iso-8859-1?Q?4YAYAoJqYHQK0zjoYSLCCQSr0T/P4KslrydxuHXlJMyLbnhSgaTUiZ1+Mg?=
 =?iso-8859-1?Q?vch1B0P9xbJVNjWS75YUyPJ/BSb7MSIPcpmjOI4Odm9MxRvm5OGKVeaIeu?=
 =?iso-8859-1?Q?cl2jEU3Os7QaDi6ve6acMJYeubYSYc9/KOU9vW2qoKWWPwyA9m8B4iQ37J?=
 =?iso-8859-1?Q?Iil8uVevb4uxo8YNAoZxXOjRuAg2dRt8DM92pDXrfiy9ggL2htu5gb664O?=
 =?iso-8859-1?Q?0fPThF9cHI+c1ja9+U9FWVQdAFgHT8Kpj+b3/Zv2PG/jWAXnOLAsBxyif9?=
 =?iso-8859-1?Q?STtkDuBq9SF2xyIQbNuJGt8cF3evC3/2rGdT7JUGbvoszEVxKWjbQVWj0c?=
 =?iso-8859-1?Q?mM+vjCVJSr88r8WpGcJtKvpUXFHLWjWi4rHOR4F483OpsicJMPcBQ8yh9G?=
 =?iso-8859-1?Q?S0R6WKmABr8SG3yJJt0KOOoZ4TfQlIki5QaRRvOHazw30XHdoIV7G8hbqF?=
 =?iso-8859-1?Q?z+m3GwCmj7UZlZCgDXK1o8cbCkehONsLni9nHwX0HpBG93CMUwoPPSo6Xd?=
 =?iso-8859-1?Q?lfqEH4+3hu7Az3jjGusJyn9upK5nBDU0QN6hf4bd80COm3HHbFtV3lU+aW?=
 =?iso-8859-1?Q?YBv1lCWJ/hRG6OmqmxCvrnrC7dy/QZs7ft0by5q4nZ1rtmg+GcGU50yA7w?=
 =?iso-8859-1?Q?8bxbCvImzCqIwsWLZPPriFwqinjZvDy7WCdTKoOhAl+JiIrj87odQ0Vo0K?=
 =?iso-8859-1?Q?AO99//IDDHB1At/0seI8x+ltG6ASKgVYwB7CzFQZn878hVFC5fjkd3pSlE?=
 =?iso-8859-1?Q?cibYJDM+bWTCppsab8262vFi4f5fmQireSgXcVzZdWE0WSlqD5Mvm0jUZd?=
 =?iso-8859-1?Q?MMVjWDBWfoHHipiC/F2ZbmZ4Qla2W0GBxoJCARk0l60nz8FPEcNHROjrS0?=
 =?iso-8859-1?Q?nCisXzc/KXxsXrnSgLwtqp3M3oD0e9Zz6OpbMgW77FGcvpwy5Vy/K+Xopc?=
 =?iso-8859-1?Q?PYovUlovHobl0Mb77WWXsldg6imkCk5zOIvLRyD0raWe6qMzh+JyiRuA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ddb666-13f7-42b9-3dfd-08dd6c43c974
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 08:54:15.4538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJoxbxAee698Jhx9v6lghooKxFEug5ekiY6jnW/y5q3qaSdlONMlMg/i5HptW40S03jm3t/3SURDui9gUDC1YtzTB6+yH+zA0z4/KROgbCJ/r1q2i9m1WOyStIZfWkye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE0P281MB0035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 08:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213640

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
Great. I'm going to test that.=0A=
=0A=
Mario=

