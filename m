Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6355C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 12:54:30 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.61912.1710161666713045502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 05:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZGwa3pYS;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5131c48055cso4398526e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 05:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710161665; x=1710766465; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/H7F7YYGz/LjU0T7vK8SjeGAOSE9vzmRsBe8n1qR5VE=;
        b=ZGwa3pYS2ZCe4kxZPGwUOIe4yELnfh/2QeA6R2GnVdkBK4msAiQJZOhZ9zgemJ/BwH
         +UAYCjNg4UvPM1KHlDTD1R+LuZ0CgtoOQqnVHqHFu+DYnGhoBfTA5vBK7NlFwghPnOHA
         +IbDovB5u1zJOG0VLA3KPJkcZYmZrAE92dDBJm92F81OaRbRAZCNY0O3yKymC/Wwtyn8
         ipXh1aREYbfCluEUph+D7vp/NX5RjDQ5iKAHRr6Ys8lA/5qb9LkRpiSo93Dmoq3MeHS0
         vLeoMbwoXU4ih2cL7Ye37egvqrUOQzRbMExTZtx/yAutcxx/Z8b512tnsDrmz47netLC
         Sy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710161665; x=1710766465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/H7F7YYGz/LjU0T7vK8SjeGAOSE9vzmRsBe8n1qR5VE=;
        b=Rwp3D+isqGTmIQc3vZa+0H+gdIFl1NNYZbTmSF+BvtwA1yhEQe5TL3cyqylM/dwCcj
         LD14VJGGmFEwbOg18G+LNCNjoJl7Pow0B+mu83QCg8YiyuHCyH8ztNPXf5W2hBO79nNE
         tDHMyDhy3VaJtw8NjVQhVeWWIjUP4gaW4PizL0uExQHhJslQoXvEwbTb5TBhvhE++zog
         VzgT6TOPZr0vZs8EK74f5AsJ7KzuqYv6IJgAYcRT8X2f9nLxokMLSY2Ixf6qu+EXlyh6
         YVI49Y9MCG7yM8bax/p7Jg9Kjsa1OpSWBZBYT1Grtr7MdygQ7VY9KhdlAzuXEfOjz69D
         N0eg==
X-Forwarded-Encrypted: i=1; AJvYcCWyrVW8VA+Ax5oWjux3hJpl71V8SCXAwlsmBY0IFP+YrS7SaeonJ5ixwPzxUifhvGpxGJ0YYPBs3YliWC0t/IluzObeCd1ucaEs2h/RK7kyxBdgb1a/BOU7
X-Gm-Message-State: AOJu0Yy19uUXiJvHxcIH2RgWoikKlQVVtLoeYmnY5ZKPZSvikI2tciDT
	JCeYqFpHicLdFCxLfbWXCdKv3GaqxN546me+LKhZpON06DIz29/UaV2AkYEg
X-Google-Smtp-Source: AGHT+IG++8baXeTwCPbhUYD2/Elg0Pz40mqiBQVTGHbr863A0oODyLktlcPgbg/6EIGHMBVXtv6HjQ==
X-Received: by 2002:ac2:5e8e:0:b0:513:2de3:6274 with SMTP id b14-20020ac25e8e000000b005132de36274mr3588960lfq.55.1710161664471;
        Mon, 11 Mar 2024 05:54:24 -0700 (PDT)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id u12-20020a05600c19cc00b004126afe04f6sm15482929wmq.32.2024.03.11.05.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 05:54:24 -0700 (PDT)
