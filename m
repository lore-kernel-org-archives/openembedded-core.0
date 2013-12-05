Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58FA46E208
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 23:01:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB5N1sC9018862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 15:01:54 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 15:01:53 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 17:01:18 -0600
Message-ID: <3f84c6a562ee8feaac46d384f23867cd007a999c.1386284385.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386284385.git.mark.hatle@windriver.com>
References: <cover.1386284385.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/6][dora] libtiff: CVE-2013-4243
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
X-List-Received-Date: Thu, 05 Dec 2013 23:01:54 -0000
Content-Type: text/plain

From: Baogen Shang <baogen.shang@windriver.com>

cve description:
Heap-based buffer overflow in the readgifimage function in the gif2tiff
tool in libtiff 4.0.3 and earlier allows remote attackers to cause a denial
of service (crash) and possibly execute arbitrary code via a crafted height
and width values in a GIF image.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4243

Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libtiff/files/libtiff-CVE-2013-4243.patch      | 40 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4243.patch

diff --git a/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4243.patch b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4243.patch
new file mode 100644
index 0000000..642a117
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4243.patch
@@ -0,0 +1,40 @@
+This patch comes from: http://bugzilla.maptools.org/attachment.cgi?id=518&action=diff#tools/gif2tiff.c_sec2
+
+Upstream-Status: Pending
+
+Signed-off-by: Baogen shang <baogen.shang@windriver.com>
+--- a/tools/gif2tiff.c	2013-10-14 17:08:43.966239709 +0800
++++ b/tools/gif2tiff.c	2013-10-14 17:18:22.994239638 +0800
+@@ -280,6 +280,10 @@
+         fprintf(stderr, "no colormap present for image\n");
+         return (0);
+     }
++    if (width == 0 || height == 0) {
++        fprintf(stderr, "Invalid value of width or height\n");
++        return(0);
++    }
+     if ((raster = (unsigned char*) _TIFFmalloc(width*height+EXTRAFUDGE)) == NULL) {
+         fprintf(stderr, "not enough memory for image\n");
+         return (0);
+@@ -397,6 +401,10 @@
+ 	return 1;
+     }
+ 
++    if (*fill >= raster + width*height) {
++        fprintf(stderr, "raster full before eoi code\n");
++        return 0;
++    }
+     if (oldcode == -1) {
+ 	*(*fill)++ = suffix[code];
+ 	firstchar = oldcode = code;
+@@ -428,6 +436,10 @@
+     }
+     oldcode = incode;
+     do {
++    if (*fill >= raster + width*height) {
++        fprintf(stderr, "raster full before eoi code\n");
++        return 0;
++    }
+ 	*(*fill)++ = *--stackp;
+     } while (stackp > stack);
+     return 1;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index f05682b..4a63920 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -8,7 +8,8 @@ PR = "r0"
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
            file://libtiff-CVE-2013-1960.patch \
-           file://libtiff-CVE-2013-4232.patch"
+           file://libtiff-CVE-2013-4232.patch \
+           file://libtiff-CVE-2013-4243.patch"
 
 SRC_URI[md5sum] = "051c1068e6a0627f461948c365290410"
 SRC_URI[sha256sum] = "ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872"
-- 
1.8.1.2.545.g2f19ada


