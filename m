Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6933C78423
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 18:14:51 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 10:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; d="scan'208";a="179341179"
Received: from wrath.jf.intel.com ([10.54.70.15])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 10:14:53 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 10:14:21 -0800
Message-Id: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH 00/13] Add pypi.bbclass; python improvements
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
X-List-Received-Date: Thu, 23 Nov 2017 18:14:52 -0000

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

This patch series adds runpy to the python-*-manifests (and generators),
which allows you to run, for example "python -m pip" from the command
line. It also adds a couple dependencies that were silently breaking
python packages at runtime.

This series modifies all the recipes in recipes-devtools/python which had
a SRC_URI pointing to "pythonhosted" to use the pypi.bbclass. Where it
made sense, the "python-" and "python3-" specific files were simplified,
putting the common content into the .inc file.

Finally, this series upgrades python-scons and python*-setuptools to the
latest versions.

The following changes since commit 33418ed064fe9cff5b4803f09135a81d9170c189:

  runqemu: Also specialcase resolution of '.' to the file's location (2017-11-21 17:58:36 +0000)

are available in the git repository at:

  git://push.openembedded.org/openembedded-core-contrib ttorling/pypi

Tim Orling (13):
  pypi.bbclass: bring in from meta-python
  python-*-manifest/generator: add runpy; python3-plistlib
  python-setuptools: upgrade to 36.8.0; use pypi.bbclass; improvements
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

 meta/classes/pypi.bbclass                          | 26 ++++++++++++++
 .../python/python-2.7-manifest.inc                 | 12 ++++---
 .../python/python-3.5-manifest.inc                 | 16 ++++++---
 meta/recipes-devtools/python/python-async.inc      |  7 ++--
 meta/recipes-devtools/python/python-git.inc        | 26 +++++++++++---
 meta/recipes-devtools/python/python-gitdb.inc      | 15 +++++---
 meta/recipes-devtools/python/python-mako.inc       | 13 ++++---
 meta/recipes-devtools/python/python-nose.inc       | 18 ++++++++++
 meta/recipes-devtools/python/python-nose_1.3.7.bb  | 25 +------------
 ...ative_3.0.0.bb => python-scons-native_3.0.1.bb} |  0
 ...onscript-Support-python2-print-statements.patch | 38 --------------------
 ...python-scons_3.0.0.bb => python-scons_3.0.1.bb} | 14 ++------
 meta/recipes-devtools/python/python-setuptools.inc | 42 ++++++++++++++++++----
 .../python/python-setuptools_36.5.0.bb             | 38 --------------------
 .../python/python-setuptools_36.8.0.bb             |  9 +++++
 meta/recipes-devtools/python/python-six.inc        |  8 ++---
 meta/recipes-devtools/python/python-smmap.inc      | 12 +++----
 .../recipes-devtools/python/python3-async_0.6.2.bb |  6 +---
 meta/recipes-devtools/python/python3-git_2.1.7.bb  |  5 ---
 .../recipes-devtools/python/python3-gitdb_0.6.4.bb |  7 +---
 .../python/python3-iniparse_0.4.bb                 |  9 ++---
 meta/recipes-devtools/python/python3-mako_1.0.7.bb | 11 +-----
 meta/recipes-devtools/python/python3-nose_1.3.7.bb | 24 +------------
 meta/recipes-devtools/python/python3-pip_9.0.1.bb  | 13 ++-----
 .../python/python3-setuptools_36.5.0.bb            | 38 --------------------
 .../python/python3-setuptools_36.8.0.bb            |  6 ++++
 meta/recipes-devtools/python/python3-six_1.11.0.bb |  2 --
 .../recipes-devtools/python/python3-smmap_0.9.0.bb |  5 +--
 scripts/contrib/python/generate-manifest-2.7.py    |  3 ++
 scripts/contrib/python/generate-manifest-3.5.py    |  7 ++++
 30 files changed, 193 insertions(+), 262 deletions(-)
 create mode 100644 meta/classes/pypi.bbclass
 create mode 100644 meta/recipes-devtools/python/python-nose.inc
 rename meta/recipes-devtools/python/{python-scons-native_3.0.0.bb => python-scons-native_3.0.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch
 rename meta/recipes-devtools/python/{python-scons_3.0.0.bb => python-scons_3.0.1.bb} (43%)
 delete mode 100644 meta/recipes-devtools/python/python-setuptools_36.5.0.bb
 create mode 100644 meta/recipes-devtools/python/python-setuptools_36.8.0.bb
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-setuptools_36.8.0.bb

-- 
2.13.6


