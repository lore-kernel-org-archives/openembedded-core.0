Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E620CC83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 15:47:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.25])
 by mx.groups.io with SMTP id smtpd.web11.17234.1752248826756019861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 08:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=N2qZPmzB;
 spf=pass (domain: de.bosch.com, ip: 52.101.66.25, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SURiJxJFmbW340En33MofcB7SGhDzbdvdRGo1HRIBsI00e/2pklkVt1gqHqeri7lbxp9yDzPuAPzKQtZfjPbjfVpO06njw3CrRINsERJMlEiXfIhNGhb3nDZNVmeCvGXz9qJKqi/ejf4AlOsOGYxK8VgJIC1g0n9LzNZvwab8gC1mSe3nIWZ8WOgnOyeQghjfYISrTMEGtKYzOsDGBmk+qWPNOrCqy3lVVQmJ2lUtHdhUItMuUW/qyU821DarcJTjoTauor0xrYAllzPSey4E+fduoFDawHQZITsgOowSbN9oYCKKUEymuSLXOQYYbFho9SO0tNzJvhCawWGoK3Zsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP6tlHlXbrwG2wLqI1SQTEFEBCMYM0wgWXI2pd2ukIU=;
 b=dFoGWAggbH4GxXUp5p5QEkVr1YgTZGWS05RQhHxwEDxKW1QWP+f8vBq1PgtJ1lo/Tkgi4C9Yb7e8vQ1+tGj9AfkEmDDhk2LCcxEpe1pOCPOMdrqJ58UC3oFKiAlqFRzVgzyyFqlgjfOXm2gnHlsq5hTEWbH3zmqVDGLPEmCQYLSLpxiHqnUKSTaai+iH/rnHhvnF+22kMPZl/c5JFye+oyQC8khMzT0KkSp2+PJ0X49ZS4qi5hapmHJU70j+m0+yQRyBPOwr9Vomd39VN4FWY57nseJUfjZy0vlk5yLmFNCeHocZ6lYjcNgqrqYlsxLZX+P7gUJ0Uj6Z5/nOEjiMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP6tlHlXbrwG2wLqI1SQTEFEBCMYM0wgWXI2pd2ukIU=;
 b=N2qZPmzBS8Qqv9/06X6tEZPX65Sa1iXHWJoAyzXYXM7VSNisw8PFJe9yaF5K4yK9dgZXaw09hVh1BwEwNn5F5jhYL3oVT+d9msFIY3vNJCRdLn2EBtbB5l/R0hXVHwJ8h3+ZKEH3YYspVDhE5yEIi4nccCnejKnMgsUtwfNc/pa9R4UBTORoisjEM/YR+J0VFp23YDnRWuks8LLx1fdV1hYPxi5hJOqZoBcC37i1YewiGVP5LX9LRitOXfpRYGbYy9qbV8bzrOuCLdDZXHTEJotpmksZFPfwZvLQuCFpXuAh+oo7/K93v1DuzYgQQuwbIh5wjIh/cF4xgJtQhUNy7Q==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by VI1PR10MB3150.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 15:47:02 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036%6]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 15:47:02 +0000
From: "Jonas Mark (BT-FS/ENG1-Mue)" <mark.jonas@de.bosch.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jpewhacker@gmail.com" <jpewhacker@gmail.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "Simoes Ricardo (BT-FS/ENG1.1-2)"
	<Ricardo.Simoes@pt.bosch.com>
Subject: AW: [OE-core] [PATCH] dosfstools: Add ptests
Thread-Topic: [OE-core] [PATCH] dosfstools: Add ptests
Thread-Index: AQHb8aXg8lI9qNHrwUSBBhBtRbPmu7QsyPQAgABI+BA=
Date: Fri, 11 Jul 2025 15:47:02 +0000
Message-ID: 
 <DU0PR10MB7076B6798A364FCCF458462BAD4BA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: <20250710142015.174053-1-mark.jonas@de.bosch.com>
 <DB96QW0DBI2N.11E6ASE04WBX6@bootlin.com>
