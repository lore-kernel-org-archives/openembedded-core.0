Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B4EE92711
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 10:38:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.9646.1696588721971127542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 03:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KQveLCbO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40537481094so17542815e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696588720; x=1697193520; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=54O+P2FxdfTwQMpGqRCqZyHWHatsw8xix4T1DQnJxIs=;
        b=KQveLCbOK/YfD/oPVj0vKyLrYuKfjfncsnF0KDwECEBIUY5oi5tVQg/JGqmgI0zaBN
         KkBkTuyxBx1LqXADaf4V32h0NUg0bsLecTDLsWW73M1bgsRAqkJyHFGcd5vogXJ1O7dj
         1fubISt0APMaPNnIWL4cM1F+NqMUrFA/bM4kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696588720; x=1697193520;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54O+P2FxdfTwQMpGqRCqZyHWHatsw8xix4T1DQnJxIs=;
        b=B9OO579JzedQk1XLB73KdJLcqlJZr2aTf1C4tmHzPYRmISqUa9UHJDrPQvW0gw1euz
         UrWeegNfBKfHDBURhiczADrxHGHE+STraEx27ZlNeQ+Drqm3fwsB596N0Hu4L28ebkRZ
         ILlkWhohpxIZj3WFvoBaHWhs87oY5ZRFzo6Ll7iZYs/VM0qMB6a1gviMqIkhxW1wWIQ3
         9/L/C/1nNJib+Z/aIArObw53X7RGQ5qdxRkgYtlq4Vd95QQKzMLI3laxwF9B7lHcp1d+
         FytpekK8ufwD7hLSL+NZcArl9bJaFgio06RO/OASnsMas/Y1sCjRaP53KseoEXAoyWg4
         HAKw==
X-Gm-Message-State: AOJu0YzmxMHW5Ds4mWxaD6P6lai7hdqc2IKF8Lm9uwxfkz33nzSVtO38
	1j6pWFs8kp/HtLRDJUBEwN1YTaBAQKscl3fT6xg=
X-Google-Smtp-Source: AGHT+IFfWctthiEvnJHM3eTOArNziDDp/jQkDKnw0FvXSxxOVxeAaSzWNdRis1ZzfAU+jGTheDMvVQ==
X-Received: by 2002:a1c:7419:0:b0:406:7d74:a2a6 with SMTP id p25-20020a1c7419000000b004067d74a2a6mr7308193wmc.24.1696588720373;
        Fri, 06 Oct 2023 03:38:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2964:cec5:fab8:2212? ([2001:8b0:aba:5f3c:2964:cec5:fab8:2212])
        by smtp.gmail.com with ESMTPSA id l17-20020a1ced11000000b0040588d85b3asm5681156wmh.15.2023.10.06.03.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 03:38:39 -0700 (PDT)
Message-ID: <5317aabcf9c28741ff49dc7d49f1280f7ff27224.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: modify: correctly handle multiple
 sources in SRC_URI
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 06 Oct 2023 11:38:38 +0100
In-Reply-To: <CAEHHSva8v4hgSgWraB72x8LUuTxp09_bYuF0dvKv5HX1ny=BhQ@mail.gmail.com>
References: <20230927165024.2342635-1-jstephan@baylibre.com>
	 <b6f77a1dcd43ccf41ee40d6971010e64f8319bd6.camel@linuxfoundation.org>
	 <1789A4F512105910.31348@lists.openembedded.org>
	 <CAEHHSva8v4hgSgWraB72x8LUuTxp09_bYuF0dvKv5HX1ny=BhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 10:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188751

