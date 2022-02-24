Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA775C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 04:07:24 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.6361.1645675644131141614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DNRZrwaQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id h13so1669356qvk.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=61SWW+or5mURNO3tAh555cP0otY+gp5HYaEdXQhf12g=;
        b=DNRZrwaQM4eMBDKrFeIpE6r+rDRxcbxmh3PwcMVID5Gq2tUlpOg8sNDaxPu/w7+N6H
         jZRpsI7SaySe44UU8z6QkoySTFlDAUBt2umUv/GKdHBhTp7JGDMoUdlDsB/sx9TXsBqu
         hsef6xwrFjuKwJvr/+rs2aLGK/V8euBJTaV9XGNvoSjCK0cSITBEkUDtxztPWWPildHq
         b3pMrhtrol9hKC82hixFqpzJIEZK6bbSDk7n+UztfSVRNGHms7SIamPKRax7aIsGt9nO
         HrqcgBi22u7olx3apKH5/ZDJav+Z3LCE7dWmw0bo/L7xHTBt+5Rg7ZfSIhKaSaEgra1l
         a4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=61SWW+or5mURNO3tAh555cP0otY+gp5HYaEdXQhf12g=;
        b=oMPkxZRUb5pRZky9ICYu9vx4i/y6Esr7+8mraL5iuB2qhhNDRi6WFQU0adM+ddaTWP
         qheuPie2TJMpVEtZL8liyxziIUDnbL03+RWVVdFLSfwiPZiqOIB+yFgjbuDUjqZO9EXa
         1hIC/XOxTOBTi5H3wFbErCIzBuqEt/SJuz0XUAj3LG5akYfNUXSkUOwnL7lw80RdV9ht
         wFqdpaGUqxsR31Lp34DPIznUZann5+nuf5UVlskKv56X7er10cO9HsWVukReWfcxt1DG
         nv7K1nfATTY/1u7TEOxD+BpvCgCblBYj20UEjc0Ya26TcSVXpP51NqJ7NP+75w3YEMqq
         cLiw==
X-Gm-Message-State: AOAM5301oPQgtDA54r4Cssrj4sYnLpiy44hCz4HUuw/KyaUM7Wc6ChgA
	/DSG6zuR51SwqCnyVpgWnKNUAbXL6WEjYXuijiM=
X-Google-Smtp-Source: 
 ABdhPJxRtlEXgWSnDVYe7FvWt8H5856qAyO12YHEZwIDWR12F907BhUcxCfRYtPhQaf31LK/YTD+aUybQzDVAA3Lzho=
X-Received: by 2002:ad4:574a:0:b0:42b:ef56:c2a4 with SMTP id
 q10-20020ad4574a000000b0042bef56c2a4mr608533qvx.16.1645675643029; Wed, 23 Feb
 2022 20:07:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <CAMKF1sobUZW4FbtdoGpk7yj8XZwNht4YqwHD=ohT_CmOmDry3Q@mail.gmail.com>
 <CANx9H-Bx_AFnAnCjJSoMqS59pGR3dH5vuYN0fvLPdz+CBy=z7A@mail.gmail.com>
 <CAMKF1sqNCMhH9_OoVzewjvd1SOHsF+5z3WFBmp51itSsh-eEzA@mail.gmail.com>
 <CANx9H-D-4RZgg4y=B+2QwyCghiwT0uEDHyquxMz6aaVw-cBa0g@mail.gmail.com>
 <CAMKF1so1W0nAKdpxUwxUS=AMH4joLkaisqLsGHt=X6TOqtxvWA@mail.gmail.com>
 <CANx9H-Digth=jXdoN3riPVs9FMZjZSAtjgaWQi3KTnS6qiUCXg@mail.gmail.com>
In-Reply-To: 
 <CANx9H-Digth=jXdoN3riPVs9FMZjZSAtjgaWQi3KTnS6qiUCXg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2022 20:06:56 -0800
