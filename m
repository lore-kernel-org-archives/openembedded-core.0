Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id DBFB571ADD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 07:39:35 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id 203so4032284ywz.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 23:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uZS0wfSsgfScdMEW3lJgaZG2i+OFDw0NfqjJZOcTlFY=;
	b=SJTGMhpz0Sy/0zefEszqYEkRJIJJh+1+4MyuUE8ZBtxD0h5w9ZIY9nFG+p4wJXTvbN
	n/DuxykWKMuCIblgMLa4UZfx9CcXXBRytcLgqvyGplzg/59MEZvMaBsRrFCGN+EAHmfh
	96slrHSmEHFF7TLatepcu9lEZkAlKtqyoU+ap6aWKQ2Dao1UAUoxx2wYDZK5b3MzUeeL
	6hkHUU0frNfjXMaPSEzmIjP8g+eyQKbheJdYt5jUw2rqVHdaPNKZpb3BCyX73kjFWgFj
	68owplmViQb80fq+Qb63tOnTubG5QwLpbMxy/EvXUhS27xuzQT7Ok3aov/CuLddCRQ0i
	8Eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uZS0wfSsgfScdMEW3lJgaZG2i+OFDw0NfqjJZOcTlFY=;
	b=bMPr9X/oIeYSRvRo/obO/bHSZbQsW6qE0KEZI9sRbqOa7YdWwSVNMItRBNSqAvwyII
	pU0A6zowXg2EFeQk6+bHczYcS4LwXDCQljvUDXLSCEx8m2M2Fkd5P2vG4TbA92vS8Ewl
	YzG1RmY5c/9yfbFKPMCX1BEqh10hGcmiy8vmLZasQtDmZ0wZFp5JMMB4EkbJKrz/ooMf
	d7mTlzzYOnVZQC8ad4p2vQtmMScMTsRzwh5wYP7aEzHFB5riRvlaZEpPEqzCF8sDF6EH
	BegF074qZU0uZMGY4rqWOMfr3/ofowFu9nfovO/pwWAOBbEodTFyTRnNgogErslpiMCJ
	fwlQ==
X-Gm-Message-State: AMke39kPqa1t28Wi3pdT1OhmxCmCHHWmN5Gxr96/u2A0l84EduhucfunqxDm0K9vP1QK3A==
X-Received: by 10.13.245.2 with SMTP id e2mr7690153ywf.159.1488094776649;
	Sat, 25 Feb 2017 23:39:36 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.27]) by smtp.gmail.com with ESMTPSA id
	b74sm5246806ywe.56.2017.02.25.23.39.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 Feb 2017 23:39:35 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2017 08:39:19 +0100
Message-Id: <1488094759-13014-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] generate-manifest-2.7.py: add logic to generate native manifest
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
X-List-Received-Date: Sun, 26 Feb 2017 07:39:37 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

python-native supposes to RPROVIDE all native packages as added in
generate-manifest-2.7.py, but it does not so far, this leads a problem
that sometimes bitbake cant find a runtime provider for a python-*-native
when a new runtime dependency on it being required, this usualy happens
after a new native python-* recipe is created or the old native python-*
recipes are upgraded.

To give a example, the following commit is trying to address such a issue:
commit 4583cd1bb15306e8f0ab7bcd80732e6f35aa4533:
[ python-native: Make python-native also RPROVIDE python-unittest-native ]

To avoid manually extending RPROVIDE every time when a new runtime
dependency is introduced, an argument '-n/--native' is added to the
manifest generator, allowing it create a native python manifest, with a
RPROVIDE line only, the RPROVIDE should contain all the sub-packages.

The generated python-native-2.7-manifest.inc is also added which is
included by python-native recipe.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../python/python-native-2.7-manifest.inc          | 11 +++++++
 .../python/python-native_2.7.12.bb                 |  9 +-----
 scripts/contrib/python/generate-manifest-2.7.py    | 37 ++++++++++++++++++----
 3 files changed, 42 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-native-2.7-manifest.inc

diff --git a/meta/recipes-devtools/python/python-native-2.7-manifest.inc b/meta/recipes-devtools/python/python-native-2.7-manifest.inc
new file mode 100644
index 0000000..f45147b
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native-2.7-manifest.inc
@@ -0,0 +1,11 @@
+
+# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
+# Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py --native' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
+
+ 
+
+RPROVIDES+="python-2to3-native python-argparse-native python-audio-native python-bsddb-native python-codecs-native python-compile-native python-compiler-native python-compression-native python-contextlib-native python-core-native python-crypt-native python-ctypes-native python-curses-native python-datetime-native python-db-native python-debugger-native python-dev-native python-difflib-native python-distutils-native python-distutils-staticdev-native python-doctest-native python-email-native python-fcntl-native python-gdbm-native python-hotshot-native python-html-native python-idle-native python-image-native python-importlib-native python-io-native python-json-native python-lang-native python-logging-native python-mailbox-native python-math-native python-mime-native python-mmap-native python-multiprocessing-native python-netclient-native python-netserver-native python-numbers-native python-pickle-native python-pkgutil-native python-plistlib-native python-pprint-native python-profile-native python-pydoc-native python-re-native python-readline-native python-resource-native python-robotparser-native python-shell-native python-smtpd-native python-sqlite3-native python-sqlite3-tests-native python-stringold-native python-subprocess-native python-syslog-native python-terminal-native python-tests-native python-textutils-native python-threading-native python-tkinter-native python-unittest-native python-unixadmin-native python-xml-native python-xmlrpc-native python-zlib-native "
+
+
+
diff --git a/meta/recipes-devtools/python/python-native_2.7.12.bb b/meta/recipes-devtools/python/python-native_2.7.12.bb
index 9a6430d..7edf153 100644
--- a/meta/recipes-devtools/python/python-native_2.7.12.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.12.bb
@@ -25,14 +25,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:"
 
 inherit native
 
-RPROVIDES += "python-distutils-native \
-    python-compression-native \
-    python-textutils-native \
-    python-codecs-native \
-    python-core-native \
-    python-unittest-native \
-    python-io-native \
-"
+require python-native-${PYTHON_MAJMIN}-manifest.inc
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --with-system-expat=${STAGING_DIR_HOST}"
 
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index f2ecf8d..6f7a4c3 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -9,10 +9,14 @@
 #  * Updated to no longer generate special -dbg package, instead use the
 #    single system -dbg
 #  * Update version with ".1" to indicate this change
+#
+# February 26, 2017 -- Ming Liu <peter.x.liu@external.atlascopco.com>
+#  * Updated to support generating manifest for native python
 
 import os
 import sys
 import time
+import argparse
 
 VERSION = "2.7.2"
 
@@ -21,16 +25,17 @@ __version__ = "20110222.2"
 
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
@@ -66,6 +71,20 @@ class MakefileMaker:
         global VERSION
 
         #
+        # generate rprovides line for native
+        #
+
+        if self.isNative:
+            rprovideLine = 'RPROVIDES+="'
+            for name in sorted(self.packages):
+                rprovideLine += "%s-native " % name.replace( '${PN}', 'python' )
+            rprovideLine += '"'
+
+            self.out( rprovideLine )
+            self.out( "" )
+            return
+
+        #
         # generate provides line
         #
 
@@ -147,17 +166,21 @@ class MakefileMaker:
         self.doEpilog()
 
 if __name__ == "__main__":
+    parser = argparse.ArgumentParser( description='generate python manifest' )
+    parser.add_argument( '-n', '--native', help='generate manifest for native python', action='store_true' )
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


