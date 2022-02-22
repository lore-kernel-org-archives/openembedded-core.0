Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65677C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:18:54 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.1888.1645557533182797972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W1Vo6C1d;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id fc19so1861158qvb.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E+HkvvyOBtkFu9QnMaIom//lNXZ759Tkvw8zjngaCpE=;
        b=W1Vo6C1d0/hBts+Nf7nSH9Zr2Pf+OOnqaJC9jC8htE6xEFrtqnprMD20E4vPfjMa4d
         ZSFhDmqYjQ3E0oYi4o5jagl9P/Ls18WVAoNYnQgy5otreeTmLc/EAlNcBcLJK+18+nCY
         3C8glAEUrTTTmFQMCdAZ1Rsz/bfZJLSlwbcidItByZ+Td/lfpk13dITHMUqqxnj/MtmW
         10+8ioGdxaNwa2TTZnc8k5OoctyJXndHgj2iez4XLA8XQk8MieIAMuMXNyNUC84lw900
         D6Tmk1yS8BUDStQJhSUDTXSe8ooKjq/8uP4VfBzkDZmXap2TvEpavfGp30x0CiKcPvhy
         Vt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E+HkvvyOBtkFu9QnMaIom//lNXZ759Tkvw8zjngaCpE=;
        b=fPnkwYlHW7C+NocBg2RHwYByKDTnR1Y71CGW1kBn3e0TyGJsD5g2QM3k8EUJy7fuju
         aYqS+yFWF9nv+lqXK6HtLyMcze4lBC0sD8JVcNcC2uTxnEGOoQQFytLUIu4qcjzwVuYY
         vxVhkFJUxNJ+RWXD0cDqIsc+jo/hjbIMo7/DgTjVakUbLmWTps20ZWc7mGNbHlUF7oVf
         TmS7NiTr5705wKZBiGxkqdUY/NkKOKCUcRaElj1dMVAqAY3J29iQmL98tj51OFqLnFLF
         D69DwjooCdQnK4ccSZrrppSHi4529Rh8/XiW5PAM3IzFJmDFdpXRtNeEEXx1z4wT/0bV
         Et9w==
X-Gm-Message-State: AOAM531AkjVwJIMBVYd2G4sgR7iUVx9PRjo8daQUSOAC5BY+VR+9r0D+
	gJJ9cb+13FvlTgqJ5XB5u+K7VqEHYDBaTWv29gQ=
X-Google-Smtp-Source: 
 ABdhPJwP6DzenDgTt+N5BG14szcvinT0mwQHFjSFYlBf/BckqNiI+6b0UHlC+1fxx5/iFtS3jcm4t57fNUJxdstxi5g=
X-Received: by 2002:ac8:7dd1:0:b0:2de:600:a5ab with SMTP id
 c17-20020ac87dd1000000b002de0600a5abmr12957834qte.532.1645557532140; Tue, 22
 Feb 2022 11:18:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <CAMKF1sobUZW4FbtdoGpk7yj8XZwNht4YqwHD=ohT_CmOmDry3Q@mail.gmail.com>
 <CANx9H-Bx_AFnAnCjJSoMqS59pGR3dH5vuYN0fvLPdz+CBy=z7A@mail.gmail.com>
 <CAMKF1sqNCMhH9_OoVzewjvd1SOHsF+5z3WFBmp51itSsh-eEzA@mail.gmail.com>
 <CANx9H-D-4RZgg4y=B+2QwyCghiwT0uEDHyquxMz6aaVw-cBa0g@mail.gmail.com>
In-Reply-To: 
 <CANx9H-D-4RZgg4y=B+2QwyCghiwT0uEDHyquxMz6aaVw-cBa0g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Feb 2022 11:18:25 -0800
Message-ID: 
 <CAMKF1so1W0nAKdpxUwxUS=AMH4joLkaisqLsGHt=X6TOqtxvWA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:18:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162224

On Tue, Feb 22, 2022 at 10:40 AM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Tue, Feb 22, 2022 at 10:24 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Feb 22, 2022 at 10:21 AM Tim Orling <ticotimo@gmail.com> wrote:
>> >
>> >
>> >
>> > On Tue, Feb 22, 2022 at 9:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> this is going into dep loops Try
>> >>
>> >> bitbake python3-wheel-native
>> >
>> >
>> > It shouldn=E2=80=99t
>> > https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/p=
ython/python3-wheel_0.37.1.bb?h=3Dtimo/bootstrap-wheels
>> >
>>
>> I have been trying whats on master-next
>>
>
> I can't reproduce. Can you point me at an error log please?
> It might have something to do with sstate cache, but that's just a hunch.
>

