Return-Path: <wrob311@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 43F9E62252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 22:56:02 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so15450510wgg.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 14:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=R+5kXr7uP01QWnbfOJkTj2j6Py/qkIjNvn9JM5TLZ+k=;
	b=xtZYDTxaaRxpwXDAPkJcTaUEdtXQYBZRS5G7mO92BKuGjSr9G7Ve/pMX61orPkMS10
	7UeRETYyGbYJOn9xUamieXrDorfAZPX8tKFK5jQArr+R28r/zBq5HKGZ1KqXjG1GUi80
	/MhHVa7f8yrDu4EFOdDdXjbsbrd6sMA15FLmk/HIhjcBW04Ra9Siewnst6FCiBwOPu5j
	0ZP5W2b72MEKiwkj0hV5txKjE+BG/+Z7L5e8uCK8mthsjWK9YrwwgTTi/ScDu6WeSqr9
	RxYvPqSoQ9MrLWo/a0oHGp2IJYdHP5qrAa1OoxAoH4tz06jXh/XjmxxvG/MukOovjTnB
	C2eg==
X-Received: by 10.180.91.109 with SMTP id cd13mr9617397wib.46.1415832963030;
	Wed, 12 Nov 2014 14:56:03 -0800 (PST)
Received: from greymatter ([89.101.76.162]) by mx.google.com with ESMTPSA id
	w10sm33179936wje.10.2014.11.12.14.56.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 14:56:02 -0800 (PST)
Sender: Artur Wroblewski <wrob311@gmail.com>
Received: (nullmailer pid 5025 invoked by uid 1000);
	Wed, 12 Nov 2014 22:56:00 -0000
From: wrobell <wrobell@pld-linux.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Nov 2014 22:55:33 +0000
Message-Id: <1415832933-372-1-git-send-email-wrobell@pld-linux.org>
X-Mailer: git-send-email 2.1.3
Subject: [PATCH] Replace Python 3.3.x with Python 3.4.2
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
X-List-Received-Date: Wed, 12 Nov 2014 22:56:05 -0000

From: Artur Wroblewski <wrobell@pld-linux.org>

Replace Python 3.3.x with Python 3.4.2 (bug #6857)

This also fixes issue with missing basic Python 3.x modules, see

    https://bugzilla.yoctoproject.org/show_bug.cgi?id=6831

The text of the license changed a little, it contains new dates.

This change enables Python 3.4.2 successful build and possiblity of Python 3
being run on a Yocto Project based distribution, but is still work in progress.
Beside missing features specific to Python 3.4 (i.e. pip support), some
patches need review and updating

- 020-dont-compile-python-files.patch
- 070-dont-clean-ipkg-install.patch
- 080-distutils-dont_adjust_files.patch
- 110-enable-zlib.patch
- 130-readline-setup.patch
- 150-fix-setupterm.patch
- fix-ast.h-dependency.patch

There is new patch - python-debug.patch - to fix build when building Python
without debug switch.

Despite further work needed, I hope this patch can be merged, so further
work on Python 3 support can be continued in smaller steps.

Signed-off-by: Artur Wroblewski <wrobell@pld-linux.org>
---
 documentation/ref-manual/ref-variables.xml         |   2 +-
 meta/classes/distutils3-base.bbclass               |   2 +-
 meta/classes/distutils3-native-base.bbclass        |   2 +-
 meta/classes/python3native.bbclass                 |   2 +-
 ...on-3.3-manifest.inc => python-3.4-manifest.inc} | 142 +++++-----
 ...on3-native_3.3.3.bb => python3-native_3.4.2.bb} |  34 +--
 ...2-distutils-prefix-is-inside-staging-area.patch |  29 +-
 .../python3/avoid-ncursesw-include-path.patch      |  32 +--
 .../recipes-devtools/python/python3/makerace.patch |   2 -
 ....3-multilib.patch => python-3.4-multilib.patch} | 307 ++++++++++-----------
 .../python/python3/python-debug.patch              |  26 ++
 .../python/python3/unixccompiler.patch             |   4 +-
 .../python/{python3_3.3.3.bb => python3_3.4.2.bb}  |  52 ++--
 ...te-manifest-3.3.py => generate-manifest-3.4.py} |  56 ++--
 14 files changed, 326 insertions(+), 366 deletions(-)
 rename meta/recipes-devtools/python/{python-3.3-manifest.inc => python-3.4-manifest.inc} (32%)
 rename meta/recipes-devtools/python/{python3-native_3.3.3.bb => python3-native_3.4.2.bb} (71%)
 rename meta/recipes-devtools/python/python3/{python-3.3-multilib.patch => python-3.4-multilib.patch} (71%)
 create mode 100644 meta/recipes-devtools/python/python3/python-debug.patch
 rename meta/recipes-devtools/python/{python3_3.3.3.bb => python3_3.4.2.bb} (81%)
 rename scripts/contrib/python/{generate-manifest-3.3.py => generate-manifest-3.4.py} (86%)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index b22c661..ab9ee13 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -6953,7 +6953,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
                     The OpenEmbedded build system uses the ABI to construct
                     directory names used when installing the Python headers
                     and libraries in sysroot
-                    (e.g. <filename>.../python3.3m/...</filename>).
+                    (e.g. <filename>.../python3.4m/...</filename>).
                 </para>
 
                 <para>
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index d4d25dc..af3aa00 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,7 +1,7 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES', True) == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
-PYTHON_BASEVERSION = "3.3"
+PYTHON_BASEVERSION = "3.4"
 PYTHON_ABI = "m"
 
 inherit distutils-common-base python3native
diff --git a/meta/classes/distutils3-native-base.bbclass b/meta/classes/distutils3-native-base.bbclass
index ed3fe54..1117101 100644
--- a/meta/classes/distutils3-native-base.bbclass
+++ b/meta/classes/distutils3-native-base.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION = "3.3"
+PYTHON_BASEVERSION = "3.4"
 PYTHON_ABI = "m"
 
 inherit distutils-native-base
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index f86374f..cf83017 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION = "3.3"
+PYTHON_BASEVERSION = "3.4"
 
 inherit python-dir
 
