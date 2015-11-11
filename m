Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7F277168
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 07:01:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Nov 2015 23:01:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,274,1444719600"; d="scan'208";a="833905813"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga001.fm.intel.com with ESMTP; 10 Nov 2015 23:01:48 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 06:57:30 +0000
Message-Id: <2988bda2263d8d1ce3b9d209a542e8491d2bfb11.1447224734.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447224734.git.alejandro.hernandez@linux.intel.com>
References: <cover.1447224734.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1447224734.git.alejandro.hernandez@linux.intel.com>
References: <cover.1447224734.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python3: Upgrade from 3.4.3 to 3.5
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
X-List-Received-Date: Wed, 11 Nov 2015 07:01:51 -0000

python3-native_3.4.3.bb -> python3-native_3.5.0.bb:
- changed version
- changed cheksum
- no license change, just dates

python3_3.4.3.bb -> python3_3.5.0.bb:
- changed version
- changed cheksum
- no license change, just dates

Rebased:
- Manifest
- 000-cross-compile.patch
- 020-dont-compile-python-files.patch
- 04-default-is-optimized.patch
- python-3.3-multilib.patch
- distutils3-base.bbclass
- distutils3-native-base.bbclass
- python3native.bbclass

Upstream:
- makerace.patch

Misc:
- pip2 is handled as default on major distros,
modified python3-pip to leave /usr/bin/pip available for pip2
- Fixed importing pip3 from python3 interpreter

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/distutils3-base.bbclass               |   2 +-
 meta/classes/distutils3-native-base.bbclass        |   2 +-
 meta/classes/python3native.bbclass                 |   2 +-
 ...on-3.4-manifest.inc => python-3.5-manifest.inc} | 126 +++++++++----------
 ...on3-native_3.4.3.bb => python3-native_3.5.0.bb} |   7 +-
 meta/recipes-devtools/python/python3-pip_6.1.1.bb  |   8 +-
 .../python/python3/000-cross-compile.patch         |  36 +++---
 .../python3/020-dont-compile-python-files.patch    |  19 ++-
 .../python/python3/04-default-is-optimized.patch   |  38 +++---
 .../recipes-devtools/python/python3/makerace.patch |  28 -----
 .../python/python3/python-3.3-multilib.patch       | 140 +++++++++------------
 .../python/{python3_3.4.3.bb => python3_3.5.0.bb}  |   7 +-
 ...te-manifest-3.4.py => generate-manifest-3.5.py} |   2 +-
 13 files changed, 190 insertions(+), 227 deletions(-)
 rename meta/recipes-devtools/python/{python-3.4-manifest.inc => python-3.5-manifest.inc} (51%)
 rename meta/recipes-devtools/python/{python3-native_3.4.3.bb => python3-native_3.5.0.bb} (92%)
 delete mode 100644 meta/recipes-devtools/python/python3/makerace.patch
 rename meta/recipes-devtools/python/{python3_3.4.3.bb => python3_3.5.0.bb} (97%)
 rename scripts/contrib/python/{generate-manifest-3.4.py => generate-manifest-3.5.py} (99%)

diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index af3aa00..2a093d3 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,7 +1,7 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES', True) == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
-PYTHON_BASEVERSION = "3.4"
+PYTHON_BASEVERSION = "3.5"
 PYTHON_ABI = "m"
 
 inherit distutils-common-base python3native
diff --git a/meta/classes/distutils3-native-base.bbclass b/meta/classes/distutils3-native-base.bbclass
index 1117101..db9a1a7 100644
--- a/meta/classes/distutils3-native-base.bbclass
+++ b/meta/classes/distutils3-native-base.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION = "3.4"
+PYTHON_BASEVERSION = "3.5"
 PYTHON_ABI = "m"
 
 inherit distutils-native-base
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index cf83017..8ec6b76 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION = "3.4"
+PYTHON_BASEVERSION = "3.5"
 
 inherit python-dir
 
diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
similarity index 51%
rename from meta/recipes-devtools/python/python-3.4-manifest.inc
rename to meta/recipes-devtools/python/python-3.5-manifest.inc
index 97070b6..51eb93f 100644
--- a/meta/recipes-devtools/python/python-3.4-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -1,6 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../../scripts/contrib/python/generate-manifest-3.4.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: './generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
@@ -11,55 +11,55 @@ PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-comp
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
-FILES_${PN}-2to3="${libdir}/python3.4/lib2to3 "
+FILES_${PN}-2to3="${libdir}/python3.5/lib2to3 "
 
 SUMMARY_${PN}-asyncio="Python Asynchronous I/O, event loop, coroutines and tasks"
 RDEPENDS_${PN}-asyncio="${PN}-core"
-FILES_${PN}-asyncio="${libdir}/python3.4/asyncio "
+FILES_${PN}-asyncio="${libdir}/python3.5/asyncio "
 
 SUMMARY_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
-FILES_${PN}-audio="${libdir}/python3.4/wave.* ${libdir}/python3.4/chunk.* ${libdir}/python3.4/sndhdr.* ${libdir}/python3.4/lib-dynload/ossaudiodev.*.so ${libdir}/python3.4/lib-dynload/audioop.*.so ${libdir}/python3.4/audiodev.* ${libdir}/python3.4/sunaudio.* ${libdir}/python3.4/sunau.* ${libdir}/python3.4/toaiff.* "
+FILES_${PN}-audio="${libdir}/python3.5/wave.* ${libdir}/python3.5/chunk.* ${libdir}/python3.5/sndhdr.* ${libdir}/python3.5/lib-dynload/ossaudiodev.*.so ${libdir}/python3.5/lib-dynload/audioop.*.so ${libdir}/python3.5/audiodev.* ${libdir}/python3.5/sunaudio.* ${libdir}/python3.5/sunau.* ${libdir}/python3.5/toaiff.* "
 
 SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
 RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
-FILES_${PN}-codecs="${libdir}/python3.4/codecs.* ${libdir}/python3.4/encodings ${libdir}/python3.4/gettext.* ${libdir}/python3.4/locale.* ${libdir}/python3.4/lib-dynload/_locale.*.so ${libdir}/python3.4/lib-dynload/_codecs* ${libdir}/python3.4/lib-dynload/_multibytecodec.*.so ${libdir}/python3.4/lib-dynload/unicodedata.*.so ${libdir}/python3.4/stringprep.* ${libdir}/python3.4/xdrlib.* "
+FILES_${PN}-codecs="${libdir}/python3.5/codecs.* ${libdir}/python3.5/encodings ${libdir}/python3.5/gettext.* ${libdir}/python3.5/locale.* ${libdir}/python3.5/lib-dynload/_locale.*.so ${libdir}/python3.5/lib-dynload/_codecs* ${libdir}/python3.5/lib-dynload/_multibytecodec.*.so ${libdir}/python3.5/lib-dynload/unicodedata.*.so ${libdir}/python3.5/stringprep.* ${libdir}/python3.5/xdrlib.* "
 
 SUMMARY_${PN}-compile="Python bytecode compilation support"
 RDEPENDS_${PN}-compile="${PN}-core"
-FILES_${PN}-compile="${libdir}/python3.4/py_compile.* ${libdir}/python3.4/compileall.* "
+FILES_${PN}-compile="${libdir}/python3.5/py_compile.* ${libdir}/python3.5/compileall.* "
 
 SUMMARY_${PN}-compression="Python high-level compression support"
 RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs"
