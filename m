Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4338C87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 18:04:11 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.28])
 by mx.groups.io with SMTP id smtpd.web11.64871.1753639450900018839
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 11:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=pYlSUltD;
 spf=pass (domain: siemens.com, ip: 52.101.84.28, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoMuoFw5CQG+ygyIvLvxkqKH8FtoNnhAAHb/nJlJJabaQl5ik1mJWeRHliCAysp65/sI6xQxNqRbwFQXXb94gkVD+ldL+YW58eu0LHQqClUOEhiNpYkEk90CwTfH8NePculanTf3od9Oadt03lGet6ekTQ3Qopf1TKylOtb+bgdY7mKtvrh6ODJHHcF/VRKtlF6gzKSkOr50ajA8Kp9MTjT/fFBzIaCYn+ocOZbn7BCGGtQgxmH9A1qcP6XSgVdganedq7O6Gsc6fOoej0FMYTq1caKnTnhYi6518MfQAqJmwq3Tnyux3ISNbOOs1O6FQEXeO74YzfuLIzLcrXZBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQ8vU176H+nenezqUc89fEi1+nAk+H2eUWA7KLtkutc=;
 b=HW99kRhp3mj1obJ/8NxRfdRO0EudxVNFjopqrTVStmjH+iJ8rpZe9dNqyIe0/81Afdo87IvedXiDmC2GsvmqmMnMrCTMhwFrAlxspUwBaK8mlUqNmFeW1napiUVK8C/CH0HKLsHRaIhCPJQWF4Spz7fLNAJnHJGMelmgAKZsqZo+3NVeWR4QdUoIJx03pO5cK+Rm5wg2LVuKvMTWkI+HpvlvnwcvxWIBNIx9XbUsW9ii2BEJcrkHYxf0MfdwdHCcEO0v4g7+j6Yl5TVT7k02HtS9lTNt1tlLycxMf/5y3xhWI7y6vGeWgFsctaAFf3uNsT6RIwfDLSB0kGNSNn1vPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQ8vU176H+nenezqUc89fEi1+nAk+H2eUWA7KLtkutc=;
 b=pYlSUltD/vNYpCHgly/gMywMyDUr0nqPzB7IPUbEGXo7tBWDULNqBozFFw0hviJCcgsKwkoYEiE51CBddNzBImYVlEttPe3cEN4qGNPuR0UV5vI5hg9/xoWNWsMv+sLWTl9bH7ZMydqO4R8qm2Ts15aRqZONNgV96pRVcqZBAl7OWaKGNmJU65g/fg+qs20xC0fVNehO+frTyLij9H6npCMUtHEUUhCMgDZqPSUkOb39l9OMb75vj2zDVDZ8kyctNf62GTzG3MY6Ef7a4PhKn5d7HM3tRMIk/PrdNE9yNrLGbg0DI4rTPP3F3tPze0KnYjaB6bayqZ6U9WHKLkfWRw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by BESPR10MB9316.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Sun, 27 Jul
 2025 18:04:07 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8964.024; Sun, 27 Jul 2025
 18:04:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH 1/6] gnutls: patch CVE-2025-32989
Thread-Topic: [OE-core][kirkstone][PATCH 1/6] gnutls: patch CVE-2025-32989
Thread-Index: AQHb/yBocZffAgcjO0upPzhKNU0J3LRGQ08Q
Date: Sun, 27 Jul 2025 18:04:07 +0000
Message-ID: 
 <AS1PR10MB56977019EAA6A98B25F6F84CFD5BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250727175957.67078-1-peter.marko@siemens.com>
