Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A09C25B78
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 22:42:36 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.52])
 by mx.groups.io with SMTP id smtpd.web10.7850.1715812948537938402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 15:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=hCRGiTZh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.247.52, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJFctI+RFeQNPL+ljaK6Wa3lFM/pKrGiD3Qp43aDWJ9cPNJ5Za/V/zG32fhJmJUKPYsQa5v36uE05huXe0l1LlrbDD+3sRL5J/HpjXiEvFXSv08Dgs+V3ZyFIpKw7eCdfVdu1o9YsSS9lCdvKY/6gdze2hJFPryXSQ6dOqrxGf6GDqZ7LokDELLD2+QyhjD4+kz1v6Xzl2lxgFq4pdAVEkDIhvyWQ/xfgar7thKxpmMTwVpT+EOvuwPc65cThSy96bphqtQH9XzEzZ/rIu0YduOy7qPMliQ//KdmZfHkcre+jxJ9P/SGGe3L111JGbfW9+qbEMudJ1FDlXuz7a49Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4DXo+n3dncR3wv+qUXk5bIh8HQ8QR8q2qrCOKH6CDQ=;
 b=S5f+Kmezr/1p8yEctCr1er/eetNyQb0nLLPYQJ+3mB8R0BoExONSKlro3LhjUu+ehm6/1uZ7umz4nWXIrsE8k+nA0pIb3eiFvEIaqGcTufH4T1nTwOg4ZcVl1LotKI7U6/GZ+DD5NY693F3M5zlbTsXOVraXtzq+xqA2pWWNgk+oAxgZcnQbLyVE8mAXDyVnPcuxzP0DLYvguajw4bcsGy4f1HfiAtXMUka2mlFduyjNUq+X32Sl/u2nzzxBaRZfytEA7khqz/RHrUFt245a3/HUZsg2O6WRzNwKI2FQlld8zuwEY6hO1RC5ekQ8wlF32GsTLXWqmQSXnciRyCPSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4DXo+n3dncR3wv+qUXk5bIh8HQ8QR8q2qrCOKH6CDQ=;
 b=hCRGiTZhEsSI7VojDQAzSlWXCGJjUY5V7D7ouKHa2FTLLO8lbpisRUD7dqUypXp2FE1kkIJO2cvbfWCCdTnFc48n0V7UiVsvBzC4GBB5Vk3rpl/JIjKjUSdh3gBuNrx16Eg1ANIAd+JCToSHWe1KtSfTAHzHixhiYQqVrF8ZAao=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by DU2PR06MB8262.eurprd06.prod.outlook.com (2603:10a6:10:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Wed, 15 May
 2024 22:42:19 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d%6]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 22:42:17 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v8 0/3] pkg-database and systemd-sysext image
