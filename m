Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE8E7CCF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 14:27:56 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d17so22135621wre.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 06:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=syl2qRaRCbW6kU5K5JEGwzr+01T/IhUS1h2YhhG2S/s=;
	b=aPGNnHbjoOcVgq6GmfELEzPJZiSI9KGd6IHWHJTNAYduQ0A02PgCjxv60O69Enxddq
	HEKTtFtna/8ylRA+dladdjWU+F9h4PgC/FouIBh+vPOMwlHm1BYOmw1R4lhZF8ls/smi
	Zni3NPXD1yzDjI+STlrOQiB/7/T96bT+PiqGT5yzKX6xhJ8fJdMKEcFlD1aHwLn2xz1i
	PVe81fOVHoelZyTExKIrD/8NjjS5uV9+GbWGd5WTb85uqNNdBTcHZC50aMYAID8Pad+P
	1g9zhy1meEoCtfi4n+CanO5f789Wid2mzd7lXRqMEdnBKRmC4BIvZx5pMU0xrovDJT5e
	UJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=syl2qRaRCbW6kU5K5JEGwzr+01T/IhUS1h2YhhG2S/s=;
	b=OPmwO5oKzde6IcDwlb8XEG4EOwmhI2fLrZQJoPR/oicNj6yme6miIIus3d86yaDebL
	j6eC2i+YlXngfAsAHufzQVKKhEXT8TULyTcZ0QmZMV7waGOT5IqllgwsqVT4khchIXi8
	UolWD9q/wiyoeUGv73/dlN2Hf0cEG6pRWpgj31Ol+k4oEblhizIHftjXR2NiEkx5DoC+
	LV/l+n3sqaJmIutkMl9VC2SSYSP3XuRG1m1scsJXmxCyd1+d6c0FHgN79SVgmnMn73VD
	AZlrEbmYikbY0NciWkge5XGn8S7b3cF4+HHMjcAHRa7sAanWYNLMvd6UQiK/o+x+q2tQ
	YpAQ==
X-Gm-Message-State: APjAAAWbBX1FQx9TcwpSu30lT/aKe3cT7j1bg4eC8t9BpxnrvXWuWCph
	+qYuGdar70h5Ra8ErllO6/xnkgRox7E=
X-Google-Smtp-Source: APXvYqyobQq0dR9lWEji2BKIU1wp0MWeuosVkihBSA6kjl3qiqTl8LRTFPWSCmo/PzUAkhWiHZtByw==
X-Received: by 2002:adf:81a1:: with SMTP id 30mr7166804wra.285.1551364075899; 
	Thu, 28 Feb 2019 06:27:55 -0800 (PST)
Received: from localhost ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id
	c126sm9378686wma.0.2019.02.28.06.27.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 06:27:54 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 14:27:45 +0000
Message-Id: <20190228142745.23630-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] swig: fix build with musl
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
X-List-Received-Date: Thu, 28 Feb 2019 14:27:56 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Building with musl currently fails. The fix has been committed
upstream, so backport it.
Note that it requires the recent change to use autoconf's do_configure
as it modifies a bison file which is used at make-dist time, so it
triggers an autoconf rerun which was not working previously due to the
custom do_configure step that was removed recently by:
a9b1f9eca963 ("swig: Fix configure failure")

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 ...de-for-constant-expressions-containi.patch | 178 ++++++++++++++++++
 meta/recipes-devtools/swig/swig_3.0.12.bb     |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch

diff --git a/meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch b/meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch
new file mode 100644
index 0000000000..4c2bc99ca0
--- /dev/null
+++ b/meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch
@@ -0,0 +1,178 @@
+From 90ba174fcea1618af57aa594199541d47a89b7f6 Mon Sep 17 00:00:00 2001
+From: William S Fulton <wsf@fultondesigns.co.uk>
+Date: Sun, 17 Sep 2017 19:02:55 +0100
+Subject: [PATCH 1/2] Fix generated code for constant expressions containing
+ wchar_t L literals.
+
+Such as:
+  # define __WCHAR_MAX    (0x7fffffff + L'\0')
+
+Reported on swig-user mailing list.
+---
+ Examples/test-suite/csharp/preproc_constants_c_runme.cs | 3 ++-
+ Examples/test-suite/csharp/preproc_constants_runme.cs   | 2 ++
+ Examples/test-suite/d/preproc_constants_c_runme.1.d     | 2 ++
+ Examples/test-suite/d/preproc_constants_c_runme.2.d     | 2 ++
+ Examples/test-suite/d/preproc_constants_runme.1.d       | 2 ++
+ Examples/test-suite/d/preproc_constants_runme.2.d       | 2 ++
+ Examples/test-suite/php/preproc_constants_c_runme.php   | 2 ++
+ Examples/test-suite/php/preproc_constants_runme.php     | 2 ++
+ Examples/test-suite/php5/preproc_constants_c_runme.php  | 2 ++
+ Examples/test-suite/php5/preproc_constants_runme.php    | 2 ++
+ Examples/test-suite/preproc_constants.i                 | 3 +++
+ Source/CParse/parser.y                                  | 2 +-
+ 13 files changed, 29 insertions(+), 2 deletions(-)
+
+Origin: https://github.com/swig/swig/commit/90ba174fcea1618af57aa594199541d47a89b7f6
+Applied-Upstream: yes
+
+diff --git a/Examples/test-suite/csharp/preproc_constants_c_runme.cs b/Examples/test-suite/csharp/preproc_constants_c_runme.cs
+index 76c684d..1c28e49 100644
+--- a/Examples/test-suite/csharp/preproc_constants_c_runme.cs
++++ b/Examples/test-suite/csharp/preproc_constants_c_runme.cs
+@@ -61,7 +61,8 @@ public class runme {
+     assert( typeof(int) == preproc_constants_c.EXPR_LAND.GetType() );
+     assert( typeof(int) == preproc_constants_c.EXPR_LOR.GetType() );
+     assert( typeof(double) == preproc_constants_c.EXPR_CONDITIONAL.GetType() );
+-
++    assert( typeof(int) == preproc_constants_c.EXPR_WCHAR_MAX.GetType() );
++    assert( typeof(int) == preproc_constants_c.EXPR_WCHAR_MIN.GetType() );
+   }
+   static void assert(bool assertion) {
+     if (!assertion)
+diff --git a/Examples/test-suite/csharp/preproc_constants_runme.cs b/Examples/test-suite/csharp/preproc_constants_runme.cs
+index 9fae591..6b02e30 100644
+--- a/Examples/test-suite/csharp/preproc_constants_runme.cs
++++ b/Examples/test-suite/csharp/preproc_constants_runme.cs
+@@ -60,6 +60,8 @@ public class runme {
+     assert( typeof(bool) == preproc_constants.EXPR_LAND.GetType() );
+     assert( typeof(bool) == preproc_constants.EXPR_LOR.GetType() );
+     assert( typeof(double) == preproc_constants.EXPR_CONDITIONAL.GetType() );
++    assert( typeof(int) == preproc_constants.EXPR_WCHAR_MAX.GetType() );
++    assert( typeof(int) == preproc_constants.EXPR_WCHAR_MIN.GetType() );
+ 
+   }
+   static void assert(bool assertion) {
+diff --git a/Examples/test-suite/d/preproc_constants_c_runme.1.d b/Examples/test-suite/d/preproc_constants_c_runme.1.d
+index d846c71..2b349af 100644
+--- a/Examples/test-suite/d/preproc_constants_c_runme.1.d
++++ b/Examples/test-suite/d/preproc_constants_c_runme.1.d
+@@ -61,4 +61,6 @@ void main() {
+   static assert(is(int == typeof(EXPR_LAND())));
+   static assert(is(int == typeof(EXPR_LOR())));
+   static assert(is(double == typeof(EXPR_CONDITIONAL())));
++  static assert(is(int == typeof(EXPR_WCHAR_MAX())));
++  static assert(is(int == typeof(EXPR_WCHAR_MIN())));
+ }
+diff --git a/Examples/test-suite/d/preproc_constants_c_runme.2.d b/Examples/test-suite/d/preproc_constants_c_runme.2.d
+index 9bdbb93..1bac525 100644
+--- a/Examples/test-suite/d/preproc_constants_c_runme.2.d
++++ b/Examples/test-suite/d/preproc_constants_c_runme.2.d
+@@ -61,4 +61,6 @@ void main() {
+   static assert(is(int == typeof(EXPR_LAND())));
+   static assert(is(int == typeof(EXPR_LOR())));
+   static assert(is(double == typeof(EXPR_CONDITIONAL())));
++  static assert(is(int == typeof(EXPR_WCHAR_MAX())));
++  static assert(is(int == typeof(EXPR_WCHAR_MIN())));
+ }
+diff --git a/Examples/test-suite/d/preproc_constants_runme.1.d b/Examples/test-suite/d/preproc_constants_runme.1.d
+index 009405f..f743f48 100644
+--- a/Examples/test-suite/d/preproc_constants_runme.1.d
++++ b/Examples/test-suite/d/preproc_constants_runme.1.d
+@@ -60,4 +60,6 @@ void main() {
+   static assert(is(bool == typeof(EXPR_LAND())));
+   static assert(is(bool == typeof(EXPR_LOR())));
+   static assert(is(double == typeof(EXPR_CONDITIONAL())));
++  static assert(is(int == typeof(EXPR_WCHAR_MAX())));
++  static assert(is(int == typeof(EXPR_WCHAR_MIN())));
+ }
+diff --git a/Examples/test-suite/d/preproc_constants_runme.2.d b/Examples/test-suite/d/preproc_constants_runme.2.d
+index 2d92ef0..0d96c37 100644
+--- a/Examples/test-suite/d/preproc_constants_runme.2.d
++++ b/Examples/test-suite/d/preproc_constants_runme.2.d
+@@ -60,4 +60,6 @@ void main() {
+   static assert(is(bool == typeof(EXPR_LAND())));
+   static assert(is(bool == typeof(EXPR_LOR())));
+   static assert(is(double == typeof(EXPR_CONDITIONAL())));
++  static assert(is(int == typeof(EXPR_WCHAR_MAX())));
++  static assert(is(int == typeof(EXPR_WCHAR_MIN())));
+ }
+diff --git a/Examples/test-suite/php/preproc_constants_c_runme.php b/Examples/test-suite/php/preproc_constants_c_runme.php
+index af9b76e..e59fe18 100644
+--- a/Examples/test-suite/php/preproc_constants_c_runme.php
++++ b/Examples/test-suite/php/preproc_constants_c_runme.php
+@@ -62,5 +62,7 @@ check::equal(gettype(preproc_constants_c::EXPR_OR), "integer", "preproc_constant
+ check::equal(gettype(preproc_constants_c::EXPR_LAND), "integer", "preproc_constants.EXPR_LAND has unexpected type");
+ check::equal(gettype(preproc_constants_c::EXPR_LOR), "integer", "preproc_constants.EXPR_LOR has unexpected type");
+ check::equal(gettype(preproc_constants_c::EXPR_CONDITIONAL), "double", "preproc_constants.EXPR_CONDITIONAL has unexpected type");
++check::equal(gettype(preproc_constants_c::EXPR_WCHAR_MAX), "integer", "preproc_constants.EXPR_WCHAR_MAX has unexpected type");
++check::equal(gettype(preproc_constants_c::EXPR_WCHAR_MIN), "integer", "preproc_constants.EXPR_WCHAR_MIN has unexpected type");
+ 
+ ?>
+diff --git a/Examples/test-suite/php/preproc_constants_runme.php b/Examples/test-suite/php/preproc_constants_runme.php
+index 5c9119b..8e117ea 100644
+--- a/Examples/test-suite/php/preproc_constants_runme.php
++++ b/Examples/test-suite/php/preproc_constants_runme.php
+@@ -61,5 +61,7 @@ check::equal(gettype(preproc_constants::EXPR_OR), "integer", "preproc_constants.
+ check::equal(gettype(preproc_constants::EXPR_LAND), "boolean", "preproc_constants.EXPR_LAND has unexpected type");
+ check::equal(gettype(preproc_constants::EXPR_LOR), "boolean", "preproc_constants.EXPR_LOR has unexpected type");
+ check::equal(gettype(preproc_constants::EXPR_CONDITIONAL), "double", "preproc_constants.EXPR_CONDITIONAL has unexpected type");
++check::equal(gettype(preproc_constants::EXPR_WCHAR_MAX), "integer", "preproc_constants.EXPR_WCHAR_MAX has unexpected type");
++check::equal(gettype(preproc_constants::EXPR_WCHAR_MIN), "integer", "preproc_constants.EXPR_WCHAR_MIN has unexpected type");
+ 
+ ?>
+diff --git a/Examples/test-suite/php5/preproc_constants_c_runme.php b/Examples/test-suite/php5/preproc_constants_c_runme.php
+index 1ea0195..d978fab 100644
+--- a/Examples/test-suite/php5/preproc_constants_c_runme.php
++++ b/Examples/test-suite/php5/preproc_constants_c_runme.php
+@@ -62,5 +62,7 @@ check::equal(gettype(preproc_constants_c::EXPR_OR), "integer", "preproc_constant
+ check::equal(gettype(preproc_constants_c::EXPR_LAND), "integer", "preproc_constants.EXPR_LAND has unexpected type");
+ check::equal(gettype(preproc_constants_c::EXPR_LOR), "integer", "preproc_constants.EXPR_LOR has unexpected type");
+ check::equal(gettype(preproc_constants_c::EXPR_CONDITIONAL), "double", "preproc_constants.EXPR_CONDITIONAL has unexpected type");
++check::equal(gettype(preproc_constants_c::EXPR_WCHAR_MAX), "integer", "preproc_constants.EXPR_WCHAR_MAX has unexpected type");
++check::equal(gettype(preproc_constants_c::EXPR_WCHAR_MIN), "integer", "preproc_constants.EXPR_WCHAR_MIN has unexpected type");
+ 
+ ?>
+diff --git a/Examples/test-suite/php5/preproc_constants_runme.php b/Examples/test-suite/php5/preproc_constants_runme.php
+index fb9ee4f..7527026 100644
+--- a/Examples/test-suite/php5/preproc_constants_runme.php
++++ b/Examples/test-suite/php5/preproc_constants_runme.php
+@@ -70,5 +70,7 @@ check::equal(gettype(preproc_constants::EXPR_LAND), "integer", "preproc_constant
+ check::equal(gettype(preproc_constants::EXPR_LOR), "integer", "preproc_constants.EXPR_LOR has unexpected type");
+ 
+ check::equal(gettype(preproc_constants::EXPR_CONDITIONAL), "double", "preproc_constants.EXPR_CONDITIONAL has unexpected type");
++check::equal(gettype(preproc_constants::EXPR_WCHAR_MAX), "integer", "preproc_constants.EXPR_WCHAR_MAX has unexpected type");
++check::equal(gettype(preproc_constants::EXPR_WCHAR_MIN), "integer", "preproc_constants.EXPR_WCHAR_MIN has unexpected type");
+ 
+ ?>
+diff --git a/Examples/test-suite/preproc_constants.i b/Examples/test-suite/preproc_constants.i
+index 3a999ad..16b44c9 100644
+--- a/Examples/test-suite/preproc_constants.i
++++ b/Examples/test-suite/preproc_constants.i
+@@ -87,6 +87,9 @@
+ #define EXPR_LOR         0xFF || 1
+ #define EXPR_CONDITIONAL true ? 2 : 2.2
+ 
++#define EXPR_WCHAR_MAX   (0x7fffffff + L'\0')
++#define EXPR_WCHAR_MIN   (-EXPR_WCHAR_MAX - 1)
++
+ #define EXPR_CHAR_COMPOUND_ADD 'A' + 12
+ #define EXPR_CHAR_COMPOUND_LSHIFT 'B' << 6
+ #define H_SUPPRESS_SCALING_MAGIC (('s'<<24) | ('u'<<16) | ('p'<<8) | 'p')
+diff --git a/Source/CParse/parser.y b/Source/CParse/parser.y
+index 2e92cd0..273dadb 100644
+--- a/Source/CParse/parser.y
++++ b/Source/CParse/parser.y
+@@ -194,7 +194,7 @@ int SWIG_cparse_template_reduce(int treduce) {
+  * ----------------------------------------------------------------------------- */
+ 
+ static int promote_type(int t) {
+-  if (t <= T_UCHAR || t == T_CHAR) return T_INT;
++  if (t <= T_UCHAR || t == T_CHAR || t == T_WCHAR) return T_INT;
+   return t;
+ }
+ 
+-- 
+2.9.5
+
diff --git a/meta/recipes-devtools/swig/swig_3.0.12.bb b/meta/recipes-devtools/swig/swig_3.0.12.bb
index fe9d0747f2..45026c9700 100644
--- a/meta/recipes-devtools/swig/swig_3.0.12.bb
+++ b/meta/recipes-devtools/swig/swig_3.0.12.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.pat
             file://0001-Add-Node-7.x-aka-V8-5.2-support.patch \
             file://swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch \
             file://Python-Fix-new-GCC8-warnings-in-generated-code.patch \
+            file://0001-Fix-generated-code-for-constant-expressions-containi.patch \
            "
 SRC_URI[md5sum] = "82133dfa7bba75ff9ad98a7046be687c"
 SRC_URI[sha256sum] = "7cf9f447ae7ed1c51722efc45e7f14418d15d7a1e143ac9f09a668999f4fc94d"
-- 
2.20.1