In-Reply-To: <20250727175957.67078-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1dc28763-3ec4-48e2-9dbe-cd1d7021072c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-27T18:03:39Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|BESPR10MB9316:EE_
x-ms-office365-filtering-correlation-id: ef20fea5-87f0-4fca-ec85-08ddcd37fae4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?hNNARRc7UMXvdUNBA5p344b5f9TKDW3Q5yeArUytGzRkT9FAgWxV0vAPS8N7?=
 =?us-ascii?Q?ECtJWyP9o2iecftnUUZJp0l3Z4X1Cq1jdSUsPvtQt33860n7VsrkNasDit5Z?=
 =?us-ascii?Q?+3cORUgF9sqIcScwdEczitEp6iizBWvBoh9EzgPA2BnlcMJF9jNL/ltrc9Pb?=
 =?us-ascii?Q?ysUwqJgqCMwcc5aEQDeFR9Kj+E5+4rtPTEeDGKtvv19z2WWw1cGAVJu2/GOW?=
 =?us-ascii?Q?B2MzIH9qqGnqCWsHpg/AWDt363ttYmE9e356awITmt5jBXb+voWYSuGxBXOy?=
 =?us-ascii?Q?bmlPgAAceLVNO1XdHro1R7YIk28wovVLpkYXRiL8TuiZ9mz+Y4SLNtUuTzXH?=
 =?us-ascii?Q?J9NtADOqAHTbNwwdlhQNvrFIMBZGWPUDFQ0ilJkdegextuknnNcqSLaCHvXy?=
 =?us-ascii?Q?qQqwPWIIujzWkcfM40R3aQ+O8lGbPqgUk1+O8KlWxXO5vlW4wyX8DlR87Z5i?=
 =?us-ascii?Q?CtCcCtEIUswOSJig+PKunEX3HiMXRRMYdeGEvsvfQnKPso/T3TC45jde8UcW?=
 =?us-ascii?Q?y2A0BLOTO2uX9fSIZOsSBUm1naHVtJoF1uF5xsLzltSIUy0EW02ikz5PN45E?=
 =?us-ascii?Q?tO4OvNFFsQ45p0LISHeJE3W1B5Wc3fcz+2Shprua0yHTczc1Fd70wG/ADyL6?=
 =?us-ascii?Q?LE/se7Wjnzk10QWbd49a16T67c07DUo68HzMTz4rXSw9KgO1+RH48Ma91GDK?=
 =?us-ascii?Q?dLTTQSLNwV0couQnw3IuUe7KmLzgvli5kIMVXq2DNBVBXv2CTof8ehwhVMmH?=
 =?us-ascii?Q?ZoNLGeIHe+T3/ROWa75SGR59V4QGN/p77kSccTEdXb8BuX57hJrLUAS57gX7?=
 =?us-ascii?Q?Qr5c3Qsrz2q6FJc9iMKA+oDYkiJ97jFY5AF5YY/D5+Sivq1lRSyezjvVfGfu?=
 =?us-ascii?Q?c10rzDboYI2o5Me/yurj0iC0n9BwdzpYETcLNx10r06/o704El0hxlnQF9O7?=
 =?us-ascii?Q?yGAwcADBB9rCMJm3hfIc8QyaOH0AU0iVhKotWp1klGZz1ReePwtgQ9QSVMvE?=
 =?us-ascii?Q?5xFDrsvE473luUcO8Lj7NDeVcQhG8ksRmkiM0343xntYvyE5tN3vN4gxaToN?=
 =?us-ascii?Q?aeTCyNthxCWRG/1Dt824BV7QpiKXqXUHWWTL8Pc/s6++F0QhwqqQPaOf18GV?=
 =?us-ascii?Q?I7xFLxdFWb4YAo0yyPELSLQyLTfm4qX3kbmtK8IDneWXRXE4c1ELBDPlb9Jp?=
 =?us-ascii?Q?ZrxIiBaln3FZ9pKDXvzlcUNxIJjAdyxA7AiXb0PKpX/bwv+7vV7+TVdjqHSC?=
 =?us-ascii?Q?Hies1y7VJBcTyn8nmd6fboPRZvcu/+Nw71NfwmJ62deAxsXVCIyh0w2Fwsvm?=
 =?us-ascii?Q?JolzXm2jvLPKCFlI/UIexoUFLawV6P7o4bvj+ABa0v/2UzhW7Sk231DdQhHO?=
 =?us-ascii?Q?jt7bb5ms+zwIGo3igG4CKmpaYvo1XOcsunOu1g6XWlGbKc9zYlaPwwWWDUkJ?=
 =?us-ascii?Q?MVSZEYaS7XE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OI2DVw8HkNJgFiKasHvGpUEufSSlNL0xSdWIzWrLrBwlq4iwwpt5mGQxWMnN?=
 =?us-ascii?Q?sWvXYqqO34d7v2ucU10l+5q51JrB8lpGpqBTDtf11M07wjQhw7G5mj9FEO4p?=
 =?us-ascii?Q?Oktci3VI5VEUR2smb85qDnUOLUp7tOA5+dn8H1sxZNSyce9OQV62eRoSzECW?=
 =?us-ascii?Q?eSgS4C/4nrhX3vUsOUahSsuMlKctJ420xs09hzb+riSZwxxnqGzv5ePePjtP?=
 =?us-ascii?Q?bx1XFrcm4I1Oe7R1cCmOEVogOT0zAsqYyF/5cWJVPgwK0V4ou66peQZKScO/?=
 =?us-ascii?Q?r6lNdZ+/sO4FSmYWOzT/S07O7/G3ZPqcaaLtU/mf+91hUPF34tSPs6v5D/A9?=
 =?us-ascii?Q?tiRSXJt/yjNISyDU1zoiGKMAgDnb0UVw9D4t93/7sTWM6f7BLHxktZ40Aj8Q?=
 =?us-ascii?Q?I15NShsFjSzqKej4XzoUy/HPgy/634d/D+62jxBMjhXC4R3CWOzG4oAt+tjL?=
 =?us-ascii?Q?Y/MXa5u6l9qNk/xVHlIsP4cdsxBCbL3MUtpmPhPritzbLvHgzEtda4vzirim?=
 =?us-ascii?Q?6gjkNXCSbBlZa3dY1kCWeIa2hnRDB1K374dYNrBc9J566xhA0p51HYJ2ERWD?=
 =?us-ascii?Q?oInhoHNBPRU9MyZQ0bZt0HHz5E3aje5Etp0w27uqsgqEmNavZez106qM27r+?=
 =?us-ascii?Q?Y4EfF6VOMPAuGqmpw3McZI3ZJjVyk/B8yJz89gxh3CRzsi/AUbDEROA/GH53?=
 =?us-ascii?Q?2VoaYomjs29pgl866LJ7y4bAa/vEQdlnvB5m+euQE9BESNypajRj2do2+Mnm?=
 =?us-ascii?Q?YI0CL2xOr34PVwCtKzwZ+SwiNu0oyjOS16Yvt9TuZnBZiZDTy5PJ7n7pH6q0?=
 =?us-ascii?Q?pLU1p93cwFVppi07bKU7ZTFvLGdhKOE3VoWATQYF5aYXErltBz4gpoQOE67C?=
 =?us-ascii?Q?2OWtwXJKOSFUbLnpkGGKHskKgqWZiR5oPFq1vI4irP5GDjK/jt+mndIl4c0f?=
 =?us-ascii?Q?bRfbD8qQgKun8qUMEUwdChl1SOMEdtsso+tvv5UjvH8JTuCgDbLRE0+cNyTQ?=
 =?us-ascii?Q?nyUeSpstdhMbATCqrY87jb2lldGLf2O1QU/HMv0c3dnsWkewAqT/OF38Ib35?=
 =?us-ascii?Q?y+7OeYhXO2tz18Vc8FNKK2BEx95Ykqpt18sRZOfvLUAJ7b7Fr8P2J9PTPcPv?=
 =?us-ascii?Q?pBwlOWpsQlUMqdUJxt+iTl0KOXZcvq9a2zKIfjJnV3UDRj+F4MXB1eUMy+Q+?=
 =?us-ascii?Q?bbzkiJ5xYD9vv1/RVF4emcARznxiEt9AakU4NjbOq0lmZScacNp3wdUAQwjf?=
 =?us-ascii?Q?YSegRLRn0bkjWwchDUimzeJERmg/IGdgdZTyKXxAp3BzRzslGS0gdD81WL9c?=
 =?us-ascii?Q?ryU24eBuQC/n7onMV5xqzVOYrNev5rOv+XKXbbasaL/ZgnSyecUOCyV6wYSN?=
 =?us-ascii?Q?ylvkfB6gNS5DeDASYONNytSqOvm+Pe1WXf52pduhMDqDRqbALsnszpCV7GS1?=
 =?us-ascii?Q?kElsr0hYYkxSV2MGGzONEdSl7TtlGEjeBV2wzlp5S17KcWEtz36HIgppNUmM?=
 =?us-ascii?Q?tk8Q5/pCDwW8wpblrsJ8H00LDIBgWGRMPWhQH3A6SMyJn0okPaP7vFvdxRU2?=
 =?us-ascii?Q?f6tGLbJi7i/uDXp8Lci6/6P5/c8aVXCGMDg2jwVt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef20fea5-87f0-4fca-ec85-08ddcd37fae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2025 18:04:07.2650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ipswjeJDQKiC+O12/0ljzFXrUmEBgRB+uEnNzUQF3dyCLkH0NHSCHRXrwRQIj5MDRm3z+eMoZK/5vBZ2dwdhTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB9316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 18:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220970

