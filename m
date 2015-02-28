Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB9D72277
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Feb 2015 00:30:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 27 Feb 2015 16:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,663,1418112000"; d="scan'208";a="533989914"
Received: from unknown (HELO aehernan-DevStation.zpn.intel.com) ([10.219.4.51])
	by orsmga003.jf.intel.com with ESMTP; 27 Feb 2015 16:21:35 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 18:30:52 -0600
Message-Id: <93d70e328d697eb20a6bcd5b86ec96c89e1019cc.1425076707.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1425076707.git.alejandro.hernandez@linux.intel.com>
References: <cover.1425076707.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python3: Upgrade from 3.3.3 to 3.4.2
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
X-List-Received-Date: Sat, 28 Feb 2015 00:30:59 -0000

Modifies:
python3-native_3.3.3.bb -> python3-native_3.4.2.bb: Updates checksums, version, patches
and SRC_URIs to use xz format, LICENSE did not change, dates were updated, adds fix for
ctypes/libffi needed for pip <- required since Python 3.4 (see PEP #453).
python3_3.3.3.bb -> python3_3.4.2.bb: Updates checksums, version, patches and SRC_URIs
to use xz format, adds fix for ctypes/libffi, fixes oe_multilib_header() call,
adds python3-core as RDEPENDS to python3-misc to avoid QA issue.
generate-manifest-3.4.py - > generate-manifest-3.4.py: fixes reprlib,
adds _sitebuiltins and _collections_abc <- formerly part of collections, separated since 3.4
python-3.3-manifest.inc -> python-3.4-manifest.inc

Rebases:
12-distutils-prefix-is-inside-staging-area.patch
python-3.3-multilib.patch
04-default-is-optimized.patch
avoid-ncursesw-include-path.patch

Deletes (fixed upstream):
fix-ast.h-dependency.patch
python3-fix-build-error-with-Readline-6.3.patch
06-ctypes-libffi-fix-configure.patch
remove_sqlite_rpath.patch

[YOCTO #6857]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 ...on-3.3-manifest.inc => python-3.4-manifest.inc} | 126 +++++++--------
 ...on3-native_3.3.3.bb => python3-native_3.4.2.bb} |  17 +-
 .../python/python3/04-default-is-optimized.patch   |  39 ++---
 ...2-distutils-prefix-is-inside-staging-area.patch |  29 ++--
 .../python3/avoid-ncursesw-include-path.patch      |  30 ++--
 .../python/python3/python-3.3-multilib.patch       | 180 +++++++++++----------
 .../python/{python3_3.3.3.bb => python3_3.4.2.bb}  |  21 ++-
 ...te-manifest-3.3.py => generate-manifest-3.4.py} |   8 +-
 8 files changed, 222 insertions(+), 228 deletions(-)
 rename meta/recipes-devtools/python/{python-3.3-manifest.inc => python-3.4-manifest.inc} (50%)
 rename meta/recipes-devtools/python/{python3-native_3.3.3.bb => python3-native_3.4.2.bb} (80%)
 rename meta/recipes-devtools/python/{python3_3.3.3.bb => python3_3.4.2.bb} (93%)
 rename scripts/contrib/python/{generate-manifest-3.3.py => generate-manifest-3.4.py} (98%)

diff --git a/meta/recipes-devtools/python/python-3.3-manifest.inc b/meta/recipes-devtools/python/python-3.4-manifest.inc
similarity index 50%
rename from meta/recipes-devtools/python/python-3.3-manifest.inc
rename to meta/recipes-devtools/python/python-3.4-manifest.inc
index 61119c6..fa61556 100644
--- a/meta/recipes-devtools/python/python-3.3-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
@@ -1,6 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../../scripts/contrib/python/generate-manifest-3.3.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: './generate-manifest-3.4.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
@@ -11,51 +11,51 @@ PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-comp
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
-FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python3.3/lib2to3 "
+FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python3.4/lib2to3 "
 
 SUMMARY_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
-FILES_${PN}-audio="${libdir}/python3.3/wave.* ${libdir}/python3.3/chunk.* ${libdir}/python3.3/sndhdr.* ${libdir}/python3.3/lib-dynload/ossaudiodev.*.so ${libdir}/python3.3/lib-dynload/audioop.*.so ${libdir}/python3.3/audiodev.* ${libdir}/python3.3/sunaudio.* ${libdir}/python3.3/sunau.* ${libdir}/python3.3/toaiff.* "
+FILES_${PN}-audio="${libdir}/python3.4/wave.* ${libdir}/python3.4/chunk.* ${libdir}/python3.4/sndhdr.* ${libdir}/python3.4/lib-dynload/ossaudiodev.*.so ${libdir}/python3.4/lib-dynload/audioop.*.so ${libdir}/python3.4/audiodev.* ${libdir}/python3.4/sunaudio.* ${libdir}/python3.4/sunau.* ${libdir}/python3.4/toaiff.* "
 
 SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
 RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
-FILES_${PN}-codecs="${libdir}/python3.3/codecs.* ${libdir}/python3.3/encodings ${libdir}/python3.3/gettext.* ${libdir}/python3.3/locale.* ${libdir}/python3.3/lib-dynload/_locale.*.so ${libdir}/python3.3/lib-dynload/_codecs* ${libdir}/python3.3/lib-dynload/_multibytecodec.*.so ${libdir}/python3.3/lib-dynload/unicodedata.*.so ${libdir}/python3.3/stringprep.* ${libdir}/python3.3/xdrlib.* "
+FILES_${PN}-codecs="${libdir}/python3.4/codecs.* ${libdir}/python3.4/encodings ${libdir}/python3.4/gettext.* ${libdir}/python3.4/locale.* ${libdir}/python3.4/lib-dynload/_locale.*.so ${libdir}/python3.4/lib-dynload/_codecs* ${libdir}/python3.4/lib-dynload/_multibytecodec.*.so ${libdir}/python3.4/lib-dynload/unicodedata.*.so ${libdir}/python3.4/stringprep.* ${libdir}/python3.4/xdrlib.* "
 
 SUMMARY_${PN}-compile="Python bytecode compilation support"
 RDEPENDS_${PN}-compile="${PN}-core"
-FILES_${PN}-compile="${libdir}/python3.3/py_compile.* ${libdir}/python3.3/compileall.* "
+FILES_${PN}-compile="${libdir}/python3.4/py_compile.* ${libdir}/python3.4/compileall.* "
 
 SUMMARY_${PN}-compression="Python high-level compression support"
 RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs"