-FILES_${PN}-compression="${libdir}/python3.4/gzip.* ${libdir}/python3.4/zipfile.* ${libdir}/python3.4/tarfile.* ${libdir}/python3.4/lib-dynload/bz2.*.so "
+FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
-FILES_${PN}-core="${libdir}/python3.4/__future__.* ${libdir}/python3.4/_abcoll.* ${libdir}/python3.4/abc.* ${libdir}/python3.4/copy.* ${libdir}/python3.4/copyreg.* ${libdir}/python3.4/ConfigParser.* ${libdir}/python3.4/genericpath.* ${libdir}/python3.4/getopt.* ${libdir}/python3.4/linecache.* ${libdir}/python3.4/new.* ${libdir}/python3.4/os.* ${libdir}/python3.4/posixpath.* ${libdir}/python3.4/struct.* ${libdir}/python3.4/warnings.* ${libdir}/python3.4/site.* ${libdir}/python3.4/stat.* ${libdir}/python3.4/UserDict.* ${libdir}/python3.4/UserList.* ${libdir}/python3.4/UserString.* ${libdir}/python3.4/lib-dynload/binascii.*.so ${libdir}/python3.4/lib-dynload/_struct.*.so ${libdir}/python3.4/lib-dynload/time.*.so ${libdir}/python3.4/lib-dynload/xreadlines.*.so ${libdir}/python3.4/types.* ${libdir}/python3.4/platform.* ${bindir}/python* ${libdir}/python3.4/_weakrefset.* ${libdir}/python3.4/sysconfig.* ${libdir}/python3.4/_sysconfigdata.* ${libdir}/python3.4/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/ConfigParser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
-FILES_${PN}-crypt="${libdir}/python3.4/hashlib.* ${libdir}/python3.4/md5.* ${libdir}/python3.4/sha.* ${libdir}/python3.4/lib-dynload/crypt.*.so ${libdir}/python3.4/lib-dynload/_hashlib.*.so ${libdir}/python3.4/lib-dynload/_sha256.*.so ${libdir}/python3.4/lib-dynload/_sha512.*.so "
+FILES_${PN}-crypt="${libdir}/python3.5/hashlib.* ${libdir}/python3.5/md5.* ${libdir}/python3.5/sha.* ${libdir}/python3.5/lib-dynload/crypt.*.so ${libdir}/python3.5/lib-dynload/_hashlib.*.so ${libdir}/python3.5/lib-dynload/_sha256.*.so ${libdir}/python3.5/lib-dynload/_sha512.*.so "
 
 SUMMARY_${PN}-ctypes="Python C types support"
 RDEPENDS_${PN}-ctypes="${PN}-core"
-FILES_${PN}-ctypes="${libdir}/python3.4/ctypes ${libdir}/python3.4/lib-dynload/_ctypes.*.so ${libdir}/python3.4/lib-dynload/_ctypes_test.*.so "
+FILES_${PN}-ctypes="${libdir}/python3.5/ctypes ${libdir}/python3.5/lib-dynload/_ctypes.*.so ${libdir}/python3.5/lib-dynload/_ctypes_test.*.so "
 
 SUMMARY_${PN}-curses="Python curses support"
 RDEPENDS_${PN}-curses="${PN}-core"
-FILES_${PN}-curses="${libdir}/python3.4/curses ${libdir}/python3.4/lib-dynload/_curses.*.so ${libdir}/python3.4/lib-dynload/_curses_panel.*.so "
+FILES_${PN}-curses="${libdir}/python3.5/curses ${libdir}/python3.5/lib-dynload/_curses.*.so ${libdir}/python3.5/lib-dynload/_curses_panel.*.so "
 
 SUMMARY_${PN}-datetime="Python calendar and time support"
 RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
-FILES_${PN}-datetime="${libdir}/python3.4/_strptime.* ${libdir}/python3.4/calendar.* ${libdir}/python3.4/lib-dynload/datetime.*.so "
+FILES_${PN}-datetime="${libdir}/python3.5/_strptime.* ${libdir}/python3.5/calendar.* ${libdir}/python3.5/lib-dynload/datetime.*.so "
 
 SUMMARY_${PN}-db="Python file-based database support"
 RDEPENDS_${PN}-db="${PN}-core"
-FILES_${PN}-db="${libdir}/python3.4/anydbm.* ${libdir}/python3.4/dumbdbm.* ${libdir}/python3.4/whichdb.* ${libdir}/python3.4/dbm ${libdir}/python3.4/lib-dynload/_dbm.*.so "
+FILES_${PN}-db="${libdir}/python3.5/anydbm.* ${libdir}/python3.5/dumbdbm.* ${libdir}/python3.5/whichdb.* ${libdir}/python3.5/dbm ${libdir}/python3.5/lib-dynload/_dbm.*.so "
 
 SUMMARY_${PN}-debugger="Python debugger"
 RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint ${PN}-importlib ${PN}-pkgutil"
-FILES_${PN}-debugger="${libdir}/python3.4/bdb.* ${libdir}/python3.4/pdb.* "
+FILES_${PN}-debugger="${libdir}/python3.5/bdb.* ${libdir}/python3.5/pdb.* "
 
 SUMMARY_${PN}-dev="Python development package"
 RDEPENDS_${PN}-dev="${PN}-core"
@@ -67,199 +67,199 @@ FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdi
 
 SUMMARY_${PN}-difflib="Python helpers for computing deltas between objects"
 RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
-FILES_${PN}-difflib="${libdir}/python3.4/difflib.* "
+FILES_${PN}-difflib="${libdir}/python3.5/difflib.* "
 
 SUMMARY_${PN}-distutils="Python Distribution Utilities"
 RDEPENDS_${PN}-distutils="${PN}-core"
-FILES_${PN}-distutils="${libdir}/python3.4/config ${libdir}/python3.4/distutils "
+FILES_${PN}-distutils="${libdir}/python3.5/config ${libdir}/python3.5/distutils "
 
 SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
 RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
-FILES_${PN}-distutils-staticdev="${libdir}/python3.4/config/lib*.a "
+FILES_${PN}-distutils-staticdev="${libdir}/python3.5/config/lib*.a "
 
 SUMMARY_${PN}-doctest="Python framework for running examples in docstrings"
 RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
-FILES_${PN}-doctest="${libdir}/python3.4/doctest.* "
+FILES_${PN}-doctest="${libdir}/python3.5/doctest.* "
 
 SUMMARY_${PN}-elementtree="Python elementree"
 RDEPENDS_${PN}-elementtree="${PN}-core"
-FILES_${PN}-elementtree="${libdir}/python3.4/lib-dynload/_elementtree.*.so "
+FILES_${PN}-elementtree="${libdir}/python3.5/lib-dynload/_elementtree.*.so "
 
 SUMMARY_${PN}-email="Python email support"
 RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
-FILES_${PN}-email="${libdir}/python3.4/imaplib.* ${libdir}/python3.4/email "
+FILES_${PN}-email="${libdir}/python3.5/imaplib.* ${libdir}/python3.5/email "
 
 SUMMARY_${PN}-fcntl="Python's fcntl interface"
 RDEPENDS_${PN}-fcntl="${PN}-core"
-FILES_${PN}-fcntl="${libdir}/python3.4/lib-dynload/fcntl.*.so "
+FILES_${PN}-fcntl="${libdir}/python3.5/lib-dynload/fcntl.*.so "
 
 SUMMARY_${PN}-gdbm="Python GNU database support"
 RDEPENDS_${PN}-gdbm="${PN}-core"
-FILES_${PN}-gdbm="${libdir}/python3.4/lib-dynload/_gdbm.*.so "
+FILES_${PN}-gdbm="${libdir}/python3.5/lib-dynload/_gdbm.*.so "
 
 SUMMARY_${PN}-html="Python HTML processing support"
 RDEPENDS_${PN}-html="${PN}-core"
-FILES_${PN}-html="${libdir}/python3.4/formatter.* ${libdir}/python3.4/htmlentitydefs.* ${libdir}/python3.4/htmllib.* ${libdir}/python3.4/markupbase.* ${libdir}/python3.4/sgmllib.* ${libdir}/python3.4/HTMLParser.* "
+FILES_${PN}-html="${libdir}/python3.5/formatter.* ${libdir}/python3.5/htmlentitydefs.* ${libdir}/python3.5/htmllib.* ${libdir}/python3.5/markupbase.* ${libdir}/python3.5/sgmllib.* ${libdir}/python3.5/HTMLParser.* "
 
 SUMMARY_${PN}-idle="Python Integrated Development Environment"
 RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
-FILES_${PN}-idle="${bindir}/idle ${libdir}/python3.4/idlelib "
+FILES_${PN}-idle="${bindir}/idle ${libdir}/python3.5/idlelib "
 
 SUMMARY_${PN}-image="Python graphical image handling"
 RDEPENDS_${PN}-image="${PN}-core"
-FILES_${PN}-image="${libdir}/python3.4/colorsys.* ${libdir}/python3.4/imghdr.* ${libdir}/python3.4/lib-dynload/imageop.*.so ${libdir}/python3.4/lib-dynload/rgbimg.*.so "
+FILES_${PN}-image="${libdir}/python3.5/colorsys.* ${libdir}/python3.5/imghdr.* ${libdir}/python3.5/lib-dynload/imageop.*.so ${libdir}/python3.5/lib-dynload/rgbimg.*.so "
 
 SUMMARY_${PN}-importlib="Python import implementation library"
 RDEPENDS_${PN}-importlib="${PN}-core"
-FILES_${PN}-importlib="${libdir}/python3.4/importlib "
+FILES_${PN}-importlib="${libdir}/python3.5/importlib "
 
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-FILES_${PN}-io="${libdir}/python3.4/lib-dynload/_socket.*.so ${libdir}/python3.4/lib-dynload/_io.*.so ${libdir}/python3.4/lib-dynload/_ssl.*.so ${libdir}/python3.4/lib-dynload/select.*.so ${libdir}/python3.4/lib-dynload/termios.*.so ${libdir}/python3.4/lib-dynload/cStringIO.*.so ${libdir}/python3.4/pipes.* ${libdir}/python3.4/socket.* ${libdir}/python3.4/ssl.* ${libdir}/python3.4/tempfile.* ${libdir}/python3.4/StringIO.* ${libdir}/python3.4/io.* ${libdir}/python3.4/_pyio.* "
+FILES_${PN}-io="${libdir}/python3.5/lib-dynload/_socket.*.so ${libdir}/python3.5/lib-dynload/_io.*.so ${libdir}/python3.5/lib-dynload/_ssl.*.so ${libdir}/python3.5/lib-dynload/select.*.so ${libdir}/python3.5/lib-dynload/termios.*.so ${libdir}/python3.5/lib-dynload/cStringIO.*.so ${libdir}/python3.5/pipes.* ${libdir}/python3.5/socket.* ${libdir}/python3.5/ssl.* ${libdir}/python3.5/tempfile.* ${libdir}/python3.5/StringIO.* ${libdir}/python3.5/io.* ${libdir}/python3.5/_pyio.* "
 
 SUMMARY_${PN}-json="Python JSON support"
 RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
-FILES_${PN}-json="${libdir}/python3.4/json ${libdir}/python3.4/lib-dynload/_json.*.so "
+FILES_${PN}-json="${libdir}/python3.5/json ${libdir}/python3.5/lib-dynload/_json.*.so "
 
 SUMMARY_${PN}-lang="Python low-level language support"
 RDEPENDS_${PN}-lang="${PN}-core"
-FILES_${PN}-lang="${libdir}/python3.4/lib-dynload/_bisect.*.so ${libdir}/python3.4/lib-dynload/_collections.*.so ${libdir}/python3.4/lib-dynload/_heapq.*.so ${libdir}/python3.4/lib-dynload/_weakref.*.so ${libdir}/python3.4/lib-dynload/_functools.*.so ${libdir}/python3.4/lib-dynload/array.*.so ${libdir}/python3.4/lib-dynload/itertools.*.so ${libdir}/python3.4/lib-dynload/operator.*.so ${libdir}/python3.4/lib-dynload/parser.*.so ${libdir}/python3.4/atexit.* ${libdir}/python3.4/bisect.* ${libdir}/python3.4/code.* ${libdir}/python3.4/codeop.* ${libdir}/python3.4/collections.* ${libdir}/python3.4/_collections_abc.* ${libdir}/python3.4/dis.* ${libdir}/python3.4/functools.* ${libdir}/python3.4/heapq.* ${libdir}/python3.4/inspect.* ${libdir}/python3.4/keyword.* ${libdir}/python3.4/opcode.* ${libdir}/python3.4/symbol.* ${libdir}/python3.4/repr.* ${libdir}/python3.4/token.* ${libdir}/python3.4/tokenize.* ${libdir}/python3.4/traceback.* ${libdir}/python3.4/weakref.* "
+FILES_${PN}-lang="${libdir}/python3.5/lib-dynload/_bisect.*.so ${libdir}/python3.5/lib-dynload/_collections.*.so ${libdir}/python3.5/lib-dynload/_heapq.*.so ${libdir}/python3.5/lib-dynload/_weakref.*.so ${libdir}/python3.5/lib-dynload/_functools.*.so ${libdir}/python3.5/lib-dynload/array.*.so ${libdir}/python3.5/lib-dynload/itertools.*.so ${libdir}/python3.5/lib-dynload/operator.*.so ${libdir}/python3.5/lib-dynload/parser.*.so ${libdir}/python3.5/atexit.* ${libdir}/python3.5/bisect.* ${libdir}/python3.5/code.* ${libdir}/python3.5/codeop.* ${libdir}/python3.5/collections.* ${libdir}/python3.5/_collections_abc.* ${libdir}/python3.5/dis.* ${libdir}/python3.5/functools.* ${libdir}/python3.5/heapq.* ${libdir}/python3.5/inspect.* ${libdir}/python3.5/keyword.* ${libdir}/python3.5/opcode.* ${libdir}/python3.5/symbol.* ${libdir}/python3.5/repr.* ${libdir}/python3.5/token.* ${libdir}/python3.5/tokenize.* ${libdir}/python3.5/traceback.* ${libdir}/python3.5/weakref.* "
 
 SUMMARY_${PN}-logging="Python logging support"
 RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
-FILES_${PN}-logging="${libdir}/python3.4/logging "
+FILES_${PN}-logging="${libdir}/python3.5/logging "
 
 SUMMARY_${PN}-mailbox="Python mailbox format support"
 RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
-FILES_${PN}-mailbox="${libdir}/python3.4/mailbox.* "
+FILES_${PN}-mailbox="${libdir}/python3.5/mailbox.* "
 
 SUMMARY_${PN}-math="Python math support"
 RDEPENDS_${PN}-math="${PN}-core"
-FILES_${PN}-math="${libdir}/python3.4/lib-dynload/cmath.*.so ${libdir}/python3.4/lib-dynload/math.*.so ${libdir}/python3.4/lib-dynload/_random.*.so ${libdir}/python3.4/random.* ${libdir}/python3.4/sets.* "
+FILES_${PN}-math="${libdir}/python3.5/lib-dynload/cmath.*.so ${libdir}/python3.5/lib-dynload/math.*.so ${libdir}/python3.5/lib-dynload/_random.*.so ${libdir}/python3.5/random.* ${libdir}/python3.5/sets.* "
 
 SUMMARY_${PN}-mime="Python MIME handling APIs"
 RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