Simiar to sacarthagap, binary patches can be taken from
https://github.com/petermarko/poky/commits/fix/gnutls-3-8-10-cves-kirkstone

Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Sunday, July 27, 2025 20:00
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][kirkstone][PATCH 1/6] gnutls: patch CVE-2025-32989
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick relevant commit from 3.8.10 release MR [1].
>=20
> Binary test file was added as separate file as binary diffs are not
> supported.
>=20
> [1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../04939b75417cc95b7372c6f208c4bda4579bdc34  | Bin 0 -> 1782 bytes
>  .../gnutls/gnutls/CVE-2025-32989.patch        |  50 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   6 +++
>  3 files changed, 56 insertions(+)
>  create mode 100644 meta/recipes-
> support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32989.pat=
ch
>=20
> diff --git a/meta/recipes-
> support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
> b/meta/recipes-
> support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
> new file mode 100644
> index
> 0000000000000000000000000000000000000000..ffcfe23e99d4b353f07192729a86ff
> b5a249bbde
> GIT binary patch
> literal 1782
> zcmZuxX;c$e6rPz(Mj*t1i7X-}tO`naVX?-wfC|xQltmHTVh9i+5R(WIl_e^&NWep}
> zD54ZCAQh_~g}4Maq$t4!MNo08fC~uXmV&6A<Wx$}>HL^^_r34k?|$FhbAb|j2b9DI
> zB?JUU5VJW;c%PqjT-
> %jX(0{fg$Ep*MF=3DN;CfOH)hhDk&SB(q4s7$bzB7!?T#V%Y*4
> zePBYR1#J@Z<K#jC!!KSciI?)_qWCx#9oXuRNmPsB<6!AVnVhj$C{K)+#<1Lhn;t-*
> zIu8T<V)-%|!;=3Dvt6l|0V@sBh?C}sHhFx(jaUSNVHnKc!#Jf;D|6NZOu;Nby0JiXc8
> z>@bj)F`_`f#ViUg04Fdq#X8hkU8iflZ;Tq=3Dm;zi45=3D<Ss(vEbM{*J#Vb*QU4i!?4>
> zSp_doZ|~Zl`D$-o=3DZ>SDxoXyEU}{igO5_B;+E&4`29^c^re=3DaTp<*I4P9Db;#EY4N
> zIG}{>N4f_SA%YU7K=3D{51qJ&}S_|}R9@ALjfQ_aJjD!ASaJq47MVA7>q1ABO8^fa&
> V
> zeQGMfRGo1sU2>#aEw?mw*}!>YpKT-Z?_OFeCJw6Y-
> )iiKNYC3U8REMB$Zby^=3D7i2z
> zbU=3DG?14n1q^uw*5DW@XcqW8C~UUjUtUal-HxXRvrV(j+&_5OEvI*=3DC-
> O%$0JD<S1p
> z5O4Ms)#Hd4!WE0wU5dTWwltd7=3D;|ijov-6Alc{|2<4>Po>=3DvsKWql}}ey_rdTjt|P
> zgR71cLntkI9ffwOse6rot}gGA2ut7B35r$(>OuyO#31<(95f5Q_U1hbld76$J*4z2
> zetPzz_;t~9ZW*lDVgHsux`Gg32tK4FtN}_wxS@}1%~2W{qcm74A8Dn&<7}xY0w6
> G2
> zzofwMHxwlx#1g>Q#|$(Kgo0%l7L{g-cQN1s2h3<P1`~;+5ZJ;pS}vE!rn|dGFlC#>
> zf_3^I<SvlNfYUGt0oJDf3zJItV6vWqjyeK+z$lqeGCqBrJ|Uh@CL56u4+PR!L&MuT
> zp%#GlJvjj$ULk<4&*gwx0gF`Hnzc9ic_B}>`_Z!2x}N-)^uf=3Dn4=3Dn!<hGBFe;NTbj
> z5dz?J>VJ77^g@91FaQ}@*o<MNhQj1{+kL`Ja8FS9-
> X;V^P$k@jDxp8&r%(d)sM~gO
> z5}8-V$WE(Di<TraRmE`2%8Z;@=3D5<ZgJ+)d0f&<fgsv95(B|!dQ9>NGDC?;f*iZ-D6
> zwYoQ!iYuD1X%hE8KHM9hKX1HmnPx0v2erA1YPPg^%EN;>A=3D=3D2JH55Dg<An6
> M%-f>%
> zD#W#Z2<JU~#yIbkRVZ!eIcljkN@6n8yAU0)d7^%v*fctW+-
> ?TB7<ga(%NtO`ZSNWQ
> z+H%=3D<&P3N`KYr`p>l?+4ddeAyO<C}0IW`ODJ*>WKk#SMfs3a!_7-
> <p+H=3DP^CEUqej
> z^4!TUDIZfdLWxlHr^3JJ5z5->yL!(|vgHnKSh^}I|L)w|CQ(Pv@pzx>zJ1g4)?g3<
> z0&vCiAv;LBertJa8J950qS9wkd9=3D$#dgM4v(3dbKO0+~{!<&Z_pIhFOf{3~N%Jw(j
> zWO8`qPTt_*L-
> W)`x2v=3DpB2gd%+6eV7)YNRevG(jUUlIMcX9pq=3DQIgjjm$q$#>NaO4
> zReZUwGZ?ML4cF6xxd?-|g}iiSneM{ZlElIcQSg+TtxLU}4w^e+ooB^8x!7lf;qkKi
> z?D6Kem$HkEm*=3DtuTiTr8iF=3DJ^WO5XPMY`?-
> Q%4RVe1zje2!^a2K*3CApS9nM?QU&-
> z@R{84+CfF(vCr&nJA}=3DTrxkx1;~Y`-`b)}^eP7vkA74779r_r4bp7f<r@#VN-uxR?
> z``QM#Q2V0alO6=3DLo{0ao=3D6(|Ml<|cN2c}H!sTXi6*s8{&HHl506kq1$WlaaI+1Aja
> z=3D9r7gclJ+xOKA{Wy`=3D26(P>VVJ2qeYLZ6emDr;4J&OX-3U#ti2+}|9^ygF-6TG=3DbH
> zb|$}L(|J`uP<Pi(c6QqZX{Bm?<80BR&{|zivB=3DKH<9Zya*KL0DmUC);wmEIbO<ng%
> sRX@4icF)r*F}&W({g%z$6wZ*`OQvm|@J`UT#3Q7#!ShY-jG5+t1Dd6#hX4Qo
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
> new file mode 100644
> index 0000000000..c21fc6e969
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
> @@ -0,0 +1,50 @@
> +From 8e5ca951257202089246fa37e93a99d210ee5ca2 Mon Sep 17 00:00:00 2001
> +From: Andrew Hamilton <adhamilt@gmail.com>
> +Date: Mon, 7 Jul 2025 10:23:59 +0900
> +Subject: [PATCH] x509: fix read buffer overrun in SCT timestamps
> +
> +Prevent reading beyond heap buffer in call to _gnutls_parse_ct_sct
> +when processing x509 Signed Certificate Timestamps with certain
> +malformed data. Spotted by oss-fuzz at:
> +https://issues.oss-fuzz.com/issues/42530513
> +
> +Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> +
> +CVE: CVE-2025-32989
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-
> /commit/8e5ca951257202089246fa37e93a99d210ee5ca2]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + NEWS                                             |   5 +++++
> + lib/x509/x509_ext.c                              |   2 +-
> + 2 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/NEWS b/NEWS
> +index 85efb5680..025e05148 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -5,6 +5,11 @@ Copyright (C) 2000-2016 Free Software Foundation, Inc.
> + Copyright (C) 2013-2019 Nikos Mavrogiannopoulos
> + See the end for copying conditions.
> +
> ++** libgnutls: Fix heap read buffer overrun in parsing X.509 SCTS timest=
amps
> ++   Spotted by oss-fuzz and reported by OpenAI Security Research Team,
> ++   and fix developed by Andrew Hamilton. [GNUTLS-SA-2025-07-07-1,
> ++   CVSS: medium] [CVE-2025-32989]
> ++
> + * Version 3.7.4 (released 2022-03-17)
> +
> + ** libgnutls: Fixed double free during verification of pkcs7 signatures=
.
> +diff --git a/lib/x509/x509_ext.c b/lib/x509/x509_ext.c
> +index 064ca8357..05336a0c2 100644
> +--- a/lib/x509/x509_ext.c
> ++++ b/lib/x509/x509_ext.c
> +@@ -3855,7 +3855,7 @@ int gnutls_x509_ext_ct_import_scts(const
> gnutls_datum_t *ext, gnutls_x509_ct_sct
> + 	}
> +
> + 	length =3D _gnutls_read_uint16(scts_content.data);
> +-	if (length < 4) {
> ++	if (length < 4 || length > scts_content.size) {
> + 		gnutls_free(scts_content.data);
> + 		return GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE;
> + 	}
> diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-
> support/gnutls/gnutls_3.7.4.bb
> index 5cd85c5996..48ddb269de 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> @@ -29,6 +29,8 @@ SRC_URI =3D
> "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>             file://CVE-2024-28834.patch \
>             file://CVE-2024-28835.patch \
>             file://CVE-2024-12243.patch \
> +           file://CVE-2025-32989.patch \
> +           file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
>             "
>=20
>  SRC_URI[sha256sum] =3D
> "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
> @@ -65,6 +67,10 @@ do_configure:prepend() {
>  	for dir in . lib; do
>  		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
>  	done
> +
> +    # binary files cannot be delivered as diff
> +    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
> +    cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34
> ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
>  }
>=20
>  PACKAGES =3D+ "${PN}-openssl ${PN}-xx"