-FILES_${PN}-compression="${libdir}/python3.3/gzip.* ${libdir}/python3.3/zipfile.* ${libdir}/python3.3/tarfile.* ${libdir}/python3.3/lib-dynload/bz2.*.so "
+FILES_${PN}-compression="${libdir}/python3.4/gzip.* ${libdir}/python3.4/zipfile.* ${libdir}/python3.4/tarfile.* ${libdir}/python3.4/lib-dynload/bz2.*.so "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
-FILES_${PN}-core="${libdir}/python3.3/__future__.* ${libdir}/python3.3/_abcoll.* ${libdir}/python3.3/abc.* ${libdir}/python3.3/copy.* ${libdir}/python3.3/copyreg.* ${libdir}/python3.3/ConfigParser.* ${libdir}/python3.3/genericpath.* ${libdir}/python3.3/getopt.* ${libdir}/python3.3/linecache.* ${libdir}/python3.3/new.* ${libdir}/python3.3/os.* ${libdir}/python3.3/posixpath.* ${libdir}/python3.3/struct.* ${libdir}/python3.3/warnings.* ${libdir}/python3.3/site.* ${libdir}/python3.3/stat.* ${libdir}/python3.3/UserDict.* ${libdir}/python3.3/UserList.* ${libdir}/python3.3/UserString.* ${libdir}/python3.3/lib-dynload/binascii.*.so ${libdir}/python3.3/lib-dynload/_struct.*.so ${libdir}/python3.3/lib-dynload/time.*.so ${libdir}/python3.3/lib-dynload/xreadlines.*.so ${libdir}/python3.3/types.* ${libdir}/python3.3/platform.* ${bindir}/python* ${libdir}/python3.3/_weakrefset.* ${libdir}/python3.3/sysconfig.* ${libdir}/python3.3/_sysconfigdata.* ${libdir}/python3.3/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python3.4/__future__.* ${libdir}/python3.4/_abcoll.* ${libdir}/python3.4/abc.* ${libdir}/python3.4/copy.* ${libdir}/python3.4/copyreg.* ${libdir}/python3.4/ConfigParser.* ${libdir}/python3.4/genericpath.* ${libdir}/python3.4/getopt.* ${libdir}/python3.4/linecache.* ${libdir}/python3.4/new.* ${libdir}/python3.4/os.* ${libdir}/python3.4/posixpath.* ${libdir}/python3.4/struct.* ${libdir}/python3.4/warnings.* ${libdir}/python3.4/site.* ${libdir}/python3.4/stat.* ${libdir}/python3.4/UserDict.* ${libdir}/python3.4/UserList.* ${libdir}/python3.4/UserString.* ${libdir}/python3.4/lib-dynload/binascii.*.so ${libdir}/python3.4/lib-dynload/_struct.*.so ${libdir}/python3.4/lib-dynload/time.*.so ${libdir}/python3.4/lib-dynload/xreadlines.*.so ${libdir}/python3.4/types.* ${libdir}/python3.4/platform.* ${bindir}/python* ${libdir}/python3.4/_weakrefset.* ${libdir}/python3.4/sysconfig.* ${libdir}/python3.4/_sysconfigdata.* ${libdir}/python3.4/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
-FILES_${PN}-crypt="${libdir}/python3.3/hashlib.* ${libdir}/python3.3/md5.* ${libdir}/python3.3/sha.* ${libdir}/python3.3/lib-dynload/crypt.*.so ${libdir}/python3.3/lib-dynload/_hashlib.*.so ${libdir}/python3.3/lib-dynload/_sha256.*.so ${libdir}/python3.3/lib-dynload/_sha512.*.so "
+FILES_${PN}-crypt="${libdir}/python3.4/hashlib.* ${libdir}/python3.4/md5.* ${libdir}/python3.4/sha.* ${libdir}/python3.4/lib-dynload/crypt.*.so ${libdir}/python3.4/lib-dynload/_hashlib.*.so ${libdir}/python3.4/lib-dynload/_sha256.*.so ${libdir}/python3.4/lib-dynload/_sha512.*.so "
 
 SUMMARY_${PN}-ctypes="Python C types support"
 RDEPENDS_${PN}-ctypes="${PN}-core"
-FILES_${PN}-ctypes="${libdir}/python3.3/ctypes ${libdir}/python3.3/lib-dynload/_ctypes.*.so ${libdir}/python3.3/lib-dynload/_ctypes_test.*.so "
+FILES_${PN}-ctypes="${libdir}/python3.4/ctypes ${libdir}/python3.4/lib-dynload/_ctypes.*.so ${libdir}/python3.4/lib-dynload/_ctypes_test.*.so "
 
 SUMMARY_${PN}-curses="Python curses support"
 RDEPENDS_${PN}-curses="${PN}-core"
-FILES_${PN}-curses="${libdir}/python3.3/curses ${libdir}/python3.3/lib-dynload/_curses.*.so ${libdir}/python3.3/lib-dynload/_curses_panel.*.so "
+FILES_${PN}-curses="${libdir}/python3.4/curses ${libdir}/python3.4/lib-dynload/_curses.*.so ${libdir}/python3.4/lib-dynload/_curses_panel.*.so "
 
 SUMMARY_${PN}-datetime="Python calendar and time support"
 RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
-FILES_${PN}-datetime="${libdir}/python3.3/_strptime.* ${libdir}/python3.3/calendar.* ${libdir}/python3.3/lib-dynload/datetime.*.so "
+FILES_${PN}-datetime="${libdir}/python3.4/_strptime.* ${libdir}/python3.4/calendar.* ${libdir}/python3.4/lib-dynload/datetime.*.so "
 
 SUMMARY_${PN}-db="Python file-based database support"
 RDEPENDS_${PN}-db="${PN}-core"
-FILES_${PN}-db="${libdir}/python3.3/anydbm.* ${libdir}/python3.3/dumbdbm.* ${libdir}/python3.3/whichdb.* ${libdir}/python3.3/dbm ${libdir}/python3.3/lib-dynload/_dbm.*.so "
+FILES_${PN}-db="${libdir}/python3.4/anydbm.* ${libdir}/python3.4/dumbdbm.* ${libdir}/python3.4/whichdb.* ${libdir}/python3.4/dbm ${libdir}/python3.4/lib-dynload/_dbm.*.so "
 
 SUMMARY_${PN}-debugger="Python debugger"
 RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint"
-FILES_${PN}-debugger="${libdir}/python3.3/bdb.* ${libdir}/python3.3/pdb.* "
+FILES_${PN}-debugger="${libdir}/python3.4/bdb.* ${libdir}/python3.4/pdb.* "
 
 SUMMARY_${PN}-dev="Python development package"
 RDEPENDS_${PN}-dev="${PN}-core"
@@ -63,203 +63,203 @@ FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdi
 
 SUMMARY_${PN}-difflib="Python helpers for computing deltas between objects"
 RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
-FILES_${PN}-difflib="${libdir}/python3.3/difflib.* "
+FILES_${PN}-difflib="${libdir}/python3.4/difflib.* "
 
 SUMMARY_${PN}-distutils="Python Distribution Utilities"
 RDEPENDS_${PN}-distutils="${PN}-core"
-FILES_${PN}-distutils="${libdir}/python3.3/config ${libdir}/python3.3/distutils "
+FILES_${PN}-distutils="${libdir}/python3.4/config ${libdir}/python3.4/distutils "
 
 SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
 RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
-FILES_${PN}-distutils-staticdev="${libdir}/python3.3/config/lib*.a "
+FILES_${PN}-distutils-staticdev="${libdir}/python3.4/config/lib*.a "
 
 SUMMARY_${PN}-doctest="Python framework for running examples in docstrings"
 RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
-FILES_${PN}-doctest="${libdir}/python3.3/doctest.* "
+FILES_${PN}-doctest="${libdir}/python3.4/doctest.* "
 
 SUMMARY_${PN}-elementtree="Python elementree"
 RDEPENDS_${PN}-elementtree="${PN}-core"
-FILES_${PN}-elementtree="${libdir}/python3.3/lib-dynload/_elementtree.*.so "
+FILES_${PN}-elementtree="${libdir}/python3.4/lib-dynload/_elementtree.*.so "
 
 SUMMARY_${PN}-email="Python email support"
 RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
-FILES_${PN}-email="${libdir}/python3.3/imaplib.* ${libdir}/python3.3/email "
+FILES_${PN}-email="${libdir}/python3.4/imaplib.* ${libdir}/python3.4/email "
 
 SUMMARY_${PN}-fcntl="Python's fcntl interface"
 RDEPENDS_${PN}-fcntl="${PN}-core"
-FILES_${PN}-fcntl="${libdir}/python3.3/lib-dynload/fcntl.*.so "
+FILES_${PN}-fcntl="${libdir}/python3.4/lib-dynload/fcntl.*.so "
 
 SUMMARY_${PN}-gdbm="Python GNU database support"
 RDEPENDS_${PN}-gdbm="${PN}-core"
-FILES_${PN}-gdbm="${libdir}/python3.3/lib-dynload/_gdbm.*.so "
+FILES_${PN}-gdbm="${libdir}/python3.4/lib-dynload/_gdbm.*.so "
 
 SUMMARY_${PN}-html="Python HTML processing support"
 RDEPENDS_${PN}-html="${PN}-core"
