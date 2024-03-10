Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90530C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 16:05:13 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.40630.1710086709090552992
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 09:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S4nmKWRe;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e6872ce492so569030b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710086708; x=1710691508; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyLRTjpE/NxQAKn1cynHS7og5oO40KO3A1j1BUK/AOA=;
        b=S4nmKWReoo49I3mPi61ztA9BEK3/nQKww7RXFW5xOZxjCyj45bhCprra5HdUNVq4Cr
         pxMDkM3GJvLTmlGynsyoLHGv0D9JrxLtDxKe5IWy6yd5iiYt6CxNYytTQjnrQDEh69c5
         Pj1EmlL2X45iIR/OzvhME5bAMYnRXrqwgdpbE6+0Q962JZuU+ursUV666kAFaBB0vG4i
         ua/4Xt8RteNW5dTHVeCSTdRBOSwKDapcjsWdLgm/kT9GC01PM1HPPsyfwyuTRt+XiGkp
         z7Ktf/kn5mKsJYJ/Km4lbsR6vM+iKr+8gaCjiwMHRAq06+t088td930x4dW9iUXQYHV/
         wUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710086708; x=1710691508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyLRTjpE/NxQAKn1cynHS7og5oO40KO3A1j1BUK/AOA=;
        b=lsfF1Fl92YmwdSYIaX59vNA2g1GL6vvcJ3R8HEcz7ol5jpnvxTX/xpHHXLkG97xCim
         r9sLh64U6kPf9sNXybTXt46aRexJRkAfNN6hk28IlpNNcdOv3piuCWAlalnccDegkod5
         4vgaz3EVhn0DzVbBwyDVnF/AaStyyiwtgH8PLGgJO7CdBGxHQoQtuHVLcfy2evJtDbx6
         VE0G4s4z8k3ZSrTJxt+YbuBt5avLkBN5f4qJHRIYkJ2Cyg/MW4jKZ6pD7IR0sqihEIPZ
         9nIpo99ljyPCCY/QQO01PKg6l80OAo8UA9NDhX7QEsQAKWDFa2P8IxJpmB2TOomhIck4
         2A+w==
X-Forwarded-Encrypted: i=1; AJvYcCX0NPztWAyiqtKSZ8ZRU2L8HCVVeiG12tocSB265NvCXEJEGApSz1TdBYLRlzyydJlU79S84FsxL78mrRFHg/dQbae1fvrkOnCJYm/Or5lFtI5SzoBzMLcN
X-Gm-Message-State: AOJu0Yw28ZGGmd4ZfyPofrq6B+CbcpHkdBQeRWqQA+yYL7CAtsgUoUHi
	HdDYsE9haOxWdKpshUQ/f7sxE7mXbI3oQ7vTGUb249IeX7G/RbVUOyqEZZ+1+qENgo16d2GV392
	B20D+oSCStfrfAdnz6LRdSqwzg8E=
X-Google-Smtp-Source: AGHT+IE8pTFDuFO2imxN/ZwkNq7Aie97QNjMw6Uk8hXS5GNRFhf3SGp7CpNp28Co/2etDXf8Ud8SnE6+BuAV4b41F80=
X-Received: by 2002:a05:6a20:8f02:b0:1a1:50c3:d564 with SMTP id
 b2-20020a056a208f0200b001a150c3d564mr2657967pzk.1.1710086708335; Sun, 10 Mar
 2024 09:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240309175750.2621579-1-max.oss.09@gmail.com>
 <CADkTA4PBJDhGub=P0JbuhKHj0d2tXt8kx2SXDyvXRy6c2M7iww@mail.gmail.com>
 <d3359086952367d978a794500c474a472e6bc1cb.camel@gmail.com>
 <17BB69D476D2F4EF.5850@lists.openembedded.org> <099aad3c778f9f8cf736d894ad482bf9ab0bbe49.camel@linuxfoundation.org>