diff --git a/meta/recipes-devtools/python/python-3.3-manifest.inc b/meta/recipes-devtools/python/python-3.4-manifest.inc
similarity index 32%
rename from meta/recipes-devtools/python/python-3.3-manifest.inc
rename to meta/recipes-devtools/python/python-3.4-manifest.inc
index 46a2d44..d534c57 100644
--- a/meta/recipes-devtools/python/python-3.3-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
@@ -1,61 +1,69 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../../scripts/contrib/python/generate-manifest-3.3.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: 'generate-manifest-3.4.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
+PROVIDES+="${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-concurrent ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
 
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-concurrent ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
-FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python3.3/lib2to3 "
+FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python3.4/lib2to3 "
+
+SUMMARY_${PN}-asyncio="Python Asyncio Library"
+RDEPENDS_${PN}-asyncio="${PN}-core"
+FILES_${PN}-asyncio="${libdir}/python3.4/asyncio "
 
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
+
+SUMMARY_${PN}-concurrent="Launching parallel tasks"
+RDEPENDS_${PN}-concurrent="${PN}-core"
+FILES_${PN}-concurrent="${libdir}/python3.4/concurrent "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
-FILES_${PN}-core="${libdir}/python3.3/__future__.* ${libdir}/python3.3/_abcoll.* ${libdir}/python3.3/abc.* ${libdir}/python3.3/copy.* ${libdir}/python3.3/copy_reg.* ${libdir}/python3.3/ConfigParser.* ${libdir}/python3.3/genericpath.* ${libdir}/python3.3/getopt.* ${libdir}/python3.3/linecache.* ${libdir}/python3.3/new.* ${libdir}/python3.3/os.* ${libdir}/python3.3/posixpath.* ${libdir}/python3.3/struct.* ${libdir}/python3.3/warnings.* ${libdir}/python3.3/site.* ${libdir}/python3.3/stat.* ${libdir}/python3.3/UserDict.* ${libdir}/python3.3/UserList.* ${libdir}/python3.3/UserString.* ${libdir}/python3.3/lib-dynload/binascii.*.so ${libdir}/python3.3/lib-dynload/_struct.*.so ${libdir}/python3.3/lib-dynload/time.*.so ${libdir}/python3.3/lib-dynload/xreadlines.*.so ${libdir}/python3.3/types.* ${libdir}/python3.3/platform.* ${bindir}/python* ${libdir}/python3.3/_weakrefset.* ${libdir}/python3.3/sysconfig.* ${libdir}/python3.3/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python3.4/__future__.* ${libdir}/python3.4/_abcoll.* ${libdir}/python3.4/_sitebuiltins.* ${libdir}/python3.4/_sysconfigdata.* ${libdir}/python3.4/_weakrefset.* ${libdir}/python3.4/abc.* ${libdir}/python3.4/argparse.* ${libdir}/python3.4/copy.* ${libdir}/python3.4/copyreg.* ${libdir}/python3.4/ConfigParser.* ${libdir}/python3.4/genericpath.* ${libdir}/python3.4/getopt.* ${libdir}/python3.4/linecache.* ${libdir}/python3.4/new.* ${libdir}/python3.4/os.* ${libdir}/python3.4/posixpath.* ${libdir}/python3.4/struct.* ${libdir}/python3.4/warnings.* ${libdir}/python3.4/site.* ${libdir}/python3.4/stat.* ${libdir}/python3.4/UserDict.* ${libdir}/python3.4/UserList.* ${libdir}/python3.4/UserString.* ${libdir}/python3.4/lib-dynload/binascii.*.so ${libdir}/python3.4/lib-dynload/_struct.*.so ${libdir}/python3.4/lib-dynload/time.*.so ${libdir}/python3.4/lib-dynload/xreadlines.*.so ${libdir}/python3.4/types.* ${libdir}/python3.4/platform.* ${bindir}/python* ${libdir}/python3.4/selectors.* ${libdir}/python3.4/sysconfig.* ${libdir}/python3.4/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
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
+FILES_${PN}-datetime="${libdir}/python3.4/_strptime.* ${libdir}/python3.4/calendar.* ${libdir}/python3.4/datetime.* ${libdir}/python3.4/lib-dynload/_datetime.*.so "
 
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
@@ -63,202 +71,194 @@ FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdi
 
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
-
-SUMMARY_${PN}-importlib="Python import implementation library"
-RDEPENDS_${PN}-importlib="${PN}-core"
-FILES_${PN}-importlib="${libdir}/python3.3/importlib "
+FILES_${PN}-image="${libdir}/python3.4/colorsys.* ${libdir}/python3.4/imghdr.* ${libdir}/python3.4/lib-dynload/imageop.*.so ${libdir}/python3.4/lib-dynload/rgbimg.*.so "
 
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
+FILES_${PN}-lang="${libdir}/python3.4/lib-dynload/array.*.so ${libdir}/python3.4/lib-dynload/_bisect.*.so ${libdir}/python3.4/lib-dynload/_bz2.*.so ${libdir}/python3.4/lib-dynload/_collections.*.so ${libdir}/python3.4/lib-dynload/_crypt.*.so ${libdir}/python3.4/lib-dynload/_decimal.*.so ${libdir}/python3.4/lib-dynload/_functools.*.so ${libdir}/python3.4/lib-dynload/_heapq.*.so ${libdir}/python3.4/lib-dynload/itertools.*.so ${libdir}/python3.4/lib-dynload/_lzma.*.so ${libdir}/python3.4/lib-dynload/_md5.*.so ${libdir}/python3.4/lib-dynload/_opcode.*.so ${libdir}/python3.4/lib-dynload/parser.*.so ${libdir}/python3.4/lib-dynload/_posixsubprocess.*.so ${libdir}/python3.4/lib-dynload/_sha1.*.so ${libdir}/python3.4/lib-dynload/spwd.*.so ${libdir}/python3.4/lib-dynload/_testbuffer.*.so ${libdir}/python3.4/lib-dynload/_testcapi.*.so ${libdir}/python3.4/lib-dynload/_testimportmultiple.*.so ${libdir}/python3.4/lib-dynload/_weakref.*.so ${libdir}/python3.4/lib-dynload/xxlimited.*.so ${libdir}/python3.4/lib-dynload/zlib.*.so ${libdir}/python3.4/__phello__.foo.* ${libdir}/python3.4/_bootlocale.* ${libdir}/python3.4/_collections_abc.* ${libdir}/python3.4/_dummy_thread.* ${libdir}/python3.4/_markupbase.* ${libdir}/python3.4/_osx_support.* ${libdir}/python3.4/aifc.* ${libdir}/python3.4/antigravity.* ${libdir}/python3.4/ast.* ${libdir}/python3.4/asynchat.* ${libdir}/python3.4/asyncore.* ${libdir}/python3.4/atexit.* ${libdir}/python3.4/binhex.* ${libdir}/python3.4/bisect.* ${libdir}/python3.4/bz2.* ${libdir}/python3.4/cgitb.* ${libdir}/python3.4/code.* ${libdir}/python3.4/codeop.* ${libdir}/python3.4/collections.* ${libdir}/python3.4/configparser.* ${libdir}/python3.4/contextlib.* ${libdir}/python3.4/crypt.* ${libdir}/python3.4/decimal.* ${libdir}/python3.4/dis.* ${libdir}/python3.4/ensurepip ${libdir}/python3.4/enum.* ${libdir}/python3.4/filecmp.* ${libdir}/python3.4/fileinput.* ${libdir}/python3.4/fractions.* ${libdir}/python3.4/functools.* ${libdir}/python3.4/heapq.* ${libdir}/python3.4/html ${libdir}/python3.4/http ${libdir}/python3.4/imp.* ${libdir}/python3.4/importlib ${libdir}/python3.4/inspect.* ${libdir}/python3.4/ipaddress.* ${libdir}/python3.4/keyword.* ${libdir}/python3.4/lzma.* ${libdir}/python3.4/macpath.* ${libdir}/python3.4/macurl2path.* ${libdir}/python3.4/mailcap.* ${libdir}/python3.4/modulefinder.* ${libdir}/python3.4/netrc.* ${libdir}/python3.4/ntpath.* ${libdir}/python3.4/nturl2path.* ${libdir}/python3.4/opcode.* ${libdir}/python3.4/operator.* ${libdir}/python3.4/pathlib.* ${libdir}/python3.4/plat-linux ${libdir}/python3.4/plistlib.* ${libdir}/python3.4/pyclbr.* ${libdir}/python3.4/queue.* ${libdir}/python3.4/reprlib.* ${libdir}/python3.4/runpy.* ${libdir}/python3.4/sched.* ${libdir}/python3.4/socketserver.* ${libdir}/python3.4/statistics.* ${libdir}/python3.4/symbol.* ${libdir}/python3.4/symtable.* ${libdir}/python3.4/tabnanny.* ${libdir}/python3.4/this.* ${libdir}/python3.4/timeit.* ${libdir}/python3.4/token.* ${libdir}/python3.4/tokenize.* ${libdir}/python3.4/trace.* ${libdir}/python3.4/traceback.* ${libdir}/python3.4/tracemalloc.* ${libdir}/python3.4/turtle.* ${libdir}/python3.4/turtledemo ${libdir}/python3.4/venv ${libdir}/python3.4/weakref.* ${libdir}/python3.4/webbrowser.* ${libdir}/python3.4/wsgiref "
 
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
+FILES_${PN}-netclient="${libdir}/python3.4/*Cookie*.* ${libdir}/python3.4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* ${libdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3.4/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.* ${libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/python3.4/telnetlib.* ${libdir}/python3.4/urllib ${libdir}/python3.4/uuid.* ${libdir}/python3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
-FILES_${PN}-netserver="${libdir}/python3.3/cgi.* ${libdir}/python3.3/*HTTPServer.* ${libdir}/python3.3/SocketServer.* "
+FILES_${PN}-netserver="${libdir}/python3.4/cgi.* ${libdir}/python3.4/*HTTPServer.* ${libdir}/python3.4/SocketServer.* "
 
 SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python3.3/decimal.* ${libdir}/python3.3/numbers.* "
