Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93130E82CD8
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:36:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.27531.1695847007316991188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X9wgGmP0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so122937035e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 13:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695847005; x=1696451805; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyQZW734er+D0ALuA8u+xx6b1aJ8f9VW/l6A3SqttM0=;
        b=X9wgGmP0laJZxotkYBP/sHRjpkM4OvXcJj6XMEXOXdTYCUASPFLt+ob7QhmCSpRTMR
         x0+xAqkvlKd429u9l2Hp9cFM++4AwqkwaeyBnwvPOUFpYrwb/TtKcBse8Z8y5KdPdlrD
         bH44lIFfyRyOioQYFTZgLwEL0ldpPI/LNKkwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695847005; x=1696451805;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyQZW734er+D0ALuA8u+xx6b1aJ8f9VW/l6A3SqttM0=;
        b=UlxaApZvZzhHiO1Ek4RmAw4MkmS3DkGvtEltN1RhRNaO5CSf4rAZJuI1qX+SQEO8ef
         ekIMQTtke+QoHodBRf6Io36+bQemdud6tyFQBzCWr6Y6N3jCJhVB9LZ9yzpmqlL4D+w/
         d+7w/ydByPKzCJuknVFuIGKLoGetAAuFsPmpv92EDtGii+BXFnm3CXqVnLv5aDIUjAsS
         9wfb9WXOVILJkPvCP3QNVvMTcqJLS1SZ6aiXDH/IgiOfTF7m0KzYtXfHg1umZRT+LWP3
         lfmnvWEcDSlBpJVcxHqTDtyrbh9jMmobJe8skfTTwbc7OB3c5fXUfYyK9kSM7aI9W+nJ
         BNcw==
X-Gm-Message-State: AOJu0YxsGXp1EFEcQv7acvIIlrEyVYjsb7zI2OPgvq8Hqzue/2km7NoI
	fpMTmkJHt8U2v1XhoxXGzHPEUg==
X-Google-Smtp-Source: AGHT+IFulnTIVcg9VEglgzJAAod+91s0DG3EWofzY1y5/sTUSaSCxKmENG8SsBP5BjsUNpjnCI2qhQ==
X-Received: by 2002:a05:600c:21d5:b0:405:3dbc:8821 with SMTP id x21-20020a05600c21d500b004053dbc8821mr2981496wmj.22.1695847005562;
        Wed, 27 Sep 2023 13:36:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:259f:7d13:e5a1:bb93? ([2001:8b0:aba:5f3c:259f:7d13:e5a1:bb93])
        by smtp.gmail.com with ESMTPSA id m14-20020a7bca4e000000b003fefb94ccc9sm18371795wml.11.2023.09.27.13.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 13:36:45 -0700 (PDT)
Message-ID: <b6f77a1dcd43ccf41ee40d6971010e64f8319bd6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: modify: correctly handle multiple
 sources in SRC_URI
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2023 21:36:44 +0100
In-Reply-To: <20230927165024.2342635-1-jstephan@baylibre.com>
References: <20230927165024.2342635-1-jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 20:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188342

On Wed, 2023-09-27 at 18:50 +0200, Julien Stephan wrote:
> [YOCTO #15162]
>=20
> When recipes such as bzip2 have several sources in SRC_URI, all the
> sources are correctly extracted into devtool temporary workdir, but
> currently, we only get back the primary source and all files declared
> using "files://", then the devtool temporary workdir is deleted
>=20
> Fix this by moving all remaining files from devtool temporary workdir
> into actual WORKDIR (except "source-date-epoch", "recipe-sysroot",
> and "recipe-sysroot-native") before deleting it
>=20
> Here is the stack trace from devtool modify/build bzip2:
>=20
> NOTE: bzip2: compiling from external source tree <...>/build/workspace/so=
urces/bzip2
> ERROR: bzip2-1.0.8-r0 do_install_ptest_base: ExecutionError('<...>/build/=
tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.336=
8', 1, None, None)
> ERROR: Logfile of failure stored in: <...>/build/tmp/work/core2-64-poky-l=
inux/bzip2/1.0.8/temp/log.do_install_ptest_base.3368
> Log data follows:
> > DEBUG: Executing shell function do_install_ptest_base
> > NOTE: make -j 16 DESTDIR=3D<...>/build/tmp/work/core2-64-poky-linux/bzi=
p2/1.0.8/image/usr/lib/bzip2/ptest install-ptest
> > sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> >            ../../../../../../workspace/sources/bzip2/Makefile.am      >=
 <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/p=
test/Makefile
> > cp ../../../../../../workspace/sources/bzip2/sample1.ref      <...>/bui=
ld/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > cp ../../../../../../workspace/sources/bzip2/sample2.ref      <...>/bui=
ld/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > cp ../../../../../../workspace/sources/bzip2/sample3.ref      <...>/bui=
ld/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > cp ../../../../../../workspace/sources/bzip2/sample1.bz2      <...>/bui=
ld/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > cp ../../../../../../workspace/sources/bzip2/sample2.bz2      <...>/bui=
ld/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > cp ../../../../../../workspace/sources/bzip2/sample3.bz2      <...>/bui=
ld/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > ln -s /usr/bin/bzip2          <...>/build/tmp/work/core2-64-poky-linux/=
bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2
> > cp: cannot stat '<...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/g=
it/commons-compress': No such file or directory
> > WARNING: <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.=
do_install_ptest_base.3368:189 exit 1 from 'cp -r <...>/build/tmp/work/core=
2-64-poky-linux/bzip2/
> 1.0.8/git/commons-compress <...>/build/tmp/work/core2-64-poky-linux/bzip2=
/1.0.8/image/usr/lib/bzip2/ptest/bzip2-tests/commons-compress'
> > WARNING: Backtrace (BB generated script):
> >       #1: do_install_ptest, <...>/build/tmp/work/core2-64-poky-linux/bz=
ip2/1.0.8/temp/run.do_install_ptest_base.3368, line 189
> >       #2: do_install_ptest_base, <...>/build/tmp/work/core2-64-poky-lin=
ux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 158
> >       #3: main, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/te=
mp/run.do_install_ptest_base.3368, line 226
> ERROR: Task (<...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_ins=
tall_ptest_base) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 776 tasks of which 765 didn't need to be r=
erun and 1 failed.
>=20
> Summary: 1 task failed:
>   <...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_=
base
>=20
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  scripts/lib/devtool/standard.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index d53fb810071..6c8ad7a6c8c 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -684,6 +684,14 @@ def _extract_source(srctree, keep_temp, devbranch, s=
ync, config, basepath, works
>              shutil.move(srcsubdir, srctree)
>              symlink_oelocal_files_srctree(d,srctree)
> =20
> +            # In case SRC_URI contains multiple sources
> +            # they are extracted into the devtool temporary workdir
> +            # We need to move them into WORKDIR, otherwise they will be =
lost
> +            for path in os.listdir(os.path.join(tempdir, 'workdir')):
> +                if not path in ["source-date-epoch", "recipe-sysroot", "=
recipe-sysroot-native"]:
> +                    workdir =3D d.getVar('WORKDIR')
> +                    shutil.move(os.path.join(tempdir, 'workdir', path), =
workdir)
> +
>          if is_kernel_yocto:
>              logger.info('Copying kernel config to srctree')
>              shutil.copy2(os.path.join(tempdir, '.config'), srctree)

Looks like a good start although I worry a bit about the hardcoded list
of exceptions.

Is it possible to add a test case to the devtool testsuite so this
can't regress in future?

Thanks,

Richard