This is because python3-wheel was moved to core and modified but not
deleted from meta-python at same time. I have sent a patch for that

>>
>> > DEPENDS:remove:class-native =3D "python3-pip-native"
>> >
>> > do_install:class-native () {
>> >     # We need to bootstrap python3-wheel-native
>> >     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>> >     PYPA_WHEEL=3D"${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
>> >     unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
>> >     bbfatal_log "Failed to install"
>> > }
>> >>
>> >>
>> >>
>> >>
>> >> On Mon, Feb 21, 2022 at 1:23 PM Tim Orling <ticotimo@gmail.com> wrote=
:
>> >> >
>> >> > Upstream Python is moving to pyproject.toml rather than setup.py an=
d
>> >> > wheels rather than eggs. The main place this is documented is in
>> >> > PEP-517[1]. Installing packages with setup.py install is deprecated=
.
>> >> >
>> >> > We have a choice with the 'kirkstone' LTS release of introducing th=
is
>> >> > series (and fixing any fall out during the stabilization period) or
>> >> > living with deprecated Python packaging for the duration of the LTS=
 (at
>> >> > a minimum 2 years). This seems to be a compelling enough reason to =
bring
>> >> > in this series, even if it results in a slight slip of the 'feature
>> >> > freeze', which is officially tomorrow, Monday 21 Feb, 2022.
>> >> >
>> >> > This series bootstraps python3-setuptools-native,
>> >> > python3-flit-core-native, python3-wheel-native and python3-pip-nati=
ve,
>> >> > simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This allow=
s all
>> >> > other recipes to be installed with pip, as intended by upstream.
>> >> >
>> >> > Three new classes are introduced:
>> >> > (1) flit_core which builds PEP-517 compliant packages which use
>> >> >     flit_core.buildapi as their build-backend.
>> >> > (2) setuptools_build_meta which builds PEP-517 compliant packages w=
hich use
>> >> >     setuptools_build_meta  as their build-backend.
>> >> > (3) pip_install_wheel, which simply installs wheels built by other
>> >> >     classes.
>> >> >
>> >> > The original setuptools3.bbclass do_compile is modified to
>> >> > 'setup.py bdist_wheel' (from python3-wheel-native) rather than the =
deprecated
>> >> > 'setup.py build' mechanism.
>> >> >
>> >> > The original setuptools3.bbclass do_install is modified to
>> >> > use the pip_install_wheel.bbclass to install wheels with pip rather=
 than
>> >> > the deprecated 'setup.py install' mechanism.
>> >> >
>> >> > For pip install, we disable dependency checking (--no-deps) because=
 it
>> >> > proves to be brittle in our environment without providing full whee=
l
>> >> > cache that seems like overhead that we do not need. We also disable
>> >> > fetching wheels from pypi (--no-index). This is no different than o=
ur
>> >> > normal workflow of requiring dependencies to be defined in a recipe=
.
>> >> >
>> >> > Missing from this series is documentation of the new features, clas=
ses
>> >> > and variables (this will be done under separate cover).
>> >> >
>> >> > Also desired and previously discussed in YP meetings is a helper
>> >> > function to warn that a recipe which currently inherits setuptools3
>> >> > but has a pyproject.toml and defines a build-system.build-backend s=
hould
>> >> > instead use of the new PEP-517 classes. This function is still in p=
rogress.
>> >> >
>> >> > During testing, recipes which use python3-setuptools-scm are failin=
g to
>> >> > determine the version of the python package, For several recipes, t=
he fix
>> >> > was to use pyproject.toml and PEP-517 build backends. To be sure, o=
ther recipes
>> >> > are still going to fail for the short term, until the root cause ca=
n be
>> >> > determined. This was not seen again in v2 builds.
>> >> >
>> >> > Another PEP-517 build-backend, poetry.core.masonry.api has been
>> >> > identified in recipes in meta-python, but not in oe-core. The
>> >> > python3-poetry-core recipe is WIP, but brings in a number of
>> >> > dependencies that are perhaps not worth it to bring into oe-core at=
 this