+FILES_${PN}-numbers="${libdir}/python3.4/numbers.* "
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python3.3/pickle.* ${libdir}/python3.3/shelve.* ${libdir}/python3.3/lib-dynload/cPickle.*.so ${libdir}/python3.3/pickletools.* "
+FILES_${PN}-pickle="${libdir}/python3.4/_compat_pickle.* ${libdir}/python3.4/pickle.* ${libdir}/python3.4/shelve.* ${libdir}/python3.4/lib-dynload/_pickle.*.so ${libdir}/python3.4/pickletools.* "
 
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
 
 SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
-FILES_${PN}-resource="${libdir}/python3.3/lib-dynload/resource.*.so "
-
-SUMMARY_${PN}-robotparser="Python robots.txt parser"
-RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
-FILES_${PN}-robotparser="${libdir}/python3.3/urllib/robotparser.* "
+FILES_${PN}-resource="${libdir}/python3.4/lib-dynload/resource.*.so "
 
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
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-concurrent ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.4.2.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-native_3.3.3.bb
rename to meta/recipes-devtools/python/python3-native_3.4.2.bb
index 9ae2a0b..9f124a4 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.2.bb
@@ -1,37 +1,29 @@
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
-file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
-file://070-dont-clean-ipkg-install.patch \
-file://080-distutils-dont_adjust_files.patch \
-file://110-enable-zlib.patch \
-file://130-readline-setup.patch \
-file://150-fix-setupterm.patch \
-file://python-3.3-multilib.patch \
-file://03-fix-tkinter-detection.patch \
-file://avoid_warning_about_tkinter.patch \
-file://06-ctypes-libffi-fix-configure.patch \
-file://shutil-follow-symlink-fix.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
+file://host_include_contamination.patch \
+file://avoid-ncursesw-include-path.patch \
+file://python-3.4-multilib.patch \
+file://06-ctypes-libffi-fix-configure.patch \
 file://sysroot-include-headers.patch \
 file://unixccompiler.patch \
-file://fix-ast.h-dependency.patch \
 file://makerace.patch \
-${DISTRO_SRC_URI} \
-file://python3-fix-build-error-with-Readline-6.3.patch \
+file://03-fix-tkinter-detection.patch \
+file://python-debug.patch \
 "
-SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
-SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
+SRC_URI[md5sum] = "36fc7327c02c6f12fa24fc9ba78039e3"
+SRC_URI[sha256sum] = "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827e0f970dcf04b2def"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4eaea08eaaf6875189b0c49f26fa2005"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
 S = "${WORKDIR}/Python-${PV}"
 
@@ -40,6 +32,8 @@ DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native s
 
 inherit native
 
