Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C446EC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 00:29:03 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.10164.1702513738623747050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 16:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dnQJlLnV;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d6b9143782so68807347b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 16:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702513738; x=1703118538; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N6lTUetz6mQ+wTBI1DWQe9+gTKBu6iURkBp4NcdqH5U=;
        b=dnQJlLnVaHMYcfUMYJEqEiLuprY9lIRmAIHpEGetT41qqihNRXsj56epbai13yOml1
         qlqY4gS/y4BLJdj7UeFIQptiDsln6L7ylXAfszCLznGHcz5PP+D9IhxW0C0NcMMgMiRL
         /N5W/xmVDXs9Go3HZoEq8G46G7iwuwg+qYQ/3K+ua4/jsO9WDkC+R+2kkMB28dcco6Pc
         AUAHHJbqPSQ5mV2kCPsCgx/KHbOKfiplYDTNdJe+GHsuk6fQVmTIqbGOBCu3mv1vyitH
         6jawSgHrHPPC5xqaiAkZtDdlbkHJd6tl3XWkUIpHsFkdDVKdHMs4KFKMK6smrFtVZKnG
         /eeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702513738; x=1703118538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6lTUetz6mQ+wTBI1DWQe9+gTKBu6iURkBp4NcdqH5U=;
        b=dyEPMTuzAcA+e9KqqfhQByCjr62buCQ76N44S6KiDp1iEMPgR1QNf9PHMmuIaSdbGO
         CoV/uLjBZvP4UoDGSzrrR3ORzIvU1GWdfBQDtPdP+7ZO0vz591FRhqCRf4nl/TWUdpxL
         E8SceT3KK90Bl2tM3S6dYrntWHs9UYrMXGiHVtvcGvrsh/CsLAc0C+81D8V/FMjPAnNm
         5H67B1kYyzdXv6XkWftUcoRMNMRH+nxkwL1QC3hZ2mYxDMeSAGINEKBkrW3e2yVpVpUL
         AMc0rmCvHlOU/CB+PlUGCshvCclb5pi5WjFcc6/P7w79nFeKJJaiWmXGbncaT2pR6rb8
         uAVw==
X-Gm-Message-State: AOJu0YzNKV43zO5uoeWhqExoyEeayAz/6d6m2ktPh55unqx2/CaApr5/
	fEvPMmocmOFWvh2gQaeyHq1DdoTF+9pq5AIINtY=
X-Google-Smtp-Source: AGHT+IEbcQPsG2La6B57upCJFSNJtJM5B98XRh8d1NDT2rHA2+jhByG8MndVTeQfwlavP0lp228e/lbawji/xTyxEts=
X-Received: by 2002:a0d:d98b:0:b0:5e3:1b93:3c9e with SMTP id
 b133-20020a0dd98b000000b005e31b933c9emr1031544ywe.41.1702513737636; Wed, 13
 Dec 2023 16:28:57 -0800 (PST)
MIME-Version: 1.0
References: <24841a7636bd1e83411c87ba4332f6f863542c6f.1701989368.git.tim.orling@konsulko.com>
 <ef9e58f253d371c8ae864f7cd89c1fb1dcd3602e.1701989368.git.tim.orling@konsulko.com>
 <20231209020223.1221046-1-tim.orling@konsulko.com> <179F2663983D88F3.26830@lists.openembedded.org>
 <20231209115943bd92e089@mail.local>
In-Reply-To: <20231209115943bd92e089@mail.local>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 13 Dec 2023 16:28:46 -0800
Message-ID: <CANx9H-B51GdGBT+CEzt8E8vNM67=tYZ3CQi3zxewU7qTyuRnOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/6] recipetool: add python_maturin support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Tim Orling <tim.orling@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008ea231060c6d5e9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 00:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192333

--0000000000008ea231060c6d5e9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 3:59=E2=80=AFAM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 09/12/2023 12:29:50+0100, Alexandre Belloni via lists.openembedded.org
> wrote:
> > Hello,
> >
> > maturin is not reproducible:
> >
> >
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-rfbp=
roj4/packages/diff-html/
>
>
> Probably related:
>
> WARNING: python3-maturin-1.3.2-r0 do_package_qa: QA Issue: File
> /usr/bin/.debug/maturin in package python3-maturin-dbg contains reference
> to TMPDIR
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8267/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6018/st=
eps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8141/st=
eps/11/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5453/s=
teps/11/logs/stdio
>
> I think at least this part is sorted:
https://github.com/alexcrichton/bzip2-rs/pull/101

Thank you to khem for making me realize the options passed to the =E2=80=98=
cc=E2=80=99
crate were the issue in this case. (The Makefile is not used, nor are
CFLAGS from the environment)

The reordering bits might be a different problem. If anybody has any
thoughts on that I=E2=80=99m all ears.

