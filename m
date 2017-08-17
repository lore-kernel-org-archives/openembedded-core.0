Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B11F178285
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 17:11:12 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 10:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,388,1498546800"; d="scan'208";a="120130218"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga004.jf.intel.com with ESMTP; 17 Aug 2017 10:11:12 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 10:11:03 -0700
Message-Id: <d191108b104548186853993f846d82e3d1b6d441.1502989095.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502989095.git.alejandro.hernandez@linux.intel.com>
References: <cover.1502989095.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1502989095.git.alejandro.hernandez@linux.intel.com>
References: <cover.1502989095.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/3] python3: Restructure python3 packaging and replace it with autopackaging
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
X-List-Received-Date: Thu, 17 Aug 2017 17:11:13 -0000

See previous commit (python2 version) for more info.

Old manifest file had several issues:
 - Its unorganized and hard to read and understand it for an average
   human being.
 - Git complains every single time a patch is submitted to the manifest,
   since it violates some of its guidelines for patches.
 - It changes or may change with every release of python, its impossible
   to know if the required files for a certain package have changed (it
   could have more or less dependencies), the only way of doing so would be
   to install and test them all one by one, and even then we wouldnt know
   if they require less dependencies, we would just know if an extra
   dependency is required since it would complain, lets face it, this isnt
   feasible.
 - The same thing happens for new packages, if someone wants to add a new
   package, its dependencies need to be checked manually one by one.

Features/Fixes:
 - A new manifest format is used (JSON), easy to read and understand.
   This file is parsed by the python recipe and python packages
   read from here are passed directly to bitbake during parsing time.
 - It provides an automatic manifest creation task (explained on previous
   commit), which automagically checks for every package dependencies and
   adds them to the new manifest, hence we will have on each package
   exactly what that package needs to be run, providing finer granularity.
  - Dependencies are also checked automagically for new packages
   (explained on previous commit).