-FILES_${PN}-html="${libdir}/python3.3/formatter.* ${libdir}/python3.3/htmlentitydefs.* ${libdir}/python3.3/htmllib.* ${libdir}/python3.3/markupbase.* ${libdir}/python3.3/sgmllib.* ${libdir}/python3.3/HTMLParser.* "
+FILES_${PN}-html="${libdir}/python3.4/formatter.* ${libdir}/python3.4/htmlentitydefs.* ${libdir}/python3.4/htmllib.* ${libdir}/python3.4/markupbase.* ${libdir}/python3.4/sgmllib.* ${libdir}/python3.4/HTMLParser.* "
 
 SUMMARY_${PN}-idle="Python Integrated Development Environment"
 RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
-FILES_${PN}-idle="${bindir}/idle ${libdir}/python3.3/idlelib "
+FILES_${PN}-idle="${bindir}/idle ${libdir}/python3.4/idlelib "
 
 SUMMARY_${PN}-image="Python graphical image handling"
 RDEPENDS_${PN}-image="${PN}-core"
-FILES_${PN}-image="${libdir}/python3.3/colorsys.* ${libdir}/python3.3/imghdr.* ${libdir}/python3.3/lib-dynload/imageop.*.so ${libdir}/python3.3/lib-dynload/rgbimg.*.so "
+FILES_${PN}-image="${libdir}/python3.4/colorsys.* ${libdir}/python3.4/imghdr.* ${libdir}/python3.4/lib-dynload/imageop.*.so ${libdir}/python3.4/lib-dynload/rgbimg.*.so "
 
 SUMMARY_${PN}-importlib="Python import implementation library"
 RDEPENDS_${PN}-importlib="${PN}-core"
-FILES_${PN}-importlib="${libdir}/python3.3/importlib "
+FILES_${PN}-importlib="${libdir}/python3.4/importlib "
 
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-FILES_${PN}-io="${libdir}/python3.3/lib-dynload/_socket.*.so ${libdir}/python3.3/lib-dynload/_io.*.so ${libdir}/python3.3/lib-dynload/_ssl.*.so ${libdir}/python3.3/lib-dynload/select.*.so ${libdir}/python3.3/lib-dynload/termios.*.so ${libdir}/python3.3/lib-dynload/cStringIO.*.so ${libdir}/python3.3/pipes.* ${libdir}/python3.3/socket.* ${libdir}/python3.3/ssl.* ${libdir}/python3.3/tempfile.* ${libdir}/python3.3/StringIO.* ${libdir}/python3.3/io.* ${libdir}/python3.3/_pyio.* "
+FILES_${PN}-io="${libdir}/python3.4/lib-dynload/_socket.*.so ${libdir}/python3.4/lib-dynload/_io.*.so ${libdir}/python3.4/lib-dynload/_ssl.*.so ${libdir}/python3.4/lib-dynload/select.*.so ${libdir}/python3.4/lib-dynload/termios.*.so ${libdir}/python3.4/lib-dynload/cStringIO.*.so ${libdir}/python3.4/pipes.* ${libdir}/python3.4/socket.* ${libdir}/python3.4/ssl.* ${libdir}/python3.4/tempfile.* ${libdir}/python3.4/StringIO.* ${libdir}/python3.4/io.* ${libdir}/python3.4/_pyio.* "
 
 SUMMARY_${PN}-json="Python JSON support"
 RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
-FILES_${PN}-json="${libdir}/python3.3/json ${libdir}/python3.3/lib-dynload/_json.*.so "
+FILES_${PN}-json="${libdir}/python3.4/json ${libdir}/python3.4/lib-dynload/_json.*.so "
 
 SUMMARY_${PN}-lang="Python low-level language support"
 RDEPENDS_${PN}-lang="${PN}-core"
-FILES_${PN}-lang="${libdir}/python3.3/lib-dynload/_bisect.*.so ${libdir}/python3.3/lib-dynload/_collections.*.so ${libdir}/python3.3/lib-dynload/_heapq.*.so ${libdir}/python3.3/lib-dynload/_weakref.*.so ${libdir}/python3.3/lib-dynload/_functools.*.so ${libdir}/python3.3/lib-dynload/array.*.so ${libdir}/python3.3/lib-dynload/itertools.*.so ${libdir}/python3.3/lib-dynload/operator.*.so ${libdir}/python3.3/lib-dynload/parser.*.so ${libdir}/python3.3/atexit.* ${libdir}/python3.3/bisect.* ${libdir}/python3.3/code.* ${libdir}/python3.3/codeop.* ${libdir}/python3.3/collections.* ${libdir}/python3.3/dis.* ${libdir}/python3.3/functools.* ${libdir}/python3.3/heapq.* ${libdir}/python3.3/inspect.* ${libdir}/python3.3/keyword.* ${libdir}/python3.3/opcode.* ${libdir}/python3.3/symbol.* ${libdir}/python3.3/repr.* ${libdir}/python3.3/token.* ${libdir}/python3.3/tokenize.* ${libdir}/python3.3/traceback.* ${libdir}/python3.3/weakref.* "
+FILES_${PN}-lang="${libdir}/python3.4/lib-dynload/_bisect.*.so ${libdir}/python3.4/lib-dynload/_collections.*.so ${libdir}/python3.4/lib-dynload/_heapq.*.so ${libdir}/python3.4/lib-dynload/_weakref.*.so ${libdir}/python3.4/lib-dynload/_functools.*.so ${libdir}/python3.4/lib-dynload/array.*.so ${libdir}/python3.4/lib-dynload/itertools.*.so ${libdir}/python3.4/lib-dynload/operator.*.so ${libdir}/python3.4/lib-dynload/parser.*.so ${libdir}/python3.4/atexit.* ${libdir}/python3.4/bisect.* ${libdir}/python3.4/code.* ${libdir}/python3.4/codeop.* ${libdir}/python3.4/collections.* ${libdir}/python3.4/_collections_abc.* ${libdir}/python3.4/dis.* ${libdir}/python3.4/functools.* ${libdir}/python3.4/heapq.* ${libdir}/python3.4/inspect.* ${libdir}/python3.4/keyword.* ${libdir}/python3.4/opcode.* ${libdir}/python3.4/symbol.* ${libdir}/python3.4/repr.* ${libdir}/python3.4/token.* ${libdir}/python3.4/tokenize.* ${libdir}/python3.4/traceback.* ${libdir}/python3.4/weakref.* "
 
 SUMMARY_${PN}-logging="Python logging support"
 RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
-FILES_${PN}-logging="${libdir}/python3.3/logging "
+FILES_${PN}-logging="${libdir}/python3.4/logging "
 
 SUMMARY_${PN}-mailbox="Python mailbox format support"
 RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
-FILES_${PN}-mailbox="${libdir}/python3.3/mailbox.* "
+FILES_${PN}-mailbox="${libdir}/python3.4/mailbox.* "
 
 SUMMARY_${PN}-math="Python math support"
 RDEPENDS_${PN}-math="${PN}-core"
-FILES_${PN}-math="${libdir}/python3.3/lib-dynload/cmath.*.so ${libdir}/python3.3/lib-dynload/math.*.so ${libdir}/python3.3/lib-dynload/_random.*.so ${libdir}/python3.3/random.* ${libdir}/python3.3/sets.* "
+FILES_${PN}-math="${libdir}/python3.4/lib-dynload/cmath.*.so ${libdir}/python3.4/lib-dynload/math.*.so ${libdir}/python3.4/lib-dynload/_random.*.so ${libdir}/python3.4/random.* ${libdir}/python3.4/sets.* "
 
 SUMMARY_${PN}-mime="Python MIME handling APIs"
 RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
-FILES_${PN}-mime="${libdir}/python3.3/mimetools.* ${libdir}/python3.3/uu.* ${libdir}/python3.3/quopri.* ${libdir}/python3.3/rfc822.* ${libdir}/python3.3/MimeWriter.* "
+FILES_${PN}-mime="${libdir}/python3.4/mimetools.* ${libdir}/python3.4/uu.* ${libdir}/python3.4/quopri.* ${libdir}/python3.4/rfc822.* ${libdir}/python3.4/MimeWriter.* "
 
 SUMMARY_${PN}-mmap="Python memory-mapped file support"
 RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