In-Reply-To: <099aad3c778f9f8cf736d894ad482bf9ab0bbe49.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Mar 2024 12:04:56 -0400
Message-ID: <CADkTA4M63P5JQRdMczuruF3i8MJvXzkiRUUWi8+iPvOqr1uELg@mail.gmail.com>
Subject: Re: [OE-core] [REGRESSION] linux (git/curl-native) and autorev
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Max <max.oss.09@gmail.com>, openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196899

On Sun, Mar 10, 2024 at 11:52=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2024-03-10 at 06:20 -0700, Richard Purdie via
> lists.openembedded.org wrote:
> > On Sun, 2024-03-10 at 13:31 +0100, Max wrote:
> > > Am Samstag, dem 09.03.2024 um 13:04 -0800 schrieb Bruce Ashfield:
> > > > On Sat, Mar 9, 2024 at 12:58=E2=80=AFPM <max.oss.09@gmail.com> wrot=
e:
> > > > >
> > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > >
> > > > > Hello
> > > > >
> > > > > If one builds a kernel using AUTOREV invoking bitbake only
> > > > > works
> > > > > once.
> > > > > Any subsequent bitbake invocation fails parsing the meta data.
> > > > >
> > > > > Reproducable with:
> > > > > - latest poky, b5624ee564
> > > > > - Kernel with SRCREV =3D "AUTOREV", e.g. in local.conf
> > > > >   `SRCREV_machine:pn-linux-yocto:forcevariable =3D "${AUTOREV}"`
> > > > > - bitbake virtual/kernel; bitbake virtual/kernel
> > > > >
> > > > > On the second invocation parsing fails when the fetcher tries
> > > > > to
> > > > > evaluate the latest SRCREV:
> > > > >
> > > > > > ERROR: ExpansionError during parsing meta/recipes-
> > > > > > kernel/linux/linux-yocto_6.6.bb
> > > > > > Traceback (most recent call last):
> > > > > >   File "bitbake/lib/bb/fetch2/__init__.py", line 1245, in
> > > > > > srcrev_internal_helper(ud=3D<bb.fetch2.FetchData object at
> > > > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > > > 0x7f8e26195890>, name=3D'machine'):
> > > > > >              d.setVar("__BBAUTOREV_ACTED_UPON", True)
> > > > > >     >        srcrev =3D ud.method.latest_revision(ud, d, name)
> > > > > >
> > > > > >   File "bitbake/lib/bb/fetch2/__init__.py", line 1667, in
> > > > > > Git.latest_revision(ud=3D<bb.fetch2.FetchData object at
> > > > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > > > 0x7f8e26195890>, name=3D'machine'):
> > > > > >              except KeyError:
> > > > > >     >            revs[key] =3D rev =3D self._latest_revision(ud=
,
> > > > > > d,
> > > > > > name)
> > > > > >                  return rev
> > > > > >   File "bitbake/lib/bb/fetch2/git.py", line 850, in
> > > > > > Git._latest_revision(ud=3D<bb.fetch2.FetchData object at
> > > > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > > > 0x7f8e26195890>, name=3D'machine'):
> > > > > >
> > > > > >     >        output =3D self._lsremote(ud, d, "")
> > > > > >              # Tags of the form ^{} may not work, need to
> > > > > > fallback to other form
> > > > > >   File "bitbake/lib/bb/fetch2/git.py", line 833, in
> > > > > > Git._lsremote(ud=3D<bb.fetch2.FetchData object at
> > > > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > > > 0x7f8e26195890>, search=3D''):
> > > > > >                      bb.fetch2.check_network_access(d, cmd,
> > > > > > repourl)
> > > > > >     >            output =3D runfetchcmd(cmd, d, True)
> > > > > >                  if not output:
> > > > > >   File "bitbake/lib/bb/fetch2/__init__.py", line 957, in
> > > > > > runfetchcmd(cmd=3D'export PSEUDO_DISABLED=3D1; export
> > > > > > DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1003/bus";
> > > > > > export
> > > > > > PATH=3D"build/tmp/sysroots-uninative/x86_64-
> > > > > > linux/usr/bin:scripts:build/tmp/work/qemux86_64-poky-
> > > > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/usr/bin/x86_64-poky-linux:build/tmp/work/qemux86_64-
> > > > > > poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > > > sysroot/usr/bin/crossscripts:build/tmp/work/qemux86_64-poky-
> > > > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/usr/bin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/bin:bitbake/bin:build/tmp/hosttools"; export
> > > > > > HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfalse -c
> > > > > > core.pager=3Dcat
> > > > > > -c safe.bareRepository=3Dall ls-remote
> > > > > > https://git.yoctoproject.org/linux-yocto.git ',
> > > > > > d=3D<bb.data_smart.DataSmart object at 0x7f8e26195890>,
> > > > > > quiet=3DTrue, cleanup=3D[], log=3DNone, workdir=3DNone):
> > > > > >
> > > > > >     >        raise FetchError(error_message)
> > > > > >
> > > > > > bb.data_smart.ExpansionError: Failure expanding variable
> > > > > > fetcher_hashes_dummyfunc[vardepvalue], expression was
> > > > > > ${@bb.fetch.get_hashvalue(d)} which triggered exception
> > > > > > FetchError: Fetcher failure: Fetch command export
> > > > > > PSEUDO_DISABLED=3D1; export
> > > > > > DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1003/bus";
> > > > > > export
> > > > > > PATH=3D"build/tmp/sysroots-uninative/x86_64-
> > > > > > linux/usr/bin:scripts:/var/home/krm/build/poky/build/tmp/work
> > > > > > /q
> > > > > > emux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/usr/bin/x86_64-poky-linux:build/tmp/work/qemux86_64-
> > > > > > poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > > > sysroot/usr/bin/crossscripts:build/tmp/work/qemux86_64-poky-
> > > > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/usr/bin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > native/bin:bitbake/bin:build/tmp/hosttools"; export
> > > > > > HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfalse -c
> > > > > > core.pager=3Dcat
> > > > > > -c safe.bareRepository=3Dall ls-remote
> > > > > > https://git.yoctoproject.org/linux-yocto.git  failed with
> > > > > > exit
> > > > > > code 128, output:
> > > > > > fatal: unable to access
> > > > > > 'https://git.yoctoproject.org/linux-yocto.git/': error
> > > > > > setting
> > > > > > certificate file: build/tmp/work/x86_64-linux/curl-
> > > > > > native/8.6.0/recipe-sysroot-native/etc/ssl/certs/ca-
> > > > > > certificates.crt
> > > > > >
> > > > > > The variable dependency chain for the failure is:
> > > > > > fetcher_hashes_dummyfunc[vardepvalue]
> > > > >
> > > > > Note:
> > > > > One gets out of that parser error by deleting the git binary in
> > > > > the
> > > > > kernel's work recipe-sysroot-native
> > > > > `rm tmp/work/qemux86_64-poky-linux/linux-
> > > > > yocto/6.6.20+git/recipe-
> > > > > sysroot-native/usr/bin/git`
> > > > >
> > > > > Bisecting poky leads to commit
> > > > > f7fa98cca8 ("kern-tools: depend on git-replacement-native")
> > > > > Reverting it on top of b5624ee564 makes the parsing pass.
> > > > >
> > > > > I assume that `git-replacement-native` does not work with
> > > > > https,
> > > > > the
> > > > > fetch error also goes away if changing in SRC_URI from https to
> > > > > git.
> > > > >
> > > > > Any comments?
> > > >
> > > > I didn't even know that curl was coming into play :)
> > > >
> > > > Adding DEPENDS:class-native +=3D "ca-certificates" to the curl
> > > > recipe
> > > > should resolve the issue.
> > >
> > > Looks like curl-native resp. libcurl hardcodes the lookup to its
> > > own
> > > work directory, i.e.:
> > > x86_64-linux/curl-native/8.6.0/recipe-sysroot-
> > > native/etc/ssl/certs/ca-certificates.crt
> > >
> > > So even if DEPENDS/RDEPENDS will install ca-certificates in the
> > > kernel's
> > > recipe-sysroot-native the parsing will fail if the curl-native
> > > directory
> > > is not/no longer populated, e.g. because curl-native came from
> > > sstate
> > > or
> > > rm_work is in INHERIT.
> >
> > This all gets a bit messy.
> >
> > We've relied upon scripts that use openssl to set variables like:
> >
> > export SSL_CERT_DIR=3D"XXXX/etc/ssl/certs/
> >
> > so in theory we might be able to set an environment variable in a
> > wrapper around the git commands.
> >
> > It may be better if we teach curl a relative path to the certs...
> >
> > I suspect this isn't going to be an easy/neat fix unfortunately.
>
> I'm trying not to get sucked into "work" today however I realised that
> relative paths won't work without some implementation of "$ORIGIN"
> support into these paths. Given it ultimately ends up in openssl, it
> would probably be best there.
>
> I'd not be against writing a $ORIGIN support patch and seeing what
> upstream think about it. It would still mean finding a way to find the
> path to the library file somehow.
>
> For purposes of the release, setting the right envvars in the git
> wrapper is probably the way forward for now, much as I dislike the
> requirement to do that.

