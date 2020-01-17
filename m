Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C37967FBFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjr653hz6m
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281281;
	bh=InrLC/iCUeYi3JCXTuGIrpFb0U/EnSsCUPwVVCkwnMg=;
	h=From:To:Subject:Date:From;
	b=ovrENX16TMehXP/r2X1eeDPWpau2U4fRcnWyVwtgScJ+HvCdCRO2pf1V/pT+iD8wq
	LBNFThaFjM1qLpdCVaw4jGQYIkseO7xShNX/UZcoOUpxUzmzpatau3ZnxFlP2tJQq+
	P8jPt3oCtff6GNHGUXJTa8Akpnia1/+W4cHBT259VHGuoVYcQAT2kMUbOUgwJOq4NU
	s2SMx3Cb5n5Q99e9oRaoTWNP/BM9fKZO+cp6/iNlN4XR/ccTjaWueNZjHyvh5Z5cKv
	w13LYVLPjpxurv79JtsA7T3mU0QGMqH9hitN3s6q78hVX4r4P1Q3TJgXcVG/XCz9Ix
	pN3g3U141s2HvYAHQCVqz2/1pxxmfTDYCIb1CfYDAIJVOxOGG4XOvqIHwfQS2GcZ8u
	ehcFJu9zd4uWxJ13IypQQz/OMcSzG4i1S9vaHaT2kNuOoSBOvZs6EYDe2etasVyndo
	02SU1jd7AGAgFmrFQlyx49RAPjQPZnGNaWRgAo1dlPg+ddygw9EZANwVnYpQ9j+UAX
	k4W/80cIb2oOqyvZalv/1IYrbZzQXisDllL0pFmBvw8PDHey0IVA7vpsU3xdgSbwYr
	Cvfw1U+qqQqwEBMWMDCWSM5Jfm5UWNwTNix7R5juCDOIjuufQCCpW59Clbhkick79S
	bvZ1lJUJIKZFVXw72ZCPBddY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:30 +0200
Message-Id: <20200117171436.17131-10-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] nasm: fix CVE-2018-19755
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:40 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../nasm/nasm/CVE-2018-19755.patch            | 116 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |   4 +-
 2 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch b/meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
new file mode 100644
index 0000000000..6e3f909d0f
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
@@ -0,0 +1,116 @@
+From 3079f7966dbed4497e36d5067cbfd896a90358cb Mon Sep 17 00:00:00 2001
+From: Cyrill Gorcunov <gorcunov@gmail.com>
+Date: Wed, 14 Nov 2018 10:03:42 +0300
+Subject: [PATCH] preproc: Fix malformed parameter count
+
+readnum returns 64bit number which may become
+a negative integer upon conversion which in
+turn lead to out of bound array access.
+
+Fix it by explicit conversion with bounds check
+
+ | POC6:2: error: parameter count `2222222222' is out of bounds [0; 2147483647]
+
+https://bugzilla.nasm.us/show_bug.cgi?id=3392528
+
+Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2018-19755
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ asm/preproc.c | 43 +++++++++++++++++++++----------------------
+ 1 file changed, 21 insertions(+), 22 deletions(-)
+
+diff --git a/asm/preproc.c b/asm/preproc.c
+index b6afee3..e5ad05a 100644
+--- a/asm/preproc.c
++++ b/asm/preproc.c
+@@ -1650,6 +1650,23 @@ smacro_defined(Context * ctx, const char *name, int nparam, SMacro ** defn,
+     return false;
+ }
+ 
++/* param should be a natural number [0; INT_MAX] */
++static int read_param_count(const char *str)
++{
++    int result;
++    bool err;
++
++    result = readnum(str, &err);
++    if (result < 0 || result > INT_MAX) {
++        result = 0;
++        nasm_error(ERR_NONFATAL, "parameter count `%s' is out of bounds [%d; %d]",
++                   str, 0, INT_MAX);
++    } else if (err) {
++        nasm_error(ERR_NONFATAL, "unable to parse parameter count `%s'", str);
++    }
++    return result;
++}
++
+ /*
+  * Count and mark off the parameters in a multi-line macro call.
+  * This is called both from within the multi-line macro expansion
+@@ -1871,11 +1888,7 @@ static bool if_condition(Token * tline, enum preproc_token ct)
+                   pp_directives[ct]);
+         } else {
+             searching.nparam_min = searching.nparam_max =
+-                readnum(tline->text, &j);
+-            if (j)
+-                nasm_error(ERR_NONFATAL,
+-                      "unable to parse parameter count `%s'",
+-                      tline->text);
++                read_param_count(tline->text);
+         }
+         if (tline && tok_is_(tline->next, "-")) {
+             tline = tline->next->next;
+@@ -1886,11 +1899,7 @@ static bool if_condition(Token * tline, enum preproc_token ct)
+                       "`%s' expects a parameter count after `-'",
+                       pp_directives[ct]);
+             else {
+-                searching.nparam_max = readnum(tline->text, &j);
+-                if (j)
+-                    nasm_error(ERR_NONFATAL,
+-                          "unable to parse parameter count `%s'",
+-                          tline->text);
++                searching.nparam_max = read_param_count(tline->text);
+                 if (searching.nparam_min > searching.nparam_max) {
+                     nasm_error(ERR_NONFATAL,
+                           "minimum parameter count exceeds maximum");
+@@ -2079,8 +2088,6 @@ static void undef_smacro(Context *ctx, const char *mname)
+  */
+ static bool parse_mmacro_spec(Token *tline, MMacro *def, const char *directive)
+ {
+-    bool err;
+-
+     tline = tline->next;
+     skip_white_(tline);
+     tline = expand_id(tline);
+@@ -2103,11 +2110,7 @@ static bool parse_mmacro_spec(Token *tline, MMacro *def, const char *directive)
+     if (!tok_type_(tline, TOK_NUMBER)) {
+         nasm_error(ERR_NONFATAL, "`%s' expects a parameter count", directive);
+     } else {
+-        def->nparam_min = def->nparam_max =
+-            readnum(tline->text, &err);
+-        if (err)
+-            nasm_error(ERR_NONFATAL,
+-                  "unable to parse parameter count `%s'", tline->text);
++        def->nparam_min = def->nparam_max = read_param_count(tline->text);
+     }
+     if (tline && tok_is_(tline->next, "-")) {
+         tline = tline->next->next;
+@@ -2117,11 +2120,7 @@ static bool parse_mmacro_spec(Token *tline, MMacro *def, const char *directive)
+             nasm_error(ERR_NONFATAL,
+                   "`%s' expects a parameter count after `-'", directive);
+         } else {
+-            def->nparam_max = readnum(tline->text, &err);
+-            if (err) {
+-                nasm_error(ERR_NONFATAL, "unable to parse parameter count `%s'",
+-                      tline->text);
+-            }
++            def->nparam_max = read_param_count(tline->text);
+             if (def->nparam_min > def->nparam_max) {
+                 nasm_error(ERR_NONFATAL, "minimum parameter count exceeds maximum");
+                 def->nparam_max = def->nparam_min;
+-- 
+2.10.5.GIT
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
index ecec78d8ec..e4f964ce93 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -3,7 +3,9 @@ SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2"
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
+           file://CVE-2018-19755.patch \
+           "
 
 SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
 SRC_URI[sha256sum] = "34fd26c70a277a9fdd54cb5ecf389badedaf48047b269d1008fbc819b24e80bc"
-- 
2.17.1


