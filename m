Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14C7D21699
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:45:05 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.12522.1728996293413387209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jYilfoof;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.182, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so5008782276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728996292; x=1729601092; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZM4voxdho6AZ9SB3uIdKwIO0A2oB8qZSe2L/p8xO90=;
        b=jYilfoofGJp29Sm/AbPeJVSPvYLB8Nxnyjf+ZF0rFTud/VbRr+x0ZTq6dl3aUMa5rT
         oQHvnTP9oUhpG7WHXvfqvmiutdH/ukFt86veyOQy8MeG8pwgRT2JAWdSZpbCvoyaB46u
         b29klx9nmUzQw1HIW56Pke+zk+MJ8iylDRrGBzgn6TsqSRVjsvN5WkKpplgk7jdRO3St
         JUbCHJnll0M+H1xhJ391Z6b/jZK9CAJ4yBxgaCQ1JfjqyU4MEGWTiNAox77s6t8gXlVk
         SVWAXqeqCGmXroMnynnVYuwVvi0dtkkdsDrbifth3Qecnj8NlZeyky7hBpVWm+JcX06d
         rK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728996292; x=1729601092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZM4voxdho6AZ9SB3uIdKwIO0A2oB8qZSe2L/p8xO90=;
        b=nVoo0Hc8KVc75DNswQVEKEKyGB8wqQBAE2WgyMIDFc0xBgH63XaltFvy2PQ3kFhft2
         8fUWYvOumTqrHf5kEyJsZ3kK/i95xBGr9neR+46mb6gO1BEnRWrmt2WlEKouy99Cgyuk
         /8c4h4JlipXbte1FJb7uKVnefaf1APV0/fwP9REwkWcjEEXhw/4HFmr9xANgyBL4Rd/l
         NWFZWoSEU3oCSN16G8jIqN6++2IWQUcweB5Vi5dt87pJ0ShkNn6DadNwne/2JwZxQynm
         Zj7wZyQZ9UvdH/K+VNGTlVymaYqrWVMQa23Bt0RmNfUP7gyuXmVnPZK6cxDLm/I/L3OB
         ze6g==
X-Forwarded-Encrypted: i=1; AJvYcCVKz69melUJhjsT4pYCBlRtuZja0RuS3ihJniTB+S1hG+k1Ledxm471nmqnlLfJDmX5fymDGiC29RpIQ3vS1Wtu0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7oepGLAO2TCEMraU1yUYZGlWFhwrWvOHP7Sp5WJPODorbBIHW
	gdZnYwG4k7zasJjYQ6a4px98/SUN6JJ3Fa8ErLPXVAelQenihieFMYB9IglEaCfbhIQ/mTgICK7
	j7ZpiNnTPulAukhpaCXbKTEodt8LHk5fTdh8oQQ==
X-Google-Smtp-Source: AGHT+IGvGB8EYdV2I3WnpXU4WhIPjTDsizlxwIaRXrT0hCEiGUDA5yRUcVsU632bMWxYtL+QFlMDYBEmDtl+v9VfEy0=
X-Received: by 2002:a05:6902:2789:b0:e22:5f83:98e7 with SMTP id
 3f1490d57ef6-e2919df8561mr9843311276.45.1728996292474; Tue, 15 Oct 2024
 05:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240905202102.565-1-paul.barker.ct@bp.renesas.com>
 <17F27A4142F288D2.30374@lists.openembedded.org> <fd756f4b5ce0b3b2dc38813469a0224047f99a09.camel@linuxfoundation.org>
 <0d659542-af68-4a8c-93bc-c0aedfd5fbe0@bp.renesas.com> <3e7a24b3-6dc0-45b9-8292-e225268102df@bp.renesas.com>
In-Reply-To: <3e7a24b3-6dc0-45b9-8292-e225268102df@bp.renesas.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 15 Oct 2024 05:44:41 -0700
Message-ID: <CAOSpxdYdqkw6jkyh0xYsAuKux7zg18BONbZ9-hA3F3yjKhbU7g@mail.gmail.com>
Subject: Re: [OE-core] [master/scarthgap PATCH] meta-ide-support: Mark recipe
 as MACHINE-specific
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205914

On Tue, Oct 15, 2024 at 5:21=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
>
> On 30/09/2024 11:23, Paul Barker wrote:
> > On 06/09/2024 14:48, Richard Purdie wrote:
> >> On Thu, 2024-09-05 at 23:40 +0100, Richard Purdie via lists.openembedd=
ed.org wrote:
> >>> On Thu, 2024-09-05 at 21:21 +0100, Paul Barker via lists.openembedded=
.org wrote:
> >>>> meta-ide-support:do_write_test_data dumps the bitbake data dictionar=
y to
> >>>> a file using export2json(). As this obviously includes the value of
> >>>> MACHINE, and other MACHINE-specific variables, the recipe needs to b=
e
> >>>> marked as MACHINE-specific.
> >>>>
> >>>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> >>>> ---
> >>>>  meta/recipes-core/meta/meta-ide-support.bb | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recip=
es-core/meta/meta-ide-support.bb
> >>>> index d85aa120c08b..7ed422ce4ddb 100644
> >>>> --- a/meta/recipes-core/meta/meta-ide-support.bb
> >>>> +++ b/meta/recipes-core/meta/meta-ide-support.bb
> >>>> @@ -1,6 +1,7 @@
> >>>>  SUMMARY =3D "Integrated Development Environment support"
> >>>>  DESCRIPTION =3D "Meta package for ensuring the build directory cont=
ains all appropriate toolchain packages for using an IDE"
> >>>>  LICENSE =3D "MIT"
> >>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>>
> >>>>  DEPENDS =3D "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu=
-helper-native unfs3-native cmake-native autoconf-native automake-native me=
son-native intltool-native pkgconfig-native"
> >>>>  RM_WORK_EXCLUDE +=3D "${PN}"
> >>>
> >>> Something about this is making our toolchain tests unhappy, e.g.:
> >>>
> >>> https://valkyrie.yoctoproject.org/#/builders/42/builds/86/steps/12/lo=
gs/stdio
> >>>
> >>> I've not looked into it at all, just reporting what we've need to fix
> >>> in order to be able to consider merging this.
> >>
> >> It can be fixed with:
> >>
> >> diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/=
selftest/cases/meta_ide.py
> >> index ffe0d2604d1..5a17ca52ea1 100644
> >> --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> >> +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> >> @@ -20,8 +20,8 @@ class MetaIDE(OESelftestTestCase):
> >>          bitbake('meta-ide-support')
> >>          bitbake('build-sysroots -c build_native_sysroot')
> >>          bitbake('build-sysroots -c build_target_sysroot')
> >> -        bb_vars =3D get_bb_vars(['MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_=
IMAGE', 'COREBASE'])
> >> -        cls.environment_script =3D 'environment-setup-%s' % bb_vars['=
MULTIMACH_TARGET_SYS']
> >> +        bb_vars =3D get_bb_vars(['MACHINE_ARCH', 'TARGET_VENDOR', 'TA=
RGET_OS', 'DEPLOY_DIR_IMAGE', 'COREBASE'])
> >> +        cls.environment_script =3D 'environment-setup-%s%s-%s' % (bb_=
vars['MACHINE_ARCH'], bb_vars['TARGET_VENDOR'], bb_vars['TARGET_OS'])
> >>          cls.deploydir =3D bb_vars['DEPLOY_DIR_IMAGE']
> >>          cls.environment_script_path =3D '%s/%s' % (cls.deploydir, cls=
.environment_script)
> >>          cls.corebasedir =3D bb_vars['COREBASE']
> >>
> >> Whether that is a good/right fix, I'm not sure...
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >
> > Hi Richard, Steve,
> >
> > I see this has been committed as 3be2bc8a9b0c in openembedded-core [1]
> > for master/Styhead. Thanks for fixing the test case and merging this.
> >
> > We saw the same issue when running yocto-check-layer in Scarthgap, do
> > you think this is suitable for backporting?
> >
> > [1]: https://git.openembedded.org/openembedded-core/commit/?id=3D3be2bc=
8a9b0c9d6a178329c8b451a6bedf255d6c
> >
> > Thanks,
> >
>
> Gentle ping on this - can the patch be backported to Scarthgap?

Yes, I've got it in my test queue now.

Steve