Thread-Topic: [OE-core] [PATCH v8 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHapDYbnGIHdDzisU6KQw8DQSOb9LGYrkuAgAA5rKE=
Date: Wed, 15 May 2024 22:42:17 +0000
Message-ID: 
 <AM8PR06MB752198E3E3AA862764E7C706BCEC2@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20240512063159.1249522-1-johannes.schneider@leica-geosystems.com>
 <2024051519090741f660dd@mail.local>
In-Reply-To: <2024051519090741f660dd@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|DU2PR06MB8262:EE_
x-ms-office365-filtering-correlation-id: 11171f1d-5a3f-4395-d6ee-08dc75304646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?O9mUKFV85JKN4K8bYwy/RyjGmWDrKwuVg/LV6osaPK2mIbC5OHoXNQIR?=
 =?Windows-1252?Q?O7d8Zzi7AdUtlYNNQLlCxLWddVuGvMysLH/skHgRm+e2wBD/t+CpNBZm?=
 =?Windows-1252?Q?+gak4sJ0Os6y35tsJzgi7sy0c5SNBSwuYl+w8LlrfjtwJzFnpCu5cw+Q?=
 =?Windows-1252?Q?djRWdeT0nZGsh4qIt0BkCB+ceOagoNkvRhZdsaAssnJt0gktshERjNY/?=
 =?Windows-1252?Q?cMQYVMSG6RD6QTv03lP/cU83o7AOPRKthOuYlEs4YhFdeyDzH9Drme4w?=
 =?Windows-1252?Q?m7q6vBNETLnuTY5Uyu8cb5+xtuJ9JPUcLO1Zv2mBQYgEHvjsuTxqqrXF?=
 =?Windows-1252?Q?UAEVeOY5cgq1GtVXXLO+X/kyUecOQ1/d1H4FpSM3+wjMUiXBa36mXe1c?=
 =?Windows-1252?Q?u4DGqP968wNUg9a3XtKhD5saQbHqCMemePp8gZSeC5qH3+/z/yi8NA2M?=
 =?Windows-1252?Q?5Oebl+01v8LxY5VQlvdPB571ILg9KbIZRewgLzIcDBUye6me3biD+fFG?=
 =?Windows-1252?Q?yRGLlgruy6HijjZVu1r+0xTaCWp5R/qzyc51Vhbw72KPW7ILG6cbRHqO?=
 =?Windows-1252?Q?ifIF5kgCdxAOoy8qEmsEw8MXwDvTHtEtfDX7R4C5/8ujDyuKGNq+nPIT?=
 =?Windows-1252?Q?9tGblZRGCu7Oz++kei94RGmKhEvvjnhmzOPCATO8JBRlFRKiiYII7GIn?=
 =?Windows-1252?Q?WMPA/Mt6DyL9W1bwgj07axygOWfzl7ElXMRJZHsd2crhBHstlbJZDA1c?=
 =?Windows-1252?Q?2SyIPCYzQHTP+x9+oM1cCUI5eJairGhWJxm3YTCoGZ0LQNonD2BeReT8?=
 =?Windows-1252?Q?dSrjYJvm31FlzXqFLXDl6D54oHdHF9yvKV/3+FRodJ/M26zhYwjfMRh+?=
 =?Windows-1252?Q?MV1fG9U7zRJgbFHg+5fyoZyl5AxXEdn2CENoFobxX51AGnxlkH71IqvP?=
 =?Windows-1252?Q?Jqk+S51K8plc9YojEVYsvEsYL5Phq71Pzw69m996j/dMua6UAqwSMyGJ?=
 =?Windows-1252?Q?QpnRtcv8W9+9oJKjNRsN1IOM8JFQ6hSi560zVkUIC3DhVS6cM+IKg1i5?=
 =?Windows-1252?Q?zeNZUp7wvtbJ4inxbkcYyMXEH2TMlT88/a7QKepPRGTePoXLCwNPUT/x?=
 =?Windows-1252?Q?Y1tjIWPzMnqC6dJI3T+QWdQGxhn6VB9TKFu+/QHlv2w37witzcu7NNtT?=
 =?Windows-1252?Q?4iZGg3SUlPh7HUJwqBtpYlG7cRKGm3ZN5RO1METVy5SnmOQwZ15DGw7O?=
 =?Windows-1252?Q?NhEGX9KpYb+C9N6J6R0+AlkaSMyU/rpZ/VyTREaopcYciEr6rBDsy1tJ?=
 =?Windows-1252?Q?98NhGKGbCJZF/z7GM/c0CbrdneXmCLKEV8KlkIn6cs7RIDmDtrzTTjzf?=
 =?Windows-1252?Q?YRBVmXfGhA348A=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?6kFT6gCacuglaudkefhLfPG+WP8Z2SBErxxGDdf9BA+jNoua9w+uCn8h?=
 =?Windows-1252?Q?Ha6egG6qANBlk7t0JNesH7FnaLmUluRmbCyjUAGjPQozFX7lqSMyTyWX?=
 =?Windows-1252?Q?MIjLAAPPfcBn9m6IVfBun4PDH9VPRhjcZIPjFi3KGbuoOTHXh1pJwDvQ?=
 =?Windows-1252?Q?cwWRRMtYbjB7WJprVGBAWrJDBblh+beNIdfJJWjtaiMQObEandAcA9G8?=
 =?Windows-1252?Q?3mSDd/uJrxuNN+k4WSYG2gnWzuT+md+xkRyxq2fYauBSHpkIAEn9CmGM?=
 =?Windows-1252?Q?kC+ket4R87lO3gTmefpfkokVPPiufniFPmcrbshB/r29QFeSG+MfxIkO?=
 =?Windows-1252?Q?NRxDF7cqYoM2H8vSRIhyXH77u/2G7UgV2KPibmPiw2uKUs6IM9PIGDKi?=
 =?Windows-1252?Q?DjC8nsDJxgg/IuZuj6IX2tyJ/xzQY4jahjw5ylhYyARhGiZMYdkkuLCJ?=
 =?Windows-1252?Q?cFWtym8noYql6ZMVw/vnDUdRMYV1hmcaTbig8Mr00dnajMOSQYGV2m2T?=
 =?Windows-1252?Q?nfW1SMnNVmHg06eMK1hYmKuVCqid/x/qixMIV0hxXY6bbFrsiYIyolA1?=
 =?Windows-1252?Q?hzjrJBQFkYFkjejgtitEGQrcd4FhwIhTSODqq3EQ5C+qacAWpNss6cKU?=
 =?Windows-1252?Q?+jakmbM4PqY3osCyKYRsaH1NL8u1YbgL3jw2HFs2+9SFgOO6J+/ZzfQy?=
 =?Windows-1252?Q?cZY6uc+qjzwrCmk7FsUCw886DvsfIrp3rY+rKseyp/4cpFnYKNTU9lCF?=
 =?Windows-1252?Q?eGxEbX8NUqqrABo9KeVf1r+Ht2ZpdTN3PFf+YClAnCr9b8tDj4k6DNKT?=
 =?Windows-1252?Q?PDrs/BRbG5pUudIUG7E402wYKIXEodaicar4f9ur86rdGq7iJ1JhiklL?=
 =?Windows-1252?Q?hj2C88JclbtuTfmck/g2pLjWx64fVGRXn2vxgm8wVD9DLNZ6eimNzkvJ?=
 =?Windows-1252?Q?YFI/m6kPZoHXJMuGQMEwHzJTrFc4xT+sK5d/flMrX5IASFJzU5uHg2re?=
 =?Windows-1252?Q?Of7bTsyWOwoDoZ/IU4bjfA55UT0LE+eD1xO74LFO5E0wCVuqCLlpzLxN?=
 =?Windows-1252?Q?jAxri2rQhV5ginx0xGN4lcJWNQjERy5YLgGw1CDVYqzJTyXCrvGSd3IG?=
 =?Windows-1252?Q?NgzsQiCJuixq/2kY1ADMVR7zkiK9WjYjCgbBIOVivVQbbrgvbcmzzmjS?=
 =?Windows-1252?Q?yM8rN0M/0FEVwjGH3qIMZ2g/epahFQpEMRLx3WlCWEwedLar1ZRJrq9l?=
 =?Windows-1252?Q?3r/vr/77DHQsNHEV5IigqSAqODZz5um63KTEw+qoWRx+2x0L2vjRfq3c?=
 =?Windows-1252?Q?V4NMy3Vz29ewfgwS2wi+2Qc/VbIUyHpCC/G0NulbfhZx3GcvrpmFdccj?=
 =?Windows-1252?Q?VsIlYJhZNqSKWq09+fFMp6NTWmxqmhAe5h0Vzwm6qZpadiDwWJEzhzFh?=
 =?Windows-1252?Q?eAFwmcDRYoQ+vMDUnjoMtVdpq6c0FtGjEglLRPd09Z9FA/uEXECd/Rks?=
 =?Windows-1252?Q?vP6/2dPVEr5bdlOdchenv5pyLDbD3miATH/9TieNcH6qhTHu2Cg7i9lT?=
 =?Windows-1252?Q?BNasVvMq7luJvhaiZRafxBDnj+l+NlfmRnFOmkAgm13DDjiKPmvSbQL+?=
 =?Windows-1252?Q?jFCdSvEjAG+cqLHQFeCmwJ01BKZVgky0IEPMFur9+5pOajOMdgcweTci?=
 =?Windows-1252?Q?PUKx3ohp82eAJoc2m16FCEBXhH4177XtQ09O12R2txOOZ0xqu2sD35/0?=
 =?Windows-1252?Q?V6rEqBhDUOmM29H1Y0WICD3fVKGH/xO0XavQHaherbCFpui0Latu0Qpt?=
 =?Windows-1252?Q?xq2dH6y21c3aBiVlboVVdavfdS0=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11171f1d-5a3f-4395-d6ee-08dc75304646
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 22:42:17.7383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqgGQ8rbP+p3NGwPvpZvA+SmOnLy7wfeh+iWXinu7IGLg4apZv3SkK0FP5u4oaG48QSzcYb3xFzSWFHvl2cF+wNYiU3o7iqTC5nJ2yHfrbpu0O7lqrZ0BfXVCNkHZLON
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR06MB8262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 22:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199434

Hoi Alexandre,


and thanks again for patiently pointing out the autobuilder problems :-)

