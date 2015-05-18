Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 40E99601E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:49:56 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so76480214wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=UXxuoWDmsJAOTn0fK5pYCtLsOZl1smyND44kQ5wDVMI=;
	b=C7GsoNZXeThPUCh7+H0Iyzd5BpFYALZi1YPfVxrhLOSGhi1an+0s0yD0rjkWqcbQQJ
	HC39/lTjnxN2Qn+x6JYeFsWcNJO6ef6Np4XiMNYHdduAnNTVidFyXgZ3gHly0w0pqS2r
	8nakb21DBv7tVP+fgGD0XWrNM6REiiuE4PUdTDb/1y+oclOS62YyVMHTLwoCjJwt5qig
	0sXFuyYT0sOReD4JxOaeZp4FDHsFypWvyoAScNDfkMoL9mxih/5ptVij0T3rmJYsG91R
	G1Rwje0MyeBGC4iYt56Oe21JVhlkxYROpPrRZhQ5AHGUp9BXxS0CqpME3NlIKT2rEaXT
	Ow/g==
X-Gm-Message-State: ALoCoQmR290RUI1PEuy/Jc3Mkyir/RdkUA6D2SxTuCXByqtn/LDr9h00h2Ey8iVraFBgFaK4poBt
X-Received: by 10.194.185.238 with SMTP id ff14mr46542769wjc.150.1431967797422;
	Mon, 18 May 2015 09:49:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.49.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:49:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:21 +0100
Message-Id: <1431967531-25163-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] libx11: upgrade to 1.6.3
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
X-List-Received-Date: Mon, 18 May 2015 16:49:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backported patch always-use-XCOMM patch.
Refresh Add-missing-NULL-check.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{libx11-diet_1.6.2.bb => libx11-diet_1.6.3.bb} |   4 +-
 .../libx11/libX11-Add-missing-NULL-check.patch     |   6 +-
 ...use-XCOMM-instead-of-for-comments-in-Comp.patch | 101 ---------------------
 meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb     |  12 ---
 meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb     |  11 +++
 5 files changed, 16 insertions(+), 118 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.2.bb => libx11-diet_1.6.3.bb} (73%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb
index 89b0716..c0d0148 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb
@@ -11,8 +11,8 @@ SRC_URI += "file://X18NCMSstubs.diff \
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "c35d6ad95b06635a524579e88622fdb5"
-SRC_URI[sha256sum] = "2aa027e837231d2eeea90f3a4afe19948a6eb4c8b2bec0241eba7dbc8106bd16"
+SRC_URI[md5sum] = "2e36b73f8a42143142dda8129f02e4e0"
+SRC_URI[sha256sum] = "cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8adc8111"
 
 EXTRA_OECONF += "--disable-xlocale"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch b/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch
index 3068620..a60e985 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch
@@ -29,7 +29,7 @@ diff -ru libX11-1.6.2-orig/src/xlibi18n/ICWrap.c libX11-1.6.2/src/xlibi18n/ICWra
 -    ret = (*im->methods->set_values) (im, args);
 +    if (im && im->methods)
 +	ret = (*im->methods->set_values) (im, args);
-     if (args) Xfree(args);
+     Xfree(args);
      return ret;
  }
 @@ -196,7 +197,7 @@
@@ -48,7 +48,7 @@ diff -ru libX11-1.6.2-orig/src/xlibi18n/ICWrap.c libX11-1.6.2/src/xlibi18n/ICWra
 -    ret = (*im->methods->get_values) (im, args);
 +    if (im && im->methods)
 +	ret = (*im->methods->get_values) (im, args);
-     if (args) Xfree(args);
+     Xfree(args);
      return ret;
  }
 @@ -228,7 +230,7 @@
@@ -67,6 +67,6 @@ diff -ru libX11-1.6.2-orig/src/xlibi18n/ICWrap.c libX11-1.6.2/src/xlibi18n/ICWra
 -    ic = (XIC) (*im->methods->create_ic) (im, args);
 +    if (im && im->methods)
 +	ic = (XIC) (*im->methods->create_ic) (im, args);
-     if (args) Xfree(args);
+     Xfree(args);
      if (ic) {
  	ic->core.next = im->core.ic_chain;
diff --git a/meta/recipes-graphics/xorg-lib/libx11/nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch b/meta/recipes-graphics/xorg-lib/libx11/nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch
deleted file mode 100644
index b7f5356..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11/nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
-
-From b64bee2ddb7b96f00713a8b8435f11ad9ac1c9e0 Mon Sep 17 00:00:00 2001
-From: Ran Benita <ran234@gmail.com>
-Date: Sun, 16 Feb 2014 15:24:58 +0200
-Subject: [PATCH] nls: always use XCOMM instead of # for comments in
- Compose.pre files
-
-Lines starting with # are considered as preprocessor directives in the
-.pre files.
-
-Fixes warnings like:
-<stdin>:3:0: error: invalid preprocessing directive #Khmer
-
-Signed-off-by: Ran Benita <ran234@gmail.com>
-Signed-off-by: James Cloos <cloos@jhcloos.com>
----
- nls/km_KH.UTF-8/Compose.pre |    2 +-
- nls/sr_CS.UTF-8/Compose.pre |   32 ++++++++++++++++----------------
- 2 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/nls/km_KH.UTF-8/Compose.pre b/nls/km_KH.UTF-8/Compose.pre
-index 77651d0..dc89119 100644
---- a/nls/km_KH.UTF-8/Compose.pre
-+++ b/nls/km_KH.UTF-8/Compose.pre
-@@ -1,6 +1,6 @@
- include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
- 
--# Khmer digraphs
-+XCOMM Khmer digraphs
- <U17ff>	:	"ាំ"
- <U17fe>	:	"ោះ"
- <U17fd>	:	"េះ"
-diff --git a/nls/sr_CS.UTF-8/Compose.pre b/nls/sr_CS.UTF-8/Compose.pre
-index 119e23e..b2397f7 100644
---- a/nls/sr_CS.UTF-8/Compose.pre
-+++ b/nls/sr_CS.UTF-8/Compose.pre
-@@ -1,17 +1,17 @@
- include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
- 
--# Serbian accented Cyrillic
--# а А - U+0430, U+0410 Cyrillic_a, Cyrillic_A
--# е Е - U+0435, U+0415 Cyrillic_e, Cyrillic_E
--# о О - U+043E, U+041E Cyrillic_o, Cyrillic_O
--# у У - U+0443, U+0423 Cyrillic_u, Cyrillic_U
--# и И - U+0438, U+0418 Cyrillic_i, Cyrillic_I
--#
--# ̀ - U+0300 <dead_grave>, <combining_grave>, <Multi_key> <grave>
--# ́ - U+0301   <dead_acute>, <Multi_key> <acute>, <Multi_key> <apostrophe>, <combining_acute>
--# ̂ - U+0302 <dead_circumflex>, <Multi_key> <asciicircum>
--# ̏ - U+030F  <dead_diaeresis>, <dead_doubleacute>
--# ̀ - kratkouzlazni, U+0300 <dead_grave>, <combining_grave>, <Multi_key> <grave>
-+XCOMM Serbian accented Cyrillic
-+XCOMM а А - U+0430, U+0410 Cyrillic_a, Cyrillic_A
-+XCOMM е Е - U+0435, U+0415 Cyrillic_e, Cyrillic_E
-+XCOMM о О - U+043E, U+041E Cyrillic_o, Cyrillic_O
-+XCOMM у У - U+0443, U+0423 Cyrillic_u, Cyrillic_U
-+XCOMM и И - U+0438, U+0418 Cyrillic_i, Cyrillic_I
-+XCOMM
-+XCOMM ̀ - U+0300 <dead_grave>, <combining_grave>, <Multi_key> <grave>
-+XCOMM ́ - U+0301   <dead_acute>, <Multi_key> <acute>, <Multi_key> <apostrophe>, <combining_acute>
-+XCOMM ̂ - U+0302 <dead_circumflex>, <Multi_key> <asciicircum>
-+XCOMM ̏ - U+030F  <dead_diaeresis>, <dead_doubleacute>
-+XCOMM ̀ - kratkouzlazni, U+0300 <dead_grave>, <combining_grave>, <Multi_key> <grave>
- <dead_grave> <Cyrillic_a>         : "а̀"
- <combining_grave> <Cyrillic_a>    : "а̀"
- <Multi_key> <grave> <Cyrillic_a>  : "а̀"
-@@ -42,7 +42,7 @@ include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
- <dead_grave> <Cyrillic_U>         : "У̀"
- <combining_grave> <Cyrillic_U>    : "У̀"
- <Multi_key> <grave> <Cyrillic_U>  : "У̀"
--# ́ - dugouzlazni, U+0301   <dead_acute>, <Multi_key> <acute>, <Multi_key> <apostrophe>, <combining_acute>
-+XCOMM ́ - dugouzlazni, U+0301   <dead_acute>, <Multi_key> <acute>, <Multi_key> <apostrophe>, <combining_acute>
- <dead_acute> <Cyrillic_a>              : "а́"
- <combining_acute> <Cyrillic_a>         : "а́"
- <Multi_key> <acute> <Cyrillic_a>       : "а́"
-@@ -83,7 +83,7 @@ include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
- <combining_acute>        <Cyrillic_U>  : "У́"
- <Multi_key> <acute>      <Cyrillic_U>  : "У́"
- <Multi_key> <apostrophe> <Cyrillic_U>  : "У́"
--# ̂ - dugosilazni, U+0302 <dead_circumflex>, <Multi_key> <asciicircum>
-+XCOMM ̂ - dugosilazni, U+0302 <dead_circumflex>, <Multi_key> <asciicircum>
- <dead_circumflex> <Cyrillic_a>          : "а̂"
- <Multi_key> <asciicircum> <Cyrillic_a>  : "а̂"
- <dead_circumflex> <Cyrillic_A>          : "А̂"
-@@ -104,8 +104,8 @@ include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
- <Multi_key> <asciicircum> <Cyrillic_u>  : "у̂"
- <dead_circumflex> <Cyrillic_U>          : "У̂"
- <Multi_key> <asciicircum> <Cyrillic_U>  : "У̂"
--# ̏ - kratkosilazni, U+030F  <dead_diaeresis>, <dead_doubleacute>
--# there's no appropriate dead_doublegrave, so we use these two dead keys
-+XCOMM ̏ - kratkosilazni, U+030F  <dead_diaeresis>, <dead_doubleacute>
-+XCOMM there's no appropriate dead_doublegrave, so we use these two dead keys
- <dead_diaeresis>   <Cyrillic_a>  : "а̏"
- <dead_doubleacute> <Cyrillic_a>  : "а̏"
- <dead_diaeresis>   <Cyrillic_A>  : "А̏"
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
deleted file mode 100644
index a722648..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require libx11.inc
-inherit gettext
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += "file://disable_tests.patch \
-            file://nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch \
-            file://libX11-Add-missing-NULL-check.patch \
-           "
-
-SRC_URI[md5sum] = "c35d6ad95b06635a524579e88622fdb5"
-SRC_URI[sha256sum] = "2aa027e837231d2eeea90f3a4afe19948a6eb4c8b2bec0241eba7dbc8106bd16"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
new file mode 100644
index 0000000..8e531c7
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
@@ -0,0 +1,11 @@
+require libx11.inc
+inherit gettext
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += "file://disable_tests.patch \
+            file://libX11-Add-missing-NULL-check.patch \
+           "
+
+SRC_URI[md5sum] = "2e36b73f8a42143142dda8129f02e4e0"
+SRC_URI[sha256sum] = "cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8adc8111"
-- 
2.1.4