This patch differs has the same features as the python2's version
but it differs in the following ways:
 - Python3 handles precompiled bytecode files  (*.pyc) differently.
   for this reason and since we are cross compiling, wildcards couldnt be
   avoided on python3 (See PEP #3147 [1]).
   Both the manifest and the manifest creation script handle this
   differently, the manifest for python3 has an extra field for cached
   files, which is how it lets the user install the cached files or not
   via : INCLUDE_PYCS = "1" on their local.conf.
 - Shared libs nomenclature also changed on python3, so again, we use
   wildcards to deal with this issue ( See PEP #3149 [2]):
 - Fixes python3 manifest, python3-core should be base and everything
   should depend on it, hence several packages were deleted:
   python3-enum, re, gdbm, subprocess, signal, readline.
 - Sitecustomize was fixed since encoding was deprecated.
 - Fixes [YOCTO #11513] while were at it.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/python-3.5-manifest.inc                 |  283 -----
 .../python/python-native-3.5-manifest.inc          |   10 -
 .../python/python3-native_3.5.3.bb                 |   10 +-
 .../python/python3/create_manifest3.py             |  318 ++++++
 .../python/python3/get_module_deps3.py             |  145 +++
 .../python/python3/python3-manifest.json           | 1107 ++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |   90 +-
 scripts/contrib/python/generate-manifest-3.5.py    |  433 --------
 8 files changed, 1664 insertions(+), 732 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-3.5-manifest.inc
 delete mode 100644 meta/recipes-devtools/python/python-native-3.5-manifest.inc
 create mode 100644 meta/recipes-devtools/python/python3/create_manifest3.py
 create mode 100644 meta/recipes-devtools/python/python3/get_module_deps3.py
 create mode 100644 meta/recipes-devtools/python/python3/python3-manifest.json
 delete mode 100755 scripts/contrib/python/generate-manifest-3.5.py

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
deleted file mode 100644
index 0260e87e75f..00000000000
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ /dev/null
@@ -1,283 +0,0 @@
-
-# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: 'scripts/contrib/python/generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-
- 
-
-PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
-
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
-
-SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
-RDEPENDS_${PN}-2to3="${PN}-core"
-FILES_${PN}-2to3="${libdir}/python3.5/lib2to3 ${libdir}/python3.5/lib2to3/__pycache__ "
-
-SUMMARY_${PN}-argparse="Python command line argument parser"
-RDEPENDS_${PN}-argparse="${PN}-core ${PN}-codecs ${PN}-textutils"
-FILES_${PN}-argparse="${libdir}/python3.5/argparse.* ${libdir}/python3.5/__pycache__/argparse.* "
-
-SUMMARY_${PN}-asyncio="Python Asynchronous I/O, event loop, coroutines and tasks"
-RDEPENDS_${PN}-asyncio="${PN}-core"
-FILES_${PN}-asyncio="${libdir}/python3.5/asyncio ${libdir}/python3.5/asyncio/__pycache__ "
-
-SUMMARY_${PN}-audio="Python Audio Handling"
-RDEPENDS_${PN}-audio="${PN}-core"
-FILES_${PN}-audio="${libdir}/python3.5/wave.* ${libdir}/python3.5/__pycache__/wave.* ${libdir}/python3.5/chunk.* ${libdir}/python3.5/__pycache__/chunk.* ${libdir}/python3.5/sndhdr.* ${libdir}/python3.5/__pycache__/sndhdr.* ${libdir}/python3.5/lib-dynload/ossaudiodev.*.so ${libdir}/python3.5/lib-dynload/__pycache__/ossaudiodev.*.so ${libdir}/python3.5/lib-dynload/audioop.*.so ${libdir}/python3.5/lib-dynload/__pycache__/audioop.*.so ${libdir}/python3.5/audiodev.* ${libdir}/python3.5/__pycache__/audiodev.* ${libdir}/python3.5/sunaudio.* ${libdir}/python3.5/__pycache__/sunaudio.* ${libdir}/python3.5/sunau.* ${libdir}/python3.5/__pycache__/sunau.* ${libdir}/python3.5/toaiff.* ${libdir}/python3.5/__pycache__/toaiff.* "
-
-SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
-RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
-FILES_${PN}-codecs="${libdir}/python3.5/codecs.* ${libdir}/python3.5/__pycache__/codecs.* ${libdir}/python3.5/encodings ${libdir}/python3.5/encodings/__pycache__ ${libdir}/python3.5/gettext.* ${libdir}/python3.5/__pycache__/gettext.* ${libdir}/python3.5/locale.* ${libdir}/python3.5/__pycache__/locale.* ${libdir}/python3.5/lib-dynload/_locale.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_locale.*.so ${libdir}/python3.5/lib-dynload/_codecs* ${libdir}/python3.5/lib-dynload/_codecs*/__pycache__ ${libdir}/python3.5/lib-dynload/_multibytecodec.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_multibytecodec.*.so ${libdir}/python3.5/lib-dynload/unicodedata.*.so ${libdir}/python3.5/lib-dynload/__pycache__/unicodedata.*.so ${libdir}/python3.5/stringprep.* ${libdir}/python3.5/__pycache__/stringprep.* ${libdir}/python3.5/xdrlib.* ${libdir}/python3.5/__pycache__/xdrlib.* "
-
-SUMMARY_${PN}-compile="Python bytecode compilation support"
-RDEPENDS_${PN}-compile="${PN}-core"
-FILES_${PN}-compile="${libdir}/python3.5/py_compile.* ${libdir}/python3.5/__pycache__/py_compile.* ${libdir}/python3.5/compileall.* ${libdir}/python3.5/__pycache__/compileall.* "
-
-SUMMARY_${PN}-compression="Python high-level compression support"
-RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell"
-FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/__pycache__/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/__pycache__/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/__pycache__/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so ${libdir}/python3.5/lib-dynload/__pycache__/bz2.*.so ${libdir}/python3.5/lib-dynload/zlib.*.so ${libdir}/python3.5/lib-dynload/__pycache__/zlib.*.so ${libdir}/python3.5/bz2.py ${libdir}/python3.5/__pycache__/bz2.py ${libdir}/python3.5/lzma.py ${libdir}/python3.5/__pycache__/lzma.py ${libdir}/python3.5/_compression.py ${libdir}/python3.5/__pycache__/_compression.py "
-
-SUMMARY_${PN}-core="Python interpreter and core modules"
-RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
-FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/__pycache__/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/__pycache__/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/__pycache__/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/__pycache__/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/__pycache__/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/__pycache__/copyreg.* ${libdir}/python3.5/configparser.* ${libdir}/python3.5/__pycache__/configparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/__pycache__/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/__pycache__/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/__pycache__/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/__pycache__/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/__pycache__/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/__pycache__/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/__pycache__/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/__pycache__/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/__pycache__/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/__pycache__/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/__pycache__/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/__pycache__/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/__pycache__/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/__pycache__/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/__pycache__/types.* ${libdir}/python3.5/platform.* ${libdir}/python3.5/__pycache__/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/__pycache__/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/__pycache__/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/__pycache__/_sysconfigdata.* ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
-
-SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
-RDEPENDS_${PN}-crypt="${PN}-core"
-FILES_${PN}-crypt="${libdir}/python3.5/hashlib.* ${libdir}/python3.5/__pycache__/hashlib.* ${libdir}/python3.5/md5.* ${libdir}/python3.5/__pycache__/md5.* ${libdir}/python3.5/sha.* ${libdir}/python3.5/__pycache__/sha.* ${libdir}/python3.5/lib-dynload/crypt.*.so ${libdir}/python3.5/lib-dynload/__pycache__/crypt.*.so ${libdir}/python3.5/lib-dynload/_hashlib.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_hashlib.*.so ${libdir}/python3.5/lib-dynload/_sha256.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_sha256.*.so ${libdir}/python3.5/lib-dynload/_sha512.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_sha512.*.so "
-
-SUMMARY_${PN}-ctypes="Python C types support"
-RDEPENDS_${PN}-ctypes="${PN}-core ${PN}-subprocess"
-FILES_${PN}-ctypes="${libdir}/python3.5/ctypes ${libdir}/python3.5/ctypes/__pycache__ ${libdir}/python3.5/lib-dynload/_ctypes.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_ctypes.*.so ${libdir}/python3.5/lib-dynload/_ctypes_test.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_ctypes_test.*.so "
-
-SUMMARY_${PN}-curses="Python curses support"
-RDEPENDS_${PN}-curses="${PN}-core"
-FILES_${PN}-curses="${libdir}/python3.5/curses ${libdir}/python3.5/curses/__pycache__ ${libdir}/python3.5/lib-dynload/_curses.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_curses.*.so ${libdir}/python3.5/lib-dynload/_curses_panel.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_curses_panel.*.so "
-
-SUMMARY_${PN}-datetime="Python calendar and time support"
-RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
-FILES_${PN}-datetime="${libdir}/python3.5/_strptime.* ${libdir}/python3.5/__pycache__/_strptime.* ${libdir}/python3.5/calendar.* ${libdir}/python3.5/__pycache__/calendar.* ${libdir}/python3.5/datetime.* ${libdir}/python3.5/__pycache__/datetime.* ${libdir}/python3.5/lib-dynload/_datetime.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_datetime.*.so "
-
-SUMMARY_${PN}-db="Python file-based database support"
-RDEPENDS_${PN}-db="${PN}-core"
-FILES_${PN}-db="${libdir}/python3.5/anydbm.* ${libdir}/python3.5/__pycache__/anydbm.* ${libdir}/python3.5/dumbdbm.* ${libdir}/python3.5/__pycache__/dumbdbm.* ${libdir}/python3.5/whichdb.* ${libdir}/python3.5/__pycache__/whichdb.* ${libdir}/python3.5/dbm ${libdir}/python3.5/dbm/__pycache__ ${libdir}/python3.5/lib-dynload/_dbm.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_dbm.*.so "
-
-SUMMARY_${PN}-debugger="Python debugger"
-RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib ${PN}-pkgutil"
-FILES_${PN}-debugger="${libdir}/python3.5/bdb.* ${libdir}/python3.5/__pycache__/bdb.* ${libdir}/python3.5/pdb.* ${libdir}/python3.5/__pycache__/pdb.* "
-
-SUMMARY_${PN}-dev="Python development package"
-RDEPENDS_${PN}-dev="${PN}-core"
-FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/python3.5/config*/Makefile ${libdir}/python3.5/config*/Makefile/__pycache__ "
-
-SUMMARY_${PN}-difflib="Python helpers for computing deltas between objects"
-RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
-FILES_${PN}-difflib="${libdir}/python3.5/difflib.* ${libdir}/python3.5/__pycache__/difflib.* "
-
-SUMMARY_${PN}-distutils="Python Distribution Utilities"
-RDEPENDS_${PN}-distutils="${PN}-core ${PN}-email"
-FILES_${PN}-distutils="${libdir}/python3.5/config ${libdir}/python3.5/config/__pycache__ ${libdir}/python3.5/distutils ${libdir}/python3.5/distutils/__pycache__ "
-
-SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
-RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
-FILES_${PN}-distutils-staticdev="${libdir}/python3.5/config/lib*.a ${libdir}/python3.5/config/__pycache__/lib*.a "
-
-SUMMARY_${PN}-doctest="Python framework for running examples in docstrings"
-RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
-FILES_${PN}-doctest="${libdir}/python3.5/doctest.* ${libdir}/python3.5/__pycache__/doctest.* "
-
-SUMMARY_${PN}-email="Python email support"
-RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
-FILES_${PN}-email="${libdir}/python3.5/imaplib.* ${libdir}/python3.5/__pycache__/imaplib.* ${libdir}/python3.5/email ${libdir}/python3.5/email/__pycache__ "
-
-SUMMARY_${PN}-enum="Python support for enumerations"
-RDEPENDS_${PN}-enum="${PN}-core"
-FILES_${PN}-enum="${libdir}/python3.5/enum.* ${libdir}/python3.5/__pycache__/enum.* "
-
-SUMMARY_${PN}-fcntl="Python's fcntl interface"
-RDEPENDS_${PN}-fcntl="${PN}-core"
-FILES_${PN}-fcntl="${libdir}/python3.5/lib-dynload/fcntl.*.so ${libdir}/python3.5/lib-dynload/__pycache__/fcntl.*.so "
-
-SUMMARY_${PN}-gdbm="Python GNU database support"
-RDEPENDS_${PN}-gdbm="${PN}-core"
-FILES_${PN}-gdbm="${libdir}/python3.5/lib-dynload/_gdbm.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_gdbm.*.so "
-
-SUMMARY_${PN}-html="Python HTML processing support"
-RDEPENDS_${PN}-html="${PN}-core"
-FILES_${PN}-html="${libdir}/python3.5/formatter.* ${libdir}/python3.5/__pycache__/formatter.* ${libdir}/python3.5/htmlentitydefs.* ${libdir}/python3.5/__pycache__/htmlentitydefs.* ${libdir}/python3.5/html ${libdir}/python3.5/html/__pycache__ ${libdir}/python3.5/htmllib.* ${libdir}/python3.5/__pycache__/htmllib.* ${libdir}/python3.5/markupbase.* ${libdir}/python3.5/__pycache__/markupbase.* ${libdir}/python3.5/sgmllib.* ${libdir}/python3.5/__pycache__/sgmllib.* ${libdir}/python3.5/HTMLParser.* ${libdir}/python3.5/__pycache__/HTMLParser.* "
-
-SUMMARY_${PN}-idle="Python Integrated Development Environment"
-RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
-FILES_${PN}-idle="${bindir}/idle ${libdir}/python3.5/idlelib ${libdir}/python3.5/idlelib/__pycache__ "
-
-SUMMARY_${PN}-image="Python graphical image handling"
-RDEPENDS_${PN}-image="${PN}-core"
-FILES_${PN}-image="${libdir}/python3.5/colorsys.* ${libdir}/python3.5/__pycache__/colorsys.* ${libdir}/python3.5/imghdr.* ${libdir}/python3.5/__pycache__/imghdr.* ${libdir}/python3.5/lib-dynload/imageop.*.so ${libdir}/python3.5/lib-dynload/__pycache__/imageop.*.so ${libdir}/python3.5/lib-dynload/rgbimg.*.so ${libdir}/python3.5/lib-dynload/__pycache__/rgbimg.*.so "
-
-SUMMARY_${PN}-importlib="Python import implementation library"
-RDEPENDS_${PN}-importlib="${PN}-core ${PN}-lang"
-FILES_${PN}-importlib="${libdir}/python3.5/importlib ${libdir}/python3.5/importlib/__pycache__ ${libdir}/python3.5/imp.* ${libdir}/python3.5/__pycache__/imp.* "
-
-SUMMARY_${PN}-io="Python low-level I/O"
-RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-FILES_${PN}-io="${libdir}/python3.5/lib-dynload/_socket.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_socket.*.so ${libdir}/python3.5/lib-dynload/_io.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_io.*.so ${libdir}/python3.5/lib-dynload/_ssl.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_ssl.*.so ${libdir}/python3.5/lib-dynload/select.*.so ${libdir}/python3.5/lib-dynload/__pycache__/select.*.so ${libdir}/python3.5/lib-dynload/termios.*.so ${libdir}/python3.5/lib-dynload/__pycache__/termios.*.so ${libdir}/python3.5/lib-dynload/cStringIO.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cStringIO.*.so ${libdir}/python3.5/ipaddress.* ${libdir}/python3.5/__pycache__/ipaddress.* ${libdir}/python3.5/pipes.* ${libdir}/python3.5/__pycache__/pipes.* ${libdir}/python3.5/socket.* ${libdir}/python3.5/__pycache__/socket.* ${libdir}/python3.5/ssl.* ${libdir}/python3.5/__pycache__/ssl.* ${libdir}/python3.5/tempfile.* ${libdir}/python3.5/__pycache__/tempfile.* ${libdir}/python3.5/StringIO.* ${libdir}/python3.5/__pycache__/StringIO.* ${libdir}/python3.5/io.* ${libdir}/python3.5/__pycache__/io.* ${libdir}/python3.5/_pyio.* ${libdir}/python3.5/__pycache__/_pyio.* "
-
-SUMMARY_${PN}-json="Python JSON support"
-RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
-FILES_${PN}-json="${libdir}/python3.5/json ${libdir}/python3.5/json/__pycache__ ${libdir}/python3.5/lib-dynload/_json.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_json.*.so "
-
-SUMMARY_${PN}-lang="Python low-level language support"
-RDEPENDS_${PN}-lang="${PN}-core ${PN}-importlib"
-FILES_${PN}-lang="${libdir}/python3.5/lib-dynload/_bisect.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_bisect.*.so ${libdir}/python3.5/lib-dynload/_collections.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_collections.*.so ${libdir}/python3.5/lib-dynload/_heapq.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_heapq.*.so ${libdir}/python3.5/lib-dynload/_weakref.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_weakref.*.so ${libdir}/python3.5/lib-dynload/_functools.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_functools.*.so ${libdir}/python3.5/lib-dynload/array.*.so ${libdir}/python3.5/lib-dynload/__pycache__/array.*.so ${libdir}/python3.5/lib-dynload/itertools.*.so ${libdir}/python3.5/lib-dynload/__pycache__/itertools.*.so ${libdir}/python3.5/lib-dynload/operator.*.so ${libdir}/python3.5/lib-dynload/__pycache__/operator.*.so ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/python3.5/lib-dynload/__pycache__/parser.*.so ${libdir}/python3.5/atexit.* ${libdir}/python3.5/__pycache__/atexit.* ${libdir}/python3.5/bisect.* ${libdir}/python3.5/__pycache__/bisect.* ${libdir}/python3.5/code.* ${libdir}/python3.5/__pycache__/code.* ${libdir}/python3.5/codeop.* ${libdir}/python3.5/__pycache__/codeop.* ${libdir}/python3.5/collections.* ${libdir}/python3.5/__pycache__/collections.* ${libdir}/python3.5/_collections_abc.* ${libdir}/python3.5/__pycache__/_collections_abc.* ${libdir}/python3.5/contextlib.* ${libdir}/python3.5/__pycache__/contextlib.* ${libdir}/python3.5/dis.* ${libdir}/python3.5/__pycache__/dis.* ${libdir}/python3.5/functools.* ${libdir}/python3.5/__pycache__/functools.* ${libdir}/python3.5/heapq.* ${libdir}/python3.5/__pycache__/heapq.* ${libdir}/python3.5/inspect.* ${libdir}/python3.5/__pycache__/inspect.* ${libdir}/python3.5/keyword.* ${libdir}/python3.5/__pycache__/keyword.* ${libdir}/python3.5/opcode.* ${libdir}/python3.5/__pycache__/opcode.* ${libdir}/python3.5/operator.* ${libdir}/python3.5/__pycache__/operator.* ${libdir}/python3.5/symbol.* ${libdir}/python3.5/__pycache__/symbol.* ${libdir}/python3.5/repr.* ${libdir}/python3.5/__pycache__/repr.* ${libdir}/python3.5/token.* ${libdir}/python3.5/__pycache__/token.* ${libdir}/python3.5/tokenize.* ${libdir}/python3.5/__pycache__/tokenize.* ${libdir}/python3.5/traceback.* ${libdir}/python3.5/__pycache__/traceback.* ${libdir}/python3.5/weakref.* ${libdir}/python3.5/__pycache__/weakref.* "
-
-SUMMARY_${PN}-logging="Python logging support"
-RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
-FILES_${PN}-logging="${libdir}/python3.5/logging ${libdir}/python3.5/logging/__pycache__ "
-
-SUMMARY_${PN}-mailbox="Python mailbox format support"
-RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
-FILES_${PN}-mailbox="${libdir}/python3.5/mailbox.* ${libdir}/python3.5/__pycache__/mailbox.* "
-
-SUMMARY_${PN}-math="Python math support"
-RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
-FILES_${PN}-math="${libdir}/python3.5/lib-dynload/cmath.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cmath.*.so ${libdir}/python3.5/lib-dynload/math.*.so ${libdir}/python3.5/lib-dynload/__pycache__/math.*.so ${libdir}/python3.5/lib-dynload/_random.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_random.*.so ${libdir}/python3.5/random.* ${libdir}/python3.5/__pycache__/random.* ${libdir}/python3.5/sets.* ${libdir}/python3.5/__pycache__/sets.* "
-
-SUMMARY_${PN}-mime="Python MIME handling APIs"
-RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
-FILES_${PN}-mime="${libdir}/python3.5/mimetools.* ${libdir}/python3.5/__pycache__/mimetools.* ${libdir}/python3.5/uu.* ${libdir}/python3.5/__pycache__/uu.* ${libdir}/python3.5/quopri.* ${libdir}/python3.5/__pycache__/quopri.* ${libdir}/python3.5/rfc822.* ${libdir}/python3.5/__pycache__/rfc822.* ${libdir}/python3.5/MimeWriter.* ${libdir}/python3.5/__pycache__/MimeWriter.* "
-
-SUMMARY_${PN}-mmap="Python memory-mapped file support"
-RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
-FILES_${PN}-mmap="${libdir}/python3.5/lib-dynload/mmap.*.so ${libdir}/python3.5/lib-dynload/__pycache__/mmap.*.so "
-
-SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
-RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
-FILES_${PN}-multiprocessing="${libdir}/python3.5/lib-dynload/_multiprocessing.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_multiprocessing.*.so ${libdir}/python3.5/multiprocessing ${libdir}/python3.5/multiprocessing/__pycache__ "
-
-SUMMARY_${PN}-netclient="Python Internet Protocol clients"
-RDEPENDS_${PN}-netclient="${PN}-argparse ${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime ${PN}-html"
-FILES_${PN}-netclient="${libdir}/python3.5/*Cookie*.* ${libdir}/python3.5/__pycache__/*Cookie*.* ${libdir}/python3.5/base64.* ${libdir}/python3.5/__pycache__/base64.* ${libdir}/python3.5/cookielib.* ${libdir}/python3.5/__pycache__/cookielib.* ${libdir}/python3.5/ftplib.* ${libdir}/python3.5/__pycache__/ftplib.* ${libdir}/python3.5/gopherlib.* ${libdir}/python3.5/__pycache__/gopherlib.* ${libdir}/python3.5/hmac.* ${libdir}/python3.5/__pycache__/hmac.* ${libdir}/python3.5/http* ${libdir}/python3.5/http*/__pycache__ ${libdir}/python3.5/httplib.* ${libdir}/python3.5/__pycache__/httplib.* ${libdir}/python3.5/mimetypes.* ${libdir}/python3.5/__pycache__/mimetypes.* ${libdir}/python3.5/nntplib.* ${libdir}/python3.5/__pycache__/nntplib.* ${libdir}/python3.5/poplib.* ${libdir}/python3.5/__pycache__/poplib.* ${libdir}/python3.5/smtplib.* ${libdir}/python3.5/__pycache__/smtplib.* ${libdir}/python3.5/telnetlib.* ${libdir}/python3.5/__pycache__/telnetlib.* ${libdir}/python3.5/urllib ${libdir}/python3.5/urllib/__pycache__ ${libdir}/python3.5/uuid.* ${libdir}/python3.5/__pycache__/uuid.* ${libdir}/python3.5/rfc822.* ${libdir}/python3.5/__pycache__/rfc822.* ${libdir}/python3.5/mimetools.* ${libdir}/python3.5/__pycache__/mimetools.* "
-
-SUMMARY_${PN}-netserver="Python Internet Protocol servers"
-RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading"
-FILES_${PN}-netserver="${libdir}/python3.5/cgi.* ${libdir}/python3.5/__pycache__/cgi.* ${libdir}/python3.5/socketserver.* ${libdir}/python3.5/__pycache__/socketserver.* ${libdir}/python3.5/*HTTPServer.* ${libdir}/python3.5/__pycache__/*HTTPServer.* ${libdir}/python3.5/SocketServer.* ${libdir}/python3.5/__pycache__/SocketServer.* "
-
-SUMMARY_${PN}-numbers="Python number APIs"
-RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python3.5/decimal.* ${libdir}/python3.5/__pycache__/decimal.* ${libdir}/python3.5/fractions.* ${libdir}/python3.5/__pycache__/fractions.* ${libdir}/python3.5/numbers.* ${libdir}/python3.5/__pycache__/numbers.* "
-
-SUMMARY_${PN}-pickle="Python serialisation/persistence support"
-RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python3.5/_compat_pickle.* ${libdir}/python3.5/__pycache__/_compat_pickle.* ${libdir}/python3.5/pickle.* ${libdir}/python3.5/__pycache__/pickle.* ${libdir}/python3.5/shelve.* ${libdir}/python3.5/__pycache__/shelve.* ${libdir}/python3.5/lib-dynload/cPickle.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cPickle.*.so ${libdir}/python3.5/pickletools.* ${libdir}/python3.5/__pycache__/pickletools.* "
-
-SUMMARY_${PN}-pkgutil="Python package extension utility support"
-RDEPENDS_${PN}-pkgutil="${PN}-core"
-FILES_${PN}-pkgutil="${libdir}/python3.5/pkgutil.* ${libdir}/python3.5/__pycache__/pkgutil.* "
-
-SUMMARY_${PN}-pprint="Python pretty-print support"
-RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
-FILES_${PN}-pprint="${libdir}/python3.5/pprint.* ${libdir}/python3.5/__pycache__/pprint.* "
-
-SUMMARY_${PN}-profile="Python basic performance profiling support"
-RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
-FILES_${PN}-profile="${libdir}/python3.5/profile.* ${libdir}/python3.5/__pycache__/profile.* ${libdir}/python3.5/pstats.* ${libdir}/python3.5/__pycache__/pstats.* ${libdir}/python3.5/cProfile.* ${libdir}/python3.5/__pycache__/cProfile.* ${libdir}/python3.5/lib-dynload/_lsprof.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_lsprof.*.so "
-
-SUMMARY_${PN}-pydoc="Python interactive help support"
-RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
-FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python3.5/pydoc.* ${libdir}/python3.5/__pycache__/pydoc.* ${libdir}/python3.5/pydoc_data ${libdir}/python3.5/pydoc_data/__pycache__ "
-
-SUMMARY_${PN}-re="Python Regular Expression APIs"
-RDEPENDS_${PN}-re="${PN}-core"
-FILES_${PN}-re="${libdir}/python3.5/re.* ${libdir}/python3.5/__pycache__/re.* ${libdir}/python3.5/sre.* ${libdir}/python3.5/__pycache__/sre.* ${libdir}/python3.5/sre_compile.* ${libdir}/python3.5/__pycache__/sre_compile.* ${libdir}/python3.5/sre_constants* ${libdir}/python3.5/sre_constants*/__pycache__ ${libdir}/python3.5/sre_parse.* ${libdir}/python3.5/__pycache__/sre_parse.* "
-
-SUMMARY_${PN}-readline="Python readline support"
-RDEPENDS_${PN}-readline="${PN}-core"
-FILES_${PN}-readline="${libdir}/python3.5/lib-dynload/readline.*.so ${libdir}/python3.5/lib-dynload/__pycache__/readline.*.so ${libdir}/python3.5/rlcompleter.* ${libdir}/python3.5/__pycache__/rlcompleter.* "
-
-SUMMARY_${PN}-reprlib="Python alternate repr() implementation"
-RDEPENDS_${PN}-reprlib="${PN}-core"
-FILES_${PN}-reprlib="${libdir}/python3.5/reprlib.py ${libdir}/python3.5/__pycache__/reprlib.py "
-
-SUMMARY_${PN}-resource="Python resource control interface"
-RDEPENDS_${PN}-resource="${PN}-core"
-FILES_${PN}-resource="${libdir}/python3.5/lib-dynload/resource.*.so ${libdir}/python3.5/lib-dynload/__pycache__/resource.*.so "
-
-SUMMARY_${PN}-selectors="Python High-level I/O multiplexing"
-RDEPENDS_${PN}-selectors="${PN}-core"
-FILES_${PN}-selectors="${libdir}/python3.5/selectors.* ${libdir}/python3.5/__pycache__/selectors.* "
-
-SUMMARY_${PN}-shell="Python shell-like functionality"
-RDEPENDS_${PN}-shell="${PN}-core ${PN}-re ${PN}-compression"
-FILES_${PN}-shell="${libdir}/python3.5/cmd.* ${libdir}/python3.5/__pycache__/cmd.* ${libdir}/python3.5/commands.* ${libdir}/python3.5/__pycache__/commands.* ${libdir}/python3.5/dircache.* ${libdir}/python3.5/__pycache__/dircache.* ${libdir}/python3.5/fnmatch.* ${libdir}/python3.5/__pycache__/fnmatch.* ${libdir}/python3.5/glob.* ${libdir}/python3.5/__pycache__/glob.* ${libdir}/python3.5/popen2.* ${libdir}/python3.5/__pycache__/popen2.* ${libdir}/python3.5/shlex.* ${libdir}/python3.5/__pycache__/shlex.* ${libdir}/python3.5/shutil.* ${libdir}/python3.5/__pycache__/shutil.* "
-
-SUMMARY_${PN}-signal="Python set handlers for asynchronous events support"
-RDEPENDS_${PN}-signal="${PN}-core ${PN}-enum"
-FILES_${PN}-signal="${libdir}/python3.5/signal.* ${libdir}/python3.5/__pycache__/signal.* "
-
-SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
-RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
-FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python3.5/smtpd.* ${libdir}/python3.5/__pycache__/smtpd.* "
-
-SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
-RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading"
-FILES_${PN}-sqlite3="${libdir}/python3.5/lib-dynload/_sqlite3.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_sqlite3.*.so ${libdir}/python3.5/sqlite3/dbapi2.* ${libdir}/python3.5/sqlite3/__pycache__/dbapi2.* ${libdir}/python3.5/sqlite3/__init__.* ${libdir}/python3.5/sqlite3/__pycache__/__init__.* ${libdir}/python3.5/sqlite3/dump.* ${libdir}/python3.5/sqlite3/__pycache__/dump.* "
-
-SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support tests"
-RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
-FILES_${PN}-sqlite3-tests="${libdir}/python3.5/sqlite3/test ${libdir}/python3.5/sqlite3/test/__pycache__ "
-
-SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
-RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
-FILES_${PN}-stringold="${libdir}/python3.5/lib-dynload/strop.*.so ${libdir}/python3.5/lib-dynload/__pycache__/strop.*.so ${libdir}/python3.5/string.* ${libdir}/python3.5/__pycache__/string.* ${libdir}/python3.5/stringold.* ${libdir}/python3.5/__pycache__/stringold.* "
-
-SUMMARY_${PN}-subprocess="Python subprocess support"
-RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-threading ${PN}-signal ${PN}-selectors"
-FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* ${libdir}/python3.5/__pycache__/subprocess.* ${libdir}/python3.5/lib-dynload/_posixsubprocess.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_posixsubprocess.*.so "
-
-SUMMARY_${PN}-syslog="Python syslog interface"
-RDEPENDS_${PN}-syslog="${PN}-core"
-FILES_${PN}-syslog="${libdir}/python3.5/lib-dynload/syslog.*.so ${libdir}/python3.5/lib-dynload/__pycache__/syslog.*.so "
-
-SUMMARY_${PN}-terminal="Python terminal controlling support"
-RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
-FILES_${PN}-terminal="${libdir}/python3.5/pty.* ${libdir}/python3.5/__pycache__/pty.* ${libdir}/python3.5/tty.* ${libdir}/python3.5/__pycache__/tty.* "
-
-SUMMARY_${PN}-tests="Python tests"
-RDEPENDS_${PN}-tests="${PN}-core ${PN}-compression"
-FILES_${PN}-tests="${libdir}/python3.5/test ${libdir}/python3.5/test/__pycache__ "
-
-SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
-RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
-FILES_${PN}-textutils="${libdir}/python3.5/lib-dynload/_csv.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_csv.*.so ${libdir}/python3.5/csv.* ${libdir}/python3.5/__pycache__/csv.* ${libdir}/python3.5/optparse.* ${libdir}/python3.5/__pycache__/optparse.* ${libdir}/python3.5/textwrap.* ${libdir}/python3.5/__pycache__/textwrap.* "
-
-SUMMARY_${PN}-threading="Python threading & synchronization support"
-RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
-FILES_${PN}-threading="${libdir}/python3.5/_threading_local.* ${libdir}/python3.5/__pycache__/_threading_local.* ${libdir}/python3.5/dummy_thread.* ${libdir}/python3.5/__pycache__/dummy_thread.* ${libdir}/python3.5/dummy_threading.* ${libdir}/python3.5/__pycache__/dummy_threading.* ${libdir}/python3.5/mutex.* ${libdir}/python3.5/__pycache__/mutex.* ${libdir}/python3.5/threading.* ${libdir}/python3.5/__pycache__/threading.* ${libdir}/python3.5/queue.* ${libdir}/python3.5/__pycache__/queue.* "
-
-SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
-RDEPENDS_${PN}-tkinter="${PN}-core"
-FILES_${PN}-tkinter="${libdir}/python3.5/lib-dynload/_tkinter.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_tkinter.*.so ${libdir}/python3.5/lib-tk ${libdir}/python3.5/lib-tk/__pycache__ ${libdir}/python3.5/tkinter ${libdir}/python3.5/tkinter/__pycache__ "
-
-SUMMARY_${PN}-typing="Python typing support"
-RDEPENDS_${PN}-typing="${PN}-core"
-FILES_${PN}-typing="${libdir}/python3.5/typing.* ${libdir}/python3.5/__pycache__/typing.* "
-
-SUMMARY_${PN}-unittest="Python unit testing framework"
-RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
-FILES_${PN}-unittest="${libdir}/python3.5/unittest/ ${libdir}/python3.5/unittest/__pycache__ "
-
-SUMMARY_${PN}-unixadmin="Python Unix administration support"
-RDEPENDS_${PN}-unixadmin="${PN}-core"
-FILES_${PN}-unixadmin="${libdir}/python3.5/lib-dynload/nis.*.so ${libdir}/python3.5/lib-dynload/__pycache__/nis.*.so ${libdir}/python3.5/lib-dynload/grp.*.so ${libdir}/python3.5/lib-dynload/__pycache__/grp.*.so ${libdir}/python3.5/lib-dynload/pwd.*.so ${libdir}/python3.5/lib-dynload/__pycache__/pwd.*.so ${libdir}/python3.5/getpass.* ${libdir}/python3.5/__pycache__/getpass.* "
-
-SUMMARY_${PN}-xml="Python basic XML support"
-RDEPENDS_${PN}-xml="${PN}-core ${PN}-re"
-FILES_${PN}-xml="${libdir}/python3.5/lib-dynload/_elementtree.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_elementtree.*.so ${libdir}/python3.5/lib-dynload/pyexpat.*.so ${libdir}/python3.5/lib-dynload/__pycache__/pyexpat.*.so ${libdir}/python3.5/xml ${libdir}/python3.5/xml/__pycache__ ${libdir}/python3.5/xmllib.* ${libdir}/python3.5/__pycache__/xmllib.* "
-
-SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
-RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang ${PN}-pydoc"
-FILES_${PN}-xmlrpc="${libdir}/python3.5/xmlrpclib.* ${libdir}/python3.5/__pycache__/xmlrpclib.* ${libdir}/python3.5/SimpleXMLRPCServer.* ${libdir}/python3.5/__pycache__/SimpleXMLRPCServer.* ${libdir}/python3.5/DocXMLRPCServer.* ${libdir}/python3.5/__pycache__/DocXMLRPCServer.* ${libdir}/python3.5/xmlrpc ${libdir}/python3.5/xmlrpc/__pycache__ "
-
-SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
-ALLOW_EMPTY_${PN}-modules = "1"
-
-
diff --git a/meta/recipes-devtools/python/python-native-3.5-manifest.inc b/meta/recipes-devtools/python/python-native-3.5-manifest.inc
deleted file mode 100644
index f1f732eb846..00000000000
--- a/meta/recipes-devtools/python/python-native-3.5-manifest.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-
-# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../scripts/contrib/python/generate-manifest-3.5.py --native' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-
- 
-
-RPROVIDES += "python3-modules-native python3-2to3-native python3-argparse-native python3-asyncio-native python3-audio-native python3-codecs-native python3-compile-native python3-compression-native python3-core-native python3-crypt-native python3-ctypes-native python3-curses-native python3-datetime-native python3-db-native python3-debugger-native python3-dev-native python3-difflib-native python3-distutils-native python3-distutils-staticdev-native python3-doctest-native python3-email-native python3-enum-native python3-fcntl-native python3-gdbm-native python3-html-native python3-idle-native python3-image-native python3-importlib-native python3-io-native python3-json-native python3-lang-native python3-logging-native python3-mailbox-native python3-math-native python3-mime-native python3-mmap-native python3-multiprocessing-native python3-netclient-native python3-netserver-native python3-numbers-native python3-pickle-native python3-pkgutil-native python3-pprint-native python3-profile-native python3-pydoc-native python3-re-native python3-readline-native python3-reprlib-native python3-resource-native python3-selectors-native python3-shell-native python3-signal-native python3-smtpd-native python3-sqlite3-native python3-sqlite3-tests-native python3-stringold-native python3-subprocess-native python3-syslog-native python3-terminal-native python3-tests-native python3-textutils-native python3-threading-native python3-tkinter-native python3-typing-native python3-unittest-native python3-unixadmin-native python3-xml-native python3-xmlrpc-native"
-
-
-
diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/recipes-devtools/python/python3-native_3.5.3.bb
index db0e7b9bd8e..51b80b5e5c7 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
@@ -42,7 +42,7 @@ DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native s
 
 inherit native
 
-require python-native-${PYTHON_MAJMIN}-manifest.inc
+#require python-native-${PYTHON_MAJMIN}-manifest.inc
 
 # uninative may be used on pre glibc 2.25 systems which don't have getentropy
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip ac_cv_func_getentropy=no"
@@ -78,5 +78,11 @@ do_install() {
 	done
 
 	# Tests are large and we don't need them in the native sysroot
-	rm ${D}${libdir}/python${PYTHON_MAJMIN}/test -rf
+	#rm ${D}${libdir}/python${PYTHON_MAJMIN}/test -rf
+
+        # Add a symlink to the native Python so that scripts can just invoke
+        # "nativepython" and get the right one without needing absolute paths
+        # (these often end up too long for the #! parser in the kernel as the
+        # buffer is 128 bytes long).
+        ln -s python3-native/python3 ${D}${bindir}/nativepython3
 }
diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
new file mode 100644
index 00000000000..b382de43f3a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -0,0 +1,318 @@
+# This script is used as a bitbake task to create a new python manifest
+# $ bitbake python -c create_manifest
+#
+# Our goal is to keep python-core as small as posible and add other python
+# packages only when the user needs them, hence why we split upstream python
+# into several packages.
+
+# In a very simplistic way what this does is: 
+# Launch python and see specifically what is required for it to run at a minimum
+#
+# Go through the python-manifest file and launch a separate task for every single
+# one of the files on each package, this task will check what was required for that
+# specific module to run, these modules will be called dependencies.
+# The output of such task will be a list of the modules or dependencies that were
+# found for that file.
+#
+# Such output will be parsed by this script, we will look for each dependency on the
+# manifest and if we find that another package already includes it, then we will add
+# that package as an RDEPENDS to the package we are currently checking; in case we dont
+# find the current dependency on any other package we will add it to the current package
+# as part of FILES.
+#
+#
+# This way we will create a new manifest from the data structure that was built during
+# this process, ont this new manifest each package will contain specifically only
+# what it needs to run.
+
+# There are some caveats which we try to deal with, such as repeated files on different
+# packages, packages that include folders, wildcards, and special packages.
+# Its also important to note that this method only works for python files, and shared
+# libraries. Static libraries, header files and binaries need to be dealt with manually.
+
+# This script differs from its python2 version mostly on how shared libraries are handled
+# The manifest file for python3 has an extra field which contains the cached files for
+# each package.
+# Tha method to handle cached files does not work when a module includes a folder which
+# itself contains the pycache folder, gladly this is almost never the case.
+
+import sys
+import subprocess
+import json
+import os
+
+# Hack to get native python search path (for folders), not fond of it but it works for now
+pivot='recipe-sysroot-native'
+for p in sys.path:
+  if pivot in p:
+    nativelibfolder=p[:p.find(pivot)+len(pivot)]
+
+# Empty dict to hold the whole manifest
+new_manifest = {}
+
+# Check for repeated files, folders and wildcards
+allfiles=[]
+repeated=[]
+wildcards=[]
+
+hasfolders=[]
+allfolders=[]
+
+def isFolder(value):
+  if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
+    return True
+  else:
+    return False
+
+def isCached(item):
+  if '__pycache__' in item:
+    return True
+  else:
+    return False
+
+# Read existing JSON manifest
+with open('python3-manifest.json') as manifest:
+  old_manifest=json.load(manifest)
+
+
+# First pass to get core-package functionality, because we base everything on the fact that core is actually working
+# Not exactly the same so it should not be a function
+print ("Getting dependencies for core package:")
+
+# Special call to check for core package
+output = subprocess.check_output([sys.executable, 'get_module_deps3.py', 'python-core-package']).decode('utf8')
+for item in output.split():
+    # We append it so it doesnt hurt what we currently have:
+    if isCached(item):
+        if item not in old_manifest['core']['cached']:
+            # We use the same data structure since its the one which will be used to check
+            # dependencies for other packages
+            old_manifest['core']['cached'].append(item)
+    else:
+        if item not in old_manifest['core']['files']:
+            # We use the same data structure since its the one which will be used to check
+            # dependencies for other packages
+            old_manifest['core']['files'].append(item)
+
+for value in old_manifest['core']['files']:
+  # Ignore folders, since we don't import those, difficult to handle multilib
+  if isFolder(value):
+    # Pass it directly
+    if isCached(value):
+        if value not in old_manifest['core']['cached']:
+            old_manifest['core']['cached'].append(value)
+    else:
+        if value not in old_manifest['core']['files']:
+            old_manifest['core']['files'].append(value)
+    continue
+  # Ignore binaries, since we don't import those, assume it was added correctly (manually)
+  if '${bindir}' in value:
+    # Pass it directly
+    if value not in old_manifest['core']['files']:
+      old_manifest['core']['files'].append(value)
+    continue
+  # Ignore empty values
+  if value == "":
+    continue
+  if '${includedir}' in value:
+    if value not in old_manifest['core']['files']:
+      old_manifest['core']['files'].append(value)
+    continue
+  # Get module name , shouldnt be affected by libdir/bindir
+  value = os.path.splitext(os.path.basename(os.path.normpath(value)))[0]
+
+
+  # Launch separate task for each module for deterministic behavior
+  # Each module will only import what is necessary for it to work in specific
+  print ("Getting dependencies for module: %s" % value)
+  output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % value]).decode('utf8')
+  print (output)
+  for item in output.split():
+    # We append it so it doesnt hurt what we currently have:
+    if isCached(item):
+        if item not in old_manifest['core']['cached']:
+            # We use the same data structure since its the one which will be used to check
+            # dependencies for other packages
+            old_manifest['core']['cached'].append(item)
+    else:
+        if item not in old_manifest['core']['files']:
+            # We use the same data structure since its the one which will be used to check
+            # dependencies for other packages
+            old_manifest['core']['files'].append(item)
+
+
+# We check which packages include folders
+for key in old_manifest:
+    for value in old_manifest[key]['files']:
+        # Ignore folders, since we don't import those, difficult to handle multilib
+        if isFolder(value):
+            print ('%s is a folder' % value)
+            if key not in hasfolders:
+                hasfolders.append(key)
+            if value not in allfolders:
+                allfolders.append(value)
+
+for key in old_manifest:
+    # Use an empty dict as data structure to hold data for each package and fill it up
+    new_manifest[key]={}
+    new_manifest[key]['files']=[]
+    
+    new_manifest[key]['rdepends']=[]
+    # All packages should depend on core
+    if key != 'core':
+         new_manifest[key]['rdepends'].append('core')
+         new_manifest[key]['cached']=[]
+    else:
+         new_manifest[key]['cached']=old_manifest[key]['cached']
+    new_manifest[key]['summary']=old_manifest[key]['summary']
+
+    # Handle special cases, we assume that when they were manually added 
+    # to the manifest we knew what we were doing.
+    print ("Handling package %s" % key)
+    special_packages=['misc', 'modules', 'dev']
+    if key in special_packages or 'staticdev' in key:
+        print("Passing %s package directly" % key)
+        new_manifest[key]=old_manifest[key]
+        continue
+
+    for value in old_manifest[key]['files']:
+        # We already handled core on the first pass
+        if key == 'core':
+            new_manifest[key]['files'].append(value)
+            continue
+        # Ignore folders, since we don't import those, difficult to handle multilib
+        if isFolder(value):
+            # Pass folders directly
+            new_manifest[key]['files'].append(value)
+        # Ignore binaries, since we don't import those
+        if '${bindir}' in value:
+            # Pass it directly to the new manifest data structure
+            if value not in new_manifest[key]['files']:
+                new_manifest[key]['files'].append(value)
+            continue
+        # Ignore empty values
+        if value == "":
+            continue
+        if '${includedir}' in value:
+            if value not in new_manifest[key]['files']:
+                new_manifest[key]['files'].append(value)
+            continue
+        # Get module name , shouldnt be affected by libdir/bindir
+        value = os.path.splitext(os.path.basename(os.path.normpath(value)))[0]
+
+        # Launch separate task for each module for deterministic behavior
+        # Each module will only import what is necessary for it to work in specific
+        print ("Getting dependencies for module: %s" % value)
+        output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % value]).decode('utf8')
+        # We can print dependencies for debugging purposes
+        print (output)
+        # Output will have all dependencies
+        for item in output.split():
+
+            # Warning: This first part is ugly
+            # One of the dependencies that was found, could be inside of one of the folders included by another package
+            # We need to check if this happens so we can add the package containing the folder as an rdependency
+            # e.g. Folder encodings contained in codecs
+            # This would be solved if no packages included any folders
+
+            # This can be done in two ways:
+            # 1 - We assume that if we take out the filename from the path we would get
+            #   the folder string, then we would check if folder string is in the list of folders
+            #   This would not work if a package contains a folder which contains another folder
+            #   e.g. path/folder1/folder2/filename  folder_string= path/folder1/folder2
+            #   folder_string would not match any value contained in the list of folders
+            #
+            # 2 - We do it the other way around, checking if the folder is contained in the path
+            #   e.g. path/folder1/folder2/filename  folder_string= path/folder1/folder2
+            #   is folder_string inside path/folder1/folder2/filename?, 
+            #   Yes, it works, but we waste a couple of milliseconds.
+
+            inFolders=False
+            for folder in allfolders:
+                if folder in item:
+                    inFolders = True # Did we find a folder?
+                    folderFound = False # Second flag to break inner for
+                    # Loop only through packages which contain folders
+                    for keyfolder in hasfolders:
+                        if (folderFound == False):
+                            #print("Checking folder %s on package %s" % (item,keyfolder))
+                            for file_folder in old_manifest[keyfolder]['files'] or file_folder in old_manifest[keyfolder]['cached']:
+                                if file_folder==folder:
+                                    print ("%s found in %s" % (folder, keyfolder))
+                                    folderFound = True
+                                    if keyfolder not in new_manifest[key]['rdepends'] and keyfolder != key:
+                                        new_manifest[key]['rdepends'].append(keyfolder)
+                                    
+                        else:
+                            break
+
+            # A folder was found so we're done with this item, we can go on
+            if inFolders:
+                continue
+
+            # We might already have it on the dictionary since it could depend on a (previously checked) module
+            if item not in new_manifest[key]['files'] and item not in new_manifest[key]['cached']:
+                # Handle core as a special package, we already did it so we pass it to NEW data structure directly
+                if key=='core':
+                  print("Adding %s to %s FILES" % (item, key))
+                  if item.endswith('*'):
+                      wildcards.append(item)
+                  if isCached(item):
+                      new_manifest[key]['cached'].append(item)
+                  else:
+                      new_manifest[key]['files'].append(item)
+
+                  # Check for repeated files
+                  if item not in allfiles:
+                      allfiles.append(item)
+                  else:
+                      repeated.append(item)
+
+                else:
+
+                    # Check if this dependency is already contained on another package, so we add it
+                    # as an RDEPENDS, or if its not, it means it should be contained on the current
+                    # package, so we should add it to FILES
+                    for newkey in old_manifest:
+                        # Debug
+                        #print("Checking %s " % item + " in %s" % newkey)
+                        if item in old_manifest[newkey]['files'] or item in old_manifest[newkey]['cached']:      
+                                # Since were nesting, we need to check its not the same key
+                                if(newkey!=key):
+                                    if newkey not in new_manifest[key]['rdepends']:
+                                       # Add it to the new manifest data struct
+                                       # Debug
+                                       print("Adding %s to %s RDEPENDS, because it contains %s" % (newkey, key, item))
+                                       new_manifest[key]['rdepends'].append(newkey)
+                                    break
+                    else:
+                      # Debug
+                      print("Adding %s to %s FILES" % (item, key))
+                      # Since it wasnt found on another package, its not an RDEP, so add it to FILES for this package
+                      if isCached(item):
+                          new_manifest[key]['cached'].append(item)
+                      else:
+                          new_manifest[key]['files'].append(item)
+                      if item.endswith('*'):
+                          wildcards.append(item)
+                      if item not in allfiles:
+                          allfiles.append(item)
+                      else:
+                          repeated.append(item)
+
+print ("The following files are repeated (contained in more than one package), please check which package should get it:")
+print (repeated)
+print("The following files contain wildcards, please check they are necessary")
+print(wildcards)
+print("The following files contain folders, please check they are necessary")
+print(hasfolders)
+
+# Sort it just so it looks nicer
+for key in new_manifest:
+    new_manifest[key]['files'].sort()
+    new_manifest[key]['cached'].sort()
+    new_manifest[key]['rdepends'].sort()
+
+# Create the manifest from the data structure that was built
+with open('python3-manifest.json.new','w') as outfile:
+    json.dump(new_manifest,outfile,sort_keys=True, indent=4)
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
new file mode 100644
index 00000000000..d202806cabc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -0,0 +1,145 @@
+# This script is launched on separate task for each python module
+# It checks for dependencies for that specific module and prints 
+# them out, the output of this execution will have all dependencies
+# for a specific module, which will be parsed an dealt on create_manifest.py
+
+
+# We can get a log per module, for all the dependencies that were found, but its messy.
+debug=False
+
+import sys
+
+# We can get a list of the modules which are currently required to run python
+# so we run python-core and get its modules, we then import what we need
+# and check what modules are currently running, if we substract them from the
+# modules we had initially, we get the dependencies for the module we imported.
+
+# We use importlib to achieve this, so we also need to know what modules importlib needs
+import importlib
+
+core_deps=set(sys.modules)
+
+def fix_path(dep_path):
+    import os
+    # We DONT want the path on our HOST system
+    pivot='recipe-sysroot-native'
+    dep_path=dep_path[dep_path.find(pivot)+len(pivot):]
+
+    if '/usr/bin' in dep_path:
+        dep_path = dep_path.replace('/usr/bin''${bindir}')
+
+    # Handle multilib, is there a better way?
+    if '/usr/lib32' in dep_path:
+        dep_path = dep_path.replace('/usr/lib32','${libdir}')
+    if '/usr/lib64' in dep_path:
+        dep_path = dep_path.replace('/usr/lib64','${libdir}')
+    if '/usr/lib' in dep_path:
+        dep_path = dep_path.replace('/usr/lib','${libdir}')
+    if '/usr/include' in dep_path:
+        dep_path = dep_path.replace('/usr/include','${includedir}')
+    if '__init__.' in dep_path:
+        dep_path =  os.path.split(dep_path)[0]
+    return dep_path
+
+
+# Module to import was passed as an argument
+current_module =  str(sys.argv[1]).rstrip()
+if(debug==True):
+    log = open('log_%s' % current_module,'w')
+    log.write("Module %s generated the following dependencies:\n" % current_module)
+try: 
+    importlib.import_module('%s' % current_module)
+except ImportError as e:
+    if (debug==True):
+        log.write("Module was not found")
+    pass
+
+
+# Get current module dependencies, dif will contain a list of specific deps for this module
+module_deps=set(sys.modules)
+
+# We handle the core package (1st pass on create_manifest.py) as a special case
+if current_module == 'python-core-package':
+    dif = core_deps
+else:
+    # We know this is not the core package, so there must be a difference.
+    dif = module_deps-core_deps
+
+
+# Check where each dependency came from
+for item in dif:
+    dep_path=""
+    try:
+        if (debug==True):
+            log.write("Calling: sys.modules[" + "%s" % item + "].__file__\n")
+        dep_path = sys.modules['%s' % item].__file__
+    except AttributeError as e:
+        # Deals with thread (builtin module) not having __file__ attribute
+        if debug==True:
+            log.write(item + ' ')
+            log.write(str(e))
+            log.write("\n")
+        pass
+    except NameError as e:
+        # Deals with NameError: name 'dep_path' is not defined
+        # because module is not found (wasn't compiled?), e.g. bddsm
+        if (debug==True):
+            log.write(item+' ') 
+            log.write(str(e))                                              
+        pass
+
+    # Site-customize is a special case since we (OpenEmbedded) put it there manually
+    if 'sitecustomize' in dep_path:
+        dep_path = '${libdir}/python2.7/sitecustomize.py'
+        # Prints out result, which is what will be used by create_manifest
+        print (dep_path)
+        continue
+
+    dep_path = fix_path(dep_path)
+
+    import sysconfig
+    soabi=sysconfig.get_config_var('SOABI')
+    # Check if its a shared library and deconstruct it
+    if soabi in dep_path:
+        if (debug==True):
+            log.write("Shared library found in %s" % dep_path)
+        dep_path = dep_path.replace(soabi,'*')
+        print (dep_path)
+        continue
+
+    if (debug==True):
+        log.write(dep_path+"\n")
+    # Prints out result, which is what will be used by create_manifest
+    print (dep_path)
+
+
+    import imp
+    cpython_tag = imp.get_tag() 
+    cached=""
+    # Theres no naive way to find *.pyc files on python3
+    try:
+        if (debug==True):
+            log.write("Calling: sys.modules[" + "%s" % item + "].__cached__\n")
+        cached = sys.modules['%s' % item].__cached__
+    except AttributeError as e:
+        # Deals with thread (builtin module) not having __cached__ attribute
+        if debug==True:
+            log.write(item + ' ')
+            log.write(str(e))
+            log.write("\n")
+        pass
+    except NameError as e:
+        # Deals with NameError: name 'cached' is not defined
+        if (debug==True):
+            log.write(item+' ') 
+            log.write(str(e))                                              
+        pass
+    if cached is not None:
+        if (debug==True):
+            log.write(cached)
+        cached = fix_path(cached)
+        cached = cached.replace(cpython_tag,'*')
+        print (cached)
+
+if debug==True:
+    log.close()
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
new file mode 100644
index 00000000000..d8ac2b4a059
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -0,0 +1,1107 @@
+{
+    "2to3": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/lib2to3"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python automated Python 2 to 3 code translator"
+    },
+    "asyncio": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/asyncio",
+            "${libdir}/python3.5/concurrent",
+            "${libdir}/python3.5/concurrent/futures"
+        ],
+        "rdepends": [
+            "compression",
+            "core",
+            "crypt",
+            "io",
+            "logging",
+            "math",
+            "multiprocessing",
+            "netclient",
+            "pickle",
+            "shell",
+            "stringold",
+            "threading",
+            "unixadmin"
+        ],
+        "summary": "Python Asynchronous I/"
+    },
+    "audio": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/chunk.*.pyc",
+            "${libdir}/python3.5/__pycache__/sndhdr.*.pyc",
+            "${libdir}/python3.5/__pycache__/sunau.*.pyc",
+            "${libdir}/python3.5/__pycache__/wave.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/chunk.py",
+            "${libdir}/python3.5/lib-dynload/audioop.*.so",
+            "${libdir}/python3.5/lib-dynload/ossaudiodev.*.so",
+            "${libdir}/python3.5/sndhdr.py",
+            "${libdir}/python3.5/sunau.py",
+            "${libdir}/python3.5/wave.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python Audio Handling"
+    },
+    "codecs": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/stringprep.*.pyc",
+            "${libdir}/python3.5/__pycache__/xdrlib.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/_multibytecodec.*.so",
+            "${libdir}/python3.5/lib-dynload/unicodedata.*.so",
+            "${libdir}/python3.5/stringprep.py",
+            "${libdir}/python3.5/xdrlib.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python codec"
+    },
+    "compile": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/compileall.*.pyc",
+            "${libdir}/python3.5/__pycache__/py_compile.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/compileall.py",
+            "${libdir}/python3.5/py_compile.py"
+        ],
+        "rdepends": [
+            "asyncio",
+            "compression",
+            "core",
+            "crypt",
+            "io",
+            "logging",
+            "math",
+            "multiprocessing",
+            "pickle",
+            "shell",
+            "stringold",
+            "threading",
+            "unixadmin"
+        ],
+        "summary": "Python bytecode compilation support"
+    },
+    "compression": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/_compression.*.pyc",
+            "${libdir}/python3.5/__pycache__/bz2.*.pyc",
+            "${libdir}/python3.5/__pycache__/gzip.*.pyc",
+            "${libdir}/python3.5/__pycache__/lzma.*.pyc",
+            "${libdir}/python3.5/__pycache__/tarfile.*.pyc",
+            "${libdir}/python3.5/__pycache__/zipfile.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/_compression.py",
+            "${libdir}/python3.5/bz2.py",
+            "${libdir}/python3.5/gzip.py",
+            "${libdir}/python3.5/lib-dynload/_bz2.*.so",
+            "${libdir}/python3.5/lib-dynload/_lzma.*.so",
+            "${libdir}/python3.5/lib-dynload/zlib.*.so",
+            "${libdir}/python3.5/lzma.py",
+            "${libdir}/python3.5/tarfile.py",
+            "${libdir}/python3.5/zipfile.py"
+        ],
+        "rdepends": [
+            "core",
+            "shell",
+            "unixadmin"
+        ],
+        "summary": "Python high-level compression support"
+    },
+    "core": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/__future__.*.pyc",
+            "${libdir}/python3.5/__pycache__/_bootlocale.*.pyc",
+            "${libdir}/python3.5/__pycache__/_collections_abc.*.pyc",
+            "${libdir}/python3.5/__pycache__/_sitebuiltins.*.pyc",
+            "${libdir}/python3.5/__pycache__/_sysconfigdata.*.pyc",
+            "${libdir}/python3.5/__pycache__/_weakrefset.*.pyc",
+            "${libdir}/python3.5/__pycache__/abc.*.pyc",
+            "${libdir}/python3.5/__pycache__/argparse.*.pyc",
+            "${libdir}/python3.5/__pycache__/ast.*.pyc",
+            "${libdir}/python3.5/__pycache__/bisect.*.pyc",
+            "${libdir}/python3.5/__pycache__/code.*.pyc",
+            "${libdir}/python3.5/__pycache__/codecs.*.pyc",
+            "${libdir}/python3.5/__pycache__/codeop.*.pyc",
+            "${libdir}/python3.5/__pycache__/configparser.*.pyc",
+            "${libdir}/python3.5/__pycache__/contextlib.*.pyc",
+            "${libdir}/python3.5/__pycache__/copy.*.pyc",
+            "${libdir}/python3.5/__pycache__/copyreg.*.pyc",
+            "${libdir}/python3.5/__pycache__/csv.*.pyc",
+            "${libdir}/python3.5/__pycache__/dis.*.pyc",
+            "${libdir}/python3.5/__pycache__/enum.*.pyc",
+            "${libdir}/python3.5/__pycache__/functools.*.pyc",
+            "${libdir}/python3.5/__pycache__/genericpath.*.pyc",
+            "${libdir}/python3.5/__pycache__/getopt.*.pyc",
+            "${libdir}/python3.5/__pycache__/gettext.*.pyc",
+            "${libdir}/python3.5/__pycache__/heapq.*.pyc",
+            "${libdir}/python3.5/__pycache__/imp.*.pyc",
+            "${libdir}/python3.5/__pycache__/inspect.*.pyc",
+            "${libdir}/python3.5/__pycache__/io.*.pyc",
+            "${libdir}/python3.5/__pycache__/keyword.*.pyc",
+            "${libdir}/python3.5/__pycache__/linecache.*.pyc",
+            "${libdir}/python3.5/__pycache__/locale.*.pyc",
+            "${libdir}/python3.5/__pycache__/opcode.*.pyc",
+            "${libdir}/python3.5/__pycache__/operator.*.pyc",
+            "${libdir}/python3.5/__pycache__/optparse.*.pyc",
+            "${libdir}/python3.5/__pycache__/os.*.pyc",
+            "${libdir}/python3.5/__pycache__/platform.*.pyc",
+            "${libdir}/python3.5/__pycache__/posixpath.*.pyc",
+            "${libdir}/python3.5/__pycache__/re.*.pyc",
+            "${libdir}/python3.5/__pycache__/reprlib.*.pyc",
+            "${libdir}/python3.5/__pycache__/rlcompleter.*.pyc",
+            "${libdir}/python3.5/__pycache__/selectors.*.pyc",
+            "${libdir}/python3.5/__pycache__/signal.*.pyc",
+            "${libdir}/python3.5/__pycache__/site.*.pyc",
+            "${libdir}/python3.5/__pycache__/sre_compile.*.pyc",
+            "${libdir}/python3.5/__pycache__/sre_constants.*.pyc",
+            "${libdir}/python3.5/__pycache__/sre_parse.*.pyc",
+            "${libdir}/python3.5/__pycache__/stat.*.pyc",
+            "${libdir}/python3.5/__pycache__/struct.*.pyc",
+            "${libdir}/python3.5/__pycache__/subprocess.*.pyc",
+            "${libdir}/python3.5/__pycache__/symbol.*.pyc",
+            "${libdir}/python3.5/__pycache__/sysconfig.*.pyc",
+            "${libdir}/python3.5/__pycache__/textwrap.*.pyc",
+            "${libdir}/python3.5/__pycache__/threading.*.pyc",
+            "${libdir}/python3.5/__pycache__/token.*.pyc",
+            "${libdir}/python3.5/__pycache__/tokenize.*.pyc",
+            "${libdir}/python3.5/__pycache__/traceback.*.pyc",
+            "${libdir}/python3.5/__pycache__/types.*.pyc",
+            "${libdir}/python3.5/__pycache__/warnings.*.pyc",
+            "${libdir}/python3.5/__pycache__/weakref.*.pyc",
+            "${libdir}/python3.5/collections/__pycache__",
+            "${libdir}/python3.5/collections/__pycache__/abc.*.pyc",
+            "${libdir}/python3.5/encodings/__pycache__",
+            "${libdir}/python3.5/encodings/__pycache__/aliases.*.pyc",
+            "${libdir}/python3.5/encodings/__pycache__/latin_1.*.pyc",
+            "${libdir}/python3.5/encodings/__pycache__/utf_8.*.pyc",
+            "${libdir}/python3.5/importlib/__pycache__",
+            "${libdir}/python3.5/importlib/__pycache__/abc.*.pyc",
+            "${libdir}/python3.5/importlib/__pycache__/machinery.*.pyc",
+            "${libdir}/python3.5/importlib/__pycache__/util.*.pyc"
+        ],
+        "files": [
+            "${bindir}/python*[!-config]",
+            "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
+            "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
+            "${libdir}/python${PYTHON_MAJMIN}/collections",
+            "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
+            "${libdir}/python2.7/sitecustomize.py",
+            "${libdir}/python3.5/UserDict.py",
+            "${libdir}/python3.5/UserList.py",
+            "${libdir}/python3.5/UserString.py",
+            "${libdir}/python3.5/__future__.py",
+            "${libdir}/python3.5/_abcoll.py",
+            "${libdir}/python3.5/_bootlocale.py",
+            "${libdir}/python3.5/_collections_abc.py",
+            "${libdir}/python3.5/_sitebuiltins.py",
+            "${libdir}/python3.5/_sysconfigdata.py",
+            "${libdir}/python3.5/_weakrefset.py",
+            "${libdir}/python3.5/abc.py",
+            "${libdir}/python3.5/argparse.py",
+            "${libdir}/python3.5/ast.py",
+            "${libdir}/python3.5/bisect.py",
+            "${libdir}/python3.5/code.py",
+            "${libdir}/python3.5/codecs.py",
+            "${libdir}/python3.5/codeop.py",
+            "${libdir}/python3.5/collections",
+            "${libdir}/python3.5/collections/abc.py",
+            "${libdir}/python3.5/configparser.py",
+            "${libdir}/python3.5/contextlib.py",
+            "${libdir}/python3.5/copy.py",
+            "${libdir}/python3.5/copyreg.py",
+            "${libdir}/python3.5/csv.py",
+            "${libdir}/python3.5/dis.py",
+            "${libdir}/python3.5/encodings",
+            "${libdir}/python3.5/encodings/aliases.py",
+            "${libdir}/python3.5/encodings/latin_1.py",
+            "${libdir}/python3.5/encodings/utf_8.py",
+            "${libdir}/python3.5/enum.py",
+            "${libdir}/python3.5/functools.py",
+            "${libdir}/python3.5/genericpath.py",
+            "${libdir}/python3.5/getopt.py",
+            "${libdir}/python3.5/gettext.py",
+            "${libdir}/python3.5/heapq.py",
+            "${libdir}/python3.5/imp.py",
+            "${libdir}/python3.5/importlib",
+            "${libdir}/python3.5/importlib/_bootstrap.py",
+            "${libdir}/python3.5/importlib/_bootstrap_external.py",
+            "${libdir}/python3.5/importlib/abc.py",
+            "${libdir}/python3.5/importlib/machinery.py",
+            "${libdir}/python3.5/importlib/util.py",
+            "${libdir}/python3.5/inspect.py",
+            "${libdir}/python3.5/io.py",
+            "${libdir}/python3.5/keyword.py",
+            "${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so",
+            "${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so",
+            "${libdir}/python3.5/lib-dynload/__pycache__/time.*.so",
+            "${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so",
+            "${libdir}/python3.5/lib-dynload/_bisect.*.so",
+            "${libdir}/python3.5/lib-dynload/_csv.*.so",
+            "${libdir}/python3.5/lib-dynload/_heapq.*.so",
+            "${libdir}/python3.5/lib-dynload/_opcode.*.so",
+            "${libdir}/python3.5/lib-dynload/_posixsubprocess.*.so",
+            "${libdir}/python3.5/lib-dynload/_struct.*.so",
+            "${libdir}/python3.5/lib-dynload/array.*.so",
+            "${libdir}/python3.5/lib-dynload/binascii.*.so",
+            "${libdir}/python3.5/lib-dynload/math.*.so",
+            "${libdir}/python3.5/lib-dynload/parser.*.so",
+            "${libdir}/python3.5/lib-dynload/readline.*.so",
+            "${libdir}/python3.5/lib-dynload/select.*.so",
+            "${libdir}/python3.5/lib-dynload/time.*.so",
+            "${libdir}/python3.5/lib-dynload/xreadlines.*.so",
+            "${libdir}/python3.5/linecache.py",
+            "${libdir}/python3.5/locale.py",
+            "${libdir}/python3.5/new.py",
+            "${libdir}/python3.5/opcode.py",
+            "${libdir}/python3.5/operator.py",
+            "${libdir}/python3.5/optparse.py",
+            "${libdir}/python3.5/os.py",
+            "${libdir}/python3.5/platform.py",
+            "${libdir}/python3.5/posixpath.py",
+            "${libdir}/python3.5/re.py",
+            "${libdir}/python3.5/reprlib.py",
+            "${libdir}/python3.5/rlcompleter.py",
+            "${libdir}/python3.5/selectors.py",
+            "${libdir}/python3.5/signal.py",
+            "${libdir}/python3.5/site.py",
+            "${libdir}/python3.5/sre_compile.py",
+            "${libdir}/python3.5/sre_constants.py",
+            "${libdir}/python3.5/sre_parse.py",
+            "${libdir}/python3.5/stat.py",
+            "${libdir}/python3.5/struct.py",
+            "${libdir}/python3.5/subprocess.py",
+            "${libdir}/python3.5/symbol.py",
+            "${libdir}/python3.5/sysconfig.py",
+            "${libdir}/python3.5/textwrap.py",
+            "${libdir}/python3.5/threading.py",
+            "${libdir}/python3.5/token.py",
+            "${libdir}/python3.5/tokenize.py",
+            "${libdir}/python3.5/traceback.py",
+            "${libdir}/python3.5/types.py",
+            "${libdir}/python3.5/warnings.py",
+            "${libdir}/python3.5/weakref.py"
+        ],
+        "rdepends": [],
+        "summary": "Python interpreter and core modules"
+    },
+    "crypt": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/crypt.*.pyc",
+            "${libdir}/python3.5/__pycache__/hashlib.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/crypt.py",
+            "${libdir}/python3.5/hashlib.py",
+            "${libdir}/python3.5/lib-dynload/_crypt.*.so",
+            "${libdir}/python3.5/lib-dynload/_hashlib.*.so",
+            "${libdir}/python3.5/lib-dynload/_sha256.*.so",
+            "${libdir}/python3.5/lib-dynload/_sha512.*.so"
+        ],
+        "rdepends": [
+            "core",
+            "math",
+            "stringold"
+        ],
+        "summary": "Python basic cryptographic and hashing support"
+    },
+    "ctypes": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/ctypes",
+            "${libdir}/python3.5/lib-dynload/_ctypes.*.so",
+            "${libdir}/python3.5/lib-dynload/_ctypes_test.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python C types support"
+    },
+    "curses": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/curses",
+            "${libdir}/python3.5/lib-dynload/_curses.*.so",
+            "${libdir}/python3.5/lib-dynload/_curses_panel.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python curses support"
+    },
+    "datetime": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/_strptime.*.pyc",
+            "${libdir}/python3.5/__pycache__/calendar.*.pyc",
+            "${libdir}/python3.5/__pycache__/datetime.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/_strptime.py",
+            "${libdir}/python3.5/calendar.py",
+            "${libdir}/python3.5/datetime.py",
+            "${libdir}/python3.5/lib-dynload/_datetime.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python calendar and time support"
+    },
+    "db": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/dbm"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python file-based database support"
+    },
+    "debugger": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/bdb.*.pyc",
+            "${libdir}/python3.5/__pycache__/pdb.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/bdb.py",
+            "${libdir}/python3.5/pdb.py"
+        ],
+        "rdepends": [
+            "core",
+            "pprint",
+            "shell",
+            "stringold"
+        ],
+        "summary": "Python debugger"
+    },
+    "dev": {
+        "cached": [],
+        "files": [
+            "${base_libdir}/*.a",
+            "${base_libdir}/*.o",
+            "${bindir}/python*-config",
+            "${datadir}/aclocal",
+            "${datadir}/pkgconfig",
+            "${includedir}",
+            "${libdir}/*.a",
+            "${libdir}/*.la",
+            "${libdir}/*.o",
+            "${libdir}/lib*${SOLIBSDEV}",
+            "${libdir}/pkgconfig",
+            "${libdir}/python3.5/config*/Makefile",
+            "${libdir}/python3.5/config*/Makefile/__pycache__"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python development package"
+    },
+    "difflib": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/difflib.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/difflib.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python helpers for computing deltas between objects"
+    },
+    "distutils": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/distutils"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python Distribution Utilities"
+    },
+    "distutils-staticdev": {
+        "cached": [
+            "${libdir}/python3.5/config/__pycache__/lib*.a"
+        ],
+        "files": [
+            "${libdir}/python3.5/config/lib*.a"
+        ],
+        "rdepends": [
+            "distutils"
+        ],
+        "summary": "Python distribution utilities (static libraries)"
+    },
+    "doctest": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/doctest.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/doctest.py"
+        ],
+        "rdepends": [
+            "core",
+            "debugger",
+            "difflib",
+            "logging",
+            "pprint",
+            "shell",
+            "stringold",
+            "unittest"
+        ],
+        "summary": "Python framework for running examples in docstrings"
+    },
+    "email": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/imaplib.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/email",
+            "${libdir}/python3.5/imaplib.py"
+        ],
+        "rdepends": [
+            "core",
+            "crypt",
+            "datetime",
+            "io",
+            "math",
+            "netclient"
+        ],
+        "summary": "Python email support"
+    },
+    "fcntl": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/fcntl.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python's fcntl interface"
+    },
+    "html": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/formatter.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/formatter.py",
+            "${libdir}/python3.5/html"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python HTML processing support"
+    },
+    "idle": {
+        "cached": [],
+        "files": [
+            "${bindir}/idle",
+            "${libdir}/python3.5/idlelib"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python Integrated Development Environment"
+    },
+    "image": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/colorsys.*.pyc",
+            "${libdir}/python3.5/__pycache__/imghdr.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/colorsys.py",
+            "${libdir}/python3.5/imghdr.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python graphical image handling"
+    },
+    "io": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/_pyio.*.pyc",
+            "${libdir}/python3.5/__pycache__/ipaddress.*.pyc",
+            "${libdir}/python3.5/__pycache__/pipes.*.pyc",
+            "${libdir}/python3.5/__pycache__/socket.*.pyc",
+            "${libdir}/python3.5/__pycache__/ssl.*.pyc",
+            "${libdir}/python3.5/__pycache__/tempfile.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/_pyio.py",
+            "${libdir}/python3.5/ipaddress.py",
+            "${libdir}/python3.5/lib-dynload/_socket.*.so",
+            "${libdir}/python3.5/lib-dynload/_ssl.*.so",
+            "${libdir}/python3.5/lib-dynload/termios.*.so",
+            "${libdir}/python3.5/pipes.py",
+            "${libdir}/python3.5/socket.py",
+            "${libdir}/python3.5/ssl.py",
+            "${libdir}/python3.5/tempfile.py"
+        ],
+        "rdepends": [
+            "compression",
+            "core",
+            "crypt",
+            "math",
+            "netclient",
+            "shell",
+            "unixadmin"
+        ],
+        "summary": "Python low-level I/O"
+    },
+    "json": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/json",
+            "${libdir}/python3.5/lib-dynload/_json.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python JSON support"
+    },
+    "logging": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/logging"
+        ],
+        "rdepends": [
+            "core",
+            "stringold"
+        ],
+        "summary": "Python logging support"
+    },
+    "mailbox": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/mailbox.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/mailbox.py"
+        ],
+        "rdepends": [
+            "core",
+            "crypt",
+            "datetime",
+            "email",
+            "fcntl",
+            "io",
+            "math",
+            "mime",
+            "netclient",
+            "stringold"
+        ],
+        "summary": "Python mailbox format support"
+    },
+    "math": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/random.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/_random.*.so",
+            "${libdir}/python3.5/lib-dynload/cmath.*.so",
+            "${libdir}/python3.5/random.py"
+        ],
+        "rdepends": [
+            "core",
+            "crypt"
+        ],
+        "summary": "Python math support"
+    },
+    "mime": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/quopri.*.pyc",
+            "${libdir}/python3.5/__pycache__/uu.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/quopri.py",
+            "${libdir}/python3.5/uu.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python MIME handling APIs"
+    },
+    "mmap": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/mmap.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python memory-mapped file support"
+    },
+    "modules": {
+        "cached": [],
+        "files": [],
+        "rdepends": [
+            "2to3",
+            "asyncio",
+            "audio",
+            "codecs",
+            "compile",
+            "compression",
+            "core",
+            "crypt",
+            "ctypes",
+            "curses",
+            "datetime",
+            "db",
+            "debugger",
+            "difflib",
+            "distutils",
+            "doctest",
+            "email",
+            "fcntl",
+            "html",
+            "idle",
+            "image",
+            "io",
+            "json",
+            "logging",
+            "mailbox",
+            "math",
+            "mime",
+            "mmap",
+            "multiprocessing",
+            "netclient",
+            "netserver",
+            "numbers",
+            "pickle",
+            "pkgutil",
+            "pprint",
+            "profile",
+            "pydoc",
+            "reprlib",
+            "resource",
+            "shell",
+            "smtpd",
+            "sqlite3",
+            "sqlite3-tests",
+            "stringold",
+            "syslog",
+            "terminal",
+            "tests",
+            "threading",
+            "tkinter",
+            "typing",
+            "unittest",
+            "unixadmin",
+            "xml",
+            "xmlrpc"
+        ],
+        "summary": "All Python modules"
+    },
+    "multiprocessing": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/_multiprocessing.*.so",
+            "${libdir}/python3.5/multiprocessing"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python multiprocessing support"
+    },
+    "netclient": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/base64.*.pyc",
+            "${libdir}/python3.5/__pycache__/ftplib.*.pyc",
+            "${libdir}/python3.5/__pycache__/hmac.*.pyc",
+            "${libdir}/python3.5/__pycache__/mimetypes.*.pyc",
+            "${libdir}/python3.5/__pycache__/nntplib.*.pyc",
+            "${libdir}/python3.5/__pycache__/poplib.*.pyc",
+            "${libdir}/python3.5/__pycache__/smtplib.*.pyc",
+            "${libdir}/python3.5/__pycache__/telnetlib.*.pyc",
+            "${libdir}/python3.5/__pycache__/uuid.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/base64.py",
+            "${libdir}/python3.5/ftplib.py",
+            "${libdir}/python3.5/hmac.py",
+            "${libdir}/python3.5/mimetypes.py",
+            "${libdir}/python3.5/nntplib.py",
+            "${libdir}/python3.5/poplib.py",
+            "${libdir}/python3.5/smtplib.py",
+            "${libdir}/python3.5/telnetlib.py",
+            "${libdir}/python3.5/urllib",
+            "${libdir}/python3.5/urllib/__pycache__",
+            "${libdir}/python3.5/uuid.py"
+        ],
+        "rdepends": [
+            "compression",
+            "core",
+            "crypt",
+            "ctypes",
+            "datetime",
+            "email",
+            "io",
+            "math",
+            "mime",
+            "shell",
+            "stringold",
+            "unixadmin"
+        ],
+        "summary": "Python Internet Protocol clients"
+    },
+    "netserver": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/cgi.*.pyc",
+            "${libdir}/python3.5/__pycache__/socketserver.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/cgi.py",
+            "${libdir}/python3.5/socketserver.py"
+        ],
+        "rdepends": [
+            "compression",
+            "core",
+            "crypt",
+            "datetime",
+            "email",
+            "html",
+            "io",
+            "math",
+            "mime",
+            "netclient",
+            "shell",
+            "stringold",
+            "unixadmin"
+        ],
+        "summary": "Python Internet Protocol servers"
+    },
+    "numbers": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/decimal.*.pyc",
+            "${libdir}/python3.5/__pycache__/fractions.*.pyc",
+            "${libdir}/python3.5/__pycache__/numbers.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/decimal.py",
+            "${libdir}/python3.5/fractions.py",
+            "${libdir}/python3.5/lib-dynload/_decimal.*.so",
+            "${libdir}/python3.5/numbers.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python number APIs"
+    },
+    "pickle": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/_compat_pickle.*.pyc",
+            "${libdir}/python3.5/__pycache__/pickle.*.pyc",
+            "${libdir}/python3.5/__pycache__/pickletools.*.pyc",
+            "${libdir}/python3.5/__pycache__/shelve.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/_compat_pickle.py",
+            "${libdir}/python3.5/lib-dynload/_pickle.*.so",
+            "${libdir}/python3.5/pickle.py",
+            "${libdir}/python3.5/pickletools.py",
+            "${libdir}/python3.5/shelve.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python serialisation/persistence support"
+    },
+    "pkgutil": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/pkgutil.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/pkgutil.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python package extension utility support"
+    },
+    "pprint": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/pprint.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/pprint.py"
+        ],
+        "rdepends": [
+            "core"
+       ], 
+        "summary": "Python pretty-print support"
+    },
+    "profile": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/cProfile.*.pyc",
+            "${libdir}/python3.5/__pycache__/profile.*.pyc",
+            "${libdir}/python3.5/__pycache__/pstats.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/cProfile.py",
+            "${libdir}/python3.5/lib-dynload/_lsprof.*.so",
+            "${libdir}/python3.5/profile.py",
+            "${libdir}/python3.5/pstats.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python basic performance profiling support"
+    },
+    "pydoc": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/pydoc.*.pyc"
+        ],
+        "files": [
+            "${bindir}/pydoc",
+            "${libdir}/python3.5/pydoc.py",
+            "${libdir}/python3.5/pydoc_data"
+        ],
+        "rdepends": [
+            "core",
+            "netclient",
+            "pkgutil"
+        ],
+        "summary": "Python interactive help support"
+    },
+    "reprlib": {
+        "cached": [],
+        "files": [],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python alternate repr() implementation"
+    },
+    "resource": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/resource.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python resource control interface"
+    },
+    "shell": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/cmd.*.pyc",
+            "${libdir}/python3.5/__pycache__/fnmatch.*.pyc",
+            "${libdir}/python3.5/__pycache__/glob.*.pyc",
+            "${libdir}/python3.5/__pycache__/shlex.*.pyc",
+            "${libdir}/python3.5/__pycache__/shutil.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/cmd.py",
+            "${libdir}/python3.5/fnmatch.py",
+            "${libdir}/python3.5/glob.py",
+            "${libdir}/python3.5/shlex.py",
+            "${libdir}/python3.5/shutil.py"
+        ],
+        "rdepends": [
+            "compression",
+            "core",
+            "stringold",
+            "unixadmin"
+        ],
+        "summary": "Python shell-like functionality"
+    },
+    "smtpd": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/asynchat.*.pyc",
+            "${libdir}/python3.5/__pycache__/asyncore.*.pyc",
+            "${libdir}/python3.5/__pycache__/smtpd.*.pyc"
+        ],
+        "files": [
+            "${bindir}/smtpd.py",
+            "${libdir}/python3.5/asynchat.py",
+            "${libdir}/python3.5/asyncore.py",
+            "${libdir}/python3.5/smtpd.py"
+        ],
+        "rdepends": [
+            "core",
+            "crypt",
+            "datetime",
+            "email",
+            "io",
+            "math",
+            "mime",
+            "netclient",
+            "stringold"
+        ],
+        "summary": "Python Simple Mail Transport Daemon"
+    },
+    "sqlite3": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/_sqlite3.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python Sqlite3 database support"
+    },
+    "sqlite3-tests": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/sqlite3/test"
+        ],
+        "rdepends": [
+            "core",
+            "tests"
+        ],
+        "summary": "Python Sqlite3 database support tests"
+    },
+    "stringold": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/string.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/string.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python string APIs [deprecated]"
+    },
+    "syslog": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/syslog.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python syslog interface"
+    },
+    "terminal": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/pty.*.pyc",
+            "${libdir}/python3.5/__pycache__/tty.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/pty.py",
+            "${libdir}/python3.5/tty.py"
+        ],
+        "rdepends": [
+            "core",
+            "io"
+        ],
+        "summary": "Python terminal controlling support"
+    },
+    "tests": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/test"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python tests"
+    },
+    "threading": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/_dummy_thread.*.pyc",
+            "${libdir}/python3.5/__pycache__/_threading_local.*.pyc",
+            "${libdir}/python3.5/__pycache__/dummy_threading.*.pyc",
+            "${libdir}/python3.5/__pycache__/queue.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/_dummy_thread.py",
+            "${libdir}/python3.5/_threading_local.py",
+            "${libdir}/python3.5/dummy_threading.py",
+            "${libdir}/python3.5/queue.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python threading & synchronization support"
+    },
+    "tkinter": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/tkinter"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python Tcl/Tk bindings"
+    },
+    "typing": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/typing.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/typing.py"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python typing support"
+    },
+    "unittest": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/unittest",
+            "${libdir}/python3.5/unittest/",
+            "${libdir}/python3.5/unittest/__pycache__"
+        ],
+        "rdepends": [
+            "core",
+            "difflib",
+            "logging",
+            "pprint",
+            "shell",
+            "stringold"
+        ],
+        "summary": "Python unit testing framework"
+    },
+    "unixadmin": {
+        "cached": [
+            "${libdir}/python3.5/__pycache__/getpass.*.pyc"
+        ],
+        "files": [
+            "${libdir}/python3.5/getpass.py",
+            "${libdir}/python3.5/lib-dynload/grp.*.so",
+            "${libdir}/python3.5/lib-dynload/nis.*.so"
+        ],
+        "rdepends": [
+            "core",
+            "io"
+        ],
+        "summary": "Python Unix administration support"
+    },
+    "xml": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/_elementtree.*.so",
+            "${libdir}/python3.5/lib-dynload/pyexpat.*.so",
+            "${libdir}/python3.5/xml"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python basic XML support"
+    },
+    "xmlrpc": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/xmlrpc",
+            "${libdir}/python3.5/xmlrpc/__pycache__"
+        ],
+        "rdepends": [
+            "core",
+            "xml"
+        ],
+        "summary": "Python XML-RPC support"
+    }
+}
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 13df12fe566..2314be818f1 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -1,5 +1,5 @@
 require recipes-devtools/python/python.inc
