Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E71EC54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 16:34:16 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.802.1710434047039511106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 09:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kt7wERxP;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513d4559fb4so726964e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 09:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710434045; x=1711038845; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR3Cl5yXRT/I8RigMTwERqhPS6lKSx5Smi9EXxHioRU=;
        b=Kt7wERxPJ9eyUQk1nRuY5HuyeuuhWMzLb5yyHSR3y6h9zFqkkcfgDkafWC0QvwNwks
         H27+Yo6I/gRTnp8EvTwR84A5T2dDc0bX+2rrLWChrAUozBx0k2vsODujF/AQha0HwqKE
         43/3dMScxD0jyvBS0Wg/lX/4XKVmuzrgBsTXcxUcAc1jxaO4RRBUhOHj9ywvdkgrWkap
         84KLSNY8zOBHYkMKm0oSYm63msxKlm7+DqjI0H9eE51nLuwOUYWYLPwMFeJM7XIkrBqQ
         eI721VbXrA3Yij6K1CWsdUbN9mItETLF4klVLBZOsOap1++7kbVsewk8x64d1sCv/PG9
         BMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710434045; x=1711038845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xR3Cl5yXRT/I8RigMTwERqhPS6lKSx5Smi9EXxHioRU=;
        b=N2WIhflrRLeLTO1XUJGn/QAvnjmgYWQNm5GUqRHBoTP/8hVKhlq2aZY1rnc04JrcDN
         SmWIdU4uLPjA0VFGrzCifsO3HhE6dgjJjvBJfPpRFpvl3/TL86GY/TMZfaH424EszBC9
         ptiORsdSGrdFU9PBNN5KTqsYBjpBLMBpHhnWD4LSrdLJUDPp/9JRVLyZB86A15iGi0yS
         6+Itz1YhvWhzfyk0DxFzV5PUf3hI6CpR0Qmf0B8UgcRhtpy1cFac7E2a/8mo4t7RScR6
         DtMiJuE35Xc/Jh9BWukBJeL0EtBJ05cs/2hSdl7gy1o7n7zWc/46H4MvH9vjLSunCfW+
         Vpxg==
X-Gm-Message-State: AOJu0Yynyzi3y60izPBrLrbJYl6N9+nOJfKibzWXtwrzjinSrw4Txmdi
	UqIXg4v1Evn1m3K1bPAWzTc8mPuiQhq04TI7RimTycMJ5zj1YvXuOuQhG7EAOCz0M9c0fq8eiUP
	36v50TWd0os9MpCIZcvIGwUfDj4w=
X-Google-Smtp-Source: AGHT+IE/sBHY7rfjnpS5S8qMZh/KuJNSirYftG5EiLQQMT4JaLYXEQliIMnUq5Csbtf4+y0yMY1Z0W0guMeBv75EZ0w=
X-Received: by 2002:a19:8c01:0:b0:512:fab6:6df6 with SMTP id
 o1-20020a198c01000000b00512fab66df6mr1740458lfd.4.1710434044817; Thu, 14 Mar
 2024 09:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240314070903.83765-1-martin.jansa@gmail.com> <CADkTA4MmFRrfw6d332buuv4z-MAjJFjvj=DYPpTXF2Jg7tKmuQ@mail.gmail.com>
In-Reply-To: <CADkTA4MmFRrfw6d332buuv4z-MAjJFjvj=DYPpTXF2Jg7tKmuQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Mar 2024 17:33:46 +0100
Message-ID: <CA+chaQd-07rW6xHi4w=e82Q5O_2b7X9S+bZbJjmCFUNeEhN+7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane: add patch-status to default ERROR_QA
 for all layers
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 16:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197115

FWIW: meta-virtualization/master is fine since 2023-06-22:
https://git.yoctoproject.org/meta-virtualization/log/?qt=3Dgrep&q=3DUpstrea=
m-Status

There are only 4 new issues currently in master-next:

Missing Upstream-Status tag
(/OE/layers/meta-virtualization/recipes-containers/criu/files/0003-crit-pyc=
riu-build-and-install-wheels.patch)
Missing Upstream-Status tag
(/OE/layers/meta-virtualization/recipes-containers/criu/files/0004-pycriu-a=
ttr-pycriu.version.__version__.patch)
Missing Upstream-Status tag
(/OE/layers/meta-virtualization/recipes-containers/criu/files/0005-pycriu-s=
kip-dependency-check-during-build.patch)
Missing Upstream-Status tag
(/OE/layers/meta-virtualization/recipes-extended/virt-manager/virt-manager/=
0001-setup.py-move-global-args-to-install-args.patch)
Patches missing Upstream-Status: 4 (3%)
Patches with malformed Upstream-Status: 0 (0%)