In-Reply-To: <DB96QW0DBI2N.11E6ASE04WBX6@bootlin.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|VI1PR10MB3150:EE_
x-ms-office365-filtering-correlation-id: c9981621-064a-462b-4dc8-08ddc0922e07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?jazJmbHtKmy9kOnmcUC9DCfPjJlodiT5ALQ9NRaQ63RJYLcMtk3FSdINAN?=
 =?iso-8859-1?Q?p1vbZkhHnK1kMsW1/oYcyoJNedFt2pvdRn4YNV3T+HgtNTVYhhmSivCGzW?=
 =?iso-8859-1?Q?HwUodyB9hYLQlX+TllNk065KwVf7a8Y5i1sgtPrcABz6bhDUYVwVuO0GVM?=
 =?iso-8859-1?Q?FItlrwzSErTqxhjT7TKXR2kYb2yKZ3mKTNTaXAY+j1QC5AEK0qu1LNJYf/?=
 =?iso-8859-1?Q?WwcVnBlV2g0XeD9eGIlUjviI77z1m6vMzWgdp/pvB9vA2E4S+igJ96q+qc?=
 =?iso-8859-1?Q?hpu4zKxhoZan14ze2ILq6vEbRHr2VUzxxN5n9TpnXYJUuVA/I1FbNV0VKJ?=
 =?iso-8859-1?Q?KkOZ718M82XpLYCKCYzsmSWGvtOQR1G5WCzLrZMhAnpwtLqJfRJ5YGe4Xn?=
 =?iso-8859-1?Q?r5s8rMnivmjXOFeT7ysfHmADVZN91CCc5+AK/mpf0igK9X8/Vf2tBCleue?=
 =?iso-8859-1?Q?1hADaH/gmoC/UVOhKL15hv58lL2BDbI80Kkjdza5qSftg3CI8T+DdFFfNX?=
 =?iso-8859-1?Q?CEohtZ+qxzkSbasT4+wV75qSE/SMXocO3+s6OWgkeFPh4yYcy6lKDgIfEg?=
 =?iso-8859-1?Q?4z7xnO3hJ+DNgWpnrzuJaw5E1MfqpO5OJCxEoj43TElX0IBUuQajCrFUCq?=
 =?iso-8859-1?Q?3EYfSB4y/S/7+4nmm19GPfQiOmxzDYMpfiwR8gjdZUD3YnyaXDXkMTL5+3?=
 =?iso-8859-1?Q?4p4m/X4sycTwk6M5cvFR+g5+/qoP9nqp7z9LLYTCIY+AtQYy4m1eDVcORb?=
 =?iso-8859-1?Q?k74skMGwv96Vdy2FLnWE9qq64nDF71XoZ2GsgjfK60iefEknRZ5RNdHKzk?=
 =?iso-8859-1?Q?Eo2QD4zSmjLyVhI7WYH7pJia1UhpWge0kjDPpYreB9KcP1Z83GRDFdv3br?=
 =?iso-8859-1?Q?wATTS50Z66su3Syb0xJ6LQ7AGqH3fDSwPmUMlyseL8nu3R9q0ZNgopakVr?=
 =?iso-8859-1?Q?B/dxhQ24apHTSOembhPA228V/GY1mdeyZ4e8Y2cSc/P1m8uIyrbuK88PqK?=
 =?iso-8859-1?Q?mtHxzi4qLdsQtROuHzVWfM//UThmGHyMlA19T99uth0+RYo6UJpAdxhXOF?=
 =?iso-8859-1?Q?THDccol3P5ECr1EHEJuSeEmv9/0FBtFZ/Gpm2N5WFAC6u5WFA0HIcWrU6O?=
 =?iso-8859-1?Q?vA8WPt8/QEx9RSK797OdKTMWa48yF+r+mWo5aS0lY00bGV5dHl0XLUIpPD?=
 =?iso-8859-1?Q?HnV9fzVHoRg8YHXbXjs6ReMuodZKZacdtCLsn3mYhtGY32sq1o1cfsYqv2?=
 =?iso-8859-1?Q?peucpUiJ6+FbDJmQ6OOoQFAKW0QVTFz6K1DMoYJhohGofZE2NR7d/MbnIk?=
 =?iso-8859-1?Q?2Dw7O9y2nV70r/wTnh+vf3mt0NYZ0uxZ/6NXhPYU8isiwfIl15djsjFuLI?=
 =?iso-8859-1?Q?l8G+jwoE6qyeYNEdXBikbzlWOLsW+k+IfHo7lg+AK+FDY1LxlAyikMRnEu?=
 =?iso-8859-1?Q?sP3hzybRDuqNmTqgtxaWF6ga2APdtGD9dWU/JsQOit/uRMYpH2yUyjU1Zm?=
 =?iso-8859-1?Q?ZWbq0zwb5LQ3opg8AG5zFx4rAyaUzsn+YattSaLiaCgw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?e6lm3SOU3SeMRHX34RQXcpWy/Gp9amhjJ8Qai7S0DQOQSS1Dc51jSHOkOX?=
 =?iso-8859-1?Q?smCkBv4q+lUfETYu04l/l7SNGjIUXjA+FwWSXXpVnG+r4i+mp8jvgkPrII?=
 =?iso-8859-1?Q?Lp5KY8cedMf4gRaI+tg8Tf5qW7Vz3x/y5VFL/l76eEk7gVaUBARhuVwswN?=
 =?iso-8859-1?Q?7qFHE0Nj90yTlrDcAawnqSfyxeWN5/czMeSFHb5+nAKycDquRJG+j8pWND?=
 =?iso-8859-1?Q?tWg8LyoHT3Unr7NZmRal9Rc5ypB/Lja/ppxGnB3CgGMnKdn2zhpQ0/fZ9N?=
 =?iso-8859-1?Q?QOVDLVWIRXb5Rf03ce7rdHMZTshjMXMDJtO+EIjqrTmtUq+MFp8yaDX3Zf?=
 =?iso-8859-1?Q?SoUyEl94I/uNpZWTPvABnWJeSaK5ZULuRQZN/QpdaMpJaMnpyxRKeR9sn/?=
 =?iso-8859-1?Q?CDpycHmgz2vJyDWcyQo5b8qmOzWQDMBqFwy6aln50ZWHWrdpCVfYgxwVzj?=
 =?iso-8859-1?Q?Bia2oP3iQaJiXfH4ghBlZNlMGz5nBLxzbImWHGRXg92Oz3TBYLZpEKR2Or?=
 =?iso-8859-1?Q?ZhUlYgnm3fGqEiICHe23p6QXQ0NadR9nPQZ07zvgPaRwzCcLNx7cuR744G?=
 =?iso-8859-1?Q?M6WAe/plQeyb6ujSYA519kyGyG7r3RhAvs5xkPTEWioQVPAeTfTclxFh2J?=
 =?iso-8859-1?Q?LloID8UjrZVy8bA6WxXoaeZQ/d9o0K+0olSobm6ygmecV9vIHBLgj9j9Nj?=
 =?iso-8859-1?Q?rCXIAn5HyAEggVcXdeHkK9TF4+XG8la5eSHxjTY+aQwutII5VO9R+dMPgl?=
 =?iso-8859-1?Q?GT51KDTVEVOncmBHBSLd4UNwJA+BAVoSAIjlvHwa6h2kbvCjrBNRUFJN0Z?=
 =?iso-8859-1?Q?f3yatPpJB2Ll3bG5Ffg+i0LHoVq1h1f7yFUPgl/7wX+2u+96F52uE7wqc+?=
 =?iso-8859-1?Q?+rWGHrvueHEZYFAI1X97n7R9Le/5kwj+4lTuPRIptM1CeSJ3YGyyfbOipX?=
 =?iso-8859-1?Q?9mZEZtggcDN83rR4X6Kt0RaXvJX+WBmpyKjP+Ct90XZ/2fqloukS9Eflly?=
 =?iso-8859-1?Q?/GwhQC1rpT9nqfiNqHcvEG8Q+Aoz3beK8XAsc7BB2je0/p7Q/ypjCbZH7O?=
 =?iso-8859-1?Q?s4Cb+KP7A/uGv7Rdp4Z32IBAl6wQXzYcVtvMVz1kQCSskMuf/qsR9fXnJu?=
 =?iso-8859-1?Q?BmITlDLQFABTNLDxxsVThOyyHQJI4VHP2ymywen06HRYr3n+iEbJLhXoWw?=
 =?iso-8859-1?Q?k42Pb0AYOIv8lHUGDBDg1huz1lTxm+sM6vdcRj5SC+5erUVel5ntFX49Lm?=
 =?iso-8859-1?Q?8ORhuxjcgVMj6I0w5HS/5ce+U7sriQDXxImsyFN7u3dpBh8nYLVBoC37xA?=
 =?iso-8859-1?Q?0SjU6ciKtXZS6fBd7d52hTR7DFdUnUmNTgCR4Mayc5RKQPdj4inGtF4VE+?=
 =?iso-8859-1?Q?tWJ0e7vZCtw+7VA3OWNSE1tPUnUZO1bpc8x9xGZwqEP8/RRuaYINQAGmKT?=
 =?iso-8859-1?Q?/lD7hl0Y3djazibesQJdTXV3FslPPF7z8Cyq/4TIAguYlBWSFh02lr0Rvf?=
 =?iso-8859-1?Q?1lMTh1pRULfgMTxqTP9oY1+pEPcRm0kvAL+kqKvGZSryQ9/rg803nQIGMq?=
 =?iso-8859-1?Q?QsL08V8j2ADimukaqoC6yZwiQ++/FXXUdXzzEOkzYqtjGxaEBMIKI54FXQ?=
 =?iso-8859-1?Q?igd8GVFxKVGgk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c9981621-064a-462b-4dc8-08ddc0922e07
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 15:47:02.5846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4Cg9wh6mQkYVIWHd1gySpJPWfrrvYa4JRTr4BsBJ98o0zyzjCPWfmSLMWChAv1cc9cMnlblEYyXmc7i4xvNsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 15:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220144