-FILES_${PN}-mmap="${libdir}/python3.3/lib-dynload/mmap.*.so "
+FILES_${PN}-mmap="${libdir}/python3.4/lib-dynload/mmap.*.so "
 
 SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
 RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
-FILES_${PN}-multiprocessing="${libdir}/python3.3/lib-dynload/_multiprocessing.*.so ${libdir}/python3.3/multiprocessing "
+FILES_${PN}-multiprocessing="${libdir}/python3.4/lib-dynload/_multiprocessing.*.so ${libdir}/python3.4/multiprocessing "
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
 RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
-FILES_${PN}-netclient="${libdir}/python3.3/*Cookie*.* ${libdir}/python3.3/base64.* ${libdir}/python3.3/cookielib.* ${libdir}/python3.3/ftplib.* ${libdir}/python3.3/gopherlib.* ${libdir}/python3.3/hmac.* ${libdir}/python3.3/httplib.* ${libdir}/python3.3/mimetypes.* ${libdir}/python3.3/nntplib.* ${libdir}/python3.3/poplib.* ${libdir}/python3.3/smtplib.* ${libdir}/python3.3/telnetlib.* ${libdir}/python3.3/urllib.* ${libdir}/python3.3/urllib2.* ${libdir}/python3.3/urlparse.* ${libdir}/python3.3/uuid.* ${libdir}/python3.3/rfc822.* ${libdir}/python3.3/mimetools.* "
+FILES_${PN}-netclient="${libdir}/python3.4/*Cookie*.* ${libdir}/python3.4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* ${libdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3.4/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.* ${libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/python3.4/telnetlib.* ${libdir}/python3.4/urllib.* ${libdir}/python3.4/urllib2.* ${libdir}/python3.4/urlparse.* ${libdir}/python3.4/uuid.* ${libdir}/python3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
-FILES_${PN}-netserver="${libdir}/python3.3/cgi.* ${libdir}/python3.3/*HTTPServer.* ${libdir}/python3.3/SocketServer.* "
+FILES_${PN}-netserver="${libdir}/python3.4/cgi.* ${libdir}/python3.4/*HTTPServer.* ${libdir}/python3.4/SocketServer.* "
 
 SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python3.3/decimal.* ${libdir}/python3.3/numbers.* "
+FILES_${PN}-numbers="${libdir}/python3.4/decimal.* ${libdir}/python3.4/numbers.* "
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python3.3/pickle.* ${libdir}/python3.3/shelve.* ${libdir}/python3.3/lib-dynload/cPickle.*.so ${libdir}/python3.3/pickletools.* "
+FILES_${PN}-pickle="${libdir}/python3.4/pickle.* ${libdir}/python3.4/shelve.* ${libdir}/python3.4/lib-dynload/cPickle.*.so ${libdir}/python3.4/pickletools.* "
 
 SUMMARY_${PN}-pkgutil="Python package extension utility support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
-FILES_${PN}-pkgutil="${libdir}/python3.3/pkgutil.* "
+FILES_${PN}-pkgutil="${libdir}/python3.4/pkgutil.* "
 
 SUMMARY_${PN}-pprint="Python pretty-print support"
 RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
-FILES_${PN}-pprint="${libdir}/python3.3/pprint.* "
+FILES_${PN}-pprint="${libdir}/python3.4/pprint.* "
 
 SUMMARY_${PN}-profile="Python basic performance profiling support"
 RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
-FILES_${PN}-profile="${libdir}/python3.3/profile.* ${libdir}/python3.3/pstats.* ${libdir}/python3.3/cProfile.* ${libdir}/python3.3/lib-dynload/_lsprof.*.so "
+FILES_${PN}-profile="${libdir}/python3.4/profile.* ${libdir}/python3.4/pstats.* ${libdir}/python3.4/cProfile.* ${libdir}/python3.4/lib-dynload/_lsprof.*.so "
 
 SUMMARY_${PN}-pydoc="Python interactive help support"
 RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
-FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python3.3/pydoc.* ${libdir}/python3.3/pydoc_data "
+FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python3.4/pydoc.* ${libdir}/python3.4/pydoc_data "
 
 SUMMARY_${PN}-re="Python Regular Expression APIs"
 RDEPENDS_${PN}-re="${PN}-core"
-FILES_${PN}-re="${libdir}/python3.3/re.* ${libdir}/python3.3/sre.* ${libdir}/python3.3/sre_compile.* ${libdir}/python3.3/sre_constants* ${libdir}/python3.3/sre_parse.* "
+FILES_${PN}-re="${libdir}/python3.4/re.* ${libdir}/python3.4/sre.* ${libdir}/python3.4/sre_compile.* ${libdir}/python3.4/sre_constants* ${libdir}/python3.4/sre_parse.* "
 
 SUMMARY_${PN}-readline="Python readline support"
 RDEPENDS_${PN}-readline="${PN}-core"
-FILES_${PN}-readline="${libdir}/python3.3/lib-dynload/readline.*.so ${libdir}/python3.3/rlcompleter.* "
+FILES_${PN}-readline="${libdir}/python3.4/lib-dynload/readline.*.so ${libdir}/python3.4/rlcompleter.* "
 
 SUMMARY_${PN}-reprlib="Python alternate repr() implementation"
 RDEPENDS_${PN}-reprlib="${PN}-core"
-FILES_${PN}-reprlib="${libdir}/python3.3/reprlib.py "
+FILES_${PN}-reprlib="${libdir}/python3.4/reprlib.py "
 
 SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
-FILES_${PN}-resource="${libdir}/python3.3/lib-dynload/resource.*.so "
+FILES_${PN}-resource="${libdir}/python3.4/lib-dynload/resource.*.so "
 
 SUMMARY_${PN}-robotparser="Python robots.txt parser"
 RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
-FILES_${PN}-robotparser="${libdir}/python3.3/urllib/robotparser.* "
+FILES_${PN}-robotparser="${libdir}/python3.4/urllib/robotparser.* "
 
 SUMMARY_${PN}-shell="Python shell-like functionality"
 RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
-FILES_${PN}-shell="${libdir}/python3.3/cmd.* ${libdir}/python3.3/commands.* ${libdir}/python3.3/dircache.* ${libdir}/python3.3/fnmatch.* ${libdir}/python3.3/glob.* ${libdir}/python3.3/popen2.* ${libdir}/python3.3/shlex.* ${libdir}/python3.3/shutil.* "
+FILES_${PN}-shell="${libdir}/python3.4/cmd.* ${libdir}/python3.4/commands.* ${libdir}/python3.4/dircache.* ${libdir}/python3.4/fnmatch.* ${libdir}/python3.4/glob.* ${libdir}/python3.4/popen2.* ${libdir}/python3.4/shlex.* ${libdir}/python3.4/shutil.* "
 
 SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
 RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
-FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python3.3/smtpd.* "
+FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python3.4/smtpd.* "
 
 SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
 RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading"
-FILES_${PN}-sqlite3="${libdir}/python3.3/lib-dynload/_sqlite3.*.so ${libdir}/python3.3/sqlite3/dbapi2.* ${libdir}/python3.3/sqlite3/__init__.* ${libdir}/python3.3/sqlite3/dump.* "
+FILES_${PN}-sqlite3="${libdir}/python3.4/lib-dynload/_sqlite3.*.so ${libdir}/python3.4/sqlite3/dbapi2.* ${libdir}/python3.4/sqlite3/__init__.* ${libdir}/python3.4/sqlite3/dump.* "
 
 SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support tests"
 RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
-FILES_${PN}-sqlite3-tests="${libdir}/python3.3/sqlite3/test "
+FILES_${PN}-sqlite3-tests="${libdir}/python3.4/sqlite3/test "
 
 SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
 RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
-FILES_${PN}-stringold="${libdir}/python3.3/lib-dynload/strop.*.so ${libdir}/python3.3/string.* ${libdir}/python3.3/stringold.* "
+FILES_${PN}-stringold="${libdir}/python3.4/lib-dynload/strop.*.so ${libdir}/python3.4/string.* ${libdir}/python3.4/stringold.* "
 
 SUMMARY_${PN}-subprocess="Python subprocess support"
 RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
