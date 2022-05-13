Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD195C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 15:42:32 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.9963.1652456551185189532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 08:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BHgN6OXU;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id d19so15199570lfj.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N3vz5bcEnn9gowGI/i5S6rU+Al/pqIdQJiZP5jc+1LU=;
        b=BHgN6OXUeLyA/Ky9sp7v86A7WyH5QXXUDFvqQxQ97ovxlBWzx1o/aiIlENeoy+Y/+S
         PwhD2oBZYi9Uv3TQMczXaFILNSTWX8ISS1/OvHaj6jpIzz3wRotTNLWxDBx8a9ckXauh
         BqKq2KQ43s/cmcNLCgt0DlvDO3ekbUwGfwSrtguDYWsHUPd+Pxi/Nyv/g19jDAB//Wkj
         pefielQHtl3y2YdWpPfy9/fUhhghacjmYkgdAZQ485YVWtcOxft+rfqzjR0vfIXTMWiH
         ap4oQyUbsrPwa2uvV9NneNIV5HSzZcT1qZ0NXflJEOrtQxP5qijNlgRsf7CoMcjZ4wDy
         gbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N3vz5bcEnn9gowGI/i5S6rU+Al/pqIdQJiZP5jc+1LU=;
        b=vJzI+J4/X+PGcP92qISQkg/DwqG071ngKE0U9nTRtk1SZ8kSKEYDkq/uRgPwCpwqCm
         p1XMeOchk9KEPk0YDjXIeKn2acI7wwc6zTu5UKI6qIcTYpoddAZ4NxvitAEo+36OVm1I
         R7uc+w7SwCKM6fAwMMh8U2vsjFgCEcqXeSbI5D4ISndtK75PLgYV4s0Wc12j8opecqhq
         T9LBH7I35hiOUsOt3NZnzhQqBSGUG3KA3rcC1ZvwCRXRFzGm8oHjhm+RZX9OUEMvRCbR
         LHRd+tBraZ0bnfrWwT2SHvjRAHDGzGYuOpPP4xNyQlbsA/fn+l0ecknw0Xqvy34mRfWD
         Xmww==
X-Gm-Message-State: AOAM532BtiehD/WYpMesf1VHg/mtudeATYGcrZjpB7fhxBXyHQ9N9fak
	YvK7/6K4UklQs5bCntG3ZZhJ+GrFuxXl9BhaqqU=
X-Google-Smtp-Source: 
 ABdhPJwxh5Ce2PSn7Xik34Qpklshx+vsmz0DPNCu6BZUDCsOP7ODOrONpO5tuM/bM1s3f5OE71q4Cu8QQA+res6VCGM=
X-Received: by 2002:a05:6512:3047:b0:473:cf43:6d8f with SMTP id
 b7-20020a056512304700b00473cf436d8fmr4028673lfb.380.1652456549237; Fri, 13
 May 2022 08:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <16EEAE47FC3C363C.27599@lists.openembedded.org>
 <20220513153031.1032716-1-zboszor@pr.hu>
 <20220513153031.1032716-3-zboszor@pr.hu>
In-Reply-To: <20220513153031.1032716-3-zboszor@pr.hu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 May 2022 17:42:18 +0200
Message-ID: 
 <CANNYZj8iwdYLGZ++GXsg4hcwZF9kQORzWF3Bv9QRRiYOV-95vw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2 3/3] nodejs: Add /usr/lib/node ->
 node_modules symlink
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 15:42:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165576

This needs to be sent to the openembedded-devel list.

Alex

On Fri, 13 May 2022 at 17:31, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> While /usr/lib/node_modules and all npm-related modules are
> shipped in the npm subpackage, keep the symlink in the main
> package because 3rd party modules that don't need npm are
> also installed into /usr/lib/node_modules.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_16.14.2.bb
> index 62188f94a..be68afd4c 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
> @@ -159,6 +159,10 @@ do_compile () {
>
>  do_install () {
>      oe_runmake install DESTDIR=3D${D}
> +
> +    # node(1) is using /usr/lib/node as default include directory and np=
m(1) is
> +    # using /usr/lib/node_modules as install directory. Let's make both =
happy.
> +    ln -fs node_modules ${D}/${nonarch_libdir}/node
>  }
>
>  BINARIES =3D " \
> @@ -176,6 +180,7 @@ do_install:append:class-native() {
>  }
>
>  PACKAGES =3D+ "${PN}-npm"
> +FILES:${PN} +=3D "${nonarch_libdir}/node"
>  FILES:${PN}-npm =3D "${nonarch_libdir}/node_modules ${bindir}/npm ${bind=
ir}/npx"
>  RDEPENDS:${PN}-npm =3D "bash python3-core python3-shell python3-datetime=
 \
>      python3-misc python3-multiprocessing"
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165573): https://lists.openembedded.org/g/openembedde=
d-core/message/165573
> Mute This Topic: https://lists.openembedded.org/mt/91083341/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