I tried this, but curl didn't seem to use it to locate the cert file.

i.e., I tried this:

---------------

diff --git a/meta/recipes-devtools/git/git_2.44.0.bb
b/meta/recipes-devtools/git/git_2.44.0.bb
index e6d1470873..f6b06ec601 100644
--- a/meta/recipes-devtools/git/git_2.44.0.bb
+++ b/meta/recipes-devtools/git/git_2.44.0.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG ??=3D "expat curl"
 PACKAGECONFIG[cvsserver] =3D ""
 PACKAGECONFIG[svn] =3D ""
 PACKAGECONFIG[manpages] =3D ",,asciidoc-native xmlto-native"
-PACKAGECONFIG[curl] =3D "--with-curl,--without-curl,curl"
+PACKAGECONFIG[curl] =3D "--with-curl,--without-curl,curl ca-certificates"
 PACKAGECONFIG[expat] =3D "--with-expat,--without-expat,expat"

 EXTRA_OECONF =3D "--with-perl=3D${STAGING_BINDIR_NATIVE}/perl-native/perl =
\
@@ -103,13 +103,15 @@ do_install:append:class-target () {
 do_install:append:class-native() {
        create_wrapper ${D}${bindir}/git \
                GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_PATH=
} \
-               GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TEMPLA=
TE_DIR}
+               GIT_TEMPLATE_DIR=3D'`dirname
$''realpath`'/${REL_GIT_TEMPLATE_DIR} \
+               SSL_CERT_DIR=3D'`dirname $''realpath`'/../../etc/ssl/certs/
 }

 do_install:append:class-nativesdk() {
        create_wrapper ${D}${bindir}/git \
                GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_PATH=
} \
                GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TEMPLA=
TE_DIR}
+               SSL_CERT_DIR=3D'`dirname $''realpath`'/../../etc/ssl/certs/
        perl_native_fixup
 }

---------

Probably because the exec of curl from git isn't getting the
environment ? Either
that, or I did it wrong. I didn't try it as an explicit export, and
that is probably it,
I can try that later tonight.

Only when I added the depends on ca-certifications to curl itself was it ab=
le to
fetch the autorevs.

Bruce

>
> This does feel like a problem it would be good to solve for wider Linux
> in general for relocatable (and reproducible) binaries.
>
> Cheers,
>
> Richard
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

