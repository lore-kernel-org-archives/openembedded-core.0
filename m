Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D632371144
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 02:19:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O2Jh2t006659
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 19:19:43 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 23 Apr 2015 19:19:42 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 10:19:19 +0800
Message-ID: <1429841959-9823-3-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1429841959-9823-1-git-send-email-li.zhou@windriver.com>
References: <1429841959-9823-1-git-send-email-li.zhou@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH 3/3] libxfont: Security Advisory - libxfont - CVE-2015-1804
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
X-List-Received-Date: Fri, 24 Apr 2015 02:19:44 -0000
Content-Type: text/plain

bdfReadCharacters: ensure metrics fit into xCharInfo struct

We use 32-bit ints to read from the bdf file, but then try to stick
into a 16-bit int in the xCharInfo struct, so make sure they won't
overflow that range.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...acters-ensure-metrics-fit-into-xCharInfo-.patch |   76 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb   |    1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch
new file mode 100644
index 0000000..5187788
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch
@@ -0,0 +1,76 @@
+From 2351c83a77a478b49cba6beb2ad386835e264744 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 6 Mar 2015 22:54:58 -0800
+Subject: [PATCH] bdfReadCharacters: ensure metrics fit into xCharInfo struct
+ [CVE-2015-1804]
+
+We use 32-bit ints to read from the bdf file, but then try to stick
+into a 16-bit int in the xCharInfo struct, so make sure they won't
+overflow that range.
+
+Found by afl-1.24b.
+
+v2: Verify that additions won't overflow 32-bit int range either.
+v3: As Julien correctly observes, the previous check for bh & bw not
+    being < 0 reduces the number of cases we need to check for overflow.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+---
+ src/bitmap/bdfread.c |   26 ++++++++++++++++++++++++--
+ 1 file changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/src/bitmap/bdfread.c b/src/bitmap/bdfread.c
+index 1b29b81..a0ace8f 100644
+--- a/src/bitmap/bdfread.c
++++ b/src/bitmap/bdfread.c
+@@ -62,8 +62,16 @@ from The Open Group.
+ 
+ #if HAVE_STDINT_H
+ #include <stdint.h>
+-#elif !defined(INT32_MAX)
+-#define INT32_MAX 0x7fffffff
++#else
++# ifndef INT32_MAX
++#  define INT32_MAX 0x7fffffff
++# endif
++# ifndef INT16_MAX
++#  define INT16_MAX 0x7fff
++# endif
++# ifndef INT16_MIN
++#  define INT16_MIN (0 - 0x8000)
++# endif
+ #endif
+ 
+ #define INDICES 256
+@@ -417,6 +425,12 @@ bdfReadCharacters(FontFilePtr file, FontPtr pFont, bdfFileState *pState,
+ 	    bdfError("DWIDTH y value must be zero\n");
+ 	    goto BAILOUT;
+ 	}
++	/* xCharInfo metrics are stored as INT16 */
++	if ((wx < 0) || (wx > INT16_MAX)) {
++	    bdfError("character '%s' has out of range width, %d\n",
++		     charName, wx);
++	    goto BAILOUT;
++	}
+ 	line = bdfGetLine(file, lineBuf, BDFLINELEN);
+ 	if ((!line) || (sscanf((char *) line, "BBX %d %d %d %d", &bw, &bh, &bl, &bb) != 4)) {
+ 	    bdfError("bad 'BBX'\n");
+@@ -427,6 +441,14 @@ bdfReadCharacters(FontFilePtr file, FontPtr pFont, bdfFileState *pState,
+ 		     charName, bw, bh);
+ 	    goto BAILOUT;
+ 	}
++	/* xCharInfo metrics are read as int, but stored as INT16 */
++	if ((bl > INT16_MAX) || (bl < INT16_MIN) ||
++	    (bb > INT16_MAX) || (bb < INT16_MIN) ||
++	    (bw > (INT16_MAX - bl)) || (bh > (INT16_MAX - bb))) {
++	    bdfError("character '%s' has out of range metrics, %d %d %d %d\n",
++		     charName, bl, (bl+bw), (bh+bb), -bb);
++	    goto BAILOUT;
++	}
+ 	line = bdfGetLine(file, lineBuf, BDFLINELEN);
+ 	if ((line) && (bdfIsPrefix(line, "ATTRIBUTES"))) {
+ 	    for (p = line + strlen("ATTRIBUTES ");
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
index 64ec6a3..dfd2dc6 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
@@ -20,6 +20,7 @@ BBCLASSEXTEND = "native"
 
 SRC_URI += "file://0001-bdfReadProperties-property-count-needs-range-check-C.patch \
             file://0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch \
+            file://0001-bdfReadCharacters-ensure-metrics-fit-into-xCharInfo-.patch \
            "
 
 SRC_URI[md5sum] = "664629bfa7cdf8b984155019fd395dcb"
-- 
1.7.9.5


