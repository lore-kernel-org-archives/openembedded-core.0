Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41444C54E41
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 09:51:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.72])
 by mx.groups.io with SMTP id smtpd.web11.94571.1709545866775243938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 01:51:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=SDoNcFOm;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.7.72, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIC982RM+rTqDjF/X+Jp9NCLAef3dW3FG5U1j25SmOvgJscL/vgsSDpkv4bh+yCoDvOmmV/Y2d+2mbLIDYYnvpLQIBO1c5tk6544kGWkUGY0E+nCQhjr7eL7EtwLapFq1RlHvW+A8gLPIhKhn7uGtBaHx+DkIDccH/8I33vc+niZ28TT644rgcVYbEQ3iJS1Nw0oYSo9FA4ohgBGWj3wVZdhq2p8asa6Ec6UVmCbyh7lmAaq9VH/8Qzrf+0JF/xwSDAU83CDrxDpEair5bpErAJ0fBDsCrTwzXZcrlHj/Dc+0OGClysSqIhZ9biN53NHrWtn7lwKViR/M+Ek3wOsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqsuCfSCcDfJybo93OIY8xqlG9OYioYEdFauZBZX72w=;
 b=jhh6sDt8Xi41fFfRNBZvO3B8D6jmHHMbzJ2z4TXM2sAG4W1YrlYzRCFVJu7uMn814yXC8q0TBKwiVDQYrhSKkrOL+ZJeSjgLWjMjn6vvwV0UlejAmPy28f+vtUJOpEbTdzknWvM8JaVycAEAvFeu9BVoET9hvQpJhWlexvQz+tQztipDAnzNWdHcC4R8NM/sgXp/Bj/8O4bL3onyfoMlG2wMlA+qRswHi7vjPB4RtfjSbrW+AJl9Zm9DsjMB5JOaYRMOPQDfXVuAYYd414wwwKZXTp6UCnvk8TzGTemQCt87iNrxoErH7UMGMkO3hkTPRkUS3R6bp6L4RXCUJ+VXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqsuCfSCcDfJybo93OIY8xqlG9OYioYEdFauZBZX72w=;
 b=SDoNcFOmcocQZ0LRU/hyZIA1+yApq3Ibd4pDsMf7SsjfvFsd9HVhKAghCspyg+eH51NWQK2TgBdzSMy/OgXhDgps8gcjBjEfPLa6VWLnQbPUmmKaYsvaAwObOJjvpHeU9dUq8tfZ6W52qt0nHypIPKH+IpkMSn5sF+a6FfrPzmQ=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by DBAPR06MB6952.eurprd06.prod.outlook.com (2603:10a6:10:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 09:51:03 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 09:51:02 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 0/3] pkg-database and systemd-sysext image
