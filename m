Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D424C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 13:58:01 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.63412.1710165479556974383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 06:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4vm7WjR;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso2052400a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 06:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710165479; x=1710770279; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPvzJzG3zTSzPXz6fMEzQppoO0FgRM0AS5plqFQclTg=;
        b=m4vm7WjRuL8dihpJolbGQonHS8a3+WCtQtLKW8sex14wvhifSL7HTQTK6ClKCX7+Ya
         8aO8je39T85iROmT/fIpcJSSty0BETxuiuqzSSIUz7chSsA/dV3HzIXuQZEifIAWX23L
         WyB52JOvTqwBD0ZlVRDmDi1MvgnbkxccLyUhSD7cN0UGaRgMoTuBZynf9vX17ATtPxBP
         wbWIXOLZcZ27HdteEDbEcR7p95KzoxkQ7lF6oRh45gMm0bfYTeq8WxbzcT5IV2ALfhpW
         fZL7TvAsBfYu/PF2B3nXykUe6gCVF13qhUwGL1Fekoy/BvPARKitg0MGQ2+dMmS5n3T9
         Kv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710165479; x=1710770279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPvzJzG3zTSzPXz6fMEzQppoO0FgRM0AS5plqFQclTg=;
        b=IVvG5hRoklTwHO9L9SPdde6xKSRVi+XzD7glUk4GxOxySQismBgky85+TcvYrddAKW
         mi2eAHLO75wUYEXdp9FoleTDQy4F4qwmcTt0xpDlFr9KectypYWKP9+gUu3QByNFhrCj
         UASHrrWV+6pGeen/Fmm+1jt0AupCp4r2PmejzqEyDelUoWeMV2QJPUQ4dBMBchGPbjjZ
         02R0b2GQwWXkuJs9LO4K1YsCtV1TFgWNzJwVBkaaK80+7Q+w6Y0ViL1SSGKU1FdVRLcV
         C7Y4oFIZsFMC6BxtGACJ6wyPt9obu8URHESm+vlQGHPaawjvvIbrxCIQ3yV3DcDYYa+k
         PAfA==
X-Forwarded-Encrypted: i=1; AJvYcCXlWmD8LZGo257Qrc6fY7EXmCSdgpsSc4ZT+vYVaKCMGYR1Zg/wmn7A3ikg+WwNYUCbZnX5ensNGuEZQLtUfi7YTuQANlFRBHLZ09strbpK7NmHSCT7YDHD
X-Gm-Message-State: AOJu0YzGMuLD09B2F7Zz9Z+zakMhx79fIJqALvSUZ8cc91t7VCwluOXR
	V6jrrt2HwnuCEY7p2ulGdRbNgs+C4kE1j+5tTf86gwyXP3kd+PFM7gUXIEx0Er9edNnY9EpQJYO
	mNnM98j2TgvWtFHOzjQZz6IBw7ak=
X-Google-Smtp-Source: AGHT+IH8psfQKgMroBrjrBSxIQUh9HQnf9bWp8A7lI22p6hBotwZljDGOsDZte5eUw9UFPe5Zncm4kXy03Yr4x+qyuI=
X-Received: by 2002:a17:90b:3b44:b0:29c:29a3:18bc with SMTP id
 ot4-20020a17090b3b4400b0029c29a318bcmr257769pjb.7.1710165478718; Mon, 11 Mar
 2024 06:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240309175750.2621579-1-max.oss.09@gmail.com>
 <CADkTA4PBJDhGub=P0JbuhKHj0d2tXt8kx2SXDyvXRy6c2M7iww@mail.gmail.com>
 <d3359086952367d978a794500c474a472e6bc1cb.camel@gmail.com>
 <17BB69D476D2F4EF.5850@lists.openembedded.org> <099aad3c778f9f8cf736d894ad482bf9ab0bbe49.camel@linuxfoundation.org>
 <CADkTA4M63P5JQRdMczuruF3i8MJvXzkiRUUWi8+iPvOqr1uELg@mail.gmail.com>
 <86838facff259ce36c5e1011488538c7be1de00f.camel@linuxfoundation.org> <Ze7-_oIu3TFpyuT7@toolbox>
