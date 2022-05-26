Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8BEC4167E
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:10:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.22546.1653585008111865843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 10:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23594150C;
	Thu, 26 May 2022 10:10:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD1A03F66F;
	Thu, 26 May 2022 10:10:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH 00/10] Change Python package building to use picobuild
Date: Thu, 26 May 2022 18:09:51 +0100
Message-Id: <20220526171001.4074388-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 17:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166187

Hi,

Currently we build modern Python packages by calling the PEP-517 API dire=
ctly
(see python_pep517.bbclass, do_compile()). This mostly works, but sometim=
es
doesn't. For example we don't verify build dependencies, which led to the=
 cbor2
ugprade silently failing to actually package anything. We should use a pr=
oper
build frontend which actually validates dependencies and does builds in t=
he
correct manner.

The standard frontend is pypa/build, but for source-based distributions
that can be annoying to build as it depends on the following packages:

- tomli
- pep517
- packaging
- pyparsing

Manually bootstrapping those recipes is possible, but tedious.

Picobuild is another frontend (written by myself) which is designed
explicitly to be used programatically by source-based distributions: it
doesn't support builds inside virtual environments as we're building
distribution packages, and it vendors the dependencies for bootstrapping
if they're not available.

Over time more packages are expected to move to using Flit to build which=
 makes
the bootstrapping process slightly easier, and tomli will be integrated i=
nto
Python 3.11, so it's possible that in the future we drop picobuild and sw=
itch to
build.  But for now, this works better than calling the API directly, and=
 can be
fairly simply swapped out in the future if needed.

The impact is pretty minimal: the PEP517_BUILD_API variable is obsolete s=
o can
be removed everywhere, and some recipes now fail because they have missin=
g build
dependencies.  I've already fixed up the bulk of meta-oe in
meta-oe-contrib:ross/picobuild.  Most recipes don't need changes and just=
 build
a little better now.

This works for me but could do with further testing, but this is primaril=
y a RFC
because I'm about to leave on holiday for a week and then have a conferen=
ce, so
I don't recommend merging this straight away!

Cheers,
Ross


Ross Burton (10):
  python3-pluggy: add BBCLASSEXTEND for native/nativesdk
  setuptools3: clean up class
  python3-flit-core: bootstrap explicitly
  python3-installer: bootstrap by installing installer with installer
  python3-pep517: add new recipe
  python3-setuptools-scm: DEPEND on python3-packaging
  python3-picobuild: add new recipe
  python_pep517: use picobuild instead of manually calling the API
  classes: remove obsolete PEP517_BUILD_API
  documentation: remove obsolete PEP517_BUILD_API

 documentation/ref-manual/classes.rst          |  4 +--
 documentation/ref-manual/variables.rst        |  5 ----
 meta/classes/python_flit_core.bbclass         |  5 +++-
 meta/classes/python_pep517.bbclass            |  8 ++----
 meta/classes/python_poetry_core.bbclass       |  2 --
 .../python_setuptools_build_meta.bbclass      |  2 --
 meta/classes/setuptools3.bbclass              |  5 ++--
 .../python/python3-flit-core_3.7.1.bb         |  6 ++++-
 .../python/python3-installer_0.5.1.bb         | 14 +++++++---
 .../python/python3-pep517_0.12.0.bb           | 10 +++++++
 .../python/python3-picobuild_0.1.bb           | 27 +++++++++++++++++++
 .../python/python3-pluggy_1.0.0.bb            |  2 ++
 .../python/python3-setuptools-scm_6.4.2.bb    |  2 +-
 13 files changed, 64 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pep517_0.12.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-picobuild_0.1.bb

--=20
2.25.1


