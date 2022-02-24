Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7837EC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 04:50:49 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.6614.1645678248130622743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GRV0Y3hd;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id hw13so1803243ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qoRhcvRxPi+mKgRaLbcLpiBmDDEQ2fjpMp6uXtNtBU4=;
        b=GRV0Y3hdkaYUKhQo8cCCL/77SJPb55uB0QFL+VknLDdsLjHaNlOOMAwmtHsX3rwdFI
         tdcyjLJOdxlduVflZnG/o8ACpgn0TJp9PUmJi05rAfldM5UeQNQR0gD/95WDuuWC2jS3
         VvLAhKGza5spXTVUqR626gzOjRhehspc1ipnZz5s5Q8YnKgyBlwMT4Fg6IrpRgzGNyo+
         a9bZ1nI+m/EjBn+W1FgeiGNRJ9kd8kQkeNFKasICWV/1E0wglgM4FRTqxKmG6GdrFvoS
         etYIkLagdZuBgm+jbczhP/14hlMc2u/PfbVZLnv6YMClaiPfWK0ckmunbHXMOdfjKfay
         VUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qoRhcvRxPi+mKgRaLbcLpiBmDDEQ2fjpMp6uXtNtBU4=;
        b=YGW/u5VGhyTXYk19E2/YVisPD4PqRBuURWMQWG5AmctlhVEP4BkSQj428oq5uSkLud
         atEBQM6kWaSZW6FuOhSEdwoxaMGVGPhBhHUhxTR8pt0u0vq6wmNgPwV+K3PUBRGJjEuw
         HazLas5wQmzQWbGU2SMepMMkP8zkpaJpdWLQCQSGegtDucmoCbi6e77JzgUQ1fcHDITh
         EtJZOW10OYRJ8g8vhDyI5xKa3a2s0UiVWjBOL4qnkDlDtEvdTi77yfy596H/PeLFBwFM
         G6dx6y0JbJwdfKn0s2LgZhpnBUVzwAH7VZUnq8tkuCHm9olpHXMLN0PROD9fEbZNAJ70
         zbRQ==
X-Gm-Message-State: AOAM532PjxmFOtLKR2iZe/0Op2buwVZaOBBmaX6e1zl4o7axGy+6oFIB
	k+oDGuZ792zPbNaXyADmtTsS8fHlKBatUlJ0SYU=
X-Google-Smtp-Source: 
 ABdhPJzb7o6xu0/K+t4P9izpfSOXW/XrU8sC+qpsL6RGj6PNfbLFQ0X+h9osOrws3ADqu4gsZzzj/XHXtn/NOu3xx/s=
X-Received: by 2002:a17:907:6e10:b0:6d1:4447:95bc with SMTP id
 sd16-20020a1709076e1000b006d1444795bcmr767103ejc.610.1645678246351; Wed, 23
 Feb 2022 20:50:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <CAMKF1sobUZW4FbtdoGpk7yj8XZwNht4YqwHD=ohT_CmOmDry3Q@mail.gmail.com>
 <CANx9H-Bx_AFnAnCjJSoMqS59pGR3dH5vuYN0fvLPdz+CBy=z7A@mail.gmail.com>
 <CAMKF1sqNCMhH9_OoVzewjvd1SOHsF+5z3WFBmp51itSsh-eEzA@mail.gmail.com>
 <CANx9H-D-4RZgg4y=B+2QwyCghiwT0uEDHyquxMz6aaVw-cBa0g@mail.gmail.com>
 <CAMKF1so1W0nAKdpxUwxUS=AMH4joLkaisqLsGHt=X6TOqtxvWA@mail.gmail.com>
 <CANx9H-Digth=jXdoN3riPVs9FMZjZSAtjgaWQi3KTnS6qiUCXg@mail.gmail.com>
 <CAMKF1sqo0vAR8RB04_UKoGqwEegv=m+vbZqh47A_q3ZtC0RL7A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqo0vAR8RB04_UKoGqwEegv=m+vbZqh47A_q3ZtC0RL7A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 23 Feb 2022 20:50:35 -0800
Message-ID: 
 <CANx9H-BSGZbYi6NJ5F6uvWmt-2DH=qamSNgPYanvHYno_LgmLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/32] Python PEP-517: build wheels and
 install with pip
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000049d8a805d8bc5374"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 04:50:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162292

--00000000000049d8a805d8bc5374
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 8:07 PM Khem Raj <raj.khem@gmail.com> wrote:

> Right now approx 150 out of 470 recipes [1] in meta-python are directly
> failing,
> perhaps there will be more once these are fixed then there are other laye=
rs
> which might be carrying some impacted python modules.


The issue has mostly been detection of the wheel filename and this should
be improved by:

https://lore.kernel.org/openembedded-core/20220224041200.2645054-1-tim.orli=
ng@konsulko.com/T/#t

Also YP compatibility
> is broken due to python3-nose removal.