In-Reply-To: <Ze7-_oIu3TFpyuT7@toolbox>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2024 09:57:47 -0400
Message-ID: <CADkTA4N5KcudMaimcs46Ph_Uk6ZQaFM-OLqSqECyT5QYJ_z_tg@mail.gmail.com>
Subject: Re: [OE-core] [REGRESSION] linux (git/curl-native) and autorev
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 13:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196939

On Mon, Mar 11, 2024 at 8:54=E2=80=AFAM Max Krummenacher <max.oss.09@gmail.=
com> wrote:
>
> On Sun, Mar 10, 2024 at 11:39:00PM +0000, Richard Purdie wrote:
> > On Sun, 2024-03-10 at 09:05 -0700, Bruce Ashfield wrote:
> > > On Sun, Mar 10, 2024 at 11:52=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Sun, 2024-03-10 at 06:20 -0700, Richard Purdie via
> > > > lists.openembedded.org wrote:
> > > > > On Sun, 2024-03-10 at 13:31 +0100, Max wrote:
> > > > > > Am Samstag, dem 09.03.2024 um 13:04 -0800 schrieb Bruce
> > > > > > Ashfield:
> > > > > > > On Sat, Mar 9, 2024 at 12:58=E2=80=AFPM <max.oss.09@gmail.com=
> wrote:
> > > > > > > >
> > > > > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > > >
> > > > > > > > Hello
> > > > > > > >
> > > > > > > > If one builds a kernel using AUTOREV invoking bitbake only
> > > > > > > > works
> > > > > > > > once.
> > > > > > > > Any subsequent bitbake invocation fails parsing the meta
> > > > > > > > data.
> > > > > > > >
> > > > > > > > Reproducable with:
> > > > > > > > - latest poky, b5624ee564
> > > > > > > > - Kernel with SRCREV =3D "AUTOREV", e.g. in local.conf
> > > > > > > >   `SRCREV_machine:pn-linux-yocto:forcevariable =3D
> > > > > > > > "${AUTOREV}"`
> > > > > > > > - bitbake virtual/kernel; bitbake virtual/kernel
> > > > > > > >
> > > > > > > > On the second invocation parsing fails when the fetcher
> > > > > > > > tries
> > > > > > > > to
> > > > > > > > evaluate the latest SRCREV:
> > > > > > > >
> > > > > > > > > ERROR: ExpansionError during parsing meta/recipes-
> > > > > > > > > kernel/linux/linux-yocto_6.6.bb
> > > > > > > > > Traceback (most recent call last):
> > > > > > > > >   File "bitbake/lib/bb/fetch2/__init__.py", line 1245, in
> > > > > > > > > srcrev_internal_helper(ud=3D<bb.fetch2.FetchData object a=
t
> > > > > > > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > > > > > > 0x7f8e26195890>, name=3D'machine'):
> > > > > > > > >              d.setVar("__BBAUTOREV_ACTED_UPON", True)
> > > > > > > > >     >        srcrev =3D ud.method.latest_revision(ud, d,
> > > > > > > > > name)
> > > > > > > > >
> > > > > > > > >   File "bitbake/lib/bb/fetch2/__init__.py", line 1667, in
> > > > > > > > > Git.latest_revision(ud=3D<bb.fetch2.FetchData object at
> > > > > > > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > > > > > > 0x7f8e26195890>, name=3D'machine'):
> > > > > > > > >              except KeyError:
> > > > > > > > >     >            revs[key] =3D rev =3D
> > > > > > > > > self._latest_revision(ud,
> > > > > > > > > d,
> > > > > > > > > name)
> > > > > > > > >                  return rev
> > > > > > > > >   File "bitbake/lib/bb/fetch2/git.py", line 850, in
> > > > > > > > > Git._latest_revision(ud=3D<bb.fetch2.FetchData object at
> > > > > > > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > > > > > > 0x7f8e26195890>, name=3D'machine'):
> > > > > > > > >
> > > > > > > > >     >        output =3D self._lsremote(ud, d, "")
> > > > > > > > >              # Tags of the form ^{} may not work, need to
> > > > > > > > > fallback to other form
> > > > > > > > >   File "bitbake/lib/bb/fetch2/git.py", line 833, in
> > > > > > > > > Git._lsremote(ud=3D<bb.fetch2.FetchData object at
> > > > > > > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > > > > > > 0x7f8e26195890>, search=3D''):
> > > > > > > > >                      bb.fetch2.check_network_access(d,
> > > > > > > > > cmd,
> > > > > > > > > repourl)
> > > > > > > > >     >            output =3D runfetchcmd(cmd, d, True)
> > > > > > > > >                  if not output:
> > > > > > > > >   File "bitbake/lib/bb/fetch2/__init__.py", line 957, in
> > > > > > > > > runfetchcmd(cmd=3D'export PSEUDO_DISABLED=3D1; export
> > > > > > > > > DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1003/bu=
s";
> > > > > > > > > export
> > > > > > > > > PATH=3D"build/tmp/sysroots-uninative/x86_64-
> > > > > > > > > linux/usr/bin:scripts:build/tmp/work/qemux86_64-poky-
> > > > > > > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > > native/usr/bin/x86_64-poky-
> > > > > > > > > linux:build/tmp/work/qemux86_64-
> > > > > > > > > poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > > > > > > sysroot/usr/bin/crossscripts:build/tmp/work/qemux86_64-
> > > > > > > > > poky-
> > > > > > > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > > native/usr/sbin:build/tmp/work/qemux86_64-poky-
> > > > > > > > > linux/linux-
> > > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > > native/usr/bin:build/tmp/work/qemux86_64-poky-
> > > > > > > > > linux/linux-
> > > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > > native/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > > native/bin:bitbake/bin:build/tmp/hosttools"; export
> > > > > > > > > HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfalse -c
> > > > > > > > > core.pager=3Dcat
> > > > > > > > > -c safe.bareRepository=3Dall ls-remote
> > > > > > > > > https://git.yoctoproject.org/linux-yocto.git ',
> > > > > > > > > d=3D<bb.data_smart.DataSmart object at 0x7f8e26195890>,
> > > > > > > > > quiet=3DTrue, cleanup=3D[], log=3DNone, workdir=3DNone):
> > > > > > > > >
> > > > > > > > >     >        raise FetchError(error_message)
> > > > > > > > >
> > > > > > > > > bb.data_smart.ExpansionError: Failure expanding variable
> > > > > > > > > fetcher_hashes_dummyfunc[vardepvalue], expression was
> > > > > > > > > ${@bb.fetch.get_hashvalue(d)} which triggered exception
> > > > > > > > > FetchError: Fetcher failure: Fetch command export
> > > > > > > > > PSEUDO_DISABLED=3D1; export
> > > > > > > > > DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1003/bu=
s";
> > > > > > > > > export
> > > > > > > > > PATH=3D"build/tmp/sysroots-uninative/x86_64-
> > > > > > > > > linux/usr/bin:scripts:/var/home/krm/build/poky/build/tmp/
> > > > > > > > > work
> > > > > > > > > /q
> > > > > > > > > emux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > > > > > > sysroot-
> > > > > > > > > native/usr/bin/x86_64-poky-
> > > > > > > > > linux:build/tmp/work/qemux86_64-
> > > > > > > > > poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > > > > > > sysroot/usr/bin/crossscripts:build/tmp/work/qemux86_64-
> > > > > > > > > poky-
> > > > > > > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > > native/usr/sbin:build/tmp/work/qemux86_64-poky-
> > > > > > > > > linux/linux-
> > > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > > native/usr/bin:build/tmp/work/qemux86_64-poky-
> > > > > > > > > linux/linux-
> > > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > > native/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > > native/bin:bitbake/bin:build/tmp/hosttools"; export
> > > > > > > > > HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfalse -c
> > > > > > > > > core.pager=3Dcat
> > > > > > > > > -c safe.bareRepository=3Dall ls-remote
> > > > > > > > > https://git.yoctoproject.org/linux-yocto.git  failed with
> > > > > > > > > exit
> > > > > > > > > code 128, output:
> > > > > > > > > fatal: unable to access
> > > > > > > > > 'https://git.yoctoproject.org/linux-yocto.git/': error
> > > > > > > > > setting
> > > > > > > > > certificate file: build/tmp/work/x86_64-linux/curl-
> > > > > > > > > native/8.6.0/recipe-sysroot-native/etc/ssl/certs/ca-
> > > > > > > > > certificates.crt
> > > > > > > > >
> > > > > > > > > The variable dependency chain for the failure is:
> > > > > > > > > fetcher_hashes_dummyfunc[vardepvalue]
> > > > > > > >
> > > > > > > > Note:
> > > > > > > > One gets out of that parser error by deleting the git
> > > > > > > > binary in
> > > > > > > > the
> > > > > > > > kernel's work recipe-sysroot-native
> > > > > > > > `rm tmp/work/qemux86_64-poky-linux/linux-
> > > > > > > > yocto/6.6.20+git/recipe-
> > > > > > > > sysroot-native/usr/bin/git`
> > > > > > > >
> > > > > > > > Bisecting poky leads to commit
> > > > > > > > f7fa98cca8 ("kern-tools: depend on git-replacement-native")
> > > > > > > > Reverting it on top of b5624ee564 makes the parsing pass.
> > > > > > > >
> > > > > > > > I assume that `git-replacement-native` does not work with
> > > > > > > > https,
> > > > > > > > the
> > > > > > > > fetch error also goes away if changing in SRC_URI from
> > > > > > > > https to
> > > > > > > > git.
> > > > > > > >
> > > > > > > > Any comments?
> > > > > > >
> > > > > > > I didn't even know that curl was coming into play :)
> > > > > > >
> > > > > > > Adding DEPENDS:class-native +=3D "ca-certificates" to the cur=
l
> > > > > > > recipe
> > > > > > > should resolve the issue.
> > > > > >
> > > > > > Looks like curl-native resp. libcurl hardcodes the lookup to
> > > > > > its
> > > > > > own
> > > > > > work directory, i.e.:
> > > > > > x86_64-linux/curl-native/8.6.0/recipe-sysroot-
> > > > > > native/etc/ssl/certs/ca-certificates.crt
> > > > > >
> > > > > > So even if DEPENDS/RDEPENDS will install ca-certificates in the
> > > > > > kernel's
> > > > > > recipe-sysroot-native the parsing will fail if the curl-native
> > > > > > directory
> > > > > > is not/no longer populated, e.g. because curl-native came from
> > > > > > sstate
> > > > > > or
> > > > > > rm_work is in INHERIT.
> > > > >
> > > > > This all gets a bit messy.
> > > > >
> > > > > We've relied upon scripts that use openssl to set variables like:
> > > > >
> > > > > export SSL_CERT_DIR=3D"XXXX/etc/ssl/certs/
> > > > >
> > > > > so in theory we might be able to set an environment variable in a
> > > > > wrapper around the git commands.
> > > > >
> > > > > It may be better if we teach curl a relative path to the certs...
> > > > >
> > > > > I suspect this isn't going to be an easy/neat fix unfortunately.
> > > >
> > > > I'm trying not to get sucked into "work" today however I realised
> > > > that
> > > > relative paths won't work without some implementation of "$ORIGIN"
> > > > support into these paths. Given it ultimately ends up in openssl,
> > > > it
> > > > would probably be best there.
> > > >
> > > > I'd not be against writing a $ORIGIN support patch and seeing what
> > > > upstream think about it. It would still mean finding a way to find
> > > > the
> > > > path to the library file somehow.
> > > >
> > > > For purposes of the release, setting the right envvars in the git
> > > > wrapper is probably the way forward for now, much as I dislike the
> > > > requirement to do that.
> > >
> > > I tried this, but curl didn't seem to use it to locate the cert file.
> > >
> > > i.e., I tried this:
> > >
> > > ---------------
> > >
> > > diff --git a/meta/recipes-devtools/git/git_2.44.0.bb
> > > b/meta/recipes-devtools/git/git_2.44.0.bb
> > > index e6d1470873..f6b06ec601 100644
> > > --- a/meta/recipes-devtools/git/git_2.44.0.bb
> > > +++ b/meta/recipes-devtools/git/git_2.44.0.bb
> > > @@ -31,7 +31,7 @@ PACKAGECONFIG ??=3D "expat curl"
> > >  PACKAGECONFIG[cvsserver] =3D ""
> > >  PACKAGECONFIG[svn] =3D ""
> > >  PACKAGECONFIG[manpages] =3D ",,asciidoc-native xmlto-native"
> > > -PACKAGECONFIG[curl] =3D "--with-curl,--without-curl,curl"
> > > +PACKAGECONFIG[curl] =3D "--with-curl,--without-curl,curl ca-
> > > certificates"
> > >  PACKAGECONFIG[expat] =3D "--with-expat,--without-expat,expat"
> > >
> > >  EXTRA_OECONF =3D "--with-perl=3D${STAGING_BINDIR_NATIVE}/perl-
> > > native/perl \
> > > @@ -103,13 +103,15 @@ do_install:append:class-target () {
> > >  do_install:append:class-native() {
> > >         create_wrapper ${D}${bindir}/git \
> > >                 GIT_EXEC_PATH=3D'`dirname
> > > $''realpath`'/${REL_GIT_EXEC_PATH} \
> > > -               GIT_TEMPLATE_DIR=3D'`dirname
> > > $''realpath`'/${REL_GIT_TEMPLATE_DIR}
> > > +               GIT_TEMPLATE_DIR=3D'`dirname
> > > $''realpath`'/${REL_GIT_TEMPLATE_DIR} \
> > > +               SSL_CERT_DIR=3D'`dirname
> > > $''realpath`'/../../etc/ssl/certs/
> > >  }
> > >
> > >  do_install:append:class-nativesdk() {
> > >         create_wrapper ${D}${bindir}/git \
> > >                 GIT_EXEC_PATH=3D'`dirname
> > > $''realpath`'/${REL_GIT_EXEC_PATH} \
> > >                 GIT_TEMPLATE_DIR=3D'`dirname
> > > $''realpath`'/${REL_GIT_TEMPLATE_DIR}
> > > +               SSL_CERT_DIR=3D'`dirname
> > > $''realpath`'/../../etc/ssl/certs/
> > >         perl_native_fixup
> > >  }
> > >
> > > ---------
> > >
> > > Probably because the exec of curl from git isn't getting the
> > > environment ? Either
> > > that, or I did it wrong. I didn't try it as an explicit export, and
> > > that is probably it,
> > > I can try that later tonight.
> > >
> > > Only when I added the depends on ca-certifications to curl itself was
> > > it able to
> > > fetch the autorevs.
> >
> > We probably need both the variable (to avoid the workdir removal issue)
> > and the dependency.
> >
> > Cheers,
> >
> > Richard
> >
>
> Looks like git has its own cainfo path env variable, SSL_CERT_DIR
> seems to not work. [1]
>

Aha! That explains why it was ignoring my attempts :)

> The following changes did make AUTOREV work for me:
>
> --- a/meta/recipes-devtools/git/git_2.44.0.bb
> +++ b/meta/recipes-devtools/git/git_2.44.0.bb
> @@ -4,6 +4,7 @@ DESCRIPTION =3D "Git is a free and open source distribute=
d version control system
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-=
1.0 & LGPL-2.1-or-later"
>  DEPENDS =3D "openssl zlib"
> +DEPENDS:class-native +=3D "ca-certificates"
>
>  PROVIDES:append:class-native =3D " git-replacement-native"
>
> @@ -95,6 +96,7 @@ perl_native_fixup () {
>
>  REL_GIT_EXEC_PATH =3D "${@os.path.relpath(libexecdir, bindir)}/git-core"
>  REL_GIT_TEMPLATE_DIR =3D "${@os.path.relpath(datadir, bindir)}/git-core/=
templates"
> +REL_GIT_SSL_CAINFO =3D "${@os.path.relpath(sysconfdir, bindir)}/ssl/cert=
s/ca-certificates.crt"
>
>  do_install:append:class-target () {
>         perl_native_fixup
> @@ -103,6 +105,7 @@ do_install:append:class-target () {
>  do_install:append:class-native() {
>         create_wrapper ${D}${bindir}/git \
>                 GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_PA=
TH} \
> +               GIT_SSL_CAINFO=3D'`dirname $''realpath`'/${REL_GIT_SSL_CA=
INFO} \
>                 GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TEMP=
LATE_DIR}
>  }
>
> if that is acceptable I could send a proper patch for review.

It looks fine to me. It follows the structure of the other variables.

I don't see any reason for a conditional or packageconfig dependency
on ca-certificates
(since https isn't exactly uncommon), and keeping everything contained
within the git
recipe is better this close to release.

That being said, I still wonder / think that curl should also just provide =
its
own dependency on ca-certificates, since it is the application that is actu=
ally
looking for them. I don't know if this way we'll run into some sort of issu=
e
with them not being available after sstate, cleanup or something else.

Definitely send it for review, hopefully those that are well versed in thos=
e
questions I have will see it and comment :)

Bruce

>
> Max
>
> [1] https://stackoverflow.com/questions/11621768/how-can-i-make-git-accep=
t-a-self-signed-certificate



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