+CONFIGUREOPTS += " --without-pydebug --without-ensurepip"
+
 RPROVIDES += "python3-distutils-native python3-compression-native python3-textutils-native python3-core-native"
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN}"
@@ -57,7 +51,7 @@ EXTRA_OEMAKE = '\
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
-do_configure_prepend() {
+do_configure_append() {
 	autoreconf --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
 }
 
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index c5846a5..3cba081 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,14 +1,6 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-# The proper prefix is inside our staging area.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-# Signed-off-by: Phil Blundell <philb@gnu.org>
-# Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: Python-3.3.2/Lib/distutils/sysconfig.py
-===================================================================
---- Python-3.3.2.orig/Lib/distutils/sysconfig.py	2013-07-30 00:00:52.769749805 -0700
-+++ Python-3.3.2/Lib/distutils/sysconfig.py	2013-07-30 00:16:22.545767248 -0700
+diff -Nur Python-3.4.2.orig/Lib/distutils/sysconfig.py Python-3.4.2/Lib/distutils/sysconfig.py
+--- Python-3.4.2.orig/Lib/distutils/sysconfig.py	2014-10-08 09:18:12.000000000 +0100
++++ Python-3.4.2/Lib/distutils/sysconfig.py	2014-10-23 12:26:27.409663674 +0100
 @@ -16,10 +16,11 @@
  from .errors import DistutilsPlatformError
  
@@ -36,7 +28,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
          prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
      if os.name == "posix":
          if python_build:
-@@ -136,6 +139,12 @@
+@@ -134,6 +137,12 @@
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -49,7 +41,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
      if prefix is None:
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
-@@ -144,7 +153,7 @@
+@@ -142,7 +151,7 @@
  
      if os.name == "posix":
          libpython = os.path.join(prefix,
@@ -58,16 +50,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
          if standard_lib:
              return libpython
          else:
-@@ -249,7 +258,7 @@
-     else:
-         # The name of the config.h file changed in 2.2
-         config_h = 'pyconfig.h'
--    return os.path.join(inc_dir, config_h)
-+    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
- 
- 
- def get_makefile_filename():
-@@ -258,7 +267,7 @@
+@@ -251,7 +260,7 @@
          return os.path.join(_sys_home or project_base, "Makefile")
      lib_dir = get_python_lib(plat_specific=0, standard_lib=1)
      config_file = 'config-{}{}'.format(get_python_version(), build_flags)
diff --git a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
index 054a131..cf3a0da 100644
--- a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
+++ b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
@@ -1,29 +1,11 @@
-We should make sure that sysroot is used by gcc instead of assuming
-hardcoded locations for include paths
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-:
-Index: Python-3.3.3/configure.ac
-===================================================================
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
+--- Python-3.4.2/configure.ac.orig	2014-10-17 21:58:13.967488345 +0100
++++ Python-3.4.2/configure.ac	2014-10-17 21:59:01.231689639 +0100
+@@ -4399,7 +4399,7 @@
  
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
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index d8a6892..62d7de1 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -11,8 +11,6 @@ The easiest way to avoid this is to list the dependencies explictly.
 
 RP 28/2/2014
 
-Upstream-Status: Pending
-
 Index: Python-3.3.3/Makefile.pre.in
 ===================================================================
 --- Python-3.3.3.orig/Makefile.pre.in	2014-02-27 14:04:38.268339533 +0000
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.4-multilib.patch
similarity index 71%
rename from meta/recipes-devtools/python/python3/python-3.3-multilib.patch
rename to meta/recipes-devtools/python/python3/python-3.4-multilib.patch
index 7d66a0e..0a5bff7 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.4-multilib.patch
@@ -1,14 +1,52 @@
-get the sys.lib from python itself and do not use hardcoded value of 'lib'
-
--Khem
-
-Upstream-Status: Pending
-
-Index: Python-3.3.2/Include/pythonrun.h
-===================================================================
---- Python-3.3.2.orig/Include/pythonrun.h	2013-05-15 09:32:54.000000000 -0700
-+++ Python-3.3.2/Include/pythonrun.h	2013-07-27 16:19:54.099877246 -0700
-@@ -181,6 +181,8 @@
+diff -Nur Python-3.4.2.orig/configure.ac Python-3.4.2/configure.ac
+--- Python-3.4.2.orig/configure.ac	2014-10-08 09:18:16.000000000 +0100
++++ Python-3.4.2/configure.ac	2014-10-18 00:01:31.206664762 +0100
+@@ -791,6 +791,41 @@
+ MULTIARCH=$($CC --print-multiarch 2>/dev/null)
+ AC_SUBST(MULTIARCH)
+ 
++AC_SUBST(ARCH)
++AC_MSG_CHECKING(ARCH)
++ARCH=`uname -m`
++case $ARCH in
++i?86) ARCH=i386;;
++esac
++AC_MSG_RESULT($ARCH)
++
++AC_SUBST(LIB)
++AC_MSG_CHECKING(LIB)
++case $ac_sys_system in
++Linux*)
++  # Test if the compiler is 64bit
++  echo 'int i;' > conftest.$ac_ext
++  python_cv_cc_64bit_output=no
++  if AC_TRY_EVAL(ac_compile); then
++    case `/usr/bin/file conftest.$ac_objext` in
++    *"ELF 64"*)
++      python_cv_cc_64bit_output=yes
++      ;;
++    esac
++  fi
++  rm -rf conftest*
++  ;;
++esac
++
++case $ARCH:$python_cv_cc_64bit_output in
++ppc64:yes | powerpc64:yes | s390x:yes | sparc64:yes | x86_64:yes)
++  LIB="lib64"
++  ;;
++*:*)
++  LIB="lib"
++  ;;
++esac
++AC_MSG_RESULT($LIB)
+ 
+ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
+diff -Nur Python-3.4.2.orig/Include/pythonrun.h Python-3.4.2/Include/pythonrun.h
+--- Python-3.4.2.orig/Include/pythonrun.h	2014-10-08 09:18:11.000000000 +0100
++++ Python-3.4.2/Include/pythonrun.h	2014-10-18 00:01:31.206664762 +0100
+@@ -220,6 +220,8 @@
  /* In their own files */
  PyAPI_FUNC(const char *) Py_GetVersion(void);
  PyAPI_FUNC(const char *) Py_GetPlatform(void);
@@ -17,20 +55,19 @@ Index: Python-3.3.2/Include/pythonrun.h
  PyAPI_FUNC(const char *) Py_GetCopyright(void);
  PyAPI_FUNC(const char *) Py_GetCompiler(void);
  PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
