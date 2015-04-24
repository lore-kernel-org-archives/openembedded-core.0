Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A637571144
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 02:19:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O2JXE9006653
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 19:19:33 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 23 Apr 2015 19:19:33 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 10:19:17 +0800
Message-ID: <1429841959-9823-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH 1/3] libxfont: Security Advisory - libxfont - CVE-2015-1802
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
X-List-Received-Date: Fri, 24 Apr 2015 02:19:35 -0000
Content-Type: text/plain

bdfReadProperties: property count needs range check

Avoid integer overflow or underflow when allocating memory arrays
by multiplying the number of properties reported for a BDF font.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...erties-property-count-needs-range-check-C.patch |   38 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb   |    3 ++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch
new file mode 100644
index 0000000..0779c26
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0001-bdfReadProperties-property-count-needs-range-check-C.patch
@@ -0,0 +1,38 @@
+From 2deda9906480f9c8ae07b8c2a5510cc7e4c59a8e Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 6 Feb 2015 15:50:45 -0800
+Subject: [PATCH] bdfReadProperties: property count needs range check
+ [CVE-2015-1802]
+
+Avoid integer overflow or underflow when allocating memory arrays
+by multiplying the number of properties reported for a BDF font.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/bitmap/bdfread.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/bitmap/bdfread.c b/src/bitmap/bdfread.c
+index 914a024..6387908 100644
+--- a/src/bitmap/bdfread.c
++++ b/src/bitmap/bdfread.c
+@@ -604,7 +604,9 @@ bdfReadProperties(FontFilePtr file, FontPtr pFont, bdfFileState *pState)
+ 	bdfError("missing 'STARTPROPERTIES'\n");
+ 	return (FALSE);
+     }
+-    if (sscanf((char *) line, "STARTPROPERTIES %d", &nProps) != 1) {
++    if ((sscanf((char *) line, "STARTPROPERTIES %d", &nProps) != 1) ||
++	(nProps <= 0) ||
++	(nProps > ((INT32_MAX / sizeof(FontPropRec)) - BDF_GENPROPS))) {
+ 	bdfError("bad 'STARTPROPERTIES'\n");
+ 	return (FALSE);
+     }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
index ef0bde2..4a3c9b7 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.0.bb
@@ -18,5 +18,8 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://0001-bdfReadProperties-property-count-needs-range-check-C.patch \
+           "
+
 SRC_URI[md5sum] = "664629bfa7cdf8b984155019fd395dcb"
 SRC_URI[sha256sum] = "3a3c52c4adf9352b2160f07ff0596af17ab14f91d6509564e606678a1261c25f"
-- 
1.7.9.5