We can try to run 2to3 on the python3-nose plugins or remove them
surgically to reintroduce cleanly Python 3 only
python3-nose. I propose that we move it to meta-python even so because
nothing in oe-core depends on nose and the
code has been completely bit-rotting since 2016. It could not be built
anymore in oe-core and something had to give.


> If we are planning
> to include this in the upcoming release,we would need some commitment
> and strategy to fix these and other ripple effects throughout the ecosyst=
em
> especially since this is an LTS release. I wish this changeset was propos=
ed
> in a release prior to LTS release, so it could have given enough time to
> adjust for the ecosystem. This is will take some effort in stabilizing
>

This has been months of work on my part to attempt to get us to where
upstream
Python Packaging Authority has been pushing since PEP-517 was announced in
2015.
We are very far behind the curve of upstream Python packaging.

While I too would love to have had this ready sooner, that was not possible
for many reasons.
But no matter what, this would have been painful until recipes could be
migrated, even if had
been available at M1.


> I also wonder, what do we lose if we do not put this into the LTS
> release?


We already have recipes in oe-core such as python3-jsonschema which can no
longer be upgraded
without moving to pyproject.toml based package builds. I'm sure there are
others in meta-python and
other layers in a similar story. We once again are in a situation that is a
bad image for the project because
we are using the now deprecated "setup.py install" and still building eggs.
To step into an LTS release
with the python packaging already entirely deprecated is just not a good
impression.

I understand your frustration with the build failures, but it has been a
very solid week of getting oe-core
stabilized (see
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3280).

I am running a build now for meta-python with the improved wheel filename
patch as well as a patch to
check for whether the current recipe already has pyproject.toml back-end
declared:
https://lore.kernel.org/openembedded-core/20220224041200.2645054-2-tim.orli=
ng@konsulko.com/T/#u