Salut Mathieu,

We tested using core-image-base and ptest-pkgs. Thus, we missed out on some=
 dependencies. We'll send an updated patch shortly.

Thank you for testing.

Cheers,
Mark

> -----Urspr=FCngliche Nachricht-----
> Von: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Gesendet: Freitag, 11. Juli 2025 13:23
> An: Jonas Mark (BT-FS/ENG1-Mue) <mark.jonas@de.bosch.com>;
> openembedded-core@lists.openembedded.org
> Cc: jpewhacker@gmail.com; raj.khem@gmail.com; Simoes Ricardo (BT-
> FS/ENG1.1-2) <ricardo.simoes@pt.bosch.com>
> Betreff: Re: [OE-core] [PATCH] dosfstools: Add ptests
>=20
> On Thu Jul 10, 2025 at 4:20 PM CEST, Mark Jonas via
> lists.openembedded.org wrote:
> > From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> >
> > Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> > ---
>=20
> Hi Ricardo,
>=20
> Thanks for your patch!
>=20
> It looks like some of the added ptests are failing:
>=20
> WARNING: core-image-ptest-dosfstools-1.0-r0 do_testimage: There were
> failing ptests.
> ...
> {'dosfstools': 'START: ptest-runner\n'
>                '2025-07-11T10:03\n'
>                'make  test-mkfs test-fsck test-label
> referenceFAT12.mkfs '
>                'referenceFAT12.xxd referenceFAT16.mkfs
> referenceFAT16.xxd '
>                'referenceFAT32.mkfs referenceFAT32.xxd
> referenceFAT32mbr.mkfs '
>                'referenceFAT32mbr.xxd mkfs-fat32_2_res_sects.mkfs '
>                'mkfs-fat32_2_res_sects.xxd mkfs-fat32_4K.mkfs '
>                'mkfs-fat32_4K.xxd check-bad_names.fsck check-
> bad_names.xxd '
>                'check-fat12_first_cluster.fsck check-
> fat12_first_cluster.args '
>                'check-fat12_first_cluster.xxd check-
> fat16_first_cluster.fsck '
>                'check-fat16_first_cluster.args check-
> fat16_first_cluster.xxd '
>                'check-fat32_first_cluster.fsck check-
> fat32_first_cluster.args '
>                'check-fat32_first_cluster.xxd check-
> fat16_dos_cln_shut.fsck '
>                'check-fat16_dos_cln_shut.xxd check-
> fat32_dos_cln_shut.fsck '
>                'check-fat32_dos_cln_shut.xxd check-
> chain_to_free_cluster.fsck '
>                'check-chain_to_free_cluster.xxd check-
> chain_too_long.fsck '
>                'check-chain_too_long.xxd check-
> chain_to_other_file.fsck '
>                'check-chain_to_other_file.xxd check-
> circular_chain.fsck '
>                'check-circular_chain.xxd check-duplicate_names.fsck '
>                'check-duplicate_names.xxd check-dot_entries.fsck '
>                'check-dot_entries.xxd check-huge.fsck '
>                'check-label-different.fsck check-label-different.xxd '
>                'check-label-only-boot.fsck check-label-only-boot.xxd '
>                'check-label-only-root.fsck check-label-only-root.xxd '
>                'label-fat32_mkdosfs_label1_dosfslabel_empty.label '
>                'label-fat32_mkdosfs_label1_dosfslabel_empty.xxd '
>                'label-fat32_mkdosfs_label1_dosfslabel_label2.label '
>                'label-fat32_mkdosfs_label1_dosfslabel_label2.xxd '
>                'label-fat32_mkdosfs_label1_dosfslabel_NO_NAME.label '
>                'label-fat32_mkdosfs_label1_dosfslabel_NO_NAME.xxd '
>                'label-fat32_mkdosfs_label1_mlabel_erase.label '
>                'label-fat32_mkdosfs_label1_mlabel_erase.xxd '
>                'label-fat32_mkdosfs_label1_mlabel_NO_NAME.label '
>                'label-fat32_mkdosfs_label1_mlabel_NO_NAME.xxd '
>                'label-fat32_mkdosfs_label1_xp_erase.label '
>                'label-fat32_mkdosfs_label1_xp_erase.xxd '
>                'label-fat32_mkdosfs_label1_xp_label2.label '
>                'label-fat32_mkdosfs_label1_xp_label2.xxd '
>                'label-fat32_mkdosfs_label1.label '
>                'label-fat32_mkdosfs_label1.xxd '
>                'label-
> fat32_mkdosfs_none_dosfslabel_label1_xp_label2.label '
>                'label-
> fat32_mkdosfs_none_dosfslabel_label1_xp_label2.xxd '
>                'label-fat32_mkdosfs_none_dosfslabel_label1.label '
>                'label-fat32_mkdosfs_none_dosfslabel_label1.xxd '
>                'label-fat32_mkdosfs_none_dosfslabel_NO_NAME.label '
>                'label-fat32_mkdosfs_none_dosfslabel_NO_NAME.xxd '
>                'label-
> fat32_mkdosfs_none_xp_label1_dosfslabel_label2.label '
>                'label-
> fat32_mkdosfs_none_xp_label1_dosfslabel_label2.xxd '
>                'label-fat32_mkdosfs_none_xp_label1.label '
>                'label-fat32_mkdosfs_none_xp_label1.xxd '
>                'label-fat32_mkdosfs_none.label label-
> fat32_mkdosfs_none.xxd '
>                'label-fat32_xp_label1.label label-fat32_xp_label1.xxd
> '
>                'label-fat32_xp_none_dosfslabel_label1.label '
>                'label-fat32_xp_none_dosfslabel_label1.xxd '
>                'label-fat32_xp_none_mlabel_label1.label '
>                'label-fat32_xp_none_mlabel_label1.xxd '
>                'label-fat32_xp_none.label label-fat32_xp_none.xxd\n'
>                'make: /bin/bash: No such file or directory\n'
>                'make: *** [Makefile:858: check-am] Error 127\n'
>                '\n'
>                'ERROR: Exit status is 2\n'
>                'DURATION: 0\n'}
>=20
> ptests which had no test results:
> ['dosfstools']
>=20
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fauto
> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F73%2Fbuilds%2F1
> 880&data=3D05%7C02%7Cmark.jonas%40de.bosch.com%7Cc6d83af9dc9c4ef0162408d
> dc06d4402%7C0ae51e1907c84e4bbb6d648ee58410f4%7C0%7C0%7C638878297694194
> 990%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMC
> IsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> JLHTr%2B93pDfaG8w2ttgLkIMFtszab48Niv5CwrFvxlU%3D&reserved=3D0
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fauto
> builder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F56%2Fbuilds%2F2
> 01&data=3D05%7C02%7Cmark.jonas%40de.bosch.com%7Cc6d83af9dc9c4ef0162408dd
> c06d4402%7C0ae51e1907c84e4bbb6d648ee58410f4%7C0%7C0%7C6388782976942331
> 92%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI
> sIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Ds
> JxNAIJKERr%2F6t3AQRVhCloJFH%2FuSF4PPk2RH5QgujY%3D&reserved=3D0
>=20
> Full ptest logs can be found here:
>=20
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvalk
> yrie.yocto.io%2Fpub%2Fnon-release%2F20250711-
> 49%2Ftestresults%2Fqemux86-64-ptest%2Fcore-image-ptest-
> dosfstools%2F&data=3D05%7C02%7Cmark.jonas%40de.bosch.com%7Cc6d83af9dc9c4
> ef0162408ddc06d4402%7C0ae51e1907c84e4bbb6d648ee58410f4%7C0%7C0%7C63887
> 8297694260488%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
> %7C&sdata=3DnFrw9Yyy%2BLH1O8jwD6C0w%2FgaIRC958%2BOG%2FWIb5kFH4Y%3D&reser
> ved=3D0
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvalk
> yrie.yocto.io%2Fpub%2Fnon-release%2F20250711-
> 47%2Ftestresults%2Fqemuriscv64-ptest%2Fcore-image-ptest-
> dosfstools%2F&data=3D05%7C02%7Cmark.jonas%40de.bosch.com%7Cc6d83af9dc9c4
> ef0162408ddc06d4402%7C0ae51e1907c84e4bbb6d648ee58410f4%7C0%7C0%7C63887
> 8297694287660%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
> %7C&sdata=3D%2FJnchgCRVyxKyCrdiOoaUG67MJrBXBXdlXfOdw0CP04%3D&reserved=3D0
>=20
> Can you have a look at these failures please?
>=20
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fboot
> lin.com%2F&data=3D05%7C02%7Cmark.jonas%40de.bosch.com%7Cc6d83af9dc9c4ef0
> 162408ddc06d4402%7C0ae51e1907c84e4bbb6d648ee58410f4%7C0%7C0%7C63887829
> 7694316436%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjA
> uMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C
> &sdata=3Dw8F1v4O34UOnwZ3G5DE1abJRBWD1cMMme9Uz4PM6MxA%3D&reserved=3D0


