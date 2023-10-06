Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695A6E92FFE
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 10:34:48 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.9638.1696588485277308532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 03:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QxZ9ezu6;
 spf=pass (domain: baylibre.com, ip: 209.85.208.47, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so3617734a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696588484; x=1697193284; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BznUnVOmZsZvLO/P9DQWelnRGJtJYHZbMSvOuYP3RwM=;
        b=QxZ9ezu6tHCRUOtwEE9H0njNT8wnSDXQDKF8CXp8uoG5ekAbj1jIMGWYI41q/PmW8p
         Hh34M9tCFQmPro2kpNmEDC9jXFncnkjDgjRufJQNBPNbbUrvAOde9c9RurfzYoJXRtsI
         paxlZ32LC4vtp2MZS5NWq4Oj8tJZ1DnWG8sw3RCPxEdPMb/I4k9NT8foT7R3daSUfNNn
         yh+xv5sYqms5IgP/jnXqN46W8+XgKVj/BFOdEKjdnZpkME8jYZ/vLmQRFVvI2h5mwEhY
         Ohnm+6Pfxl1eFIncDrsJFaaw3sXi7Eoz/EcSkuwtbVA3fD31MTv+jV/hKlhLUSMPxUmZ
         UduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696588484; x=1697193284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BznUnVOmZsZvLO/P9DQWelnRGJtJYHZbMSvOuYP3RwM=;
        b=IJvNe1d4+V2nuf79CLLdR/7n8vcc2g9VBFWTBcOBa+ioKkMPg/HRIDarfAQh4qIBWK
         UOj5d+3FLdI/sPiUJOQ1H3DSzAANdjvv60yhM29QLWs17Fmy7TMqgkcwPfa7C09+sc/E
         exNSZjqlg9Jj61xa6Kkfb+xvpfC+/lTrN5fZp2PWwmVO+EQinHJ0h8NZX/CUIrGYKOt1
         gwqB1jaxwdbll1Jwu364APYko8pKL16rnqE8tsI/sdPMY4wVLYIS/M2TyybiF+cJcSaA
         elHlIwWTKrYjOhPLand4HzwqwdICcAfiaH8I1oh4P9selmMWRYWZPQhRbgMoRtkFziVt
         F1AQ==
X-Gm-Message-State: AOJu0YyO0i+YKDevMw774wC4CkbAa7aC5cA+8YjIWpcVh5Ii1+Ts4wZE
	3avL/ZxMjvmWWHpWBfxN3cODJ3Bf7FO2j7kdg4oTGA==
X-Google-Smtp-Source: AGHT+IFjO+ZaKU3mXT8V9kcJM6fSzm9AYwQlWjt7OEQpjTKiARYWv/LnadkBpEdUIWcub6Izv0BhHPbmQk2mxJgcTRU=
X-Received: by 2002:a05:6402:b18:b0:523:3e23:15ab with SMTP id
 bm24-20020a0564020b1800b005233e2315abmr6432526edb.26.1696588483579; Fri, 06
 Oct 2023 03:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230927165024.2342635-1-jstephan@baylibre.com>
 <b6f77a1dcd43ccf41ee40d6971010e64f8319bd6.camel@linuxfoundation.org> <1789A4F512105910.31348@lists.openembedded.org>
In-Reply-To: <1789A4F512105910.31348@lists.openembedded.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 6 Oct 2023 12:34:31 +0200
Message-ID: <CAEHHSva8v4hgSgWraB72x8LUuTxp09_bYuF0dvKv5HX1ny=BhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: modify: correctly handle multiple
 sources in SRC_URI
To: jstephan@baylibre.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 10:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188750

Le sam. 30 sept. 2023 =C3=A0 12:01, Julien Stephan via
lists.openembedded.org <jstephan=3Dbaylibre.com@lists.openembedded.org>
a =C3=A9crit :
>
> Le mer. 27 sept. 2023 =C3=A0 22:36, Richard Purdie
> <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> >
> > On Wed, 2023-09-27 at 18:50 +0200, Julien Stephan wrote:
> > > [YOCTO #15162]
> > >
> > > When recipes such as bzip2 have several sources in SRC_URI, all the
> > > sources are correctly extracted into devtool temporary workdir, but
> > > currently, we only get back the primary source and all files declared
> > > using "files://", then the devtool temporary workdir is deleted
> > >
> > > Fix this by moving all remaining files from devtool temporary workdir
> > > into actual WORKDIR (except "source-date-epoch", "recipe-sysroot",
> > > and "recipe-sysroot-native") before deleting it
> > >
> > > Here is the stack trace from devtool modify/build bzip2:
> > >
> > > NOTE: bzip2: compiling from external source tree <...>/build/workspac=
e/sources/bzip2
> > > ERROR: bzip2-1.0.8-r0 do_install_ptest_base: ExecutionError('<...>/bu=
ild/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base=
.3368', 1, None, None)
> > > ERROR: Logfile of failure stored in: <...>/build/tmp/work/core2-64-po=
ky-linux/bzip2/1.0.8/temp/log.do_install_ptest_base.3368
> > > Log data follows:
> > > > DEBUG: Executing shell function do_install_ptest_base
> > > > NOTE: make -j 16 DESTDIR=3D<...>/build/tmp/work/core2-64-poky-linux=
/bzip2/1.0.8/image/usr/lib/bzip2/ptest install-ptest
> > > > sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> > > >            ../../../../../../workspace/sources/bzip2/Makefile.am   =
   > <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzi=
p2/ptest/Makefile
> > > > cp ../../../../../../workspace/sources/bzip2/sample1.ref      <...>=
/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > > cp ../../../../../../workspace/sources/bzip2/sample2.ref      <...>=
/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > > cp ../../../../../../workspace/sources/bzip2/sample3.ref      <...>=
/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > > cp ../../../../../../workspace/sources/bzip2/sample1.bz2      <...>=
/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > > cp ../../../../../../workspace/sources/bzip2/sample2.bz2      <...>=
/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > > cp ../../../../../../workspace/sources/bzip2/sample3.bz2      <...>=
/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > > ln -s /usr/bin/bzip2          <...>/build/tmp/work/core2-64-poky-li=
nux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2
> > > > cp: cannot stat '<...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0=
.8/git/commons-compress': No such file or directory
> > > > WARNING: <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/=
run.do_install_ptest_base.3368:189 exit 1 from 'cp -r <...>/build/tmp/work/=
core2-64-poky-linux/bzip2/
> > > 1.0.8/git/commons-compress <...>/build/tmp/work/core2-64-poky-linux/b=
zip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2-tests/commons-compress'
> > > > WARNING: Backtrace (BB generated script):
> > > >       #1: do_install_ptest, <...>/build/tmp/work/core2-64-poky-linu=
x/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 189
> > > >       #2: do_install_ptest_base, <...>/build/tmp/work/core2-64-poky=
-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 158
> > > >       #3: main, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.=
8/temp/run.do_install_ptest_base.3368, line 226
> > > ERROR: Task (<...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do=
_install_ptest_base) failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 776 tasks of which 765 didn't need to =
be rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >   <...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_pt=
est_base
> > >
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> > >  scripts/lib/devtool/standard.py | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/st=
andard.py
> > > index d53fb810071..6c8ad7a6c8c 100644
> > > --- a/scripts/lib/devtool/standard.py
> > > +++ b/scripts/lib/devtool/standard.py
> > > @@ -684,6 +684,14 @@ def _extract_source(srctree, keep_temp, devbranc=
h, sync, config, basepath, works
> > >              shutil.move(srcsubdir, srctree)
> > >              symlink_oelocal_files_srctree(d,srctree)
> > >
> > > +            # In case SRC_URI contains multiple sources
> > > +            # they are extracted into the devtool temporary workdir
> > > +            # We need to move them into WORKDIR, otherwise they will=
 be lost
> > > +            for path in os.listdir(os.path.join(tempdir, 'workdir'))=
:
> > > +                if not path in ["source-date-epoch", "recipe-sysroot=
", "recipe-sysroot-native"]:
> > > +                    workdir =3D d.getVar('WORKDIR')
> > > +                    shutil.move(os.path.join(tempdir, 'workdir', pat=
h), workdir)
> > > +
> > >          if is_kernel_yocto:
> > >              logger.info('Copying kernel config to srctree')
> > >              shutil.copy2(os.path.join(tempdir, '.config'), srctree)
> >
> > Looks like a good start although I worry a bit about the hardcoded list
> > of exceptions.
>
>
> Hi Richard,
> Yes, I am not very happy with listing files but I don't know if I can
> easily get the list of secondary sources?
>
> Here are the alternatives I can see:
> * encapsulate the move into a try/catch block and ignore exceptions if
> the destination file/directory already exists
> * retrieve SRC_URI and manually build the list of secondary sources to
> move. This looks a little bit overkill here...
> What do you think?
>

Hi Richard,
I need to rework this patch. As is it doesn't work: if the recipe was
already built then the sources I am trying to move during devtool
modify from the devtool temporary workdir to WORKDIR already exist in
WORKDIR.
This makes several tests from devtool selftest to fail.

Any suggestions on how I should handle this?

Cheers
Julien
> >
> > Is it possible to add a test case to the devtool testsuite so this
> > can't regress in future?
>
> Sure, I'll do it!
>
> Cheers
> Juliem
> >
>
>
> sure I will add a test for that.
>
>
> > Thanks,
> >
> > Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188455): https://lists.openembedded.org/g/openembedde=
d-core/message/188455
> Mute This Topic: https://lists.openembedded.org/mt/101621289/4356723
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [js=
tephan@baylibre.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

