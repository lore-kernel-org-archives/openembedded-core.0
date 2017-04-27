Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 20C6871C70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:23 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884549"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:27:59 +0300
Message-Id: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 00/13] Reduce (but not completely eliminate yet) Python 2.x dependencies
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:24 -0000

This patchset reduces the amount of Python 2.x dependencies in oe-core recipes.
Several approaches were taken:

1) If a recipe needs Python 2 only during build to run python scripts,
host python is used instead of natively build python.
2) If a recipe needs Python 2 at runtime because it packages some
python scripts, those scripts are changed to run under Python 3
whenever possible, or are removed if they are not useful in embedded context.
3) Some py2 library recipes are removed altogether, because nothing is
actually using them anymore.

There are still a few py2 holdouts:
- python-numpy (needed by a few recipes in meta-oe, shares code with python3-numpy)
- python-nose (dependency of python-numpy)
- python-scons (work to port it to py3 is ongoing now)
- python-setuptools (dependency of python-scons)
- bmap-tools
- ltp
- perf
- asciidoc

And a couple of packagegroups list python 2 as well:
- packagegroup-self-hosted
- packagegroup-core-lsb

Let's revisit the situation with the above in a year or so.

The following changes since commit c80cfab0828b653012e76eba86ed0d9084ff9d5b:

  rpm: properly relocate additional native tools (2017-04-25 14:05:30 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (13):
  asciidoc: drop distutils inherit, not actually required
  bmap-tools: switch to taking source from git
  mesa: remove the git recipe
  mesa: drop pythonnative inherit
  mklibs-native: remove native python dependency
  webkitgtk: remove native python dependency
  packagegroup-self-hosted: remove python-git dependency
  python-pycurl: remove the recipe
  python: remove unused 2.x versions of several packages
  opkg-utils: move to Python 3
  mc: do not package Python-based extfs helpers
  parted: move test helper scripts to Python 3
  kconfig-frontends: update to 4.10.0.1

 .../packagegroups/packagegroup-self-hosted.bb      |   2 -
 .../files/0001-Fix-installation-of-.pc-files.patch |  29 ++++++
 ...Switch-utils-kconfig-diff-to-use-Python-3.patch |  26 +++++
 ...s_3.12.0.0.bb => kconfig-frontends_4.10.0.1.bb} |   8 +-
 .../mklibs/mklibs-native_0.1.43.bb                 |   3 +-
 ...0001-Switch-all-scripts-to-use-Python-3.x.patch | 112 +++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |   5 +-
 meta/recipes-devtools/python/python-async_0.6.2.bb |   5 -
 meta/recipes-devtools/python/python-git_2.1.1.bb   |   7 --
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb |   7 --
 meta/recipes-devtools/python/python-mako_1.0.6.bb  |  17 ----
 .../python/python-pexpect_4.2.1.bb                 |  28 ------
 .../python/python-ptyprocess_0.5.1.bb              |  23 -----
 meta/recipes-devtools/python/python-pycurl.inc     |  31 ------
 .../python/python-pycurl/no-static-link.patch      |  17 ----
 .../python/python-pycurl_7.21.5.bb                 |   3 -
 meta/recipes-devtools/python/python-six_1.10.0.bb  |   4 -
 meta/recipes-devtools/python/python-smmap_0.9.0.bb |   5 -
 .../python/python3-pycurl_7.21.5.bb                |   5 -
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb   |   2 +-
 meta/recipes-extended/mc/mc_4.8.18.bb              |   9 +-
 .../packagegroup-core-full-cmdline.bb              |   1 -
 .../packagegroups/packagegroup-core-lsb.bb         |   1 -
 ...-helper-scripts-used-only-in-tests-to-Pyt.patch |  44 ++++++++
 meta/recipes-extended/parted/parted_3.2.bb         |   3 +-
 meta/recipes-graphics/mesa/mesa.inc                |   2 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |  22 ----
 meta/recipes-sato/webkit/webkitgtk_2.14.5.bb       |   7 +-
 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb  |   9 +-
 29 files changed, 233 insertions(+), 204 deletions(-)
 create mode 100644 meta/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
 create mode 100644 meta/recipes-devtools/kconfig-frontends/files/0001-Switch-utils-kconfig-diff-to-use-Python-3.patch
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.12.0.0.bb => kconfig-frontends_4.10.0.1.bb} (80%)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
 delete mode 100644 meta/recipes-devtools/python/python-async_0.6.2.bb
 delete mode 100644 meta/recipes-devtools/python/python-git_2.1.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-gitdb_0.6.4.bb
 delete mode 100644 meta/recipes-devtools/python/python-mako_1.0.6.bb
 delete mode 100644 meta/recipes-devtools/python/python-pexpect_4.2.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-pycurl.inc
 delete mode 100644 meta/recipes-devtools/python/python-pycurl/no-static-link.patch
 delete mode 100644 meta/recipes-devtools/python/python-pycurl_7.21.5.bb
 delete mode 100644 meta/recipes-devtools/python/python-six_1.10.0.bb
 delete mode 100644 meta/recipes-devtools/python/python-smmap_0.9.0.bb
 delete mode 100644 meta/recipes-devtools/python/python3-pycurl_7.21.5.bb
 create mode 100644 meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa_git.bb

-- 
2.11.0