-Index: Python-3.3.2/Lib/distutils/command/install.py
-===================================================================
---- Python-3.3.2.orig/Lib/distutils/command/install.py	2013-05-15 09:32:54.000000000 -0700
-+++ Python-3.3.2/Lib/distutils/command/install.py	2013-07-27 16:19:54.099877246 -0700
-@@ -25,6 +25,8 @@
-     from site import USER_SITE
-     HAS_USER_SITE = True
+diff -Nur Python-3.4.2.orig/Lib/distutils/command/install.py Python-3.4.2/Lib/distutils/command/install.py
+--- Python-3.4.2.orig/Lib/distutils/command/install.py	2014-10-08 09:18:12.000000000 +0100
++++ Python-3.4.2/Lib/distutils/command/install.py	2014-10-18 00:01:31.206664762 +0100
+@@ -19,6 +19,8 @@
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
+@@ -30,7 +32,7 @@
  INSTALL_SCHEMES = {
      'unix_prefix': {
          'purelib': '$base/lib/python$py_version_short/site-packages',
@@ -39,11 +76,10 @@ Index: Python-3.3.2/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-3.3.2/Lib/pydoc.py
-===================================================================
---- Python-3.3.2.orig/Lib/pydoc.py	2013-05-15 09:32:55.000000000 -0700
-+++ Python-3.3.2/Lib/pydoc.py	2013-07-27 16:19:54.103877246 -0700
-@@ -372,7 +372,7 @@
+diff -Nur Python-3.4.2.orig/Lib/pydoc.py Python-3.4.2/Lib/pydoc.py
+--- Python-3.4.2.orig/Lib/pydoc.py	2014-10-08 09:18:12.000000000 +0100
++++ Python-3.4.2/Lib/pydoc.py	2014-10-18 00:01:31.206664762 +0100
+@@ -394,7 +394,7 @@
  
          docloc = os.environ.get("PYTHONDOCS", self.PYTHONDOCS)
  
@@ -52,14 +88,13 @@ Index: Python-3.3.2/Lib/pydoc.py
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
+diff -Nur Python-3.4.2.orig/Lib/site.py Python-3.4.2/Lib/site.py
+--- Python-3.4.2.orig/Lib/site.py	2014-10-08 09:18:12.000000000 +0100
++++ Python-3.4.2/Lib/site.py	2014-10-18 00:01:31.209998157 +0100
+@@ -304,13 +304,19 @@
+         seen.add(prefix)
+ 
+         if os.sep == '/':
 -            sitepackages.append(os.path.join(prefix, "lib",
 +            sitepackages.append(os.path.join(prefix, sys.lib,
                                          "python" + sys.version[:3],
@@ -79,10 +114,54 @@ Index: Python-3.3.2/Lib/site.py
          if sys.platform == "darwin":
              # for framework builds *only* we add the standard Apple
              # locations.
-Index: Python-3.3.2/Lib/trace.py
-===================================================================
---- Python-3.3.2.orig/Lib/trace.py	2013-05-15 09:32:56.000000000 -0700
-+++ Python-3.3.2/Lib/trace.py	2013-07-27 16:19:54.103877246 -0700
+diff -Nur Python-3.4.2.orig/Lib/sysconfig.py Python-3.4.2/Lib/sysconfig.py
+--- Python-3.4.2.orig/Lib/sysconfig.py	2014-10-08 09:18:12.000000000 +0100
++++ Python-3.4.2/Lib/sysconfig.py	2014-10-18 00:01:31.209998157 +0100
+@@ -20,10 +20,10 @@
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{installed_base}/lib/python{py_version_short}',
+-        'platstdlib': '{platbase}/lib/python{py_version_short}',
++        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
++        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}',
+         'platinclude':
+@@ -32,10 +32,10 @@
+         'data': '{base}',
+         },
+     'posix_home': {
+-        'stdlib': '{installed_base}/lib/python',
+-        'platstdlib': '{base}/lib/python',
++        'stdlib': '{installed_base}/'+sys.lib+'/python',
++        'platstdlib': '{base}/'+sys.lib+'/python',
+         'purelib': '{base}/lib/python',
+-        'platlib': '{base}/lib/python',
++        'platlib': '{base}/'+sys.lib+'/python',
+         'include': '{installed_base}/include/python',
+         'platinclude': '{installed_base}/include/python',
+         'scripts': '{base}/bin',
+@@ -61,10 +61,10 @@
+         'data': '{userbase}',
+         },
+     'posix_user': {
+-        'stdlib': '{userbase}/lib/python{py_version_short}',
+-        'platstdlib': '{userbase}/lib/python{py_version_short}',
++        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
++        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include': '{userbase}/include/python{py_version_short}',
+         'scripts': '{userbase}/bin',
+         'data': '{userbase}',
+diff -Nur Python-3.4.2.orig/Lib/trace.py Python-3.4.2/Lib/trace.py
+--- Python-3.4.2.orig/Lib/trace.py	2014-10-08 09:18:14.000000000 +0100
++++ Python-3.4.2/Lib/trace.py	2014-10-18 00:01:31.209998157 +0100
 @@ -751,10 +751,10 @@
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -96,11 +175,10 @@ Index: Python-3.3.2/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-3.3.2/Makefile.pre.in
-===================================================================
---- Python-3.3.2.orig/Makefile.pre.in	2013-07-27 16:19:16.000000000 -0700
-+++ Python-3.3.2/Makefile.pre.in	2013-07-27 16:19:54.103877246 -0700
-@@ -96,6 +96,8 @@
+diff -Nur Python-3.4.2.orig/Makefile.pre.in Python-3.4.2/Makefile.pre.in
+--- Python-3.4.2.orig/Makefile.pre.in	2014-10-08 09:18:14.000000000 +0100
++++ Python-3.4.2/Makefile.pre.in	2014-10-18 00:01:31.209998157 +0100
+@@ -101,6 +101,8 @@
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -109,7 +187,7 @@ Index: Python-3.3.2/Makefile.pre.in
  
  # Multiarch directory (may be empty)
  MULTIARCH=	@MULTIARCH@
-@@ -115,7 +117,7 @@
+@@ -120,7 +122,7 @@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -118,7 +196,7 @@ Index: Python-3.3.2/Makefile.pre.in
  ABIFLAGS=	@ABIFLAGS@
  
  # Detailed destination directories
-@@ -635,6 +637,7 @@
+@@ -710,6 +712,7 @@
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -126,7 +204,7 @@ Index: Python-3.3.2/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Modules/python.o: $(srcdir)/Modules/python.c
-@@ -701,7 +704,7 @@
+@@ -778,7 +781,7 @@
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -135,11 +213,10 @@ Index: Python-3.3.2/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-3.3.2/Modules/getpath.c
-===================================================================
---- Python-3.3.2.orig/Modules/getpath.c	2013-05-15 09:32:59.000000000 -0700
-+++ Python-3.3.2/Modules/getpath.c	2013-07-27 16:19:54.107877246 -0700
-@@ -121,9 +121,11 @@
+diff -Nur Python-3.4.2.orig/Modules/getpath.c Python-3.4.2/Modules/getpath.c
+--- Python-3.4.2.orig/Modules/getpath.c	2014-10-08 09:18:15.000000000 +0100
++++ Python-3.4.2/Modules/getpath.c	2014-10-18 00:02:54.224855977 +0100
+@@ -117,9 +117,11 @@
  #define EXEC_PREFIX PREFIX
  #endif
  
@@ -153,19 +230,17 @@ Index: Python-3.3.2/Modules/getpath.c
  #endif
  
  #ifndef LANDMARK
-@@ -135,7 +137,7 @@
+@@ -130,6 +132,7 @@
+ static wchar_t exec_prefix[MAXPATHLEN+1];
  static wchar_t progpath[MAXPATHLEN+1];
  static wchar_t *module_search_path = NULL;
- static int module_search_path_malloced = 0;
--static wchar_t *lib_python = L"lib/python" VERSION;
 +static wchar_t *lib_python = L"" LIB_PYTHON;
  
  static void
  reduce(wchar_t *dir)
-Index: Python-3.3.2/Python/getplatform.c
-===================================================================
---- Python-3.3.2.orig/Python/getplatform.c	2013-05-15 09:33:00.000000000 -0700
-+++ Python-3.3.2/Python/getplatform.c	2013-07-27 16:19:54.107877246 -0700
+diff -Nur Python-3.4.2.orig/Python/getplatform.c Python-3.4.2/Python/getplatform.c
+--- Python-3.4.2.orig/Python/getplatform.c	2014-10-08 09:18:16.000000000 +0100
++++ Python-3.4.2/Python/getplatform.c	2014-10-18 00:01:31.213331551 +0100
 @@ -10,3 +10,23 @@
  {
  	return PLATFORM;
@@ -190,11 +265,10 @@ Index: Python-3.3.2/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-3.3.2/Python/sysmodule.c
-===================================================================
---- Python-3.3.2.orig/Python/sysmodule.c	2013-05-15 09:33:00.000000000 -0700
-+++ Python-3.3.2/Python/sysmodule.c	2013-07-27 16:19:54.107877246 -0700
-@@ -1612,6 +1612,10 @@
+diff -Nur Python-3.4.2.orig/Python/sysmodule.c Python-3.4.2/Python/sysmodule.c
+--- Python-3.4.2.orig/Python/sysmodule.c	2014-10-08 09:18:16.000000000 +0100
++++ Python-3.4.2/Python/sysmodule.c	2014-10-18 00:01:31.213331551 +0100
+@@ -1697,6 +1697,10 @@
                          PyUnicode_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyUnicode_FromString(Py_GetPlatform()));
@@ -205,11 +279,10 @@ Index: Python-3.3.2/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyUnicode_FromWideChar(
                                 Py_GetProgramFullPath(), -1));
-Index: Python-3.3.2/setup.py
-===================================================================
---- Python-3.3.2.orig/setup.py	2013-07-27 16:19:17.000000000 -0700
-+++ Python-3.3.2/setup.py	2013-07-27 16:19:54.107877246 -0700
-@@ -439,7 +439,7 @@
+diff -Nur Python-3.4.2.orig/setup.py Python-3.4.2/setup.py
+--- Python-3.4.2.orig/setup.py	2014-10-08 09:18:16.000000000 +0100
++++ Python-3.4.2/setup.py	2014-10-18 00:01:31.213331551 +0100
+@@ -451,7 +451,7 @@
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -218,7 +291,7 @@ Index: Python-3.3.2/setup.py
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -497,8 +497,7 @@
+@@ -508,8 +508,7 @@
          # be assumed that no additional -I,-L directives are needed.
          if not cross_compiling:
              lib_dirs = self.compiler.library_dirs + [
@@ -228,7 +301,7 @@ Index: Python-3.3.2/setup.py
                  ]
              inc_dirs = self.compiler.include_dirs + ['/usr/include']
          else:
-@@ -675,11 +674,11 @@
+@@ -730,11 +729,11 @@
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -242,95 +315,3 @@ Index: Python-3.3.2/setup.py
                                     extra_link_args=readline_extra_link_args,
                                     libraries=readline_libs) )
          else:
-Index: Python-3.3.2/Lib/sysconfig.py
-===================================================================
---- Python-3.3.2.orig/Lib/sysconfig.py	2013-05-15 09:32:55.000000000 -0700
-+++ Python-3.3.2/Lib/sysconfig.py	2013-07-27 16:19:54.111877246 -0700
-@@ -21,10 +21,10 @@
- 
- _INSTALL_SCHEMES = {
-     'posix_prefix': {
--        'stdlib': '{installed_base}/lib/python{py_version_short}',
--        'platstdlib': '{platbase}/lib/python{py_version_short}',
-+        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}',
-+        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
-         'purelib': '{base}/lib/python{py_version_short}/site-packages',
--        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
-+        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
-         'include':
-             '{installed_base}/include/python{py_version_short}{abiflags}',
-         'platinclude':
-@@ -33,10 +33,10 @@
-         'data': '{base}',
-         },
-     'posix_home': {
--        'stdlib': '{installed_base}/lib/python',
--        'platstdlib': '{base}/lib/python',
-+        'stdlib': '{installed_base}/'+sys.lib+'/python',
-+        'platstdlib': '{base}/'+sys.lib+'/python',
-         'purelib': '{base}/lib/python',
--        'platlib': '{base}/lib/python',
-+        'platlib': '{base}/'+sys.lib+'/python',
-         'include': '{installed_base}/include/python',
-         'platinclude': '{installed_base}/include/python',
-         'scripts': '{base}/bin',
-@@ -81,10 +81,10 @@
-         'data': '{userbase}',
-         },
-     'posix_user': {
--        'stdlib': '{userbase}/lib/python{py_version_short}',
--        'platstdlib': '{userbase}/lib/python{py_version_short}',
-+        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
-+        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
-         'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
--        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
-+        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
-         'include': '{userbase}/include/python{py_version_short}',
-         'scripts': '{userbase}/bin',
-         'data': '{userbase}',
-Index: Python-3.3.2/configure.ac
-===================================================================
---- Python-3.3.2.orig/configure.ac	2013-05-15 09:33:00.000000000 -0700
-+++ Python-3.3.2/configure.ac	2013-07-27 16:19:54.111877246 -0700
-@@ -769,6 +769,41 @@
- MULTIARCH=$($CC --print-multiarch 2>/dev/null)
- AC_SUBST(MULTIARCH)
- 
-+AC_SUBST(ARCH)
-+AC_MSG_CHECKING(ARCH)
-+ARCH=`uname -m`
-+case $ARCH in
-+i?86) ARCH=i386;;
-+esac
-+AC_MSG_RESULT($ARCH)
-+
-+AC_SUBST(LIB)
-+AC_MSG_CHECKING(LIB)
-+case $ac_sys_system in
-+Linux*)
-+  # Test if the compiler is 64bit
-+  echo 'int i;' > conftest.$ac_ext
-+  python_cv_cc_64bit_output=no
-+  if AC_TRY_EVAL(ac_compile); then
-+    case `/usr/bin/file conftest.$ac_objext` in
-+    *"ELF 64"*)
-+      python_cv_cc_64bit_output=yes
-+      ;;
-+    esac
-+  fi
-+  rm -rf conftest*
-+  ;;
-+esac
-+
-+case $ARCH:$python_cv_cc_64bit_output in
-+ppc64:yes | powerpc64:yes | s390x:yes | sparc64:yes | x86_64:yes)
-+  LIB="lib64"
-+  ;;
-+*:*)
-+  LIB="lib"
-+  ;;
-+esac
-+AC_MSG_RESULT($LIB)
- 
- AC_SUBST(LIBRARY)
- AC_MSG_CHECKING(LIBRARY)
diff --git a/meta/recipes-devtools/python/python3/python-debug.patch b/meta/recipes-devtools/python/python3/python-debug.patch
new file mode 100644
index 0000000..7881add
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python-debug.patch
@@ -0,0 +1,26 @@
+diff -Nur Python-3.4.2.orig/Objects/obmalloc.c Python-3.4.2/Objects/obmalloc.c
+--- Python-3.4.2.orig/Objects/obmalloc.c	2014-10-08 09:18:15.000000000 +0100
++++ Python-3.4.2/Objects/obmalloc.c	2014-10-18 02:32:25.576272764 +0100
+@@ -2141,7 +2141,9 @@
+ 
+             if (p->ref.count == 0) {
+                 /* currently unused */
++#ifdef Py_DEBUG
+                 assert(pool_is_in_list(p, arenas[i].freepools));
++#endif
+                 continue;
+             }
+             ++numpools[sz];
+diff -Nur Python-3.4.2.orig/Objects/unicodeobject.c Python-3.4.2/Objects/unicodeobject.c
+--- Python-3.4.2.orig/Objects/unicodeobject.c	2014-10-08 09:18:15.000000000 +0100
++++ Python-3.4.2/Objects/unicodeobject.c	2014-10-18 02:48:59.667861619 +0100
+@@ -418,6 +418,9 @@
+     }
+     return 1;
+ }
++#else
++int
++_PyUnicode_CheckConsistency(PyObject *op, int check_content) { return 1; }
+ #endif
+ 
+ static PyObject*
diff --git a/meta/recipes-devtools/python/python3/unixccompiler.patch b/meta/recipes-devtools/python/python3/unixccompiler.patch
index 7b90f13..b2229b4 100644
--- a/meta/recipes-devtools/python/python3/unixccompiler.patch
+++ b/meta/recipes-devtools/python/python3/unixccompiler.patch
@@ -13,13 +13,11 @@ Index: Python-3.3.2/Lib/distutils/unixccompiler.py
 ===================================================================
 --- Python-3.3.2.orig/Lib/distutils/unixccompiler.py	2013-05-15 09:32:54.000000000 -0700
 +++ Python-3.3.2/Lib/distutils/unixccompiler.py	2013-08-01 00:58:18.629056286 -0700
