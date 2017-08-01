Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F19AC783BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 13:51:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v71DpMfK009388
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Aug 2017 06:51:22 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 1 Aug 2017 06:51:22 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Aug 2017 09:51:12 -0400
Message-ID: <1501595472-15503-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2] python: don't include -tests with modules
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
X-List-Received-Date: Tue, 01 Aug 2017 13:51:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Although 'test' is listed in the python module list
(https://docs.python.org/3/py-modindex.html) it is meant only to be
used 'internally' by folks developing python itself. Per the
documentation:

  Note The test package is meant for internal use by Python only. It
  is documented for the benefit of the core developers of Python. Any
  use of this package outside of Python’s standard library is
  discouraged as code mentioned here can change or be removed without
  notice between releases of Python.

Per the above it is best not to include this module to discourage
folks who might not head the above warnings. Additionally this module
is one of the largest py modules going, by dropping this unneeded
module from the 'modules' package we can reduce overall image size,
something which is important for many embedded deployments.

The generator scripts as well as the manifests have thus been modified
accordingly, providing a generic mechanism to exclude modules from the
'all modules' package.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

*** v2 ****
Updated the generator script missed in the v1 and pointed out
by RP.

 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-2.7.py      | 9 ++++++---
 scripts/contrib/python/generate-manifest-3.5.py      | 9 ++++++---
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 7ed254b..57d4834 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -281,7 +281,7 @@ RDEPENDS_${PN}-zlib="${PN}-core"
 FILES_${PN}-zlib="${libdir}/python2.7/lib-dynload/zlib.so "
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-contextlib ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-plistlib ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 65db7e8..0260e87 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -277,7 +277,7 @@ RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang ${PN}-pyd
 FILES_${PN}-xmlrpc="${libdir}/python3.5/xmlrpclib.* ${libdir}/python3.5/__pycache__/xmlrpclib.* ${libdir}/python3.5/SimpleXMLRPCServer.* ${libdir}/python3.5/__pycache__/SimpleXMLRPCServer.* ${libdir}/python3.5/DocXMLRPCServer.* ${libdir}/python3.5/__pycache__/DocXMLRPCServer.* ${libdir}/python3.5/xmlrpc ${libdir}/python3.5/xmlrpc/__pycache__ "
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index dce465a..586b329 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -28,6 +28,7 @@ class MakefileMaker:
     def __init__( self, outfile, isNative ):
         """initialize"""
         self.packages = {}
+        self.excluded_pkgs = []
         self.targetPrefix = "${libdir}/python%s/" % VERSION[:3]
         self.isNative = isNative
         self.output = outfile
@@ -52,7 +53,7 @@ class MakefileMaker:
         self.out( """ """ )
         self.out( "" )
 
-    def addPackage( self, name, description, dependencies, filenames ):
+    def addPackage( self, name, description, dependencies, filenames, mod_exclude = False ):
         """add a package to the Makefile"""
         if type( filenames ) == type( "" ):
             filenames = filenames.split()
@@ -62,6 +63,8 @@ class MakefileMaker:
                 fullFilenames.append( "%s%s" % ( self.targetPrefix, filename ) )
             else:
                 fullFilenames.append( filename )
+        if mod_exclude:
+            self.excluded_pkgs.append( name )
         self.packages[name] = description, dependencies, fullFilenames
 
     def doBody( self ):
@@ -147,7 +150,7 @@ class MakefileMaker:
         line = 'RDEPENDS_${PN}-modules="'
 
         for name, data in sorted(self.packages.items()):
-            if name not in ['${PN}-dev', '${PN}-distutils-staticdev']:
+            if name not in ['${PN}-dev', '${PN}-distutils-staticdev'] and name not in self.excluded_pkgs:
                 line += "%s " % name
 
         self.out( "%s \"" % line )
@@ -382,7 +385,7 @@ if __name__ == "__main__":
     "pty.* tty.*" )
 
     m.addPackage( "${PN}-tests", "Python tests", "${PN}-core ${PN}-modules",
-    "test" ) # package
+    "test", True ) # package
 
     m.addPackage( "${PN}-threading", "Python threading & synchronization support", "${PN}-core ${PN}-lang",
     "_threading_local.* dummy_thread.* dummy_threading.* mutex.* threading.* Queue.*" )
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 2975e10..6352f8f 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -31,6 +31,7 @@ class MakefileMaker:
     def __init__( self, outfile, isNative ):
         """initialize"""
         self.packages = {}
+        self.excluded_pkgs = []
         self.targetPrefix = "${libdir}/python%s/" % VERSION[:3]
         self.isNative = isNative
         self.output = outfile
@@ -55,7 +56,7 @@ class MakefileMaker:
         self.out( """ """ )
         self.out( "" )
 
-    def addPackage( self, name, description, dependencies, filenames ):
+    def addPackage( self, name, description, dependencies, filenames, mod_exclude = False ):
         """add a package to the Makefile"""
         if type( filenames ) == type( "" ):
             filenames = filenames.split()
@@ -67,6 +68,8 @@ class MakefileMaker:
                                                  self.pycachePath( filename ) ) )
             else:
                 fullFilenames.append( filename )
+        if mod_exclude:
+            self.excluded_pkgs.append( name )
         self.packages[name] = description, dependencies, fullFilenames
 
     def pycachePath( self, filename ):
@@ -160,7 +163,7 @@ class MakefileMaker:
         line = 'RDEPENDS_${PN}-modules="'
 
         for name, data in sorted(self.packages.items()):
-            if name not in ['${PN}-dev', '${PN}-distutils-staticdev']:
+            if name not in ['${PN}-dev', '${PN}-distutils-staticdev'] and name not in self.excluded_pkgs:
                 line += "%s " % name
 
         self.out( "%s \"" % line )
@@ -401,7 +404,7 @@ if __name__ == "__main__":
     "pty.* tty.*" )
 
     m.addPackage( "${PN}-tests", "Python tests", "${PN}-core ${PN}-compression",
-    "test" ) # package
+    "test", True ) # package
 
     m.addPackage( "${PN}-threading", "Python threading & synchronization support", "${PN}-core ${PN}-lang",
     "_threading_local.* dummy_thread.* dummy_threading.* mutex.* threading.* queue.*" )
-- 
2.7.4


