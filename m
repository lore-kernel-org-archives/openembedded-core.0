Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE906C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 12:42:51 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.71])
 by mx.groups.io with SMTP id smtpd.web11.50819.1711370568534057301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 05:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=l/K/b/pF;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.105.71, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9q6cIepCOCzlhPqrkVxp0cN6WCdu79/WzEPiy0hpfHd5HlAb4V/RIv3Plc42rgQd5NL8jpbTVSm++t90TmVhwjCsIQJewn3k2EaGSSZUgX1kmrRofJiURnY+72vm0q8efOhDtJ3PO0ETYnwVtnTg7q/chknusIvegj42M6xJF9r9UkPjP6A3MjaokYjaCJmcitXpoqlV93J9A/eeXdLQp7FuP8eLFOyiW+EuKt1oxfpm2jyDNJCmwuPepw+n4vdLuphMa8IhnHq8imJiiqhP3wJr6lip4Chv5tk4OCp0ps+A5Rb1nWZd0Qed42TVdzjibLna+Jk0iUprXK2sbfFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l11fX8TfJMspvjeTcKbc+U+/1/cY0AGOfGOJza85GCo=;
 b=mXm9piSpHO8bhV31VwBHxq4vSlVacSEYf/x4gIV43tVGLcbrgR52YHJPhaFHcwvFca/DI/SMMFop3hI3PhO09IMU2gGOs7i+8s+zOHZqagInW2zbX03qHWhjcdZq5jUkzDr+85+FAR6KsvuEyuVH9Ayr7wTRxr8bk0xfJrmXHSJPFcJzUHZLwHQiBVDMKBwuUCNIx5vM48i8ZBIzhNiXciI9w4kSsUiWfrm2/89zmaN0ahuUoJvdal2lLxfYYpVgeDlCkwhXJrOyiNdoJLm+DmKC5tWX6zCx8HaXn1EHD8fkuTsh7dNykw0V2tf0g28ZauLx8yc4ur5fwsI5BvV2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l11fX8TfJMspvjeTcKbc+U+/1/cY0AGOfGOJza85GCo=;
 b=l/K/b/pFBllwks45DLncVmvuEg5SD80fB/3VmizHlRxCNIq/mPkPSvQ5beTg+QPNj1l/mf9+yhbSUi2+jT5m9dmSSURVknNwsmE2YVIIBJ+EBJRrjiy1/9tupzLd0QD1ueaRcGb8w688KaNhLTuAnvp2vjs2zgzY2jRbs4ioIvc=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by DB9PR06MB7946.eurprd06.prod.outlook.com (2603:10a6:10:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 12:42:44 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d%5]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 12:42:44 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 0/3] pkg-database and systemd-sysext image