-FILES_${PN}-mime="${libdir}/python3.4/mimetools.* ${libdir}/python3.4/uu.* ${libdir}/python3.4/quopri.* ${libdir}/python3.4/rfc822.* ${libdir}/python3.4/MimeWriter.* "
+FILES_${PN}-mime="${libdir}/python3.5/mimetools.* ${libdir}/python3.5/uu.* ${libdir}/python3.5/quopri.* ${libdir}/python3.5/rfc822.* ${libdir}/python3.5/MimeWriter.* "
 
 SUMMARY_${PN}-mmap="Python memory-mapped file support"
 RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
-FILES_${PN}-mmap="${libdir}/python3.4/lib-dynload/mmap.*.so "
+FILES_${PN}-mmap="${libdir}/python3.5/lib-dynload/mmap.*.so "
 
 SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
 RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
-FILES_${PN}-multiprocessing="${libdir}/python3.4/lib-dynload/_multiprocessing.*.so ${libdir}/python3.4/multiprocessing "
+FILES_${PN}-multiprocessing="${libdir}/python3.5/lib-dynload/_multiprocessing.*.so ${libdir}/python3.5/multiprocessing "
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
 RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
-FILES_${PN}-netclient="${libdir}/python3.4/*Cookie*.* ${libdir}/python3.4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* ${libdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3.4/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.* ${libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/python3.4/telnetlib.* ${libdir}/python3.4/urllib ${libdir}/python3.4/uuid.* ${libdir}/python3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
+FILES_${PN}-netclient="${libdir}/python3.5/*Cookie*.* ${libdir}/python3.5/base64.* ${libdir}/python3.5/cookielib.* ${libdir}/python3.5/ftplib.* ${libdir}/python3.5/gopherlib.* ${libdir}/python3.5/hmac.* ${libdir}/python3.5/httplib.* ${libdir}/python3.5/mimetypes.* ${libdir}/python3.5/nntplib.* ${libdir}/python3.5/poplib.* ${libdir}/python3.5/smtplib.* ${libdir}/python3.5/telnetlib.* ${libdir}/python3.5/urllib ${libdir}/python3.5/uuid.* ${libdir}/python3.5/rfc822.* ${libdir}/python3.5/mimetools.* "
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading"
-FILES_${PN}-netserver="${libdir}/python3.4/cgi.* ${libdir}/python3.4/*HTTPServer.* ${libdir}/python3.4/SocketServer.* "
+FILES_${PN}-netserver="${libdir}/python3.5/cgi.* ${libdir}/python3.5/*HTTPServer.* ${libdir}/python3.5/SocketServer.* "
 
 SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python3.4/decimal.* ${libdir}/python3.4/fractions.* ${libdir}/python3.4/numbers.* "
+FILES_${PN}-numbers="${libdir}/python3.5/decimal.* ${libdir}/python3.5/fractions.* ${libdir}/python3.5/numbers.* "
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python3.4/pickle.* ${libdir}/python3.4/shelve.* ${libdir}/python3.4/lib-dynload/cPickle.*.so ${libdir}/python3.4/pickletools.* "
+FILES_${PN}-pickle="${libdir}/python3.5/pickle.* ${libdir}/python3.5/shelve.* ${libdir}/python3.5/lib-dynload/cPickle.*.so ${libdir}/python3.5/pickletools.* "
 
 SUMMARY_${PN}-pkgutil="Python package extension utility support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
-FILES_${PN}-pkgutil="${libdir}/python3.4/pkgutil.* "
+FILES_${PN}-pkgutil="${libdir}/python3.5/pkgutil.* "
 
 SUMMARY_${PN}-pprint="Python pretty-print support"
 RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
-FILES_${PN}-pprint="${libdir}/python3.4/pprint.* "
+FILES_${PN}-pprint="${libdir}/python3.5/pprint.* "
 
 SUMMARY_${PN}-profile="Python basic performance profiling support"
 RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
-FILES_${PN}-profile="${libdir}/python3.4/profile.* ${libdir}/python3.4/pstats.* ${libdir}/python3.4/cProfile.* ${libdir}/python3.4/lib-dynload/_lsprof.*.so "
+FILES_${PN}-profile="${libdir}/python3.5/profile.* ${libdir}/python3.5/pstats.* ${libdir}/python3.5/cProfile.* ${libdir}/python3.5/lib-dynload/_lsprof.*.so "
 
 SUMMARY_${PN}-pydoc="Python interactive help support"
 RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
-FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python3.4/pydoc.* ${libdir}/python3.4/pydoc_data "
+FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python3.5/pydoc.* ${libdir}/python3.5/pydoc_data "
 
 SUMMARY_${PN}-re="Python Regular Expression APIs"
 RDEPENDS_${PN}-re="${PN}-core"
-FILES_${PN}-re="${libdir}/python3.4/re.* ${libdir}/python3.4/sre.* ${libdir}/python3.4/sre_compile.* ${libdir}/python3.4/sre_constants* ${libdir}/python3.4/sre_parse.* "
+FILES_${PN}-re="${libdir}/python3.5/re.* ${libdir}/python3.5/sre.* ${libdir}/python3.5/sre_compile.* ${libdir}/python3.5/sre_constants* ${libdir}/python3.5/sre_parse.* "
 
 SUMMARY_${PN}-readline="Python readline support"
 RDEPENDS_${PN}-readline="${PN}-core"
-FILES_${PN}-readline="${libdir}/python3.4/lib-dynload/readline.*.so ${libdir}/python3.4/rlcompleter.* "
+FILES_${PN}-readline="${libdir}/python3.5/lib-dynload/readline.*.so ${libdir}/python3.5/rlcompleter.* "
 
 SUMMARY_${PN}-reprlib="Python alternate repr() implementation"
 RDEPENDS_${PN}-reprlib="${PN}-core"
-FILES_${PN}-reprlib="${libdir}/python3.4/reprlib.py "
+FILES_${PN}-reprlib="${libdir}/python3.5/reprlib.py "
 
 SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
-FILES_${PN}-resource="${libdir}/python3.4/lib-dynload/resource.*.so "
+FILES_${PN}-resource="${libdir}/python3.5/lib-dynload/resource.*.so "
 
 SUMMARY_${PN}-shell="Python shell-like functionality"
 RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
-FILES_${PN}-shell="${libdir}/python3.4/cmd.* ${libdir}/python3.4/commands.* ${libdir}/python3.4/dircache.* ${libdir}/python3.4/fnmatch.* ${libdir}/python3.4/glob.* ${libdir}/python3.4/popen2.* ${libdir}/python3.4/shlex.* ${libdir}/python3.4/shutil.* "
+FILES_${PN}-shell="${libdir}/python3.5/cmd.* ${libdir}/python3.5/commands.* ${libdir}/python3.5/dircache.* ${libdir}/python3.5/fnmatch.* ${libdir}/python3.5/glob.* ${libdir}/python3.5/popen2.* ${libdir}/python3.5/shlex.* ${libdir}/python3.5/shutil.* "
 
 SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
 RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
-FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python3.4/smtpd.* "
+FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python3.5/smtpd.* "
 
 SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
 RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading"
