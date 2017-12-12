Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 78BDA787C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:04:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 21:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,394,1508828400"; d="scan'208";a="15240457"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2017 21:04:32 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 21:04:05 -0800
Message-Id: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH v3 00/14] python improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Dec 2017 05:04:31 -0000

We are not quite ready for the json manifest changes from v2, so
this series works with the original manifest generators.

The commit which deletes the old manifests will fail git send-email,
so this series must be pulled from git. This series DOES address this
issue by adding newlines in the generators so that the manifests do not
continue to break git send-mail workflow.

The pypi.bbclass added to meta-python by Derek Straka significantly
simplifies python module packaging and has utility outside of just
the meta-python layer. Most notably, it knows how to generate the
SRC_URI, S, UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX variables
given a PYPI_PACKAGE. For special cases where PYPI_PACKAGE is not
guessable from the BPN, the value can be set in your recipe. For
special cases where the upstream source is not bundled as a .tar.gz,
the PYPI_PACKAGE_EXT can be set in your recipe. Providing python2 and
python3 packaging is also simplified by putting most of the common
content into .inc files. Note that it is strongly recommend to use
PYTHON_PN to dynamically set "python-" vs. "python3-" prefix for your
DEPENDS and RDEPENDS needs. This often moves everything but the
"requires python-foo.inc" and "include setuptools*" lines in your
python recipes to the common .inc file. Much simpler maintenance.

This patch series adds runpy to the python-*-manifests, which allows
you to run, for example "python -m pip" from the command line. It
also adds a couple dependencies that were silently breaking python
packages at runtime.

This series modifies all the recipes in recipes-devtools/python which
had a SRC_URI pointing to "pythonhosted" to use the pypi.bbclass. Where
it made sense, the "python-" and "python3-" specific files were
simplified, putting the common content into the .inc file.

Finally, this series upgrades python-scons and python*-setuptools to the
latest versions.

The following changes since commit a24c10b7bdab8aa960fdd3a58d2009f24344e579:

  populate_sdk_ext: Use prebuilt uninative tarball (2017-12-11 21:46:33 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/pypi-v3
  http://cgit.openembedded.org//log/?h=timo/pypi-v3

Tim Orling (14):
  pypi.bbclass: bring in from meta-python
  python-*-manifest/generators: fix long line lengths
  python-*-manifest/generators: add runpy; python3-plistlib
  python-setuptools: upgrade to 38.2.4; use pypi.bbclass; improvements
  python3-pip: use pypi.bbclass
  python-nose: use pypi.bbclass
  python-six: use pypi.bbclass
  python-async: use pypi.bbclass
  python-mako: use pypi.bbclass
  python-smmap: use pypi.bbclass
  python-gitdb: use pypi.bbclass
  python-git: use pypi.bbclass
  python3-iniparse: use pypi.bbclass
  python-scons: upgrade to v3.0.1; use pypi.bbclass

 meta/classes/pypi.bbclass                          |  26 +
 .../python/python-2.7-manifest.inc                 | 699 +++++++++++++--
 .../python/python-3.5-manifest.inc                 | 990 +++++++++++++++++++--
 meta/recipes-devtools/python/python-async.inc      |   7 +-
 meta/recipes-devtools/python/python-git.inc        |  26 +-
 meta/recipes-devtools/python/python-gitdb.inc      |  15 +-
 meta/recipes-devtools/python/python-mako.inc       |  13 +-
 meta/recipes-devtools/python/python-nose.inc       |  18 +
 meta/recipes-devtools/python/python-nose_1.3.7.bb  |  25 +-
 ...ative_3.0.0.bb => python-scons-native_3.0.1.bb} |   0
 ...onscript-Support-python2-print-statements.patch |  38 -
 ...python-scons_3.0.0.bb => python-scons_3.0.1.bb} |  12 +-
 meta/recipes-devtools/python/python-setuptools.inc |  42 +-
 .../python/python-setuptools_36.5.0.bb             |  38 -
 .../python/python-setuptools_38.2.4.bb             |   9 +
 meta/recipes-devtools/python/python-six.inc        |   8 +-
 meta/recipes-devtools/python/python-smmap.inc      |  12 +-
 .../recipes-devtools/python/python3-async_0.6.2.bb |   6 +-
 meta/recipes-devtools/python/python3-git_2.1.7.bb  |   5 -
 .../recipes-devtools/python/python3-gitdb_0.6.4.bb |   7 +-
 .../python/python3-iniparse_0.4.bb                 |   9 +-
 meta/recipes-devtools/python/python3-mako_1.0.7.bb |  11 +-
 meta/recipes-devtools/python/python3-nose_1.3.7.bb |  24 +-
 meta/recipes-devtools/python/python3-pip_9.0.1.bb  |  13 +-
 .../python/python3-setuptools_36.5.0.bb            |  38 -
 .../python/python3-setuptools_38.2.4.bb            |   6 +
 meta/recipes-devtools/python/python3-six_1.11.0.bb |   2 -
 .../recipes-devtools/python/python3-smmap_0.9.0.bb |   5 +-
 scripts/contrib/python/generate-manifest-2.7.py    |  27 +-
 scripts/contrib/python/generate-manifest-3.5.py    |  31 +-
 30 files changed, 1743 insertions(+), 419 deletions(-)
 create mode 100644 meta/classes/pypi.bbclass
 create mode 100644 meta/recipes-devtools/python/python-nose.inc
 rename meta/recipes-devtools/python/{python-scons-native_3.0.0.bb => python-scons-native_3.0.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch
 rename meta/recipes-devtools/python/{python-scons_3.0.0.bb => python-scons_3.0.1.bb} (54%)
 delete mode 100644 meta/recipes-devtools/python/python-setuptools_36.5.0.bb
 create mode 100644 meta/recipes-devtools/python/python-setuptools_38.2.4.bb
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-setuptools_38.2.4.bb

-- 
2.14.3