Thread-Topic: [OE-core] [PATCH v4 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHabfttmtZU5zMqykisJheHsjvc8LFFc1iAgAMSyEI=
Date: Mon, 25 Mar 2024 12:42:44 +0000
Message-ID: 
 <AM8PR06MB752184BF954CB6945AC9EC91BC362@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
 <202403231340237d0319a2@mail.local>
In-Reply-To: <202403231340237d0319a2@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|DB9PR06MB7946:EE_
x-ms-office365-filtering-correlation-id: 17b4fda9-b8f9-4a3d-6be8-08dc4cc91190
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Hc8nXb7anpKaOSIJbR1zBhva44FePs6v5zcglZrJLRZUd+biHAVxjqW/Gn5qp4uXZrghxOMfQhspuV7r8xVvfOUes1Pcqi/vdkdSkxJUipWpkWX+7fiplslzEocAsPzN7u3A/G06KVVvBzr1SQc0Q7NbopXf8Jd3PESXcc9ITEZHz7gD13LTen6zjsm9IhuI5pnLxmaeuHLZQpweZCPuJ2a8C1SU4XOapyLVl4sae82VFRAxfKol+4YKzYWl5FWi0R0Lpc5d86zV2NUqJJS82kaxd/KBF+f+elSJCBRiwJTTEg+AdWNLPCmlvjPVyG31tTOIREsYgwkYuLPm/baVLr6rYyna7QprrJQtckUrHFmoe+cUsTrcZPbcGeN/k/mlCVIJXreDXbQmEeq0oD9Ilxzou71kaC+yFU+5WdVx2tyiwSJeq9ehPt5AfngV+d+WeRI0YRZXL8wswQrMiMiGZlY9Hm1SYTu+xrytuOPvN980x/FOKpBDOZTqcCSEFI693hXSKH3UPYtWwC4Fb1B/P4nfaJ+uJXjghyNm5sIzTa/Jsxlv3UYUa2iFxJ7VltCaMAhgAdsXJUhH26/NIpgKYGCqYmS6qrSVibmuuj7GtTtdRwxSBTSWSkRlplaXjQfhJtXBCEiUFjK+owqCE0sn/o6Lbek10qL1qvTJzjDs3mQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?pERUAC98/UuKjN41enSr801Qu/WZNs87e+Ek/4FvLtcFHM7ffo1Ro//R?=
 =?Windows-1252?Q?+/6lnDSXgSb4q/DIbN5XHv9Hg9EwkwG+lcYVY9JFxavL6Sx3DdRQvTC5?=
 =?Windows-1252?Q?Ko5TECPZz7vwp4LzHfttM68GYzWy6TpECBtStuPXzSmyhxpCGCBr3VwC?=
 =?Windows-1252?Q?ERok9rtiLKxAxneOfggW1asLsHnCDcKUZXpSSCApfCDByNnuoNct7Ew4?=
 =?Windows-1252?Q?3ucNizWWEI4J8lU4RBb3cCRkLpZOvi38G5pf0tBTtv8Elkf1lgnqI55L?=
 =?Windows-1252?Q?edRmzNgxnZBdfKCMtj/h7mSSdnA2AryOozRI5D+kUKsZTnl/FqZFTI9j?=
 =?Windows-1252?Q?HUjFlrPTf0QqjKlzouXYs5Taqsfui4vSVSLNzdLinYWpmdQT4E/J0Bou?=
 =?Windows-1252?Q?eJyYbCuXEXQ5JkxRwItHIVAkvnVjckNUdxNaoAgglMkK+SBSbd2NIw96?=
 =?Windows-1252?Q?xhMA/+4RhEzIBV6xWOGcgsba8o1H5Q+GAPjFMdu+ZNhdTf/SojxUCMwT?=
 =?Windows-1252?Q?mMfNAHc8GuheylYwbvxM9vIv3D8rvDY+CL+SUWCaUtNz+lVW7K7VLhvO?=
 =?Windows-1252?Q?MB3fWVAO3am78lUOP7GONNVAk40s4yggI0s8AN4gCZ7AgSqgyyQsHIjW?=
 =?Windows-1252?Q?CFjF73rYkHBPdEnL7h2VCKgW6LPZlCBAvNZrARpuKCdl9bGc9QofABFV?=
 =?Windows-1252?Q?ohgPwvGdeckIGnLaeg+LNKPeDw9DxThjnp+H+gmFDITnj8l/QE2EbQLT?=
 =?Windows-1252?Q?Eba5hL8bqvaga7efooFQJ19BQGmrozM4SdH37i23l5/LSFmhp5ws1GgC?=
 =?Windows-1252?Q?N9h7KeiQZBl+dLIJNrj/G7hbNqefwfMrS9AeVXFQL5i+FAlphJIuUmJc?=
 =?Windows-1252?Q?0xlmeOZcw7mOEz6OTp2VgbPNHBxsoSFVlKOTuPRF773WFdgjeFqqCjyd?=
 =?Windows-1252?Q?N4vp+5qQDX0PFI4BA+/G4mso3LaGuE/LyzjFin4oO/58iDZZrFLu8Scj?=
 =?Windows-1252?Q?psX5Re9mmWwJl+WO+gKnxnjhrXxIcsnDb094ZVzSFbEiqdzibJRyS3ya?=
 =?Windows-1252?Q?u1NS+7rVP3kUpSjP5vywhHviigLp473S5V4KGdLJFnp2Y8SSIMPyUjHt?=
 =?Windows-1252?Q?IhKhTAifL59PsVxvktLB9IPqvGVX1jeVbF+XE5pYiC7GoFLUfjrJ5KP7?=
 =?Windows-1252?Q?OH6X34Pw+KF+7ESZ0tERKwgg0qvs6mqtLWquNhAPlCtJlHDrHGdFU/Rc?=
 =?Windows-1252?Q?QPHYRwWCPJVhkPgTS7PNlVREZFsx9Bv1j9b/5UOBp8clO1MsLC1IQBEE?=
 =?Windows-1252?Q?xlxqz1UjT1eb7F7HqUgpvIhQBrDkT+n4JQ6jJrEnSu/68oSkYJsixKzH?=
 =?Windows-1252?Q?ux7wjSOdxeUBSqnGlgmMKm27yCOYw8UCjijlPS2R44h/X3ECU8YpZNOP?=
 =?Windows-1252?Q?48Z9Yqw28Up6kBpwhvqG+raHO83P4vOQV2pL6rJgzywPDRsXoDtYEU/O?=
 =?Windows-1252?Q?uDST7cHw2ESJvydMKBPDJc4V4fWVyuBXLMJ/lc96J/PIDCpZzX5xgUnD?=
 =?Windows-1252?Q?TZSxYD8b8UMWEyeMsj/UwSYCEpo17sDQz4o8WU0V4SoHuSjHUzehU9E8?=
 =?Windows-1252?Q?5MY+sGNI2ZPYhLQgZGwOzSKAglFxnTUPPUSVuN7KfWXzwJ8BgPuiUDgY?=
 =?Windows-1252?Q?/PQ/RnFpZ5Nu/p1/vyAlC4aujNB33hgPPTpfteFBLzYyh3OdaA6POu8r?=
 =?Windows-1252?Q?fGYsCj7AtziKQa1PUDh2Uy1rKRnmeUAGht3ToYR7E+GzTWYABmfGH9/E?=
 =?Windows-1252?Q?kG4l5Ps+wtwaxEispMLr8iC6GQg=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b4fda9-b8f9-4a3d-6be8-08dc4cc91190
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 12:42:44.6218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pX9Rbdri3CEF2Niy3FRVuigx9SE7fBh4TexEj0Pe2pz1TmH5BXXvAhxq+Kt0V3fZVvHfeID3Fef5EGqBqDyomnbabJrwbyw0TJCFmmWMpMGAtk//EBrSelOg+tjwX3ED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7946
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 12:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197485

Hoi,


thanks for pointing the build failure out,

Im trying to reproduce it locally but fail so far to see the problem :-S
rebased on the latest master, when the two selftests added with the patches=
 are run selecively, they pass:
#> oe-selftest -r imagefeatures.ImageFeatures.test_image_gen_pkgdbfs imagef=
eatures.ImageFeatures.test_image_use_pkgdbfs

but running the whole test-routine, same way the buildserver does in that l=
og, currently fails me for other reasons (lack of resources? or i might be =
calling it the wrong way)

any hints/ideas/pointers would be appreciated :-)