Thread-Topic: [OE-core] [PATCH v4 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHabfttmtZU5zMqykisJheHsjvc8LEnT+yAgAAG0aY=
Date: Mon, 4 Mar 2024 09:51:02 +0000
Message-ID: 
 <AM8PR06MB7521F8EC8F860B8841CB5B7CBC232@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
 <CANNYZj-=6FAbQFBVpjzw+M6bc9huAYpO5vGnf6nwvxXx7Wc8dg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-=6FAbQFBVpjzw+M6bc9huAYpO5vGnf6nwvxXx7Wc8dg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|DBAPR06MB6952:EE_
x-ms-office365-filtering-correlation-id: 9bc87589-e926-4676-2f70-08dc3c309a3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Jn534QJed6NSv0ISfHePuyO2LXNIAZpXVTGlTsSQEutztLDntFJe6fq+Ve5gh8ffoNEgUkjI9kdqTtRbYAyFZd39NMoGOboH8pnvfkeowZkoRmnQU7itZCbLFoViquJXbOm4wFd3B0s7U73ljN62k8NOUyKVH40MdU77FKdq2xZz8c8TntHHusAQZOe/5U5f2KFYv99cUOdc+QzTqG74lnNFXsPsmasSFTqOG2h1nAsKVvYOBzsaS7LgCPDm6roaddHzoeX/DO+I19yZ0cnZOsE1rdIYflLpvURvTNK8s7aesDd5/YGUY+hDwBu2IvHtQ0XZ4RuL1u2e5RWYZA16iIH/6uY/qAEDPw1ih0jqpvSldoOPvKMpn00Yxe73FJgG976JszASAkQ6lnJmR9mek+gYhklhJ7dIL/kvfTxbusscbmztTIETgDmo5k8A9Ko1huLv8HI5RDiuYaTnkvqFbBkcxMi71Qn3I0E6avlwMGmEvRPHzzujlnH8fIwjAejjkBa6PO7BhwHa91D9x1gFtm6fIH0O84ed8ba9H0cXKIj94VqBe0I4RTe+8ZJaQ0XflEjUMKrCyTIztBbjBIoTSKW/z23VAugvGWqflw7DiFu1snh5gIMgevTfvloX6ug3ElwcZhsgaS4uSr9OruMTHSuvv9ajgZWR/F4w2k8cFJY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?1OMeTgHEXFhuJBMmv655Ee8JPumVgF8Nt0tL1VuFTAoLUKKVwwjnJmqu?=
 =?Windows-1252?Q?gE+wvImudMdpcM3zms627RV/YkRIkCE5cslO7G/Cz4DJRS0axrj6xhsa?=
 =?Windows-1252?Q?HUoO1WTRMPxTj+Fto7XHp1/X9kU5lz5MyCVJkdSH7tjHywpR3CMMxdDj?=
 =?Windows-1252?Q?o3mpFpK73oPpVRu2xmafqCrqARs1/AoPh2DFGs5/8Xaf+Ri+RhyvEEZs?=
 =?Windows-1252?Q?UP1S9uvOnAYpbvk0lHz+N6MnaNj9l8PWlT4j0suxm0gX0Cm9FxRy2qND?=
 =?Windows-1252?Q?ol/JWHfZkh370YngwCsFGUGHAAmBbqqE63CfXCGfjpTT4eCUa3cMAlMT?=
 =?Windows-1252?Q?QWWbu7cLeJPUvik/tQanb5lWYusMbB2fuskL/59+cYHGhyS/R32b86HX?=
 =?Windows-1252?Q?x1SMDgjTiZM/GBVUBZ2zprqxV7QTBya5NvG2xKk2L4uh26RXk3eG/0Dk?=
 =?Windows-1252?Q?er5PFeB2mpKj1JdutX1X4aHRZOtld9IFaQgTDT1Gw7eLaFHmbchIAH2Q?=
 =?Windows-1252?Q?VA+89cNX/dWFnpGwLa7GgEXEebJ+yZ4GdI5z+02kRFeK57NeVdTUa9I6?=
 =?Windows-1252?Q?a7dtr4JF9xRd97kUIkBkckOGmprNxEQbfcV1Oo22YNp2C+aVf8u0FPAL?=
 =?Windows-1252?Q?vUZxrphsMhSxC8WD5Pm5O9gKaI0e5nRiVMNQ9YZ+FR5t+XOgOhMhcFH2?=
 =?Windows-1252?Q?rv+dXacCdeNVgxiLSqUJ9oGNNU623qda4OTGFaQOWzAIbEN50J6gvYKz?=
 =?Windows-1252?Q?2MyTPMD/koEUJyxmS8CML/Kad4/JVtyVOoA1ojhAc5rm1njOvtfA8eG+?=
 =?Windows-1252?Q?9Ut7rWXZy8tGjYMNhqsvLVi1+d/EBsukZozSmhwC56/ENzGTXaREwkza?=
 =?Windows-1252?Q?7fZkovQ4pQsLppZ5loP/OUvFQZztaaYIobL9qCd1+IseRXfHuw7I3PJR?=
 =?Windows-1252?Q?XmrxAe3yr3sDOJh7E42VTpo8IRiJTDCHAyCVlAnOnmQn8fDohm/0wm1R?=
 =?Windows-1252?Q?uLbjf7DIfPR36rCUG8pNCb3+7uKfikp27X1qh0BoJgnwJpbbbw0dMKKe?=
 =?Windows-1252?Q?ZuLaCVg8Nbi6X3NuTMtOfaP9bWWBJTzRuXDV28qM4v659RL3WuqLf7Jw?=
 =?Windows-1252?Q?krtFVXCNdkGU2aqQrMAozhvitTVy/M6WcEhw8U1UHcF3VYhpyGMKmsQS?=
 =?Windows-1252?Q?NQhlW4DOOh7uyeL9GLRaIRBBKvRWfHYcZ8iyH3AtLB/TESIUeLIycHWx?=
 =?Windows-1252?Q?Wmr6fOkKc2bbuC4rGkg3NhMElhFDV7qT9i1U3f5JLcleYTM7ldDLM8iU?=
 =?Windows-1252?Q?GUszGYHIvVjPfwS/s86d58j32IuOkhYtj9fZUlebU3bTXstb+mvn3byq?=
 =?Windows-1252?Q?kWax+2pHZfq1jZ33yo9ZfVXTm9O16oe1y/BbJgcZ8fyqJ54O9QkzRuKi?=
 =?Windows-1252?Q?gR4i7hGNEKKh+cgXS+XOah/8OfbK5JUQPblfyN45Uq8xXB8U5vi1To4q?=
 =?Windows-1252?Q?v5KDV7I5BhJ0Nu8gwYmBjI3sn5NxfKx4sGpQwx2hrARZnSOUKJj3lCVf?=
 =?Windows-1252?Q?2eyB6pD4Viy5wn4q6o0brsClSMvgkF7O2r8QHGqmDy2R3gzjvGQatoSE?=
 =?Windows-1252?Q?6oX35m9X9fudyf8VJYVGw8CGeb9bRaPJPJx8YyZkOBBsS4kk8ZiS78IG?=
 =?Windows-1252?Q?2r4NAR2163KKj1i5CMBJQqeLjCooBfZzCNUgNb6cXpTTCau+sRLIX9nZ?=
 =?Windows-1252?Q?wGAqL8yN/maMTErb1Kw=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc87589-e926-4676-2f70-08dc3c309a3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 09:51:02.3483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FyAXkIVHUQKRyQByem+65lqhezd9UihdByCao0AF9lXc4hfh8B+sMaEQG7u0ZTxjc75NFg7QFi28cdzuHebDqPEJfgIXETcMRlB8X1W4LnsxCOXHC2HGB2INoH8McJwA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6952
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 09:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196593

Hoi Alex,


thanks for the heads up - i'll patiently wait then :-)


gru=DF
Johannes

________________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Monday, March 4, 2024 10:25
To: SCHNEIDER Johannes
Cc: openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundatio=
n.org
Subject: Re: [OE-core] [PATCH v4 0/3] pkg-database and systemd-sysext image

[You don't often get email from alex.kanavin@gmail.com. Learn why this is i=
mportant at https://aka.ms/LearnAboutSenderIdentification ]

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


There is a feature freeze now, so this might have to wait for after that.

Alex

On Mon, 4 Mar 2024 at 07:16, Johannes Schneider via
lists.openembedded.org
<johannes.schneider=3Dleica-geosystems.com@lists.openembedded.org>
wrote:
>
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
>         incorporate review suggestions for simplification
>         add task dependency handling
>         add oe-selftest for the pkgdb handling
>         add variable documentation and
>         some more comments, and examples in the commit-msg
>
> changes with v4;
>         rebase onto 'master' =3D> no functional changes
>         fixed patchtest findings
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196588): https://lists.openembedded.org/g/openembedde=
d-core/message/196588
> Mute This Topic: https://lists.openembedded.org/mt/104717642/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

