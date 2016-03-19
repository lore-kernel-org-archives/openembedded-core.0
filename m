Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2FBC160745
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 14:56:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2JEufhg003223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 19 Mar 2016 07:56:41 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 19 Mar 2016 07:56:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>
Date: Sat, 19 Mar 2016 10:56:34 -0400
Message-ID: <cover.1458397812.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458282563.git.hongxu.jia@windriver.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V4 00/18] fix buildpaths QA issue
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
X-List-Received-Date: Sat, 19 Mar 2016 14:56:45 -0000
Content-Type: text/plain

(Only send updated patches)

Changed in V4:

- gconf: disable debug mode to fix build paths

- Improve variable PACKAGE_BUILDPATH_TEXT_FILES to supports
  package override while files exist in conditionally generated package.
  (such as ${PN}-ptest is conditionally generated)

The following changes since commit 8debfea81e69d038bd2d56314b272cb74f5582ed:

  local.conf.sample: Disable prelink by default (2016-03-13 22:09:05 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (18):
  gcc-5.3/gcc-4.9:replace build path with target path in __FILE__
  gcc-5.3/gcc-4.9:Reuse -fdebug-prefix-map to replace -ffile-prefix-map
  kernel.bbclass: fix buildpath QA issue
  valgrind: fix buildpath QA issue
  dtc.inc: fix buildpaths QA issue
  fix_buildpaths.bbclass: add bbclass to fix build path
  icu: fix buildpaths QA issue
  tcl: fix buildpath QA issue
  python2/3: fix buildpath QA issue
  bbclass distutils/distutils3: fix .pyc/.pyo buildpath
  bbclass distutils/distutils3/setuptools/setuptools3: clean up
    DISTUTILS_INSTALL_ARGS
  python-setuptools/python3-setuptools: use old-style install
  python3-pip: use old-style install
  waf.bbclass: support do patch on extracted files
  python-pycairo: fix buildpath QA issue
  openssl: fix buildpath QA issue
  epiphany: fix buildpaths QA issue
  gconf: fix buildpaths QA issue

 meta/classes/distutils.bbclass                     |   8 +-
 meta/classes/distutils3.bbclass                    |   8 +-
 meta/classes/fix_buildpaths.bbclass                |  56 ++++
 meta/classes/kernel.bbclass                        |   4 +-
 meta/classes/setuptools.bbclass                    |   5 -
 meta/classes/setuptools3.bbclass                   |   5 -
 meta/classes/waf.bbclass                           |  11 +-
 .../openssl/remove-build-path-in-source-code.patch |  44 ++++
 .../recipes-connectivity/openssl/openssl_1.0.2g.bb |   7 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   2 +
 .../gcc-4.9/0072-support-ffile-prefix-map.patch    | 284 +++++++++++++++++++++
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |  43 ++++
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   2 +
 .../gcc-5.3/0054-support-ffile-prefix-map.patch    | 284 +++++++++++++++++++++
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |  43 ++++
 ...trip-off-build-path-in-purported-filename.patch |  62 +++++
 .../python/python-pycairo_1.10.0.bb                |  25 +-
 .../python/python-setuptools_19.4.bb               |   2 -
 meta/recipes-devtools/python/python3-pip_8.0.0.bb  |  12 -
 .../python/python3-setuptools_19.4.bb              |   8 +-
 meta/recipes-devtools/python/python3_3.5.1.bb      |  20 +-
 meta/recipes-devtools/python/python_2.7.11.bb      |  29 ++-
 meta/recipes-devtools/tcltk/tcl_8.6.4.bb           |  13 +-
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |   5 +-
 meta/recipes-gnome/epiphany/epiphany_3.18.4.bb     |   8 +-
 .../files/use-relative-path-for-build-dir.patch    |  57 +++++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |   1 +
 meta/recipes-kernel/dtc/dtc.inc                    |   3 +
 .../dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch       |  30 +++
 .../icu/icu/add-variable-U_CC-and-U_CXX.patch      |  61 +++++
 meta/recipes-support/icu/icu_56.1.bb               |  12 +
 31 files changed, 1081 insertions(+), 73 deletions(-)
 create mode 100644 meta/classes/fix_buildpaths.bbclass
 create mode 100644 meta/recipes-connectivity/openssl/openssl/remove-build-path-in-source-code.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0072-support-ffile-prefix-map.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0054-support-ffile-prefix-map.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
 create mode 100644 meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/use-relative-path-for-build-dir.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
 create mode 100644 meta/recipes-support/icu/icu/add-variable-U_CC-and-U_CXX.patch

-- 
1.9.1