>
> >
> > On 08/12/2023 18:02:24-0800, Tim Orling wrote:
> > > Add the new python_maturin PEP-517 backend
> > >
> > > Add selftest for 'pydantic-core' pypi package.
> > >
> > > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > > ---
> > > Changes in v2:
> > >  - drop all SRC_URI checksums except sha256sum (Peter's change)
> > >    * requires "[PATCH v2] recipetool: pypi: do not clobber SRC_URI
> checksums"
> > >  - drop SRC_URI (Julien's change)
> > >  - add "inherit pypi" (Julien's change)
> > >
> > >  meta/lib/oeqa/selftest/cases/recipetool.py    | 29 +++++++++++++++++=
++
> > >  .../lib/recipetool/create_buildsys_python.py  |  1 +
> > >  2 files changed, 30 insertions(+)
> > >
> > > diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py
> b/meta/lib/oeqa/selftest/cases/recipetool.py
> > > index d10d61bc5b0..8d39f639acf 100644
> > > --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> > > +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> > > @@ -663,6 +663,35 @@ class RecipetoolCreateTests(RecipetoolBase):
> > >
> > >          self._test_recipe_contents(recipefile, checkvars, inherits)
> > >
> > > +    def test_recipetool_create_python3_pep517_maturin(self):
> > > +        # This test require python 3.11 or above for the tomllib
> module
> > > +        # or tomli module to be installed
> > > +        try:
> > > +            import tomllib
> > > +        except ImportError:
> > > +            try:
> > > +                import tomli
> > > +            except ImportError:
> > > +                self.skipTest('Test requires python 3.11 or above fo=
r
> tomllib module or tomli module')
> > > +
> > > +        # Test creating python3 package from tarball (using maturin
> class)
> > > +        temprecipe =3D os.path.join(self.tempdir, 'recipe')
> > > +        os.makedirs(temprecipe)
> > > +        pn =3D 'pydantic-core'
> > > +        pv =3D '2.14.5'
> > > +        recipefile =3D os.path.join(temprecipe, 'python3-%s_%s.bb' %
> (pn, pv))
> > > +        srcuri =3D '
> https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae1=
4a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-%s.tar.gz'
> % pv
> > > +        result =3D runCmd('recipetool create -o %s %s' % (temprecipe=
,
> srcuri))
> > > +        self.assertTrue(os.path.isfile(recipefile))
> > > +        checkvars =3D {}
> > > +        checkvars['HOMEPAGE'] =3D '
> https://github.com/pydantic/pydantic-core'
> > > +        checkvars['LICENSE'] =3D set(['MIT'])
> > > +        checkvars['LIC_FILES_CHKSUM'] =3D
> 'file://LICENSE;md5=3Dab599c188b4a314d2856b3a55030c75c'
> > > +        checkvars['SRC_URI[sha256sum]'] =3D
> '6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71'
> > > +        inherits =3D ['python_maturin', 'pypi']
> > > +
> > > +        self._test_recipe_contents(recipefile, checkvars, inherits)
> > > +
> > >      def test_recipetool_create_github_tarball(self):
> > >          # Basic test to ensure github URL mangling doesn't apply to
> release tarballs
> > >          temprecipe =3D os.path.join(self.tempdir, 'recipe')
> > > diff --git a/scripts/lib/recipetool/create_buildsys_python.py
> b/scripts/lib/recipetool/create_buildsys_python.py
> > > index a2af41fdda8..60c59034504 100644
> > > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > > @@ -735,6 +735,7 @@ class
> PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
> > >          "poetry.core.masonry.api": "python_poetry_core",
> > >          "flit_core.buildapi": "python_flit_core",
> > >          "hatchling.build": "python_hatchling",
> > > +        "maturin": "python_maturin",
> > >      }
> > >
> > >      # setuptools.build_meta and flit declare project metadata into
> the "project" section of pyproject.toml
> > > --
> > > 2.34.1
> > >
> >
> > >
> > >
> > >
> >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192097):
> https://lists.openembedded.org/g/openembedded-core/message/192097
> > Mute This Topic: https://lists.openembedded.org/mt/103071823/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000008ea231060c6d5e9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Dec 9, 2023 at 3:59=E2=80=AFAM Alexandre Belloni &l=
t;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootli=
n.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddin=
g-left:1ex;border-left-color:rgb(204,204,204)">On 09/12/2023 12:29:50+0100,=
 Alexandre Belloni via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; maturin is not reproducible:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible=
-20231208-rfbproj4/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank=
">https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-rfbp=
roj4/packages/diff-html/</a><br>
<br>
<br>
Probably related:<br>
<br>
WARNING: python3-maturin-1.3.2-r0 do_package_qa: QA Issue: File /usr/bin/.d=
ebug/maturin in package python3-maturin-dbg contains reference to TMPDIR<br=
>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/8267/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8267/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/6018/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6018/steps/12/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/52/build=
s/8141/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8141/steps/11/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/108/buil=
ds/5453/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5453/steps/11/log=
s/stdio</a><br>
<br>
</blockquote><div dir=3D"auto">I think at least this part is sorted:</div><=
div dir=3D"auto"><div><a href=3D"https://github.com/alexcrichton/bzip2-rs/p=
ull/101">https://github.com/alexcrichton/bzip2-rs/pull/101</a></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Thank you to khem for making me real=
ize the options passed to the =E2=80=98cc=E2=80=99 crate were the issue in =
this case. (The Makefile is not used, nor are CFLAGS from the environment)<=
/div><br></div><div dir=3D"auto">The reordering bits might be a different p=
roblem. If anybody has any thoughts on that I=E2=80=99m all ears.</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)"><br>
&gt; <br>
&gt; On 08/12/2023 18:02:24-0800, Tim Orling wrote:<br>
&gt; &gt; Add the new python_maturin PEP-517 backend<br>
&gt; &gt; <br>
&gt; &gt; Add selftest for &#39;pydantic-core&#39; pypi package.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsul=
ko.com" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Changes in v2:<br>
&gt; &gt;=C2=A0 - drop all SRC_URI checksums except sha256sum (Peter&#39;s =
change)<br>
&gt; &gt;=C2=A0 =C2=A0 * requires &quot;[PATCH v2] recipetool: pypi: do not=
 clobber SRC_URI checksums&quot;<br>
