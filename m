Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F80C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 14:17:31 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.13724.1672928250251583645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 06:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FWQtfMMk;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id bn6so28886347ljb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzFiNxIM8yJUeJIKIVgVTdKvSb1PZFl+RRqY47N2Pe4=;
        b=FWQtfMMkS+/fULx6ic/hgr9hXo4fsXxJ5Gc+XytwU2pAgMYVjK21MVWzQLJ0w7139T
         ozqm3iZa5Mo14LktIxBNL7Y3+Zek1K0mrQi5pDc3htFBHRw+eKvtgnqPSoJ5/MU/Gjjn
         OTtXglyB9atmh0ZxYG1m69x4fCNeUjgZXE0NixALZoLYbt0Zotk0R6F0Ql1WmnN9AdhX
         shjCsGPUD/8RjDe4ra/ZH6H1roI2ZVVivU5zb2dS/kM1AmYrGf829F5HQr8pPtl7uKn6
         2ptW3aMNjN6V40JZIGXCPPnf+Xk2YmZuT8pf/WeWKIMuZ9m9wV60XSmFMHX3DRZEiK4S
         1/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzFiNxIM8yJUeJIKIVgVTdKvSb1PZFl+RRqY47N2Pe4=;
        b=KmPmU25dCm/PpEmSU0+dIPJ4x3C2Dj39os7JN6jF15A5FSeB3bS1UBx20BNsg3FLE7
         tiOfkYE2/zAU3ood3r85IfnD1CF81/3WmfyKZin5TmMyD3MotgLm6JGVyk1uj/eg/936
         24XQTI5eD0MkAX4JI+sJI9qpvrtNf8Na/2qpcRRKPL3WL9dWkvGHmV2toRT2vrqJF+UI
         VFxQrcoyQvOojZgx5MTD4/PeHJY5deG+qNTbVBqLYxwxiAQaq3uJT6qc+oq03QGNk04l
         qwpFiACe33KGzAYM4L/UCLL3R7H5NlAHKdOIZGD7PWBfwQUYgcVgocRV16AtfyVWr8M1
         Ra8w==
X-Gm-Message-State: AFqh2kpeKmqAwhBfhPoNPJQ0Ys/jCtzQ8yDQBwF13AU112m1GHQCSh2F
	LFMJxLKw5eEgtPpOhlZ/1WXt3/FMY21IXQVDFYU=
X-Google-Smtp-Source: AMrXdXu6NGo526jk3u1x8Moq18K8DRWSYaaLMl5efjrNoKRuOxTZ6RZl3j2na5ZJOhpvnMWcdKKc5XY2J3Zfds0kAhI=
X-Received: by 2002:a2e:2246:0:b0:279:bf32:34dd with SMTP id
 i67-20020a2e2246000000b00279bf3234ddmr4289265lji.31.1672928248148; Thu, 05
 Jan 2023 06:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20230104114555.575278-1-kubiznak@2n.com> <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com> <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com>
In-Reply-To: <6351b082f6b748b7bf01d4313c648861@2n.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Jan 2023 15:17:16 +0100
Message-ID: <CANNYZj9sEYON_ymHC8-8hyu8kq4jspCHDEF2TyxU1qCcOu3+kQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_ENABLED
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 14:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175530

We do run world on every master tip, so yes it should succeed. It
doesn't seem to be related to disabling introspection, but you might
want to retry with it enabled to be sure.

If target rust continues to fail no matter what you try, then 'bitbake
-k world' will continue building what it can when fails occur.

Alex

On Thu, 5 Jan 2023 at 15:13, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wrot=
e:
>
> Is the `bitbake world` command guaranteed to succeed for every commit in =
the repository? In my case, I end up with failures even with _default_ setu=
p. My point is whether this has to be an issue on my machine (e.g. native t=
ools?), or I should just try a different commit.
>
>
> Build Configuration:
> BB_VERSION           =3D "2.2.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.1"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "HEAD:2c6f0b9228b47459dd1b67d578792cd017006128"
> ...
> ERROR: rust-1.66.0-r0 do_compile: ExecutionError('/home/kubiznak/projects=
/poky/builds/test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/run.d=
o_compile.1080378', 1, None, None)
> ERROR: Logfile of failure stored in: /home/kubiznak/projects/poky/builds/=
test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/log.do_compile.108=
0378
> NOTE: recipe rust-1.66.0-r0: task do_compile: Failed
> ERROR: Task (/home/kubiznak/projects/poky/meta/recipes-devtools/rust/rust=
_1.66.0.bb:do_compile) failed with exit code '1'
>
> The first error in rust log:
>
> error: /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core2-64-poky=
-linux/rust/1.66.0-r0/rustc-1.66.0-src/build/x86_64-unknown-linux-gnu/stage=
1-rustc/release/deps/libunic_langid_macros_impl-09018f99e8b09dcb.so: undefi=
ned symbol: _Ungind_Resume
>  --> /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core2-64-poky-l=
inux/rust/1.66.0-r0/rustc-1.66.0-src/vendor/unic-langid-macros/src/lib.rs:5=
:9
>   |
> 5 | pub use unic_langid_macros_impl::langid;
>   |         ^^^^^^^^^^^^^^^^^^^^^^^
>
> Full logs attached.
>
>
> Petr
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Wednesday, January 4, 2023 1:36:27 PM
> To: Petr Kubiz=C5=88=C3=A1k - 2N
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DAT=
A_ENABLED
>
> On Wed, 4 Jan 2023 at 13:24, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wr=
ote:
> > Yes, that's exactly the reason. I'm particularly concerned about depend=
ency on glib, but other dependencies are unnecessary, too.
> >
> >
> > This change was sufficient to remove the dependency from the target. I =
am not aware of potential consequences of removing the -native dependencies=
, but if you think it should also be done, I'm happy to update the patch. P=
lease let me know.
>
> I'd suggest that you remove all three, then set up a plain poky master
> build with gobject-introspection-data disabled, and issue bitbake
> world.
>
> Component upstreams generally only test the gi-enabled configuration,
> so this may reveal incorrect upstream logic when g-i is disabled.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175529): https://lists.openembedded.org/g/openembedde=
d-core/message/175529
> Mute This Topic: https://lists.openembedded.org/mt/96048399/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