Message-ID: 
 <CAMKF1sqo0vAR8RB04_UKoGqwEegv=m+vbZqh47A_q3ZtC0RL7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/32] Python PEP-517: build wheels and
 install with pip
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 04:07:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162289

Right now approx 150 out of 470 recipes [1] in meta-python are directly fai=
ling,
perhaps there will be more once these are fixed then there are other layers
which might be carrying some impacted python modules. Also YP compatibility
is broken due to python3-nose removal. If we are planning
to include this in the upcoming release,we would need some commitment
and strategy to fix these and other ripple effects throughout the ecosystem
especially since this is an LTS release. I wish this changeset was proposed
in a release prior to LTS release, so it could have given enough time to
adjust for the ecosystem. This is will take some effort in stabilizing

I also wonder, what do we lose if we do not put this into the LTS
release?

 [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1460

On Tue, Feb 22, 2022 at 11:23 AM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Tue, Feb 22, 2022 at 11:18 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Feb 22, 2022 at 10:40 AM Tim Orling <ticotimo@gmail.com> wrote:
>> >
>> >
>> >
>> > On Tue, Feb 22, 2022 at 10:24 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Tue, Feb 22, 2022 at 10:21 AM Tim Orling <ticotimo@gmail.com> wrot=
e:
>> >> >
>> >> >
>> >> >
>> >> > On Tue, Feb 22, 2022 at 9:22 AM Khem Raj <raj.khem@gmail.com> wrote=
:
>> >> >>
>> >> >> this is going into dep loops Try
>> >> >>
>> >> >> bitbake python3-wheel-native
>> >> >
>> >> >
>> >> > It shouldn=E2=80=99t
>> >> > https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtool=
s/python/python3-wheel_0.37.1.bb?h=3Dtimo/bootstrap-wheels
>> >> >
>> >>
>> >> I have been trying whats on master-next
>> >>
>> >
>> > I can't reproduce. Can you point me at an error log please?
>> > It might have something to do with sstate cache, but that's just a hun=
ch.
>> >
>>
>> This is because python3-wheel was moved to core and modified but not
>> deleted from meta-python at same time. I have sent a patch for that
>>
> Already sent one:
> https://patchwork.yoctoproject.org/project/oe/patch/20220222184920.231039=
1-1-tim.orling@konsulko.com/
>
>>
>> >>
>> >> > DEPENDS:remove:class-native =3D "python3-pip-native"
>> >> >
>> >> > do_install:class-native () {
>> >> >     # We need to bootstrap python3-wheel-native
>> >> >     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>> >> >     PYPA_WHEEL=3D"${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
>> >> >     unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
>> >> >     bbfatal_log "Failed to install"
>> >> > }
>> >> >>
>> >> >>
>> >> >>
>> >> >>
>> >> >> On Mon, Feb 21, 2022 at 1:23 PM Tim Orling <ticotimo@gmail.com> wr=
ote:
>> >> >> >
>> >> >> > Upstream Python is moving to pyproject.toml rather than setup.py=
 and
>> >> >> > wheels rather than eggs. The main place this is documented is in
>> >> >> > PEP-517[1]. Installing packages with setup.py install is depreca=
ted.
>> >> >> >
>> >> >> > We have a choice with the 'kirkstone' LTS release of introducing=
 this
>> >> >> > series (and fixing any fall out during the stabilization period)=
 or
>> >> >> > living with deprecated Python packaging for the duration of the =
LTS (at
>> >> >> > a minimum 2 years). This seems to be a compelling enough reason =
to bring
>> >> >> > in this series, even if it results in a slight slip of the 'feat=
ure
>> >> >> > freeze', which is officially tomorrow, Monday 21 Feb, 2022.
>> >> >> >
>> >> >> > This series bootstraps python3-setuptools-native,
>> >> >> > python3-flit-core-native, python3-wheel-native and python3-pip-n=
ative,
>> >> >> > simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This al=
lows all
>> >> >> > other recipes to be installed with pip, as intended by upstream.
>> >> >> >
>> >> >> > Three new classes are introduced:
>> >> >> > (1) flit_core which builds PEP-517 compliant packages which use
>> >> >> >     flit_core.buildapi as their build-backend.
>> >> >> > (2) setuptools_build_meta which builds PEP-517 compliant package=
s which use
>> >> >> >     setuptools_build_meta  as their build-backend.
>> >> >> > (3) pip_install_wheel, which simply installs wheels built by oth=
er
>> >> >> >     classes.
>> >> >> >
>> >> >> > The original setuptools3.bbclass do_compile is modified to
>> >> >> > 'setup.py bdist_wheel' (from python3-wheel-native) rather than t=
he deprecated
>> >> >> > 'setup.py build' mechanism.
>> >> >> >
>> >> >> > The original setuptools3.bbclass do_install is modified to
>> >> >> > use the pip_install_wheel.bbclass to install wheels with pip rat=
her than
>> >> >> > the deprecated 'setup.py install' mechanism.
>> >> >> >
>> >> >> > For pip install, we disable dependency checking (--no-deps) beca=
use it
>> >> >> > proves to be brittle in our environment without providing full w=
heel
>> >> >> > cache that seems like overhead that we do not need. We also disa=
ble
>> >> >> > fetching wheels from pypi (--no-index). This is no different tha=
n our
>> >> >> > normal workflow of requiring dependencies to be defined in a rec=
ipe.
>> >> >> >
>> >> >> > Missing from this series is documentation of the new features, c=
lasses
>> >> >> > and variables (this will be done under separate cover).
>> >> >> >
>> >> >> > Also desired and previously discussed in YP meetings is a helper
>> >> >> > function to warn that a recipe which currently inherits setuptoo=
ls3
>> >> >> > but has a pyproject.toml and defines a build-system.build-backen=
d should
>> >> >> > instead use of the new PEP-517 classes. This function is still i=
n progress.
>> >> >> >
>> >> >> > During testing, recipes which use python3-setuptools-scm are fai=
ling to
>> >> >> > determine the version of the python package, For several recipes=
, the fix
>> >> >> > was to use pyproject.toml and PEP-517 build backends. To be sure=
, other recipes
>> >> >> > are still going to fail for the short term, until the root cause=
 can be
>> >> >> > determined. This was not seen again in v2 builds.
>> >> >> >
>> >> >> > Another PEP-517 build-backend, poetry.core.masonry.api has been
>> >> >> > identified in recipes in meta-python, but not in oe-core. The
>> >> >> > python3-poetry-core recipe is WIP, but brings in a number of
>> >> >> > dependencies that are perhaps not worth it to bring into oe-core=
 at this
>> >> >> > time. Rather we can support these recipes in meta-python?
>> >> >> >
>> >> >> > Fixes in v2 include passing --root=3D${D} to pip install (rather=
 than --target)
>> >> >> > and also passing --prefix so that scripts are (usually) installe=
d in the proper
>> >> >> > location. pip install also 'helpfully' overwrites python3 intepr=
eter with nativepython3
>> >> >> > in #!, so add a fix to return the values to what is actually cor=
rect (similar to what is
>> >> >> > done in setuptools3.bbclass). Also several recipes still needed =
PIP_INSTALL_PACKAGE defined.
>> >> >> >
>> >> >> > Also added self as maintainer of new recipes.
>> >> >> >
>> >> >> > [YOCTO #14638]
>> >> >> >
>> >> >> > [1] https://www.python.org/dev/peps/pep-0517/
>> >> >> >
>> >> >> > The following changes since commit 41ae26ecab731f2fb6593df143476=
c94183be209:
>> >> >> >
>> >> >> >   releases: update to include 3.4.2 (2022-02-21 16:46:22 +0000)
>> >> >> >
>> >> >> > are available in the Git repository at:
>> >> >> >
>> >> >> >   git://git.yoctoproject.org/git/poky-contrib timo/bootstrap-whe=
els
>> >> >> >   http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=
=3Dtimo/bootstrap-wheels
>> >> >> >
>> >> >> > Tim Orling (32):
>> >> >> >   python3-wheel: move 0.37.0 from meta-python
>> >> >> >   python3-flit-core: add recipe for 3.6.0
>> >> >> >   flit_core.bbclass: add helper for newer python packaging
>> >> >> >   python3-wheel: inherit flit_core
>> >> >> >   pip_install_wheel.bbclass: add helper class
>> >> >> >   setuptools_build_meta.bbclass: add helper class
>> >> >> >   python3-pip: inherit setuptools_build_meta
>> >> >> >   python3-attrs: inherit setuptools_build_meta
>> >> >> >   python3-git: inherit setuptools_build_meta
>> >> >> >   python3-pytest: inherit setuptools_build_meta
>> >> >> >   python3-setuptools-scm: inherit setuptools_build_meta
>> >> >> >   python3-zipp: inherit setuptools_build_meta
>> >> >> >   python3-iniconfig: inherit setuptools_build_meta
>> >> >> >   python3-py: inherit setuptools_build_meta
>> >> >> >   python3-pluggy: inherit setuptools_build_meta
>> >> >> >   python3-setuptools: inherit setuptools_base_meta
>> >> >> >   setuptools3.bbclass: refactor for wheels
>> >> >> >   python3-more-itertools: set PIP_INSTALL_PACKAGE
>> >> >> >   meson: inherit setuptools_build_meta
>> >> >> >   python3-libarchive-d: set PIP_INSTALL_PACKAGE
>> >> >> >   python3-smartypants: patch hash bang to python3
>> >> >> >   python3-scons: merge -native recipe
>> >> >> >   python3-subunit: merge inc; set PIP_INSTALL_PACKAGE
>> >> >> >   python3-magic: set PIP_INSTALL_PACKAGE
>> >> >> >   bmap-tools: set PIP_INSTALL_PACKAGE, BASEVER
>> >> >> >   asciidoc: set PIP_INSTALL_PACKAGE
>> >> >> >   gi-docgen: set PIP_INSTALL_PACKAGE
>> >> >> >   numpy: set PIP_INSTALL_PACKAGE
>> >> >> >   python3-dbusmock: set PIP_INSTALL_PACKAGE
>> >> >> >   python3-mako: inherit setuptools_build_meta
>> >> >> >   python3-packaging: inherit setuptools_build_meta
>> >> >> >   python3-nose: drop recipe
>> >> >> >
>> >> >> >  meta/classes/flit_core.bbclass                |  16 +++
>> >> >> >  meta/classes/pip_install_wheel.bbclass        |  37 +++++++
>> >> >> >  meta/classes/setuptools3.bbclass              |  20 ++--
>> >> >> >  meta/classes/setuptools_build_meta.bbclass    |  18 ++++
>> >> >> >  meta/conf/distro/include/maintainers.inc      |   3 +-
>> >> >> >  meta/recipes-devtools/meson/meson_0.61.2.bb   |   4 +-
>> >> >> >  meta/recipes-devtools/python/python-nose.inc  |  18 ----
>> >> >> >  .../python/python-subunit.inc                 |  14 ---
>> >> >> >  .../python/python3-attrs_21.4.0.bb            |   2 +-
>> >> >> >  .../python/python3-dbusmock_0.25.0.bb         |   1 +
>> >> >> >  .../python/python3-flit-core_3.6.0.bb         |  41 +++++++
>> >> >> >  .../python/python3-git_3.1.26.bb              |   2 +-
>> >> >> >  .../python/python3-iniconfig_1.1.1.bb         |   4 +-
>> >> >> >  .../python/python3-libarchive-c_4.0.bb        |   2 +
>> >> >> >  .../python/python3-magic_0.4.25.bb            |   1 +
>> >> >> >  .../python/python3-mako_1.1.6.bb              |   2 +-
>> >> >> >  .../python/python3-more-itertools_8.12.0.bb   |   2 +
>> >> >> >  .../python/python3-nose_1.3.7.bb              |   2 -
>> >> >> >  .../python/python3-numpy_1.22.2.bb            |   1 +
>> >> >> >  .../python/python3-packaging_21.3.bb          |   2 +-
>> >> >> >  .../python/python3-pip_22.0.3.bb              |  19 +++-
>> >> >> >  .../python/python3-pluggy_1.0.0.bb            |   2 +-
>> >> >> >  .../python/python3-py_1.11.0.bb               |   2 +-
>> >> >> >  .../python/python3-pytest_7.0.1.bb            |   4 +-
>> >> >> >  .../python/python3-scons-native_4.3.0.bb      |   7 --
>> >> >> >  .../python/python3-scons_4.3.0.bb             |  13 ++-
>> >> >> >  .../python/python3-setuptools-scm_6.4.2.bb    |   2 +-
>> >> >> >  .../python/python3-setuptools_59.5.0.bb       |  19 +++-
>> >> >> >  .../0001-Change-hash-bang-to-python3.patch    |  47 ++++++++
>> >> >> >  .../python/python3-smartypants_2.0.0.bb       |   1 +
>> >> >> >  ...001-setup.py-use-vendored-_distutils.patch |  27 +++++
>> >> >> >  .../python/python3-strict-rfc3339_0.7.bb      |   4 +-
>> >> >> >  .../python/python3-subunit_1.4.0.bb           |  17 ++-
>> >> >> >  ...roject.toml-from-flit-backend-branch.patch | 100 +++++++++++=
+++++++
>> >> >> >  .../python/python3-wheel_0.37.1.bb            |  24 +++++
>> >> >> >  .../python/python3-zipp_3.7.0.bb              |   2 +-
>> >> >> >  .../asciidoc/asciidoc_10.1.1.bb               |   1 +
>> >> >> >  meta/recipes-gnome/gi-docgen/gi-docgen_git.bb |   1 +
>> >> >> >  .../{bmap-tools_3.6.bb =3D> bmap-tools_git.bb}  |   6 +-
>> >> >> >  39 files changed, 412 insertions(+), 78 deletions(-)
>> >> >> >  create mode 100644 meta/classes/flit_core.bbclass
>> >> >> >  create mode 100644 meta/classes/pip_install_wheel.bbclass
>> >> >> >  create mode 100644 meta/classes/setuptools_build_meta.bbclass
>> >> >> >  delete mode 100644 meta/recipes-devtools/python/python-nose.inc
>> >> >> >  delete mode 100644 meta/recipes-devtools/python/python-subunit.=
inc
>> >> >> >  create mode 100644 meta/recipes-devtools/python/python3-flit-co=
re_3.6.0.bb
>> >> >> >  delete mode 100644 meta/recipes-devtools/python/python3-nose_1.=
3.7.bb
>> >> >> >  delete mode 100644 meta/recipes-devtools/python/python3-scons-n=
ative_4.3.0.bb
>> >> >> >  create mode 100644 meta/recipes-devtools/python/python3-smartyp=
ants/0001-Change-hash-bang-to-python3.patch
>> >> >> >  create mode 100644 meta/recipes-devtools/python/python3-strict-=
rfc3339/0001-setup.py-use-vendored-_distutils.patch
>> >> >> >  create mode 100644 meta/recipes-devtools/python/python3-wheel/0=
001-Backport-pyproject.toml-from-flit-backend-branch.patch
>> >> >> >  create mode 100644 meta/recipes-devtools/python/python3-wheel_0=
.37.1.bb
>> >> >> >  rename meta/recipes-support/bmap-tools/{bmap-tools_3.6.bb =3D> =
bmap-tools_git.bb} (86%)
>> >> >> >
>> >> >> > --
>> >> >> > 2.30.2
>> >> >> >
>> >> >> >
>> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >> > Links: You receive all messages sent to this group.
>> >> >> > View/Reply Online (#162076): https://lists.openembedded.org/g/op=
enembedded-core/message/162076
>> >> >> > Mute This Topic: https://lists.openembedded.org/mt/89304007/1997=
914
>> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/=
unsub [raj.khem@gmail.com]
>> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >> >