-FILES_${PN}-sqlite3="${libdir}/python3.4/lib-dynload/_sqlite3.*.so ${libdir}/python3.4/sqlite3/dbapi2.* ${libdir}/python3.4/sqlite3/__init__.* ${libdir}/python3.4/sqlite3/dump.* "
+FILES_${PN}-sqlite3="${libdir}/python3.5/lib-dynload/_sqlite3.*.so ${libdir}/python3.5/sqlite3/dbapi2.* ${libdir}/python3.5/sqlite3/__init__.* ${libdir}/python3.5/sqlite3/dump.* "
 
 SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support tests"
 RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
-FILES_${PN}-sqlite3-tests="${libdir}/python3.4/sqlite3/test "
+FILES_${PN}-sqlite3-tests="${libdir}/python3.5/sqlite3/test "
 
 SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
 RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
-FILES_${PN}-stringold="${libdir}/python3.4/lib-dynload/strop.*.so ${libdir}/python3.4/string.* ${libdir}/python3.4/stringold.* "
+FILES_${PN}-stringold="${libdir}/python3.5/lib-dynload/strop.*.so ${libdir}/python3.5/string.* ${libdir}/python3.5/stringold.* "
 
 SUMMARY_${PN}-subprocess="Python subprocess support"
 RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
-FILES_${PN}-subprocess="${libdir}/python3.4/subprocess.* "
+FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* "
 
 SUMMARY_${PN}-syslog="Python syslog interface"
 RDEPENDS_${PN}-syslog="${PN}-core"
-FILES_${PN}-syslog="${libdir}/python3.4/lib-dynload/syslog.*.so "
+FILES_${PN}-syslog="${libdir}/python3.5/lib-dynload/syslog.*.so "
 
 SUMMARY_${PN}-terminal="Python terminal controlling support"
 RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
-FILES_${PN}-terminal="${libdir}/python3.4/pty.* ${libdir}/python3.4/tty.* "
+FILES_${PN}-terminal="${libdir}/python3.5/pty.* ${libdir}/python3.5/tty.* "
 
 SUMMARY_${PN}-tests="Python tests"
 RDEPENDS_${PN}-tests="${PN}-core"
-FILES_${PN}-tests="${libdir}/python3.4/test "
+FILES_${PN}-tests="${libdir}/python3.5/test "
 
 SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
 RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
-FILES_${PN}-textutils="${libdir}/python3.4/lib-dynload/_csv.*.so ${libdir}/python3.4/csv.* ${libdir}/python3.4/optparse.* ${libdir}/python3.4/textwrap.* "
+FILES_${PN}-textutils="${libdir}/python3.5/lib-dynload/_csv.*.so ${libdir}/python3.5/csv.* ${libdir}/python3.5/optparse.* ${libdir}/python3.5/textwrap.* "
 
 SUMMARY_${PN}-threading="Python threading & synchronization support"
 RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
-FILES_${PN}-threading="${libdir}/python3.4/_threading_local.* ${libdir}/python3.4/dummy_thread.* ${libdir}/python3.4/dummy_threading.* ${libdir}/python3.4/mutex.* ${libdir}/python3.4/threading.* ${libdir}/python3.4/Queue.* "
+FILES_${PN}-threading="${libdir}/python3.5/_threading_local.* ${libdir}/python3.5/dummy_thread.* ${libdir}/python3.5/dummy_threading.* ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.* ${libdir}/python3.5/Queue.* "
 
 SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
 RDEPENDS_${PN}-tkinter="${PN}-core"
-FILES_${PN}-tkinter="${libdir}/python3.4/lib-dynload/_tkinter.*.so ${libdir}/python3.4/lib-tk ${libdir}/python3.4/tkinter "
+FILES_${PN}-tkinter="${libdir}/python3.5/lib-dynload/_tkinter.*.so ${libdir}/python3.5/lib-tk ${libdir}/python3.5/tkinter "
 
 SUMMARY_${PN}-unittest="Python unit testing framework"
 RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
-FILES_${PN}-unittest="${libdir}/python3.4/unittest/ "
+FILES_${PN}-unittest="${libdir}/python3.5/unittest/ "
 
 SUMMARY_${PN}-unixadmin="Python Unix administration support"
 RDEPENDS_${PN}-unixadmin="${PN}-core"
-FILES_${PN}-unixadmin="${libdir}/python3.4/lib-dynload/nis.*.so ${libdir}/python3.4/lib-dynload/grp.*.so ${libdir}/python3.4/lib-dynload/pwd.*.so ${libdir}/python3.4/getpass.* "
+FILES_${PN}-unixadmin="${libdir}/python3.5/lib-dynload/nis.*.so ${libdir}/python3.5/lib-dynload/grp.*.so ${libdir}/python3.5/lib-dynload/pwd.*.so ${libdir}/python3.5/getpass.* "
 
 SUMMARY_${PN}-xml="Python basic XML support"
 RDEPENDS_${PN}-xml="${PN}-core ${PN}-elementtree ${PN}-re"
-FILES_${PN}-xml="${libdir}/python3.4/lib-dynload/pyexpat.*.so ${libdir}/python3.4/xml ${libdir}/python3.4/xmllib.* "
+FILES_${PN}-xml="${libdir}/python3.5/lib-dynload/pyexpat.*.so ${libdir}/python3.5/xml ${libdir}/python3.5/xmllib.* "
 
 SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
 RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
-FILES_${PN}-xmlrpc="${libdir}/python3.4/xmlrpclib.* ${libdir}/python3.4/SimpleXMLRPCServer.* ${libdir}/python3.4/DocXMLRPCServer.* ${libdir}/python3.4/xmlrpc "
+FILES_${PN}-xmlrpc="${libdir}/python3.5/xmlrpclib.* ${libdir}/python3.5/SimpleXMLRPCServer.* ${libdir}/python3.5/DocXMLRPCServer.* ${libdir}/python3.5/xmlrpc "
 
 SUMMARY_${PN}-modules="All Python modules"
 RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
diff --git a/meta/recipes-devtools/python/python3-native_3.4.3.bb b/meta/recipes-devtools/python/python3-native_3.5.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-native_3.4.3.bb
rename to meta/recipes-devtools/python/python3-native_3.5.0.bb
index 464ff05..198f93d 100644
--- a/meta/recipes-devtools/python/python3-native_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.0.bb
@@ -1,7 +1,7 @@
 require recipes-devtools/python/python.inc
 
 PR = "${INC_PR}.0"
-PYTHON_MAJMIN = "3.4"
+PYTHON_MAJMIN = "3.5"
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
@@ -22,13 +22,12 @@ file://shutil-follow-symlink-fix.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://sysroot-include-headers.patch \
 file://unixccompiler.patch \
-file://makerace.patch \
 ${DISTRO_SRC_URI} \
 file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 "
-SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
-SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
+SRC_URI[md5sum] = "d149d2812f10cbe04c042232e7964171"
+SRC_URI[sha256sum] = "d6d7aa1634a5eeeca6ed4fca266982a04f84bd8f3945a9179e20b24ad2e2be91" 
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
diff --git a/meta/recipes-devtools/python/python3-pip_6.1.1.bb b/meta/recipes-devtools/python/python3-pip_6.1.1.bb
index 7bfc30e..7014bc0 100644
--- a/meta/recipes-devtools/python/python3-pip_6.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_6.1.1.bb
@@ -26,7 +26,13 @@ do_install_prepend() {
 # Use setuptools site.py instead, avoid shared state issue
 do_install_append() {
     rm ${D}/${libdir}/${PYTHON_DIR}/site-packages/site.py
-    rm ${D}/${libdir}/${PYTHON_DIR}/site-packages/__pycache__/site.cpython-34.pyc
+    rm ${D}/${libdir}/${PYTHON_DIR}/site-packages/__pycache__/site.cpython-*.pyc
+
+    # Install as pip3 and leave pip2 as default
+    rm ${D}/${bindir}/pip
+
+    # Installed eggs need to be passed directly to the interpreter via a pth file
+    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}-${PV}.pth
 }
 
 RDEPENDS_${PN} = "\
diff --git a/meta/recipes-devtools/python/python3/000-cross-compile.patch b/meta/recipes-devtools/python/python3/000-cross-compile.patch
index 2506a59..a3ffe3b 100644
--- a/meta/recipes-devtools/python/python3/000-cross-compile.patch
+++ b/meta/recipes-devtools/python/python3/000-cross-compile.patch
@@ -9,9 +9,11 @@ Upstream-Status: Inappropriate[Configuration Specific]
  Makefile.pre.in |   25 +++++++++++++------------
  1 file changed, 13 insertions(+), 12 deletions(-)
 
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -193,6 +193,7 @@ LIBOBJS=	@LIBOBJS@
+Index: Python-3.5.0/Makefile.pre.in
+===================================================================
+--- Python-3.5.0.orig/Makefile.pre.in
++++ Python-3.5.0/Makefile.pre.in
+@@ -215,6 +215,7 @@ LIBOBJS=	@LIBOBJS@
  
  PYTHON=		python$(EXE)
  BUILDPYTHON=	python$(BUILDEXE)
@@ -19,7 +21,7 @@ Upstream-Status: Inappropriate[Configuration Specific]
  
  PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
  _PYTHON_HOST_PLATFORM=@_PYTHON_HOST_PLATFORM@
-@@ -239,6 +240,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+@@ -272,6 +273,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
  ##########################################################################
  # Parser
  PGEN=		Parser/pgen$(EXE)
@@ -27,7 +29,7 @@ Upstream-Status: Inappropriate[Configuration Specific]
  
  PSRCS=		\
  		Parser/acceler.c \
-@@ -451,7 +453,7 @@ build_all_generate_profile:
+@@ -494,7 +496,7 @@ build_all_generate_profile:
  
  run_profile_task:
  	: # FIXME: can't run for a cross build
@@ -35,17 +37,17 @@ Upstream-Status: Inappropriate[Configuration Specific]
 +	$(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK)
  
  build_all_use_profile:
- 	$(MAKE) all CFLAGS="$(CFLAGS) -fprofile-use -fprofile-correction"
-@@ -640,7 +642,7 @@ $(IO_OBJS): $(IO_H)
- $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
+ 	$(MAKE) all CFLAGS_NODIST="$(CFLAGS) -fprofile-use -fprofile-correction"
+@@ -764,7 +766,7 @@ $(IO_OBJS): $(IO_H)
+ 
+ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
  		@$(MKDIR_P) Include
- 		$(MAKE) $(PGEN)
 -		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
 +		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- $(GRAMMAR_C): $(GRAMMAR_H) $(GRAMMAR_INPUT) $(PGENSRCS)
- 		$(MAKE) $(GRAMMAR_H)
+ $(GRAMMAR_C): $(GRAMMAR_H)
  		touch $(GRAMMAR_C)
-@@ -820,7 +822,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Modules/pytho
+ 
+@@ -953,7 +955,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/pyth
  ######################################################################
  
  TESTOPTS=	$(EXTRATESTOPTS)
