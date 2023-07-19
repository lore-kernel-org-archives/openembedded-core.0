Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41066C001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 17:44:36 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.1813.1689788674306925011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 10:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lG07knS4;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7835e5fa459so307257639f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689788673; x=1692380673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKca373CL0kqSZVRH2yv/ctB43jLE7wCi/HQwi4lAjo=;
        b=lG07knS4wg3ob11S47s066ttFn7i/osw7XmepUnUeubJqWXs5pYOop3iHfniVV90FR
         mncfqY8MHHJRES1+Lb2GCXhYsgnCfULwFuJ8VFJk1D8GMM2U79IpeJCI8e4/3zuJucc6
         8SkAM2wiRUteOuY17GGeo9sVL7Sv/QdqtTwhEx5U7sAF7NvBu6JsyQM6huv83VH60M3V
         4P+gJk9yeuBwp7QQcISC4HqJAal9l5mxSVPGzSqz4zbkdMHDwoqtPEt29agZ6F/sBNfZ
         hLXhFr05qK8hShC8UBmEjkriL1faEf8qtLQA0sBBfTsIoPXZYdZ5Kft5mi6UT0SmDrnl
         ybzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689788673; x=1692380673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKca373CL0kqSZVRH2yv/ctB43jLE7wCi/HQwi4lAjo=;
        b=iAEkUv5dQGJ70EAqrILvT9Cdt4WfvUAYp8h4HdHUqWtsxHGvbfW4LzFazsXmiz22aC
         vuVhNBtLKWnHRXxLwH1qhS/RCJBVLZOTTrvCkvQwrAU/GxgBnBXelPDf1mfBgu8y8aVV
         Hrw1JyVOhIZeFnsVwXDKqG6TYhdmNyOLNGjBvGM24p/xT6o//XAsf/RExKifqeYPXE1X
         b/UDBTddARLu2tqM49ILNTDIqsjJxvCe4qglZH3D8e1TA3qBOmCuXjLE2HmBRpvp2E1s
         es51kfQbvRUcUo1m83k1JtetyXk+o2ptabVt+5O1oVO1SOVUaQoOfyzKovhweZknykGb
         aZuQ==
X-Gm-Message-State: ABy/qLauaByQr/EYzQu7NgPNsTW41f3ROcHl8QAHmZogilDNY8WjoGPs
	RcNFl34ywj+Ta4Z5OIFFjWiwA1UNQpbCuW76SZlyuQnq8n0=
X-Google-Smtp-Source: APBJJlEBokyo6p1jS8hXXL7YD7Sg5VltdBI3YIlTTjX/IbxWk79L7QrzcXd2FNrmTkOnH4XCJkYGGLttRblxad8ImGU=
X-Received: by 2002:a5e:c812:0:b0:780:d338:5373 with SMTP id
 y18-20020a5ec812000000b00780d3385373mr77911iol.15.1689788673420; Wed, 19 Jul
 2023 10:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jul 2023 13:44:22 -0400
Message-ID: <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
Subject: Re: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
To: Petr Gotthard <petr.gotthard@advantech.cz>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 17:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184591

On Wed, Jul 19, 2023 at 1:32=E2=80=AFPM Petr Gotthard
<petr.gotthard@advantech.cz> wrote:
>
> Hello,
> the out-of-tree kernel modules built with latest master have broken "verm=
agic" and thus cannot be loaded.
>
> The patch https://git.yoctoproject.org/poky/commit/?id=3Dbb0f9e87700aa40e=
c8db880ede3c018c1d055786
> added to meta/classes-recipe/kernel-arch.bbclass:
>         export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
> so when somebody sets the KERNEL_LOCALVERSION, the kernel is build with t=
his suffix. So far so good.
>
> The problem is that the "make-mod-scripts" doesn't know the KERNEL_LOCALV=
ERSION, so it does not set the LOCALVERSION.
> When the LOCALVERSION is not set, one suffix used to build the kernel is =
missing, the module "vermagic" doesn't match the kernel and the out-of-tree=
 modules fail to load.
> For example, after building the kernel the "kernel-build-artifacts/includ=
e/generated/utsrelease.h" contains "6.1.33-g8f7f371be2", however after runn=
ing "make-mod-scripts" it's only "6.1.33".
>

Hmm.

I explicitly tested this scenario to make sure it worked, since you
run into the same issue when building modules on-target.

make-mod-scripts is running out of the same SCM as the main kernel
build, so it should match, and did in my testing (otherwise
lttng-modules wouldn't work).

Can you send the exact steps, which kernel recipe you are using, etc.
That way I can reproduce the problem locally.

Bruce


> One solution to this would be to store the KERNEL_LOCALVERSION somewhere =
and then restore it by the "make-mod-scripts" to make sure the build enviro=
nment is initialized properly. I am just not sure where is the right storag=
e for this.
>
>
> Petr
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184590): https://lists.openembedded.org/g/openembedde=
d-core/message/184590
> Mute This Topic: https://lists.openembedded.org/mt/100240236/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