gru=DF
Johannes

________________________________________
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sent: Saturday, March 23, 2024 14:40
To: SCHNEIDER Johannes
Cc: openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundatio=
n.org
Subject: Re: [OE-core] [PATCH v4 0/3] pkg-database and systemd-sysext image

[You don't often get email from alexandre.belloni@bootlin.com. Learn why th=
is is important at https://aka.ms/LearnAboutSenderIdentification ]

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


Hello,

The series causes failures on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6548/step=
s/14/logs/stdio


2024-03-21 21:05:49,848 - oe-selftest - INFO - 6: 20/46 500/587 (137.73s) (=
0 failed) (imagefeatures.ImageFeatures.test_image_gen_pkgdbfs)
2024-03-21 21:05:49,848 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa=
/selftest/cases/imagefeatures.py", line 327, in test_image_gen_pkgdbfs
    self.assertTrue(os.path.exists(os.path.join(img_vars['DEPLOY_DIR_IMAGE'=
], 'var/lib/opkg/status')), 'opkg\'s status file was not present in: %s' % =
tar_file)
  File "/usr/lib64/python3.9/unittest/case.py", line 688, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : opkg's status file was not present in: =
/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3332915/tmp/=
deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-pkgdb.tar.gz


On 04/03/2024 07:15:50+0100, Johannes Schneider via lists.openembedded.org =
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
> changes with v3;
>       incorporate review suggestions for simplification
>       add task dependency handling
>       add oe-selftest for the pkgdb handling
>       add variable documentation and
>       some more comments, and examples in the commit-msg
>
> changes with v4;
>       rebase onto 'master' =3D> no functional changes
>       fixed patchtest findings

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196588): https://lists.openembedded.org/g/openembedde=
d-core/message/196588
> Mute This Topic: https://lists.openembedded.org/mt/104717642/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