meta-oe layers were updated a day before that:
https://git.openembedded.org/meta-openembedded/commit/?id=3Dbe8c765c7c4ed48=
404da8fd8e813c9f3ab5ad415
and few times since then:
https://git.openembedded.org/meta-openembedded/log/?qt=3Dgrep&q=3DUpstream-=
Status

Some examples in other layers:
https://git.yoctoproject.org/meta-security/log/?qt=3Dgrep&q=3DUpstream-Stat=
us
https://git.yoctoproject.org/meta-raspberrypi/log/?qt=3Dgrep&q=3DUpstream-S=
tatus
https://code.qt.io/cgit/yocto/meta-qt6.git/commit/?id=3Dd65dc4592bc7e836dbe=
13d37e8e0ba0a4396f4e3
https://github.com/meta-qt5/meta-qt5/commit/2c7ddcefe58099578094c91ed9a2f48=
f755e2dfa
https://github.com/webosose/meta-webosose/commit/eb4838a019fdbe24a50868f8ab=
43dd2e6d2ae52f
https://github.com/webosose/meta-webosose/commit/2c78e37ad9ceb9e236c03b44cc=
a5b38e9d9eb2fc
https://github.com/webOS-ports/meta-webos-ports/commit/617a7ee19e9f47d993f3=
08264ff9392ddd9a0678
https://github.com/shift-left-test/meta-shift/commit/45c96ca2adff5015c5e29c=
854cafeab4d1b43153
https://github.com/kraj/meta-clang/commit/ea117ca52f51224b5a1b9223ac4c3164f=
c3dcfb6
https://github.com/kraj/meta-clang/commit/26534d0a406caa5652dddcd4c3694d9e9=
25b66aa
https://github.com/OSSystems/meta-browser/commit/760f47527f1cfa757aff7427fd=
ee9e5365a94f1b
https://github.com/OSSystems/meta-browser/commit/a9e3d2b8f29ba4a2a852f30f11=
943cdc6afb9e60
...

Usually by me (because I had this in ERROR_QA for long time) and I'm
willing to be Upstream-Status monkey for few more days if it helps
getting this approved and resolved in even more layers :).

Cheers,

On Thu, Mar 14, 2024 at 5:17=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Thu, Mar 14, 2024 at 3:09=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > * it's enabled for patches in oe-core for very long time and I was usin=
g
> >   it for many other layers as well, so most layers should be in good
> >   shape
> >
> > * it's also possible to disable it for individual layer as shown
> >   by oe-core in:
> >   https://git.openembedded.org/openembedded-core/commit/meta/classes-gl=
obal/insane.bbclass?h=3Dscarthgap&id=3D61a881fdbe8b5a21c6276b8a5d06cc30486b=
1eb3
>
> Most people have heard my opinions on tracking status
> within files themselves (versus the revision control
> system), but that's not the point of my reply (for once!)
>
> Even with the QA error only enabled in oe-core at the
> moment, it is effectively enabled / enforced in all layers
> ... since if someone is building a product and enables
> the QA error .. all layers are going to have to comply
> even if they don't agree (since removing it from
> someone's  QA checklist in a layer would probably
> fail yocto compat standards).
>
> The summary of my rambling is: that I lost the debate
> when the check was created and became an error
> in OEcore.  So surprisingly, it doesn't really matter to
> me, but I lean towards doing it post release as well.
>
> Bruce
>
>
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta/classes-global/insane.bbclass | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/i=
nsane.bbclass
> > index e963001d09..9350bfa106 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -45,11 +45,10 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-fil=
es arch pkgconfig la \
> >              already-stripped installed-vs-shipped ldflags compile-host=
-path \
> >              install-host-path pn-overrides unknown-configure-option \
> >              useless-rpaths rpaths staticdev empty-dirs \
> > -            patch-fuzz \
> > +            patch-fuzz patch-status \
> >              "
> >  # Add usrmerge QA check based on distro feature
> >  ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge=
', ' usrmerge', '', d)}"
> > -ERROR_QA:append:layer-core =3D " patch-status"
> >  WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
> >
> >  FAKEROOT_QA =3D "host-user-contaminated"
> > --
> > 2.44.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197098): https://lists.openembedded.org/g/openembed=
ded-core/message/197098
> > Mute This Topic: https://lists.openembedded.org/mt/104922136/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

