Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82DED71144
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 02:19:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3O2Jd5r025797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 19:19:39 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 23 Apr 2015 19:19:39 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 10:19:18 +0800
Message-ID: <1429841959-9823-2-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1429841959-9823-1-git-send-email-li.zhou@windriver.com>
References: <1429841959-9823-1-git-send-email-li.zhou@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH 2/3] libxfont: Security Advisory - libxfont - CVE-2015-1803
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
X-List-Received-Date: Fri, 24 Apr 2015 02:19:42 -0000
Content-Type: text/plain

bdfReadCharacters: bailout if a char's bitmap cannot be read

Previously would charge on ahead with a NULL pointer in ci->bits, and
then crash later in FontCharInkMetrics() trying to access the bits.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...acters-bailout-if-a-char-s-bitmap-cannot-.patch |   36 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb   |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch
new file mode 100644
index 0000000..05ab7af
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch
@@ -0,0 +1,36 @@
+From 78c2e3d70d29698244f70164428bd2868c0ab34c Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 6 Feb 2015 15:54:00 -0800
+Subject: [PATCH] bdfReadCharacters: bailout if a char's bitmap cannot be read
+ [CVE-2015-1803]
+
+Previously would charge on ahead with a NULL pointer in ci->bits, and
+then crash later in FontCharInkMetrics() trying to access the bits.
+
+Found with afl-1.23b.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+---
+ src/bitmap/bdfread.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/bitmap/bdfread.c b/src/bitmap/bdfread.c
+index 6387908..1b29b81 100644
+--- a/src/bitmap/bdfread.c
++++ b/src/bitmap/bdfread.c
+@@ -458,7 +458,10 @@ bdfReadCharacters(FontFilePtr file, FontPtr pFont, bdfFileState *pState,
+ 	    ci->metrics.descent = -bb;
+ 	    ci->metrics.characterWidth = wx;
+ 	    ci->bits = NULL;
+-	    bdfReadBitmap(ci, file, bit, byte, glyph, scan, bitmapsSizes);
++	    if (!bdfReadBitmap(ci, file, bit, byte, glyph, scan, bitmapsSizes)) {
++		bdfError("could not read bitmap for character '%s'\n", charName);
++		goto BAILOUT;
++	    }
+ 	    ci++;
+ 	    ndx++;
+ 	} else
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
index 4a3c9b7..64ec6a3 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
@@ -19,6 +19,7 @@ XORG_PN = "libXfont"
 BBCLASSEXTEND = "native"
 
 SRC_URI += "file://0001-bdfReadProperties-property-count-needs-range-check-C.patch \
+            file://0001-bdfReadCharacters-bailout-if-a-char-s-bitmap-cannot-.patch \
            "
 
 SRC_URI[md5sum] = "664629bfa7cdf8b984155019fd395dcb"
-- 
1.7.9.5


