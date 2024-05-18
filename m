Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF28C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 06:30:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.54])
 by mx.groups.io with SMTP id smtpd.web10.14066.1716013848379201135
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 23:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=bfpr7l95;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.7.54, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCNJ2iqvv7MnLf05YmTGNWMHCCWAEiN5EOmm4WF9KF5LPNxmDizvRN/wEdoc4y+pBQLQNWEx8CX9Zk50jAM2L5+DGfP/S8QknA24wG9f/hpEuiSrhgUfWfX5EqebFlla+Jn4Eacj/f5BsX93aAQ9wcLFOmsCIMWWTYlvIeJAlC53grd077GuZF2UH9RBPZe06OKekn4l0lBCcZO70jKgCjEhve/XQyBq+xgONkZ5nvXCbZ0FBCcFzn5ldmtsHav5RmAO4Nsn+nUutyVoTKr7fXElWL0ta0QVpN3V7oNDzuSEaZICstStHCIKDQR7NiZPCSwrSHFrm/RCpYP93D6Xgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFnO/IMSZpMID8Me0gSFatOqubGYvqQx6NTSm8QVW78=;
 b=gfyc9wffc2uV3TYj76NS46b8y83yLJLtGH/0/F8eaB/LFYmh2boTQsdlu7hJ2fW47nPFDzPAwNGBBfkRRDq6s+ABNst8EABRcV17KSsL18Ie5UyCMA6K8j1Axg2bRW1YeCvE2GTRxsFF2gA8X6IFR54Hdy6PtIM/6xWC5PVMUWEGpxjDCxuhQ/oJ4vGPzNybqejKWJIyrBBH8UjuU2FBFqPcVfYCkj43D5TaGN2nc9YwlwDOKM7EJiJdRPtjekc452kAzcE+8JKFvq9wdfU3T9TytDW/SzE5ZTaqEbl3n5VphxR1a0nsuHH3GZ6B3wXa+sNjY/5FseUbdWvLc+xzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFnO/IMSZpMID8Me0gSFatOqubGYvqQx6NTSm8QVW78=;
 b=bfpr7l95RikTWD7Nrf2b9na9TRgM+IRJlBpP6TahbKXwy5AX9FnF3eKBxYJyWfTjvVWdjwNqVdLjG/+XEtsohcvKXtxMkSnYTSe8wsZy+ZG5acCsWilcmeap0nwYuB7EfBdXJMchj137bcDu3Rz6YmOjJIzVUSDZIGDzknrQ8js=
Received: from PAXPR06MB7534.eurprd06.prod.outlook.com (2603:10a6:102:153::11)
 by AM9PR06MB7332.eurprd06.prod.outlook.com (2603:10a6:20b:2cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Sat, 18 May
 2024 06:30:45 +0000
Received: from PAXPR06MB7534.eurprd06.prod.outlook.com
 ([fe80::9a7e:68eb:fb81:d90d]) by PAXPR06MB7534.eurprd06.prod.outlook.com
 ([fe80::9a7e:68eb:fb81:d90d%4]) with mapi id 15.20.7587.030; Sat, 18 May 2024
 06:30:44 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v9 0/3] pkg-database and systemd-sysext image
