Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE5A760685
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 12:42:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r5so5372628wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 04:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=On+bZV+LhptozuugWKXUS2z4J8UL8qYaI6iFE1PogyQ=;
	b=Z6u96mY4+sngkYdtHGjyW15O3QQ7OROAjeaw6Wgn1tPiesU6XcB7zDju9BNtDVTvyY
	1k+yzzjSDaoixt4FWWZSM4im5w0lMtuHjJKXoauXomn8nH5KAWPVas42bdYu0ap5zWTC
	+RY0GMsRJsbqi/P9f6SFtvlTrDH+GHCcCOmt9dISW8rLBGptB9KTbn5xdpgUvoBXaxTw
	pSfq5IO+OUHSNgaDSIcHP5EABQyAB1YoFQdSMxrhwaZ0dg1hlvvnlEAfGyKzsbI/lbZM
	3Lc+WqkZPICLz4CD0EPmripSxtQgNpbKdclADhGxTj6FQJLlKm+rsUubC7TL6GrMGvbN
	GqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=On+bZV+LhptozuugWKXUS2z4J8UL8qYaI6iFE1PogyQ=;
	b=hq9nzVsKxQfkufQnrgbtVIqeUUuETBa98BcDn2fzO26Uu6AGGCR2Hu/JZS/pGEpsmE
	7npL7c4XtDeKrhRX6tKQk7XMSG3hkSgWdlzNkIFB/FE4Lh6S3f1j3N6spz0Nm8sTxw+M
	miusp0UVKrXp2S9kQbjQ50mHilF2BlOtbjFclh1sy7rCi+Oho40CS4N1UVkZSPshdQ7m
	mvgWFwsyzY9mdDs8vVHoAJUG8AFsbP2XYzVHfilIxWS0Cptviwe25mtBhfZPV8MJTdrX
	MJ66KgbUzoPxptx9pJIotOOYXifHhm+s9ZkDPfthb6O1Y2A4SwcaVe5wG7zhyZSks5g9
	dMDA==
X-Gm-Message-State: APjAAAWR2rpnNwj7f596cil7FO43OyKnJ67wVm1ujKToNtlD2HUSKwll
	u01OSCr707tsjbzLjjWbn0yJ09gtiHM=
X-Google-Smtp-Source: APXvYqxMyY8ZDlg4rlZtxT8vvAVB6ttcNTRaGOLVmPfKXXmrcFzwmKBvm64g6x4fZnZ7p62ejfTZOw==
X-Received: by 2002:adf:9dc4:: with SMTP id q4mr13166665wre.330.1551703332875; 
	Mon, 04 Mar 2019 04:42:12 -0800 (PST)
Received: from localhost ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id
	s127sm6104812wmf.39.2019.03.04.04.42.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Mar 2019 04:42:11 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 12:42:08 +0000
Message-Id: <20190304124208.24579-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228142745.23630-1-luca.boccassi@gmail.com>
References: <20190228142745.23630-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v4] swig: fix build with musl
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
X-List-Received-Date: Mon, 04 Mar 2019 12:42:13 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Building with musl currently fails. The fix has been committed
upstream, so backport it.
Note that it requires running yacc again to regenerate the parser file,
so a bison-native dependency is needed. Also the upstream's configure
step creates the directory where the parser file is generated at
make-dist time, and for some reason running through bitbake does not
create it, so do it manually. All of this can be reverted once a new
swig version that includes the fix is released and rebased onto.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: fixed patch header
v3: added bison-native dependency and autoconf workaround
v4: switched from ${WORKDIR}/build to ${B}

 meta/recipes-devtools/swig/swig.inc           |   8 +-
 ...de-for-constant-expressions-containi.patch | 179 ++++++++++++++++++
 meta/recipes-devtools/swig/swig_3.0.12.bb     |   1 +
 3 files changed, 187 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index f7de40866a..00b9c5b605 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
 
 SECTION = "devel"
 
-DEPENDS = "libpcre"
+DEPENDS = "libpcre bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
@@ -42,6 +42,12 @@ EXTRA_AUTORECONF += "-I Tools/config"
 
 BBCLASSEXTEND = "native nativesdk"
 
+# necessary together with bison dependency until a new upstream version after
+# 3.0.12 includes 0001-Fix-generated-code-for-constant-expressions-containi.patch
+do_configure_append() {
+    mkdir -p ${B}/Source/CParse
+}
+
 do_install_append_class-nativesdk() {
     cd ${D}${bindir}
     ln -s swig swig2.0
diff --git a/meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch b/meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch
new file mode 100644
index 0000000000..f4ed782a82
--- /dev/null
+++ b/meta/recipes-devtools/swig/swig/0001-Fix-generated-code-for-constant-expressions-containi.patch
@@ -0,0 +1,179 @@
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
+ CHANGES.current                                         | 5 +++++
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
+Upstream-Status: Backport
+[https://github.com/swig/swig/commit/90ba174fcea1618af57aa594199541d47a89b7f6]
+Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
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


