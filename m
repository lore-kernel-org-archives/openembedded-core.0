Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB96C678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 09:31:53 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.10663.1678181512962772116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 01:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qeH3ptI6;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id by8so12490062ljb.7
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 01:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678181511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MvDB0ez9YbGyXOdnRgrIY+zCmZN1Kd8L9Q1vNCux5c=;
        b=qeH3ptI63MELIGhDsgnj3Q5/dV7+qHJWFT/SNQGqn8+xAd6qKNlF0Xw77aPZ1I+ccN
         SyJYb+TdjwuN2LJs8zQAgAD2kMdZ0O37GaiHMrc4n0xTPam8bPMBzWaKx/vyHzePm/mu
         lzZF6SZAOZQGTtw5AE9JtG/VLI9F9S7e+M5uHHKsLjzc+n7M4RMrzOHgAaDgKrwDGDbc
         V0RK0Zk98ILD505yL5g7KAc4pGkm+gJGwNZ8tOt5e/9V32GLwFuB26OD3f8NQc0op3/E
         J3Ap0N3U5nMxVvib9pARjJ9v7SWKI14lWoRQlNgw5HWtv8t3eciM7TA5SfFnu08dGvfG
         9Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678181511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MvDB0ez9YbGyXOdnRgrIY+zCmZN1Kd8L9Q1vNCux5c=;
        b=70QV4Jaky2kCnwG1jhDdrCpZk1VBNxrwpYsUrHxPm99+/8fHFPRLAHRDhRRtJGgFc/
         0b7F8RHjSr8nhZYgMzfZ8D9rvaAGAmZ1PMWaolpzVkGjQzP3W1wtWtykZQxrh7aKjCRd
         PmmOZrNVUz+83V6Mo2LFMQovpJFrGVp5Y19332SHrQ9MC5O1nQtY9dS8ozdzpHC2eRaU
         3LwNly+WfB3PPh7Oez/16SnmqXzy5b9vOC+QkX4AV+uUHjlaRYheLwq1N92jnt8Pkti4
         d3reCNW9WS3Jn15yZInBcrTXb6sYTRtqc2TKEvSdcuznHPkZvgxv2e0Sx+42JRNa1/uB
         tWEg==
X-Gm-Message-State: AO0yUKX10eWfObRlVuBSvcvP+VH49rOClgbTp4IO5oGJyiiL0ar5JSmH
	Ge2853tkq8OlT5kYkjEp6NZu8c+/vxCBW41Qipo=
X-Google-Smtp-Source: AK7set/8gCtF0xkwz7n5+N8KjoyXPPqarqJnDSk3Yh0KI355qjdLJvnDQhFgAjkjnl2HKxHYQG86i+zaa9tdEfZLHp8=
X-Received: by 2002:a05:651c:329:b0:295:a32a:3664 with SMTP id
 b9-20020a05651c032900b00295a32a3664mr4044469ljp.5.1678181510952; Tue, 07 Mar
 2023 01:31:50 -0800 (PST)
MIME-Version: 1.0
References: <17448D1AD5EE07BA.28744@lists.openembedded.org> <DB4PR02MB10030B5C7A26DB7E9DA54B42AE2B79@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: <DB4PR02MB10030B5C7A26DB7E9DA54B42AE2B79@DB4PR02MB10030.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Mar 2023 10:31:39 +0100
Message-ID: <CANNYZj-CuEp++Fvvt7s7mTd5R3uABk4wv9sYJGcMpe7Gm3EGsw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] graphene: remove introspection from PACKAGECONFIG
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 09:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178096

Has been merged long time ago. Pls rebase to master, then ask.

Alex

On Tue, 7 Mar 2023 at 10:23, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wrot=
e:
>
> Could anyone have a look at this patch, please?
>
> Thank you,
> Petr
>
> ________________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Petr Kubiz=C5=88=C3=A1k - 2N <Kubiznak@2n.com=
>
> Sent: Friday, February 17, 2023 8:47 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Petr Kubiz=C5=88=C3=A1k - 2N
> Subject: [OE-core][PATCH] graphene: remove introspection from PACKAGECONF=
IG
>
> Assignment of "introspection" as default PACKAGECONFIG value does not
> reflect gobject-introspection being globally enabled or disabled.
> As a result, graphene compilation used to fail when g-i was disabled.
>
> Use standard means to enable or disable introspection based on machine
> and distro features, as implemented by gobject-introspection class.
>
> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/recipes-graphics/graphene/graphene_1.10.8.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
> index 75c8258d99..120ee80b17 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -9,14 +9,15 @@ inherit gnomebase gobject-introspection gtk-doc
>
>  SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c=
25ec859da31dfde2928f279a"
>
> -# gtk4 & mutter 41.0 requires graphene build with introspection
>  # Disable neon support by default on ARM-32 platforms because of the
>  # following upstream bug: https://github.com/ebassi/graphene/issues/215
> -PACKAGECONFIG ?=3D "introspection ${@bb.utils.contains('TUNE_FEATURES', =
'aarch64', 'neon', '', d)}"
> +PACKAGECONFIG ?=3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'ne=
on', '', d)}"
>
> -PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospect=
ion=3Ddisabled,"
>  PACKAGECONFIG[neon] =3D "-Darm_neon=3Dtrue,-Darm_neon=3Dfalse,"
>
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +
>  GTKDOC_MESON_OPTION =3D "gtk_doc"
>
>  EXTRA_OEMESON =3D "-Dinstalled_tests=3Dfalse"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178095): https://lists.openembedded.org/g/openembedde=
d-core/message/178095
> Mute This Topic: https://lists.openembedded.org/mt/97024165/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