"only" the test_image_gen_pkgdbfs_{ipk,deb,rpm} fail, the test_image_use_pk=
gdbfs succeeds

picking apart the yocto-autobuilder-helper/config.json showed the differenc=
e: basically all oe-selftest-* use
 "MACHINE" : "qemux86-64"
**but** oe-selftest-armhost sets:
"MACHINE": "qemuarm64"

the test_image_gen_pkgdbfs_ checks to sanity check the packagamanager state=
 looked for a "kernel-image" package in the listing... but for quemuarm64 "=
packagegroup-core-boot" replaces that

v9 of the patchstack adapts that particular assert(s) to look for either th=
e kernel-image or core-boot depending on the set MACHINE


gru=DF
Johannes

________________________________________
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sent: Wednesday, May 15, 2024 21:09
To: SCHNEIDER Johannes
Cc: openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundatio=
n.org; alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH v8 0/3] pkg-database and systemd-sysext image

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


Hello,

It seems that this reliably fails oe-selftest-armhost. I didn't really
pay attention until now beause we had other issues but in this build,
those are the only failing tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3322/ste=
ps/15/logs/stdio

On 12/05/2024 08:31:56+0200, Johannes Schneider via lists.openembedded.org =
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
>       tests: restructure to call 'bitbake' only once in the testcase itse=
lf
>         (in hopes of solving the autobuilder problem; local test runs suc=
ceed)
>
> changes with v7:
>         tests: undo the restructuring of done in v6, in favour of explici=
tly forcing steps:
>         '-c rootfs -f'.  since concurrency of the autobuilder, and reusin=
g artifacts/sstate-caching is probably the issue?
>
> changes with v8:
>         tests: fixed missing feature=3DPACKAGE_CLASSES during 'test_image=
_gen_pkgdbfs'
>          which is now split into three, one for each of the three availab=
le packagemanager: ipk, deb, rpm

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199209): https://lists.openembedded.org/g/openembedde=
d-core/message/199209
> Mute This Topic: https://lists.openembedded.org/mt/106051545/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

