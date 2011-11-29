Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVWYh-0000Yp-Jr
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 23:53:51 +0100
Received: by ywb20 with SMTP id 20so6925460ywb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 14:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=i7MvBjT8zzPRAAUC79gWVPZ6lKcNSV9oUeZ1c7Rt8cU=;
	b=TtpvFuTMH2s0IlluENX0rFLJ0f69BiOUeoABKX2U4a1m2PYSpNaCixBLkrmOz//3EG
	gEV09dF9NHleoNXTYgJp0fhiJ+AkBK7Zr23KbElKz98wiW8SWLu8u8ud5SQoyTNVg+5X
	gz+zU0PHvSW5dP8BB7hkNk9Uc03zrG0NDXWFM=
Received: by 10.50.192.197 with SMTP id hi5mr23571886igc.16.1322606829553;
	Tue, 29 Nov 2011 14:47:09 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id dd36sm64607148ibb.7.2011.11.29.14.47.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 14:47:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 14:46:58 -0800
Message-Id: <1322606818-2817-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] classes: Apply libc-${LIBC} overrides to target recipes only
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 22:53:51 -0000

Currently these overrides are enabled for native and nativesdk
recipes as well when inheriting native and nativesdk classes. This patch
filters these from OVERRIDES variables for native and nativesdk
recipes.

oe_filter_out and oe_filter functions currently only operated on
space separated strings. Since OVERRIDES are separated using ':'
these functions are enhanced to take and additional parameter
called 'sep' which defaults to None if not specified which means we keep
the existing behaviour.

Drop the last parameter 'd' from filter functions since it was not being
used.

adjust uclibc and gcc-runtime recipes to follow new signatures of
oe_fiter functions.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/native.bbclass                        |    5 +++--
 meta/classes/nativesdk.bbclass                     |    5 +++--
 meta/classes/utils.bbclass                         |    8 ++++----
 meta/lib/oe/utils.py                               |   14 ++++++++++----
 meta/recipes-core/uclibc/uclibc.inc                |    6 +++---
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    2 +-
 6 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 8f7cc1f..270b4f3 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -138,8 +138,9 @@ python native_virtclass_handler () {
         if not prov.endswith("-native"):
             provides = provides.replace(prov, prov + "-native")
     e.data.setVar("PROVIDES", provides)
-
-    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")
+    overrides = e.data.getVar("OVERRIDES", False);
+    overrides = oe_filter_out('libc-uclibc|libc-glibc', overrides, ':')
+    e.data.setVar("OVERRIDES",overrides + ":virtclass-native")
 }
 
 addhandler native_virtclass_handler
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index e6204c0..0f897a9 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -65,8 +65,9 @@ python nativesdk_virtclass_handler () {
     pn = e.data.getVar("PN", True)
     if not pn.endswith("-nativesdk"):
         return
-
-    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk")
+    overrides = e.data.getVar("OVERRIDES", False)
+    oe_filter_out('libc-uclibc|libc-glibc', overrides, ':')
+    e.data.setVar("OVERRIDES",overrides + ":virtclass-nativesdk")
 }
 
 python () {
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 103fa9a..6311017 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -32,11 +32,11 @@ def base_both_contain(variable1, variable2, checkvalue, d):
 def base_prune_suffix(var, suffixes, d):
     return oe.utils.prune_suffix(var, suffixes, d)
 
-def oe_filter(f, str, d):
-    return oe.utils.str_filter(f, str, d)
+def oe_filter(f, str, sep = None):
+    return oe.utils.str_filter(f, str, sep)
 
-def oe_filter_out(f, str, d):
-    return oe.utils.str_filter_out(f, str, d)
+def oe_filter_out(f, str, sep = None):
+    return oe.utils.str_filter_out(f, str, sep)
 
 def machine_paths(d):
     """List any existing machine specific filespath directories"""
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 95daace..3e321fc 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -66,13 +66,19 @@ def prune_suffix(var, suffixes, d):
 
     return var
 
-def str_filter(f, str, d):
+def str_filter(f, str, sep = None):
     from re import match
-    return " ".join(filter(lambda x: match(f, x, 0), str.split()))
+    if sep is None or sep is '':
+	return " ".join(filter(lambda x: match(f, x, 0), str.split()))
+    else:
+	return sep.join(filter(lambda x: match(f, x, 0), str.split(sep)))
 
-def str_filter_out(f, str, d):
+def str_filter_out(f, str, sep = None):
     from re import match
-    return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
+    if sep is None or sep is '':
+	return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
+    else:
+	return sep.join(filter(lambda x: not match(f, x, 0), str.split(sep)))
 
 def param_bool(cfg, field, dflt = None):
     """Lookup <field> in <cfg> map and convert it to a boolean; take
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 92157bd..5845519 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -112,9 +112,9 @@ export V="2"
 # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
 #
-CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
-UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
-UCLIBC_EXTRA_LDFLAGS := "${@oe_filter_out('(-L\S+|-l\S+)', '${LDFLAGS}', d)}"
+CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}')}"
+UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}')}"
+UCLIBC_EXTRA_LDFLAGS := "${@oe_filter_out('(-L\S+|-l\S+)', '${LDFLAGS}')}"
 do_compile_prepend () {
   unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 }
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 34bfaeb..5b19ec9 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -1,6 +1,6 @@
 require gcc-configure-common.inc
 
-CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
+CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}')}"
 
 EXTRA_OECONF_PATHS = " \
     --with-local-prefix=${STAGING_DIR_TARGET}${prefix} \
-- 
1.7.5.4



