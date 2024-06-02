Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0156C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 16:23:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web11.61940.1717345400839966419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 09:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=t8UZA9X7;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.46, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqRZzvWs2teZkosWIZbZoZMyve8ho/NeNk8FJ8GNICDYHG4f9SZqzlSw8iO/uZAxJF6PDrXGPZtn9F0IkSaDWsqpsm9jlFPL6BYH/gxAqYkGWL67ARc36PSvsqPhorifzKM8pTfr41uftll0VgbipBGKFIf1rGhutjyQeI8QQ9sr6FMcfch/CcSNGhx61KgAFzxYyQw0aZ6427Q+xZKXdLfDVcVnP8gT+geIPWE2Ar/FqnfTDPn+CGIcDNsiaqlH+n1e9Dy9bv9qdpYKwPpvL+YnGLXpCqstUwq+AuPYCswEjLZSH39sC53jKv4bJTHoICsESR8s10CxGFN3Fzbctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaDiAqS0HfWftFpVs76T9eEXlCWy+4h98I7LPMH6Wxc=;
 b=ckgqyWa84URVJ4+WoiR/l3Wrmssmjsl6e1SAZeEjnUABZz6LUFpkh/Fu8uWse/mJRRkAi9ZRlsNBMRjVRnh0M9UYOXbZk1PzUsUYcBwGERGSRcVe1e9jnHg4e1O38bcD5r5nAVgj2OWgKyDkJQqpT5Qbw/w3KvTmKcruf8j7Qij8F/pXbnkGFmKwrlkZUpEuQyuiBu1UDIOJWcybtzy6sS7mI+7jJyqvayqgnJ/wzRJ22bFh1J/beCCrFKPhYr7K3cERTdFKPxmjKaYZm+PuswAwv4Wkcxlcy6QmZN3L8sW6tThUIWBlkrqDvCqU4IdRBixX40cRyXBnGzaa5bk18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaDiAqS0HfWftFpVs76T9eEXlCWy+4h98I7LPMH6Wxc=;
 b=t8UZA9X7LfNCqjVbBDCGPVhBsz67sebGU1A3ecTsN0D3PVPQPte9naKcvgj/t46FMV3s+iSWtrU8H/1cvGCIMeb3BWL3tgZYrhGUqx2Bv321UGyzrsm8485/afLWZRE3HVKCxkrldKaVrOUP7UwIf61DZmH05l0JfHoy6aqOM5A=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by PA2PR06MB9294.eurprd06.prod.outlook.com (2603:10a6:102:402::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Sun, 2 Jun
 2024 16:23:16 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3%7]) with mapi id 15.20.7633.021; Sun, 2 Jun 2024
 16:23:16 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v10 0/3] pkg-database and systemd-sysext image