Thread-Topic: [OE-core] [PATCH v9 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHapxgicmcVZa8gmEij+HAHzL5NMbGbwx2AgADHudQ=
Date: Sat, 18 May 2024 06:30:44 +0000
Message-ID: 
 <PAXPR06MB753497DD9AA695D02CCC14ACBCEF2@PAXPR06MB7534.eurprd06.prod.outlook.com>
References: <20240515223500.3464486-1-johannes.schneider@leica-geosystems.com>
 <20240517183303e2ef2f5d@mail.local>
In-Reply-To: <20240517183303e2ef2f5d@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB7534:EE_|AM9PR06MB7332:EE_
x-ms-office365-filtering-correlation-id: e5f4cfcd-cf68-43d7-fa31-08dc77040bf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?JppO9ozAaXyUIy0qxHapxWJ1rc36Z+L2CvbqZDqa6Wu1uKkLoAp51xsj?=
 =?Windows-1252?Q?CMOmzMKJTsHCfv1g/pAWm+gyaymgt/p+QoBvPxxtVb8UYjrVSlcrkLX2?=
 =?Windows-1252?Q?emkVOLJ4TVNMlAGw3c9bXg4QfSl27I2ihoB09JogLHU6Dc8mR/aMnWB5?=
 =?Windows-1252?Q?xeMpFSBCkdcZhwHj/os4XnE+DpZYahvPw2H7XMAeF5arfpWooJz5gLra?=
 =?Windows-1252?Q?hmZ/MihXfSRKlptKuade2LWGPlGiLioH4uG9Nx0A1BckKpVhdXgldHJ/?=
 =?Windows-1252?Q?3lnk5XRLKIrZfkmUABaXU2uzIfhT8ieNxv7W/jD7AcPnXklu8J/gg5Ao?=
 =?Windows-1252?Q?vU9P9vhlogyoehVAiqsF/8mZS8jO5C3iT2Z7MMj8fsmrKRgVNn+IcGr3?=
 =?Windows-1252?Q?PS3fcAFbCE8L2QhooNGNnz7TdhIvr/FDs0sBRk6Ok+EBiiCOUcPFd+1h?=
 =?Windows-1252?Q?qfV1GvRCeGHlIu9Dtzw+HMRsC1YIiPs7KLxmAYCE+dXvQy28g0GkH2vZ?=
 =?Windows-1252?Q?Oj91wiwogauBLl46d2l/bZfwRZh7Zbnc9OYLgjElXzX6TKlgMRuozhZm?=
 =?Windows-1252?Q?CslP2r6TfGNAxnbykjEQzbKHvFnfbUOW96V3z3rATNYoqsxUHL5m8ZZi?=
 =?Windows-1252?Q?tLHXvaXe4CxkHcjDg7u2vcdvmYAwI7zvCOyUdELvLz9EPn/N9LrymsZe?=
 =?Windows-1252?Q?1O4C/vl7n2sU7v7su4LzpXk7De3Fxv4F3Da1EsQMwUaWMbSmh0XiOWtJ?=
 =?Windows-1252?Q?MO8emovUslTlhUF85/X00mLARN6gzEwuQcwp80cB1GrDl6hsVMU4j9fT?=
 =?Windows-1252?Q?cCtIo3LUC6Ee7gQ22e9pK0CjbGrXo9aR1RdedASjskZ/U3BJT4TAl/F7?=
 =?Windows-1252?Q?a7LkbMaZyDGm4OVDYLxnn1sP4CK9hnJNgwgfZTA15gT161Ff/YXGnIps?=
 =?Windows-1252?Q?ClabeiSmRfo3KpVYULU3EVFGIH+/6OAlI//DgtPLn0Syo2W5ECAMSKU+?=
 =?Windows-1252?Q?xi509wuAVlqpOqwUaueN28twEAl7Q2gUjSkthxAxggLqgq+ebvTeBhU5?=
 =?Windows-1252?Q?+HWwIJTCsR9t9cMEEN3MeN+wEUse6wkbBBoEKlXkG+OuzojdFX/rWapH?=
 =?Windows-1252?Q?7x8WEb/gaiEri4ZIluEqlx8mTp+Aw9XkZNJ2U4+ZzVm2x9xM7tdcvw5w?=
 =?Windows-1252?Q?XdBhAdhBd9nS7NOaATusq2pO8ISwfUO6OA13N4ctuXtUUNw2LqaDccHe?=
 =?Windows-1252?Q?/h8N4OhNE6HinHfPlxJKLFMQ0imV6GDlK7orvCgZbzMEyq1Pea/ul/oV?=
 =?Windows-1252?Q?Kgfm4YpJChtA9VPiLKE+5GU61fkk4bTePPZqn/D7w58ptsOXjF98Dw+D?=
 =?Windows-1252?Q?Y38oNRCh6hP9tA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB7534.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?wX900JCaL5+pA6rSMKyLa5NmTmhM4Y3FxvhqHnEseL2oOzZbhuGalS2R?=
 =?Windows-1252?Q?1l+osqVZ5jTG6qIV09bSL8U2V55qB++WmpAdDcNoQ1lhHInSUlHO9CUd?=
 =?Windows-1252?Q?P/+A1iyChOip0kCj38NbBrLqYxB2/YFEN5uY0J2V9uKGuIOzLkBJaZ3H?=
 =?Windows-1252?Q?ndDt65IDMQxR26lfBZMKEXgN2/l3PfBjRvZkVbp/4lqZK5+C2ho0SqAV?=
 =?Windows-1252?Q?PdwBEp9R/wRzwJ5I9GUaWPSU77NW2BRcrSll7JnylGLsJNQ264zVcddd?=
 =?Windows-1252?Q?sY6Tp2kG2jCZdPXXIkee0foIPR0pV9UqQyx8dBCbH3vDJkpiFKXNlV8r?=
 =?Windows-1252?Q?RFVSEYy8cnGlTup9TZVvTymMHsTe22ie5/mKpYRRtZsstgnoFj1zCate?=
 =?Windows-1252?Q?uOzJYt7Fv7yduQraONSLPqhzV+u4nIcxi9a46KwZV3uImK35AyyCQwzz?=
 =?Windows-1252?Q?CqKHtsDMs3AB1IHB8mVxXbk1CXA1ehmTT+5vCCv0HX+a/vr0+03v0JbV?=
 =?Windows-1252?Q?fGIN9W0H3NlcSnZ9MDabC0/T4gk6KvQnzXxAAWWoJNOaG1DA/nWH2vhT?=
 =?Windows-1252?Q?iCnF9QBNe2x6HpbInTp6NlQfGxaJRvlvDrDkLWKQQpLB5kEJ6fQobuAS?=
 =?Windows-1252?Q?+n4fowexAjPJAoxInLsymdtE7W/0DEdEANNAc9VZjQtWLEnmZaQmwynw?=
 =?Windows-1252?Q?cl3P94LBGjqQ9GWhacmW+f4SO7aMNFz6lVeaPMTK/1bni8fLi/GNEmkS?=
 =?Windows-1252?Q?E+Ew7KMpATM0wx7Wr4AuM7XaX416tmukYWarUapilMvuO27birS3Lhk5?=
 =?Windows-1252?Q?6IfFs+Nu9wrRtJHlXMjx3balR3HtxVTP+W/6EK5HHdj8ZeMUMpZ7+v82?=
 =?Windows-1252?Q?Mi7y3S+6KTohBGjA3T0q67Bu5ZFN04A7++T3TFlKMyHNgX1F8Wi2DkFL?=
 =?Windows-1252?Q?TOzte8+Jz9h3nreNOQJ65MWbwwAibEg7MLVZM+bj+xTBvbQC+hgiPieW?=
 =?Windows-1252?Q?LMEZ9H6+n+xwxagBMbOJ9g1CkeLMibnPPvM6iGJoHHDHvn2nxeY3GfZh?=
 =?Windows-1252?Q?F8w/mj1zFHerEajNQcVijSfW4698t67IW7qhGdKnGoRSmYQxTfqBGpnm?=
 =?Windows-1252?Q?Z3QK7pdu7F6jhhuV+QO8eoX3Y0B28RZbpR3fNw61iKOMYe+lDLm+PT8d?=
 =?Windows-1252?Q?TXqCDMwYGRfCGHyVrO5jqBuKRMK1JG+q37KLtVzSnvZfjtzJ8YJhCpF6?=
 =?Windows-1252?Q?W05ubFYAQUidFlRCB4PZQTgh5ILtZZ39zV8nySbsRaStKpVoz+Tjm0bs?=
 =?Windows-1252?Q?VSWG7GUDAF0d0INwUsHzfUgnjw/YxcJmfhGctmBU3XkGAEq8NhNVs5Yz?=
 =?Windows-1252?Q?Q47Jxr5OiTGg0lgezG70BjRcgwVcIL2Prjwgahi7/Rk3JTEldoRV/Alc?=
 =?Windows-1252?Q?vJYdSyWeT4loPWnFbmqZ70e9rnCbNfx57vzEBB0tRXML1+bFqsddJZdZ?=
 =?Windows-1252?Q?PevFDkLXdWstwEJr93nO7SdCGDY9R4GGh45DRXVgqXA3G73paLK/L/Lm?=
 =?Windows-1252?Q?NimHEJY4AgoIb4gsO0Eyj/sEDrm+pJnblNFjpopgr1y895HtwUTPjcb/?=
 =?Windows-1252?Q?s5HOeafN4n0vRcLfmwGvks3Y+A71pdCFU+YAXo7/Muxwhapny35yaHvR?=
 =?Windows-1252?Q?mgDEMnJoNpOEXcXubZ6kOhuUXNJjTmj3SMDZMlh6pSXZK+RmgYwEjgmL?=
 =?Windows-1252?Q?ssbEXe7Fh/JWSvECArK4Ay/tKSkQKPc42JNXhl9CFkOTIYg8Hieidf6t?=
 =?Windows-1252?Q?GPETuK6C6+XcuvgqaY/m3QFCfXY=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB7534.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f4cfcd-cf68-43d7-fa31-08dc77040bf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2024 06:30:44.3675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQSZ9PNWNIqSiwfU2s4lxG03oyC1VHo0XZvt1uP/lFfDecAHtP3Lz67qvryfvE7Y9UcPcLC62x6mzLFHXQoNC+pgEhwo4QDDhSmSKwk94BT8BRxv75qUgayeGAtZQ4tc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7332
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 06:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199529

Hoi Alexandre,


is there a way to get more output out of the autobuilder?
the logs only tell "that" the test failed, not "why" =3D which assertion wa=
s missed

if i run the test locally with the differing variables set like this:
#> SDKMACHINE=3Daarch64 MACHINE=3Dqemuarm64 oe-selftest --verbose -r imagef=
eatures.ImageFeatures.test_image_gen_pkgdbfs_ipk

it succeeds :-S
... ideas/thoughts?


gru=DF
Johannes

________________________________________
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sent: Friday, May 17, 2024 20:33
To: SCHNEIDER Johannes
Cc: openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundatio=
n.org; alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH v9 0/3] pkg-database and systemd-sysext image

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


Hello,

deb and rpm seem successful but ipk still fails:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3335/ste=
ps/14/logs/stdio

On 16/05/2024 00:34:57+0200, Johannes Schneider via lists.openembedded.org =
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199430): https://lists.openembedded.org/g/openembedde=
d-core/message/199430
> Mute This Topic: https://lists.openembedded.org/mt/106124365/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

