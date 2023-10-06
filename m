Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7C6E81DF4
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 13:01:29 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.12103.1696597284899339418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 06:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=t4RhOeke;
 spf=pass (domain: baylibre.com, ip: 209.85.208.42, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53406799540so3864743a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696597283; x=1697202083; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf/aSb8quykOtDcJC7AYyMcu7p2tFxhVnMinA5DSkTU=;
        b=t4RhOekeZCgL91XDQ+PoL6uIlLVyHpdY++WxSqq8wA92fsFdpri/FxmGTNgKjivEIE
         xqWnuEh2qas9Y8uqxk2b7cTvCEk4VyoBIN9Qe13YCy+MSEY45BUzsw1jk6C/fiCP5MYD
         jINQzzl8gTENTBXc6/GoQvHv0Cqqj9ZocfqetddzgAcWQGLr7y9GUuqUl1JUfgomwZtU
         ZyBa7EvzHHMGbwRKDebt9PGY4XqDCHe/oG5CA+GXRs6VsN9EycnWxsiSVNd52sH+4J1Q
         pI3QXTJjsGAuxeq+QaANp8uPZXJSoQhsf3BHyb0kYjjty1j6W/iWQyYXJsablXfyQel/
         7n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696597283; x=1697202083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf/aSb8quykOtDcJC7AYyMcu7p2tFxhVnMinA5DSkTU=;
        b=ATl7J9k+pbgCatFVgdngbFIDgFcLe0NNRABhLeHEfsgPXdzSh/TpJzZne46OVthov4
         X7nOHgDjZ3BKzsMT5G4JNF2YY7rFxjLJFXuawOmeT8KpRDpw38gTVhIpwan7wO2G7qnR
         TyKk8pQOrtFg/3ke7Sjt4lC/lIIO8AwLKEU6ueR6M4lXK5MmcYUURU6AzV9qGSHj+iAR
         yAaHPV2LxsaycU9Ecn3ujhs9oF+FyP1+0Kor1cbjNgXpQsETJHznw9d8jrcRtZLhXlPx
         fRhcq/89GuNwZLM8oMh6X1/6/pU1JlcgK2mVgxfDpB923q8T3SfSnFm30nm7FXS80jkv
         vmaw==
X-Gm-Message-State: AOJu0YxTV07E1f5k34w5Yx1b78lpiAoQ8GDg1HaPImbgprl8T7FS/bhR
	sYwTvvmF4+SE4SNyEMUYrrAKWFrF5mnj1rVV6N6ivg==
X-Google-Smtp-Source: AGHT+IEeyTxT3/lC0Fnq+yREDi1z2eaHO9UNHbkv/xJ1V2TKqy1D2SAQgRXluc4hRd2vJ01EU0v2mCEN4EA/ua/bhGo=
X-Received: by 2002:aa7:c409:0:b0:530:d6c5:7e79 with SMTP id
 j9-20020aa7c409000000b00530d6c57e79mr6910893edq.32.1696597283236; Fri, 06 Oct
 2023 06:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230927165024.2342635-1-jstephan@baylibre.com>
 <b6f77a1dcd43ccf41ee40d6971010e64f8319bd6.camel@linuxfoundation.org>
 <1789A4F512105910.31348@lists.openembedded.org> <CAEHHSva8v4hgSgWraB72x8LUuTxp09_bYuF0dvKv5HX1ny=BhQ@mail.gmail.com>
 <5317aabcf9c28741ff49dc7d49f1280f7ff27224.camel@linuxfoundation.org>
In-Reply-To: <5317aabcf9c28741ff49dc7d49f1280f7ff27224.camel@linuxfoundation.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 6 Oct 2023 15:01:10 +0200
Message-ID: <CAEHHSvYE7-DoAB0ohfxG4KjDhneB8zgc4W7F=WQzM9a3Y2Urbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: modify: correctly handle multiple
 sources in SRC_URI
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188765

Le ven. 6 oct. 2023 =C3=A0 12:38, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Fri, 2023-10-06 at 12:34 +0200, Julien Stephan wrote:
> > Le sam. 30 sept. 2023 =C3=A0 12:01, Julien Stephan via
> > lists.openembedded.org <jstephan=3Dbaylibre.com@lists.openembedded.org>
> > a =C3=A9crit :
> > >
> > > Le mer. 27 sept. 2023 =C3=A0 22:36, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> > > >
> > > > On Wed, 2023-09-27 at 18:50 +0200, Julien Stephan wrote:
> > > > > [YOCTO #15162]
> > > > >
> > > > > When recipes such as bzip2 have several sources in SRC_URI, all t=
he
> > > > > sources are correctly extracted into devtool temporary workdir, b=
ut
> > > > > currently, we only get back the primary source and all files decl=
ared
> > > > > using "files://", then the devtool temporary workdir is deleted
> > > > >
> > > > > Fix this by moving all remaining files from devtool temporary wor=
kdir
> > > > > into actual WORKDIR (except "source-date-epoch", "recipe-sysroot"=
,
> > > > > and "recipe-sysroot-native") before deleting it
> > > > >
> > > > > Here is the stack trace from devtool modify/build bzip2:
> > > > >
> > > > > NOTE: bzip2: compiling from external source tree <...>/build/work=
space/sources/bzip2
> > > > > ERROR: bzip2-1.0.8-r0 do_install_ptest_base: ExecutionError('<...=
>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_=
base.3368', 1, None, None)
> > > > > ERROR: Logfile of failure stored in: <...>/build/tmp/work/core2-6=
4-poky-linux/bzip2/1.0.8/temp/log.do_install_ptest_base.3368
> > > > > Log data follows:
> > > > > > DEBUG: Executing shell function do_install_ptest_base
> > > > > > NOTE: make -j 16 DESTDIR=3D<...>/build/tmp/work/core2-64-poky-l=
inux/bzip2/1.0.8/image/usr/lib/bzip2/ptest install-ptest
> > > > > > sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> > > > > >            ../../../../../../workspace/sources/bzip2/Makefile.a=
m      > <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib=
/bzip2/ptest/Makefile
> > > > > > cp ../../../../../../workspace/sources/bzip2/sample1.ref      <=
...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/pte=
st/
> > > > > > cp ../../../../../../workspace/sources/bzip2/sample2.ref      <=
...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/pte=
st/
> > > > > > cp ../../../../../../workspace/sources/bzip2/sample3.ref      <=
...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/pte=
st/
> > > > > > cp ../../../../../../workspace/sources/bzip2/sample1.bz2      <=
...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/pte=
st/
> > > > > > cp ../../../../../../workspace/sources/bzip2/sample2.bz2      <=
...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/pte=
st/
> > > > > > cp ../../../../../../workspace/sources/bzip2/sample3.bz2      <=
...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/pte=
st/
> > > > > > ln -s /usr/bin/bzip2          <...>/build/tmp/work/core2-64-pok=
y-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2
> > > > > > cp: cannot stat '<...>/build/tmp/work/core2-64-poky-linux/bzip2=
/1.0.8/git/commons-compress': No such file or directory
> > > > > > WARNING: <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/t=
emp/run.do_install_ptest_base.3368:189 exit 1 from 'cp -r <...>/build/tmp/w=
ork/core2-64-poky-linux/bzip2/
> > > > > 1.0.8/git/commons-compress <...>/build/tmp/work/core2-64-poky-lin=
ux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2-tests/commons-compress'
> > > > > > WARNING: Backtrace (BB generated script):
> > > > > >       #1: do_install_ptest, <...>/build/tmp/work/core2-64-poky-=
linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 189
> > > > > >       #2: do_install_ptest_base, <...>/build/tmp/work/core2-64-=
poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 158
> > > > > >       #3: main, <...>/build/tmp/work/core2-64-poky-linux/bzip2/=
1.0.8/temp/run.do_install_ptest_base.3368, line 226
> > > > > ERROR: Task (<...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.b=
b:do_install_ptest_base) failed with exit code '1'
> > > > > NOTE: Tasks Summary: Attempted 776 tasks of which 765 didn't need=
 to be rerun and 1 failed.
> > > > >
> > > > > Summary: 1 task failed:
> > > > >   <...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_instal=
l_ptest_base
> > > > >
> > > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > > ---
> > > > >  scripts/lib/devtool/standard.py | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >
> > > > > diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtoo=
l/standard.py
> > > > > index d53fb810071..6c8ad7a6c8c 100644
> > > > > --- a/scripts/lib/devtool/standard.py
> > > > > +++ b/scripts/lib/devtool/standard.py
> > > > > @@ -684,6 +684,14 @@ def _extract_source(srctree, keep_temp, devb=
ranch, sync, config, basepath, works
> > > > >              shutil.move(srcsubdir, srctree)
> > > > >              symlink_oelocal_files_srctree(d,srctree)
> > > > >
> > > > > +            # In case SRC_URI contains multiple sources
> > > > > +            # they are extracted into the devtool temporary work=
dir
> > > > > +            # We need to move them into WORKDIR, otherwise they =
will be lost
> > > > > +            for path in os.listdir(os.path.join(tempdir, 'workdi=
r')):
> > > > > +                if not path in ["source-date-epoch", "recipe-sys=
root", "recipe-sysroot-native"]:
> > > > > +                    workdir =3D d.getVar('WORKDIR')
> > > > > +                    shutil.move(os.path.join(tempdir, 'workdir',=
 path), workdir)
> > > > > +
> > > > >          if is_kernel_yocto:
> > > > >              logger.info('Copying kernel config to srctree')
> > > > >              shutil.copy2(os.path.join(tempdir, '.config'), srctr=
ee)
> > > >
> > > > Looks like a good start although I worry a bit about the hardcoded =
list
> > > > of exceptions.
> > >
> > >
> > > Hi Richard,
> > > Yes, I am not very happy with listing files but I don't know if I can
> > > easily get the list of secondary sources?
> > >
> > > Here are the alternatives I can see:
> > > * encapsulate the move into a try/catch block and ignore exceptions i=
f
> > > the destination file/directory already exists
> > > * retrieve SRC_URI and manually build the list of secondary sources t=
o
> > > move. This looks a little bit overkill here...
> > > What do you think?
> >
> > I need to rework this patch. As is it doesn't work: if the recipe was
> > already built then the sources I am trying to move during devtool
> > modify from the devtool temporary workdir to WORKDIR already exist in
> > WORKDIR.
> > This makes several tests from devtool selftest to fail.
> >
> > Any suggestions on how I should handle this?
>
> There is some work on the bitbake list from Alberto which adds unpack
> tracing. I'm wondering if by default we should track some really basic
> form of unpack accesses which would then give you a list of target
> locations to merge?
>

Looks very interesting, let me check this :)

Cheers
Julien

> Cheers,
>
> Richard
>
>
>
>

