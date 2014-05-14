Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 987F26A38B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 21:38:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 May 2014 14:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1054,1389772800"; d="scan'208";a="540535023"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.149])
	by orsmga002.jf.intel.com with ESMTP; 14 May 2014 14:38:36 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 14:36:42 -0700
Message-Id: <4607c274a894441baa289f2eaf8eb5f773d1cc35.1400103108.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <50a2c132892ea8660f03f8cde3265599f79f2dd8.1400103108.git.max.eliaser@intel.com>
References: <50a2c132892ea8660f03f8cde3265599f79f2dd8.1400103108.git.max.eliaser@intel.com>
In-Reply-To: <cover.1400103108.git.max.eliaser@intel.com>
References: <cover.1400103108.git.max.eliaser@intel.com>
Subject: [PATCH 2/3] Add texinfo-dummy-native recipe w/ scripts to stand in for Texinfo utils.
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
X-List-Received-Date: Wed, 14 May 2014 21:38:38 -0000

More work toward eliminating the dependency on the host system's Texinfo--
Python scripts that understand the same command-line options as the Texinfo
utilities, and create blank output files if appropriate, but don't actually
do any of the work done by those utilities.

This will be necessary to avoid circular dependencies when we start explicitly
tracking dependencies on texinfo-native; i.e. texinfo-native ->
autoconf-native -> texinfo-native. If we have all native recipes that inherit
texinfo.bbclass depend on texinfo-dummy-native instead of texinfo-native, the
cycle is broken.

It may also provide a performance gain by skipping the actual work of
formatting and generating documentation files.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 .../texinfo-dummy-native/texinfo-dummy-native.bb   |  30 +++++
 .../texinfo-dummy-native/texinfo-dummy/COPYING     |  19 ++++
 .../texinfo-dummy-native/texinfo-dummy/template.py | 122 +++++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
 create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/COPYING
 create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py

diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
new file mode 100644
index 0000000..b5420a3
--- /dev/null
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Fake version of the texinfo utility suite"
+SECTION = "console/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d6bb62e73ca8b901d3f2e9d71542f4bb"
+DEPENDS = ""
+PV = "1.0"
+
+SRC_URI = "file://template.py file://COPYING"
+
+S = "${WORKDIR}"
+
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
+inherit native
+
+do_install_name() {
+    FILENAME="${D}${bindir}/$1"
+    # Using ln causes problems with rm_work
+    cp -T "${S}/template.py" "$FILENAME"
+    chmod +x $FILENAME
+}
+
+do_install() {
+    mkdir -p "${D}${bindir}"
+    for i in makeinfo pod2texi texi2dvi pdftexi2dvi texindex texi2pdf \
+             txixml2texi texi2any install-info ginstall-info \
+             update-info-dir; do
+        do_install_name $i
+    done
+}
diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/COPYING b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/COPYING
new file mode 100644
index 0000000..531cbe7
--- /dev/null
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/COPYING
@@ -0,0 +1,19 @@
+Copyright (c) 2014 Intel Corp.
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+THE SOFTWARE.
diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
new file mode 100644
index 0000000..4dc31a9
--- /dev/null
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
@@ -0,0 +1,122 @@
+#! /usr/bin/env python2.7
+
+# template.py (and other filenames)
+# By Max Eliaser (max.eliaser@intel.com)
+
+# Copyright (c) 2014 Intel Corp.
+
+# Permission is hereby granted, free of charge, to any person obtaining a copy
+# of this software and associated documentation files (the "Software"), to deal
+# in the Software without restriction, including without limitation the rights
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# copies of the Software, and to permit persons to whom the Software is
+# furnished to do so, subject to the following conditions:
+
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+# THE SOFTWARE.
+
+# This program acts like a dummy version of the texinfo utilities, creating
+# the right output files but leaving them blank. It will parse out the name
+# of the executable from argv[0] and emulate the corresponding program, so
+# multiple copies of this script will exist under different names.
+
+import sys, os
+
+olong = "--output="
+Elong = "--macro-expand="
+
+
+this_binary = sys.argv[0].split ("/")[-1]
+
+# To be outputted if functionality that hasn't been stubbed yet is invoked.
+stub_msg = """
+This stand-in version of %s is not yet fully capable of emulating the real
+version from the GNU texinfo suite. If you see this message, file a bug report
+with details on the recipe that failed.
+""" % this_binary
+
+# Autotools setups query the version, so this is actually necessary. Some of
+# them (lookin' at you, eglibc) actually look for the substring "GNU texinfo,"
+# so we put that substring in there without actually telling a lie.
+version_str = """ %s (fake texinfo, emulating GNU texinfo) 5.2
+ 
+Super amazing version which is totally not fake in any way whatsoever.
+Copyright (C) 2014 Intel Corp. Distributed under the terms of the MIT
+license.
+""" % this_binary
+
+simple_binaries = "pod2texi texi2dvi pdftexi2dvi texindex texi2pdf \
+                   txixml2texi install-info ginstall-info \
+                   update-info-dir".split ()
+
+# These utilities use a slightly different set of options and flags.
+complex_binaries = "makeinfo texi2any".split ()
+
+valid_binaries = simple_binaries + complex_binaries
+
+# For generating blank output files.
+def touch_file (path):
+    f = open (path, "w")
+    f.close ()
+
+assert this_binary in valid_binaries, \
+       this_binary + " is not one of " + ', '.join (valid_binaries)
+
+if "--version" in sys.argv:
+    print version_str
+    sys.exit (0)
+
+# For debugging
+log_interceptions = False
+if log_interceptions:
+    f = open ("/tmp/intercepted_" + this_binary, "a")
+    f.write (' '.join ([this_binary] + sys.argv[1:]) + '\n')
+    f.close ()
+
+# Look through the options and flags, and if necessary, touch any output
+# files.
+arg_idx = 1
+while arg_idx < len (sys.argv):
+    arg = sys.argv [arg_idx]
+    
+    if arg == "--":
+        break
+    
+    # Something like -I . can result in a need for this (specifically the .)
+    elif len (arg) < 2:
+        pass
+    
+    # Check if -o or --output is specified. These can be used at most once.
+    elif arg[0] == '-' and arg[1] != '-' and arg[len (arg) - 1] == 'o':
+        touch_file (sys.argv[arg_idx + 1])
+        sys.exit (0)
+    elif arg.startswith (olong):
+        touch_file (arg.split ("=")[1])
+        sys.exit (0)
+    
+    # Check for functionality that isn't implemented yet.
+    else:
+        assert arg[1] == '-' or 'E' not in arg or \
+               this_binary in simple_binaries, \
+               "-E option not yet supported" + stub_msg
+        
+        assert not arg.startswith (Elong), \
+               Elong[:-1] + " option not yet supported" + stub_msg
+    
+    arg_idx += 1
+
+# The -o/--output option overrides the default. For makeinfo and texi2any,
+# that default is to look for a @setfilename command in the input file.
+# Otherwise, printing nothing to stdout and then exiting should suffice.
+assert this_binary in simple_binaries, \
+       "Don't know how to get default output file name from input file!" + \
+       stub_msg
+
-- 
1.8.3.2