@@ -54,7 +56,7 @@ Upstream-Status: Inappropriate[Configuration Specific]
  TESTRUNNER=	$(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
  TESTTIMEOUT=	3600
  
-@@ -1229,7 +1231,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
+@@ -1440,7 +1442,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
  		fi; \
  	done
  	$(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
@@ -63,7 +65,7 @@ Upstream-Status: Inappropriate[Configuration Specific]
  	$(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
  	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
  	$(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
-@@ -1288,7 +1290,7 @@ config.status:	$(srcdir)/configure
+@@ -1506,7 +1508,7 @@ config.status:	$(srcdir)/configure
  
  # Run reindent on the library
  reindent:
@@ -72,12 +74,12 @@ Upstream-Status: Inappropriate[Configuration Specific]
  
  # Rerun configure with the same options as it was run last time,
  # provided the config.status script exists
-@@ -1414,7 +1416,7 @@ funny:
+@@ -1639,7 +1641,7 @@ funny:
  
  # Perform some verification checks on any modified files.
- patchcheck:
+ patchcheck: all
 -	$(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
-+	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
++	$(RUNSHARED) ./$(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
  
  # Dependencies
  
diff --git a/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch b/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
index 03ef286..819ba69 100644
--- a/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
+++ b/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
@@ -8,9 +8,11 @@ Upstream-Status: Inappropriate[Embedded-Specific]
  Makefile.pre.in |   16 ----------------
  1 file changed, 16 deletions(-)
 
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1078,24 +1078,6 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+Index: Python-3.5.0/Makefile.pre.in
+===================================================================
+--- Python-3.5.0.orig/Makefile.pre.in
++++ Python-3.5.0/Makefile.pre.in
+@@ -1262,33 +1262,6 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -24,7 +26,12 @@ Upstream-Status: Inappropriate[Embedded-Specific]
 -		-d $(LIBDEST) -f \
 -		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
 -		$(DESTDIR)$(LIBDEST)
--	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 -		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
 -		-d $(LIBDEST)/site-packages -f \
 -		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -32,6 +39,10 @@ Upstream-Status: Inappropriate[Embedded-Specific]
 -		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
 -		-d $(LIBDEST)/site-packages -f \
 -		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
diff --git a/meta/recipes-devtools/python/python3/04-default-is-optimized.patch b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
index 3b8f264..4b8a7e5 100644
--- a/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
+++ b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
@@ -12,24 +12,11 @@ Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 Rebased for 3.4.2 02/2015
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-3.4.2/Python/compile.c
+Index: Python-3.5.0/Modules/main.c
 ===================================================================
---- Python-3.4.2.orig/Python/compile.c
-+++ Python-3.4.2/Python/compile.c
-@@ -30,7 +30,7 @@
- #include "symtable.h"
- #include "opcode.h"
- 
--int Py_OptimizeFlag = 0;
-+int Py_OptimizeFlag = 1;
- 
- #define DEFAULT_BLOCK_SIZE 16
- #define DEFAULT_BLOCKS 8
-Index: Python-3.4.2/Modules/main.c
-===================================================================
---- Python-3.4.2.orig/Modules/main.c
-+++ Python-3.4.2/Modules/main.c
-@@ -38,7 +38,7 @@ static wchar_t **orig_argv;
+--- Python-3.5.0.orig/Modules/main.c
++++ Python-3.5.0/Modules/main.c
+@@ -37,7 +37,7 @@ static wchar_t **orig_argv;
  static int  orig_argc;
  
  /* command line options */
@@ -38,7 +25,7 @@ Index: Python-3.4.2/Modules/main.c
  
  #define PROGRAM_OPTS BASE_OPTS
  
-@@ -64,6 +64,7 @@ static char *usage_2 = "\
+@@ -63,6 +63,7 @@ static char *usage_2 = "\
  -m mod : run library module as a script (terminates option list)\n\
  -O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
  -OO    : remove doc-strings in addition to the -O optimizations\n\
@@ -46,7 +33,7 @@ Index: Python-3.4.2/Modules/main.c
  -q     : don't print version and copyright messages on interactive startup\n\
  -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
  -S     : don't imply 'import site' on initialization\n\
-@@ -418,8 +419,8 @@ Py_Main(int argc, wchar_t **argv)
+@@ -419,8 +420,8 @@ Py_Main(int argc, wchar_t **argv)
  
          /* case 'J': reserved for Jython */
  
@@ -57,3 +44,16 @@ Index: Python-3.4.2/Modules/main.c
              break;
  
          case 'B':
+Index: Python-3.5.0/Python/pylifecycle.c
+===================================================================
+--- Python-3.5.0.orig/Python/pylifecycle.c
++++ Python-3.5.0/Python/pylifecycle.c
+@@ -80,7 +80,7 @@ int Py_VerboseFlag; /* Needed by import.
+ int Py_QuietFlag; /* Needed by sysmodule.c */
+ int Py_InteractiveFlag; /* Needed by Py_FdIsInteractive() below */
+ int Py_InspectFlag; /* Needed to determine whether to exit at SystemExit */
+-int Py_OptimizeFlag = 0; /* Needed by compile.c */
++int Py_OptimizeFlag = 1; /* Needed by compile.c */
+ int Py_NoSiteFlag; /* Suppress 'import site' */
+ int Py_BytesWarningFlag; /* Warn on str(bytes) and str(buffer) */
+ int Py_UseClassExceptionsFlag = 1; /* Needed by bltinmodule.c: deprecated */
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
deleted file mode 100644
index d8a6892..0000000
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-There is a race due to the execution of make inside the makefile:
-
-| gcc  -pthread -c -Wno-unused-result -DNDEBUG -g  -O3 -Wall -Wstrict-prototypes -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe   -I. -IInclude -I./Include -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -fPIC -DPy_BUILD_CORE -o Objects/obmalloc.o Objects/obmalloc.c
-| gcc  -pthread -c -Wno-unused-result -DNDEBUG -g  -O3 -Wall -Wstrict-prototypes -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe   -I. -IInclude -I./Include -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -fPIC -DPy_BUILD_CORE -o Parser/pgen.o Parser/pgen.c| gcc  -pthread -c -Wno-unused-result -DNDEBUG -g  -O3 -Wall -Wstrict-prototypes -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe   -I. -IInclude -I./Include -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -fPIC -DPy_BUILD_CORE -o Objects/obmalloc.o Objects/obmalloc.c
-| gcc  -pthread -c -Wno-unused-result -DNDEBUG -g  -O3 -Wall -Wstrict-prototypes -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe   -I. -IInclude -I./Include -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -isystem/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/include -fPIC -DPy_BUILD_CORE -o Objects/obmalloc.o Objects/obmalloc.c
-| Objects/obmalloc.o: file not recognized: File truncated
-| collect2: error: ld returned 1 exit status
-| make[1]: *** [Parser/pgen] Error 1
-
-The easiest way to avoid this is to list the dependencies explictly.
-
-RP 28/2/2014
-
-Upstream-Status: Pending
-
-Index: Python-3.3.3/Makefile.pre.in
-===================================================================
---- Python-3.3.3.orig/Makefile.pre.in	2014-02-27 14:04:38.268339533 +0000
-+++ Python-3.3.3/Makefile.pre.in	2014-02-28 10:40:59.166361125 +0000
-@@ -676,7 +676,7 @@
- 
- $(IO_OBJS): $(IO_H)
- 
--$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
-+$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS) $(PGEN)
- 		@$(MKDIR_P) Include
- 		$(MAKE) $(PGEN)
- 		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index b3e9860..44ec424 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -7,23 +7,24 @@ get the sys.lib from python itself and do not use hardcoded value of 'lib'
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-3.4.2/Include/pythonrun.h
+Index: Python-3.5.0/Include/pythonrun.h
 ===================================================================
---- Python-3.4.2.orig/Include/pythonrun.h
-+++ Python-3.4.2/Include/pythonrun.h
-@@ -220,6 +220,8 @@ int _Py_CheckPython3();
- /* In their own files */
- PyAPI_FUNC(const char *) Py_GetVersion(void);
- PyAPI_FUNC(const char *) Py_GetPlatform(void);
+--- Python-3.5.0.orig/Include/pythonrun.h
++++ Python-3.5.0/Include/pythonrun.h
+@@ -23,6 +23,9 @@ typedef struct {
+ } PyCompilerFlags;
+ #endif
+ 
 +PyAPI_FUNC(const char *) Py_GetArch(void);
 +PyAPI_FUNC(const char *) Py_GetLib(void);
- PyAPI_FUNC(const char *) Py_GetCopyright(void);
- PyAPI_FUNC(const char *) Py_GetCompiler(void);
- PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-3.4.2/Lib/distutils/command/install.py
++
+ #ifndef Py_LIMITED_API
+ PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
+ PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlags *);
+Index: Python-3.5.0/Lib/distutils/command/install.py
 ===================================================================
---- Python-3.4.2.orig/Lib/distutils/command/install.py
-+++ Python-3.4.2/Lib/distutils/command/install.py
+--- Python-3.5.0.orig/Lib/distutils/command/install.py
++++ Python-3.5.0/Lib/distutils/command/install.py
 @@ -19,6 +19,8 @@ from site import USER_BASE
  from site import USER_SITE
  HAS_USER_SITE = True
@@ -42,11 +43,11 @@ Index: Python-3.4.2/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-3.4.2/Lib/pydoc.py
+Index: Python-3.5.0/Lib/pydoc.py
 ===================================================================
---- Python-3.4.2.orig/Lib/pydoc.py
-+++ Python-3.4.2/Lib/pydoc.py
-@@ -394,7 +394,7 @@ class Doc:
+--- Python-3.5.0.orig/Lib/pydoc.py
++++ Python-3.5.0/Lib/pydoc.py
+@@ -393,7 +393,7 @@ class Doc:
  
          docloc = os.environ.get("PYTHONDOCS", self.PYTHONDOCS)
  
@@ -55,11 +56,11 @@ Index: Python-3.4.2/Lib/pydoc.py
                                 "python%d.%d" %  sys.version_info[:2])
          if (isinstance(object, type(os)) and
              (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-3.4.2/Lib/trace.py
+Index: Python-3.5.0/Lib/trace.py
 ===================================================================
---- Python-3.4.2.orig/Lib/trace.py
-+++ Python-3.4.2/Lib/trace.py
-@@ -751,10 +751,10 @@ def main(argv=None):
+--- Python-3.5.0.orig/Lib/trace.py
++++ Python-3.5.0/Lib/trace.py
+@@ -749,10 +749,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
                  s = s.replace("$prefix",
@@ -72,10 +73,10 @@ Index: Python-3.4.2/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-3.4.2/Makefile.pre.in
+Index: Python-3.5.0/Makefile.pre.in
 ===================================================================
---- Python-3.4.2.orig/Makefile.pre.in
-+++ Python-3.4.2/Makefile.pre.in
+--- Python-3.5.0.orig/Makefile.pre.in
++++ Python-3.5.0/Makefile.pre.in
 @@ -101,6 +101,8 @@ PY_CORE_CFLAGS=	$(PY_CFLAGS) $(PY_CFLAGS
  
  # Machine-dependent subdirectories
@@ -94,15 +95,15 @@ Index: Python-3.4.2/Makefile.pre.in
  ABIFLAGS=	@ABIFLAGS@
  
  # Detailed destination directories
-@@ -712,6 +714,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -729,6 +731,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
 +		-DARCH='"$(ARCH)"' -DLIB='"$(LIB)"' \
  		-o $@ $(srcdir)/Modules/getpath.c
  
- Modules/python.o: $(srcdir)/Modules/python.c
-@@ -780,7 +783,7 @@ $(AST_C): $(AST_H) $(AST_ASDL) $(ASDLGEN
+ Programs/python.o: $(srcdir)/Programs/python.c
+@@ -798,7 +801,7 @@ $(OPCODE_H): $(srcdir)/Lib/opcode.py $(O
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -111,10 +112,10 @@ Index: Python-3.4.2/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-3.4.2/Modules/getpath.c
+Index: Python-3.5.0/Modules/getpath.c
 ===================================================================
---- Python-3.4.2.orig/Modules/getpath.c
-+++ Python-3.4.2/Modules/getpath.c
+--- Python-3.5.0.orig/Modules/getpath.c
++++ Python-3.5.0/Modules/getpath.c
 @@ -117,9 +117,11 @@
  #define EXEC_PREFIX PREFIX
  #endif
@@ -135,12 +136,12 @@ Index: Python-3.4.2/Modules/getpath.c
  static wchar_t *module_search_path = NULL;
 +static wchar_t *lib_python = L"" LIB_PYTHON;
  
- static void
- reduce(wchar_t *dir)
-Index: Python-3.4.2/Python/getplatform.c
+ /* Get file status. Encode the path to the locale encoding. */
+ 
+Index: Python-3.5.0/Python/getplatform.c
 ===================================================================
---- Python-3.4.2.orig/Python/getplatform.c
-+++ Python-3.4.2/Python/getplatform.c
+--- Python-3.5.0.orig/Python/getplatform.c
++++ Python-3.5.0/Python/getplatform.c
 @@ -10,3 +10,23 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -165,11 +166,11 @@ Index: Python-3.4.2/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-3.4.2/Python/sysmodule.c
+Index: Python-3.5.0/Python/sysmodule.c
 ===================================================================
---- Python-3.4.2.orig/Python/sysmodule.c
-+++ Python-3.4.2/Python/sysmodule.c
-@@ -1697,6 +1697,10 @@ _PySys_Init(void)
+--- Python-3.5.0.orig/Python/sysmodule.c
++++ Python-3.5.0/Python/sysmodule.c
+@@ -1767,6 +1767,10 @@ _PySys_Init(void)
                          PyUnicode_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyUnicode_FromString(Py_GetPlatform()));
@@ -180,11 +181,11 @@ Index: Python-3.4.2/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyUnicode_FromWideChar(
                                 Py_GetProgramFullPath(), -1));
-Index: Python-3.4.2/setup.py
+Index: Python-3.5.0/setup.py
 ===================================================================
---- Python-3.4.2.orig/setup.py
-+++ Python-3.4.2/setup.py
-@@ -454,7 +454,7 @@ class PyBuildExt(build_ext):
+--- Python-3.5.0.orig/setup.py
++++ Python-3.5.0/setup.py
+@@ -472,7 +472,7 @@ class PyBuildExt(build_ext):
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -193,7 +194,7 @@ Index: Python-3.4.2/setup.py
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -512,8 +512,7 @@ class PyBuildExt(build_ext):
+@@ -530,8 +530,7 @@ class PyBuildExt(build_ext):
          # be assumed that no additional -I,-L directives are needed.
          if not cross_compiling:
              lib_dirs = self.compiler.library_dirs + [
@@ -203,7 +204,7 @@ Index: Python-3.4.2/setup.py
                  ]
              inc_dirs = self.compiler.include_dirs + ['/usr/include']
          else:
-@@ -696,11 +695,11 @@ class PyBuildExt(build_ext):
+@@ -716,11 +715,11 @@ class PyBuildExt(build_ext):
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -217,10 +218,10 @@ Index: Python-3.4.2/setup.py
                                     extra_link_args=readline_extra_link_args,
                                     libraries=readline_libs) )
          else:
-Index: Python-3.4.2/Lib/sysconfig.py
+Index: Python-3.5.0/Lib/sysconfig.py
 ===================================================================
---- Python-3.4.2.orig/Lib/sysconfig.py
-+++ Python-3.4.2/Lib/sysconfig.py
+--- Python-3.5.0.orig/Lib/sysconfig.py
++++ Python-3.5.0/Lib/sysconfig.py
 @@ -20,10 +20,10 @@ __all__ = [
  
  _INSTALL_SCHEMES = {
@@ -263,13 +264,13 @@ Index: Python-3.4.2/Lib/sysconfig.py
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data': '{userbase}',
-Index: Python-3.4.2/configure.ac
+Index: Python-3.5.0/configure.ac
 ===================================================================
---- Python-3.4.2.orig/configure.ac
-+++ Python-3.4.2/configure.ac
-@@ -791,6 +791,41 @@ esac
- MULTIARCH=$($CC --print-multiarch 2>/dev/null)
- AC_SUBST(MULTIARCH)
+--- Python-3.5.0.orig/configure.ac
++++ Python-3.5.0/configure.ac
+@@ -858,6 +858,41 @@ PLATDIR=plat-$MACHDEP
+ AC_SUBST(PLATDIR)
+ AC_SUBST(PLATFORM_TRIPLET)
  
 +AC_SUBST(ARCH)
 +AC_MSG_CHECKING(ARCH)
@@ -307,32 +308,5 @@ Index: Python-3.4.2/configure.ac
 +esac
 +AC_MSG_RESULT($LIB)
  
- AC_SUBST(LIBRARY)
- AC_MSG_CHECKING(LIBRARY)
-Index: Python-3.4.2/Lib/site.py
-===================================================================
---- Python-3.4.2.orig/Lib/site.py
-+++ Python-3.4.2/Lib/site.py
-@@ -304,13 +304,19 @@ def getsitepackages(prefixes=None):
-         seen.add(prefix)
- 
-         if os.sep == '/':
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
-+                sitepackages.append(os.path.join(prefix, sys.lib, "site-python"))
-         else:
-             sitepackages.append(prefix)
--            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
-+            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
-         if sys.platform == "darwin":
-             # for framework builds *only* we add the standard Apple
-             # locations.
+ AC_MSG_CHECKING([for -Wl,--no-as-needed])
+ save_LDFLAGS="$LDFLAGS"
diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.5.0.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3_3.4.3.bb
rename to meta/recipes-devtools/python/python3_3.5.0.bb
index f61d278..fc01741 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.0.bb
@@ -2,7 +2,7 @@ require recipes-devtools/python/python.inc
 
 DEPENDS = "python3-native libffi bzip2 db gdbm openssl readline sqlite3 zlib virtual/libintl xz"
 PR = "${INC_PR}.0"
-PYTHON_MAJMIN = "3.4"
+PYTHON_MAJMIN = "3.5"
 PYTHON_BINABI= "${PYTHON_MAJMIN}m"
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -17,7 +17,6 @@ file://110-enable-zlib.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
-file://makerace.patch \
 ${DISTRO_SRC_URI} \
 "
 
@@ -38,8 +37,8 @@ SRC_URI += "\
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
             file://setup.py-find-libraries-in-staging-dirs.patch \
            "
-SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
-SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
+SRC_URI[md5sum] = "d149d2812f10cbe04c042232e7964171"
+SRC_URI[sha256sum] = "d6d7aa1634a5eeeca6ed4fca266982a04f84bd8f3945a9179e20b24ad2e2be91"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/contrib/python/generate-manifest-3.5.py
similarity index 99%
rename from scripts/contrib/python/generate-manifest-3.4.py
rename to scripts/contrib/python/generate-manifest-3.5.py
index ca2fa61..26eb0f3 100755
--- a/scripts/contrib/python/generate-manifest-3.4.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -17,7 +17,7 @@ import os
 import sys
 import time
 
-VERSION = "3.4.2"
+VERSION = "3.5.0"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 __version__ = "20140131"
-- 
1.8.4.5


