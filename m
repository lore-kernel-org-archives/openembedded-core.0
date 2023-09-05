Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7AFC83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 15:02:33 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.23999.1693926144629975213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 08:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P4GtR/sW;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1c504386374so2207683fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693926144; x=1694530944; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jtTVCWHo+5XlYvNVRrpy9eHhJr2tQ08upLWOGuEmWc=;
        b=P4GtR/sWqN97wHLk00fKak03PYlsqcb5o5gqtneW+RBn/r2y5bfRUKInqOLKXyo9rm
         YVEP3gK8N+YFZgy17hQlG57JqhJIZ3hc4kILEQgJe7LS0k8tys6FEku0wt7V4faX48z3
         42xU7AOmbpS9sJbNhy9hYV95KvU12wGukjgo08+JM5TqWJgryR4mKZF9r8lCHkFU7EiP
         lNsayCt3WVgXdPSm1O+mQ02KjQzpFJyftNMa4bGO9if76PNjKayObb98kpUM/MWcY5b2
         2UpSRFE9isCcGYtVA87MceTA7/SG/2XdV0tlkcxHfXRukFuqUpCJbeSjdO70YQcmFMxw
         gUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693926144; x=1694530944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jtTVCWHo+5XlYvNVRrpy9eHhJr2tQ08upLWOGuEmWc=;
        b=CLJwTQMqEggntxe4UcGgRCb4iDtX94lMWeqizXFpGqbwCU29YcYZDQpUFfRRehp8fI
         cM5zvKrYDxscl99UZyENBbsaIZ19KUbX4MG6u2cYH7P5uN8aGFtiZ4AuFm75DZ9n4WFO
         VYzX6IhzkE4FrL0xW8PQbD5NjDHMTSiOGGm5QdvS/5Dsi4hOs3V7ZsgQkkZZ7xvZ3WfM
         mHffc5Fu0dRPpUXoMSC+ivUOR91dRUtEcekUHmd0Ws6SFebLRZuchpPmL1buuSLAOwv/
         BRsALxFZFM3L1mBAtsAykuDKXz/p9LfF5TuUa8KB4MMAJaywUQoef9LAUoShkkkAMHvX
         J1oA==
X-Gm-Message-State: AOJu0YwdjUs551YkeX6UCXmZA/9NIY5+DtR5EdXcSrdMqC//nYlh1VVR
	9yiagoSawCYxw7mlkh69tHeNEUN2h++QJtemOwM=
X-Google-Smtp-Source: AGHT+IEoNt/3k8Z9iHbNcwCcfjdy2I4EJbKoosYEuDk9jHjAGTWCtR/A9VBMe9OrrbPWYkzMGo+1OhFf8ZWpeoc9OhM=
X-Received: by 2002:a05:6870:2101:b0:1be:f4b3:7f49 with SMTP id
 f1-20020a056870210100b001bef4b37f49mr17195413oae.23.1693926143625; Tue, 05
 Sep 2023 08:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
 <f3349fa06ed7e549e1ae15ac3e18ef779d34f8b8.1693924532.git.bruce.ashfield@gmail.com>
 <d6d5598f23547bbae7cdd739cd2346dbfdf14a1c.camel@linuxfoundation.org>
In-Reply-To: <d6d5598f23547bbae7cdd739cd2346dbfdf14a1c.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Sep 2023 11:02:36 -0400
Message-ID: <CADkTA4Nu_rUM3TsZ_05m55s1+xS4eVxvc0NxFKXiifFHP8n50Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] linux-yocto: add gzip-native to DEPENDS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 15:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187227

On Tue, Sep 5, 2023 at 11:01=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-09-05 at 10:37 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > When building a compressed kernel image on a host with an older
> > gzip, the following error can occur:
> >
> >   ERROR: linux-yocto-6.4.11+git-r0 do_compile: oe_runmake failed
> >   ERROR: linux-yocto-6.4.11+git-r0 do_compile: ExecutionError('tmp/work=
/qemux86_64-poky-linux/linux-yocto/6.4.11+git/temp/run.do_compile.1715845',=
 1, None, None)
> >   ERROR: Logfile of failure stored in: tmp/work/qemux86_64-poky-linux/l=
inux-yocto/6.4.11+git/temp/log.do_compile.1715845
> >   Log data follows:
> >   | DEBUG: Executing shell function do_compile
> >   | NOTE: KBUILD_BUILD_TIMESTAMP: Mon Aug 21 15:35:20 UTC 2023
> >   | NOTE: make -j 24 CC=3Dx86_64-poky-linux-gcc  -fuse-ld=3Dbfd -fcanon=
-prefix-map -fmacro-prefix-map=3Dtmp/work-shared/qemux86-64/kernel-source=
=3D/usr/src/debug/linux-yocto/6.4.11+git-r0 -fdebug-prefix-map=3Dtmp/work-s=
hared/qemux86e
> >   |   GEN     Makefile
> >   |   DESCEND objtool
> >   |   CALL tmp/work-shared/qemux86-64/kernel-source/scripts/checksyscal=
ls.sh
> >   | make[3]: 'install_headers' is up to date.
> >   |   GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
> >   | gzip: abort: zlib version less than 1.2.3
> >
> > We can't juse depend on zlib-native, as gzip isn't built by the
> > kernel as a tool, so we add gzip-native to our DEPENDS and the
> > issue is resolved.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-k=
ernel/linux/linux-yocto.inc
> > index 0cc303c009..945e7bb9d3 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -18,7 +18,7 @@ python () {
> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kern=
el to %s to enable it" % (d.getVar("PN")))
> >  }
> >
> > -DEPENDS +=3D "xz-native bc-native"
> > +DEPENDS +=3D "xz-native bc-native gzip-native"
> >  DEPENDS:append:aarch64 =3D " libgcc"
> >  KERNEL_CC:append:aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
> >  KERNEL_LD:append:aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
>
> I'm not entirely convinced this was the issue as I saw this myself
> locally. A "bitbake virtual/kernel -c clean" made it go away so it was
> more that the version of libz in the sysroot changed and an existing
> kernel build didn't notice...
>

multiple cleans of the kernel didn't fix it for me (including a
cleanall), as well as adding zlib-native (didn't help).

Only this got the kernel building for me.

Bruce

> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

