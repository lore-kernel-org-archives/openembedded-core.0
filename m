Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D905B78479
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 10:24:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 03:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,387,1498546800"; d="scan'208";a="1183807584"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2017 03:24:27 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 03:24:23 -0700
Message-Id: <d19886da974978d84a0522b970503f74ad7ec382.1502965191.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502965191.git.alejandro.hernandez@linux.intel.com>
References: <cover.1502965191.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/3] python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Thu, 17 Aug 2017 10:24:27 -0000

The reason we have a manifest file for python is that our goal is to
keep python-core as small as posible and add other python packages only
when the user needs them, hence why we split upstream python into several
packages.

Although our manifest file has several issues:
 - Its unorganized and hard to read and understand it for an average
   human being.
 - Git throws an error every single time  a patch to the manifest 
   is submitted.
 - It changes or may change with every release of python, its impossible
   to know if the required files for a certain package have changed
   (it could have more or less dependencies), the only way of doing so
   would be to install and test them all one by one, and even then we
   wouldnt know if they require less dependencies, we would just know if
   an extra dependency is required since it would complain, lets face it,
   this isnt feasible.
 - The same thing happens for new packages, if someone wants to add a
   new package, its dependencies need to be checked manually one by one.

This patch fixes those issues, while adding some additional features.

Features/Fixes:

 - A new manifest format is used (JSON), easy to read and understand.
   This file is parsed by the python recipe and python packages read
   from here are passed directly to bitbake during parsing time.
 - It provides an automatic manifest creation task (explained below),
   which automagically checks for every package dependencies and adds
   them to the new manifest, hence we will have on each package exactly
   what that package needs to be run, providing finer granularity.
 - Dependencies are also checked automagically for new packages (explained below).
 - Fixes the manifest in the following ways:
   * python-core should be base and all packages should depend on it ,
     fixes lang, string, codecs, etc.
   * Fixes packages with repeated files (e.g. bssdb and db, or
     netclient and mime, and many others).
 - Removes the manifest from the python-native recipe (Why was it there
   in the first place?, native recipes do not get split).
 - It creates a solution for users that want precompiled bytecode files
   (*.pyc) INCLUDE_PYCS = "1" can be set by the user on their local.conf to
   include such files, some argument they get faster boot time, even when the
   files would be created on their first run?, but they also sometimes give a
   magic number error and take up space, so we leave it to the user to
   decide if they want them or not.
 - Fixes python-core for dependencies, e.g.
   When python is run on an image, it TRIES to import everything it needs,
   but it doesnt necessarily fails when it doesnt find something, so even if
   we didnt know, we had errors like (trimmed on purpose):
   # trying /usr/lib/python2.7/_locale.so
   # trying /usr/lib/python2.7/lib-dynload/_locale.so
   # trying /usr/lib/python2.7/_sysconfigdata.so

   while it didnt complain about _locale it should have imported it,
   after creating a new manifest with the automated script we get:

   # trying /usr/lib/python2.7/lib-dynload/_locale.so
   dlopen("/usr/lib/python2.7/lib-dynload/_locale.so", 2);
   import _locale # dynamically loaded from /usr/lib/python2.7/lib-dynload/_locale.so

How to use (after a new release of python, or maybe before every OE
release):
 - A new task called create_manifest was added to the python package,
   which may be invoked via:

 $ bitbake python -c create_manifest

 This task runs a script on native python on our HOST system, this
 script is called create_manifest.py and it in a very simplistic way
 it does the following:

 1. Reads the JSON manifest file and creates a dictionary data structure
    with all of our python packages, their FILES, RDEPENDS and SUMMARY.
 2. Loops through all of them and runs them asynchronously, determining
    every dependency that they have.
 3. These module dependencies are then handled, to be able to know which
    packages contain those files and which should RDEPEND on one another.
 4. The data structure that comes out of this, is then used to create a new
    manifest file which is automatically copied onto the user's python
    directory replacing the old one.

 Create_manifest script features:
 - Handles modules which dont exist anymore (new release for example).
 - Handles modules that are builtin.
 - Deals with modules which were not compiled (e.g. bsddb or ossaudiodev)
 - This method works for both python modules and shared libraries used
   by python.
 - Deals with packages which include folders.
 - Deals with packages which include FILES with a wildcard.
 - The manifest can be constructed on a multilib environment as well.

How to add a new package:
 - If a user wants to add a new package all that has to be done is
   modify the python2-manifest.json file, and add the required file(s)
   to the FILES list, the script should handle all the rest.
   Real example:
   "webbrowser": {
       "files": ["${libdir}/python2.7/lib-dynload/webbrowser.py"],
       "rdepends": [],
       "summary": "Python Web browser support"}

 Run bitbake python -c create_manifest and the resulting manifest
 should  be completed after a few seconds, showing something like:
   "webbrowser": {
      "files": ["${libdir}/python2.7/webbrowser.py"],
      "rdepends": ["core","fcntl","io","pickle","shell","subprocess"],
      "summary": "Python Web browser support"}

Known errors/issues:
 - Some special packages are handled differently: core, misc,
   modules,dev, staticdev.
   All these should be handled manually, because they either include
   binaries, static libraries, include files, etc.
   Specifically static libraries are not not supported by this method
   and have to be handled by the user.
 - After the manifest files changes, if not building from a clean
   environment bitbake throws an error complaining about the
   basehash from the package task mismatching (which makes sense, since
   the JSON file was parsed and it changed the PACKAGES variable),
   this can be solved by either building on a clean environment or by
   deleting the cache file located at tmp/cache/default-glibc/...
   This error should only happen once and when a the manifest file
   changed.
 - The change should be transparent to the user, other than the fact
   that now we CANT build python-foo (it was pretty dumb anyway, since
   what building python-foo actually did was building the whole python
   package anyway), but doing IMAGE_INSTALL_append = " python-foo"
   would create an image with the requested package with no issues.

