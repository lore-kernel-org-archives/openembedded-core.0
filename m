Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B32FE77362
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 10:01:50 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.38350.1696068106170152798
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 03:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=e6a83Xfz;
 spf=pass (domain: baylibre.com, ip: 209.85.218.51, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso1418678966b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696068104; x=1696672904; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsb/AP8+ZKfeve/lUnufUW6gOqSIvRzgFiYtKZssXe8=;
        b=e6a83XfzISqPD3xNFkx3frzQ8qXP5wB4fIn7RXJi42LuNJus2+qpY9X1K6PoAL4ZzM
         mUkQdhwDi2iCMMdjCv9YZfaJlRidkjjnvCn0kDlzQHPJ945HUbzTLB9N28f6Mlyh409L
         HUSwRrt8dJ+JIkFb22PGJUlRMVv25+KSk3ZscOL+nxguOwtcmC70HSDSfwLO9O/FQ+NR
         7yZE2Hgxg+vvASvboAmDTXpM0vBoVhBDIJ+t3Bwri2cjtc0nH+PTOQIDzk9cmrhUJovx
         B/CJZJuSIggqlb20xHwnXkVUH/Tr3xOj7ly1Ohm5OhdKH23KAAE2uUtkgISzqVIzdpMd
         E98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696068104; x=1696672904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsb/AP8+ZKfeve/lUnufUW6gOqSIvRzgFiYtKZssXe8=;
        b=n32h/m0oTWGJrotS7Usp1vu8lYmdyAplnm8fBFqgjof4wxC6P2wZ2DBILk2Bk+fH9i
         tvSpTQL3llF2ITlAC4TpJgi46zV99z759nLrVu2mpxoqZKTDePohprarZuwdcrkqqlrE
         Y8CQOQpg+SjO5DadBNUqRH1FiULvSUnrjOFgrAW7rRtSS4c9IEvGlssI8vfTAE8s8Io7
         22ESdW+lskZQzRq0rOjVJsD0B+/IX3E4UstyfY97D+vexXvM9i+vNrYb4Al926ioFPo8
         bfXN55fL6Dx4nxYikeYpeUJVoh2BpnURikmmCaz5TrPhGnucODzI9MRhzyApL3owoIZ1
         S7fQ==
X-Gm-Message-State: AOJu0Yx2OsYZLG8m6v7qCKobhXXx4el2G4u+BmvbttV5dhVX16ZYPv4m
	63ickqjk+VEqJELSxi+F83QiDG9izET9y5jcag2pQg==
X-Google-Smtp-Source: AGHT+IH565GziBdrx6QTibuexSKUPWrSWrmUXkPv4dbcGNthgEhLYAqNGtv/0INJ8fpXS+cTnK6+07U7vtsLL5tkwdU=
X-Received: by 2002:a17:906:76d8:b0:9ad:fb23:21d4 with SMTP id
 q24-20020a17090676d800b009adfb2321d4mr6087964ejn.12.1696068104480; Sat, 30
 Sep 2023 03:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230927165024.2342635-1-jstephan@baylibre.com> <b6f77a1dcd43ccf41ee40d6971010e64f8319bd6.camel@linuxfoundation.org>
In-Reply-To: <b6f77a1dcd43ccf41ee40d6971010e64f8319bd6.camel@linuxfoundation.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Sat, 30 Sep 2023 12:01:29 +0200
Message-ID: <CAEHHSvZsyVenNwXP_hyVa83kSVPr3xTOj2x2cSpztrx8EoG-KA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: modify: correctly handle multiple
 sources in SRC_URI
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 10:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188455

Le mer. 27 sept. 2023 =C3=A0 22:36, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Wed, 2023-09-27 at 18:50 +0200, Julien Stephan wrote:
> > [YOCTO #15162]
> >
> > When recipes such as bzip2 have several sources in SRC_URI, all the
> > sources are correctly extracted into devtool temporary workdir, but
> > currently, we only get back the primary source and all files declared
> > using "files://", then the devtool temporary workdir is deleted
> >
> > Fix this by moving all remaining files from devtool temporary workdir
> > into actual WORKDIR (except "source-date-epoch", "recipe-sysroot",
> > and "recipe-sysroot-native") before deleting it
> >
> > Here is the stack trace from devtool modify/build bzip2:
> >
> > NOTE: bzip2: compiling from external source tree <...>/build/workspace/=
sources/bzip2
> > ERROR: bzip2-1.0.8-r0 do_install_ptest_base: ExecutionError('<...>/buil=
d/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/run.do_install_ptest_base.3=
368', 1, None, None)
> > ERROR: Logfile of failure stored in: <...>/build/tmp/work/core2-64-poky=
-linux/bzip2/1.0.8/temp/log.do_install_ptest_base.3368
> > Log data follows:
> > > DEBUG: Executing shell function do_install_ptest_base
> > > NOTE: make -j 16 DESTDIR=3D<...>/build/tmp/work/core2-64-poky-linux/b=
zip2/1.0.8/image/usr/lib/bzip2/ptest install-ptest
> > > sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> > >            ../../../../../../workspace/sources/bzip2/Makefile.am     =
 > <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2=
/ptest/Makefile
> > > cp ../../../../../../workspace/sources/bzip2/sample1.ref      <...>/b=
uild/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > cp ../../../../../../workspace/sources/bzip2/sample2.ref      <...>/b=
uild/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > cp ../../../../../../workspace/sources/bzip2/sample3.ref      <...>/b=
uild/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > cp ../../../../../../workspace/sources/bzip2/sample1.bz2      <...>/b=
uild/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > cp ../../../../../../workspace/sources/bzip2/sample2.bz2      <...>/b=
uild/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > cp ../../../../../../workspace/sources/bzip2/sample3.bz2      <...>/b=
uild/tmp/work/core2-64-poky-linux/bzip2/1.0.8/image/usr/lib/bzip2/ptest/
> > > ln -s /usr/bin/bzip2          <...>/build/tmp/work/core2-64-poky-linu=
x/bzip2/1.0.8/image/usr/lib/bzip2/ptest/bzip2
> > > cp: cannot stat '<...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8=
/git/commons-compress': No such file or directory
> > > WARNING: <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/temp/ru=
n.do_install_ptest_base.3368:189 exit 1 from 'cp -r <...>/build/tmp/work/co=
re2-64-poky-linux/bzip2/
> > 1.0.8/git/commons-compress <...>/build/tmp/work/core2-64-poky-linux/bzi=
p2/1.0.8/image/usr/lib/bzip2/ptest/bzip2-tests/commons-compress'
> > > WARNING: Backtrace (BB generated script):
> > >       #1: do_install_ptest, <...>/build/tmp/work/core2-64-poky-linux/=
bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 189
> > >       #2: do_install_ptest_base, <...>/build/tmp/work/core2-64-poky-l=
inux/bzip2/1.0.8/temp/run.do_install_ptest_base.3368, line 158
> > >       #3: main, <...>/build/tmp/work/core2-64-poky-linux/bzip2/1.0.8/=
temp/run.do_install_ptest_base.3368, line 226
> > ERROR: Task (<...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_i=
nstall_ptest_base) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 776 tasks of which 765 didn't need to be=
 rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >   <...>/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptes=
t_base
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  scripts/lib/devtool/standard.py | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/stan=
dard.py
> > index d53fb810071..6c8ad7a6c8c 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -684,6 +684,14 @@ def _extract_source(srctree, keep_temp, devbranch,=
 sync, config, basepath, works
> >              shutil.move(srcsubdir, srctree)
> >              symlink_oelocal_files_srctree(d,srctree)
> >
> > +            # In case SRC_URI contains multiple sources
> > +            # they are extracted into the devtool temporary workdir
> > +            # We need to move them into WORKDIR, otherwise they will b=
e lost
> > +            for path in os.listdir(os.path.join(tempdir, 'workdir')):
> > +                if not path in ["source-date-epoch", "recipe-sysroot",=
 "recipe-sysroot-native"]:
> > +                    workdir =3D d.getVar('WORKDIR')
> > +                    shutil.move(os.path.join(tempdir, 'workdir', path)=
, workdir)
> > +
> >          if is_kernel_yocto:
> >              logger.info('Copying kernel config to srctree')
> >              shutil.copy2(os.path.join(tempdir, '.config'), srctree)
>
> Looks like a good start although I worry a bit about the hardcoded list
> of exceptions.


Hi Richard,
Yes, I am not very happy with listing files but I don't know if I can
easily get the list of secondary sources?

Here are the alternatives I can see:
* encapsulate the move into a try/catch block and ignore exceptions if
the destination file/directory already exists
* retrieve SRC_URI and manually build the list of secondary sources to
move. This looks a little bit overkill here...
What do you think?

>
> Is it possible to add a test case to the devtool testsuite so this
> can't regress in future?

Sure, I'll do it!

Cheers
Juliem
>


sure I will add a test for that.


> Thanks,
>
> Richard