Date: Mon, 11 Mar 2024 13:54:22 +0100
From: Max Krummenacher <max.oss.09@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [OE-core] [REGRESSION] linux (git/curl-native) and autorev
Message-ID: <Ze7-_oIu3TFpyuT7@toolbox>
References: <20240309175750.2621579-1-max.oss.09@gmail.com>
 <CADkTA4PBJDhGub=P0JbuhKHj0d2tXt8kx2SXDyvXRy6c2M7iww@mail.gmail.com>
 <d3359086952367d978a794500c474a472e6bc1cb.camel@gmail.com>
 <17BB69D476D2F4EF.5850@lists.openembedded.org>
 <099aad3c778f9f8cf736d894ad482bf9ab0bbe49.camel@linuxfoundation.org>
 <CADkTA4M63P5JQRdMczuruF3i8MJvXzkiRUUWi8+iPvOqr1uELg@mail.gmail.com>
 <86838facff259ce36c5e1011488538c7be1de00f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86838facff259ce36c5e1011488538c7be1de00f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 12:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196935

On Sun, Mar 10, 2024 at 11:39:00PM +0000, Richard Purdie wrote:
> On Sun, 2024-03-10 at 09:05 -0700, Bruce Ashfield wrote:
> > On Sun, Mar 10, 2024 at 11:52 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > On Sun, 2024-03-10 at 06:20 -0700, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Sun, 2024-03-10 at 13:31 +0100, Max wrote:
> > > > > Am Samstag, dem 09.03.2024 um 13:04 -0800 schrieb Bruce
> > > > > Ashfield:
> > > > > > On Sat, Mar 9, 2024 at 12:58 PM <max.oss.09@gmail.com> wrote:
> > > > > > > 
> > > > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > > 
> > > > > > > Hello
> > > > > > > 
> > > > > > > If one builds a kernel using AUTOREV invoking bitbake only
> > > > > > > works
> > > > > > > once.
> > > > > > > Any subsequent bitbake invocation fails parsing the meta
> > > > > > > data.
> > > > > > > 
> > > > > > > Reproducable with:
> > > > > > > - latest poky, b5624ee564
> > > > > > > - Kernel with SRCREV = "AUTOREV", e.g. in local.conf
> > > > > > >   `SRCREV_machine:pn-linux-yocto:forcevariable =
> > > > > > > "${AUTOREV}"`
> > > > > > > - bitbake virtual/kernel; bitbake virtual/kernel
> > > > > > > 
> > > > > > > On the second invocation parsing fails when the fetcher
> > > > > > > tries
> > > > > > > to
> > > > > > > evaluate the latest SRCREV:
> > > > > > > 
> > > > > > > > ERROR: ExpansionError during parsing meta/recipes-
> > > > > > > > kernel/linux/linux-yocto_6.6.bb
> > > > > > > > Traceback (most recent call last):
> > > > > > > >   File "bitbake/lib/bb/fetch2/__init__.py", line 1245, in
> > > > > > > > srcrev_internal_helper(ud=<bb.fetch2.FetchData object at
> > > > > > > > 0x7f8e26f5f290>, d=<bb.data_smart.DataSmart object at
> > > > > > > > 0x7f8e26195890>, name='machine'):
> > > > > > > >              d.setVar("__BBAUTOREV_ACTED_UPON", True)
> > > > > > > >     >        srcrev = ud.method.latest_revision(ud, d,
> > > > > > > > name)
> > > > > > > > 
> > > > > > > >   File "bitbake/lib/bb/fetch2/__init__.py", line 1667, in
> > > > > > > > Git.latest_revision(ud=<bb.fetch2.FetchData object at
> > > > > > > > 0x7f8e26f5f290>, d=<bb.data_smart.DataSmart object at
> > > > > > > > 0x7f8e26195890>, name='machine'):
> > > > > > > >              except KeyError:
> > > > > > > >     >            revs[key] = rev =
> > > > > > > > self._latest_revision(ud,
> > > > > > > > d,
> > > > > > > > name)
> > > > > > > >                  return rev
> > > > > > > >   File "bitbake/lib/bb/fetch2/git.py", line 850, in
> > > > > > > > Git._latest_revision(ud=<bb.fetch2.FetchData object at
> > > > > > > > 0x7f8e26f5f290>, d=<bb.data_smart.DataSmart object at
> > > > > > > > 0x7f8e26195890>, name='machine'):
> > > > > > > > 
> > > > > > > >     >        output = self._lsremote(ud, d, "")
> > > > > > > >              # Tags of the form ^{} may not work, need to
> > > > > > > > fallback to other form
> > > > > > > >   File "bitbake/lib/bb/fetch2/git.py", line 833, in
> > > > > > > > Git._lsremote(ud=<bb.fetch2.FetchData object at
> > > > > > > > 0x7f8e26f5f290>, d=<bb.data_smart.DataSmart object at
> > > > > > > > 0x7f8e26195890>, search=''):
> > > > > > > >                      bb.fetch2.check_network_access(d,
> > > > > > > > cmd,
> > > > > > > > repourl)
> > > > > > > >     >            output = runfetchcmd(cmd, d, True)
> > > > > > > >                  if not output:
> > > > > > > >   File "bitbake/lib/bb/fetch2/__init__.py", line 957, in
> > > > > > > > runfetchcmd(cmd='export PSEUDO_DISABLED=1; export
> > > > > > > > DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1003/bus";
> > > > > > > > export
> > > > > > > > PATH="build/tmp/sysroots-uninative/x86_64-
> > > > > > > > linux/usr/bin:scripts:build/tmp/work/qemux86_64-poky-
> > > > > > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > native/usr/bin/x86_64-poky-
> > > > > > > > linux:build/tmp/work/qemux86_64-
> > > > > > > > poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > > > > > sysroot/usr/bin/crossscripts:build/tmp/work/qemux86_64-
> > > > > > > > poky-
> > > > > > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > native/usr/sbin:build/tmp/work/qemux86_64-poky-
> > > > > > > > linux/linux-
> > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > native/usr/bin:build/tmp/work/qemux86_64-poky-
> > > > > > > > linux/linux-
> > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > native/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > native/bin:bitbake/bin:build/tmp/hosttools"; export
> > > > > > > > HOME="/home/krm"; git -c gc.autoDetach=false -c
> > > > > > > > core.pager=cat
> > > > > > > > -c safe.bareRepository=all ls-remote
> > > > > > > > https://git.yoctoproject.org/linux-yocto.git ',
> > > > > > > > d=<bb.data_smart.DataSmart object at 0x7f8e26195890>,
> > > > > > > > quiet=True, cleanup=[], log=None, workdir=None):
> > > > > > > > 
> > > > > > > >     >        raise FetchError(error_message)
> > > > > > > > 
> > > > > > > > bb.data_smart.ExpansionError: Failure expanding variable
> > > > > > > > fetcher_hashes_dummyfunc[vardepvalue], expression was
> > > > > > > > ${@bb.fetch.get_hashvalue(d)} which triggered exception
> > > > > > > > FetchError: Fetcher failure: Fetch command export
> > > > > > > > PSEUDO_DISABLED=1; export
> > > > > > > > DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1003/bus";
> > > > > > > > export
> > > > > > > > PATH="build/tmp/sysroots-uninative/x86_64-
> > > > > > > > linux/usr/bin:scripts:/var/home/krm/build/poky/build/tmp/
> > > > > > > > work
> > > > > > > > /q
> > > > > > > > emux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > > > > > sysroot-
> > > > > > > > native/usr/bin/x86_64-poky-
> > > > > > > > linux:build/tmp/work/qemux86_64-
> > > > > > > > poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > > > > > sysroot/usr/bin/crossscripts:build/tmp/work/qemux86_64-
> > > > > > > > poky-
> > > > > > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > native/usr/sbin:build/tmp/work/qemux86_64-poky-
> > > > > > > > linux/linux-
> > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > native/usr/bin:build/tmp/work/qemux86_64-poky-
> > > > > > > > linux/linux-
> > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > native/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > > > > > yocto/6.6.20+git/recipe-sysroot-
> > > > > > > > native/bin:bitbake/bin:build/tmp/hosttools"; export
> > > > > > > > HOME="/home/krm"; git -c gc.autoDetach=false -c
> > > > > > > > core.pager=cat
> > > > > > > > -c safe.bareRepository=all ls-remote
> > > > > > > > https://git.yoctoproject.org/linux-yocto.git  failed with
> > > > > > > > exit
> > > > > > > > code 128, output:
> > > > > > > > fatal: unable to access
> > > > > > > > 'https://git.yoctoproject.org/linux-yocto.git/': error
> > > > > > > > setting
> > > > > > > > certificate file: build/tmp/work/x86_64-linux/curl-
> > > > > > > > native/8.6.0/recipe-sysroot-native/etc/ssl/certs/ca-
> > > > > > > > certificates.crt
> > > > > > > > 
> > > > > > > > The variable dependency chain for the failure is:
> > > > > > > > fetcher_hashes_dummyfunc[vardepvalue]
> > > > > > > 
> > > > > > > Note:
> > > > > > > One gets out of that parser error by deleting the git
> > > > > > > binary in
> > > > > > > the
> > > > > > > kernel's work recipe-sysroot-native
> > > > > > > `rm tmp/work/qemux86_64-poky-linux/linux-
> > > > > > > yocto/6.6.20+git/recipe-
> > > > > > > sysroot-native/usr/bin/git`
> > > > > > > 
> > > > > > > Bisecting poky leads to commit
> > > > > > > f7fa98cca8 ("kern-tools: depend on git-replacement-native")
> > > > > > > Reverting it on top of b5624ee564 makes the parsing pass.
> > > > > > > 
> > > > > > > I assume that `git-replacement-native` does not work with
> > > > > > > https,
> > > > > > > the
> > > > > > > fetch error also goes away if changing in SRC_URI from
> > > > > > > https to
> > > > > > > git.
> > > > > > > 
> > > > > > > Any comments?
> > > > > > 
> > > > > > I didn't even know that curl was coming into play :)
> > > > > > 
> > > > > > Adding DEPENDS:class-native += "ca-certificates" to the curl
> > > > > > recipe
> > > > > > should resolve the issue.
> > > > > 
> > > > > Looks like curl-native resp. libcurl hardcodes the lookup to
> > > > > its
> > > > > own
> > > > > work directory, i.e.:
> > > > > x86_64-linux/curl-native/8.6.0/recipe-sysroot-
> > > > > native/etc/ssl/certs/ca-certificates.crt
> > > > > 
> > > > > So even if DEPENDS/RDEPENDS will install ca-certificates in the
> > > > > kernel's
> > > > > recipe-sysroot-native the parsing will fail if the curl-native
> > > > > directory
> > > > > is not/no longer populated, e.g. because curl-native came from
> > > > > sstate
> > > > > or
> > > > > rm_work is in INHERIT.
> > > > 
> > > > This all gets a bit messy.
> > > > 
> > > > We've relied upon scripts that use openssl to set variables like:
> > > > 
> > > > export SSL_CERT_DIR="XXXX/etc/ssl/certs/
> > > > 
> > > > so in theory we might be able to set an environment variable in a
> > > > wrapper around the git commands.
> > > > 
> > > > It may be better if we teach curl a relative path to the certs...
> > > > 
> > > > I suspect this isn't going to be an easy/neat fix unfortunately.
> > > 
> > > I'm trying not to get sucked into "work" today however I realised
> > > that
> > > relative paths won't work without some implementation of "$ORIGIN"
> > > support into these paths. Given it ultimately ends up in openssl,
> > > it
> > > would probably be best there.
> > > 
> > > I'd not be against writing a $ORIGIN support patch and seeing what
> > > upstream think about it. It would still mean finding a way to find
> > > the
> > > path to the library file somehow.
> > > 
> > > For purposes of the release, setting the right envvars in the git
> > > wrapper is probably the way forward for now, much as I dislike the
> > > requirement to do that.
> > 
> > I tried this, but curl didn't seem to use it to locate the cert file.
> > 
> > i.e., I tried this:
> > 
> > ---------------
> > 
> > diff --git a/meta/recipes-devtools/git/git_2.44.0.bb
> > b/meta/recipes-devtools/git/git_2.44.0.bb
> > index e6d1470873..f6b06ec601 100644
> > --- a/meta/recipes-devtools/git/git_2.44.0.bb
> > +++ b/meta/recipes-devtools/git/git_2.44.0.bb
> > @@ -31,7 +31,7 @@ PACKAGECONFIG ??= "expat curl"
> >  PACKAGECONFIG[cvsserver] = ""
> >  PACKAGECONFIG[svn] = ""
> >  PACKAGECONFIG[manpages] = ",,asciidoc-native xmlto-native"
> > -PACKAGECONFIG[curl] = "--with-curl,--without-curl,curl"
> > +PACKAGECONFIG[curl] = "--with-curl,--without-curl,curl ca-
> > certificates"
> >  PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat"
> > 
> >  EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-
> > native/perl \
> > @@ -103,13 +103,15 @@ do_install:append:class-target () {
> >  do_install:append:class-native() {
> >         create_wrapper ${D}${bindir}/git \
> >                 GIT_EXEC_PATH='`dirname
> > $''realpath`'/${REL_GIT_EXEC_PATH} \
> > -               GIT_TEMPLATE_DIR='`dirname
> > $''realpath`'/${REL_GIT_TEMPLATE_DIR}
> > +               GIT_TEMPLATE_DIR='`dirname
> > $''realpath`'/${REL_GIT_TEMPLATE_DIR} \
> > +               SSL_CERT_DIR='`dirname
> > $''realpath`'/../../etc/ssl/certs/
> >  }
> > 
> >  do_install:append:class-nativesdk() {
> >         create_wrapper ${D}${bindir}/git \
> >                 GIT_EXEC_PATH='`dirname
> > $''realpath`'/${REL_GIT_EXEC_PATH} \
> >                 GIT_TEMPLATE_DIR='`dirname
> > $''realpath`'/${REL_GIT_TEMPLATE_DIR}
> > +               SSL_CERT_DIR='`dirname
> > $''realpath`'/../../etc/ssl/certs/
> >         perl_native_fixup
> >  }
> > 
> > ---------
> > 
> > Probably because the exec of curl from git isn't getting the
> > environment ? Either
> > that, or I did it wrong. I didn't try it as an explicit export, and
> > that is probably it,
> > I can try that later tonight.
> > 
> > Only when I added the depends on ca-certifications to curl itself was
> > it able to
> > fetch the autorevs.
> 
> We probably need both the variable (to avoid the workdir removal issue)
> and the dependency.
> 
> Cheers,
> 
> Richard
> 

Looks like git has its own cainfo path env variable, SSL_CERT_DIR
seems to not work. [1]

The following changes did make AUTOREV work for me:

--- a/meta/recipes-devtools/git/git_2.44.0.bb
+++ b/meta/recipes-devtools/git/git_2.44.0.bb
@@ -4,6 +4,7 @@ DESCRIPTION = "Git is a free and open source distributed version control system
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 & LGPL-2.1-or-later"
 DEPENDS = "openssl zlib"
+DEPENDS:class-native += "ca-certificates"
 
 PROVIDES:append:class-native = " git-replacement-native"
 
@@ -95,6 +96,7 @@ perl_native_fixup () {
 
 REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
 REL_GIT_TEMPLATE_DIR = "${@os.path.relpath(datadir, bindir)}/git-core/templates"
+REL_GIT_SSL_CAINFO = "${@os.path.relpath(sysconfdir, bindir)}/ssl/certs/ca-certificates.crt"
 
 do_install:append:class-target () {
 	perl_native_fixup
@@ -103,6 +105,7 @@ do_install:append:class-target () {
 do_install:append:class-native() {
 	create_wrapper ${D}${bindir}/git \
 		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
+		GIT_SSL_CAINFO='`dirname $''realpath`'/${REL_GIT_SSL_CAINFO} \
 		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
 }

if that is acceptable I could send a proper patch for review.

Max

[1] https://stackoverflow.com/questions/11621768/how-can-i-make-git-accept-a-self-signed-certificate

