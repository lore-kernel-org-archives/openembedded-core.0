Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1ABE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:17:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.41])
 by mx.groups.io with SMTP id smtpd.web10.21515.1736349422457371584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hnGzIogy;
 spf=pass (domain: arm.com, ip: 40.107.20.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/hLUnidUqzyxqdsSKmjX0GmuEq3PjkzzmZNZ14yEWlmdWE8yUdJu26twTyBxJbG5rla9FaWcb+GH3clJoT4gcBnQrNZtl7VtbPY97gKpr0ISnxZkmdMRaZHQkeAKRqJd2J3hQQraj+hal5+vxGq8cYo/DmjVDUlgCfSiGSVZ0EdFwbwwT8/Mi/gxjeJw+gP/yXGkNUfHWk0ewcX55KqQNwYjCATlYDsGEVB//He64HcggZKtWFKTSNkha66dTLbltFGJ8/GhCQlnYmskuVIPupquzY3x683BPjGLt7HpYCkYDZdtsWp+RVZaZqDJmXTMAgxA0W1NmRMU274Pj4tMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74ldh+4pQqWct0SdzYDK6Dk1FLxcpYLMEzWwrkpNn9M=;
 b=xa2JjmwIbUU/xQams0l+pPQxfwLYmqysUE+OchRcs4Sisp0daGjCpzcVnHIRFpZIrASQYj7h/9OqP/mUj/h6qCyFUqHLIUwf6j683hZCmd3cS9bNmhpo77ITsKKO30aU3G7sJvTx3ylbphXBoX9NZvao6sZ29PxCylqZJ9Uk7ofPpeEuEwLSf+IA2VohTmWAgN9kaXHm9le411rT14XBypwPCG8jMlhA8lTo1/N/IZBjqFU0CTMk3ohhMwLJIHecE8Kl/ZXlS8XHxUjtxYq6PUPMzcKNq1eorZlfN/Tfh4avh/X8v5TRMQfzDaUw/orQTBmecrqADAhI8xwGs/okbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74ldh+4pQqWct0SdzYDK6Dk1FLxcpYLMEzWwrkpNn9M=;
 b=hnGzIogyO5EGEwzUJy+tJx8V3bqV2xro244qN18N/6L63tZZkKEz5ridBe597bIAJMZI2UngA0XYbWnu11wOFbL6LDIwhTwgM/tyQDTjVXbhBL+Gjw2ZGJMICtO3SqcvuG7KwqrDBPEMG+DnaHF/qWYne2JUVFh3M3BBDOr3ApE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9502.eurprd08.prod.outlook.com (2603:10a6:20b:61e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 15:16:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 15:16:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] man-db: fix do_configure "Argument list too
 long" error
Thread-Topic: [OE-core] [PATCH] man-db: fix do_configure "Argument list too
 long" error
Thread-Index: AQHbYakAn2E0m/4StUSYgvf03ouwDLMM/VkA
Date: Wed, 8 Jan 2025 15:16:58 +0000
Message-ID: <D749D0A1-5948-440E-98B4-1B7F49CFE6A2@arm.com>
References: <1811EBCBC381E647.26783@lists.openembedded.org>
 <0146cc17-13cf-4322-ae18-425b822085ae@windriver.com>
In-Reply-To: <0146cc17-13cf-4322-ae18-425b822085ae@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AS8PR08MB9502:EE_
x-ms-office365-filtering-correlation-id: a10de34b-e0b9-4fc5-3cb2-08dd2ff77edf
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?iv67IB/8I86CfVJnJbn78mF+nwPPtM6GKNCE0MIhH4bKLl+CUp36MMsd7eNy?=
 =?us-ascii?Q?XuW27vwqzfs/eYLImYla1Zkpix/r2FJ53bRUNJ8G2sr8B1rn1zXOZIBa9uaZ?=
 =?us-ascii?Q?tDoUS5wVXj5KY1EbdDcguvyQ38hHkC7AcW4HI3w9EI41wPc6ZWs5U6LqRw6O?=
 =?us-ascii?Q?U/zF9RQSD+fbKekEZkcKkK+tPxPpmf0xRcNuHzMnkNkbCdhZOn5a7p6pK7D4?=
 =?us-ascii?Q?/f4Jo3BeEQlXP4wT0FTvYjqdYeohO70TeYyj7eTecfiUkwaAHZuzk8QngRMF?=
 =?us-ascii?Q?4gSSFwRpoM93Ug1dVQruCMD/3fH/xnrB6RIT65m5baE0NBzgcSUzoHgPUV91?=
 =?us-ascii?Q?rMyLCvmVHj+5MeGS6FUcnUy5S9yuoKsYxQ6tH2aBpa2vo+KiI9/Re62gFqyp?=
 =?us-ascii?Q?EpUsoxxmd8Wwk4p/PlcNGqIjs/odQUscGx/j8evuQohxQe4u8ea6W/UPD90W?=
 =?us-ascii?Q?Y2F68dvEFKOVeNrfBn/6EydCo7D1rn97ZpcDxet0/dEMrIgqlYrAiq0BX2bm?=
 =?us-ascii?Q?fbl54IxOpxhHxH4ywXvNeVnI5/CiQm/n3Y4vhLFj8kgFwS529tguA7RULmW+?=
 =?us-ascii?Q?AwJnfyWZQNzsHbWoLifG2QUR775gHpbaeJWlAS5qMPG4NYL8KcJUhLQWLPy9?=
 =?us-ascii?Q?GseAjxailJ8SCgbjjB0VipsXUA4MgA6ZFJrHyRFVuIOpx22kaCe/ckeV8XSy?=
 =?us-ascii?Q?Gsx4Xhvd+xtvBkbxRLOEcqnu8f+xjbKviTi2YAfidovUAyBllf6z/6B5nMGk?=
 =?us-ascii?Q?xnzb+DX0zx/8JQ+irDZ+PrEN98QKmPPF1gOnrB9S8/h2JHi8v0vQQtyTA3L4?=
 =?us-ascii?Q?qkGlLPr7a7MixCe9IcEZUfBjJGimYQj9MmhrleSPH7xlHMiWuGtm+ld9gNzm?=
 =?us-ascii?Q?UNLzM3w+18uHJoJpx10V3Ucodop97luwKKkQHwSyvdfnNhOgaym0Yk1oHhKe?=
 =?us-ascii?Q?6r/YPTmeC4vZ3UVoKkSLZPn5/l8mLpEWfoSeVQa2iS+84y5NZOMIqL1Dw/Z+?=
 =?us-ascii?Q?BMXnkdc35hTTzGRfU98cgNCKXAd+I1YJYsUGLqyWc+xsw/LMU4yYRiD81d8A?=
 =?us-ascii?Q?i6NgCwVbs3yqi7DSmI/hDY9QyXtH6XFZB9NvdeGqETWM79MbhxS/R992F0oH?=
 =?us-ascii?Q?QNk/Zhbhfk6vpI2dZBxeJ+B72beqvJp4qeS85lCMQzTy5km5HcAPPa1QgCLE?=
 =?us-ascii?Q?xHfKfObOcZfpjA8Yc0hPE+libhuwhdkf8r2EVvDKmNjEL322nJzmsmLBwxVc?=
 =?us-ascii?Q?erU5yfrrsKFJ7sbVZ5LUgo8znMGyGr2ZLHTEYMF1JsYenUiIISzZ1BmrZnjt?=
 =?us-ascii?Q?CZU985qkHKdvmoiLqwUV4g6fv/BqQBJwdiixA4CHVc92S+Ay7lRBeTQhDyvF?=
 =?us-ascii?Q?gC2HxbNFZqrydH1C1yIVs+fQfi1g?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VXoFdKfsdW1PIZZi5cD6gutB0JuJgSQ9AJX7/+5TVmawuj7xtPmg+wj8rmV8?=
 =?us-ascii?Q?up8jgOhm4kJapiug63B6nxmOdi1+h4Ohwql66bocySfT/uIGhoh2OsrUV+HV?=
 =?us-ascii?Q?YId835crwHNlki05Ty6N9rnRtcQb1CoSsDYgV0JlnOJt8oYJibDIU/bAckZm?=
 =?us-ascii?Q?s8BeOiRT9biItYrviLguGSLhfW1DlvL07wNefEptSMbdvl78WtWv+Ni8UJJK?=
 =?us-ascii?Q?OgMAFwjxuesZFjCoOXNm2JxEWFl8wV7ZhlTAEO8OnEfq4BfKlSRSdDzA7tDQ?=
 =?us-ascii?Q?y506I+ELLPUTdF1RT+MYfcYbphMCTmrzP5To2u0mqJtfLF7jLpHLrkAe/50v?=
 =?us-ascii?Q?o67JH0yUswvpb3ctN4zHP/tE5nRmrBKTcG69wsEf8oyza403Q5aHIkSl3nn8?=
 =?us-ascii?Q?kykjb1tRvsMA+F5S+23ka5PwUQBxCIxizGyFrt4o4ADHDFy4ReWmUR1wZNQ5?=
 =?us-ascii?Q?eeJX2oDhwSGtSJQHlt5N0KFmmwDRidIjWTrQQGLHxXx3kmmBJDJSkZ9rCNQF?=
 =?us-ascii?Q?WkeuaTKFHhkKgTZJtjBUuV+BteZH6WdBeRXzf5Occi4xg9KCAnGDY67jpXcP?=
 =?us-ascii?Q?jLhJvRYVqraGv8hJcRcaSLMK3QQWFAP0feJp9u664JeYXWKhEDxxPQmiOpHu?=
 =?us-ascii?Q?KnslG/fNJ+WDLx6sAhCWPXVPK5tuCTUxtHjmB0fWO+KDjSWLfUln+Vtwou9i?=
 =?us-ascii?Q?+fBXyV+scnQlRZrVQpcul5mMOHi10mw5hEEDOpHIp8/l91Y2L3FHIFlroLMM?=
 =?us-ascii?Q?cI9E6QMPhN67Eu6gDPjGnNP5v5TRYrIfdd7TMXmghZP0NrE3ilke8ekS9IzG?=
 =?us-ascii?Q?k/IYtrj7rICHCE8nMNtZcyPltdIJNfMdSEpMnhytwr6Cd0zTTeSg+YUF5xEA?=
 =?us-ascii?Q?/p1r30Kh5Xkgm9g5w9HAtA44ilplRAHzhliIdDmYGYNTYP1Kv8UQ5eE9BiyC?=
 =?us-ascii?Q?VHRdstylXH0kQp/lU1ZJprTKU9giDqGfwe44POtovKW7NrIk7b7v11gEl3ZD?=
 =?us-ascii?Q?T4nqQbXdQgw4qFy4CkW7wCMaIB6dJ54/XefMa0NxLns0exWn6FBp5X7HLyEz?=
 =?us-ascii?Q?OY3sZvykq57PrcfaS9bwfL427oMiinUYnwA9gc6+dn+uzyGThp2Vdxhn2ELd?=
 =?us-ascii?Q?PhYjUPk7C2VkzPUIc5NmyiPJt7ihP+NL/QxZKonBBCYqxCV4AXlL1IacRVwk?=
 =?us-ascii?Q?/fe6CwwSjvqT0wq8gy1GfnUVSHNmwY2iZa3cWwzZRK9N9ipbOgF19h4Jfm5T?=
 =?us-ascii?Q?WwJUS0fXowaaWJQLGLmFo0aekp0oNKDBlAhSn2+1FaRRUdb62lsHARVDkHq8?=
 =?us-ascii?Q?xjkn4egWotim5eDvWA55HTXNRGXgnDgIMBE21ar9s23jrIrXK6nidA3z3U7D?=
 =?us-ascii?Q?RsoQlY/i3qZ8h0Bap+DmL8JYWPkeCFBavPNJgucpI+Sek+U6Q10z+xgc7kOT?=
 =?us-ascii?Q?3MoxwovkbPHhEK9MNhfnngfXjyR63k0ylAEMHm0HYF7Kiyh4imbrvMj929xf?=
 =?us-ascii?Q?BJeBdE4MBIZsq5QMr8Lc+sDNb79ekSHgcYavQbwaOLftwPHZW4jCO9rOK4vy?=
 =?us-ascii?Q?yRRvkr8vMs/yOnzVne1nqZmbL/8BjAXwOoLdgWSa?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A2C902B6210E1F448F16C5EA0D5F7532@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10de34b-e0b9-4fc5-3cb2-08dd2ff77edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 15:16:58.8382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7j7QyKmDz9tpmGQ/Sv3dIyQDr3CNW6UfW8Ei2oricLYlnDGlwJuubD6CCvtaEJwTYT7rFKKAKId/NFxvXtHqrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9502
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209565

I have a series in testing that removes acpaths entirely which solves this =
problem at the source instead of having to be worked around in every recipe=
.

Ross

> On 8 Jan 2025, at 08:40, Changqing Li via lists.openembedded.org <changqi=
ng.li=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> ping
> On 12/17/24 17:09, Changqing Li via lists.openembedded.org wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>=20
>> man-db uses a lot of m4 files, with acpaths set to absolute path,
>> and the TMPDIR is long/deep, for example when len(TMPDIR) =3D 350,
>> do_configure failed with "Argument list too long" error.
>>=20
>> [snip]
>> aclocal: error: cannot open xxx Argument list too long
>> autoreconf: aclocal failed with exit status: 1
>> ERROR: autoreconf execution failed.
>> [snip]
>>=20
>> Let aclocal use the relative path for the m4 file rather than the
>> absolute would fix the problem.
>>=20
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>> meta/recipes-extended/man-db/man-db_2.13.0.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipe=
s-extended/man-db/man-db_2.13.0.bb
>> index 2fa18a8f24..553b2d59d2 100644
>> --- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
>> +++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
>> @@ -22,7 +22,7 @@ USE_NLS:libc-musl =3D "no"
>> inherit gettext pkgconfig autotools systemd
>>=20
>> EXTRA_OECONF =3D "--with-pager=3Dless --with-systemdsystemunitdir=3D${sy=
stemd_system_unitdir}"
>> -EXTRA_AUTORECONF +=3D "-I ${S}/gl/m4"
>> +acpaths =3D "-I ./m4 -I ./gl/m4"
>>=20
>> PACKAGECONFIG[bzip2] =3D "--with-bzip2=3Dbzip2,ac_cv_prog_have_bzip2=3D'=
',bzip2"
>> PACKAGECONFIG[gzip] =3D "--with-gzip=3Dgzip,ac_cv_prog_have_gzip=3D'',gz=
ip"
>>=20
>>=20
>>=20
>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209522): https://lists.openembedded.org/g/openembedde=
d-core/message/209522
> Mute This Topic: https://lists.openembedded.org/mt/110160165/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


