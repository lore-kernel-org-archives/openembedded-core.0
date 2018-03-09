Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2B2EF789C9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652081"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:42 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:14 +0200
Message-Id: <20180309185614.31113-36-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 36/36] mklibs-native: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:42 -0000

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...failure-on-symbol-provided-by-application.patch | 25 +++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
index 7d6d62e773b..17d9af4de42 100644
--- a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
+++ b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
@@ -1,7 +1,7 @@
-From f172101130604e4a9efa5746f4d8d30de99a0fdc Mon Sep 17 00:00:00 2001
+From dcb45256970b15b672d0004533826c94083356e5 Mon Sep 17 00:00:00 2001
 From: Yuanjie Huang <yuanjie.huang@windriver.com>
 Date: Fri, 17 Apr 2015 14:48:20 +0800
-Subject: [PATCH] avoid failure on symbol provided by application
+Subject: [PATCH 4/6] avoid failure on symbol provided by application
 
 Upstream-Status: Pending
 
@@ -13,12 +13,13 @@ cannot be provided by libraries. It prevents false alarm on absence
 of symbols.
 
 Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+
 ---
  src/mklibs | 28 ++++++++++++++++++++++++----
  1 file changed, 24 insertions(+), 4 deletions(-)
 
 diff --git a/src/mklibs b/src/mklibs
-index c5614ea..b0d9034 100755
+index a3533c0..66b7a09 100755
 --- a/src/mklibs
 +++ b/src/mklibs
 @@ -133,9 +133,9 @@ class Symbol(object):
@@ -31,9 +32,9 @@ index c5614ea..b0d9034 100755
 -        self.weak, self.library = weak, library
 +        self.weak, self.library, self.object = weak, library, object
  
- # Return undefined symbols in an object as a set of tuples (name, weakness)
- def undefined_symbols(obj):
-@@ -144,6 +144,11 @@ def undefined_symbols(obj):
+ def symbol_is_blacklisted(name):
+     # The ARM Embedded ABI spec states symbols under this namespace as
+@@ -152,6 +152,11 @@ def undefined_symbols(obj):
  
      output = command("mklibs-readelf", "--print-symbols-undefined", obj)
  
@@ -45,7 +46,7 @@ index c5614ea..b0d9034 100755
      result = []
      for line in output:
          name, weak_string, version_string, library_string = line.split()[:4]
-@@ -160,7 +165,7 @@ def undefined_symbols(obj):
+@@ -171,7 +176,7 @@ def undefined_symbols(obj):
          if library_string.lower() != 'none':
              library = library_string
  
@@ -54,7 +55,7 @@ index c5614ea..b0d9034 100755
  
      return result
  
-@@ -495,12 +500,13 @@ while 1:
+@@ -498,12 +503,13 @@ while 1:
                       and re.search("^ps_", str(symbol)))
                  and not (re.search("ld-linux.so.3$", str(symbol)))
                  and not (re.search("^__gnu_local_gp", str(symbol)))):
@@ -68,8 +69,8 @@ index c5614ea..b0d9034 100755
 +    present_symbol_progs = {}
      checked_libs = small_libs
      checked_libs.extend(available_libs)
-     checked_libs.append(ldlib)
-@@ -510,6 +516,12 @@ while 1:
+     checked_libs.append(sysroot + ldlib)
+@@ -513,6 +519,12 @@ while 1:
              names = symbol.base_names()
              for name in names:
                  present_symbols[name] = symbol
@@ -82,7 +83,7 @@ index c5614ea..b0d9034 100755
  
      # are we finished?
      num_unresolved = 0
-@@ -565,6 +577,14 @@ while 1:
+@@ -568,6 +580,14 @@ while 1:
      for name in needed_symbols:
          if not name in symbol_provider:
              if not needed_symbols[name].weak:
@@ -98,5 +99,5 @@ index c5614ea..b0d9034 100755
          else:
              lib = symbol_provider[name]
 -- 
-1.8.5.2.233.g932f7e4
+2.16.1
 
-- 
2.16.1