-@@ -202,7 +202,9 @@
+@@ -202,7 +202,7 @@
      # ccompiler.py.
  
      def library_dir_option(self, dir):
 -        return "-L" + dir
-+        if dir.startswith("."):
-+            return "-L" + dir
 +        return "-L=" + dir
  
      def _is_gcc(self, compiler_name):
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.4.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3_3.3.3.bb
rename to meta/recipes-devtools/python/python3_3.4.2.bb
index a1cb120..133f831 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.2.bb
@@ -2,52 +2,38 @@ require recipes-devtools/python/python.inc
 
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
-file://020-dont-compile-python-files.patch \
 file://030-fixup-include-dirs.patch \
-file://070-dont-clean-ipkg-install.patch \
-file://080-distutils-dont_adjust_files.patch \
-file://110-enable-zlib.patch \
-file://130-readline-setup.patch \
-file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
-file://fix-ast.h-dependency.patch \
+file://host_include_contamination.patch \
+file://avoid-ncursesw-include-path.patch \
+file://python-3.4-multilib.patch \
+file://06-ctypes-libffi-fix-configure.patch \
+file://sysroot-include-headers.patch \
+file://unixccompiler.patch \
 file://makerace.patch \
+file://03-fix-tkinter-detection.patch \
+file://python-debug.patch \
 ${DISTRO_SRC_URI} \
