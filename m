Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87B02607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 02:52:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T2qHSM000142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 19:52:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 28 Jun 2015 19:52:16 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 10:52:03 +0800
Message-ID: <1435546323-11539-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mklibs-native: avoid failure on symbol provided by application
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
X-List-Received-Date: Mon, 29 Jun 2015 02:52:16 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

Undefined symbols in a library can be provided by the application
that links to the library, such as `logsink' in libmultipath.so.0.
This fix checks the type of object in which the symbol is needed
and the existence of the symbol in application, when a symbol
cannot be provided by libraries. It prevents false alarm on absence
of symbols.

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 ...failure-on-symbol-provided-by-application.patch | 100 +++++++++++++++++++++
 .../mklibs/mklibs-native_0.1.40.bb                 |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch

diff --git a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
new file mode 100644
index 0000000..798212a
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
@@ -0,0 +1,100 @@
+From f172101130604e4a9efa5746f4d8d30de99a0fdc Mon Sep 17 00:00:00 2001
+From: Yuanjie Huang <yuanjie.huang@windriver.com>
+Date: Fri, 17 Apr 2015 14:48:20 +0800
+Subject: [PATCH] avoid failure on symbol provided by application
+
+Undefined symbols in a library can be provided by the application
+that links to the library, such as `logsink' in libmultipath.so.0.
+This fix checks the type of object in which the symbol is needed
+and the existence of the symbol in application, when a symbol
+cannot be provided by libraries. It prevents false alarm on absence
+of symbols.
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ src/mklibs | 28 ++++++++++++++++++++++++----
+ 1 file changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/src/mklibs b/src/mklibs
+index c5614ea..b0d9034 100755
+--- a/src/mklibs
++++ b/src/mklibs
+@@ -133,9 +133,9 @@ class Symbol(object):
+         return '@'.join(ret)
+ 
+ class UndefinedSymbol(Symbol):
+-    def __init__(self, name, weak, version, library):
++    def __init__(self, name, weak, version, library, object):
+         super(UndefinedSymbol, self).__init__(name, version, library)
+-        self.weak, self.library = weak, library
++        self.weak, self.library, self.object = weak, library, object
+ 
+ # Return undefined symbols in an object as a set of tuples (name, weakness)
+ def undefined_symbols(obj):
+@@ -144,6 +144,11 @@ def undefined_symbols(obj):
+ 
+     output = command("mklibs-readelf", "--print-symbols-undefined", obj)
+ 
++    if len(obj) > len(dest_path) and obj[:len(dest_path)] == dest_path:
++        object = obj[len(dest_path) + 1:-len('-so-stripped')]
++    else:
++        object = obj
++
+     result = []
+     for line in output:
+         name, weak_string, version_string, library_string = line.split()[:4]
+@@ -160,7 +165,7 @@ def undefined_symbols(obj):
+         if library_string.lower() != 'none':
+             library = library_string
+ 
+-        result.append(UndefinedSymbol(name, weak, version, library))
++        result.append(UndefinedSymbol(name, weak, version, library, object))
+ 
+     return result
+ 
+@@ -495,12 +500,13 @@ while 1:
+                      and re.search("^ps_", str(symbol)))
+                 and not (re.search("ld-linux.so.3$", str(symbol)))
+                 and not (re.search("^__gnu_local_gp", str(symbol)))):
+-                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s" % (symbol, symbol.weak))
++                debug(DEBUG_SPAM, "needed_symbols adding %s, weak: %s, for %s" % (symbol, symbol.weak, obj))
+                 needed_symbols[str(symbol)] = symbol
+         libraries.update(library_depends(obj))
+ 
+     # calculate what symbols are present in small_libs and available_libs
+     present_symbols = {}
++    present_symbol_progs = {}
+     checked_libs = small_libs
+     checked_libs.extend(available_libs)
+     checked_libs.append(ldlib)
+@@ -510,6 +516,12 @@ while 1:
+             names = symbol.base_names()
+             for name in names:
+                 present_symbols[name] = symbol
++            if not so_pattern.match(lib):
++                debug(DEBUG_SPAM, "present_symbol_progs adding %s, from executable %s" % (' '.join(names), lib))
++                for name in names:
++                    progs = present_symbol_progs.get(name, set())
++                    progs.add(lib)
++                    present_symbol_progs[name] = progs
+ 
+     # are we finished?
+     num_unresolved = 0
+@@ -565,6 +577,14 @@ while 1:
+     for name in needed_symbols:
+         if not name in symbol_provider:
+             if not needed_symbols[name].weak:
++                # WORKAROUND: Undefined symbols in a library can be provided by the application
++                # that links to the library. So if the object which requires the symbol is a library
++                # and some application can provide the symbol, the undefined symbol is skipped.
++                symbol = needed_symbols[name]
++                if so_pattern.match(symbol.object) and present_symbol_progs.get(name, None):
++                    debug(DEBUG_SPAM, "symbol %s in library %s is provided by executable %s" \
++                          % (name, symbol.object, ' '.join(present_symbol_progs[name])))
++                    continue
+                 raise Exception("No library provides non-weak %s" % name)
+         else:
+             lib = symbol_provider[name]
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
index b2fcae5..0bb5f21 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.x
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 	file://sysrooted-ldso.patch \
+	file://avoid-failure-on-symbol-provided-by-application.patch \
 "
 
 SRC_URI[md5sum] = "e1dafe5f962caa9dc5f2651c0723812a"
-- 
1.9.1


