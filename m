Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id D65B1609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:49:58 +0000 (UTC)
Received: by wizk4 with SMTP id k4so86840467wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5AZ8TmF+eKVvrCFaFz8CGRM7HQfu85RZ90wFCnjxi3w=;
	b=Pz9jFFMtK3LhccpZ3R2vKzHChRvudZvVCBfczDSaOoWvknE7HPbVkJTz6Nr4ui7McU
	Gi9aeWnh3a+Re3gQbOxNRsjB7RAkeY8QAuFOHI2mJi/7sPjeeUqub7KR2k5FIeYNzGxJ
	uKFvNPQWucjjE7MVCD9dblBvwI+RM3dNB2g6MEvORFp4N8mc3aiuP2Vkji2TgG1JEF+v
	7S7w5EtBS7iv4poooRdEdfxC6mNH7/ctvnflnN8eZuudy9y3k10CeFIISoRJi65W1Ybq
	vhiHcBOX9lEYIZHAGek2UeSaOtVjH4+n9GUIIhXH+z7th/Me5wllFLwYopiseT/3ak0T
	Pbmg==
X-Gm-Message-State: ALoCoQnl/oKAetabo3UwpA/9L7sf4oyEioOPFXK86Qk6TzAE5gjixrwoxhpyVTI2RbKDOMXVQXPk
X-Received: by 10.180.188.4 with SMTP id fw4mr23426763wic.7.1431967799980;
	Mon, 18 May 2015 09:49:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.49.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:49:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:23 +0100
Message-Id: <1431967531-25163-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 05/13] libxfont: upgrade to 1.5.1
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
X-List-Received-Date: Mon, 18 May 2015 16:49:59 -0000