On Fri, 2023-10-06 at 12:34 +0200, Julien Stephan wrote:
> Le sam. 30 sept. 2023 =C3=A0 12:01, Julien Stephan via
> lists.openembedded.org <jstephan=3Dbaylibre.com@lists.openembedded.org>
> a =C3=A9crit :
> >=20
> > Le mer. 27 sept. 2023 =C3=A0 22:36, Richard Purdie
> > <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> > >=20
> > > On Wed, 2023-09-27 at 18:50 +0200, Julien Stephan wrote:
> > > > [YOCTO #15162]
> > > >=20
> > > > When recipes such as bzip2 have several sources in SRC_URI, all the
> > > > sources are correctly extracted into devtool temporary workdir, but
> > > > currently, we only get back the primary source and all files declar=
ed
> > > > using "files://", then the devtool temporary workdir is deleted
> > > >=20
> > > > Fix this by moving all remaining files from devtool temporary workd=
ir
> > > > into actual WORKDIR (except "source-date-epoch", "recipe-sysroot",
> > > > and "recipe-sysroot-native") before deleting it
> > > >=20
> > > > Here is the stack trace from devtool modify/build bzip2:
> > > >=20
> > > > NOTE: bzip2: compiling from external source tree <...>/build/worksp=
ace/sources/bzip2
> > > > ERROR: bzip2-1.0.8-r0 do_install_ptest_base: ExecutionError('<...>/=
build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_ba=
se.3368', 1, None, None)
> > > > ERROR: Logfile of failure stored in: <...>/build/tmp/work/core2-64-=
poky-linux/bzip2/1.0.8/temp/log.do_install_ptest_base.3368
> > > > Log data follows:
> > > > > DEBUG: Executing shell function do_install_ptest_base
> > > > > NOTE: make -j 16 DESTDIR=3D<...>/build/tmp/work/core2-64-poky-lin=
ux/bzip2/1.0.8/image/usr/lib/bzip2/ptest install-ptest
> > > > > sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> > > > >            ../../../../../../workspace/sources/bzip2/Makefile.am =
     > <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/b=
zip2/ptest/Makefile
> > > > > cp ../../../../../../workspace/sources/bzip2/sample1.ref      <..=
.>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest=
/
> > > > > cp ../../../../../../workspace/sources/bzip2/sample2.ref      <..=
.>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest=
/
> > > > > cp ../../../../../../workspace/sources/bzip2/sample3.ref      <..=
.>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest=
/
> > > > > cp ../../../../../../workspace/sources/bzip2/sample1.bz2      <..=
.>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest=
/
> > > > > cp ../../../../../../workspace/sources/bzip2/sample2.bz2      <..=
.>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest=
/
> > > > > cp ../../../../../../workspace/sources/bzip2/sample3.bz2      <..=
.>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest=
/
> > > > > ln -s /usr/bin/bzip2          <...>/build/tmp/work/core2-64-poky-=
linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2
> > > > > cp: cannot stat '<...>/build/tmp/work/core2-64-poky-linux/bzip2/1=
.0.8/git/commons-compress': No such file or directory
> > > > > WARNING: <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/tem=
p/run.do_install_ptest_base.3368:189 exit 1 from 'cp -r <...>/build/tmp/wor=
k/core2-64-poky-linux/bzip2/
> > > > 1.0.8/git/commons-compress <...>/build/tmp/work/core2-64-poky-linux=
/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2-tests/commons-compress'
> > > > > WARNING: Backtrace (BB generated script):
> > > > >       #1: do_install_ptest, <...>/build/tmp/work/core2-64-poky-li=
nux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 189
> > > > >       #2: do_install_ptest_base, <...>/build/tmp/work/core2-64-po=
ky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 158
> > > > >       #3: main, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.=
0.8/temp/run.do_install_ptest_base.3368, line 226
> > > > ERROR: Task (<...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:=
do_install_ptest_base) failed with exit code '1'
> > > > NOTE: Tasks Summary: Attempted 776 tasks of which 765 didn't need t=
o be rerun and 1 failed.
> > > >=20
> > > > Summary: 1 task failed:
> > > >   <...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_=
ptest_base
> > > >=20
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > ---
> > > >  scripts/lib/devtool/standard.py | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >=20
> > > > diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/=
standard.py
> > > > index d53fb810071..6c8ad7a6c8c 100644
> > > > --- a/scripts/lib/devtool/standard.py
> > > > +++ b/scripts/lib/devtool/standard.py
> > > > @@ -684,6 +684,14 @@ def _extract_source(srctree, keep_temp, devbra=
nch, sync, config, basepath, works
> > > >              shutil.move(srcsubdir, srctree)
> > > >              symlink_oelocal_files_srctree(d,srctree)
> > > >=20
> > > > +            # In case SRC_URI contains multiple sources
> > > > +            # they are extracted into the devtool temporary workdi=
r
> > > > +            # We need to move them into WORKDIR, otherwise they wi=
ll be lost
> > > > +            for path in os.listdir(os.path.join(tempdir, 'workdir'=
)):
> > > > +                if not path in ["source-date-epoch", "recipe-sysro=
ot", "recipe-sysroot-native"]:
> > > > +                    workdir =3D d.getVar('WORKDIR')
> > > > +                    shutil.move(os.path.join(tempdir, 'workdir', p=
ath), workdir)
> > > > +
> > > >          if is_kernel_yocto:
> > > >              logger.info('Copying kernel config to srctree')
> > > >              shutil.copy2(os.path.join(tempdir, '.config'), srctree=
)
> > >=20
> > > Looks like a good start although I worry a bit about the hardcoded li=
st
> > > of exceptions.
> >=20
> >=20
> > Hi Richard,
> > Yes, I am not very happy with listing files but I don't know if I can
> > easily get the list of secondary sources?
> >=20
> > Here are the alternatives I can see:
> > * encapsulate the move into a try/catch block and ignore exceptions if
> > the destination file/directory already exists
> > * retrieve SRC_URI and manually build the list of secondary sources to
> > move. This looks a little bit overkill here...
> > What do you think?
>=20
> I need to rework this patch. As is it doesn't work: if the recipe was
> already built then the sources I am trying to move during devtool
> modify from the devtool temporary workdir to WORKDIR already exist in
> WORKDIR.
> This makes several tests from devtool selftest to fail.
>=20
> Any suggestions on how I should handle this?

There is some work on the bitbake list from Alberto which adds unpack
tracing. I'm wondering if by default we should track some really basic
form of unpack accesses which would then give you a list of target
locations to merge?

Cheers,

Richard