Thread-Topic: [OE-core] [PATCH v10 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHarFIAcEy2Q4uuIU62MWDF+Zott7GuDw4AgAaob20=
Date: Sun, 2 Jun 2024 16:23:16 +0000
Message-ID: 
 <AM8PR06MB7521D565814B003E38561A8CBCFE2@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20240522141152.3286471-1-johannes.schneider@leica-geosystems.com>
 <20240529103456f1e78d6a@mail.local>
In-Reply-To: <20240529103456f1e78d6a@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|PA2PR06MB9294:EE_
x-ms-office365-filtering-correlation-id: d793c021-c323-42c6-269b-08dc83204edb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?PMuf1vUxHJKcHy9N2kG8UvBvQPSvAn5axpFcesFy7IRzjt5a2orTTsRF?=
 =?Windows-1252?Q?J/5VG+V9ZVThFEd5N84UgFDqCp5sDrsadD9robo5iizghYePME7zWlm+?=
 =?Windows-1252?Q?fa1buuOiH04ZJynt/XBbWivOoTN3tg1gAhoKzXcmi1uYLhDxQgBUVkmS?=
 =?Windows-1252?Q?kBCvqpaeVhgmKFgsh6EVTrsghIzMBId6dE1KHNRq3b7Wold/bx81Gan6?=
 =?Windows-1252?Q?SB0tYDvEV9tQkX6IiOYLTpJztqmo+q69hZOZ6SZwTQhHiKD7GZs2yuIn?=
 =?Windows-1252?Q?WOj7v2E/EN4RuaP/VvegEIY2jBAbqSL7eoqZfBWphYfJG8zVs8IQOtg5?=
 =?Windows-1252?Q?mxSHjwtuBzYphQR0Uvkt97aDdJuSHURxtFqOg5Sf8xR8723RERII+VNW?=
 =?Windows-1252?Q?9yvYlvKx1R8tzWJ4OCn8SWC27LfJY8pbU+bXmDkBzDahd21F2qznoLJT?=
 =?Windows-1252?Q?8IlK8R/AP17KMf/cgLY2Jp84TLaqGidY3SrGynOC5ysX/OwayM7kG/NI?=
 =?Windows-1252?Q?GMMsF+FL5iq6yZOkdeOQJNePUxq/EYsXp2+2HalkqkOWQCS9Crnhvtq8?=
 =?Windows-1252?Q?+2W2qv/MoZDahyy1Y3ogfJTrY4zHEJSJHpT6TQyLAKZW9Bs+OdD69yEy?=
 =?Windows-1252?Q?snY02yE01pjtp+kV8t91rYKt9nG+2avabak8wIs93XIu/uXusXlYzQyR?=
 =?Windows-1252?Q?Kx290YhbsLdPdpca5/dceGoOc4Zp4P5OSgNzhqQLAj9mpCg0k3hvQuD0?=
 =?Windows-1252?Q?8cfN8zzmjzRy5Eye5Niz0v7hGDco05pXmFlBGfduLLOQLPhYEVRVl3q+?=
 =?Windows-1252?Q?6aSMOA8mlFbcKq/RIqqKFwFS1es/8tO89K/mJmL8aenu1xC5PHu3lems?=
 =?Windows-1252?Q?JpiETLiciy43b0LPyNSSaHyYG4NigbRpQF8SsEbRukQnfv/sYyUarqTk?=
 =?Windows-1252?Q?13NU6u5Z5Gvty6VyltXu84xJMGfPuFXGJ7yvsUyYEHNMvcgShRkfWSJ1?=
 =?Windows-1252?Q?lYWFByZXOj7I6eqMH8UZ/XHtHQpTfXBCPOYLa+1V4ynPx1O0h/h0jevg?=
 =?Windows-1252?Q?XsRpKIhilZmpslfQvmrn1/6a6oR04bkOE79PvDE+1nmJy2lZn4U5Vd2d?=
 =?Windows-1252?Q?jlRW43nFQjy/9WPwkSgJRr5IhhfFiIT801RmW8N7Dz6w5WuD/aWJhuP8?=
 =?Windows-1252?Q?bGwHyqr+IywnL50xhTP3L1eYqf69cUAGsiODMP0AwdSReY074QZq+fkF?=
 =?Windows-1252?Q?nMIgGBQdgEN6l8xo99FN0lX6x5HMFeuukazCqZWHFDC6q6AwPnaA7/7a?=
 =?Windows-1252?Q?M0XL8Mr8AdRz+xlufortTtPrfyU5NDmpKIfLvcMNo32T3NsTjxq+lwTZ?=
 =?Windows-1252?Q?KEzVRjxjHtFnZQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?V29zWwtciMtCOgWgRwMtaW4ERFkKr9H6QHPIeb4RbI17K5fUiEgLUlxP?=
 =?Windows-1252?Q?YKUcuBtDQRGAYLaOacOj5jGb2Rcur0z3ciBBDv6rHmsu1mlIFGrI2u+N?=
 =?Windows-1252?Q?KQ1siDCYIZ33FTnx9rXnPoNavq66TewkRUxJApfRdy2zQBPBMJNGnlhO?=
 =?Windows-1252?Q?ZRDJMV+bwWU0/jMn2xLQ+BVXBejaaOKOmk2TStXsQJ3EnlkxPhByCS1i?=
 =?Windows-1252?Q?IgXbdOLXyJkxojRwYCTHXPuoaAcBHrvcEbFjGuI6C8OfmeO+depMv710?=
 =?Windows-1252?Q?EqThpeSxuWhOze8+cVpbe67d+l7BOUm06mmEKGE1Yz1/pVDeZB/Wa5LB?=
 =?Windows-1252?Q?WfADDiFiB5d5fQnNT7yfIIXh+GsYXu3VNOfmjrd1jT6eoTBbJA3zzrvy?=
 =?Windows-1252?Q?P8dqHIBnaKtm8hc3lC5OqG9xu2ufO7URlFDIbayCmbtaG3aRJE9XpxbK?=
 =?Windows-1252?Q?+cOv8KF9umlPB34nqu1erhonPP9KHZM2Pxb0kwxHbbC6v/xr0JRUkRGm?=
 =?Windows-1252?Q?dFQ/b2U5hgl99HchWW+Jq/V9DrnnAV7jiUU+lBRktZ5HVEZJblSEYOCi?=
 =?Windows-1252?Q?D9tgC9CfzqlRhalWvPsbB0mQkYb98oNxcmNYbw5TQTKML66X1c1/+Mzz?=
 =?Windows-1252?Q?5BvcMVnUfX96RYllMcLw1ohTfFZWkPzg0CR0UfIKzku5JAjbn2UmSuy/?=
 =?Windows-1252?Q?p5Sb6m2i7I9TCnoMOV8gT65KHAl4nbujaXEc9C+LlzapSR1tamcoi9nT?=
 =?Windows-1252?Q?XTaOcBcvW+kKXopf7RgiLEZYhbLf1mdk8wV3M0VX6kHkuSyudEVzhg96?=
 =?Windows-1252?Q?QmAs8HjvTXhr8yI9y4Lm9hRt3Wa06DZj3+SGgzAE1w5iIe+gb+ASNpn5?=
 =?Windows-1252?Q?3QqJY2NrKJHJPgzy724TjJXbb8wlMm7TUSL2hXyzCgp2Z62qSp7wu3jU?=
 =?Windows-1252?Q?+TqL+SSbwzjd4rxmQpEFuLJWyxmAqXlPsjNozLa+AGD3PIQx8R4Vskdr?=
 =?Windows-1252?Q?enDRByq9Mj72sLkv//uYK0TC435PklAfx5pjbLxjlwlhwhAw1z+B0NEw?=
 =?Windows-1252?Q?dDT/zKfx1eELQzjmkx75rJ7Lm31pOLyjuvSfRDgbBfJ4OYDwVu5PJ3Ip?=
 =?Windows-1252?Q?EzKmtRkbPgUI0Oj2SJhdYaqApcxISEQaCS0NvwK5AIbK7TAU176749Tx?=
 =?Windows-1252?Q?WxJFxMSGFLmBkdeiVxRX0MMM0v2tfUsgkqLpeNeEc/JzYJ9EHUwFwWmC?=
 =?Windows-1252?Q?Pd5iGvsBopEZBfIb+S9VnoG+MEazeA98JmpNzw2Rx0P5AoT+d7iBq3K/?=
 =?Windows-1252?Q?3iZ61LdqhWjyai01pQ5nzRXwNN6ReUS2umaQ1LWlL1sbaQCYFGiKRAEd?=
 =?Windows-1252?Q?GKNUXeG84mhBFuSbyDCvE4oBaLoQRDvsrw88dp/XnIW1xkxq243o6B1+?=
 =?Windows-1252?Q?j3fqB8CN4vE4iQa2XQvRNDGmfPQAYQAgiOHH/GjoWRt11DhsoD7xL15O?=
 =?Windows-1252?Q?pbaVNBGLoIErLNdLv5g/bQ8G5BVX5VLBvY7dczyaVBlzGWZ5Aqjy+ZFS?=
 =?Windows-1252?Q?TX0ZlQ1JSV5FLVwKfKT7Wnsyflp8DKE0B3FeaaZRJNpWLWgMRXQYBukM?=
 =?Windows-1252?Q?37sMjJWFHHDAsDb1iyZGtCdyBHNbdL5IqorR7zaDVGXdAljslL+gPC7X?=
 =?Windows-1252?Q?tjG9tAguBF6yT7vt4PxVyXKM0oNefKQ7uwUvimBNrL5KpvFE8shWVBnS?=
 =?Windows-1252?Q?llOKzNDYXvgTZLDlmJLuRy/MqP7DYuDbTB3VJ42skfWdtejedGT6OgrT?=
 =?Windows-1252?Q?Wm8rm6sieOFsLAxWWlMMiqHI2vs=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d793c021-c323-42c6-269b-08dc83204edb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2024 16:23:16.4396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ET2Ph59IKiN7vdtwXoqRxGdFuMYiIvc+9w4DJjdrxILn/l6dIlb+IqMUNQDUWIvxQS6CC+iK0/ILIAv2txD8sy9v+H5qswG7WQd/4agwhQ2KxfhM3Se1FJR7zlV63XsH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 16:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200209

Hoi,


yes - v10 is the current one; and thanks for getting back with... yet anoth=
er build failure :`-)

i'm still struggling to get a setup to reproduce the issue with that partic=
ular build host... too many layers of MACHINEs and virtualization

but this time i might have a clue/an idea: the error
"
Command 'opkg <snip> list-installed' returned non-zero exit status 255:
"

255 -> usually is a 'foreign architecture' error; e.g. the tests happens to=
 call the opkg from within the core-image-minimal-quemuarm64 instead of the=
 correct one =3D opkg-native

this would also explain why the dpkg and rpm tests succeed - there the corr=
ect sysroot is used, and neither dpkg nor rpm are part of the image running=
 the build; but the ipk test fails because there happens to be already a "w=
rong"/other opkg in PATH

i'll compare other users of runCmd, and dig some more -> expect a v11 :-D


gru=DF
Johannes

________________________________________
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sent: Wednesday, May 29, 2024 12:34
To: SCHNEIDER Johannes
Cc: openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundatio=
n.org; alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH v10 0/3] pkg-database and systemd-sysext imag=
e

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


Hello,

I believe I tested the proper series but still had the failure on
armhost:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3398/ste=
ps/15/logs/stdio

On 22/05/2024 16:11:49+0200, Johannes Schneider via lists.openembedded.org =
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
> changes with v9:
>       tests: fix singular failure in 'oe-selftest-armhost'
>          which was due to the built image not containing a 'kernel-image.=
..', which the gen-pkgdb sanity
>          check expected, but 'packagegroup-core-boot' instead
>
> changes with v10:
>       tests: fix runCmd usage in relation to native-dirs
>          due to which only the use-pkgdbfs-ipk test would fail in a qemu =
run armhost environment

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199756): https://lists.openembedded.org/g/openembedde=
d-core/message/199756
> Mute This Topic: https://lists.openembedded.org/mt/106243260/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