>> >> > time. Rather we can support these recipes in meta-python?
>> >> >
>> >> > Fixes in v2 include passing --root=3D${D} to pip install (rather th=
an --target)
>> >> > and also passing --prefix so that scripts are (usually) installed i=
n the proper
>> >> > location. pip install also 'helpfully' overwrites python3 inteprete=
r with nativepython3
>> >> > in #!, so add a fix to return the values to what is actually correc=
t (similar to what is
>> >> > done in setuptools3.bbclass). Also several recipes still needed PIP=
_INSTALL_PACKAGE defined.
>> >> >
>> >> > Also added self as maintainer of new recipes.
>> >> >
>> >> > [YOCTO #14638]
>> >> >
>> >> > [1] https://www.python.org/dev/peps/pep-0517/
>> >> >
>> >> > The following changes since commit 41ae26ecab731f2fb6593df143476c94=
183be209:
>> >> >
>> >> >   releases: update to include 3.4.2 (2022-02-21 16:46:22 +0000)
>> >> >
>> >> > are available in the Git repository at:
>> >> >
>> >> >   git://git.yoctoproject.org/git/poky-contrib timo/bootstrap-wheels
>> >> >   http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3Dti=
mo/bootstrap-wheels
>> >> >
>> >> > Tim Orling (32):
>> >> >   python3-wheel: move 0.37.0 from meta-python
>> >> >   python3-flit-core: add recipe for 3.6.0
>> >> >   flit_core.bbclass: add helper for newer python packaging
>> >> >   python3-wheel: inherit flit_core
>> >> >   pip_install_wheel.bbclass: add helper class
>> >> >   setuptools_build_meta.bbclass: add helper class
>> >> >   python3-pip: inherit setuptools_build_meta
>> >> >   python3-attrs: inherit setuptools_build_meta
>> >> >   python3-git: inherit setuptools_build_meta
>> >> >   python3-pytest: inherit setuptools_build_meta
>> >> >   python3-setuptools-scm: inherit setuptools_build_meta
>> >> >   python3-zipp: inherit setuptools_build_meta
>> >> >   python3-iniconfig: inherit setuptools_build_meta
>> >> >   python3-py: inherit setuptools_build_meta
>> >> >   python3-pluggy: inherit setuptools_build_meta
>> >> >   python3-setuptools: inherit setuptools_base_meta
>> >> >   setuptools3.bbclass: refactor for wheels
>> >> >   python3-more-itertools: set PIP_INSTALL_PACKAGE
>> >> >   meson: inherit setuptools_build_meta
>> >> >   python3-libarchive-d: set PIP_INSTALL_PACKAGE
>> >> >   python3-smartypants: patch hash bang to python3
>> >> >   python3-scons: merge -native recipe
>> >> >   python3-subunit: merge inc; set PIP_INSTALL_PACKAGE
>> >> >   python3-magic: set PIP_INSTALL_PACKAGE
>> >> >   bmap-tools: set PIP_INSTALL_PACKAGE, BASEVER
>> >> >   asciidoc: set PIP_INSTALL_PACKAGE
>> >> >   gi-docgen: set PIP_INSTALL_PACKAGE
>> >> >   numpy: set PIP_INSTALL_PACKAGE
>> >> >   python3-dbusmock: set PIP_INSTALL_PACKAGE
>> >> >   python3-mako: inherit setuptools_build_meta
>> >> >   python3-packaging: inherit setuptools_build_meta
>> >> >   python3-nose: drop recipe
>> >> >
>> >> >  meta/classes/flit_core.bbclass                |  16 +++
>> >> >  meta/classes/pip_install_wheel.bbclass        |  37 +++++++
>> >> >  meta/classes/setuptools3.bbclass              |  20 ++--
>> >> >  meta/classes/setuptools_build_meta.bbclass    |  18 ++++
>> >> >  meta/conf/distro/include/maintainers.inc      |   3 +-
>> >> >  meta/recipes-devtools/meson/meson_0.61.2.bb   |   4 +-
>> >> >  meta/recipes-devtools/python/python-nose.inc  |  18 ----
>> >> >  .../python/python-subunit.inc                 |  14 ---
>> >> >  .../python/python3-attrs_21.4.0.bb            |   2 +-
>> >> >  .../python/python3-dbusmock_0.25.0.bb         |   1 +
>> >> >  .../python/python3-flit-core_3.6.0.bb         |  41 +++++++
>> >> >  .../python/python3-git_3.1.26.bb              |   2 +-
>> >> >  .../python/python3-iniconfig_1.1.1.bb         |   4 +-
>> >> >  .../python/python3-libarchive-c_4.0.bb        |   2 +
>> >> >  .../python/python3-magic_0.4.25.bb            |   1 +
>> >> >  .../python/python3-mako_1.1.6.bb              |   2 +-
>> >> >  .../python/python3-more-itertools_8.12.0.bb   |   2 +
>> >> >  .../python/python3-nose_1.3.7.bb              |   2 -
>> >> >  .../python/python3-numpy_1.22.2.bb            |   1 +
>> >> >  .../python/python3-packaging_21.3.bb          |   2 +-
>> >> >  .../python/python3-pip_22.0.3.bb              |  19 +++-
>> >> >  .../python/python3-pluggy_1.0.0.bb            |   2 +-
>> >> >  .../python/python3-py_1.11.0.bb               |   2 +-
>> >> >  .../python/python3-pytest_7.0.1.bb            |   4 +-
>> >> >  .../python/python3-scons-native_4.3.0.bb      |   7 --
>> >> >  .../python/python3-scons_4.3.0.bb             |  13 ++-
>> >> >  .../python/python3-setuptools-scm_6.4.2.bb    |   2 +-
>> >> >  .../python/python3-setuptools_59.5.0.bb       |  19 +++-
>> >> >  .../0001-Change-hash-bang-to-python3.patch    |  47 ++++++++
>> >> >  .../python/python3-smartypants_2.0.0.bb       |   1 +
>> >> >  ...001-setup.py-use-vendored-_distutils.patch |  27 +++++
>> >> >  .../python/python3-strict-rfc3339_0.7.bb      |   4 +-
>> >> >  .../python/python3-subunit_1.4.0.bb           |  17 ++-
>> >> >  ...roject.toml-from-flit-backend-branch.patch | 100 ++++++++++++++=
++++
>> >> >  .../python/python3-wheel_0.37.1.bb            |  24 +++++
>> >> >  .../python/python3-zipp_3.7.0.bb              |   2 +-
>> >> >  .../asciidoc/asciidoc_10.1.1.bb               |   1 +
>> >> >  meta/recipes-gnome/gi-docgen/gi-docgen_git.bb |   1 +
>> >> >  .../{bmap-tools_3.6.bb =3D> bmap-tools_git.bb}  |   6 +-
>> >> >  39 files changed, 412 insertions(+), 78 deletions(-)
>> >> >  create mode 100644 meta/classes/flit_core.bbclass
>> >> >  create mode 100644 meta/classes/pip_install_wheel.bbclass
>> >> >  create mode 100644 meta/classes/setuptools_build_meta.bbclass
>> >> >  delete mode 100644 meta/recipes-devtools/python/python-nose.inc
>> >> >  delete mode 100644 meta/recipes-devtools/python/python-subunit.inc
>> >> >  create mode 100644 meta/recipes-devtools/python/python3-flit-core_=
3.6.0.bb
>> >> >  delete mode 100644 meta/recipes-devtools/python/python3-nose_1.3.7=
.bb
>> >> >  delete mode 100644 meta/recipes-devtools/python/python3-scons-nati=
ve_4.3.0.bb
>> >> >  create mode 100644 meta/recipes-devtools/python/python3-smartypant=
s/0001-Change-hash-bang-to-python3.patch
>> >> >  create mode 100644 meta/recipes-devtools/python/python3-strict-rfc=
3339/0001-setup.py-use-vendored-_distutils.patch
>> >> >  create mode 100644 meta/recipes-devtools/python/python3-wheel/0001=
-Backport-pyproject.toml-from-flit-backend-branch.patch
>> >> >  create mode 100644 meta/recipes-devtools/python/python3-wheel_0.37=
.1.bb
>> >> >  rename meta/recipes-support/bmap-tools/{bmap-tools_3.6.bb =3D> bma=
p-tools_git.bb} (86%)
>> >> >
>> >> > --
>> >> > 2.30.2
>> >> >
>> >> >
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#162076): https://lists.openembedded.org/g/opene=
mbedded-core/message/162076
>> >> > Mute This Topic: https://lists.openembedded.org/mt/89304007/1997914
>> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [raj.khem@gmail.com]
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >

