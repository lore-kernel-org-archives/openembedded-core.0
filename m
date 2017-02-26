Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D354B71ADD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 07:44:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m70so8811066wma.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 23:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PzqDeCcGz0rdUkC7ApRGs+GGlSjqJBl87QqbT3+oCIc=;
	b=Bk2siaQ3SE/5YipBIX+Vgv7p5gm3QKPECNbb6v1D08I10yZ3a+ewyMXecCe355zVZA
	e+JdslvEP/hVX7+m44Iktan5STKOCRELT9WhoczPFCEl4tj5dbACaQL0tkaNKp4IwsFH
	dGApvNXzSFmsDrsfF/As+RGdDC5geQwug8hGC4tvuz+Kfe/lIMG0LLfgd1C/98JgU7mr
	ZVZtNkNhJcll3y47kfBP4owRFhuY/qCOtwE7aszq36dAYzrMD42sNZSHPj9XIm668dfF
	5UNLkSVe1nq5Cz2eFe63TP54lLK/PJdOtWrw8jH6kufwMixLMXEnMXHJ37OA2NBm1DA8
	KsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PzqDeCcGz0rdUkC7ApRGs+GGlSjqJBl87QqbT3+oCIc=;
	b=W0pPUeD04bwNU9aUSOl7g4dagUvlmAQNG4Y0RZByFKgjiSP8AAl/p44FGnIJlIRTay
	mi+ghlmLrEI/d9BU/XoWo0ILUM3Ru/VxvZJ/w8IXdWn1IHtDuXoS5QBeVYGux5IoAD7y
	0UCrUEZdefHvMcGwl11KyeDbudLNhyOk17poYCw2/nvovSx8JIAzCFW9BUribMio1o28
	NtAL1JMH5u05mM+lWh62RXOd5DAQ+myL0GUQhZ3tkJqW279RKO04rE4GqHRh8HA5W0TV
	qBi4WtZMFIl182OaTZgBfplhOq+H/9PUcF6nqmvp0WXWfN6TjgNUuSq/Fzs+cv6Aj/DQ
	Kclg==
X-Gm-Message-State: AMke39m6UlLloxPxdEOPGApfFA6swFOb9Xo2mvd+WgItTLcbnc/ETASUrTYc7+vsZz0iYg==
X-Received: by 10.28.65.132 with SMTP id o126mr8574154wma.14.1488095097819;
	Sat, 25 Feb 2017 23:44:57 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.27]) by smtp.gmail.com with ESMTPSA id
	45sm17236696wrx.60.2017.02.25.23.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 Feb 2017 23:44:57 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2017 08:44:45 +0100
Message-Id: <1488095085-14639-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] generate-manifest-3.5.py: add logic to generate native manifest
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
X-List-Received-Date: Sun, 26 Feb 2017 07:44:58 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

python3-native supposes to RPROVIDE all native packages as added in
generate-manifest-3.5.py, but it does not so far, this leads a problem
that sometimes bitbake cant find a runtime provider for a python3-*-native
when a new runtime dependency on it being required, this usualy happens
after a new native python3-* recipe is created or the old native python3-*
recipes are upgraded.

To avoid manually extending RPROVIDE every time when a new runtime
dependency is introduced, an argument '-n/--native' is added to the
manifest generator, allowing it create a native python3 manifest, with a
RPROVIDE line only, the RPROVIDE should contain all the sub-packages.

The generated python-native-3.5-manifest.inc is also added which is
included by python3-native recipe.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../python/python-native-3.5-manifest.inc          | 11 +++++++
 .../python/python3-native_3.5.2.bb                 | 27 +---------------
 scripts/contrib/python/generate-manifest-3.5.py    | 37 ++++++++++++++++++----
 3 files changed, 42 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-native-3.5-manifest.inc

