Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974D8C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 12:53:14 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.195308.1673959985680994197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 04:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VcBSL09W;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id h184so5410820iof.9
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 04:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urhrtXIDecNTs2dj0DLnFa4RtKeDKBdJvX9CqAr2iVk=;
        b=VcBSL09WfWhz9bqQNxWtHr0OcQ8e55v/XRw68U2apE+cumOakkQhTRbEhlAyCJrbCm
         vOEYX0+srQPcA5FsYU/Xv4YjnB/kwpSWCZFD06eklr9PZJOJ/elNgCGPEMpbcSwxZXkY
         kLv6MsCKLZQUcjUPcvknwSKo7LjBJC1kqLvIuzEtkJmafQ7jW20a4LQmYErhbqCPOcR1
         PJmF/FdnU1PDig19vb2Mncpj56i/8Nx2QJiSFySay6slPvn5897aV4+dAMgZR4PgmaWF
         2BOF6yIT/BuVmUNmoWyuRdgR5p0M/ZnC4wTG/t96Y9rmqJ0X7xI25SNZ0uhiIS5ut66d
         crRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urhrtXIDecNTs2dj0DLnFa4RtKeDKBdJvX9CqAr2iVk=;
        b=0KG0DQrv0VisBqBNXLZNIdcqw1rWtX/E6MMLV51NKf15zZNPHDG+KpGPR8xPzHBl8n
         hSwHenTYxVxKTfTYAUF5EMFMvOJvksEdJsZ+EeUxxj1bTo93ls5rvyscWQ8OjGQTMol1
         iG/EKa6ahJY1XfR7VjAN6rGNUgiBbEsJY//H2jFOZpl3C0KJXiBfZWWRKrUvzPrnI68z
         GG/HXyZ1ssAxWtyTS/2u+FU3ILecxjpug4tTN9d5D+HaN4XnAOg8irlFs4G5dpUX4qJL
         Vi4nTzTGoTCY2euDRD20wBGnd/IceGHnQAKbn6AE9y8C9sfiIZjH5fMXxajhpiDx5qzT
         ncsg==
X-Gm-Message-State: AFqh2kpgLfs/YDgwGXI10uaEuMWgnJhFRyPg+ajnXLJrlQD43PejyO/J
	cq0Vw9zdZNJzI/JMQg2kxX8lY10aU0Bvh/x77jc=
X-Google-Smtp-Source: AMrXdXsFHooifF29U1iwUWPCgnouwZKFfcN1V7tpEA+YJOMOPrfUv+m0yeXNfRpGB3Be/KyJh8kye78UIwqno5z84xk=
X-Received: by 2002:a6b:ac07:0:b0:6df:3382:b63a with SMTP id
 v7-20020a6bac07000000b006df3382b63amr200816ioe.182.1673959985095; Tue, 17 Jan
 2023 04:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20230104114555.575278-1-kubiznak@2n.com> <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com> <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com>
In-Reply-To: <6351b082f6b748b7bf01d4313c648861@2n.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 17 Jan 2023 12:52:53 +0000
Message-ID: <CAO5Uq5RTENq4mFXVHf5qpG2+Le2OnM_4C48TAV4c5_t7+NvdAQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_ENABLED
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176035

On Thu, Jan 5, 2023 at 2:13 PM Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wr=
ote:
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

Are you building with `DEBUG_BUILD =3D "1"`? There seem to be a number
of tickets out there for this failure if the optimiser isn't running.

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
> Mute This Topic: https://lists.openembedded.org/mt/96048399/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

