Return-Path: <gustavo.nihei@espressif.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC920C4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:05:18 +0000 (UTC)
Received: from SEYPR02CU001.outbound.protection.outlook.com (SEYPR02CU001.outbound.protection.outlook.com [40.107.44.112])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7421.1784549111983040867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@espressifsystems.onmicrosoft.com header.s=selector1-espressifsystems-onmicrosoft-com header.b=ulkxmpOM;
 spf=pass (domain: espressif.com, ip: 40.107.44.112, mailfrom: gustavo.nihei@espressif.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHw0MD7QLJe4m1/joedXCFw8aWdkYI5E3WaAZY657Cor6xexmMQu9YEQab7kuPjrECIdWLe6kxX6BA7biBfkLkW8l5emlpl5aDm2X5UIxGW1EXNffaBzo8gT8tnMJT60HJQWIoWmGDG6Ch3gwnZJlRCHHnRMmmuldKeFn7RQxkYuyy0oMQsl8pSdcwEUO8UejjC8hXRhXbR7+Z+PShR948h36J5cQtdfVgCdFN/AMr1QWPkYt7I2xBbAU3MCTI8Cn4MEUxaJkeyylXAZiOibahDQtszCw1/UHalcZzPX1TS2YWBvzrjV2ThIdin/11cdJepuQd8nuKu9VaPLGyWC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok0iGKWEwf/E8+x/52LQDXmsKzhIkRcB8nzj3uesKAU=;
 b=luK+CeJBgye03FiooROxzfdaz36SIdIlizfLXsdPmD37i2JsTjPGgQD2P6IFISHSRSIn7rF7hnk7mTtjhY8NGVCIxmHlogvnpv9U/UpsHwDNvchEA5jGgCJz5Da+qB3vLAI+cVADXu7XOWCPJWDn6tWHpfILJwRWaNqIp65j2ubQx9/C6NR0MRF7A8qq1GMqILixTb9oKPNZsn8ratXZS6Z2lpol3EbPYMI0lyoXd6sCk6yjyrtwJATVI6NlAXMuxCx8Oas+qqYli+4JF1sjE2M1Mhd6RkGGCp3+Al7sPjz+gR1UFjHcD49hbPYJKg8mylvXmRY6L7NmU6PIhFwnmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=espressifsystems.onmicrosoft.com;
 s=selector1-espressifsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ok0iGKWEwf/E8+x/52LQDXmsKzhIkRcB8nzj3uesKAU=;
 b=ulkxmpOMSEwmLhk/hsGgxRfuJAcPcemB0tBNhAjT/sOiljuq6eQT11/NFZmzwd9d/1mOxpwE+HY2xX/3L6MHBpSo3u8p9YCwQfBLIlN5Zp9dPAnPfVV/D7kcjHPcecoa/owOojlcHJGwtNvsofOvEzIa/+sm+sIPyCRkNdDkcl0=
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by JH0PR04MB7003.apcprd04.prod.outlook.com (2603:1096:990:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 20 Jul
 2026 12:05:06 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%5]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 12:05:06 +0000
From: Gustavo Nihei <gustavo.nihei@espressif.com>
To: Paul Barker <paul@pbarker.dev>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed (c)
 ISA extension
Thread-Topic: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed (c)
 ISA extension
Thread-Index: AQHdFpLvJ+EGKHwckESr2uHH/S2327Z2Cz8AgABHI7E=
Date: Mon, 20 Jul 2026 12:05:06 +0000
Message-ID: 
 <PUZPR04MB54191B12EAA85D1C673596A6EBC32@PUZPR04MB5419.apcprd04.prod.outlook.com>
References: <cover.1784364567.git.yoann.congal@smile.fr>
	 <c643e2d8af772182167a4ee2a65d5bcdc469934f.1784364567.git.yoann.congal@smile.fr>
 <342a1c637da6f078150b43045fdd48c5ae7a7a98.camel@pbarker.dev>
In-Reply-To: <342a1c637da6f078150b43045fdd48c5ae7a7a98.camel@pbarker.dev>
Accept-Language: en-US, pt-BR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=espressif.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB5419:EE_|JH0PR04MB7003:EE_
x-ms-office365-filtering-correlation-id: cc29e1cf-7cc7-4ef5-52d1-08dee6572391
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|23010399003|4143699003|56012099006|10067099003|8096899003|18002099003|22082099003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 p3Z4LiDBmKAYpIrzDcigW0ZUfkvD1/ipZakCBCSGlLnzTYigsoMuSDgbSgdJ7gOT/M9AIaJWwdOslsQgJM9TBZ9mbcFEbH63EkeKw7EQVnx2C4cMXUmh5sNT5ZVONrtW/FgzBCsUu8Xkbi1qlvbYCskD/YWMmfjB/j2U8H3Zfwqch1v7dX6eyiF8oQeXtADN7rktrdcFTyIVUB3MNbBvNatbEqSYF9MtQDpM1dwUNu7piFWsIqpbe7DQ48Xo/u28RsUWNZgQMQfRR6dpPL+b0903qSAssE03fI980OXCkOhTvaaCIzPyXpmCJH7rUXRPMcL7CoNtGaIKSrzVzU9vi6fjbZ7/bApzhrsT38hBJVpOhScjpDl3+/U0unXpkKHX+buPZ+M/PWTXtIleyChUfso16MJI3zGHd+dNy+4Tim28WWLl4ZkEQOdsUSndHi+ljbeVLvwvIDraRtKcwPkSJtou0JHtk4WOGz44QzpxB4o7RRwX+DEDZ29Ydo7sGqxR4ZyhMgHk6+yLiTQgscf3ifPNgu7VuW90pmgezsoTH+Q2W2u8Pt1lz5xtLBrbzbRozqSYxeLZe2V94JCEVKs9+DD0poQKis9WO8inag/p4Dr06PYqjW3QYvGqrDCTXNujBGq/3xd23Im71zdQCIJf/69hGmqE3O8fkq+cziX3Lkk/DwzCbQPTgFUcQu0eNQ2S6xFtzLj+Jv1LeDf1cOAWDJEn+1dOXSaZBb8cZHpUkJg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB5419.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(4143699003)(56012099006)(10067099003)(8096899003)(18002099003)(22082099003)(13003099007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BEDC4bPGowv/2PiS8SfPYrzj2yGIRizXeC9PGCUetutKOZ5YmGPVRz5oO+yO?=
 =?us-ascii?Q?BUCYSKoIdgv7yoMBrIc5TZYWy6I2oaYJ1/9V7wi6W+kM0ldxPp0kOGaGx0hU?=
 =?us-ascii?Q?3D3sd1hsvodmRmx3ffntIiLIpgcghzITfRmHNWhn/A/aLGaL42iIieXlKAAZ?=
 =?us-ascii?Q?LAMeNkKxuXWQxlTjM0lqcgAHzhZn7GjWBXFBEtLVEgK5zl1IyKxhuCofILtu?=
 =?us-ascii?Q?ijkr02GLkB+WlxRljFXlFd6LueNmD5tywfYoKMUYC143E36sEQDG/q3UpawE?=
 =?us-ascii?Q?HryAxnaPk4nS9+iVsA54jmSgtBaQYHh8ypXIIQG3vjuFMNGeFeBtGBRj7KQb?=
 =?us-ascii?Q?NPkOCjjWtobFt4DVs78af5WIzU/Mt1CUYoU0G5obHXxtjCR/xL0cBRS1jnwG?=
 =?us-ascii?Q?bRnOQZObIqL2z3+TtvNsCPnwGqNMIy5uN7SL+rgoN3RKPwVYr7giEHTsGeQ2?=
 =?us-ascii?Q?lSsSJWh1dueWhB6bYKIP5xay4LrSO2gvStkiUoKoyxItPcjFUWqtIaZIJ9sW?=
 =?us-ascii?Q?mE680UBK74RWARNtTbS+4NiIBS03S8ZoVWHIqRlSLd+rajfxTOc4p0BbmFgU?=
 =?us-ascii?Q?BQ027eOBDyy4IjQFtKNdlyhxJewHEp6WCbvo/p0h9TSCFmUk1ApZzGfw0To2?=
 =?us-ascii?Q?c3AJfOr25a8xROeRE1pwr4GpLx9KvbuQui6KB9WtGacmowBd6e4BnsF9PkwQ?=
 =?us-ascii?Q?rQgOMOh/eyrXZaM7OIDg8MCJjTvfnhq8VlNIaPjMeg/1aSEQKpJGjonD3N0A?=
 =?us-ascii?Q?XUYO9l5udqpQiCR7cFrRsoiz3oxNsDJ7O93ir1EO9lAY0noqHZdXHnsXCQJx?=
 =?us-ascii?Q?+xuZFnLDpIYIqJUZOypc1kE5mLgSzdRCoYpNE89GNl9qNzrguIni+OCYK0K0?=
 =?us-ascii?Q?6P4l7PmJhHVDXiDq4XAqH/vrZRP0+pFCEY6RfaaEyQQUB70kPBWwk9XEtlI5?=
 =?us-ascii?Q?GIEcaHgkbcRs64DDzJrS9Oss4k1zQ0LXxMaSZ4XzEJxAj+ZDDDegCGKNrzeB?=
 =?us-ascii?Q?kdRN2w/hT9/efARXCKCjm6DD654Qn5jw/JxakIsGNvstoRZGZ+k0tLQ53OZO?=
 =?us-ascii?Q?96mMzpKx5OjOmfQPm7aBRgmOaFBtqtDCgJcn8uHmckT5n22Z8o7ZwuMJmHZm?=
 =?us-ascii?Q?IPJTFtuTzp5jNBeT8qlnPFr7YIGYHxyUjA4ER6CECew8+Qb4vIULAKshof1P?=
 =?us-ascii?Q?SDeXcKbR+0/1XkAx6rAbWP/qE0far5XYFoeb3F4iqP21MMXLaooZIoI1F1HJ?=
 =?us-ascii?Q?lQhayBp4FRBdrQYtZPSmtCZvADNjF74nUL1+UcdNQlVKwrbVd6B1FC9dBCL8?=
 =?us-ascii?Q?2vitcip5IiWo95LNSJ5BNam0+QTb4xN1jfVrr1Nnj5OcmheBTJLt+jn5R7N0?=
 =?us-ascii?Q?Rpba9PWzN4To3qpZq0bKluehHztX/bd15Wlk0zVVKF2i64cUSWH7dGFqK4qs?=
 =?us-ascii?Q?BxOhhQ4NaAIivs2I+le9ljdsmQAFUeYMMIyiYZMA7fPoHW4eXKkIyoXdKfMY?=
 =?us-ascii?Q?Fc/b0+Zi7tNtAYq3g43A82a4vIColrmLqep9m4kynXDdLlGdtglr7SW8vM9B?=
 =?us-ascii?Q?mDQsUWrrz0j/aUMIF4yTgaki2a11c3Ft0E0zMrnema4fmFEo6XMpyeEEKxq/?=
 =?us-ascii?Q?FpXdQIW5MZvaGL9tXx+Fn6rAsEMxn+GZkwUfrtFSg1yvSd90Wy0+j52myDd0?=
 =?us-ascii?Q?Ykw5FNrXaaa0fXSu1MbCBwdcbJuzvAyWRBzP47G6bhQIdGPlCeiKm+MyVEL7?=
 =?us-ascii?Q?WKWsDnUStwIZqVCxjFFfpz/T68ayHnGZKiO4B65jx1pSz6drn0ojUZCntavx?=
x-ms-exchange-antispam-messagedata-1: I9wDeuNw6drG4w==
Content-Type: multipart/alternative;
	boundary="_000_PUZPR04MB54191B12EAA85D1C673596A6EBC32PUZPR04MB5419apcp_"
MIME-Version: 1.0
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc29e1cf-7cc7-4ef5-52d1-08dee6572391
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 12:05:06.6030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yaWjAGg1mhvyru10dyy0LClNJ1By4GW/9DwvtI4H3i1Vx9D+H7YtKA7Gd1L9Z1lmNDD0v6VdMyMhK2cbk6YTexmIUZjFXz+NbDdMtf5fhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241374

--_000_PUZPR04MB54191B12EAA85D1C673596A6EBC32PUZPR04MB5419apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You're right, that was my mistake.
Should I send a v2 of this backport with the corrected "Fixes:" tag? The al=
ready-merged master commit (fef027f2350c) carries the same wrong tag.
Let me know if you'd like a follow-up fixup there too, or if it's fine to l=
eave as-is.

Best regards,
Gustavo.
________________________________
From: Paul Barker <paul@pbarker.dev>
Sent: Monday, July 20, 2026 04:48
To: yoann.congal@smile.fr <yoann.congal@smile.fr>; openembedded-core@lists.=
openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Gustavo Nihei <gustavo.nihei@espressif.com>
Subject: Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed (=
c) ISA extension

[You don't often get email from paul@pbarker.dev. Learn why this is importa=
nt at https://aka.ms/LearnAboutSenderIdentification ]

[External: This email originated outside Espressif]

--_000_PUZPR04MB54191B12EAA85D1C673596A6EBC32PUZPR04MB5419apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
You're right, that was my mistake.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Should I send a v2 of this backport with the corrected &quot;Fixes:&quot; t=
ag? The already-merged master commit (fef027f2350c) carries the same wrong =
tag.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Let me know if you'd like a follow-up fixup there too, or if it's fine to l=
eave as-is.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Best regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Gustavo.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Paul Barker &lt;paul@=
pbarker.dev&gt;<br>
<b>Sent:</b> Monday, July 20, 2026 04:48<br>
<b>To:</b> yoann.congal@smile.fr &lt;yoann.congal@smile.fr&gt;; openembedde=
d-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&=
gt;<br>
<b>Cc:</b> Gustavo Nihei &lt;gustavo.nihei@espressif.com&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compr=
essed (c) ISA extension</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from paul@pbarker.dev. =
Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
[External: This email originated outside Espressif]<br>
</div>
</span></font></div>
</body>
</html>

--_000_PUZPR04MB54191B12EAA85D1C673596A6EBC32PUZPR04MB5419apcp_--