-
+ 
 DEPENDS = "python3-native libffi bzip2 db gdbm openssl readline sqlite3 zlib virtual/libintl xz"
 PR = "${INC_PR}.0"
 PYTHON_MAJMIN = "3.5"
@@ -193,11 +193,10 @@ py_package_preprocess () {
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
 }
 
-require python-${PYTHON_MAJMIN}-manifest.inc
+#require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
 RPROVIDES_${PN}-modules = "${PN}"
-RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-crypt = "openssl"
 RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
@@ -216,7 +215,7 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
-RDEPENDS_${PN}-misc += "${PN}-core ${PN}-email ${PN}-codecs ${PN}-textutils ${PN}-argparse"
+RDEPENDS_${PN}-misc += "${PN}-core ${PN}-email ${PN}-codecs"
 RDEPENDS_${PN}-modules += "${PN}-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 
@@ -225,3 +224,86 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 BBCLASSEXTEND = "nativesdk"
+
+RPROVIDES_${PN} += "${PN}-modules"
+    
+# We dont want bytecode precompiled .py files (.pyc's) by default
+# but the user may set it on their own conf
+            
+INCLUDE_PYCS ?= "1"
+
+python(){
+
+    pythondir = d.getVar('THISDIR',True)
+
+    # Read JSON manifest
+    import json
+    with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
+        python_manifest=json.load(manifest_file)
+        
+    include_pycs = d.getVar('INCLUDE_PYCS')
+
+    # We're gonna need to add packages, and modify DYNAMIC_PACKAGES
+    # To avoid errors when building a certain package, e.g. python-foo
+    dynpackages = d.getVar('PACKAGES_DYNAMIC').split()
+    packages = d.getVar('PACKAGES').split()
+    pn = d.getVar('PN')
+
+    newpackages=[]
+    for key in python_manifest:
+        pypackage= pn + '-' + key
+
+        if pypackage not in packages:
+            # We need to prepend, otherwise python-misc gets everything
+            # so we use a new variable
+            newpackages.append(pypackage)
+        if pypackage not in dynpackages:
+            dynpackages.append(pypackage)
+
+        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
+        d.setVar('FILES_' + pypackage, '')
+        for value in python_manifest[key]['files']:
+            d.appendVar('FILES_' + pypackage, value + ' ')
+
+	# Add cached files 
+        if include_pycs == "1":
+            for value in python_manifest[key]['cached']:
+                    d.appendVar('FILES_' + pypackage, value)
+
+        d.setVar('RDEPENDS_' + pypackage, '')
+        for value in python_manifest[key]['rdepends']:
+            # Make it work with or without $PN
+            if '${PN}' in value:
+                value=value.split('-')[1]
+            d.appendVar('RDEPENDS_' + pypackage, pn + '-' + value + ' ')
+        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
+
+    # We need to ensure staticdev packages match for files first so we sort in reverse
+    newpackages.sort(reverse=True)
+    # Prepending so to avoid python-misc getting everything
+    packages = newpackages + packages
+    d.setVar('PACKAGES', ' '.join(packages))
+    d.setVar('PACKAGES_DYNAMIC', ' '.join(dynpackages))
+    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
+}
+
+
+
+
+# Files needed to create a new manifest
+SRC_URI += "file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json"
+
+do_create_manifest() {
+
+cd ${WORKDIR}
+# This needs to be executed by python-native and NOT by HOST's python
+nativepython3 create_manifest3.py
+cp python3-manifest.json.new ${THISDIR}/python/python3-manifest.json
+}                   
+
+# bitbake python -c create_manifest
+addtask do_create_manifest
+
+# Make sure we have native python ready when we create a new manifest
+do_create_manifest[depends] += "python3:do_prepare_recipe_sysroot"
+do_create_manifest[depends] += "python3:do_patch"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
deleted file mode 100755
index 6352f8f1207..00000000000
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ /dev/null
@@ -1,433 +0,0 @@
-#!/usr/bin/env python
-
-# generate Python Manifest for the OpenEmbedded build system
-# (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# (C) 2007 Jeremy Laine
-# licensed under MIT, see COPYING.MIT
-#
-# June 22, 2011 -- Mark Hatle <mark.hatle@windriver.com>
-#  * Updated to no longer generate special -dbg package, instead use the
-#    single system -dbg
-#  * Update version with ".1" to indicate this change
-#
-# 2014 Khem Raj <raj.khem@gmail.com>
-# Added python3 support
-#
-# February 26, 2017 -- Ming Liu <peter.x.liu@external.atlascopco.com>
-# * Updated to support generating manifest for native python3
-
-import os
-import sys
-import time
-import argparse
-
-VERSION = "3.5.0"
-
-__author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
-__version__ = "20140131"
-
-class MakefileMaker:
-
-    def __init__( self, outfile, isNative ):
-        """initialize"""
-        self.packages = {}
-        self.excluded_pkgs = []
-        self.targetPrefix = "${libdir}/python%s/" % VERSION[:3]
-        self.isNative = isNative
-        self.output = outfile
-        self.out( """
-# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '%s%s' Version %s (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-""" % ( sys.argv[0], ' --native' if isNative else '', __version__ ) )
-
-    #
-    # helper functions
-    #
-
-    def out( self, data ):
-        """print a line to the output file"""
-        self.output.write( "%s\n" % data )
-
-    def setPrefix( self, targetPrefix ):
-        """set a file prefix for addPackage files"""
-        self.targetPrefix = targetPrefix
-
-    def doProlog( self ):
-        self.out( """ """ )
-        self.out( "" )
-
-    def addPackage( self, name, description, dependencies, filenames, mod_exclude = False ):
-        """add a package to the Makefile"""
-        if type( filenames ) == type( "" ):
-            filenames = filenames.split()
-        fullFilenames = []
-        for filename in filenames:
-            if filename[0] != "$":
-                fullFilenames.append( "%s%s" % ( self.targetPrefix, filename ) )
-                fullFilenames.append( "%s%s" % ( self.targetPrefix,
-                                                 self.pycachePath( filename ) ) )
-            else:
-                fullFilenames.append( filename )
-        if mod_exclude:
-            self.excluded_pkgs.append( name )
-        self.packages[name] = description, dependencies, fullFilenames
-
-    def pycachePath( self, filename ):
-        dirname = os.path.dirname( filename )
-        basename = os.path.basename( filename )
-        if '.' in basename:
-            return os.path.join( dirname, '__pycache__', basename )
-        else:
-            return os.path.join( dirname, basename, '__pycache__' )
-
-    def doBody( self ):
-        """generate body of Makefile"""
-
-        global VERSION
-
-        #
-        # generate rprovides line for native
-        #
-
-        if self.isNative:
-            pkglist = []
-            for name in ['${PN}-modules'] + sorted(self.packages):
-                pkglist.append('%s-native' % name.replace('${PN}', 'python3'))
-
-            self.out('RPROVIDES += "%s"' % " ".join(pkglist))
-            return
-
-        #
-        # generate provides line
-        #
-
-        provideLine = 'PROVIDES+="'
-        for name in sorted(self.packages):
-            provideLine += "%s " % name
-        provideLine += '"'
-
-        self.out( provideLine )
-        self.out( "" )
-
-        #
-        # generate package line
-        #
-
-        packageLine = 'PACKAGES="${PN}-dbg '
-        for name in sorted(self.packages):
-            if name.startswith("${PN}-distutils"):
-                if name == "${PN}-distutils":
-                    packageLine += "%s-staticdev %s " % (name, name)
-            elif name != '${PN}-dbg':
-                packageLine += "%s " % name
-        packageLine += '${PN}-modules"'
-
-        self.out( packageLine )
-        self.out( "" )
-
-        #
-        # generate package variables
-        #
-
-        for name, data in sorted(self.packages.items()):
-            desc, deps, files = data
-
-            #
-            # write out the description, revision and dependencies
-            #
-            self.out( 'SUMMARY_%s="%s"' % ( name, desc ) )
-            self.out( 'RDEPENDS_%s="%s"' % ( name, deps ) )
-
-            line = 'FILES_%s="' % name
-
-            #
-            # check which directories to make in the temporary directory
-            #
-
-            dirset = {} # if python had a set-datatype this would be sufficient. for now, we're using a dict instead.
-            for target in files:
-                dirset[os.path.dirname( target )] = True
-
-            #
-            # generate which files to copy for the target (-dfR because whole directories are also allowed)
-            #
-
-            for target in files:
-                line += "%s " % target
-
-            line += '"'
-            self.out( line )
-            self.out( "" )
-
-        self.out( 'SUMMARY_${PN}-modules="All Python modules"' )
-        line = 'RDEPENDS_${PN}-modules="'
-
-        for name, data in sorted(self.packages.items()):
-            if name not in ['${PN}-dev', '${PN}-distutils-staticdev'] and name not in self.excluded_pkgs:
-                line += "%s " % name
-
-        self.out( "%s \"" % line )
-        self.out( 'ALLOW_EMPTY_${PN}-modules = "1"' )
-
-    def doEpilog( self ):
-        self.out( """""" )
-        self.out( "" )
-
-    def make( self ):
-        self.doProlog()
-        self.doBody()
-        self.doEpilog()
-
-if __name__ == "__main__":
-    parser = argparse.ArgumentParser( description='generate python3 manifest' )
-    parser.add_argument( '-n', '--native', help='generate manifest for native python3', action='store_true' )
-    parser.add_argument( 'outfile', metavar='OUTPUT_FILE', nargs='?', default='', help='Output file (defaults to stdout)' )
-    args = parser.parse_args()
-
-    if args.outfile:
-        try:
-            os.unlink( args.outfile )
-        except Exception:
-            sys.exc_clear()
-        outfile = open( args.outfile, "w" )
-    else:
-        outfile = sys.stdout
-
-    m = MakefileMaker( outfile, args.native )
-
-    # Add packages here. Only specify dlopen-style library dependencies here, no ldd-style dependencies!
-    # Parameters: revision, name, description, dependencies, filenames
-    #
-
-    m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math",
-    "__future__.* _abcoll.* abc.* ast.* copy.* copyreg.* configparser.* " +
-    "genericpath.* getopt.* linecache.* new.* " +
-    "os.* posixpath.* struct.* " +
-    "warnings.* site.* stat.* " +
-    "UserDict.* UserList.* UserString.* " +
-    "lib-dynload/binascii.*.so lib-dynload/_struct.*.so lib-dynload/time.*.so " +
-    "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* "  + 
-    "_weakrefset.* sysconfig.* _sysconfigdata.* " +
-    "${includedir}/python${PYTHON_BINABI}/pyconfig*.h " +
-    "${libdir}/python${PYTHON_MAJMIN}/collections " +
-    "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* " +
-    "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* " +
-    "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
-
-    m.addPackage( "${PN}-dev", "Python development package", "${PN}-core",
-    "${includedir} " +
-    "${libdir}/lib*${SOLIBSDEV} " +
-    "${libdir}/*.la " +
-    "${libdir}/*.a " +
-    "${libdir}/*.o " +
-    "${libdir}/pkgconfig " +
-    "${base_libdir}/*.a " +
-    "${base_libdir}/*.o " +
-    "${datadir}/aclocal " +
-    "${datadir}/pkgconfig " +
-    "config*/Makefile ")
-
-    m.addPackage( "${PN}-2to3", "Python automated Python 2 to 3 code translator", "${PN}-core",
-    "lib2to3" ) # package
-
-    m.addPackage( "${PN}-idle", "Python Integrated Development Environment", "${PN}-core ${PN}-tkinter",
-    "${bindir}/idle idlelib" ) # package
-
-    m.addPackage( "${PN}-pydoc", "Python interactive help support", "${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re",
-    "${bindir}/pydoc pydoc.* pydoc_data" )
-
-    m.addPackage( "${PN}-smtpd", "Python Simple Mail Transport Daemon", "${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime",
-    "${bindir}/smtpd.* smtpd.*" )
-
-    m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
-    "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.*.so lib-dynload/audioop.*.so audiodev.* sunaudio.* sunau.* toaiff.*" )
-
-    m.addPackage( "${PN}-argparse", "Python command line argument parser", "${PN}-core ${PN}-codecs ${PN}-textutils",
-    "argparse.*" )
-
-    m.addPackage( "${PN}-asyncio", "Python Asynchronous I/O, event loop, coroutines and tasks", "${PN}-core",
-    "asyncio" )
-
-    m.addPackage( "${PN}-codecs", "Python codecs, encodings & i18n support", "${PN}-core ${PN}-lang",
-    "codecs.* encodings gettext.* locale.* lib-dynload/_locale.*.so lib-dynload/_codecs* lib-dynload/_multibytecodec.*.so lib-dynload/unicodedata.*.so stringprep.* xdrlib.*" )
-
-    m.addPackage( "${PN}-compile", "Python bytecode compilation support", "${PN}-core",
-    "py_compile.* compileall.*" )
-
-    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell",
-    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so lib-dynload/zlib.*.so bz2.py lzma.py _compression.py" )
-
-    m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
-    "hashlib.* md5.* sha.* lib-dynload/crypt.*.so lib-dynload/_hashlib.*.so lib-dynload/_sha256.*.so lib-dynload/_sha512.*.so" )
-
-    m.addPackage( "${PN}-textutils", "Python option parsing, text wrapping and CSV support", "${PN}-core ${PN}-io ${PN}-re ${PN}-stringold",
-    "lib-dynload/_csv.*.so csv.* optparse.* textwrap.*" )
-
-    m.addPackage( "${PN}-curses", "Python curses support", "${PN}-core",
-    "curses lib-dynload/_curses.*.so lib-dynload/_curses_panel.*.so" ) # directory + low level module
-
-    m.addPackage( "${PN}-ctypes", "Python C types support", "${PN}-core ${PN}-subprocess",
-    "ctypes lib-dynload/_ctypes.*.so lib-dynload/_ctypes_test.*.so" ) # directory + low level module
-
-    m.addPackage( "${PN}-datetime", "Python calendar and time support", "${PN}-core ${PN}-codecs",
-    "_strptime.* calendar.* datetime.* lib-dynload/_datetime.*.so" )
-
-    m.addPackage( "${PN}-db", "Python file-based database support", "${PN}-core",
-    "anydbm.* dumbdbm.* whichdb.* dbm lib-dynload/_dbm.*.so" )
-
-    m.addPackage( "${PN}-debugger", "Python debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib ${PN}-pkgutil",
-    "bdb.* pdb.*" )
-
-    m.addPackage( "${PN}-difflib", "Python helpers for computing deltas between objects", "${PN}-lang ${PN}-re",
-    "difflib.*" )
-
-    m.addPackage( "${PN}-distutils-staticdev", "Python distribution utilities (static libraries)", "${PN}-distutils",
-    "config/lib*.a" ) # package
-
-    m.addPackage( "${PN}-distutils", "Python Distribution Utilities", "${PN}-core ${PN}-email",
-    "config distutils" ) # package
-
-    m.addPackage( "${PN}-doctest", "Python framework for running examples in docstrings", "${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib",
-    "doctest.*" )
-
-    m.addPackage( "${PN}-email", "Python email support", "${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
-    "imaplib.* email" ) # package
-
-    m.addPackage( "${PN}-enum", "Python support for enumerations", "${PN}-core",
-    "enum.*" )
-
-    m.addPackage( "${PN}-fcntl", "Python's fcntl interface", "${PN}-core",
-    "lib-dynload/fcntl.*.so" )
-
-    m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
-    "formatter.* htmlentitydefs.* html htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
-
-    m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core ${PN}-lang",
-    "importlib imp.*" )
-
-    m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
-    "lib-dynload/_gdbm.*.so" )
-
-    m.addPackage( "${PN}-image", "Python graphical image handling", "${PN}-core",
-    "colorsys.* imghdr.* lib-dynload/imageop.*.so lib-dynload/rgbimg.*.so" )
-
-    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math",
-    "lib-dynload/_socket.*.so lib-dynload/_io.*.so lib-dynload/_ssl.*.so lib-dynload/select.*.so lib-dynload/termios.*.so lib-dynload/cStringIO.*.so " +
-    "ipaddress.* pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
-
-    m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-math ${PN}-re",
-    "json lib-dynload/_json.*.so" ) # package
-
-    m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core ${PN}-importlib",
-    "lib-dynload/_bisect.*.so lib-dynload/_collections.*.so lib-dynload/_heapq.*.so lib-dynload/_weakref.*.so lib-dynload/_functools.*.so " +
-    "lib-dynload/array.*.so lib-dynload/itertools.*.so lib-dynload/operator.*.so lib-dynload/parser.*.so " +
-    "atexit.* bisect.* code.* codeop.* collections.* _collections_abc.* contextlib.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* operator.* symbol.* repr.* token.* " +
-    "tokenize.* traceback.* weakref.*" )
-
-    m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
-    "logging" ) # package
-
-    m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
-    "mailbox.*" )
-
-    m.addPackage( "${PN}-math", "Python math support", "${PN}-core ${PN}-crypt",
-    "lib-dynload/cmath.*.so lib-dynload/math.*.so lib-dynload/_random.*.so random.* sets.*" )
-
-    m.addPackage( "${PN}-mime", "Python MIME handling APIs", "${PN}-core ${PN}-io",
-    "mimetools.* uu.* quopri.* rfc822.* MimeWriter.*" )
-
-    m.addPackage( "${PN}-mmap", "Python memory-mapped file support", "${PN}-core ${PN}-io",
-    "lib-dynload/mmap.*.so " )
-
-    m.addPackage( "${PN}-multiprocessing", "Python multiprocessing support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap",
-    "lib-dynload/_multiprocessing.*.so multiprocessing" ) # package
-
-    m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-argparse ${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime ${PN}-html",
-    "*Cookie*.* " +
-    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* http* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib  uuid.* rfc822.* mimetools.*" )
-
-    m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading",
-    "cgi.* socketserver.* *HTTPServer.* SocketServer.*" )
-
-    m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re",
-    "decimal.* fractions.* numbers.*" )
-
-    m.addPackage( "${PN}-pickle", "Python serialisation/persistence support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
-    "_compat_pickle.* pickle.* shelve.* lib-dynload/cPickle.*.so pickletools.*" )
-
-    m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
-    "pkgutil.*")
-
-    m.addPackage( "${PN}-pprint", "Python pretty-print support", "${PN}-core ${PN}-io",
-    "pprint.*" )
-
-    m.addPackage( "${PN}-profile", "Python basic performance profiling support", "${PN}-core ${PN}-textutils",
-    "profile.* pstats.* cProfile.* lib-dynload/_lsprof.*.so" )
-
-    m.addPackage( "${PN}-re", "Python Regular Expression APIs", "${PN}-core",
-    "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) # _sre is builtin
-
-    m.addPackage( "${PN}-readline", "Python readline support", "${PN}-core",
-    "lib-dynload/readline.*.so rlcompleter.*" )
-
-    m.addPackage( "${PN}-reprlib", "Python alternate repr() implementation", "${PN}-core",
-    "reprlib.py" )
-
-    m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
-    "lib-dynload/resource.*.so" )
-
-    m.addPackage( "${PN}-selectors", "Python High-level I/O multiplexing", "${PN}-core",
-    "selectors.*" )
-
-    m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re ${PN}-compression",
-    "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
-
-    m.addPackage( "${PN}-signal", "Python set handlers for asynchronous events support", "${PN}-core ${PN}-enum",
-    "signal.*" )
-
-    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-threading ${PN}-signal ${PN}-selectors",
-    "subprocess.* lib-dynload/_posixsubprocess.*.so" )
-
-    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading",
-    "lib-dynload/_sqlite3.*.so sqlite3/dbapi2.* sqlite3/__init__.* sqlite3/dump.*" )
-
-    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3 database support tests", "${PN}-core ${PN}-sqlite3",
-    "sqlite3/test" )
-
-    m.addPackage( "${PN}-stringold", "Python string APIs [deprecated]", "${PN}-core ${PN}-re",
-    "lib-dynload/strop.*.so string.* stringold.*" )
-
-    m.addPackage( "${PN}-syslog", "Python syslog interface", "${PN}-core",
-    "lib-dynload/syslog.*.so" )
-
-    m.addPackage( "${PN}-terminal", "Python terminal controlling support", "${PN}-core ${PN}-io",
-    "pty.* tty.*" )
-
-    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core ${PN}-compression",
-    "test", True ) # package
-
-    m.addPackage( "${PN}-threading", "Python threading & synchronization support", "${PN}-core ${PN}-lang",
-    "_threading_local.* dummy_thread.* dummy_threading.* mutex.* threading.* queue.*" )
-
-    m.addPackage( "${PN}-tkinter", "Python Tcl/Tk bindings", "${PN}-core",
-    "lib-dynload/_tkinter.*.so lib-tk tkinter" ) # package
-
-    m.addPackage( "${PN}-typing", "Python typing support", "${PN}-core",
-    "typing.*" )
-
-    m.addPackage( "${PN}-unittest", "Python unit testing framework", "${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell",
-    "unittest/" )
-
-    m.addPackage( "${PN}-unixadmin", "Python Unix administration support", "${PN}-core",
-    "lib-dynload/nis.*.so lib-dynload/grp.*.so lib-dynload/pwd.*.so getpass.*" )
-
-    m.addPackage( "${PN}-xml", "Python basic XML support", "${PN}-core ${PN}-re",
-    "lib-dynload/_elementtree.*.so lib-dynload/pyexpat.*.so xml xmllib.*" ) # package
-
-    m.addPackage( "${PN}-xmlrpc", "Python XML-RPC support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang ${PN}-pydoc",
-    "xmlrpclib.* SimpleXMLRPCServer.* DocXMLRPCServer.* xmlrpc" )
-
-    m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
-    "mailbox.*" )
-
-    m.make()
-- 
2.12.3


