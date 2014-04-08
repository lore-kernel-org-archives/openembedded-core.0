Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 395676FA2F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 05:32:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s385W43M010037
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Apr 2014 22:32:04 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 7 Apr 2014 22:32:04 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Apr 2014 13:32:01 +0800
Message-ID: <47a13254898c2868ae2ddd9ef15281d3b69efaca.1396935045.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1396935045.git.Chong.Lu@windriver.com>
References: <cover.1396935045.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libx11: fix invalid preprocessing directive errors
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
X-List-Received-Date: Tue, 08 Apr 2014 05:32:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Backport the patch to fix invalid preprocessing directive errors.

	nls: always use XCOMM instead of # for comments in Compose.pre files

[YOCTO #6116]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...use-XCOMM-instead-of-for-comments-in-Comp.patch | 101 +++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb     |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch b/meta/recipes-graphics/xorg-lib/libx11/nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch
new file mode 100644
index 0000000..b7f5356
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch
@@ -0,0 +1,101 @@
+Upstream-Status: Backport
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+
+From b64bee2ddb7b96f00713a8b8435f11ad9ac1c9e0 Mon Sep 17 00:00:00 2001
+From: Ran Benita <ran234@gmail.com>
+Date: Sun, 16 Feb 2014 15:24:58 +0200
+Subject: [PATCH] nls: always use XCOMM instead of # for comments in
+ Compose.pre files
+
+Lines starting with # are considered as preprocessor directives in the
+.pre files.
+
+Fixes warnings like:
+<stdin>:3:0: error: invalid preprocessing directive #Khmer
+
+Signed-off-by: Ran Benita <ran234@gmail.com>
+Signed-off-by: James Cloos <cloos@jhcloos.com>
+---
+ nls/km_KH.UTF-8/Compose.pre |    2 +-
+ nls/sr_CS.UTF-8/Compose.pre |   32 ++++++++++++++++----------------
+ 2 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/nls/km_KH.UTF-8/Compose.pre b/nls/km_KH.UTF-8/Compose.pre
+index 77651d0..dc89119 100644
+--- a/nls/km_KH.UTF-8/Compose.pre
++++ b/nls/km_KH.UTF-8/Compose.pre
+@@ -1,6 +1,6 @@
+ include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
+ 
+-# Khmer digraphs
++XCOMM Khmer digraphs
+ <U17ff>	:	"ាំ"
+ <U17fe>	:	"ោះ"
+ <U17fd>	:	"េះ"
+diff --git a/nls/sr_CS.UTF-8/Compose.pre b/nls/sr_CS.UTF-8/Compose.pre
+index 119e23e..b2397f7 100644
+--- a/nls/sr_CS.UTF-8/Compose.pre
++++ b/nls/sr_CS.UTF-8/Compose.pre
+@@ -1,17 +1,17 @@
+ include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
+ 
+-# Serbian accented Cyrillic
+-# а А - U+0430, U+0410 Cyrillic_a, Cyrillic_A
+-# е Е - U+0435, U+0415 Cyrillic_e, Cyrillic_E
+-# о О - U+043E, U+041E Cyrillic_o, Cyrillic_O
+-# у У - U+0443, U+0423 Cyrillic_u, Cyrillic_U
+-# и И - U+0438, U+0418 Cyrillic_i, Cyrillic_I
+-#
+-# ̀ - U+0300 <dead_grave>, <combining_grave>, <Multi_key> <grave>
+-# ́ - U+0301   <dead_acute>, <Multi_key> <acute>, <Multi_key> <apostrophe>, <combining_acute>
+-# ̂ - U+0302 <dead_circumflex>, <Multi_key> <asciicircum>
+-# ̏ - U+030F  <dead_diaeresis>, <dead_doubleacute>
+-# ̀ - kratkouzlazni, U+0300 <dead_grave>, <combining_grave>, <Multi_key> <grave>
++XCOMM Serbian accented Cyrillic
++XCOMM а А - U+0430, U+0410 Cyrillic_a, Cyrillic_A
++XCOMM е Е - U+0435, U+0415 Cyrillic_e, Cyrillic_E
++XCOMM о О - U+043E, U+041E Cyrillic_o, Cyrillic_O
++XCOMM у У - U+0443, U+0423 Cyrillic_u, Cyrillic_U
++XCOMM и И - U+0438, U+0418 Cyrillic_i, Cyrillic_I
++XCOMM
++XCOMM ̀ - U+0300 <dead_grave>, <combining_grave>, <Multi_key> <grave>
++XCOMM ́ - U+0301   <dead_acute>, <Multi_key> <acute>, <Multi_key> <apostrophe>, <combining_acute>
++XCOMM ̂ - U+0302 <dead_circumflex>, <Multi_key> <asciicircum>
++XCOMM ̏ - U+030F  <dead_diaeresis>, <dead_doubleacute>
++XCOMM ̀ - kratkouzlazni, U+0300 <dead_grave>, <combining_grave>, <Multi_key> <grave>
+ <dead_grave> <Cyrillic_a>         : "а̀"
+ <combining_grave> <Cyrillic_a>    : "а̀"
+ <Multi_key> <grave> <Cyrillic_a>  : "а̀"
+@@ -42,7 +42,7 @@ include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
+ <dead_grave> <Cyrillic_U>         : "У̀"
+ <combining_grave> <Cyrillic_U>    : "У̀"
+ <Multi_key> <grave> <Cyrillic_U>  : "У̀"
+-# ́ - dugouzlazni, U+0301   <dead_acute>, <Multi_key> <acute>, <Multi_key> <apostrophe>, <combining_acute>
++XCOMM ́ - dugouzlazni, U+0301   <dead_acute>, <Multi_key> <acute>, <Multi_key> <apostrophe>, <combining_acute>
+ <dead_acute> <Cyrillic_a>              : "а́"
+ <combining_acute> <Cyrillic_a>         : "а́"
+ <Multi_key> <acute> <Cyrillic_a>       : "а́"
+@@ -83,7 +83,7 @@ include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
+ <combining_acute>        <Cyrillic_U>  : "У́"
+ <Multi_key> <acute>      <Cyrillic_U>  : "У́"
+ <Multi_key> <apostrophe> <Cyrillic_U>  : "У́"
+-# ̂ - dugosilazni, U+0302 <dead_circumflex>, <Multi_key> <asciicircum>
++XCOMM ̂ - dugosilazni, U+0302 <dead_circumflex>, <Multi_key> <asciicircum>
+ <dead_circumflex> <Cyrillic_a>          : "а̂"
+ <Multi_key> <asciicircum> <Cyrillic_a>  : "а̂"
+ <dead_circumflex> <Cyrillic_A>          : "А̂"
+@@ -104,8 +104,8 @@ include "X11_LOCALEDATADIR/en_US.UTF-8/Compose"
+ <Multi_key> <asciicircum> <Cyrillic_u>  : "у̂"
+ <dead_circumflex> <Cyrillic_U>          : "У̂"
+ <Multi_key> <asciicircum> <Cyrillic_U>  : "У̂"
+-# ̏ - kratkosilazni, U+030F  <dead_diaeresis>, <dead_doubleacute>
+-# there's no appropriate dead_doublegrave, so we use these two dead keys
++XCOMM ̏ - kratkosilazni, U+030F  <dead_diaeresis>, <dead_doubleacute>
++XCOMM there's no appropriate dead_doublegrave, so we use these two dead keys
+ <dead_diaeresis>   <Cyrillic_a>  : "а̏"
+ <dead_doubleacute> <Cyrillic_a>  : "а̏"
+ <dead_diaeresis>   <Cyrillic_A>  : "А̏"
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
index 2377d61..700bc36 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
@@ -4,6 +4,7 @@ inherit gettext
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://disable_tests.patch \
+            file://nls-always-use-XCOMM-instead-of-for-comments-in-Comp.patch \
            "
 
 SRC_URI[md5sum] = "c35d6ad95b06635a524579e88622fdb5"
-- 
1.8.1.2