[YOCTO #11510] [YOCTO #11694] [YOCTO #11695]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/python-2.7-manifest.inc                 |  287 ------
 .../python/python-native_2.7.13.bb                 |    3 -
 .../python/python/create_manifest2.py              |  274 ++++++
 .../python/python/get_module_deps2.py              |  110 +++
 .../python/python/python2-manifest.json            | 1033 ++++++++++++++++++++
 .../python/python/sitecustomize.py                 |    8 -
 meta/recipes-devtools/python/python_2.7.13.bb      |   82 +-
 scripts/contrib/python/generate-manifest-2.7.py    |  418 --------
 8 files changed, 1497 insertions(+), 718 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-2.7-manifest.inc
 create mode 100644 meta/recipes-devtools/python/python/create_manifest2.py
 create mode 100644 meta/recipes-devtools/python/python/get_module_deps2.py
 create mode 100644 meta/recipes-devtools/python/python/python2-manifest.json
 delete mode 100755 scripts/contrib/python/generate-manifest-2.7.py

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
deleted file mode 100644
index 7ed254bbd64..00000000000
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ /dev/null
@@ -1,287 +0,0 @@
-
-# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-
- 
-
-PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
-
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
-
-SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
-RDEPENDS_${PN}-2to3="${PN}-core"
-FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python2.7/lib2to3 "
-
-SUMMARY_${PN}-argparse="Python command line argument parser"
-RDEPENDS_${PN}-argparse="${PN}-core ${PN}-codecs ${PN}-textutils"
-FILES_${PN}-argparse="${libdir}/python2.7/argparse.* "
-
-SUMMARY_${PN}-audio="Python Audio Handling"
-RDEPENDS_${PN}-audio="${PN}-core"
-FILES_${PN}-audio="${libdir}/python2.7/wave.* ${libdir}/python2.7/chunk.* ${libdir}/python2.7/sndhdr.* ${libdir}/python2.7/lib-dynload/ossaudiodev.so ${libdir}/python2.7/lib-dynload/audioop.so ${libdir}/python2.7/audiodev.* ${libdir}/python2.7/sunaudio.* ${libdir}/python2.7/sunau.* ${libdir}/python2.7/toaiff.* "
-
-SUMMARY_${PN}-bsddb="Python bindings for the Berkeley Database"
-RDEPENDS_${PN}-bsddb="${PN}-core"
-FILES_${PN}-bsddb="${libdir}/python2.7/bsddb ${libdir}/python2.7/lib-dynload/_bsddb.so "
-
-SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
-RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
-FILES_${PN}-codecs="${libdir}/python2.7/codecs.* ${libdir}/python2.7/encodings ${libdir}/python2.7/gettext.* ${libdir}/python2.7/locale.* ${libdir}/python2.7/lib-dynload/_locale.so ${libdir}/python2.7/lib-dynload/_codecs* ${libdir}/python2.7/lib-dynload/_multibytecodec.so ${libdir}/python2.7/lib-dynload/unicodedata.so ${libdir}/python2.7/stringprep.* ${libdir}/python2.7/xdrlib.* "
-
-SUMMARY_${PN}-compile="Python bytecode compilation support"
-RDEPENDS_${PN}-compile="${PN}-core"
-FILES_${PN}-compile="${libdir}/python2.7/py_compile.* ${libdir}/python2.7/compileall.* "
-
-SUMMARY_${PN}-compiler="Python compiler support"
-RDEPENDS_${PN}-compiler="${PN}-core"
-FILES_${PN}-compiler="${libdir}/python2.7/compiler "
-
-SUMMARY_${PN}-compression="Python high-level compression support"
-RDEPENDS_${PN}-compression="${PN}-core ${PN}-zlib"
-FILES_${PN}-compression="${libdir}/python2.7/gzip.* ${libdir}/python2.7/zipfile.* ${libdir}/python2.7/tarfile.* ${libdir}/python2.7/lib-dynload/bz2.so "
-
-SUMMARY_${PN}-contextlib="Python utilities for with-statementcontexts."
-RDEPENDS_${PN}-contextlib="${PN}-core"
-FILES_${PN}-contextlib="${libdir}/python${PYTHON_MAJMIN}/contextlib.* "
-
-SUMMARY_${PN}-core="Python interpreter and core modules"
-RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
-FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/ast.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/_sysconfigdata.* ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
-
-SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
-RDEPENDS_${PN}-crypt="${PN}-core"
-FILES_${PN}-crypt="${libdir}/python2.7/hashlib.* ${libdir}/python2.7/md5.* ${libdir}/python2.7/sha.* ${libdir}/python2.7/lib-dynload/crypt.so ${libdir}/python2.7/lib-dynload/_hashlib.so ${libdir}/python2.7/lib-dynload/_sha256.so ${libdir}/python2.7/lib-dynload/_sha512.so "
-
-SUMMARY_${PN}-ctypes="Python C types support"
-RDEPENDS_${PN}-ctypes="${PN}-core"
-FILES_${PN}-ctypes="${libdir}/python2.7/ctypes ${libdir}/python2.7/lib-dynload/_ctypes.so ${libdir}/python2.7/lib-dynload/_ctypes_test.so "
-
-SUMMARY_${PN}-curses="Python curses support"
-RDEPENDS_${PN}-curses="${PN}-core"
-FILES_${PN}-curses="${libdir}/python2.7/curses ${libdir}/python2.7/lib-dynload/_curses.so ${libdir}/python2.7/lib-dynload/_curses_panel.so "
-
-SUMMARY_${PN}-datetime="Python calendar and time support"
-RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
-FILES_${PN}-datetime="${libdir}/python2.7/_strptime.* ${libdir}/python2.7/calendar.* ${libdir}/python2.7/lib-dynload/datetime.so "
-
-SUMMARY_${PN}-db="Python file-based database support"
-RDEPENDS_${PN}-db="${PN}-core"
-FILES_${PN}-db="${libdir}/python2.7/anydbm.* ${libdir}/python2.7/dumbdbm.* ${libdir}/python2.7/whichdb.* "
-
-SUMMARY_${PN}-debugger="Python debugger"
-RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint"
-FILES_${PN}-debugger="${libdir}/python2.7/bdb.* ${libdir}/python2.7/pdb.* "
-
-SUMMARY_${PN}-dev="Python development package"
-RDEPENDS_${PN}-dev="${PN}-core"
-FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig ${libdir}/python2.7/config/Makefile "
-
-SUMMARY_${PN}-difflib="Python helpers for computing deltas between objects"
-RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
-FILES_${PN}-difflib="${libdir}/python2.7/difflib.* "
-
-SUMMARY_${PN}-distutils="Python Distribution Utilities"
-RDEPENDS_${PN}-distutils="${PN}-core ${PN}-email"
-FILES_${PN}-distutils="${libdir}/python2.7/config ${libdir}/python2.7/distutils "
-
-SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
-RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
-FILES_${PN}-distutils-staticdev="${libdir}/python2.7/config/lib*.a "
-
-SUMMARY_${PN}-doctest="Python framework for running examples in docstrings"
-RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
-FILES_${PN}-doctest="${libdir}/python2.7/doctest.* "
-
-SUMMARY_${PN}-email="Python email support"
-RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
-FILES_${PN}-email="${libdir}/python2.7/imaplib.* ${libdir}/python2.7/email "
-
-SUMMARY_${PN}-fcntl="Python's fcntl interface"
-RDEPENDS_${PN}-fcntl="${PN}-core"
-FILES_${PN}-fcntl="${libdir}/python2.7/lib-dynload/fcntl.so "
-
-SUMMARY_${PN}-gdbm="Python GNU database support"
-RDEPENDS_${PN}-gdbm="${PN}-core"
-FILES_${PN}-gdbm="${libdir}/python2.7/lib-dynload/gdbm.so "
-
-SUMMARY_${PN}-hotshot="Python hotshot performance profiler"
-RDEPENDS_${PN}-hotshot="${PN}-core"
-FILES_${PN}-hotshot="${libdir}/python2.7/hotshot ${libdir}/python2.7/lib-dynload/_hotshot.so "
-
-SUMMARY_${PN}-html="Python HTML processing support"
-RDEPENDS_${PN}-html="${PN}-core"
-FILES_${PN}-html="${libdir}/python2.7/formatter.* ${libdir}/python2.7/htmlentitydefs.* ${libdir}/python2.7/htmllib.* ${libdir}/python2.7/markupbase.* ${libdir}/python2.7/sgmllib.* ${libdir}/python2.7/HTMLParser.* "
-
-SUMMARY_${PN}-idle="Python Integrated Development Environment"
-RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
-FILES_${PN}-idle="${bindir}/idle ${libdir}/python2.7/idlelib "
-
-SUMMARY_${PN}-image="Python graphical image handling"
-RDEPENDS_${PN}-image="${PN}-core"
-FILES_${PN}-image="${libdir}/python2.7/colorsys.* ${libdir}/python2.7/imghdr.* ${libdir}/python2.7/lib-dynload/imageop.so ${libdir}/python2.7/lib-dynload/rgbimg.so "
-
-SUMMARY_${PN}-importlib="Python import implementation library"
-RDEPENDS_${PN}-importlib="${PN}-core"
-FILES_${PN}-importlib="${libdir}/python2.7/importlib "
-
-SUMMARY_${PN}-io="Python low-level I/O"
-RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient ${PN}-contextlib"
-FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_io.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* ${libdir}/python2.7/io.* ${libdir}/python2.7/_pyio.* "
-
-SUMMARY_${PN}-json="Python JSON support"
-RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re ${PN}-codecs"
-FILES_${PN}-json="${libdir}/python2.7/json ${libdir}/python2.7/lib-dynload/_json.so "
-
-SUMMARY_${PN}-lang="Python low-level language support"
-RDEPENDS_${PN}-lang="${PN}-core"
-FILES_${PN}-lang="${libdir}/python2.7/lib-dynload/_bisect.so ${libdir}/python2.7/lib-dynload/_collections.so ${libdir}/python2.7/lib-dynload/_heapq.so ${libdir}/python2.7/lib-dynload/_weakref.so ${libdir}/python2.7/lib-dynload/_functools.so ${libdir}/python2.7/lib-dynload/array.so ${libdir}/python2.7/lib-dynload/itertools.so ${libdir}/python2.7/lib-dynload/operator.so ${libdir}/python2.7/lib-dynload/parser.so ${libdir}/python2.7/atexit.* ${libdir}/python2.7/bisect.* ${libdir}/python2.7/code.* ${libdir}/python2.7/codeop.* ${libdir}/python2.7/collections.* ${libdir}/python2.7/dis.* ${libdir}/python2.7/functools.* ${libdir}/python2.7/heapq.* ${libdir}/python2.7/inspect.* ${libdir}/python2.7/keyword.* ${libdir}/python2.7/opcode.* ${libdir}/python2.7/symbol.* ${libdir}/python2.7/repr.* ${libdir}/python2.7/token.* ${libdir}/python2.7/tokenize.* ${libdir}/python2.7/traceback.* ${libdir}/python2.7/weakref.* "
-
-SUMMARY_${PN}-logging="Python logging support"
-RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
-FILES_${PN}-logging="${libdir}/python2.7/logging "
-
-SUMMARY_${PN}-mailbox="Python mailbox format support"
-RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
-FILES_${PN}-mailbox="${libdir}/python2.7/mailbox.* "
-
-SUMMARY_${PN}-math="Python math support"
-RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
-FILES_${PN}-math="${libdir}/python2.7/lib-dynload/cmath.so ${libdir}/python2.7/lib-dynload/math.so ${libdir}/python2.7/lib-dynload/_random.so ${libdir}/python2.7/random.* ${libdir}/python2.7/sets.* "
-
-SUMMARY_${PN}-mime="Python MIME handling APIs"
-RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
-FILES_${PN}-mime="${libdir}/python2.7/mimetools.* ${libdir}/python2.7/uu.* ${libdir}/python2.7/quopri.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/MimeWriter.* "
-
-SUMMARY_${PN}-mmap="Python memory-mapped file support"
-RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
-FILES_${PN}-mmap="${libdir}/python2.7/lib-dynload/mmap.so "
-
-SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
-RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
-FILES_${PN}-multiprocessing="${libdir}/python2.7/lib-dynload/_multiprocessing.so ${libdir}/python2.7/multiprocessing "
-
-SUMMARY_${PN}-netclient="Python Internet Protocol clients"
-RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
-FILES_${PN}-netclient="${libdir}/python2.7/*Cookie*.* ${libdir}/python2.7/base64.* ${libdir}/python2.7/cookielib.* ${libdir}/python2.7/ftplib.* ${libdir}/python2.7/gopherlib.* ${libdir}/python2.7/hmac.* ${libdir}/python2.7/httplib.* ${libdir}/python2.7/mimetypes.* ${libdir}/python2.7/nntplib.* ${libdir}/python2.7/poplib.* ${libdir}/python2.7/smtplib.* ${libdir}/python2.7/telnetlib.* ${libdir}/python2.7/urllib.* ${libdir}/python2.7/urllib2.* ${libdir}/python2.7/urlparse.* ${libdir}/python2.7/uuid.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/mimetools.* "
-
-SUMMARY_${PN}-netserver="Python Internet Protocol servers"
-RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading"
-FILES_${PN}-netserver="${libdir}/python2.7/cgi.* ${libdir}/python2.7/*HTTPServer.* ${libdir}/python2.7/SocketServer.* "
-
-SUMMARY_${PN}-numbers="Python number APIs"
-RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/fractions.* ${libdir}/python2.7/numbers.* "
-
-SUMMARY_${PN}-pickle="Python serialisation/persistence support"
-RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python2.7/pickle.* ${libdir}/python2.7/shelve.* ${libdir}/python2.7/lib-dynload/cPickle.so ${libdir}/python2.7/pickletools.* "
-
-SUMMARY_${PN}-pkgutil="Python package extension utility support"
-RDEPENDS_${PN}-pkgutil="${PN}-core"
-FILES_${PN}-pkgutil="${libdir}/python2.7/pkgutil.* "
-
-SUMMARY_${PN}-plistlib="Generate and parse Mac OS X .plist files"
-RDEPENDS_${PN}-plistlib="${PN}-core ${PN}-datetime ${PN}-io"
-FILES_${PN}-plistlib="${libdir}/python2.7/plistlib.* "
-
-SUMMARY_${PN}-pprint="Python pretty-print support"
-RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
-FILES_${PN}-pprint="${libdir}/python2.7/pprint.* "
-
-SUMMARY_${PN}-profile="Python basic performance profiling support"
-RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
-FILES_${PN}-profile="${libdir}/python2.7/profile.* ${libdir}/python2.7/pstats.* ${libdir}/python2.7/cProfile.* ${libdir}/python2.7/lib-dynload/_lsprof.so "
-
-SUMMARY_${PN}-pydoc="Python interactive help support"
-RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
-FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python2.7/pydoc.* ${libdir}/python2.7/pydoc_data "
-
-SUMMARY_${PN}-re="Python Regular Expression APIs"
-RDEPENDS_${PN}-re="${PN}-core"
-FILES_${PN}-re="${libdir}/python2.7/re.* ${libdir}/python2.7/sre.* ${libdir}/python2.7/sre_compile.* ${libdir}/python2.7/sre_constants* ${libdir}/python2.7/sre_parse.* "
-
-SUMMARY_${PN}-readline="Python readline support"
-RDEPENDS_${PN}-readline="${PN}-core"
-FILES_${PN}-readline="${libdir}/python2.7/lib-dynload/readline.so ${libdir}/python2.7/rlcompleter.* "
-
-SUMMARY_${PN}-resource="Python resource control interface"
-RDEPENDS_${PN}-resource="${PN}-core"
-FILES_${PN}-resource="${libdir}/python2.7/lib-dynload/resource.so "
-
-SUMMARY_${PN}-robotparser="Python robots.txt parser"
-RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
-FILES_${PN}-robotparser="${libdir}/python2.7/robotparser.* "
-
-SUMMARY_${PN}-shell="Python shell-like functionality"
-RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
-FILES_${PN}-shell="${libdir}/python2.7/cmd.* ${libdir}/python2.7/commands.* ${libdir}/python2.7/dircache.* ${libdir}/python2.7/fnmatch.* ${libdir}/python2.7/glob.* ${libdir}/python2.7/popen2.* ${libdir}/python2.7/shlex.* ${libdir}/python2.7/shutil.* "
-
-SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
-RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
-FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python2.7/smtpd.* "
-
-SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
-RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib"
-FILES_${PN}-sqlite3="${libdir}/python2.7/lib-dynload/_sqlite3.so ${libdir}/python2.7/sqlite3/dbapi2.* ${libdir}/python2.7/sqlite3/__init__.* ${libdir}/python2.7/sqlite3/dump.* "
-
-SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support tests"
-RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
-FILES_${PN}-sqlite3-tests="${libdir}/python2.7/sqlite3/test "
-
-SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
-RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
-FILES_${PN}-stringold="${libdir}/python2.7/lib-dynload/strop.so ${libdir}/python2.7/string.* ${libdir}/python2.7/stringold.* "
-
-SUMMARY_${PN}-subprocess="Python subprocess support"
-RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
-FILES_${PN}-subprocess="${libdir}/python2.7/subprocess.* "
-
-SUMMARY_${PN}-syslog="Python syslog interface"
-RDEPENDS_${PN}-syslog="${PN}-core"
-FILES_${PN}-syslog="${libdir}/python2.7/lib-dynload/syslog.so "
-
-SUMMARY_${PN}-terminal="Python terminal controlling support"
-RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
-FILES_${PN}-terminal="${libdir}/python2.7/pty.* ${libdir}/python2.7/tty.* "
-
-SUMMARY_${PN}-tests="Python tests"
-RDEPENDS_${PN}-tests="${PN}-core ${PN}-modules"
-FILES_${PN}-tests="${libdir}/python2.7/test "
-
-SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
-RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
-FILES_${PN}-textutils="${libdir}/python2.7/lib-dynload/_csv.so ${libdir}/python2.7/csv.* ${libdir}/python2.7/optparse.* ${libdir}/python2.7/textwrap.* "
-
-SUMMARY_${PN}-threading="Python threading & synchronization support"
-RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
-FILES_${PN}-threading="${libdir}/python2.7/_threading_local.* ${libdir}/python2.7/dummy_thread.* ${libdir}/python2.7/dummy_threading.* ${libdir}/python2.7/mutex.* ${libdir}/python2.7/threading.* ${libdir}/python2.7/Queue.* "
-
-SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
-RDEPENDS_${PN}-tkinter="${PN}-core"
-FILES_${PN}-tkinter="${libdir}/python2.7/lib-dynload/_tkinter.so ${libdir}/python2.7/lib-tk "
-
-SUMMARY_${PN}-unittest="Python unit testing framework"
-RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
-FILES_${PN}-unittest="${libdir}/python2.7/unittest/ "
-
-SUMMARY_${PN}-unixadmin="Python Unix administration support"
-RDEPENDS_${PN}-unixadmin="${PN}-core"
-FILES_${PN}-unixadmin="${libdir}/python2.7/lib-dynload/nis.so ${libdir}/python2.7/lib-dynload/grp.so ${libdir}/python2.7/lib-dynload/pwd.so ${libdir}/python2.7/getpass.* "
-
-SUMMARY_${PN}-xml="Python basic XML support"
-RDEPENDS_${PN}-xml="${PN}-core ${PN}-re"
-FILES_${PN}-xml="${libdir}/python2.7/lib-dynload/_elementtree.so ${libdir}/python2.7/lib-dynload/pyexpat.so ${libdir}/python2.7/xml ${libdir}/python2.7/xmllib.* "
-
-SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
-RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
-FILES_${PN}-xmlrpc="${libdir}/python2.7/xmlrpclib.* ${libdir}/python2.7/SimpleXMLRPCServer.* ${libdir}/python2.7/DocXMLRPCServer.* "
-
-SUMMARY_${PN}-zlib="Python zlib compression support"
-RDEPENDS_${PN}-zlib="${PN}-core"
-FILES_${PN}-zlib="${libdir}/python2.7/lib-dynload/zlib.so "
-
-SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
-ALLOW_EMPTY_${PN}-modules = "1"
-
-
diff --git a/meta/recipes-devtools/python/python-native_2.7.13.bb b/meta/recipes-devtools/python/python-native_2.7.13.bb
index 7edf1534892..80969f8f3a8 100644
--- a/meta/recipes-devtools/python/python-native_2.7.13.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.13.bb
@@ -1,5 +1,4 @@
 require python.inc
-
 EXTRANATIVEPATH += "bzip2-native"
 DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native expat-native"
 PR = "${INC_PR}.1"
@@ -25,8 +24,6 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:"
 
 inherit native
 
-require python-native-${PYTHON_MAJMIN}-manifest.inc
-
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --with-system-expat=${STAGING_DIR_HOST}"
 
 EXTRA_OEMAKE = '\
diff --git a/meta/recipes-devtools/python/python/create_manifest2.py b/meta/recipes-devtools/python/python/create_manifest2.py
new file mode 100644
index 00000000000..aae03fbe2bc
--- /dev/null
+++ b/meta/recipes-devtools/python/python/create_manifest2.py
@@ -0,0 +1,274 @@
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
+# Read existing JSON manifest
+with open('python2-manifest.json') as manifest:
+  old_manifest=json.load(manifest)
+
+
+# First pass to get core-package functionality, because we base everything on the fact that core is actually working
+# Not exactly the same so it should not be a function
+print ("Getting dependencies for core package:")
+
+# Special call to check for core package
+output = subprocess.check_output([sys.executable, 'get_module_deps.py', 'python-core-package'])
+for item in output.split():
+    # We append it so it doesnt hurt what we currently have:
+    if item not in old_manifest['core']['files']:
+        # We use the same data structure since its the one which will be used to check
+        # dependencies for other packages
+        old_manifest['core']['files'].append(item)
+
+for value in old_manifest['core']['files']:
+  # Ignore folders, since we don't import those, difficult to handle multilib
+  if isFolder(value):
+    # Pass it directly
+    if value not in old_manifest['core']['files']:
+      old_manifest['core']['files'].append(value)
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
+  output = subprocess.check_output([sys.executable, 'get_module_deps.py', '%s' % value])
+  for item in output.split():
+    # We append it so it doesnt hurt what we currently have:
+    if item not in old_manifest['core']['files']:
+      old_manifest['core']['files'].append(item)
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
+    new_manifest[key]['rdepends']=[]
+    # All packages should depend on core
+    if key != 'core':
+         new_manifest[key]['rdepends'].append('core')
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
+        output = subprocess.check_output([sys.executable, 'get_module_deps.py', '%s' % value])
+
+        # We can print dependencies for debugging purposes
+        #print (output)
+        # Output will have all dependencies
+        for item in output.split():
+
+            # Warning: This first part is ugly
+            # One of the dependencies that was found, could be inside of one of the folders included by another package
+            # We need to check if this happens so we can add the package containing the folder as an RDEPENDS
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
+                            for file_folder in old_manifest[keyfolder]['files']:
+                                if file_folder==folder:
+                                    print ("%s found in %s" % (folder, keyfolder))
+                                    folderFound = True
+                                    if keyfolder not in new_manifest[key]['rdepends'] and keyfolder != key:
+                                        new_manifest[key]['rdepends'].append(keyfolder)
+                        else:
+                            break
+
+            # A folder was found so we're done with this item, we can go on
+            if inFolders:
+                continue
+
+            # We might already have it on the dictionary since it could depend on a (previously checked) module
+            if item not in new_manifest[key]['files']:
+                # Handle core as a special package, we already did it so we pass it to NEW data structure directly
+                if key=='core':
+                  print("Adding %s to %s FILES" % (item, key))
+                  if item.endswith('*'):
+                      wildcards.append(item)
+                  new_manifest[key]['files'].append(item)
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
+                        if item in old_manifest[newkey]['files']:      
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
+                      new_manifest[key]['files'].append(item)
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
+# Sort it just so it looks nice 
+for key in new_manifest:
+    new_manifest[key]['files'].sort()
+    new_manifest[key]['rdepends'].sort()
+
+# Create the manifest from the data structure that was built
+with open('python2-manifest.json.new','w') as outfile:
+    json.dump(new_manifest,outfile,sort_keys=True, indent=4)
diff --git a/meta/recipes-devtools/python/python/get_module_deps2.py b/meta/recipes-devtools/python/python/get_module_deps2.py
new file mode 100644
index 00000000000..f06b7d838e1
--- /dev/null
+++ b/meta/recipes-devtools/python/python/get_module_deps2.py
@@ -0,0 +1,110 @@
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
+
+    # If a *.pyc file was imported, we replace it with *.py (since we deal with PYCs on create_manifest)
+    if '.pyc' in dep_path:
+        dep_path = dep_path.replace('.pyc','.py')
+
+    return dep_path
+
+# Module to import was passed as an argument
+current_module =  str(sys.argv[1]).rstrip()
+if(debug==True):
+	log = open('log_%s' % current_module,'w')
+        log.write("Module %s generated the following dependencies:\n" % current_module)
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
+	if debug==True:
+            log.write(item + ' ')
+            log.write(str(e))
+	    log.write("\n")
+            pass
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
+    if (debug==True):
+        log.write(dep_path+"\n")
+
+    # Prints out result, which is what will be used by create_manifest
+    print (dep_path)
+
+if debug==True:
+    log.close()
diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
new file mode 100644
index 00000000000..2e325971556
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -0,0 +1,1033 @@
+{
+    "2to3": {
+        "files": [
+            "${bindir}/2to3", 
+            "${libdir}/python2.7/lib2to3"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python automated Python 2 to 3 code translator"
+    }, 
+    "argparse": {
+        "files": [
+            "${libdir}/python2.7/argparse.py"
+        ], 
+        "rdepends": [
+            "codecs", 
+            "core", 
+            "lang", 
+            "textutils"
+        ], 
+        "summary": "Python command line argument parser"
+    }, 
+    "audio": {
+        "files": [
+            "${libdir}/python2.7/audiodev.py", 
+            "${libdir}/python2.7/chunk.py", 
+            "${libdir}/python2.7/lib-dynload/audioop.so", 
+            "${libdir}/python2.7/lib-dynload/ossaudiodev.so", 
+            "${libdir}/python2.7/sndhdr.py", 
+            "${libdir}/python2.7/sunau.py", 
+            "${libdir}/python2.7/sunaudio.py", 
+            "${libdir}/python2.7/toaiff.py", 
+            "${libdir}/python2.7/wave.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "io", 
+            "math"
+        ], 
+        "summary": "Python Audio Handling"
+    }, 
+    "bsddb": {
+        "files": [
+            "${libdir}/python2.7/bsddb", 
+            "${libdir}/python2.7/lib-dynload/_bsddb.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python bindings for the Berkeley Database"
+    }, 
+    "codecs": {
+        "files": [
+            "${libdir}/python2.7/gettext.py", 
+            "${libdir}/python2.7/lib-dynload/_codecs_cn.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_hk.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_iso2022.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_jp.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_kr.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_tw.so", 
+            "${libdir}/python2.7/lib-dynload/_multibytecodec.so", 
+            "${libdir}/python2.7/lib-dynload/unicodedata.so", 
+            "${libdir}/python2.7/locale.py", 
+            "${libdir}/python2.7/stringprep.py", 
+            "${libdir}/python2.7/xdrlib.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "io", 
+            "lang"
+        ], 
+        "summary": "Python codec"
+    }, 
+    "compile": {
+        "files": [
+            "${libdir}/python2.7/compileall.py", 
+            "${libdir}/python2.7/py_compile.py"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python bytecode compilation support"
+    }, 
+    "compiler": {
+        "files": [
+            "${libdir}/python2.7/compiler"
+        ], 
+        "rdepends": [
+            "core", 
+            "io", 
+            "lang"
+        ], 
+        "summary": "Python compiler support"
+    }, 
+    "compression": {
+        "files": [
+            "${libdir}/python2.7/gzip.py", 
+            "${libdir}/python2.7/lib-dynload/bz2.so", 
+            "${libdir}/python2.7/tarfile.py", 
+            "${libdir}/python2.7/zipfile.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "io", 
+            "shell", 
+            "unixadmin", 
+            "zlib"
+        ], 
+        "summary": "Python high-level compression support"
+    }, 
+    "contextlib": {
+        "files": [
+            "${libdir}/python2.7/contextlib.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "lang"
+        ], 
+        "summary": "Python utilities for with-statementcontexts."
+    }, 
+    "core": {
+        "files": [
+            "${bindir}/python*", 
+            "${includedir}/python2.7/pyconfig*.h", 
+            "${libdir}/python2.7/ConfigParser.py", 
+            "${libdir}/python2.7/UserDict.py", 
+            "${libdir}/python2.7/UserList.py", 
+            "${libdir}/python2.7/UserString.py", 
+            "${libdir}/python2.7/__future__.py", 
+            "${libdir}/python2.7/_abcoll.py", 
+            "${libdir}/python2.7/_sysconfigdata.py", 
+            "${libdir}/python2.7/_weakrefset.py", 
+            "${libdir}/python2.7/abc.py", 
+            "${libdir}/python2.7/ast.py", 
+            "${libdir}/python2.7/atexit.py", 
+            "${libdir}/python2.7/codecs.py", 
+            "${libdir}/python2.7/collections.py", 
+            "${libdir}/python2.7/copy.py", 
+            "${libdir}/python2.7/copy_reg.py", 
+            "${libdir}/python2.7/encodings", 
+            "${libdir}/python2.7/encodings/aliases.py", 
+            "${libdir}/python2.7/encodings/utf_8.py", 
+            "${libdir}/python2.7/genericpath.py", 
+            "${libdir}/python2.7/getopt.py", 
+            "${libdir}/python2.7/heapq.py", 
+            "${libdir}/python2.7/importlib", 
+            "${libdir}/python2.7/keyword.py", 
+            "${libdir}/python2.7/lib-dynload/_collections.so", 
+            "${libdir}/python2.7/lib-dynload/_heapq.so", 
+            "${libdir}/python2.7/lib-dynload/_locale.so", 
+            "${libdir}/python2.7/lib-dynload/_struct.so", 
+            "${libdir}/python2.7/lib-dynload/binascii.so", 
+            "${libdir}/python2.7/lib-dynload/itertools.so", 
+            "${libdir}/python2.7/lib-dynload/operator.so", 
+            "${libdir}/python2.7/lib-dynload/readline.so", 
+            "${libdir}/python2.7/lib-dynload/strop.so", 
+            "${libdir}/python2.7/lib-dynload/time.so", 
+            "${libdir}/python2.7/lib-dynload/xreadlines.so", 
+            "${libdir}/python2.7/linecache.py", 
+            "${libdir}/python2.7/new.py", 
+            "${libdir}/python2.7/os.py", 
+            "${libdir}/python2.7/platform.py", 
+            "${libdir}/python2.7/posixpath.py", 
+            "${libdir}/python2.7/re.py", 
+            "${libdir}/python2.7/rlcompleter.py", 
+            "${libdir}/python2.7/site.py", 
+            "${libdir}/python2.7/sitecustomize.py", 
+            "${libdir}/python2.7/sre_compile.py", 
+            "${libdir}/python2.7/sre_constants.py", 
+            "${libdir}/python2.7/sre_parse.py", 
+            "${libdir}/python2.7/stat.py", 
+            "${libdir}/python2.7/string.py", 
+            "${libdir}/python2.7/struct.py", 
+            "${libdir}/python2.7/sysconfig.py", 
+            "${libdir}/python2.7/traceback.py", 
+            "${libdir}/python2.7/types.py", 
+            "${libdir}/python2.7/warnings.py", 
+            "${libdir}/python2.7/weakref.py"
+        ], 
+        "rdepends": [], 
+        "summary": "Python interpreter and core modules"
+    }, 
+    "crypt": {
+        "files": [
+            "${libdir}/python2.7/hashlib.py", 
+            "${libdir}/python2.7/lib-dynload/_hashlib.so", 
+            "${libdir}/python2.7/lib-dynload/crypt.so", 
+            "${libdir}/python2.7/md5.py", 
+            "${libdir}/python2.7/sha.py"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python basic cryptographic and hashing support"
+    }, 
+    "ctypes": {
+        "files": [
+            "${libdir}/python2.7/ctypes", 
+            "${libdir}/python2.7/lib-dynload/_ctypes.so", 
+            "${libdir}/python2.7/lib-dynload/_ctypes_test.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python C types support"
+    }, 
+    "curses": {
+        "files": [
+            "${libdir}/python2.7/curses", 
+            "${libdir}/python2.7/lib-dynload/_curses.so", 
+            "${libdir}/python2.7/lib-dynload/_curses_panel.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python curses support"
+    }, 
+    "datetime": {
+        "files": [
+            "${libdir}/python2.7/_strptime.py", 
+            "${libdir}/python2.7/calendar.py", 
+            "${libdir}/python2.7/lib-dynload/datetime.so"
+        ], 
+        "rdepends": [
+            "codecs", 
+            "core", 
+            "lang"
+        ], 
+        "summary": "Python calendar and time support"
+    }, 
+    "db": {
+        "files": [
+            "${libdir}/python2.7/anydbm.py", 
+            "${libdir}/python2.7/dbhash.py", 
+            "${libdir}/python2.7/dumbdbm.py", 
+            "${libdir}/python2.7/lib-dynload/dbm.so", 
+            "${libdir}/python2.7/whichdb.py"
+        ], 
+        "rdepends": [
+            "bsddb", 
+            "core", 
+            "gdbm"
+        ], 
+        "summary": "Python file-based database support"
+    }, 
+    "debugger": {
+        "files": [
+            "${libdir}/python2.7/bdb.py", 
+            "${libdir}/python2.7/pdb.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "io", 
+            "lang", 
+            "pprint", 
+            "shell"
+        ], 
+        "summary": "Python debugger"
+    }, 
+    "dev": {
+        "files": [
+            "${base_libdir}/*.a", 
+            "${base_libdir}/*.o", 
+            "${datadir}/aclocal", 
+            "${datadir}/pkgconfig", 
+            "${includedir}", 
+            "${libdir}/*.a", 
+            "${libdir}/*.la", 
+            "${libdir}/*.o", 
+            "${libdir}/lib*${SOLIBSDEV}", 
+            "${libdir}/pkgconfig", 
+            "${libdir}/python2.7/config/Makefile"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python development package"
+    }, 
+    "difflib": {
+        "files": [
+            "${libdir}/python2.7/difflib.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "lang"
+        ], 
+        "summary": "Python helpers for computing deltas between objects"
+    }, 
+    "distutils": {
+        "files": [
+            "${libdir}/python2.7/config", 
+            "${libdir}/python2.7/distutils"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python Distribution Utilities"
+    }, 
+    "distutils-staticdev": {
+        "files": [
+            "${libdir}/python2.7/config/lib*.a"
+        ], 
+        "rdepends": [
+            "distutils"
+        ], 
+        "summary": "Python distribution utilities (static libraries)"
+    }, 
+    "doctest": {
+        "files": [
+            "${libdir}/python2.7/doctest.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "crypt", 
+            "debugger", 
+            "difflib", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "pprint", 
+            "shell", 
+            "unittest"
+        ], 
+        "summary": "Python framework for running examples in docstrings"
+    }, 
+    "email": {
+        "files": [
+            "${libdir}/python2.7/email", 
+            "${libdir}/python2.7/imaplib.py"
+        ], 
+        "rdepends": [
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "netclient", 
+            "pickle", 
+            "subprocess", 
+            "textutils"
+        ], 
+        "summary": "Python email support"
+    }, 
+    "fcntl": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/fcntl.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python's fcntl interface"
+    }, 
+    "gdbm": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/gdbm.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python GNU database support"
+    }, 
+    "hotshot": {
+        "files": [
+            "${libdir}/python2.7/hotshot", 
+            "${libdir}/python2.7/lib-dynload/_hotshot.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python hotshot performance profiler"
+    }, 
+    "html": {
+        "files": [
+            "${libdir}/python2.7/HTMLParser.py", 
+            "${libdir}/python2.7/formatter.py", 
+            "${libdir}/python2.7/htmlentitydefs.py", 
+            "${libdir}/python2.7/htmllib.py", 
+            "${libdir}/python2.7/markupbase.py", 
+            "${libdir}/python2.7/sgmllib.py"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python HTML processing support"
+    }, 
+    "idle": {
+        "files": [
+            "${bindir}/idle", 
+            "${libdir}/python2.7/idlelib"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python Integrated Development Environment"
+    }, 
+    "image": {
+        "files": [
+            "${libdir}/python2.7/colorsys.py", 
+            "${libdir}/python2.7/imghdr.py"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python graphical image handling"
+    }, 
+    "io": {
+        "files": [
+            "${libdir}/python2.7/StringIO.py", 
+            "${libdir}/python2.7/_pyio.py", 
+            "${libdir}/python2.7/io.py", 
+            "${libdir}/python2.7/lib-dynload/_io.so", 
+            "${libdir}/python2.7/lib-dynload/_socket.so", 
+            "${libdir}/python2.7/lib-dynload/_ssl.so", 
+            "${libdir}/python2.7/lib-dynload/cStringIO.so", 
+            "${libdir}/python2.7/lib-dynload/select.so", 
+            "${libdir}/python2.7/lib-dynload/termios.so", 
+            "${libdir}/python2.7/pipes.py", 
+            "${libdir}/python2.7/socket.py", 
+            "${libdir}/python2.7/ssl.py", 
+            "${libdir}/python2.7/tempfile.py"
+        ], 
+        "rdepends": [
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "lang", 
+            "math", 
+            "netclient", 
+            "textutils"
+        ], 
+        "summary": "Python low-level I/O"
+    }, 
+    "json": {
+        "files": [
+            "${libdir}/python2.7/json", 
+            "${libdir}/python2.7/lib-dynload/_json.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python JSON support"
+    }, 
+    "lang": {
+        "files": [
+            "${libdir}/python2.7/bisect.py", 
+            "${libdir}/python2.7/code.py", 
+            "${libdir}/python2.7/codeop.py", 
+            "${libdir}/python2.7/dis.py", 
+            "${libdir}/python2.7/functools.py", 
+            "${libdir}/python2.7/inspect.py", 
+            "${libdir}/python2.7/lib-dynload/_bisect.so", 
+            "${libdir}/python2.7/lib-dynload/_functools.so", 
+            "${libdir}/python2.7/lib-dynload/array.so", 
+            "${libdir}/python2.7/lib-dynload/parser.so", 
+            "${libdir}/python2.7/opcode.py", 
+            "${libdir}/python2.7/repr.py", 
+            "${libdir}/python2.7/symbol.py", 
+            "${libdir}/python2.7/token.py", 
+            "${libdir}/python2.7/tokenize.py"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python low-level language support"
+    }, 
+    "logging": {
+        "files": [
+            "${libdir}/python2.7/logging"
+        ], 
+        "rdepends": [
+            "core", 
+            "io", 
+            "threading"
+        ], 
+        "summary": "Python logging support"
+    }, 
+    "mailbox": {
+        "files": [
+            "${libdir}/python2.7/mailbox.py"
+        ], 
+        "rdepends": [
+            "codecs", 
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "datetime", 
+            "email", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "mime", 
+            "netclient", 
+            "textutils"
+        ], 
+        "summary": "Python mailbox format support"
+    }, 
+    "math": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/_random.so", 
+            "${libdir}/python2.7/lib-dynload/cmath.so", 
+            "${libdir}/python2.7/lib-dynload/math.so", 
+            "${libdir}/python2.7/random.py", 
+            "${libdir}/python2.7/sets.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "crypt"
+        ], 
+        "summary": "Python math support"
+    }, 
+    "mime": {
+        "files": [
+            "${libdir}/python2.7/MimeWriter.py", 
+            "${libdir}/python2.7/mimetools.py", 
+            "${libdir}/python2.7/mimetypes.py", 
+            "${libdir}/python2.7/quopri.py", 
+            "${libdir}/python2.7/rfc822.py", 
+            "${libdir}/python2.7/uu.py"
+        ], 
+        "rdepends": [
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "netclient", 
+            "textutils"
+        ], 
+        "summary": "Python MIME handling APIs"
+    }, 
+    "mmap": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/mmap.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python memory-mapped file support"
+    }, 
+    "modules": {
+        "files": [], 
+        "rdepends": [
+            "2to3", 
+            "argparse", 
+            "audio", 
+            "bsddb", 
+            "codecs", 
+            "compile", 
+            "compiler", 
+            "compression", 
+            "contextlib", 
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
+            "gdbm", 
+            "hotshot", 
+            "html", 
+            "idle", 
+            "image", 
+            "io", 
+            "json", 
+            "lang", 
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
+            "plistlib", 
+            "pprint", 
+            "profile", 
+            "pydoc", 
+            "re", 
+            "resource", 
+            "robotparser", 
+            "shell", 
+            "smtpd", 
+            "sqlite3", 
+            "sqlite3", 
+            "stringold", 
+            "subprocess", 
+            "syslog", 
+            "terminal", 
+            "tests", 
+            "textutils", 
+            "threading", 
+            "tkinter", 
+            "unittest", 
+            "unixadmin", 
+            "xml", 
+            "xmlrpc", 
+            "zlib"
+        ], 
+        "summary": "All Python modules"
+    }, 
+    "multiprocessing": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/_multiprocessing.so", 
+            "${libdir}/python2.7/multiprocessing"
+        ], 
+        "rdepends": [
+            "core", 
+            "fcntl", 
+            "io", 
+            "pickle", 
+            "subprocess", 
+            "threading"
+        ], 
+        "summary": "Python multiprocessing support"
+    }, 
+    "netclient": {
+        "files": [
+            "${libdir}/python2.7/Cookie.py", 
+            "${libdir}/python2.7/_LWPCookieJar.py", 
+            "${libdir}/python2.7/_MozillaCookieJar.py", 
+            "${libdir}/python2.7/base64.py", 
+            "${libdir}/python2.7/cookielib.py", 
+            "${libdir}/python2.7/ftplib.py", 
+            "${libdir}/python2.7/hmac.py", 
+            "${libdir}/python2.7/httplib.py", 
+            "${libdir}/python2.7/nntplib.py", 
+            "${libdir}/python2.7/poplib.py", 
+            "${libdir}/python2.7/smtplib.py", 
+            "${libdir}/python2.7/telnetlib.py", 
+            "${libdir}/python2.7/urllib.py", 
+            "${libdir}/python2.7/urllib2.py", 
+            "${libdir}/python2.7/urlparse.py", 
+            "${libdir}/python2.7/uuid.py"
+        ], 
+        "rdepends": [
+            "codecs", 
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "ctypes", 
+            "datetime", 
+            "email", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "mime", 
+            "pickle", 
+            "subprocess", 
+            "textutils", 
+            "threading"
+        ], 
+        "summary": "Python Internet Protocol clients"
+    }, 
+    "netserver": {
+        "files": [
+            "${libdir}/python2.7/BaseHTTPServer.py", 
+            "${libdir}/python2.7/CGIHTTPServer.py", 
+            "${libdir}/python2.7/SimpleHTTPServer.py", 
+            "${libdir}/python2.7/SocketServer.py", 
+            "${libdir}/python2.7/cgi.py"
+        ], 
+        "rdepends": [
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "mime", 
+            "netclient", 
+            "shell", 
+            "textutils", 
+            "threading", 
+            "unixadmin"
+        ], 
+        "summary": "Python Internet Protocol servers"
+    }, 
+    "numbers": {
+        "files": [
+            "${libdir}/python2.7/decimal.py", 
+            "${libdir}/python2.7/fractions.py", 
+            "${libdir}/python2.7/numbers.py"
+        ], 
+        "rdepends": [
+            "codecs", 
+            "core", 
+            "lang", 
+            "math", 
+            "threading"
+        ], 
+        "summary": "Python number APIs"
+    }, 
+    "pickle": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/cPickle.so", 
+            "${libdir}/python2.7/pickle.py", 
+            "${libdir}/python2.7/pickletools.py", 
+            "${libdir}/python2.7/shelve.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "io"
+        ], 
+        "summary": "Python serialisation/persistence support"
+    }, 
+    "pkgutil": {
+        "files": [
+            "${libdir}/python2.7/pkgutil.py"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python package extension utility support"
+    }, 
+    "plistlib": {
+        "files": [
+            "${libdir}/python2.7/plistlib.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "datetime", 
+            "io"
+        ], 
+        "summary": "Generate and parse Mac OS X .plist files"
+    }, 
+    "pprint": {
+        "files": [
+            "${libdir}/python2.7/pprint.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "io"
+        ], 
+        "summary": "Python pretty-print support"
+    }, 
+    "profile": {
+        "files": [
+            "${libdir}/python2.7/cProfile.py", 
+            "${libdir}/python2.7/lib-dynload/_lsprof.so", 
+            "${libdir}/python2.7/profile.py", 
+            "${libdir}/python2.7/pstats.py"
+        ], 
+        "rdepends": [
+            "codecs", 
+            "core", 
+            "lang", 
+            "resource", 
+            "textutils"
+        ], 
+        "summary": "Python basic performance profiling support"
+    }, 
+    "pydoc": {
+        "files": [
+            "${bindir}/pydoc", 
+            "${libdir}/python2.7/pydoc.py", 
+            "${libdir}/python2.7/pydoc_data"
+        ], 
+        "rdepends": [
+            "codecs", 
+            "core", 
+            "lang", 
+            "pkgutil"
+        ], 
+        "summary": "Python interactive help support"
+    }, 
+    "re": {
+        "files": [
+            "${libdir}/python2.7/sre.py"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python Regular Expression APIs"
+    }, 
+    "resource": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/resource.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python resource control interface"
+    }, 
+    "robotparser": {
+        "files": [
+            "${libdir}/python2.7/robotparser.py"
+        ], 
+        "rdepends": [
+            "contextlib", 
+            "core", 
+            "io", 
+            "lang", 
+            "netclient", 
+            "textutils"
+        ], 
+        "summary": "Python robots.txt parser"
+    }, 
+    "shell": {
+        "files": [
+            "${libdir}/python2.7/cmd.py", 
+            "${libdir}/python2.7/commands.py", 
+            "${libdir}/python2.7/dircache.py", 
+            "${libdir}/python2.7/fnmatch.py", 
+            "${libdir}/python2.7/glob.py", 
+            "${libdir}/python2.7/popen2.py", 
+            "${libdir}/python2.7/shlex.py", 
+            "${libdir}/python2.7/shutil.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "io", 
+            "unixadmin"
+        ], 
+        "summary": "Python shell-like functionality"
+    }, 
+    "smtpd": {
+        "files": [
+            "${bindir}/smtpd.py", 
+            "${libdir}/python2.7/asynchat.py", 
+            "${libdir}/python2.7/asyncore.py", 
+            "${libdir}/python2.7/smtpd.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "fcntl", 
+            "io", 
+            "lang"
+        ], 
+        "summary": "Python Simple Mail Transport Daemon"
+    }, 
+    "sqlite3": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/_sqlite3.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python Sqlite3 database support"
+    }, 
+    "sqlite3-tests": {
+        "files": [
+            "${libdir}/python2.7/sqlite3/test"
+        ], 
+        "rdepends": [
+            "core", 
+            "tests"
+        ], 
+        "summary": "Python Sqlite3 database support tests"
+    }, 
+    "stringold": {
+        "files": [
+            "${libdir}/python2.7/stringold.py"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python string APIs [deprecated]"
+    }, 
+    "subprocess": {
+        "files": [
+            "${libdir}/python2.7/subprocess.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "fcntl", 
+            "io", 
+            "pickle"
+        ], 
+        "summary": "Python subprocess support"
+    }, 
+    "syslog": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/syslog.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python syslog interface"
+    }, 
+    "terminal": {
+        "files": [
+            "${libdir}/python2.7/pty.py", 
+            "${libdir}/python2.7/tty.py"
+        ], 
+        "rdepends": [
+            "core", 
+            "io"
+        ], 
+        "summary": "Python terminal controlling support"
+    }, 
+    "tests": {
+        "files": [
+            "${libdir}/python2.7/test"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python tests"
+    }, 
+    "textutils": {
+        "files": [
+            "${libdir}/python2.7/csv.py", 
+            "${libdir}/python2.7/lib-dynload/_csv.so", 
+            "${libdir}/python2.7/optparse.py", 
+            "${libdir}/python2.7/textwrap.py"
+        ], 
+        "rdepends": [
+            "codecs", 
+            "core", 
+            "io", 
+            "lang"
+        ], 
+        "summary": "Python option parsin"
+    }, 
+    "threading": {
+        "files": [
+            "${libdir}/python2.7/Queue.py", 
+            "${libdir}/python2.7/_threading_local.py", 
+            "${libdir}/python2.7/dummy_thread.py", 
+            "${libdir}/python2.7/dummy_threading.py", 
+            "${libdir}/python2.7/mutex.py", 
+            "${libdir}/python2.7/threading.py"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python threading & synchronization support"
+    }, 
+    "tkinter": {
+        "files": [
+            "${libdir}/python2.7/lib-tk"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python Tcl/Tk bindings"
+    }, 
+    "unittest": {
+        "files": [
+            "${libdir}/python2.7/unittest"
+        ], 
+        "rdepends": [
+            "core", 
+            "difflib", 
+            "io", 
+            "lang", 
+            "pprint", 
+            "shell"
+        ], 
+        "summary": "Python unit testing framework"
+    }, 
+    "unixadmin": {
+        "files": [
+            "${libdir}/python2.7/getpass.py", 
+            "${libdir}/python2.7/lib-dynload/grp.so", 
+            "${libdir}/python2.7/lib-dynload/nis.so"
+        ], 
+        "rdepends": [
+            "core", 
+            "io"
+        ], 
+        "summary": "Python Unix administration support"
+    }, 
+    "xml": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/_elementtree.so", 
+            "${libdir}/python2.7/lib-dynload/pyexpat.so", 
+            "${libdir}/python2.7/xml"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python basic XML support"
+    }, 
+    "xmlrpc": {
+        "files": [
+            "${libdir}/python2.7/DocXMLRPCServer.py", 
+            "${libdir}/python2.7/SimpleXMLRPCServer.py"
+        ], 
+        "rdepends": [
+            "codecs", 
+            "compression", 
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "datetime", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "mime", 
+            "netclient", 
+            "netserver", 
+            "pkgutil", 
+            "pydoc", 
+            "textutils", 
+            "threading", 
+            "xml", 
+            "zlib"
+        ], 
+        "summary": "Python XML-RPC support"
+    }, 
+    "zlib": {
+        "files": [
+            "${libdir}/python2.7/lib-dynload/zlib.so"
+        ], 
+        "rdepends": [
+            "core"
+        ], 
+        "summary": "Python zlib compression support"
+    }
+}
\ No newline at end of file
diff --git a/meta/recipes-devtools/python/python/sitecustomize.py b/meta/recipes-devtools/python/python/sitecustomize.py
index 273901898a0..4c8b5e2ba3d 100644
--- a/meta/recipes-devtools/python/python/sitecustomize.py
+++ b/meta/recipes-devtools/python/python/sitecustomize.py
@@ -27,19 +27,11 @@ def __enableReadlineSupport():
     except IOError:
         pass
 
-def __enableDefaultEncoding():
-    import sys
-    try:
-        sys.setdefaultencoding( "utf8" )
-    except LookupError:
-        pass
-
 import sys
 try:
     import rlcompleter, readline
 except ImportError:
     pass
 else:
-    __enableDefaultEncoding()
     __registerExitHandler()
     __enableReadlineSupport()
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 4ef99523e0a..b686819921a 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -1,4 +1,5 @@
 require python.inc
+
 DEPENDS = "python-native libffi bzip2 db gdbm openssl readline sqlite3 zlib"
 PR = "${INC_PR}"
 
@@ -136,7 +137,6 @@ py_package_preprocess () {
     python -m py_compile ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
 }
 
-require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
 RPROVIDES_${PN}-core = "${PN}"
@@ -167,5 +167,83 @@ do_install_ptest() {
 # catch manpage
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
-
 BBCLASSEXTEND = "nativesdk"
+
+RPROVIDES_${PN} += "${PN}-modules"
+
+# We dont want bytecode precompiled .py files (.pyc's) by default
+# but the user may se it on their own conf
+
+INCLUDE_PYCS ?= "0"
+
+python(){
+
+    pythondir = d.getVar('THISDIR',True)
+
+    # Read JSON manifest
+    import json
+    with open(pythondir+'/python/python2-manifest.json') as manifest_file:
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
+
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
+            if include_pycs == "1":
+                if value.endswith('.py'):
+                    d.appendVar('FILES_' + pypackage, value + 'c ')
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
+# Files needed to create a new manifest
+SRC_URI += "file://create_manifest2.py file://get_module_deps2.py file://python2-manifest.json"
+
+do_create_manifest() {
+
+cd ${WORKDIR}
+# This needs to be executed by python-native and NOT by HOST's python
+nativepython create_manifest2.py
+cp python2-manifest.json.new ${THISDIR}/python/python2-manifest.json
+}
+
+# bitbake python -c create_manifest
+addtask do_create_manifest
+
+# Make sure we have native python ready when we create a new manifest
+do_create_manifest[depends] += "python:do_prepare_recipe_sysroot"
+do_create_manifest[depends] += "python:do_patch"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
deleted file mode 100755
index dce465abffd..00000000000
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ /dev/null
@@ -1,418 +0,0 @@
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
-# February 26, 2017 -- Ming Liu <peter.x.liu@external.atlascopco.com>
-#  * Updated to support generating manifest for native python
-
-import os
-import sys
-import time
-import argparse
-
-VERSION = "2.7.2"
-
-__author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
-__version__ = "20110222.2"
-
-class MakefileMaker:
-
-    def __init__( self, outfile, isNative ):
-        """initialize"""
-        self.packages = {}
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
-    def addPackage( self, name, description, dependencies, filenames ):
-        """add a package to the Makefile"""
-        if type( filenames ) == type( "" ):
-            filenames = filenames.split()
-        fullFilenames = []
-        for filename in filenames:
-            if filename[0] != "$":
-                fullFilenames.append( "%s%s" % ( self.targetPrefix, filename ) )
-            else:
-                fullFilenames.append( filename )
-        self.packages[name] = description, dependencies, fullFilenames
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
-                pkglist.append('%s-native' % name.replace('${PN}', 'python'))
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
-            if name not in ['${PN}-dev', '${PN}-distutils-staticdev']:
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
-    parser = argparse.ArgumentParser( description='generate python manifest' )
-    parser.add_argument( '-n', '--native', help='generate manifest for native python', action='store_true' )
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
-    m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re",
-    "__future__.* _abcoll.* abc.* ast.* copy.* copy_reg.* ConfigParser.* " +
-    "genericpath.* getopt.* linecache.* new.* " +
-    "os.* posixpath.* struct.* " +
-    "warnings.* site.* stat.* " +
-    "UserDict.* UserList.* UserString.* " +
-    "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so " +
-    "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  +
-    "_weakrefset.* sysconfig.* _sysconfigdata.* " +
-    "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
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
-    "config/Makefile ")
-
-    m.addPackage( "${PN}-2to3", "Python automated Python 2 to 3 code translator", "${PN}-core",
-    "${bindir}/2to3 lib2to3" ) # package
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
-    "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.so lib-dynload/audioop.so audiodev.* sunaudio.* sunau.* toaiff.*" )
-
-    m.addPackage( "${PN}-bsddb", "Python bindings for the Berkeley Database", "${PN}-core",
-    "bsddb lib-dynload/_bsddb.so" ) # package
-
-    m.addPackage( "${PN}-codecs", "Python codecs, encodings & i18n support", "${PN}-core ${PN}-lang",
-    "codecs.* encodings gettext.* locale.* lib-dynload/_locale.so lib-dynload/_codecs* lib-dynload/_multibytecodec.so lib-dynload/unicodedata.so stringprep.* xdrlib.*" )
-
-    m.addPackage( "${PN}-compile", "Python bytecode compilation support", "${PN}-core",
-    "py_compile.* compileall.*" )
-
-    m.addPackage( "${PN}-compiler", "Python compiler support", "${PN}-core",
-    "compiler" ) # package
-
-    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-zlib",
-    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.so" )
-
-    m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
-    "hashlib.* md5.* sha.* lib-dynload/crypt.so lib-dynload/_hashlib.so lib-dynload/_sha256.so lib-dynload/_sha512.so" )
-
-    m.addPackage( "${PN}-textutils", "Python option parsing, text wrapping and CSV support", "${PN}-core ${PN}-io ${PN}-re ${PN}-stringold",
-    "lib-dynload/_csv.so csv.* optparse.* textwrap.*" )
-
-    m.addPackage( "${PN}-curses", "Python curses support", "${PN}-core",
-    "curses lib-dynload/_curses.so lib-dynload/_curses_panel.so" ) # directory + low level module
-
-    m.addPackage( "${PN}-ctypes", "Python C types support", "${PN}-core",
-    "ctypes lib-dynload/_ctypes.so lib-dynload/_ctypes_test.so" ) # directory + low level module
-
-    m.addPackage( "${PN}-datetime", "Python calendar and time support", "${PN}-core ${PN}-codecs",
-    "_strptime.* calendar.* lib-dynload/datetime.so" )
-
-    m.addPackage( "${PN}-db", "Python file-based database support", "${PN}-core",
-    "anydbm.* dumbdbm.* whichdb.* " )
-
-    m.addPackage( "${PN}-debugger", "Python debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint",
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
-    m.addPackage( "${PN}-fcntl", "Python's fcntl interface", "${PN}-core",
-    "lib-dynload/fcntl.so" )
-
-    m.addPackage( "${PN}-hotshot", "Python hotshot performance profiler", "${PN}-core",
-    "hotshot lib-dynload/_hotshot.so" )
-
-    m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
-    "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
-
-    m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core",
-    "importlib" )
-
-    m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
-    "lib-dynload/gdbm.so" )
-
-    m.addPackage( "${PN}-image", "Python graphical image handling", "${PN}-core",
-    "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
-
-    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient ${PN}-contextlib",
-    "lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
-    "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
-
-    m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-math ${PN}-re ${PN}-codecs",
-    "json lib-dynload/_json.so" ) # package
-
-    m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core",
-    "lib-dynload/_bisect.so lib-dynload/_collections.so lib-dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_functools.so " +
-    "lib-dynload/array.so lib-dynload/itertools.so lib-dynload/operator.so lib-dynload/parser.so " +
-    "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
-    "tokenize.* traceback.* weakref.*" )
-
-    m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
-    "logging" ) # package
-
-    m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
-    "mailbox.*" )
-
-    m.addPackage( "${PN}-math", "Python math support", "${PN}-core ${PN}-crypt",
-    "lib-dynload/cmath.so lib-dynload/math.so lib-dynload/_random.so random.* sets.*" )
-
-    m.addPackage( "${PN}-mime", "Python MIME handling APIs", "${PN}-core ${PN}-io",
-    "mimetools.* uu.* quopri.* rfc822.* MimeWriter.*" )
-
-    m.addPackage( "${PN}-mmap", "Python memory-mapped file support", "${PN}-core ${PN}-io",
-    "lib-dynload/mmap.so " )
-
-    m.addPackage( "${PN}-multiprocessing", "Python multiprocessing support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap",
-    "lib-dynload/_multiprocessing.so multiprocessing" ) # package
-
-    m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
-    "*Cookie*.* " +
-    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.* urlparse.* uuid.* rfc822.* mimetools.*" )
-
-    m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading",
-    "cgi.* *HTTPServer.* SocketServer.*" )
-
-    m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re",
-    "decimal.* fractions.* numbers.*" )
-
-    m.addPackage( "${PN}-pickle", "Python serialisation/persistence support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
-    "pickle.* shelve.* lib-dynload/cPickle.so pickletools.*" )
-
-    m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
-    "pkgutil.*")
-
-    m.addPackage( "${PN}-plistlib", "Generate and parse Mac OS X .plist files", "${PN}-core ${PN}-datetime ${PN}-io",
-    "plistlib.*")
-
-    m.addPackage( "${PN}-pprint", "Python pretty-print support", "${PN}-core ${PN}-io",
-    "pprint.*" )
-
-    m.addPackage( "${PN}-profile", "Python basic performance profiling support", "${PN}-core ${PN}-textutils",
-    "profile.* pstats.* cProfile.* lib-dynload/_lsprof.so" )
-
-    m.addPackage( "${PN}-re", "Python Regular Expression APIs", "${PN}-core",
-    "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) # _sre is builtin
-
-    m.addPackage( "${PN}-readline", "Python readline support", "${PN}-core",
-    "lib-dynload/readline.so rlcompleter.*" )
-
-    m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
-    "lib-dynload/resource.so" )
-
-    m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re",
-    "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
-
-    m.addPackage( "${PN}-robotparser", "Python robots.txt parser", "${PN}-core ${PN}-netclient",
-    "robotparser.*")
-
-    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
-    "subprocess.*" )
-
-    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib",
-    "lib-dynload/_sqlite3.so sqlite3/dbapi2.* sqlite3/__init__.* sqlite3/dump.*" )
-
-    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3 database support tests", "${PN}-core ${PN}-sqlite3",
-    "sqlite3/test" )
-
-    m.addPackage( "${PN}-stringold", "Python string APIs [deprecated]", "${PN}-core ${PN}-re",
-    "lib-dynload/strop.so string.* stringold.*" )
-
-    m.addPackage( "${PN}-syslog", "Python syslog interface", "${PN}-core",
-    "lib-dynload/syslog.so" )
-
-    m.addPackage( "${PN}-terminal", "Python terminal controlling support", "${PN}-core ${PN}-io",
-    "pty.* tty.*" )
-
-    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core ${PN}-modules",
-    "test" ) # package
-
-    m.addPackage( "${PN}-threading", "Python threading & synchronization support", "${PN}-core ${PN}-lang",
-    "_threading_local.* dummy_thread.* dummy_threading.* mutex.* threading.* Queue.*" )
-
-    m.addPackage( "${PN}-tkinter", "Python Tcl/Tk bindings", "${PN}-core",
-    "lib-dynload/_tkinter.so lib-tk" ) # package
-
-    m.addPackage( "${PN}-unittest", "Python unit testing framework", "${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell",
-    "unittest/" )
-
-    m.addPackage( "${PN}-unixadmin", "Python Unix administration support", "${PN}-core",
-    "lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.so getpass.*" )
-
-    m.addPackage( "${PN}-xml", "Python basic XML support", "${PN}-core ${PN}-re",
-    "lib-dynload/_elementtree.so lib-dynload/pyexpat.so xml xmllib.*" ) # package
-
-    m.addPackage( "${PN}-xmlrpc", "Python XML-RPC support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
-    "xmlrpclib.* SimpleXMLRPCServer.* DocXMLRPCServer.*" )
-
-    m.addPackage( "${PN}-zlib", "Python zlib compression support", "${PN}-core",
-    "lib-dynload/zlib.so" )
-
-    m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
-    "mailbox.*" )
-
-    m.addPackage( "${PN}-argparse", "Python command line argument parser", "${PN}-core ${PN}-codecs ${PN}-textutils",
-    "argparse.*" )
-
-    m.addPackage( "${PN}-contextlib", "Python utilities for with-statement" +
-    "contexts.", "${PN}-core",
-    "${libdir}/python${PYTHON_MAJMIN}/contextlib.*" )
-
-    m.make()
-- 
2.12.3