-FILES_${PN}-subprocess="${libdir}/python3.3/subprocess.* "
+FILES_${PN}-subprocess="${libdir}/python3.4/subprocess.* "
 
 SUMMARY_${PN}-syslog="Python syslog interface"
 RDEPENDS_${PN}-syslog="${PN}-core"
-FILES_${PN}-syslog="${libdir}/python3.3/lib-dynload/syslog.*.so "
+FILES_${PN}-syslog="${libdir}/python3.4/lib-dynload/syslog.*.so "
 
 SUMMARY_${PN}-terminal="Python terminal controlling support"
 RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
-FILES_${PN}-terminal="${libdir}/python3.3/pty.* ${libdir}/python3.3/tty.* "
+FILES_${PN}-terminal="${libdir}/python3.4/pty.* ${libdir}/python3.4/tty.* "
 
 SUMMARY_${PN}-tests="Python tests"
 RDEPENDS_${PN}-tests="${PN}-core"
-FILES_${PN}-tests="${libdir}/python3.3/test "
+FILES_${PN}-tests="${libdir}/python3.4/test "
 
 SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
 RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
-FILES_${PN}-textutils="${libdir}/python3.3/lib-dynload/_csv.*.so ${libdir}/python3.3/csv.* ${libdir}/python3.3/optparse.* ${libdir}/python3.3/textwrap.* "
+FILES_${PN}-textutils="${libdir}/python3.4/lib-dynload/_csv.*.so ${libdir}/python3.4/csv.* ${libdir}/python3.4/optparse.* ${libdir}/python3.4/textwrap.* "
 
 SUMMARY_${PN}-threading="Python threading & synchronization support"
 RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
-FILES_${PN}-threading="${libdir}/python3.3/_threading_local.* ${libdir}/python3.3/dummy_thread.* ${libdir}/python3.3/dummy_threading.* ${libdir}/python3.3/mutex.* ${libdir}/python3.3/threading.* ${libdir}/python3.3/Queue.* "
+FILES_${PN}-threading="${libdir}/python3.4/_threading_local.* ${libdir}/python3.4/dummy_thread.* ${libdir}/python3.4/dummy_threading.* ${libdir}/python3.4/mutex.* ${libdir}/python3.4/threading.* ${libdir}/python3.4/Queue.* "
 
 SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
 RDEPENDS_${PN}-tkinter="${PN}-core"
-FILES_${PN}-tkinter="${libdir}/python3.3/lib-dynload/_tkinter.*.so ${libdir}/python3.3/lib-tk ${libdir}/python3.3/tkinter "
+FILES_${PN}-tkinter="${libdir}/python3.4/lib-dynload/_tkinter.*.so ${libdir}/python3.4/lib-tk ${libdir}/python3.4/tkinter "
 
 SUMMARY_${PN}-unittest="Python unit testing framework"
 RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
-FILES_${PN}-unittest="${libdir}/python3.3/unittest/ "
+FILES_${PN}-unittest="${libdir}/python3.4/unittest/ "
 
 SUMMARY_${PN}-unixadmin="Python Unix administration support"
 RDEPENDS_${PN}-unixadmin="${PN}-core"
-FILES_${PN}-unixadmin="${libdir}/python3.3/lib-dynload/nis.*.so ${libdir}/python3.3/lib-dynload/grp.*.so ${libdir}/python3.3/lib-dynload/pwd.*.so ${libdir}/python3.3/getpass.* "
+FILES_${PN}-unixadmin="${libdir}/python3.4/lib-dynload/nis.*.so ${libdir}/python3.4/lib-dynload/grp.*.so ${libdir}/python3.4/lib-dynload/pwd.*.so ${libdir}/python3.4/getpass.* "
 
 SUMMARY_${PN}-xml="Python basic XML support"
 RDEPENDS_${PN}-xml="${PN}-core ${PN}-elementtree ${PN}-re"
-FILES_${PN}-xml="${libdir}/python3.3/lib-dynload/pyexpat.*.so ${libdir}/python3.3/xml ${libdir}/python3.3/xmllib.* "
+FILES_${PN}-xml="${libdir}/python3.4/lib-dynload/pyexpat.*.so ${libdir}/python3.4/xml ${libdir}/python3.4/xmllib.* "
 
 SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
 RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
-FILES_${PN}-xmlrpc="${libdir}/python3.3/xmlrpclib.* ${libdir}/python3.3/SimpleXMLRPCServer.* ${libdir}/python3.3/DocXMLRPCServer.* ${libdir}/python3.3/xmlrpc "
+FILES_${PN}-xmlrpc="${libdir}/python3.4/xmlrpclib.* ${libdir}/python3.4/SimpleXMLRPCServer.* ${libdir}/python3.4/DocXMLRPCServer.* ${libdir}/python3.4/xmlrpc "
 
 SUMMARY_${PN}-modules="All Python modules"
 RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.4.2.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-native_3.3.3.bb
rename to meta/recipes-devtools/python/python3-native_3.4.2.bb
index 73ce095..d98a278 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.2.bb
@@ -1,10 +1,10 @@
 require recipes-devtools/python/python.inc
 
 PR = "${INC_PR}.0"
-PYTHON_MAJMIN = "3.3"
+PYTHON_MAJMIN = "3.4"
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://12-distutils-prefix-is-inside-staging-area.patch \
 file://python-config.patch \
 file://000-cross-compile.patch \
@@ -18,22 +18,19 @@ file://150-fix-setupterm.patch \
 file://python-3.3-multilib.patch \
 file://03-fix-tkinter-detection.patch \
 file://avoid_warning_about_tkinter.patch \
-file://06-ctypes-libffi-fix-configure.patch \
 file://shutil-follow-symlink-fix.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://sysroot-include-headers.patch \
 file://unixccompiler.patch \
-file://fix-ast.h-dependency.patch \
 file://makerace.patch \
 ${DISTRO_SRC_URI} \
-file://python3-fix-build-error-with-Readline-6.3.patch \
 file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 "
-SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
-SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
+SRC_URI[md5sum] = "36fc7327c02c6f12fa24fc9ba78039e3"
+SRC_URI[sha256sum] = "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827e0f970dcf04b2def"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4eaea08eaaf6875189b0c49f26fa2005"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
 S = "${WORKDIR}/Python-${PV}"
 
