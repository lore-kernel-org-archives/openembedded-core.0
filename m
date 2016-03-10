Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2627A60124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:23:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A7NPWn014496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 23:23:25 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:23:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:05 -0500
Message-ID: <cover.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 00/18] fix buildpaths QA issue
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
X-List-Received-Date: Thu, 10 Mar 2016 07:23:27 -0000
Content-Type: text/plain

Changed in V2:
- As Ross suggested, improve waf.bbclass and use it for python-pycairo,
  and use ${bindir}/python rather than \`which python\` for python-pygobject.

- As Richard suggested, drop 'buildpaths QA ignore pattern', always try
  to fix them rather than ignore them.

- For openssl fix, remove build path rather than use TOPDIR to replace.

- Add new build path fixes

//Hongxu


Introduce buildpaths QA issue

1. Exist in ELF files DWARF (debugging information)
   gcc compiled with '-g' option.

   Solutions:
   Add option '-fdebug-prefix-map' to translate build path to target path.
   Make sure use option ${DEBUG_FLAGS} to compile

2. Exist in ELF files section .rodata (Read-only data)
   '__FILE__' is used in C/C++ source/header files.

   1) If '__FILE__' exists in source file, use relative path to compile.
      gcc /absolute_dir/test.c -o test --> gcc ../relative_dir/test.c -o test

      Solutions:
      - Use relative path to run configure.

      - Improve python distutils module to use relative path to compile
        C/C++ source file

      - Improve cmake-native which generate Makefile to use relative path
        to compile C/C++ source file

   2) TODO: If '__FILE__' exists in header file. No way?(Need to improve gcc?)

   3) If $CFLAGS, $CC which has build paths exists in source file, fix them
      before compiling

3. Exist in ANSII Text files (Makefile/Configure)
   Solution:
   - Process the text files to translate build path to target path

   - Directly remove build path without side effect.
     Such as removing --sysroot and -fdebug-prefix-map in Makefile is no harm.

4. Exist in python compiled file (Python bytecode, .pyc/.pyo)
   Invoke python with absolute dir.
   python -m py_compile  /absolute_dir/test.py

   Solution:
   - Improve distutils, get the "--root" directory supplied to the "install"
     command, and use it as a prefix to strip off the purported filename
     encoded in bytecode files.

   - Manually update specific bytecode file by invoking py_compile module.
     py_compile.compile(file, cfile=None, dfile=None, doraise=False), use
     target path for 'dfile'

Apply these patches and build a world, there are still 56 recipes in oe-core
that has buildpaths QA issue. And most of them could be fixed by above solutions.

//Hongxu

The following changes since commit d53413d3a8444c38a83ea37867c8af7754d8e702:

  bitbake: server/process: Try connecting 4 times before giving up (2016-03-09 22:47:29 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (18):
  fix_buildpaths.bbclass: add bbclass to fix build path
  python2/3: fix buildpath QA issue
  bbclass distutils/distutils3: fix .pyc/.pyo buildpath
  bbclass distutils/distutils3/setuptools/setuptools3: clean up
    DISTUTILS_INSTALL_ARGS
  python-setuptools/python3-setuptools: use old-style install
  python3-pip: use old-style install
  python-pygobject: fix buildpath QA issue
  python-numpy: fix buildpaths QA issue
  waf.bbclass: support do patch on extracted files
  python-pycairo: fix buildpath QA issue
  valgrind: fix buildpath QA issue
  dtc.inc: fix buildpaths QA issue
  epiphany: fix buildpaths QA issue
  gconf: fix buildpaths QA issue
  icu: fix buildpaths QA issue
  tcl: fix buildpath QA issue
  openssl: fix buildpath QA issue
  cmake-native:convert source file to relative path

 meta/classes/distutils.bbclass                     |   8 +-
 meta/classes/distutils3.bbclass                    |   8 +-
 meta/classes/fix_buildpaths.bbclass                |  44 +++++++
 meta/classes/setuptools.bbclass                    |   5 -
 meta/classes/setuptools3.bbclass                   |   5 -
 meta/classes/waf.bbclass                           |  11 +-
 .../openssl/remove-build-path-in-source-code.patch |  44 +++++++
 .../recipes-connectivity/openssl/openssl_1.0.2g.bb |   7 ++
 meta/recipes-devtools/cmake/cmake-native_3.4.3.bb  |   1 +
 .../convert-source-file-to-relative-path.patch     | 128 +++++++++++++++++++++
 .../remove-build-path-in-comments.patch            |  30 +++++
 .../recipes-devtools/python/python-numpy_1.10.4.bb |   1 +
 ...trip-off-build-path-in-purported-filename.patch |  62 ++++++++++
 .../python/python-pycairo_1.10.0.bb                |  25 +---
 .../python/python-pygobject_2.28.3.bb              |   5 +
 .../python/python-setuptools_19.4.bb               |   2 -
 .../use-relative-path-to-compile-source-file.patch |  31 +++++
 meta/recipes-devtools/python/python3-pip_8.0.0.bb  |  12 --
 .../python/python3-setuptools_19.4.bb              |   8 +-
 .../use-relative-path-to-compile-source-file.patch |  31 +++++
 meta/recipes-devtools/python/python3_3.5.1.bb      |  21 +++-
 meta/recipes-devtools/python/python_2.7.11.bb      |  28 ++++-
 .../tcltk/tcl/use-relative-path-to-compile.patch   |  52 +++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.4.bb           |  10 +-
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |   5 +-
 meta/recipes-gnome/epiphany/epiphany_3.18.4.bb     |   8 +-
 .../files/use-relative-path-for-build-dir.patch    |  57 +++++++++
 meta/recipes-gnome/gnome/gconf/gconf.path          |   6 +
 .../gnome/gconf/use-target-path-for-debug.patch    |  31 +++++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |  12 ++
 meta/recipes-kernel/dtc/dtc.inc                    |   3 +-
 .../dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch       |  30 +++++
 .../icu/icu/add-variable-U_CC-and-U_CXX.patch      |  61 ++++++++++
 meta/recipes-support/icu/icu_56.1.bb               |  12 ++
 34 files changed, 732 insertions(+), 72 deletions(-)
 create mode 100644 meta/classes/fix_buildpaths.bbclass
 create mode 100644 meta/recipes-connectivity/openssl/openssl/remove-build-path-in-source-code.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-path.patch
 create mode 100644 meta/recipes-devtools/python/python-numpy/remove-build-path-in-comments.patch
 create mode 100644 meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch
 create mode 100644 meta/recipes-devtools/python/python/use-relative-path-to-compile-source-file.patch
 create mode 100644 meta/recipes-devtools/python/python3/use-relative-path-to-compile-source-file.patch
 create mode 100644 meta/recipes-devtools/tcltk/tcl/use-relative-path-to-compile.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/use-relative-path-for-build-dir.patch
 create mode 100644 meta/recipes-gnome/gnome/gconf/gconf.path
 create mode 100644 meta/recipes-gnome/gnome/gconf/use-target-path-for-debug.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
 create mode 100644 meta/recipes-support/icu/icu/add-variable-U_CC-and-U_CXX.patch

-- 
1.9.1