-file://python3-fix-build-error-with-Readline-6.3.patch \
 "
 
-SRC_URI += "\
-            file://03-fix-tkinter-detection.patch \
-            file://04-default-is-optimized.patch \
-            file://avoid_warning_about_tkinter.patch \
-            file://06-ctypes-libffi-fix-configure.patch \
-            file://remove_sqlite_rpath.patch \
-            file://cgi_py.patch \
-            file://host_include_contamination.patch \
-            file://python-3.3-multilib.patch \
-            file://shutil-follow-symlink-fix.patch \
-            file://sysroot-include-headers.patch \
-            file://unixccompiler.patch \
-            file://avoid-ncursesw-include-path.patch \
-           "
-SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
-SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4eaea08eaaf6875189b0c49f26fa2005"
+SRC_URI[md5sum] = "36fc7327c02c6f12fa24fc9ba78039e3"
+SRC_URI[sha256sum] = "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827e0f970dcf04b2def"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
 S = "${WORKDIR}/Python-${PV}"
 
 inherit autotools multilib_header python3native pkgconfig
 
-CONFIGUREOPTS += " --with-system-ffi "
+CONFIGUREOPTS += " --with-system-ffi --without-pydebug --without-ensurepip"
 
 CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
                 ac_cv_have_lchflags=no \
@@ -56,12 +42,6 @@ CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
                 ac_cv_file__dev_ptmx=yes \
                 ac_cv_file__dev_ptc=no \
 "
-# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
-#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
-TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
-TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
-EXTRA_OEMAKE += "CROSS_COMPILE=yes"
 
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
@@ -84,7 +64,7 @@ do_compile() {
         cd -
 
 	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache,'$(CCACHE)', Makefile
+	sed -i -e s,ccache\ ,'$(CCACHE) ', Makefile
 
 	# remove any bogus LD_LIBRARY_PATH
 	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
diff --git a/scripts/contrib/python/generate-manifest-3.3.py b/scripts/contrib/python/generate-manifest-3.4.py
similarity index 86%
rename from scripts/contrib/python/generate-manifest-3.3.py
rename to scripts/contrib/python/generate-manifest-3.4.py
index 288def2..9855c5b 100755
--- a/scripts/contrib/python/generate-manifest-3.3.py
+++ b/scripts/contrib/python/generate-manifest-3.4.py
@@ -17,7 +17,7 @@ import os
 import sys
 import time
 
-VERSION = "3.3.3"
+VERSION = "3.4.2"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 __version__ = "20140131"
@@ -167,14 +167,15 @@ if __name__ == "__main__":
     #
 
     m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re",
-    "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
+    "__future__.* _abcoll.* _sitebuiltins.* _sysconfigdata.* " +
+    "_weakrefset.* abc.* argparse.* copy.* copyreg.* ConfigParser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
     "warnings.* site.* stat.* " +
     "UserDict.* UserList.* UserString.* " +
     "lib-dynload/binascii.*.so lib-dynload/_struct.*.so lib-dynload/time.*.so " +
     "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* "  + 
-    "_weakrefset.* sysconfig.* config/Makefile " +
+    "selectors.* sysconfig.* config/Makefile " +
     "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/collections " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
@@ -203,6 +204,8 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-smtpd", "Python Simple Mail Transport Daemon", "${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime",
     "${bindir}/smtpd.* smtpd.*" )
 
+    m.addPackage( "${PN}-asyncio", "Python Asyncio Library", "${PN}-core", "asyncio" )
+
     m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
     "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.*.so lib-dynload/audioop.*.so audiodev.* sunaudio.* sunau.* toaiff.*" )
 
@@ -215,6 +218,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs",
     "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so" )
 
+    m.addPackage( "${PN}-concurrent", "Launching parallel tasks", "${PN}-core",
+    "concurrent" )
+
     m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
     "hashlib.* md5.* sha.* lib-dynload/crypt.*.so lib-dynload/_hashlib.*.so lib-dynload/_sha256.*.so lib-dynload/_sha512.*.so" )
 
@@ -228,7 +234,7 @@ if __name__ == "__main__":
     "ctypes lib-dynload/_ctypes.*.so lib-dynload/_ctypes_test.*.so" ) # directory + low level module
 
     m.addPackage( "${PN}-datetime", "Python calendar and time support", "${PN}-core ${PN}-codecs",
-    "_strptime.* calendar.* lib-dynload/datetime.*.so" )
+    "_strptime.* calendar.* datetime.* lib-dynload/_datetime.*.so" )
 
     m.addPackage( "${PN}-db", "Python file-based database support", "${PN}-core",
     "anydbm.* dumbdbm.* whichdb.* dbm lib-dynload/_dbm.*.so" )
@@ -261,9 +267,6 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
-    m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core",
-    "importlib" )
-
     m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
     "lib-dynload/_gdbm.*.so" )
 
@@ -277,11 +280,30 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-math ${PN}-re",
     "json lib-dynload/_json.*.so" ) # package
 
-    m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core",
-    "lib-dynload/_bisect.*.so lib-dynload/_collections.*.so lib-dynload/_heapq.*.so lib-dynload/_weakref.*.so lib-dynload/_functools.*.so " +
-    "lib-dynload/array.*.so lib-dynload/itertools.*.so lib-dynload/operator.*.so lib-dynload/parser.*.so " +
-    "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
-    "tokenize.* traceback.* weakref.*" )
+    m.addPackage(
+        "${PN}-lang", "Python low-level language support", "${PN}-core",
+        """
+        lib-dynload/array.*.so lib-dynload/_bisect.*.so lib-dynload/_bz2.*.so
+        lib-dynload/_collections.*.so lib-dynload/_crypt.*.so
+        lib-dynload/_decimal.*.so lib-dynload/_functools.*.so
+        lib-dynload/_heapq.*.so lib-dynload/itertools.*.so lib-dynload/_lzma.*.so
+        lib-dynload/_md5.*.so lib-dynload/_opcode.*.so lib-dynload/parser.*.so
+        lib-dynload/_posixsubprocess.*.so lib-dynload/_sha1.*.so
+        lib-dynload/spwd.*.so lib-dynload/_testbuffer.*.so
+        lib-dynload/_testcapi.*.so lib-dynload/_testimportmultiple.*.so
+        lib-dynload/_weakref.*.so lib-dynload/xxlimited.*.so lib-dynload/zlib.*.so
+        __phello__.foo.* _bootlocale.* _collections_abc.* _dummy_thread.*
+        _markupbase.* _osx_support.* aifc.* antigravity.* ast.* asynchat.*
+        asyncore.* atexit.* binhex.* bisect.* bz2.* cgitb.* code.* codeop.*
+        collections.* configparser.* contextlib.* crypt.* decimal.* dis.* ensurepip
+        enum.* filecmp.* fileinput.* fractions.* functools.* heapq.* html
+        http imp.* importlib inspect.* ipaddress.* keyword.* lzma.* macpath.*
+        macurl2path.* mailcap.* modulefinder.* netrc.* ntpath.* nturl2path.*
+        opcode.* operator.* pathlib.* plat-linux plistlib.* pyclbr.* queue.*
+        reprlib.* runpy.* sched.* socketserver.* statistics.* symbol.* symtable.*
+        tabnanny.* this.* timeit.* token.* tokenize.* trace.* traceback.*
+        tracemalloc.* turtle.* turtledemo venv weakref.* webbrowser.* wsgiref
+    """)
 
     m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
     "logging" ) # package
@@ -303,16 +325,15 @@ if __name__ == "__main__":
 
     m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
     "*Cookie*.* " +
-    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.* urlparse.* uuid.* rfc822.* mimetools.*" )
+    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib uuid.* rfc822.* mimetools.*" )
 
     m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient",
     "cgi.* *HTTPServer.* SocketServer.*" )
 
-    m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re",
-    "decimal.* numbers.*" )
+    m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re", "numbers.*" )
 
     m.addPackage( "${PN}-pickle", "Python serialisation/persistence support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
-    "pickle.* shelve.* lib-dynload/cPickle.*.so pickletools.*" )
+    "_compat_pickle.* pickle.* shelve.* lib-dynload/_pickle.*.so pickletools.*" )
 
     m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
     "pkgutil.*")
@@ -335,9 +356,6 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
-    m.addPackage( "${PN}-robotparser", "Python robots.txt parser", "${PN}-core ${PN}-netclient",
-    "urllib/robotparser.*")
-
     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
     "subprocess.*" )
 
-- 
2.1.3