@@ -59,8 +56,8 @@ EXTRA_OEMAKE = '\
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
-do_configure_prepend() {
-	autoreconf --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
+do_configure_append() {
+	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
 do_install() {
diff --git a/meta/recipes-devtools/python/python3/04-default-is-optimized.patch b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
index d5afd40..3b8f264 100644
--- a/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
+++ b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
@@ -1,20 +1,21 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-Updated original patch for python 2.7.3
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/01
-
-
 # when compiling for an embedded system, we need every bit of
 # performance we can get. default to optimized with the option
 # of opt-out.
 # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
 
-Index: Python-3.2.3/Python/compile.c
+
+2012/05/01
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Rebased for 3.4.2 02/2015
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+
+Index: Python-3.4.2/Python/compile.c
 ===================================================================
---- Python-3.2.3.orig/Python/compile.c	2012-04-10 23:54:08.000000000 -0700
-+++ Python-3.2.3/Python/compile.c	2012-09-19 15:58:46.649123998 -0700
+--- Python-3.4.2.orig/Python/compile.c
++++ Python-3.4.2/Python/compile.c
 @@ -30,7 +30,7 @@
  #include "symtable.h"
  #include "opcode.h"
@@ -24,28 +25,28 @@ Index: Python-3.2.3/Python/compile.c
  
  #define DEFAULT_BLOCK_SIZE 16
  #define DEFAULT_BLOCKS 8
-Index: Python-3.2.3/Modules/main.c
+Index: Python-3.4.2/Modules/main.c
 ===================================================================
---- Python-3.2.3.orig/Modules/main.c	2012-04-10 23:54:07.000000000 -0700
-+++ Python-3.2.3/Modules/main.c	2012-09-19 16:00:32.153124053 -0700
-@@ -46,7 +46,7 @@
+--- Python-3.4.2.orig/Modules/main.c
++++ Python-3.4.2/Modules/main.c
+@@ -38,7 +38,7 @@ static wchar_t **orig_argv;
  static int  orig_argc;
  
  /* command line options */
--#define BASE_OPTS L"bBc:dEhiJm:OqRsStuvVW:xX:?"
-+#define BASE_OPTS L"bBc:dEhiJm:NOqRsStuvVW:xX:?"
+-#define BASE_OPTS L"bBc:dEhiIJm:OqRsStuvVW:xX:?"
++#define BASE_OPTS L"bBc:dEhiIJm:NOqRsStuvVW:xX:?"
  
  #define PROGRAM_OPTS BASE_OPTS
  
-@@ -71,6 +71,7 @@
+@@ -64,6 +64,7 @@ static char *usage_2 = "\
  -m mod : run library module as a script (terminates option list)\n\
  -O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
  -OO    : remove doc-strings in addition to the -O optimizations\n\
 +-N     : do NOT optimize generated bytecode\n\
  -q     : don't print version and copyright messages on interactive startup\n\
- -R     : use a pseudo-random salt to make hash() values of various types be\n\
-          unpredictable between separate invocations of the interpreter, as\n\
-@@ -407,8 +408,8 @@
+ -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
+ -S     : don't imply 'import site' on initialization\n\
+@@ -418,8 +419,8 @@ Py_Main(int argc, wchar_t **argv)
  
          /* case 'J': reserved for Jython */
  
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index c5846a5..bf02df2 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,15 +1,18 @@
 Upstream-Status: Inappropriate [embedded specific]
 
+02/2015 Rebased for Python 3.4.2
+
 # The proper prefix is inside our staging area.
 # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
 # Signed-off-by: Phil Blundell <philb@gnu.org>
 # Signed-off-by: Khem Raj <raj.khem@gmail.com>
+# Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-3.3.2/Lib/distutils/sysconfig.py
+Index: Python-3.4.2/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-3.3.2.orig/Lib/distutils/sysconfig.py	2013-07-30 00:00:52.769749805 -0700
-+++ Python-3.3.2/Lib/distutils/sysconfig.py	2013-07-30 00:16:22.545767248 -0700
-@@ -16,10 +16,11 @@
+--- Python-3.4.2.orig/Lib/distutils/sysconfig.py
++++ Python-3.4.2/Lib/distutils/sysconfig.py
+@@ -16,10 +16,11 @@ import sys
  from .errors import DistutilsPlatformError
  
  # These are needed in a couple of spots, so just compute them once.
@@ -25,7 +28,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
  
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
-@@ -93,7 +94,9 @@
+@@ -93,7 +94,9 @@ def get_python_inc(plat_specific=0, pref
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -36,7 +39,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
          prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
      if os.name == "posix":
          if python_build:
-@@ -136,6 +139,12 @@
+@@ -134,6 +137,12 @@ def get_python_lib(plat_specific=0, stan
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -49,7 +52,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
      if prefix is None:
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
-@@ -144,7 +153,7 @@
+@@ -142,7 +151,7 @@ def get_python_lib(plat_specific=0, stan
  
      if os.name == "posix":
          libpython = os.path.join(prefix,
@@ -58,16 +61,16 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
-@@ -249,7 +258,7 @@
+@@ -242,7 +251,7 @@ def get_config_h_filename():
      else:
-         # The name of the config.h file changed in 2.2
-         config_h = 'pyconfig.h'
--    return os.path.join(inc_dir, config_h)
-+    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+         inc_dir = get_python_inc(plat_specific=1)
+ 
+-    return os.path.join(inc_dir, 'pyconfig.h')
++    return os.path.join(inc_dir, 'pyconfig.h'.replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") ))
  
  
  def get_makefile_filename():
-@@ -258,7 +267,7 @@
+@@ -251,7 +260,7 @@ def get_makefile_filename():
          return os.path.join(_sys_home or project_base, "Makefile")
      lib_dir = get_python_lib(plat_specific=0, standard_lib=1)
      config_file = 'config-{}{}'.format(get_python_version(), build_flags)
diff --git a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
index 054a131..f29ae53 100644
--- a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
+++ b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
@@ -1,29 +1,21 @@
+Upstream-Status: Pending
+
 We should make sure that sysroot is used by gcc instead of assuming
 hardcoded locations for include paths
 
-Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-:
-Index: Python-3.3.3/configure.ac
+
+Index: Python-3.4.2/configure.ac
 ===================================================================
---- Python-3.3.3.orig/configure.ac	2014-01-29 19:00:15.245312752 -0800
-+++ Python-3.3.3/configure.ac	2014-01-29 23:27:22.938526262 -0800
-@@ -1548,7 +1548,7 @@
- # checks for header files
- AC_HEADER_STDC
- ac_save_cppflags="$CPPFLAGS"
--CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
-+CPPFLAGS="$CPPFLAGS -I=/usr/include/ncursesw"
- AC_CHECK_HEADERS(asm/types.h conio.h curses.h direct.h dlfcn.h errno.h \
- fcntl.h grp.h \
- ieeefp.h io.h langinfo.h libintl.h ncurses.h process.h pthread.h \
-@@ -4308,7 +4308,7 @@
- fi
+--- Python-3.4.2.orig/configure.ac
++++ Python-3.4.2/configure.ac
+@@ -4434,7 +4434,7 @@ fi
  
+ # first curses header check
  ac_save_cppflags="$CPPFLAGS"
 -CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
 +CPPFLAGS="$CPPFLAGS -I=/usr/include/ncursesw"
- # On HP/UX 11.0, mvwdelch is a block with a return statement
- AC_MSG_CHECKING(whether mvwdelch is an expression)
- AC_CACHE_VAL(ac_cv_mvwdelch_is_expression,
+ 
+ AC_CHECK_HEADERS(curses.h ncurses.h)
+ 
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 7d66a0e..b3e9860 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -1,14 +1,17 @@
+Upstream-Status: Pending
+
 get the sys.lib from python itself and do not use hardcoded value of 'lib'
 
--Khem
+02/2015 Rebased for 3.4.2
 
-Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-3.3.2/Include/pythonrun.h
+Index: Python-3.4.2/Include/pythonrun.h
 ===================================================================
---- Python-3.3.2.orig/Include/pythonrun.h	2013-05-15 09:32:54.000000000 -0700
-+++ Python-3.3.2/Include/pythonrun.h	2013-07-27 16:19:54.099877246 -0700
-@@ -181,6 +181,8 @@
+--- Python-3.4.2.orig/Include/pythonrun.h
++++ Python-3.4.2/Include/pythonrun.h
+@@ -220,6 +220,8 @@ int _Py_CheckPython3();
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
  PyAPI_FUNC(const char *) Py_GetPlatform(void);
@@ -17,20 +20,20 @@ Index: Python-3.3.2/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-3.3.2/Lib/distutils/command/install.py
+Index: Python-3.4.2/Lib/distutils/command/install.py
 ===================================================================
---- Python-3.3.2.orig/Lib/distutils/command/install.py	2013-05-15 09:32:54.000000000 -0700
-+++ Python-3.3.2/Lib/distutils/command/install.py	2013-07-27 16:19:54.099877246 -0700
-@@ -25,6 +25,8 @@
-     from site import USER_SITE
-     HAS_USER_SITE = True
+--- Python-3.4.2.orig/Lib/distutils/command/install.py
++++ Python-3.4.2/Lib/distutils/command/install.py
+@@ -19,6 +19,8 @@ from site import USER_BASE
+ from site import USER_SITE
+ HAS_USER_SITE = True
  
 +libname = sys.lib
 +
- if sys.version < "2.2":
-     WINDOWS_SCHEME = {
-         'purelib': '$base',
-@@ -45,7 +47,7 @@
+ WINDOWS_SCHEME = {
+     'purelib': '$base/Lib/site-packages',
+     'platlib': '$base/Lib/site-packages',
+@@ -30,7 +32,7 @@ WINDOWS_SCHEME = {
  INSTALL_SCHEMES = {
      'unix_prefix': {
          'purelib': '$base/lib/python$py_version_short/site-packages',
@@ -39,11 +42,11 @@ Index: Python-3.3.2/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-3.3.2/Lib/pydoc.py
+Index: Python-3.4.2/Lib/pydoc.py
 ===================================================================
---- Python-3.3.2.orig/Lib/pydoc.py	2013-05-15 09:32:55.000000000 -0700
-+++ Python-3.3.2/Lib/pydoc.py	2013-07-27 16:19:54.103877246 -0700
-@@ -372,7 +372,7 @@
+--- Python-3.4.2.orig/Lib/pydoc.py
++++ Python-3.4.2/Lib/pydoc.py
+@@ -394,7 +394,7 @@ class Doc:
  
          docloc = os.environ.get("PYTHONDOCS", self.PYTHONDOCS)
  
@@ -52,38 +55,11 @@ Index: Python-3.3.2/Lib/pydoc.py
                                 "python%d.%d" %  sys.version_info[:2])
          if (isinstance(object, type(os)) and
              (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-3.3.2/Lib/site.py
-===================================================================
---- Python-3.3.2.orig/Lib/site.py	2013-05-15 09:32:55.000000000 -0700
-+++ Python-3.3.2/Lib/site.py	2013-07-27 16:19:54.103877246 -0700
-@@ -303,13 +303,19 @@
-         if sys.platform in ('os2emx', 'riscos'):
-             sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
-         elif os.sep == '/':
--            sitepackages.append(os.path.join(prefix, "lib",
-+            sitepackages.append(os.path.join(prefix, sys.lib,
-                                         "python" + sys.version[:3],
-                                         "site-packages"))
--            sitepackages.append(os.path.join(prefix, "lib", "site-python"))
-+            if sys.lib != "lib":
-+                sitepackages.append(os.path.join(prefix, "lib",
-+                                        "python" + sys.version[:3],
-+                                        "site-packages"))
-+            sitepackages.append(os.path.join(prefix, sys.lib, "site-python"))
-+            if sys.lib != "lib":
-+                sitepackages.append(os.path.join(prefix, "lib", "site-python"))
-         else:
-             sitepackages.append(prefix)
--            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
-+            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
-         if sys.platform == "darwin":
-             # for framework builds *only* we add the standard Apple
-             # locations.
-Index: Python-3.3.2/Lib/trace.py
+Index: Python-3.4.2/Lib/trace.py
 ===================================================================
---- Python-3.3.2.orig/Lib/trace.py	2013-05-15 09:32:56.000000000 -0700
-+++ Python-3.3.2/Lib/trace.py	2013-07-27 16:19:54.103877246 -0700
-@@ -751,10 +751,10 @@
+--- Python-3.4.2.orig/Lib/trace.py
++++ Python-3.4.2/Lib/trace.py
+@@ -751,10 +751,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
                  s = s.replace("$prefix",
@@ -96,11 +72,11 @@ Index: Python-3.3.2/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-3.3.2/Makefile.pre.in
+Index: Python-3.4.2/Makefile.pre.in
 ===================================================================
---- Python-3.3.2.orig/Makefile.pre.in	2013-07-27 16:19:16.000000000 -0700
-+++ Python-3.3.2/Makefile.pre.in	2013-07-27 16:19:54.103877246 -0700
-@@ -96,6 +96,8 @@
+--- Python-3.4.2.orig/Makefile.pre.in
++++ Python-3.4.2/Makefile.pre.in
+@@ -101,6 +101,8 @@ PY_CORE_CFLAGS=	$(PY_CFLAGS) $(PY_CFLAGS
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -109,7 +85,7 @@ Index: Python-3.3.2/Makefile.pre.in
  
  # Multiarch directory (may be empty)
  MULTIARCH=	@MULTIARCH@
-@@ -115,7 +117,7 @@
+@@ -120,7 +122,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -118,7 +94,7 @@ Index: Python-3.3.2/Makefile.pre.in
  ABIFLAGS=	@ABIFLAGS@
  
  # Detailed destination directories
-@@ -635,6 +637,7 @@
+@@ -712,6 +714,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -126,7 +102,7 @@ Index: Python-3.3.2/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -701,7 +704,7 @@
+@@ -780,7 +783,7 @@ $(AST_C): $(AST_H) $(AST_ASDL) $(ASDLGEN
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -135,11 +111,11 @@ Index: Python-3.3.2/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-3.3.2/Modules/getpath.c
+Index: Python-3.4.2/Modules/getpath.c
 ===================================================================
---- Python-3.3.2.orig/Modules/getpath.c	2013-05-15 09:32:59.000000000 -0700
-+++ Python-3.3.2/Modules/getpath.c	2013-07-27 16:19:54.107877246 -0700
-@@ -121,9 +121,11 @@
+--- Python-3.4.2.orig/Modules/getpath.c
++++ Python-3.4.2/Modules/getpath.c
+@@ -117,9 +117,11 @@
  #define EXEC_PREFIX PREFIX
  #endif
  
@@ -153,20 +129,19 @@ Index: Python-3.3.2/Modules/getpath.c
  #endif
  
  #ifndef LANDMARK
-@@ -135,7 +137,7 @@
+@@ -130,6 +132,7 @@ static wchar_t prefix[MAXPATHLEN+1];
+ static wchar_t exec_prefix[MAXPATHLEN+1];
  static wchar_t progpath[MAXPATHLEN+1];
  static wchar_t *module_search_path = NULL;
- static int module_search_path_malloced = 0;
--static wchar_t *lib_python = L"lib/python" VERSION;
 +static wchar_t *lib_python = L"" LIB_PYTHON;
  
  static void
  reduce(wchar_t *dir)
-Index: Python-3.3.2/Python/getplatform.c
+Index: Python-3.4.2/Python/getplatform.c
 ===================================================================
---- Python-3.3.2.orig/Python/getplatform.c	2013-05-15 09:33:00.000000000 -0700
-+++ Python-3.3.2/Python/getplatform.c	2013-07-27 16:19:54.107877246 -0700
-@@ -10,3 +10,23 @@
+--- Python-3.4.2.orig/Python/getplatform.c
++++ Python-3.4.2/Python/getplatform.c
+@@ -10,3 +10,23 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
  }
@@ -190,11 +165,11 @@ Index: Python-3.3.2/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-3.3.2/Python/sysmodule.c
+Index: Python-3.4.2/Python/sysmodule.c
 ===================================================================
---- Python-3.3.2.orig/Python/sysmodule.c	2013-05-15 09:33:00.000000000 -0700
-+++ Python-3.3.2/Python/sysmodule.c	2013-07-27 16:19:54.107877246 -0700
-@@ -1612,6 +1612,10 @@
+--- Python-3.4.2.orig/Python/sysmodule.c
++++ Python-3.4.2/Python/sysmodule.c
+@@ -1697,6 +1697,10 @@ _PySys_Init(void)
                          PyUnicode_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyUnicode_FromString(Py_GetPlatform()));
@@ -205,11 +180,11 @@ Index: Python-3.3.2/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyUnicode_FromWideChar(
                                 Py_GetProgramFullPath(), -1));
-Index: Python-3.3.2/setup.py
+Index: Python-3.4.2/setup.py
 ===================================================================
---- Python-3.3.2.orig/setup.py	2013-07-27 16:19:17.000000000 -0700
-+++ Python-3.3.2/setup.py	2013-07-27 16:19:54.107877246 -0700
-@@ -439,7 +439,7 @@
+--- Python-3.4.2.orig/setup.py
++++ Python-3.4.2/setup.py
+@@ -454,7 +454,7 @@ class PyBuildExt(build_ext):
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -218,7 +193,7 @@ Index: Python-3.3.2/setup.py
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -497,8 +497,7 @@
+@@ -512,8 +512,7 @@ class PyBuildExt(build_ext):
          # be assumed that no additional -I,-L directives are needed.
          if not cross_compiling:
              lib_dirs = self.compiler.library_dirs + [
@@ -228,7 +203,7 @@ Index: Python-3.3.2/setup.py
                  ]
              inc_dirs = self.compiler.include_dirs + ['/usr/include']
          else:
-@@ -675,11 +674,11 @@
+@@ -696,11 +695,11 @@ class PyBuildExt(build_ext):
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -242,11 +217,11 @@ Index: Python-3.3.2/setup.py
                                     extra_link_args=readline_extra_link_args,
                                     libraries=readline_libs) )
          else:
-Index: Python-3.3.2/Lib/sysconfig.py
+Index: Python-3.4.2/Lib/sysconfig.py
 ===================================================================
---- Python-3.3.2.orig/Lib/sysconfig.py	2013-05-15 09:32:55.000000000 -0700
-+++ Python-3.3.2/Lib/sysconfig.py	2013-07-27 16:19:54.111877246 -0700
-@@ -21,10 +21,10 @@
+--- Python-3.4.2.orig/Lib/sysconfig.py
++++ Python-3.4.2/Lib/sysconfig.py
+@@ -20,10 +20,10 @@ __all__ = [
  
  _INSTALL_SCHEMES = {
      'posix_prefix': {
@@ -260,7 +235,7 @@ Index: Python-3.3.2/Lib/sysconfig.py
          'include':
              '{installed_base}/include/python{py_version_short}{abiflags}',
          'platinclude':
-@@ -33,10 +33,10 @@
+@@ -32,10 +32,10 @@ _INSTALL_SCHEMES = {
          'data': '{base}',
          },
      'posix_home': {
@@ -274,7 +249,7 @@ Index: Python-3.3.2/Lib/sysconfig.py
          'include': '{installed_base}/include/python',
          'platinclude': '{installed_base}/include/python',
          'scripts': '{base}/bin',
-@@ -81,10 +81,10 @@
+@@ -61,10 +61,10 @@ _INSTALL_SCHEMES = {
          'data': '{userbase}',
          },
      'posix_user': {
@@ -288,11 +263,11 @@ Index: Python-3.3.2/Lib/sysconfig.py
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data': '{userbase}',
-Index: Python-3.3.2/configure.ac
+Index: Python-3.4.2/configure.ac
 ===================================================================
---- Python-3.3.2.orig/configure.ac	2013-05-15 09:33:00.000000000 -0700
-+++ Python-3.3.2/configure.ac	2013-07-27 16:19:54.111877246 -0700
-@@ -769,6 +769,41 @@
+--- Python-3.4.2.orig/configure.ac
++++ Python-3.4.2/configure.ac
+@@ -791,6 +791,41 @@ esac
  MULTIARCH=$($CC --print-multiarch 2>/dev/null)
  AC_SUBST(MULTIARCH)
  
@@ -334,3 +309,30 @@ Index: Python-3.3.2/configure.ac
  
  AC_SUBST(LIBRARY)
  AC_MSG_CHECKING(LIBRARY)
+Index: Python-3.4.2/Lib/site.py
+===================================================================
+--- Python-3.4.2.orig/Lib/site.py
++++ Python-3.4.2/Lib/site.py
+@@ -304,13 +304,19 @@ def getsitepackages(prefixes=None):
+         seen.add(prefix)
+ 
+         if os.sep == '/':
+-            sitepackages.append(os.path.join(prefix, "lib",
++            sitepackages.append(os.path.join(prefix, sys.lib,
+                                         "python" + sys.version[:3],
+                                         "site-packages"))
+-            sitepackages.append(os.path.join(prefix, "lib", "site-python"))
++            if sys.lib != "lib":
++                sitepackages.append(os.path.join(prefix, "lib",
++                                        "python" + sys.version[:3],
++                                        "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-python"))
++            if sys.lib != "lib":
++                sitepackages.append(os.path.join(prefix, sys.lib, "site-python"))
+         else:
+             sitepackages.append(prefix)
+-            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
+         if sys.platform == "darwin":
+             # for framework builds *only* we add the standard Apple
+             # locations.
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.4.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3_3.3.3.bb
rename to meta/recipes-devtools/python/python3_3.4.2.bb
index 6147408..8bd69ed 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.2.bb
@@ -2,11 +2,11 @@ require recipes-devtools/python/python.inc
 
 DEPENDS = "python3-native libffi bzip2 db gdbm openssl readline sqlite3 zlib virtual/libintl xz"
 PR = "${INC_PR}.0"
-PYTHON_MAJMIN = "3.3"
+PYTHON_MAJMIN = "3.4"
 PYTHON_BINABI= "${PYTHON_MAJMIN}m"
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://12-distutils-prefix-is-inside-staging-area.patch \
 file://python-config.patch \
 file://000-cross-compile.patch \
@@ -18,18 +18,14 @@ file://110-enable-zlib.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
-file://fix-ast.h-dependency.patch \
 file://makerace.patch \
 ${DISTRO_SRC_URI} \
-file://python3-fix-build-error-with-Readline-6.3.patch \
 "
 
 SRC_URI += "\
             file://03-fix-tkinter-detection.patch \
             file://04-default-is-optimized.patch \
             file://avoid_warning_about_tkinter.patch \
-            file://06-ctypes-libffi-fix-configure.patch \
-            file://remove_sqlite_rpath.patch \
             file://cgi_py.patch \
             file://host_include_contamination.patch \
             file://python-3.3-multilib.patch \
@@ -42,10 +38,10 @@ SRC_URI += "\
             file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
            "
-SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
-SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
+SRC_URI[md5sum] = "36fc7327c02c6f12fa24fc9ba78039e3"
+SRC_URI[sha256sum] = "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827e0f970dcf04b2def"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4eaea08eaaf6875189b0c49f26fa2005"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
 S = "${WORKDIR}/Python-${PV}"
 
@@ -75,9 +71,9 @@ export _PYTHON_PROJECT_SRC = "${S}"
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
-do_configure_prepend() {
+do_configure_append() {
 	rm -f ${S}/Makefile.orig
-	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
+	autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
 do_compile() {
@@ -170,7 +166,7 @@ do_install() {
 		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
 	fi
 
-	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
 }
 
 do_install_append_class-nativesdk () {
@@ -212,6 +208,7 @@ FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
+RDEPENDS_${PN}-misc += "${PN}-core"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 
 # catch manpage
diff --git a/scripts/contrib/python/generate-manifest-3.3.py b/scripts/contrib/python/generate-manifest-3.4.py
similarity index 98%
rename from scripts/contrib/python/generate-manifest-3.3.py
rename to scripts/contrib/python/generate-manifest-3.4.py
index 48cc84d..6371195 100755
--- a/scripts/contrib/python/generate-manifest-3.3.py
+++ b/scripts/contrib/python/generate-manifest-3.4.py
@@ -17,7 +17,7 @@ import os
 import sys
 import time
 
-VERSION = "3.3.3"
+VERSION = "3.4.2"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 __version__ = "20140131"
@@ -177,6 +177,8 @@ if __name__ == "__main__":
     "_weakrefset.* sysconfig.* _sysconfigdata.* config/Makefile " +
     "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/collections " +
+    "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* " +
+    "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
 
     m.addPackage( "${PN}-dev", "Python development package", "${PN}-core",
@@ -280,7 +282,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core",
     "lib-dynload/_bisect.*.so lib-dynload/_collections.*.so lib-dynload/_heapq.*.so lib-dynload/_weakref.*.so lib-dynload/_functools.*.so " +
     "lib-dynload/array.*.so lib-dynload/itertools.*.so lib-dynload/operator.*.so lib-dynload/parser.*.so " +
-    "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
+    "atexit.* bisect.* code.* codeop.* collections.* _collections_abc.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
     "tokenize.* traceback.* weakref.*" )
 
     m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
@@ -330,7 +332,7 @@ if __name__ == "__main__":
     "lib-dynload/readline.*.so rlcompleter.*" )
 
     m.addPackage( "${PN}-reprlib", "Python alternate repr() implementation", "${PN}-core",
-    "${libdir}/python3.3/reprlib.py" )
+    "reprlib.py" )
 
     m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
     "lib-dynload/resource.*.so" )
-- 
1.9.1