diff --git a/meta/recipes-devtools/python/python-native-3.5-manifest.inc b/meta/recipes-devtools/python/python-native-3.5-manifest.inc
new file mode 100644
index 0000000..aa4c4f5
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native-3.5-manifest.inc
@@ -0,0 +1,11 @@
+
+# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
+# Generator: '../../../scripts/contrib/python/generate-manifest-3.5.py --native' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
+
+ 
+
+RPROVIDES+="python3-2to3-native python3-argparse-native python3-asyncio-native python3-audio-native python3-codecs-native python3-compile-native python3-compression-native python3-core-native python3-crypt-native python3-ctypes-native python3-curses-native python3-datetime-native python3-db-native python3-debugger-native python3-dev-native python3-difflib-native python3-distutils-native python3-distutils-staticdev-native python3-doctest-native python3-email-native python3-enum-native python3-fcntl-native python3-gdbm-native python3-html-native python3-idle-native python3-image-native python3-importlib-native python3-io-native python3-json-native python3-lang-native python3-logging-native python3-mailbox-native python3-math-native python3-mime-native python3-mmap-native python3-multiprocessing-native python3-netclient-native python3-netserver-native python3-numbers-native python3-pickle-native python3-pkgutil-native python3-pprint-native python3-profile-native python3-pydoc-native python3-re-native python3-readline-native python3-reprlib-native python3-resource-native python3-selectors-native python3-shell-native python3-signal-native python3-smtpd-native python3-sqlite3-native python3-sqlite3-tests-native python3-stringold-native python3-subprocess-native python3-syslog-native python3-terminal-native python3-tests-native python3-textutils-native python3-threading-native python3-tkinter-native python3-typing-native python3-unittest-native python3-unixadmin-native python3-xml-native python3-xmlrpc-native "
+
+
+
diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
index bf4e686..edcf224 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -41,32 +41,7 @@ DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native s
 
 inherit native
 
-RPROVIDES += " \
-    python3-compression-native \
-    python3-core-native \
-    python3-distutils-native \
-    python3-datetime-native \
-    python3-enum-native \
-    python3-terminal-native \
-    python3-email-native \
-    python3-importlib-native \
-    python3-io-native \
-    python3-json-native \
-    python3-lang-native \
-    python3-misc-native \
-    python3-modules-native \
-    python3-netclient-native \
-    python3-netserver-native \
-    python3-numbers-native \
-    python3-pkgutil-native \
-    python3-pprint-native \
-    python3-re-native \
-    python3-shell-native \
-    python3-subprocess-native \
-    python3-textutils-native \
-    python3-threading-native \
-    python3-unittest-native \
-"
+require python-native-${PYTHON_MAJMIN}-manifest.inc
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
 
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 5e2eeb7..a7fc8ba 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -13,9 +13,13 @@
 # 2014 Khem Raj <raj.khem@gmail.com>
 # Added python3 support
 #
+# February 26, 2017 -- Ming Liu <peter.x.liu@external.atlascopco.com>
+# * Updated to support generating manifest for native python3
+
 import os
 import sys
 import time
+import argparse
 
 VERSION = "3.5.0"
 
@@ -24,16 +28,17 @@ __version__ = "20140131"
 
 class MakefileMaker:
 
-    def __init__( self, outfile ):
+    def __init__( self, outfile, isNative ):
         """initialize"""
         self.packages = {}
         self.targetPrefix = "${libdir}/python%s/" % VERSION[:3]
+        self.isNative = isNative
         self.output = outfile
         self.out( """
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '%s' Version %s (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: '%s%s' Version %s (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 # Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
-""" % ( sys.argv[0], __version__ ) )
+""" % ( sys.argv[0], ' --native' if isNative else '', __version__ ) )
 
     #
     # helper functions
@@ -79,6 +84,20 @@ class MakefileMaker:
         global VERSION
 
         #
+        # generate rprovides line for native
+        #
+
+        if self.isNative:
+            rprovideLine = 'RPROVIDES+="'
+            for name in sorted(self.packages):
+                rprovideLine += "%s-native " % name.replace( '${PN}', 'python3' )
+            rprovideLine += '"'
+
+            self.out( rprovideLine )
+            self.out( "" )
+            return
+
+        #
         # generate provides line
         #
 
@@ -160,17 +179,21 @@ class MakefileMaker:
         self.doEpilog()
 
 if __name__ == "__main__":
+    parser = argparse.ArgumentParser( description='generate python3 manifest' )
+    parser.add_argument( '-n', '--native', help='generate manifest for native python3', action='store_true' )
+    parser.add_argument( 'outfile', metavar='OUTPUT_FILE', nargs='?', default='', help='Output file (defaults to stdout)' )
+    args = parser.parse_args()
 
-    if len( sys.argv ) > 1:
+    if args.outfile:
         try:
-            os.unlink(sys.argv[1])
+            os.unlink( args.outfile )
         except Exception:
             sys.exc_clear()
-        outfile = open( sys.argv[1], "w" )
+        outfile = open( args.outfile, "w" )
     else:
         outfile = sys.stdout
 
-    m = MakefileMaker( outfile )
+    m = MakefileMaker( outfile, args.native )
 
     # Add packages here. Only specify dlopen-style library dependencies here, no ldd-style dependencies!
     # Parameters: revision, name, description, dependencies, filenames
-- 
1.9.1


