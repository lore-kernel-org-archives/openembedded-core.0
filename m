Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A95C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 13:26:27 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.5768.1655126779909783461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 06:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L9GuXYWU;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id y32so8845593lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lVIgvvu47/KwOUZraxoRRB2k5p80H5MMUQjr0Fqk+xs=;
        b=L9GuXYWU9JHI4Ot4SeC4ntvZY1x2oQi/gVKyJ8Qcm96lAMN+VPQsLaJSsKPIalxd0X
         NdpAsnxjJWB0V2nxZrwUga4/hdwATFt6qXyqBezxcly4i8+qno5xCaB2qf+msSmpobKF
         Dl7aeQuUDbeJutpx0FKw89ZHcYB91BAbAICQ5p5dJCyEup9zbdT1MV2EveuZ0Hi67zPR
         kl5aLsnkjJk/vB1uAijpR7ZO+6iz+gORlPZB0bYjOjSYbF6dd3NeIHhWu33RJXVbkXt+
         /6N+9LU63OJKJysIA5erNABvk4IkJYhQ05qwnXL2vuGZ1BWW3naNPuKTJi4DpTjD3JIz
         mbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lVIgvvu47/KwOUZraxoRRB2k5p80H5MMUQjr0Fqk+xs=;
        b=KRaxVpRXIc6I6VojbTdJiRGicAMj3vg0dWfmVNNYbxFXQ9X4+v5W8zFO06jl8jTvNs
         aqohQYLSv/r9wzwuvFB7qp+41NRWPtRXVyO4Nc4Rmkq36QybP6BPWaWPNp7+hUeSEiFf
         fhnb6zSpr3vJqjdTV5O3D7hRUrLADSkMPIsQMVBuNfKx3sXVs+6k0eofjJDjNNk2JYp3
         VnUaVFxabOwnu/B2ayCDSas2CNChrGLqUYcNYfg6hTvl29lKyLHsxiCSMehyR5is0del
         eaVahgTk47gNnR11fjRJF2Nt1XVurpNOnGxYCMDPmdP5h2EJl23chwmJ4mHHw0zl632y
         gQgw==
X-Gm-Message-State: AOAM5335PgFuclLocCbHxF7rT0Rz4GY3PHOqXTTDOv/JPVL658Rdb7I2
	RYXvgUSwLat+7S2o1DOU0bG0u0lE/l8QqVVU2LE=
X-Google-Smtp-Source: 
 ABdhPJymO9WIDa8BAnnOeWKWlzO+Vz/yVRdPhBhjZ6vWtgFOvftV6NqHXiJrlY5TkUCc8U3XilHSEgoQh+SYwZTDzCQ=
X-Received: by 2002:ac2:48ab:0:b0:47d:af82:65e9 with SMTP id
 u11-20020ac248ab000000b0047daf8265e9mr9852804lfg.673.1655126778053; Mon, 13
 Jun 2022 06:26:18 -0700 (PDT)
MIME-Version: 1.0
References: 
 <01010181200fec93-2abce4ac-3ed8-402a-8127-c076f733d788-000000@us-west-2.amazonses.com>
 <CANNYZj9cfUQkS+oDpW7hK5Zi4JWnsmYnEeU5+X-9onRcMSw0fA@mail.gmail.com>
 <260249af-2c6a-dbde-96a3-65a80c451ea8@windriver.com>
In-Reply-To: <260249af-2c6a-dbde-96a3-65a80c451ea8@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jun 2022 15:26:06 +0200
Message-ID: 
 <CANNYZj_WDmAaji4tiUQi9=w1bwMTQ810tO-HUXqroSMAZa21Mg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.61.0 FAILED
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Gowda, Naveen" <naveen.gowda@windriver.com>,
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 13:26:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166843

To get started quicker, I have a recipe update commit on top of this
branch, which you are welcome to cherry-pick:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-version=
-updates-later

Alex

On Mon, 13 Jun 2022 at 15:01, Randy MacLeod <randy.macleod@windriver.com> w=
rote:
>
> On 2022-06-13 04:15, Alexander Kanavin wrote:
> > Rust 1.61 is held by rust-native regressing on red hat distros; fedora
> > 34/35, centos/alma 8 all show this:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3151
> >
> > Alex
>
> Thanks Alex.
>
>
> Naveen, Sundeep,
>
> It looks like there's been a change to how or if libstdc++-static is used=
:
>
> https://github.com/rust-lang/rust/issues/97138
>
>
> This change is part of 1.61:
>
> https://github.com/rust-lang/rust/pull/94832
>
> so perhaps we need to change our recipe. Anyway, I only took a quick look=
.
> Please work on this issue ASAP.
>
> ../Randy
>
>
> >
> > On Wed, 1 Jun 2022 at 18:19, Auto Upgrade Helper <auh@yoctoproject.org>=
 wrote:
> >> Hello,
> >>
> >> this email is a notification from the Auto Upgrade Helper
> >> that the automatic attempt to upgrade the recipe *rust-llvm* to *1.61.=
0* has Failed (devtool error).
> >>
> >> Detailed error information:
> >>
> >> The following devtool command failed:  finish -f rust-llvm /home/pokyb=
uild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
> >> NOTE: Starting bitbake server...
> >> WARNING: Host distribution "almalinux-8.6" has not been validated with=
 this version of the build system; you may possibly experience unexpected f=
ailures. It is recommended that you use a tested distribution.
> >> Loading cache...done.
> >> Loaded 1643 entries from dependency cache.
> >> Parsing recipes...done.
> >> Parsing of 884 .bb files complete (883 cached, 1 parsed). 1644 targets=
, 35 skipped, 0 masked, 0 errors.
> >>
> >> Summary: There was 1 WARNING message.
> >>
> >> ERROR: Traceback (most recent call last):
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/cookerdata.py", line 162, in wrapped
> >>      return func(fn, *args)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/cookerdata.py", line 187, in parse_config_file
> >>      return bb.parse.handle(fn, data, include)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/parse/__init__.py", line 107, in handle
> >>      return h['handle'](fn, data, include)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/parse/parse_py/ConfHandler.py", line 118, in handle
> >>      abs_fn =3D resolve_file(fn, data)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/parse/__init__.py", line 133, in resolve_file
> >>      raise IOError(errno.ENOENT, "file %s not found" % fn)
> >> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/bui=
ld/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
> >>
> >> ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/po=
ky/meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybui=
ld/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.=
conf not found
> >> Traceback (most recent call last):
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/cookerdata.py", line 162, in wrapped
> >>      return func(fn, *args)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/cookerdata.py", line 187, in parse_config_file
> >>      return bb.parse.handle(fn, data, include)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/parse/__init__.py", line 107, in handle
> >>      return h['handle'](fn, data, include)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/parse/parse_py/ConfHandler.py", line 118, in handle
> >>      abs_fn =3D resolve_file(fn, data)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/parse/__init__.py", line 133, in resolve_file
> >>      raise IOError(errno.ENOENT, "file %s not found" % fn)
> >> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/bui=
ld/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
> >>
> >> During handling of the above exception, another exception occurred:
> >>
> >> Traceback (most recent call last):
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/dev=
tool", line 334, in <module>
> >>      ret =3D main()
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/dev=
tool", line 321, in main
> >>      ret =3D args.func(args, config, basepath, workspace)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib=
/devtool/standard.py", line 2108, in finish
> >>      updated, appendfile, removed =3D _update_recipe(args.recipename, =
workspace, rd, args.mode, appendlayerdir, wildcard_version=3DTrue, no_remov=
e=3DFalse, no_report_remove=3Dremoving_original, initial_rev=3Dargs.initial=
_rev, dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_overrides, fo=
rce_patch_refresh=3Dargs.force_patch_refresh)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib=
/devtool/standard.py", line 1814, in _update_recipe
> >>      updated, appendf, removed =3D _update_recipe_patch(recipename, wo=
rkspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_repo=
rt_remove, initial_rev, dry_run_outdir, force_patch_refresh)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib=
/devtool/standard.py", line 1671, in _update_recipe_patch
> >>      redirect_output=3Ddry_run_outdir)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe=
/recipeutils.py", line 705, in bbappend_recipe
> >>      appendpath, pathok =3D get_bbappend_path(rd, destlayerdir, wildca=
rdver)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe=
/recipeutils.py", line 632, in get_bbappend_path
> >>      confdata =3D bb.cookerdata.parse_config_file(destlayerconf, confd=
ata)
> >>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib=
/bb/cookerdata.py", line 167, in wrapped
> >>      raise bb.BBHandledException()
> >> bb.BBHandledException
> >>
> >>
> >> Please review the attached files for further information and build/upd=
ate failures.
> >> Any problem please file a bug at https://bugzilla.yoctoproject.org/ent=
er_bug.cgi?product=3DAutomated%20Update%20Handler
> >>
> >> Regards,
> >> The Upgrade Helper
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#166404): https://lists.openembedded.org/g/openembe=
dded-core/message/166404
> >> Mute This Topic: https://lists.openembedded.org/mt/91480159/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