&gt; &gt;=C2=A0 - drop SRC_URI (Julien&#39;s change)<br>
&gt; &gt;=C2=A0 - add &quot;inherit pypi&quot; (Julien&#39;s change)<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 meta/lib/oeqa/selftest/cases/recipetool.py=C2=A0 =C2=A0 | 2=
9 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../lib/recipetool/create_buildsys_python.py=C2=A0 |=C2=A0 =
1 +<br>
&gt; &gt;=C2=A0 2 files changed, 30 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/li=
b/oeqa/selftest/cases/recipetool.py<br>
&gt; &gt; index d10d61bc5b0..8d39f639acf 100644<br>
&gt; &gt; --- a/meta/lib/oeqa/selftest/cases/recipetool.py<br>
&gt; &gt; +++ b/meta/lib/oeqa/selftest/cases/recipetool.py<br>
&gt; &gt; @@ -663,6 +663,35 @@ class RecipetoolCreateTests(RecipetoolBase):=
<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._test_recipe_contents(reci=
pefile, checkvars, inherits)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +=C2=A0 =C2=A0 def test_recipetool_create_python3_pep517_maturin(=
self):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This test require python 3.11 or a=
bove for the tomllib module<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # or tomli module to be installed<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import tomllib<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ImportError:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import t=
omli<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ImportError:<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ski=
pTest(&#39;Test requires python 3.11 or above for tomllib module or tomli m=
odule&#39;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test creating python3 package from=
 tarball (using maturin class)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 temprecipe =3D os.path.join(self.tem=
pdir, &#39;recipe&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(temprecipe)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D &#39;pydantic-core&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pv =3D &#39;2.14.5&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipefile =3D os.path.join(tempreci=
pe, &#39;python3-%s_%<a href=3D"http://s.bb" rel=3D"noreferrer" target=3D"_=
blank">s.bb</a>&#39; % (pn, pv))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcuri =3D &#39;<a href=3D"https://f=
iles.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc=
47fc36a9979c7aa888b245/pydantic_core-%s.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c=
497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-%s.tar.gz</a>&#39=
; % pv<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;recipetool cr=
eate -o %s %s&#39; % (temprecipe, srcuri))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.isfile(recip=
efile))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars =3D {}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;HOMEPAGE&#39;] =3D &#=
39;<a href=3D"https://github.com/pydantic/pydantic-core" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/pydantic/pydantic-core</a>&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;LICENSE&#39;] =3D set=
([&#39;MIT&#39;])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;LIC_FILES_CHKSUM&#39;=
] =3D &#39;file://LICENSE;md5=3Dab599c188b4a314d2856b3a55030c75c&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;SRC_URI[sha256sum]&#3=
9;] =3D &#39;6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e=
71&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 inherits =3D [&#39;python_maturin&#3=
9;, &#39;pypi&#39;]<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._test_recipe_contents(recipefil=
e, checkvars, inherits)<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def test_recipetool_create_github_tarball(sel=
f):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Basic test to ensure github U=
RL mangling doesn&#39;t apply to release tarballs<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 temprecipe =3D os.path.join(sel=
f.tempdir, &#39;recipe&#39;)<br>
&gt; &gt; diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/s=
cripts/lib/recipetool/create_buildsys_python.py<br>
&gt; &gt; index a2af41fdda8..60c59034504 100644<br>
&gt; &gt; --- a/scripts/lib/recipetool/create_buildsys_python.py<br>
&gt; &gt; +++ b/scripts/lib/recipetool/create_buildsys_python.py<br>
&gt; &gt; @@ -735,6 +735,7 @@ class PythonPyprojectTomlRecipeHandler(Python=
RecipeHandler):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;poetry.core.masonry.api&q=
uot;: &quot;python_poetry_core&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;flit_core.buildapi&quot;:=
 &quot;python_flit_core&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hatchling.build&quot;: &q=
uot;python_hatchling&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;maturin&quot;: &quot;python_ma=
turin&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # setuptools.build_meta and flit declare proj=
ect metadata into the &quot;project&quot; section of pyproject.toml<br>
&gt; &gt; -- <br>
&gt; &gt; 2.34.1<br>
&gt; &gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#192097): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/192097" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/192097</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10307182=
3/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103071823/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000008ea231060c6d5e9e--