>
 [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1460
>
> On Tue, Feb 22, 2022 at 11:23 AM Tim Orling <ticotimo@gmail.com> wrote:
> >
> >
> >
> > On Tue, Feb 22, 2022 at 11:18 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Tue, Feb 22, 2022 at 10:40 AM Tim Orling <ticotimo@gmail.com> wrote=
:
> >> >
> >> >
> >> >
> >> > On Tue, Feb 22, 2022 at 10:24 AM Khem Raj <raj.khem@gmail.com> wrote=
:
> >> >>
> >> >> On Tue, Feb 22, 2022 at 10:21 AM Tim Orling <ticotimo@gmail.com>
> wrote:
> >> >> >
> >> >> >
> >> >> >
> >> >> > On Tue, Feb 22, 2022 at 9:22 AM Khem Raj <raj.khem@gmail.com>
> wrote:
> >> >> >>
> >> >> >> this is going into dep loops Try
> >> >> >>
> >> >> >> bitbake python3-wheel-native
> >> >> >
> >> >> >
> >> >> > It shouldn=E2=80=99t
> >> >> >
> https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/pyth=
on/python3-wheel_0.37.1.bb?h=3Dtimo/bootstrap-wheels
> >> >> >
> >> >>
> >> >> I have been trying whats on master-next
> >> >>
> >> >
> >> > I can't reproduce. Can you point me at an error log please?
> >> > It might have something to do with sstate cache, but that's just a
> hunch.
> >> >
> >>
> >> This is because python3-wheel was moved to core and modified but not
> >> deleted from meta-python at same time. I have sent a patch for that
> >>
> > Already sent one:
> >
> https://patchwork.yoctoproject.org/project/oe/patch/20220222184920.231039=
1-1-tim.orling@konsulko.com/
> >
> >>
> >> >>
> >> >> > DEPENDS:remove:class-native =3D "python3-pip-native"
> >> >> >
> >> >> > do_install:class-native () {
> >> >> >     # We need to bootstrap python3-wheel-native
> >> >> >     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> >> >> >     PYPA_WHEEL=3D"${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
> >> >> >     unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
> >> >> >     bbfatal_log "Failed to install"
> >> >> > }
> >> >> >>
> >> >> >>
> >> >> >>
> >> >> >>
> >> >> >> On Mon, Feb 21, 2022 at 1:23 PM Tim Orling <ticotimo@gmail.com>
> wrote:
> >> >> >> >
> >> >> >> > Upstream Python is moving to pyproject.toml rather than
> setup.py and
> >> >> >> > wheels rather than eggs. The main place this is documented is =
in
> >> >> >> > PEP-517[1]. Installing packages with setup.py install is
> deprecated.
> >> >> >> >
> >> >> >> > We have a choice with the 'kirkstone' LTS release of
> introducing this
> >> >> >> > series (and fixing any fall out during the stabilization
> period) or
> >> >> >> > living with deprecated Python packaging for the duration of th=
e
> LTS (at
> >> >> >> > a minimum 2 years). This seems to be a compelling enough reaso=
n
> to bring
> >> >> >> > in this series, even if it results in a slight slip of the
> 'feature
> >> >> >> > freeze', which is officially tomorrow, Monday 21 Feb, 2022.
> >> >> >> >
> >> >> >> > This series bootstraps python3-setuptools-native,
> >> >> >> > python3-flit-core-native, python3-wheel-native and
> python3-pip-native,
> >> >> >> > simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This
> allows all
> >> >> >> > other recipes to be installed with pip, as intended by upstrea=
m.
> >> >> >> >
> >> >> >> > Three new classes are introduced:
> >> >> >> > (1) flit_core which builds PEP-517 compliant packages which us=
e
> >> >> >> >     flit_core.buildapi as their build-backend.
> >> >> >> > (2) setuptools_build_meta which builds PEP-517 compliant
> packages which use
> >> >> >> >     setuptools_build_meta  as their build-backend.
> >> >> >> > (3) pip_install_wheel, which simply installs wheels built by
> other
> >> >> >> >     classes.
> >> >> >> >
> >> >> >> > The original setuptools3.bbclass do_compile is modified to
> >> >> >> > 'setup.py bdist_wheel' (from python3-wheel-native) rather than
> the deprecated
> >> >> >> > 'setup.py build' mechanism.
> >> >> >> >
> >> >> >> > The original setuptools3.bbclass do_install is modified to
> >> >> >> > use the pip_install_wheel.bbclass to install wheels with pip
> rather than
> >> >> >> > the deprecated 'setup.py install' mechanism.
> >> >> >> >
> >> >> >> > For pip install, we disable dependency checking (--no-deps)
> because it
> >> >> >> > proves to be brittle in our environment without providing full
> wheel
> >> >> >> > cache that seems like overhead that we do not need. We also
> disable
> >> >> >> > fetching wheels from pypi (--no-index). This is no different
> than our
> >> >> >> > normal workflow of requiring dependencies to be defined in a
> recipe.
> >> >> >> >
> >> >> >> > Missing from this series is documentation of the new features,
> classes
> >> >> >> > and variables (this will be done under separate cover).
> >> >> >> >
> >> >> >> > Also desired and previously discussed in YP meetings is a help=
er
> >> >> >> > function to warn that a recipe which currently inherits
> setuptools3
> >> >> >> > but has a pyproject.toml and defines a
> build-system.build-backend should
> >> >> >> > instead use of the new PEP-517 classes. This function is still
> in progress.
> >> >> >> >
> >> >> >> > During testing, recipes which use python3-setuptools-scm are
> failing to
> >> >> >> > determine the version of the python package, For several
> recipes, the fix
> >> >> >> > was to use pyproject.toml and PEP-517 build backends. To be
> sure, other recipes
> >> >> >> > are still going to fail for the short term, until the root
> cause can be
> >> >> >> > determined. This was not seen again in v2 builds.
> >> >> >> >
> >> >> >> > Another PEP-517 build-backend, poetry.core.masonry.api has bee=
n
> >> >> >> > identified in recipes in meta-python, but not in oe-core. The
> >> >> >> > python3-poetry-core recipe is WIP, but brings in a number of
> >> >> >> > dependencies that are perhaps not worth it to bring into
> oe-core at this
> >> >> >> > time. Rather we can support these recipes in meta-python?
> >> >> >> >
> >> >> >> > Fixes in v2 include passing --root=3D${D} to pip install (rath=
er
> than --target)
> >> >> >> > and also passing --prefix so that scripts are (usually)
> installed in the proper
> >> >> >> > location. pip install also 'helpfully' overwrites python3
> intepreter with nativepython3
> >> >> >> > in #!, so add a fix to return the values to what is actually
> correct (similar to what is
> >> >> >> > done in setuptools3.bbclass). Also several recipes still neede=
d
> PIP_INSTALL_PACKAGE defined.
> >> >> >> >
> >> >> >> > Also added self as maintainer of new recipes.
> >> >> >> >
> >> >> >> > [YOCTO #14638]
> >> >> >> >
> >> >> >> > [1] https://www.python.org/dev/peps/pep-0517/
> >> >> >> >
> >> >> >> > The following changes since commit
> 41ae26ecab731f2fb6593df143476c94183be209:
> >> >> >> >
> >> >> >> >   releases: update to include 3.4.2 (2022-02-21 16:46:22 +0000=
)
> >> >> >> >
> >> >> >> > are available in the Git repository at:
> >> >> >> >
> >> >> >> >   git://git.yoctoproject.org/git/poky-contrib
> timo/bootstrap-wheels
> >> >> >> >
> http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3Dtimo/boots=
trap-wheels
> >> >> >> >
> >> >> >> > Tim Orling (32):
> >> >> >> >   python3-wheel: move 0.37.0 from meta-python
> >> >> >> >   python3-flit-core: add recipe for 3.6.0
> >> >> >> >   flit_core.bbclass: add helper for newer python packaging
> >> >> >> >   python3-wheel: inherit flit_core
> >> >> >> >   pip_install_wheel.bbclass: add helper class
> >> >> >> >   setuptools_build_meta.bbclass: add helper class
> >> >> >> >   python3-pip: inherit setuptools_build_meta
> >> >> >> >   python3-attrs: inherit setuptools_build_meta
> >> >> >> >   python3-git: inherit setuptools_build_meta
> >> >> >> >   python3-pytest: inherit setuptools_build_meta
> >> >> >> >   python3-setuptools-scm: inherit setuptools_build_meta
> >> >> >> >   python3-zipp: inherit setuptools_build_meta
> >> >> >> >   python3-iniconfig: inherit setuptools_build_meta
> >> >> >> >   python3-py: inherit setuptools_build_meta
> >> >> >> >   python3-pluggy: inherit setuptools_build_meta
> >> >> >> >   python3-setuptools: inherit setuptools_base_meta
> >> >> >> >   setuptools3.bbclass: refactor for wheels
> >> >> >> >   python3-more-itertools: set PIP_INSTALL_PACKAGE
> >> >> >> >   meson: inherit setuptools_build_meta
> >> >> >> >   python3-libarchive-d: set PIP_INSTALL_PACKAGE
> >> >> >> >   python3-smartypants: patch hash bang to python3
> >> >> >> >   python3-scons: merge -native recipe
> >> >> >> >   python3-subunit: merge inc; set PIP_INSTALL_PACKAGE
> >> >> >> >   python3-magic: set PIP_INSTALL_PACKAGE
> >> >> >> >   bmap-tools: set PIP_INSTALL_PACKAGE, BASEVER
> >> >> >> >   asciidoc: set PIP_INSTALL_PACKAGE
> >> >> >> >   gi-docgen: set PIP_INSTALL_PACKAGE
> >> >> >> >   numpy: set PIP_INSTALL_PACKAGE
> >> >> >> >   python3-dbusmock: set PIP_INSTALL_PACKAGE
> >> >> >> >   python3-mako: inherit setuptools_build_meta
> >> >> >> >   python3-packaging: inherit setuptools_build_meta
> >> >> >> >   python3-nose: drop recipe
> >> >> >> >
> >> >> >> >  meta/classes/flit_core.bbclass                |  16 +++
> >> >> >> >  meta/classes/pip_install_wheel.bbclass        |  37 +++++++
> >> >> >> >  meta/classes/setuptools3.bbclass              |  20 ++--
> >> >> >> >  meta/classes/setuptools_build_meta.bbclass    |  18 ++++
> >> >> >> >  meta/conf/distro/include/maintainers.inc      |   3 +-
> >> >> >> >  meta/recipes-devtools/meson/meson_0.61.2.bb   |   4 +-
> >> >> >> >  meta/recipes-devtools/python/python-nose.inc  |  18 ----
> >> >> >> >  .../python/python-subunit.inc                 |  14 ---
> >> >> >> >  .../python/python3-attrs_21.4.0.bb            |   2 +-
> >> >> >> >  .../python/python3-dbusmock_0.25.0.bb         |   1 +
> >> >> >> >  .../python/python3-flit-core_3.6.0.bb         |  41 +++++++
> >> >> >> >  .../python/python3-git_3.1.26.bb              |   2 +-
> >> >> >> >  .../python/python3-iniconfig_1.1.1.bb         |   4 +-
> >> >> >> >  .../python/python3-libarchive-c_4.0.bb        |   2 +
> >> >> >> >  .../python/python3-magic_0.4.25.bb            |   1 +
> >> >> >> >  .../python/python3-mako_1.1.6.bb              |   2 +-
> >> >> >> >  .../python/python3-more-itertools_8.12.0.bb   |   2 +
> >> >> >> >  .../python/python3-nose_1.3.7.bb              |   2 -
> >> >> >> >  .../python/python3-numpy_1.22.2.bb            |   1 +
> >> >> >> >  .../python/python3-packaging_21.3.bb          |   2 +-
> >> >> >> >  .../python/python3-pip_22.0.3.bb              |  19 +++-
> >> >> >> >  .../python/python3-pluggy_1.0.0.bb            |   2 +-
> >> >> >> >  .../python/python3-py_1.11.0.bb               |   2 +-
> >> >> >> >  .../python/python3-pytest_7.0.1.bb            |   4 +-
> >> >> >> >  .../python/python3-scons-native_4.3.0.bb      |   7 --
> >> >> >> >  .../python/python3-scons_4.3.0.bb             |  13 ++-
> >> >> >> >  .../python/python3-setuptools-scm_6.4.2.bb    |   2 +-
> >> >> >> >  .../python/python3-setuptools_59.5.0.bb       |  19 +++-
> >> >> >> >  .../0001-Change-hash-bang-to-python3.patch    |  47 ++++++++
> >> >> >> >  .../python/python3-smartypants_2.0.0.bb       |   1 +
> >> >> >> >  ...001-setup.py-use-vendored-_distutils.patch |  27 +++++
> >> >> >> >  .../python/python3-strict-rfc3339_0.7.bb      |   4 +-
> >> >> >> >  .../python/python3-subunit_1.4.0.bb           |  17 ++-
> >> >> >> >  ...roject.toml-from-flit-backend-branch.patch | 100
> ++++++++++++++++++
> >> >> >> >  .../python/python3-wheel_0.37.1.bb            |  24 +++++
> >> >> >> >  .../python/python3-zipp_3.7.0.bb              |   2 +-
> >> >> >> >  .../asciidoc/asciidoc_10.1.1.bb               |   1 +
> >> >> >> >  meta/recipes-gnome/gi-docgen/gi-docgen_git.bb |   1 +
> >> >> >> >  .../{bmap-tools_3.6.bb =3D> bmap-tools_git.bb}  |   6 +-
> >> >> >> >  39 files changed, 412 insertions(+), 78 deletions(-)
> >> >> >> >  create mode 100644 meta/classes/flit_core.bbclass
> >> >> >> >  create mode 100644 meta/classes/pip_install_wheel.bbclass
> >> >> >> >  create mode 100644 meta/classes/setuptools_build_meta.bbclass
> >> >> >> >  delete mode 100644 meta/recipes-devtools/python/python-nose.i=
nc
> >> >> >> >  delete mode 100644
> meta/recipes-devtools/python/python-subunit.inc
> >> >> >> >  create mode 100644 meta/recipes-devtools/python/
> python3-flit-core_3.6.0.bb
> >> >> >> >  delete mode 100644 meta/recipes-devtools/python/
> python3-nose_1.3.7.bb
> >> >> >> >  delete mode 100644 meta/recipes-devtools/python/
> python3-scons-native_4.3.0.bb
> >> >> >> >  create mode 100644
> meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to=
-python3.patch
> >> >> >> >  create mode 100644
> meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-ven=
dored-_distutils.patch
> >> >> >> >  create mode 100644
> meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-f=
rom-flit-backend-branch.patch
> >> >> >> >  create mode 100644 meta/recipes-devtools/python/
> python3-wheel_0.37.1.bb
> >> >> >> >  rename meta/recipes-support/bmap-tools/{bmap-tools_3.6.bb =3D=
>
> bmap-tools_git.bb} (86%)
> >> >> >> >
> >> >> >> > --
> >> >> >> > 2.30.2
> >> >> >> >
> >> >> >> >
> >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> >> > Links: You receive all messages sent to this group.
> >> >> >> > View/Reply Online (#162076):
> https://lists.openembedded.org/g/openembedded-core/message/162076
> >> >> >> > Mute This Topic:
> https://lists.openembedded.org/mt/89304007/1997914
> >> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> >> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> >> >
>

--00000000000049d8a805d8bc5374
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 23, 2022 at 8:07 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Right now a=
pprox 150 out of 470 recipes [1] in meta-python are directly failing,<br>
perhaps there will be more once these are fixed then there are other layers=
<br>
which might be carrying some impacted python modules.</blockquote><div><br>=
</div><div>The issue has mostly been detection of the wheel filename and th=
is should be improved by:</div><div>=C2=A0<a href=3D"https://lore.kernel.or=
g/openembedded-core/20220224041200.2645054-1-tim.orling@konsulko.com/T/#t">=
https://lore.kernel.org/openembedded-core/20220224041200.2645054-1-tim.orli=
ng@konsulko.com/T/#t</a></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Also YP compatibility<br>
is broken due to python3-nose removal. </blockquote><div><br></div><div>We =
can try to run 2to3 on the python3-nose plugins or remove them surgically t=
o reintroduce cleanly Python 3 only</div><div>python3-nose. I propose that =
we move it to meta-python even so because nothing in oe-core depends on nos=
e and the</div><div>code has been completely bit-rotting since 2016. It cou=
ld not be built anymore in oe-core and something had to give.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">If we are planni=
ng<br>
to include this in the upcoming release,we would need some commitment<br>
and strategy to fix these and other ripple effects throughout the ecosystem=
<br>
especially since this is an LTS release. I wish this changeset was proposed=
<br>
in a release prior to LTS release, so it could have given enough time to<br=
>
adjust for the ecosystem. This is will take some effort in stabilizing<br><=
/blockquote><div><br></div><div>This has been months of work on my part to =
attempt to get us to where upstream</div><div>Python Packaging Authority ha=
s been pushing since PEP-517 was announced in 2015.</div><div>We are very f=
ar behind the curve of upstream Python packaging.</div><div><br></div><div>=
While I too would love to have had this ready sooner, that was not possible=
 for many reasons.</div><div>But no matter what, this would have been painf=
ul until recipes could be migrated, even if had</div><div>been available at=
 M1.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I also wonder, what do we lose if we do not put this into the LTS<br>
release?</blockquote><div><br></div><div>We already have recipes in oe-core=
 such as python3-jsonschema which can no longer be upgraded</div><div>witho=
ut moving to pyproject.toml based package builds. I&#39;m sure there are ot=
hers in meta-python and</div><div>other layers in a similar story. We once =
again are in a situation that is a bad image for the project because</div><=
div>we are using the now deprecated &quot;setup.py install&quot; and still =
building eggs. To step into an LTS release</div><div>with the python packag=
ing already entirely deprecated is just not a good impression.</div><div><b=
r></div><div>I understand your frustration with the build failures, but it =
has been a very solid week of getting oe-core</div><div>stabilized (see=C2=
=A0<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/bu=
ilds/3280">https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/3280</a>).=C2=A0</div><div><br></div><div>I am running a build now for me=
ta-python with the improved wheel filename patch as well as a patch to</div=
><div>check for whether the current recipe already has pyproject.toml back-=
end declared:</div><div><a href=3D"https://lore.kernel.org/openembedded-cor=
e/20220224041200.2645054-2-tim.orling@konsulko.com/T/#u">https://lore.kerne=
l.org/openembedded-core/20220224041200.2645054-2-tim.orling@konsulko.com/T/=
#u</a><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
=C2=A0[1] <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/88/builds/1460" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/88/builds/1460</a><br>
<br>
On Tue, Feb 22, 2022 at 11:23 AM Tim Orling &lt;<a href=3D"mailto:ticotimo@=
gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Feb 22, 2022 at 11:18 AM Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Feb 22, 2022 at 10:40 AM Tim Orling &lt;<a href=3D"mailto:=
ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, Feb 22, 2022 at 10:24 AM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, Feb 22, 2022 at 10:21 AM Tim Orling &lt;<a href=
=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Tue, Feb 22, 2022 at 9:22 AM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; this is going into dep loops Try<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; bitbake python3-wheel-native<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; It shouldn=E2=80=99t<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"https://git.yoctoproject.org/poky-contrib=
/tree/meta/recipes-devtools/python/python3-wheel_0.37.1.bb?h=3Dtimo/bootstr=
ap-wheels" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.or=
g/poky-contrib/tree/meta/recipes-devtools/python/python3-wheel_0.37.1.bb?h=
=3Dtimo/bootstrap-wheels</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I have been trying whats on master-next<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I can&#39;t reproduce. Can you point me at an error log pleas=
e?<br>
&gt;&gt; &gt; It might have something to do with sstate cache, but that&#39=
;s just a hunch.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; This is because python3-wheel was moved to core and modified but n=
ot<br>
&gt;&gt; deleted from meta-python at same time. I have sent a patch for tha=
t<br>
&gt;&gt;<br>
&gt; Already sent one:<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/2022022=
2184920.2310391-1-tim.orling@konsulko.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://patchwork.yoctoproject.org/project/oe/patch/20220222184920.23=
10391-1-tim.orling@konsulko.com/</a><br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; DEPENDS:remove:class-native =3D &quot;python3-pip-na=
tive&quot;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; do_install:class-native () {<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0# We need to bootstrap python3-wh=
eel-native<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0install -d ${D}${PYTHON_SITEPACKA=
GES_DIR}<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0PYPA_WHEEL=3D&quot;${B}/dist/${PY=
PI_PACKAGE}-${PV}-*.whl&quot;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0unzip -d ${D}${PYTHON_SITEPACKAGE=
S_DIR} ${PYPA_WHEEL} || \<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Failed to insta=
ll&quot;<br>
&gt;&gt; &gt;&gt; &gt; }<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; On Mon, Feb 21, 2022 at 1:23 PM Tim Orling &lt;<=
a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Upstream Python is moving to pyproject.toml=
 rather than setup.py and<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; wheels rather than eggs. The main place thi=
s is documented is in<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; PEP-517[1]. Installing packages with setup.=
py install is deprecated.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; We have a choice with the &#39;kirkstone&#3=
9; LTS release of introducing this<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; series (and fixing any fall out during the =
stabilization period) or<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; living with deprecated Python packaging for=
 the duration of the LTS (at<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; a minimum 2 years). This seems to be a comp=
elling enough reason to bring<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; in this series, even if it results in a sli=
ght slip of the &#39;feature<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; freeze&#39;, which is officially tomorrow, =
Monday 21 Feb, 2022.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; This series bootstraps python3-setuptools-n=
ative,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; python3-flit-core-native, python3-wheel-nat=
ive and python3-pip-native,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; simply unzipping the wheel into PYTHON_SITE=
PACKAGES_DIR. This allows all<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; other recipes to be installed with pip, as =
intended by upstream.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Three new classes are introduced:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; (1) flit_core which builds PEP-517 complian=
t packages which use<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0flit_core.buildapi as th=
eir build-backend.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; (2) setuptools_build_meta which builds PEP-=
517 compliant packages which use<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0setuptools_build_meta=C2=
=A0 as their build-backend.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; (3) pip_install_wheel, which simply install=
s wheels built by other<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0classes.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; The original setuptools3.bbclass do_compile=
 is modified to<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;setup.py bdist_wheel&#39; (from python=
3-wheel-native) rather than the deprecated<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;setup.py build&#39; mechanism.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; The original setuptools3.bbclass do_install=
 is modified to<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; use the pip_install_wheel.bbclass to instal=
l wheels with pip rather than<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; the deprecated &#39;setup.py install&#39; m=
echanism.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; For pip install, we disable dependency chec=
king (--no-deps) because it<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; proves to be brittle in our environment wit=
hout providing full wheel<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cache that seems like overhead that we do n=
ot need. We also disable<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; fetching wheels from pypi (--no-index). Thi=
s is no different than our<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; normal workflow of requiring dependencies t=
o be defined in a recipe.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Missing from this series is documentation o=
f the new features, classes<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; and variables (this will be done under sepa=
rate cover).<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Also desired and previously discussed in YP=
 meetings is a helper<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; function to warn that a recipe which curren=
tly inherits setuptools3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; but has a pyproject.toml and defines a buil=
d-system.build-backend should<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; instead use of the new PEP-517 classes. Thi=
s function is still in progress.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; During testing, recipes which use python3-s=
etuptools-scm are failing to<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; determine the version of the python package=
, For several recipes, the fix<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; was to use pyproject.toml and PEP-517 build=
 backends. To be sure, other recipes<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; are still going to fail for the short term,=
 until the root cause can be<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; determined. This was not seen again in v2 b=
uilds.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Another PEP-517 build-backend, poetry.core.=
masonry.api has been<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; identified in recipes in meta-python, but n=
ot in oe-core. The<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; python3-poetry-core recipe is WIP, but brin=
gs in a number of<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; dependencies that are perhaps not worth it =
to bring into oe-core at this<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; time. Rather we can support these recipes i=
n meta-python?<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Fixes in v2 include passing --root=3D${D} t=
o pip install (rather than --target)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; and also passing --prefix so that scripts a=
re (usually) installed in the proper<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; location. pip install also &#39;helpfully&#=
39; overwrites python3 intepreter with nativepython3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; in #!, so add a fix to return the values to=
 what is actually correct (similar to what is<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; done in setuptools3.bbclass). Also several =
recipes still needed PIP_INSTALL_PACKAGE defined.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Also added self as maintainer of new recipe=
s.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; [YOCTO #14638]<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; [1] <a href=3D"https://www.python.org/dev/p=
eps/pep-0517/" rel=3D"noreferrer" target=3D"_blank">https://www.python.org/=
dev/peps/pep-0517/</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; The following changes since commit 41ae26ec=
ab731f2fb6593df143476c94183be209:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0releases: update to include 3.4=
.2 (2022-02-21 16:46:22 +0000)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; are available in the Git repository at:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0git://<a href=3D"http://git.yoc=
toproject.org/git/poky-contrib" rel=3D"noreferrer" target=3D"_blank">git.yo=
ctoproject.org/git/poky-contrib</a> timo/bootstrap-wheels<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproj=
ect.org/cgit.cgi/git/poky-contrib/log/?h=3Dtimo/bootstrap-wheels" rel=3D"no=
referrer" target=3D"_blank">http://git.yoctoproject.org/cgit.cgi/git/poky-c=
ontrib/log/?h=3Dtimo/bootstrap-wheels</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Tim Orling (32):<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-wheel: move 0.37.0 from=
 meta-python<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-flit-core: add recipe f=
or 3.6.0<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0flit_core.bbclass: add helper f=
or newer python packaging<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-wheel: inherit flit_cor=
e<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0pip_install_wheel.bbclass: add =
helper class<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0setuptools_build_meta.bbclass: =
add helper class<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-pip: inherit setuptools=
_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-attrs: inherit setuptoo=
ls_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-git: inherit setuptools=
_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-pytest: inherit setupto=
ols_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-setuptools-scm: inherit=
 setuptools_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-zipp: inherit setuptool=
s_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-iniconfig: inherit setu=
ptools_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-py: inherit setuptools_=
build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-pluggy: inherit setupto=
ols_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-setuptools: inherit set=
uptools_base_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0setuptools3.bbclass: refactor f=
or wheels<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-more-itertools: set PIP=
_INSTALL_PACKAGE<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0meson: inherit setuptools_build=
_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-libarchive-d: set PIP_I=
NSTALL_PACKAGE<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-smartypants: patch hash=
 bang to python3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-scons: merge -native re=
cipe<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-subunit: merge inc; set=
 PIP_INSTALL_PACKAGE<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-magic: set PIP_INSTALL_=
PACKAGE<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0bmap-tools: set PIP_INSTALL_PAC=
KAGE, BASEVER<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0asciidoc: set PIP_INSTALL_PACKA=
GE<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0gi-docgen: set PIP_INSTALL_PACK=
AGE<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0numpy: set PIP_INSTALL_PACKAGE<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-dbusmock: set PIP_INSTA=
LL_PACKAGE<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-mako: inherit setuptool=
s_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-packaging: inherit setu=
ptools_build_meta<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0python3-nose: drop recipe<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/classes/flit_core.bbclass=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/classes/pip_install_wheel.bbclas=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 37 +++++++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/classes/setuptools3.bbclass=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 ++--<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/classes/setuptools_build_meta.bb=
class=C2=A0 =C2=A0 |=C2=A0 18 ++++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/conf/distro/include/maintainers.=
inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/recipes-devtools/meson/<a href=
=3D"http://meson_0.61.2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.61=
.2.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/recipes-devtools/python/python-n=
ose.inc=C2=A0 |=C2=A0 18 ----<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/python-subunit.inc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ---<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
attrs_21.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-attrs_21.4.0.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
dbusmock_0.25.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbusmock_0=
.25.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
flit-core_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flit-core_=
3.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 +++++++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
git_3.1.26.bb" rel=3D"noreferrer" target=3D"_blank">python3-git_3.1.26.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
iniconfig_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-iniconfig_=
1.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
libarchive-c_4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-libarchiv=
e-c_4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
magic_0.4.25.bb" rel=3D"noreferrer" target=3D"_blank">python3-magic_0.4.25.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
mako_1.1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.1.6.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
more-itertools_8.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-more=
-itertools_8.12.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
nose_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-nose_1.3.7.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
numpy_1.22.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.22.2.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
packaging_21.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-packaging_2=
1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
pip_22.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_22.0.3.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +++-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
pluggy_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pluggy_1.0.0.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
py_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py_1.11.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
pytest_7.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest_7.0.1.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
scons-native_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-n=
ative_4.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 --<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
scons_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_4.3.0.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 ++-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
setuptools-scm_6.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-setup=
tools-scm_6.4.2.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
setuptools_59.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptoo=
ls_59.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +++-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../0001-Change-hash-bang-to-python3.=
patch=C2=A0 =C2=A0 |=C2=A0 47 ++++++++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
smartypants_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smartypa=
nts_2.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ...001-setup.py-use-vendored-_distuti=
ls.patch |=C2=A0 27 +++++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
strict-rfc3339_0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-strict-=
rfc3339_0.7.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
subunit_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.4.=
0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 ++-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ...roject.toml-from-flit-backend-bran=
ch.patch | 100 ++++++++++++++++++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
wheel_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-wheel_0.37.1.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 +++++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-=
zipp_3.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-zipp_3.7.0.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../asciidoc/<a href=3D"http://asciid=
oc_10.1.1.bb" rel=3D"noreferrer" target=3D"_blank">asciidoc_10.1.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/recipes-gnome/gi-docgen/<a href=
=3D"http://gi-docgen_git.bb" rel=3D"noreferrer" target=3D"_blank">gi-docgen=
_git.bb</a> |=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../{<a href=3D"http://bmap-tools_3.6=
.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.6.bb</a> =3D&gt; <a =
href=3D"http://bmap-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">bmap=
-tools_git.bb</a>}=C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 39 files changed, 412 insertions(+), =
78 deletions(-)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/classes/flit_=
core.bbclass<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/classes/pip_i=
nstall_wheel.bbclass<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/classes/setup=
tools_build_meta.bbclass<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devto=
ols/python/python-nose.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devto=
ols/python/python-subunit.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devto=
ols/python/<a href=3D"http://python3-flit-core_3.6.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-flit-core_3.6.0.bb</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devto=
ols/python/<a href=3D"http://python3-nose_1.3.7.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-nose_1.3.7.bb</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devto=
ols/python/<a href=3D"http://python3-scons-native_4.3.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-scons-native_4.3.0.bb</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devto=
ols/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devto=
ols/python/python3-strict-rfc3339/0001-setup.py-use-vendored-_distutils.pat=
ch<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devto=
ols/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-bra=
nch.patch<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devto=
ols/python/<a href=3D"http://python3-wheel_0.37.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-wheel_0.37.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 rename meta/recipes-support/bmap-tool=
s/{<a href=3D"http://bmap-tools_3.6.bb" rel=3D"noreferrer" target=3D"_blank=
">bmap-tools_3.6.bb</a> =3D&gt; <a href=3D"http://bmap-tools_git.bb" rel=3D=
"noreferrer" target=3D"_blank">bmap-tools_git.bb</a>} (86%)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; 2.30.2<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Links: You receive all messages sent to thi=
s group.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; View/Reply Online (#162076): <a href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/message/162076" rel=3D"nore=
ferrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-cor=
e/message/162076</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.o=
penembedded.org/mt/89304007/1997914" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/mt/89304007/1997914</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded=
-core%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core+o=
wner@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
</blockquote></div></div>

--00000000000049d8a805d8bc5374--

