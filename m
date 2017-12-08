Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5775F71ADD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:45:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:45:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1306905"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:45:41 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:12 -0800
Message-Id: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH v2 00/19] python improvements
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
X-List-Received-Date: Fri, 08 Dec 2017 22:45:40 -0000

This patchset combines Alejandro Hernandez' new python packaging as
well as adding Derek Straka's pypi.bbclass from meta-python.

The commits which delete the old manifests will fail git send-email, so
this series must be pulled from git.

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

This patch series adds runpy to the new json-style python-*-manifests, 
which allows you to run, for example "python -m pip" from the command
line. It also adds a couple dependencies that were silently breaking
python packages at runtime.

This series modifies all the recipes in recipes-devtools/python which
had a SRC_URI pointing to "pythonhosted" to use the pypi.bbclass. Where
it made sense, the "python-" and "python3-" specific files were simplified,
putting the common content into the .inc file.

Finally, this series upgrades python-scons and python*-setuptools to the
latest versions.

The following changes since commit 4469acdf1d0338220f3fe2ecb5e079eea6fda375:

  lib/oe/utils: remove param_bool() (2017-12-02 11:25:34 +0000)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib timo/pypi-v2

Alejandro Hernandez (5):
  python: Restructure python packaging and replace it with autopackaging
  python3: Restructure python3 packaging and replace it with
    autopackaging
  python3: fix RDEPENDS on several recipes, due to non-existent python3
    packages
  hwlatdetect: fix RDEPENDS to avoid QA failures
  python-scons: Remove python-importlib dependency

Tim Orling (14):
  pypi.bbclass: bring in from meta-python
  python2 create_manifest.py: fix trailing whitespace in json
  python*-manifest.json: add dependencies, runpy
  python*-setuptools: upgrade to 38.2.3; use pypi.bbclass; improvements
  python3-pip: use pypi.bbclass
  python-nose: use pypi.bbclass
  python-six: use pypi.bbclass
  python-async: use pypi.bbclass
  python-mako: use pypi.bbclass
  python-smmap: use pypi.bbclass
  python-gitdb: use pypi.bbclass
  python-git: use pypi.bbclass
  python3-iniparse: use pypi.bbclass
  python-scons: upgrade to 3.0.1; use pypi.bbclass

 meta/classes/pypi.bbclass                          |   26 +
 meta/conf/documentation.conf                       |    3 +
 meta/recipes-core/libxml/libxml2_2.9.7.bb          |    2 +-
 .../bootchart2/bootchart2_0.14.8.bb                |    2 +-
 meta/recipes-devtools/dnf/dnf_2.6.3.bb             |   26 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    4 +-
 .../opkg-utils/opkg-utils_0.3.5.bb                 |    2 +-
 .../python-numpy/python3-numpy_1.13.3.bb           |    2 -
 .../python/python-2.7-manifest.inc                 |  287 -----
 .../python/python-3.5-manifest.inc                 |  283 -----
 meta/recipes-devtools/python/python-async.inc      |    5 +-
 meta/recipes-devtools/python/python-git.inc        |   23 +-
 meta/recipes-devtools/python/python-gitdb.inc      |   16 +-
 meta/recipes-devtools/python/python-mako.inc       |   14 +-
 .../python/python-native-3.5-manifest.inc          |   10 -
 .../python/python-native_2.7.13.bb                 |   24 +-
 meta/recipes-devtools/python/python-nose.inc       |   18 +
 meta/recipes-devtools/python/python-nose_1.3.7.bb  |   25 +-
 ...ative_3.0.0.bb => python-scons-native_3.0.1.bb} |    0
 ...onscript-Support-python2-print-statements.patch |   38 -
 meta/recipes-devtools/python/python-scons_3.0.0.bb |   28 -
 meta/recipes-devtools/python/python-scons_3.0.1.bb |   18 +
 meta/recipes-devtools/python/python-setuptools.inc |   39 +-
 .../python/python-setuptools_36.5.0.bb             |   38 -
 .../python/python-setuptools_38.2.3.bb             |    9 +
 meta/recipes-devtools/python/python-six.inc        |    8 +-
 meta/recipes-devtools/python/python-smmap.inc      |    9 +-
 .../python/python/create_manifest2.py              |  277 +++++
 .../python/python/get_module_deps2.py              |  112 ++
 .../python/python/python2-manifest.json            | 1044 ++++++++++++++++++
 .../python/python/sitecustomize.py                 |    8 -
 .../recipes-devtools/python/python3-async_0.6.2.bb |    3 -
 meta/recipes-devtools/python/python3-git_2.1.7.bb  |    4 -
 .../recipes-devtools/python/python3-gitdb_0.6.4.bb |    4 -
 .../python/python3-iniparse_0.4.bb                 |   11 +-
 meta/recipes-devtools/python/python3-mako_1.0.7.bb |    9 -
 .../python/python3-native_3.5.3.bb                 |   30 +-
 meta/recipes-devtools/python/python3-nose_1.3.7.bb |   24 +-
 meta/recipes-devtools/python/python3-pip_9.0.1.bb  |   15 +-
 .../python/python3-pygobject_3.26.0.bb             |    2 +-
 .../python/python3-setuptools_36.5.0.bb            |   38 -
 .../python/python3-setuptools_38.2.3.bb            |    6 +
 meta/recipes-devtools/python/python3-six_1.11.0.bb |    4 +-
 .../recipes-devtools/python/python3-smmap_0.9.0.bb |    2 -
 .../python/python3/create_manifest3.py             |  321 ++++++
 .../python/python3/get_module_deps3.py             |  146 +++
 .../python/python3/python3-manifest.json           | 1130 ++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |   83 +-
 meta/recipes-devtools/python/python_2.7.13.bb      |   80 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb              |    2 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |    4 +-
 meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb        |    2 +-
 meta/recipes-rt/rt-tests/rt-tests_1.1.bb           |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py    |  421 --------
 scripts/contrib/python/generate-manifest-3.5.py    |  433 --------
 55 files changed, 3443 insertions(+), 1733 deletions(-)
 create mode 100644 meta/classes/pypi.bbclass
 delete mode 100644 meta/recipes-devtools/python/python-2.7-manifest.inc
 delete mode 100644 meta/recipes-devtools/python/python-3.5-manifest.inc
 delete mode 100644 meta/recipes-devtools/python/python-native-3.5-manifest.inc
 create mode 100644 meta/recipes-devtools/python/python-nose.inc
 rename meta/recipes-devtools/python/{python-scons-native_3.0.0.bb => python-scons-native_3.0.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch
 delete mode 100644 meta/recipes-devtools/python/python-scons_3.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python-scons_3.0.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-setuptools_36.5.0.bb
 create mode 100644 meta/recipes-devtools/python/python-setuptools_38.2.3.bb
 create mode 100644 meta/recipes-devtools/python/python/create_manifest2.py
 create mode 100644 meta/recipes-devtools/python/python/get_module_deps2.py
 create mode 100644 meta/recipes-devtools/python/python/python2-manifest.json
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-setuptools_38.2.3.bb
 create mode 100644 meta/recipes-devtools/python/python3/create_manifest3.py
 create mode 100644 meta/recipes-devtools/python/python3/get_module_deps3.py
 create mode 100644 meta/recipes-devtools/python/python3/python3-manifest.json
 delete mode 100755 scripts/contrib/python/generate-manifest-2.7.py
 delete mode 100755 scripts/contrib/python/generate-manifest-3.5.py

-- 
2.13.6


