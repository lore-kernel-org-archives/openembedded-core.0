Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E961F77337
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 01:45:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1Q1j5rj010959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Feb 2016 17:45:05 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 17:45:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <alejandro.hernandez@linux.intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 25 Feb 2016 20:44:53 -0500
Message-ID: <cover.1456449257.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/15] fix python buildpaths QA issue
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
X-List-Received-Date: Fri, 26 Feb 2016 01:45:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

- Patch 01-06 has be sent in previous pull request.

- add buildpaths QA ignore pattern, and ignore Makefile by default

- fix .pyc/.pyo buildpath QA issue

- fix python related buildpath QA issue

Test Steps:

vim local.conf
...
MACHINE ?= "qemux86-64"
WARN_QA += "buildpaths"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "core2-32"
...

bitbake -k world

In oe-core, these patches fixed 40+ recipes' buildpath QA issue,
and fixed all python related buildpath QA issue.

There are still 55 recipes left that has buildpath QA issue.

//Hongxu

The following changes since commit 23056103c949b498c23b47579e8dd57ce78e6ed9:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (15):
  depmodwrapper-cross: nopackages to avoid QA [buildpaths] issue
  gcc: use relative path for configure script
  bison/gettext: add --with-bisonlocaledir to assign BISON_LOCALEDIR
  openssl: substitute buildpath in source code
  btrfs-tools: fix symlink creation multiple times
  git: fix installed-vs-shipped QA Issue
  insane:add buildpaths QA ignore pattern
  python2/3: fix buildpath QA issue
  bbclass distutils/distutils3: fix .pyc/.pyo buildpath
  python-setuptools/python3-setuptools: use old-style install
  python3-pip: use old-style install
  bbclass distutils/distutils3/setuptools/setuptools3: clean up
    DISTUTILS_INSTALL_ARGS
  python-pygobject: fix buildpath QA issue
  python-numpy: fix buildpaths QA issue
  python-pycairo: fix buildpath QA issue

 meta/classes/distutils.bbclass                     |  8 +--
 meta/classes/distutils3.bbclass                    |  8 +--
 meta/classes/insane.bbclass                        | 13 +++++
 meta/classes/setuptools.bbclass                    |  5 --
 meta/classes/setuptools3.bbclass                   |  5 --
 meta/recipes-connectivity/openssl/openssl.inc      |  2 +-
 .../substitute-buildpath-in-source-code.patch      | 41 ++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2f.bb |  1 +
 .../gettext-0.19.6/add-with-bisonlocaledir.patch   | 58 ++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.6.bb        |  4 ++
 .../bison/bison/add-with-bisonlocaledir.patch      | 58 ++++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb         |  1 +
 .../fix-symlink-creation-multiple-times.patch      | 46 ++++++++++++++++
 .../btrfs-tools/btrfs-tools_4.4.bb                 |  1 +
 meta/recipes-devtools/gcc/gcc-runtime.inc          |  3 +-
 meta/recipes-devtools/gcc/gcc-sanitizers.inc       |  3 +-
 meta/recipes-devtools/gcc/libgcc-common.inc        |  3 +-
 meta/recipes-devtools/gcc/libgfortran.inc          |  3 +-
 meta/recipes-devtools/git/git.inc                  |  2 +
 .../remove-build-path-in-comments.patch            | 30 +++++++++++
 .../recipes-devtools/python/python-numpy_1.10.4.bb |  1 +
 ...trip-off-build-path-in-purported-filename.patch | 62 ++++++++++++++++++++++
 .../python/python-pycairo_1.10.0.bb                | 22 ++++----
 .../python/python-pygobject_2.28.3.bb              |  5 ++
 .../python/python-setuptools_19.4.bb               |  2 -
 .../use-relative-path-to-compile-source-file.patch | 31 +++++++++++
 meta/recipes-devtools/python/python3-pip_8.0.0.bb  | 12 -----
 .../python/python3-setuptools_19.4.bb              |  8 +--
 .../use-relative-path-to-compile-source-file.patch | 31 +++++++++++
 meta/recipes-devtools/python/python3_3.5.1.bb      | 10 +++-
 meta/recipes-devtools/python/python_2.7.11.bb      |  8 +++
 .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |  2 +
 32 files changed, 438 insertions(+), 51 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/substitute-buildpath-in-source-code.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.6/add-with-bisonlocaledir.patch
 create mode 100644 meta/recipes-devtools/bison/bison/add-with-bisonlocaledir.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch
 create mode 100644 meta/recipes-devtools/python/python-numpy/remove-build-path-in-comments.patch
 create mode 100644 meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch
 create mode 100644 meta/recipes-devtools/python/python/use-relative-path-to-compile-source-file.patch
 create mode 100644 meta/recipes-devtools/python/python3/use-relative-path-to-compile-source-file.patch

-- 
1.9.1