Remove the backported patches as they're integrated in this release.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...acters-bailout-if-a-char-s-bitmap-cannot-.patch | 40 -----------
 ...acters-ensure-metrics-fit-into-xCharInfo-.patch | 80 ----------------------
 ...erties-property-count-needs-range-check-C.patch | 38 ----------
 .../{libxfont_1.5.0.bb => libxfont_1.5.1.bb}       |  9 +--
 4 files changed, 2 insertions(+), 165 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.5.0.bb => libxfont_1.5.1.bb} (54%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch
deleted file mode 100644
index cc66c12..0000000
--- a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 78c2e3d70d29698244f70164428bd2868c0ab34c Mon Sep 17 00:00:00 2001
-From: Alan Coopersmith <alan.coopersmith@oracle.com>
-Date: Fri, 6 Feb 2015 15:54:00 -0800
-Subject: [PATCH] bdfReadCharacters: bailout if a char's bitmap cannot be read
- [CVE-2015-1803]
-
-Previously would charge on ahead with a NULL pointer in ci->bits, and
-then crash later in FontCharInkMetrics() trying to access the bits.
-
-Found with afl-1.23b.
-
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Reviewed-by: Julien Cristau <jcristau@debian.org>
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- src/bitmap/bdfread.c |    5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/bitmap/bdfread.c b/src/bitmap/bdfread.c
-index 6387908..1b29b81 100644
---- a/src/bitmap/bdfread.c
-+++ b/src/bitmap/bdfread.c
-@@ -458,7 +458,10 @@ bdfReadCharacters(FontFilePtr file, FontPtr pFont, bdfFileState *pState,
- 	    ci->metrics.descent = -bb;
- 	    ci->metrics.characterWidth = wx;
- 	    ci->bits = NULL;
--	    bdfReadBitmap(ci, file, bit, byte, glyph, scan, bitmapsSizes);
-+	    if (!bdfReadBitmap(ci, file, bit, byte, glyph, scan, bitmapsSizes)) {
-+		bdfError("could not read bitmap for character '%s'\n", charName);
-+		goto BAILOUT;
-+	    }
- 	    ci++;
- 	    ndx++;
- 	} else
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch
deleted file mode 100644
index b64f1d9..0000000
--- a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 2351c83a77a478b49cba6beb2ad386835e264744 Mon Sep 17 00:00:00 2001
-From: Alan Coopersmith <alan.coopersmith@oracle.com>
-Date: Fri, 6 Mar 2015 22:54:58 -0800
-Subject: [PATCH] bdfReadCharacters: ensure metrics fit into xCharInfo struct
- [CVE-2015-1804]
-
-We use 32-bit ints to read from the bdf file, but then try to stick
-into a 16-bit int in the xCharInfo struct, so make sure they won't
-overflow that range.
-
-Found by afl-1.24b.
-
-v2: Verify that additions won't overflow 32-bit int range either.
-v3: As Julien correctly observes, the previous check for bh & bw not
-    being < 0 reduces the number of cases we need to check for overflow.
-
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Reviewed-by: Julien Cristau <jcristau@debian.org>
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- src/bitmap/bdfread.c |   26 ++++++++++++++++++++++++--
- 1 file changed, 24 insertions(+), 2 deletions(-)
-
-diff --git a/src/bitmap/bdfread.c b/src/bitmap/bdfread.c
-index 1b29b81..a0ace8f 100644
---- a/src/bitmap/bdfread.c
-+++ b/src/bitmap/bdfread.c
-@@ -62,8 +62,16 @@ from The Open Group.
- 
- #if HAVE_STDINT_H
- #include <stdint.h>
--#elif !defined(INT32_MAX)
--#define INT32_MAX 0x7fffffff
-+#else
-+# ifndef INT32_MAX
-+#  define INT32_MAX 0x7fffffff
-+# endif
-+# ifndef INT16_MAX
-+#  define INT16_MAX 0x7fff
-+# endif
-+# ifndef INT16_MIN
-+#  define INT16_MIN (0 - 0x8000)
-+# endif
- #endif
- 
- #define INDICES 256
-@@ -417,6 +425,12 @@ bdfReadCharacters(FontFilePtr file, FontPtr pFont, bdfFileState *pState,
- 	    bdfError("DWIDTH y value must be zero\n");
- 	    goto BAILOUT;
- 	}
-+	/* xCharInfo metrics are stored as INT16 */
-+	if ((wx < 0) || (wx > INT16_MAX)) {
-+	    bdfError("character '%s' has out of range width, %d\n",
-+		     charName, wx);
-+	    goto BAILOUT;
-+	}
- 	line = bdfGetLine(file, lineBuf, BDFLINELEN);
- 	if ((!line) || (sscanf((char *) line, "BBX %d %d %d %d", &bw, &bh, &bl, &bb) != 4)) {
- 	    bdfError("bad 'BBX'\n");
-@@ -427,6 +441,14 @@ bdfReadCharacters(FontFilePtr file, FontPtr pFont, bdfFileState *pState,
- 		     charName, bw, bh);
- 	    goto BAILOUT;
- 	}
-+	/* xCharInfo metrics are read as int, but stored as INT16 */
-+	if ((bl > INT16_MAX) || (bl < INT16_MIN) ||
-+	    (bb > INT16_MAX) || (bb < INT16_MIN) ||
-+	    (bw > (INT16_MAX - bl)) || (bh > (INT16_MAX - bb))) {
-+	    bdfError("character '%s' has out of range metrics, %d %d %d %d\n",
-+		     charName, bl, (bl+bw), (bh+bb), -bb);
-+	    goto BAILOUT;
-+	}
- 	line = bdfGetLine(file, lineBuf, BDFLINELEN);
- 	if ((line) && (bdfIsPrefix(line, "ATTRIBUTES"))) {
- 	    for (p = line + strlen("ATTRIBUTES ");
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch
deleted file mode 100644
index 0779c26..0000000
--- a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2deda9906480f9c8ae07b8c2a5510cc7e4c59a8e Mon Sep 17 00:00:00 2001
-From: Alan Coopersmith <alan.coopersmith@oracle.com>
-Date: Fri, 6 Feb 2015 15:50:45 -0800
-Subject: [PATCH] bdfReadProperties: property count needs range check
- [CVE-2015-1802]
-
-Avoid integer overflow or underflow when allocating memory arrays
-by multiplying the number of properties reported for a BDF font.
-
-Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Reviewed-by: Julien Cristau <jcristau@debian.org>
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- src/bitmap/bdfread.c |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/bitmap/bdfread.c b/src/bitmap/bdfread.c
-index 914a024..6387908 100644
---- a/src/bitmap/bdfread.c
-+++ b/src/bitmap/bdfread.c
-@@ -604,7 +604,9 @@ bdfReadProperties(FontFilePtr file, FontPtr pFont, bdfFileState *pState)
- 	bdfError("missing 'STARTPROPERTIES'\n");
- 	return (FALSE);
-     }
--    if (sscanf((char *) line, "STARTPROPERTIES %d", &nProps) != 1) {
-+    if ((sscanf((char *) line, "STARTPROPERTIES %d", &nProps) != 1) ||
-+	(nProps <= 0) ||
-+	(nProps > ((INT32_MAX / sizeof(FontPropRec)) - BDF_GENPROPS))) {
- 	bdfError("bad 'STARTPROPERTIES'\n");
- 	return (FALSE);
-     }
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.1.bb
similarity index 54%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.5.1.bb
index dfd2dc6..1b6e33c 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.1.bb
@@ -18,10 +18,5 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI += "file://0001-bdfReadProperties-property-count-needs-range-check-C.patch \
-            file://0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch \
-            file://0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch \
-           "
-
-SRC_URI[md5sum] = "664629bfa7cdf8b984155019fd395dcb"
-SRC_URI[sha256sum] = "3a3c52c4adf9352b2160f07ff0596af17ab14f91d6509564e606678a1261c25f"
+SRC_URI[md5sum] = "96f76ba94b4c909230bac1e2dcd551c4"
+SRC_URI[sha256sum] = "b70898527c73f9758f551bbab612af611b8a0962202829568d94f3edf4d86098"
-- 
2.1.4


