Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E9BC83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 15:07:43 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.24156.1693926460635076004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 08:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g8P2xIt1;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-79536bc6697so85934839f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693926460; x=1694531260; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jeK3Bk4MQErzIwgrfzWn/Ye/ukakZLZ+r7O4XUnpM8=;
        b=g8P2xIt1vdlMYbTrlOL+nOJibHSyOUJixZYNkhihS8+J01edhgCpG4wD3fgiK8tbtE
         LsxeWX1cGgu/++GqA4QbEoontt89VgdRyXRjQttGNoHrJzyoMFzzt1/2W/P3W9Uj+0tR
         dIiiU0Av+vfo7UFM5ZUXh1WsL+WKTL3sSGqS5vklaSzxeC2kqxNSvIgBW6VqsBZnc5a6
         FoNQ80mwxbgn5LF2jCDk3yybrOMhTyZsXo+mzJpRprS2fH1RPd/2qaPz7ujG1mvUHcsW
         ywvckyg2CVADe783eCmGvxsmqhhrWvd/VS+8UWEdgBzlWE/rF/HLfnSG0q91yS4O6MRt
         7tEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693926460; x=1694531260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jeK3Bk4MQErzIwgrfzWn/Ye/ukakZLZ+r7O4XUnpM8=;
        b=RaDk2DLBCHp4tbpp63zGqRwk3Xls++lu+m4qKld3GdYBC21iTcW4vZIf9GaVb1OIdd
         mZ2dKE8eCjVaSyNcfl76SGwXfYXSaN+pVVSsfv3En0Q/8mrTb6vyx5UfscjKdba8oN0O
         UfCRlEEpa50+Veb147IFVAMWZW6H0s9tfxLLAuwEDIj3RmZ79RgjVRSq7/mZVTHC/e7/
         AZ2SKyi/fOXK44WI7bLa3BZs61W5TYRSaspEhIg4uSVMcoRGu6CITV4xpijZbmiKf4or
         aOGHbXWjniCCgAnZt2HhKWlpAOMAMJin+H4iuVcPCvbWWraH7aL1n58Rd8lzSxT/eVoe
         WmSg==
X-Gm-Message-State: AOJu0YzodDLSC1SBJYllH+KjPwladDjnwTKmGHXSdFEo5Y+SmYCDpjMF
	sNk0mxBf2s7JVxKhM3I8+tLL/DoKuLt4QEjLazc=
X-Google-Smtp-Source: AGHT+IFWjSolh1FTGDaMRPDWxd7EDk6Kuo92R49f+Z5N3+0NAkil6JxJ/rL+X6HxEfwac3THar/NyT0+Rvc4tHNw8Fk=
X-Received: by 2002:a5e:aa0a:0:b0:792:4d29:ecc7 with SMTP id
 s10-20020a5eaa0a000000b007924d29ecc7mr13545074ioe.15.1693926459721; Tue, 05
 Sep 2023 08:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
 <f3349fa06ed7e549e1ae15ac3e18ef779d34f8b8.1693924532.git.bruce.ashfield@gmail.com>
 <d6d5598f23547bbae7cdd739cd2346dbfdf14a1c.camel@linuxfoundation.org> <178208DA97C569CC.31888@lists.openembedded.org>
In-Reply-To: <178208DA97C569CC.31888@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Sep 2023 11:07:53 -0400
Message-ID: <CADkTA4MUzozH1v1bOmjjDYsRNg+Vb2rtu4Z_SaRmTRke_4Kf8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] linux-yocto: add gzip-native to DEPENDS
To: bruce.ashfield@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 15:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187228

On Tue, Sep 5, 2023 at 11:02=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Tue, Sep 5, 2023 at 11:01=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2023-09-05 at 10:37 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > When building a compressed kernel image on a host with an older
> > > gzip, the following error can occur:
> > >
> > >   ERROR: linux-yocto-6.4.11+git-r0 do_compile: oe_runmake failed
> > >   ERROR: linux-yocto-6.4.11+git-r0 do_compile: ExecutionError('tmp/wo=
rk/qemux86_64-poky-linux/linux-yocto/6.4.11+git/temp/run.do_compile.1715845=
', 1, None, None)
> > >   ERROR: Logfile of failure stored in: tmp/work/qemux86_64-poky-linux=
/linux-yocto/6.4.11+git/temp/log.do_compile.1715845
> > >   Log data follows:
> > >   | DEBUG: Executing shell function do_compile
> > >   | NOTE: KBUILD_BUILD_TIMESTAMP: Mon Aug 21 15:35:20 UTC 2023
> > >   | NOTE: make -j 24 CC=3Dx86_64-poky-linux-gcc  -fuse-ld=3Dbfd -fcan=
on-prefix-map -fmacro-prefix-map=3Dtmp/work-shared/qemux86-64/kernel-source=
=3D/usr/src/debug/linux-yocto/6.4.11+git-r0 -fdebug-prefix-map=3Dtmp/work-s=
hared/qemux86e
> > >   |   GEN     Makefile
> > >   |   DESCEND objtool
> > >   |   CALL tmp/work-shared/qemux86-64/kernel-source/scripts/checksysc=
alls.sh
> > >   | make[3]: 'install_headers' is up to date.
> > >   |   GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
> > >   | gzip: abort: zlib version less than 1.2.3
> > >
> > > We can't juse depend on zlib-native, as gzip isn't built by the
> > > kernel as a tool, so we add gzip-native to our DEPENDS and the
> > > issue is resolved.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes=
-kernel/linux/linux-yocto.inc
> > > index 0cc303c009..945e7bb9d3 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > @@ -18,7 +18,7 @@ python () {
> > >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/ke=
rnel to %s to enable it" % (d.getVar("PN")))
> > >  }
> > >
> > > -DEPENDS +=3D "xz-native bc-native"
> > > +DEPENDS +=3D "xz-native bc-native gzip-native"
> > >  DEPENDS:append:aarch64 =3D " libgcc"
> > >  KERNEL_CC:append:aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
> > >  KERNEL_LD:append:aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
> >
> > I'm not entirely convinced this was the issue as I saw this myself
> > locally. A "bitbake virtual/kernel -c clean" made it go away so it was
> > more that the version of libz in the sysroot changed and an existing
> > kernel build didn't notice...
> >
>
> multiple cleans of the kernel didn't fix it for me (including a
> cleanall), as well as adding zlib-native (didn't help).
>
> Only this got the kernel building for me.

That being said, the sysroot and zlib do make a lot of sense.

Ignore this patch, and I'll carry it locally for a while and see if
the problem pops up on the same builder again.

Bruce

>
> Bruce
>
> > Cheers,
> >
> > Richard
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187227): https://lists.openembedded.org/g/openembedde=
d-core/message/187227
> Mute This Topic: https://lists.openembedded.org/mt/101170561/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

