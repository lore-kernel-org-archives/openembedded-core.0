Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC5D700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:11:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7A7BbUn006602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 10 Aug 2016 00:11:38 -0700
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 10 Aug 2016 00:11:34 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2016 15:11:17 +0800
Message-ID: <5256fae948ce47369f21a06d992f093e4745571e.1470812191.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1470812191.git.yi.zhao@windriver.com>
References: <cover.1470812191.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Cc: akuster@mvista.com
Subject: [PATCH 2/5] tiff: Security fix CVE-2015-8784
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
X-List-Received-Date: Wed, 10 Aug 2016 07:11:38 -0000
Content-Type: text/plain

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8784 libtiff: out-of-bound write in NeXTDecode()

External Reference:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8784

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2015-8784.patch              | 73 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch b/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
new file mode 100644
index 0000000..0caf800
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
@@ -0,0 +1,73 @@
+From b18012dae552f85dcc5c57d3bf4e997a15b1cc1c Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Sun, 27 Dec 2015 16:55:20 +0000
+Subject: [PATCH] * libtiff/tif_next.c: fix potential out-of-bound write in
+ NeXTDecode() triggered by http://lcamtuf.coredump.cx/afl/vulns/libtiff5.tif
+ (bugzilla #2508)
+
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/b18012dae552f85dcc5c57d3bf4e997a15b1cc1c
+hand applied Changelog changes
+
+CVE:  CVE-2015-8784
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog          |  6 ++++++
+ libtiff/tif_next.c | 10 ++++++++--
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+Index: tiff-4.0.4/ChangeLog
+===================================================================
+--- tiff-4.0.4.orig/ChangeLog
++++ tiff-4.0.4/ChangeLog
+@@ -1,5 +1,11 @@
+ 2015-12-27  Even Rouault <even.rouault at spatialys.com>
+ 
++	* libtiff/tif_next.c: fix potential out-of-bound write in NeXTDecode()
++	triggered by http://lcamtuf.coredump.cx/afl/vulns/libtiff5.tif
++	(bugzilla #2508)
++
++2015-12-27  Even Rouault <even.rouault at spatialys.com>
++
+ 	* libtiff/tif_luv.c: fix potential out-of-bound writes in decode
+ 	functions in non debug builds by replacing assert()s by regular if
+ 	checks (bugzilla #2522).
+Index: tiff-4.0.4/libtiff/tif_next.c
+===================================================================
+--- tiff-4.0.4.orig/libtiff/tif_next.c
++++ tiff-4.0.4/libtiff/tif_next.c
+@@ -37,7 +37,7 @@
+ 	case 0:	op[0]  = (unsigned char) ((v) << 6); break;	\
+ 	case 1:	op[0] |= (v) << 4; break;	\
+ 	case 2:	op[0] |= (v) << 2; break;	\
+-	case 3:	*op++ |= (v);	   break;	\
++	case 3:	*op++ |= (v);	   op_offset++; break;	\
+ 	}					\
+ }
+ 
+@@ -106,6 +106,7 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize
+ 			uint32 imagewidth = tif->tif_dir.td_imagewidth;
+             if( isTiled(tif) )
+                 imagewidth = tif->tif_dir.td_tilewidth;
++            tmsize_t op_offset = 0;
+ 
+ 			/*
+ 			 * The scanline is composed of a sequence of constant
+@@ -122,10 +123,15 @@ NeXTDecode(TIFF* tif, uint8* buf, tmsize
+ 				 * bounds, potentially resulting in a security
+ 				 * issue.
+ 				 */
+-				while (n-- > 0 && npixels < imagewidth)
++				while (n-- > 0 && npixels < imagewidth && op_offset < scanline)
+ 					SETPIXEL(op, grey);
+ 				if (npixels >= imagewidth)
+ 					break;
++                if (op_offset >= scanline ) {
++                    TIFFErrorExt(tif->tif_clientdata, module, "Invalid data for scanline %ld",
++                        (long) tif->tif_row);
++                    return (0);
++                }
+ 				if (cc == 0)
+ 					goto bad;
+ 				n = *bp++, cc--;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 9879c8b..0506475 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -7,6 +7,7 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
            file://CVE-2015-8665_8683.patch \
            file://CVE-2015-8781.patch \
+           file://CVE-2015-8784.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


