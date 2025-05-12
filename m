Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891A6C3ABBC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 10:33:44 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.65])
 by mx.groups.io with SMTP id smtpd.web10.47094.1747046020742045094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 03:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=V3M5DxFu;
 spf=pass (domain: axis.com, ip: 40.107.249.65, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEprGlg+BHHaqDc0XIhxK8L5rJW7n/yYmQQ74LZp0LCpTN8Gy6vZXls8Fwt3l79K52CT67dHeKCJH20odCS0erBk2xaQjwVvEfnOY4LTi+7dhioIocOUlSIaS9r1Ta9GV70Kr7I6yJ9Dl0Y84eJkvnHtROyZNTm4jT/ZB6j+yagyh2wbkXcXbG4Iqb/nM91EyGsWtR7dV/RPLVwgI7hlV82GxuuJEqZ5kmyZrv4onLqDyBvhv/js0wsCH3dbreNJdfjU957app318VpgXKgKQbTvNBlqgmcw2EZCREv/DYIcI/jLhcF051zju8V92/J8XuabFPx2/KFiUme+lxUNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=450XTFlXhrQpw4Dqx15rKbfy/qKm/r946f4jIlzpz+U=;
 b=plaFdjC2820k950D5gYn0Yp4iej761R7GlQ1N1Qyx3N7Mi/YZ9w0QSNqpVmtEQlY1YwQVW3RQlAcqZGb3o2+M09C8DSzFdUtLDbeyYUbvSyO8vM4fZ8vfKhBWeNv+Pcg2Br20P28rlkyaTFcnOk9qzbc8HnhmiOGE39I8SzEI0ovRifZ02X0hapYe2JeQAWdDqB7Z1Lmf91xDB5sRjRY+WVgTTfsr2QXCf3LofSRT+ueojokjLtDI9j7dsyA+mBFVl3hlFM4w1cugzTbbyMs12mghgp7AxKFed1BqQAFciOKc8niv1v1NMq2D4R8jolCKVFVN/BurKbnjC+gqImHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=450XTFlXhrQpw4Dqx15rKbfy/qKm/r946f4jIlzpz+U=;
 b=V3M5DxFukqEgrEvtnUUlSuS0QdvqPBJhVVVSkRFSolPx0znKMskaGlD2XhyJq/tANVchW38UmduNV1dH2GkfyXVjrypW30dBExICt0VejqbYObKI+8bzgd3frPNMwhHLJV+gIQLY7v5fhQDldhoCPYn0eJ1P5Gi3yjEYIq0hiPc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PR3PR02MB6473.eurprd02.prod.outlook.com (2603:10a6:102:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 10:33:37 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8722.024; Mon, 12 May 2025
 10:33:37 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] bitbake.conf/pseudo: Switch from exclusion list
 to inclusion list
Thread-Topic: [OE-core] [PATCH] bitbake.conf/pseudo: Switch from exclusion
 list to inclusion list
Thread-Index: AQHbwcPWVWrg1rZuoUaxwsBuJQ4WobPOzLPg
Date: Mon, 12 May 2025 10:33:37 +0000
Message-ID: 
 <DB5PR02MB1021362C027AA5085B114E4F9EF97A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250510155421.872076-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250510155421.872076-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PR3PR02MB6473:EE_
x-ms-office365-filtering-correlation-id: 856bc40a-e5a1-45be-90ce-08dd91407474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?55Ss2MVYxSGARsZxrzjphA6VrB2fmzCV0CAzcqpK9mrYl/s4G3ZvCcZ8BeCi?=
 =?us-ascii?Q?q603O2Hv2EfP/H6G8hbFtW4zdkjVnPQF90P8kESe+8U/20MkVwmUYOzgXV0M?=
 =?us-ascii?Q?FTR+jcpZnW17iXe80qcrlJwBcOTqvSiUgX02ageRvjlHdD0iB+9xTR5mvIg1?=
 =?us-ascii?Q?mY/A3jgSIqs9bT16HPy7hbHETPgbLHNivW2om0aa7n7agGy5aeVdPKrYSNut?=
 =?us-ascii?Q?Rq9UJ/OYK/ZxZ/GuKvp/MiIF1fSzHHSjSFfyhx1LBQOQH1OyLGCM5Rha1yKf?=
 =?us-ascii?Q?0JMNjAR9rTA4dMJoTDvSKTtUhT+ZVCYm40ilNoyE+FrAiCkZLeo0fjkpi0i8?=
 =?us-ascii?Q?mLcTvlLpkqr9PzVuFpNXCTSgpA3NXiuWvYKkX1AEq/Y461OC2m8srOlL9qVb?=
 =?us-ascii?Q?1pAgaBxhfKGMsumVHpShoFa3wx58Pwg8K0rV9czfzmIWRTZtncabqeV5F9zO?=
 =?us-ascii?Q?Wzjpv0cshX5aRoHwhg1OPCJRX2oyXdR3+zMLiGf1sHpujjVD1bvoVpPXRimO?=
 =?us-ascii?Q?D4ZTRTd6NTIRWuZH6+uvP+tc/I4Mv96KohdREYfqKGqcdV/HiHrZ2bBwQnDI?=
 =?us-ascii?Q?fyMC8AFSD1x3zcwNvLJEl4Q+g5YEWnrbR+0LfAx4l2c88OAiDihN+1g/cUcI?=
 =?us-ascii?Q?sdJkpHcsifVSM3Lhww6sWISLBXUEBXVhIr0mOenmA/dbp4b7KLyWzgSqwC85?=
 =?us-ascii?Q?B/9gSPvdINp7SoOobex1WuPvRU96ED7atZuQncsbYlgrK1SdHXw19FWlQV5U?=
 =?us-ascii?Q?TZkhncTvfZKDCj9TzMHBhynYpLGSLfdgtiEctRczTiamI0BXIkTtk7xR+v2H?=
 =?us-ascii?Q?2CkJrgGt8Ag72jRJEDGPLHXfG0xYnnXMNOuHksJaCiGS6Mma1ricRnx2E9q/?=
 =?us-ascii?Q?4VJ3fTQGnC7CSCV9ETwYuItDIuQ9N12IuvGDl0t1WjfqXjqlVeaVw0HvBzGp?=
 =?us-ascii?Q?X9hamoUbRiNoXidaq9g4sZmFFe1WgzHrSgNabQK3x5+uBeSH1k8iyI0dH63N?=
 =?us-ascii?Q?6WHNrum2u+ojmoE9u1yPY2HrSMS3duEShM0AGlEBoV3/QiXep/ZHGc9L9z5b?=
 =?us-ascii?Q?pt3f4ZMxw7M8ppBjqNv3fbSykcuJNfuKPGtNbONoDwr0b6oV4ZUCdl2jofpT?=
 =?us-ascii?Q?MOBFnaew6ZsZT3zY+4/NXEUTIhR+LPWzGHdI4g661WuHDGLEDMGpBs5UIUWC?=
 =?us-ascii?Q?1v8kTHYdqQFHJtWxE/f4abixKAn8ofKjw0wUkg8iOqzkfmcyYV9NS081psqx?=
 =?us-ascii?Q?rOq2Rj5zvo3MjWDvcpoMOfKArMYoXxfEByHhgPZ2Ce6cZP8kpdWfDhtBVRz2?=
 =?us-ascii?Q?PapC5IZdtm8yI+UDooZ1IC1WtVegPal//lbgbp0x4yBS5ScA2X9a8zGIl85r?=
 =?us-ascii?Q?obBp3kenJGAjXYtrfwZNq7Yx70QU2UF47udiSj86J52kcC3HA9eaS2XP34B0?=
 =?us-ascii?Q?x0vAOBN+Gl4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wDFVCFnPrtvtPthkVGvaPoOie55ZJXgg2/Bo2vQPvkbvmaTh9ozG+fs0n5nF?=
 =?us-ascii?Q?8o6HRUkIeDE4tSKx9K4/WL12XHAmVLGic9dvkH4930Uyr9Ft5MpqYJiLlczF?=
 =?us-ascii?Q?KIWnpvGwmvXPxbA62OvzchSP1ZvmMv9kMvb9dJATUydspo6GN4srxfChCgm4?=
 =?us-ascii?Q?PpyjNACqynMbVmdE78FhIxz/CxusDGUnih6KAOlymz1Je5j0EHX0UKQYF6M2?=
 =?us-ascii?Q?qcuQAlI/BpsiVP+0q8CefdlqoBROqsso7eLiGr6oGGIlFjsbaa3kD2usMnoW?=
 =?us-ascii?Q?iNBtWRkuW50ZMWcFlNscFLpORPPe9zkkNyzERmuB58ptDkjya5z8TZU1RZRj?=
 =?us-ascii?Q?VNIL/DqIshbUMA9Qm9wQUuOxdQDVmP/tYye1MqvawMO6hFujiAu7cNUPI3BA?=
 =?us-ascii?Q?36cjK5kN7P1PipV62uZeMLi08VyQiFTLokyE8Q3idtHe3eNwQ2PLtMgaolo4?=
 =?us-ascii?Q?4Pt55H2mbGcA//5o0JpEWznUcozkEtg9zF8uScvoguXg9R20NlC8Wwff9hrt?=
 =?us-ascii?Q?NHV/dlvvL/oxaZvL9asFPEnwQOZH482WJ8B2dqw2X8xiNMBm6HmIIQeC/3F4?=
 =?us-ascii?Q?4NLWV+6NQlK4UyVm/VFvsmhsIMmW+E4zNKm3V1N65tcFrcdfQwD5ngsqX4Kk?=
 =?us-ascii?Q?5usuRq3YFxk4bP//bsml1u9S9sL4D6IjZHX5ONrJHzQppyKaYh1EUgnqPGIL?=
 =?us-ascii?Q?52p74Z3v7eOqNh/xmzUH+972wzZZks45GI0e1GHLGnIcsGtHWme8950wEI/H?=
 =?us-ascii?Q?AR4ymhURbWaGy3koU7hxDvJa+uo0PfMnJsQ25to7YkSsUfxcxaZ49h4sy4LW?=
 =?us-ascii?Q?LSg6TkzDbEph+wPQHoXcdosmxvA94Lge1IDBv9GnmMS9zUdcr8nyj18fahnK?=
 =?us-ascii?Q?LapOF7qfP7Ka7Uo36QQytVpnm0UTXuUUtHeXFOLjFCClx90KmfygbZ7c976L?=
 =?us-ascii?Q?NyGauyHSyK/BiJ0Bh0ZGKIXX7OYSqoCQkVq56FNqfuayB6TXN8uMNlEf6U3j?=
 =?us-ascii?Q?uI7tC1FfLw7G+OMdRGwnW7jFgi/8N1/zRTh0iTui2iPFGps4PIHXwQCF0oAp?=
 =?us-ascii?Q?8esQ5mYsgFy9sK4X50uXR177vip0oVFTgn5rYyh073ihxIGAuIFKKDDlLChS?=
 =?us-ascii?Q?81KwXgFEBiMpkcu90ED1kaRW4kQzdaOvGbZwbO+cmzlPLxq+Tq3oyRDc2WQh?=
 =?us-ascii?Q?7z01mWFuRpdmHdujY65QDSgBjt/N3xx5MdqA6GV8XjLFHisXTeXSH2mv0O0M?=
 =?us-ascii?Q?dvYCQ5M/x6FgPVyEwLMC/WqGLda6fDOxyfWV96nLYaHt59Tecxr7Kwe+9Zcj?=
 =?us-ascii?Q?ISp4Nr62zsRSwHk1jvv14Aa5Bcvh0I3C3bp/gDfVGfxZdWbeQwT2+USYX8FF?=
 =?us-ascii?Q?lXpF6grzNk0E4VAmTVTup8c0nN8Q9Yvu7PMycEn6L+pafVDQdn3BQF3cKnx8?=
 =?us-ascii?Q?lULVa9YcERKWvvou8PKVaHRknNGAQgZuqjwI21qb0FAOwehZ2SrotMLBfiXV?=
 =?us-ascii?Q?GqOzfkPdkuuy311OhrlfCEdMb3mlI0LQLuhNBCLBnWEdVsy6tJOMlPLTpEsm?=
 =?us-ascii?Q?UP0IZBHoUu9JAlviNno=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856bc40a-e5a1-45be-90ce-08dd91407474
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 10:33:37.4046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hdI7Ee5AqV/+oSEWyadc+n1qbPw2a99Ff4TVfb0Bj/feUouY3LBZiPL236Uer7i9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 10:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216361

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie via lists.openembedded.org
> Sent: den 10 maj 2025 17:54
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] bitbake.conf/pseudo: Switch from exclusion lis=
t to inclusion list
>=20
> Currently, pseudo tracks all files referenced within it's presence unless

it's -> its

> they're listed in an exclusion list. The exclusion list has grown to be
> fairly unwieldy.
>=20
> This patch swaps PSEUDO_IGNORE_PATHS for PSEUDO_INCLUDE_PATHS which in
> theory should be easier and more explicit to maintain.
>=20
> This change does drop many directories from pseudo coverage including
> /home and /tmp. There may be adapatations needed for recipes/classes
> using pseudo in specific ways.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

//Peter


