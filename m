Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5678071AAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:27:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q8R2Fw012363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 01:27:02 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 26 Oct 2016 01:27:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 16:26:45 +0800
Message-ID: <05818eeba3a820e51c8e1428123a5e826301d9de.1477470209.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477470209.git.yi.zhao@windriver.com>
References: <cover.1477470209.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 2/5] tiff: Security fix CVE-2016-3990
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
X-List-Received-Date: Wed, 26 Oct 2016 08:27:01 -0000
Content-Type: text/plain

CVE-2016-3990 libtiff: Heap-based buffer overflow in the
horizontalDifference8 function in tif_pixarlog.c in LibTIFF 4.0.6 and
earlier allows remote attackers to cause a denial of service (crash) or
execute arbitrary code via a crafted TIFF image to tiffcp.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3990
http://bugzilla.maptools.org/show_bug.cgi?id=2544

Patch from:
https://github.com/vadz/libtiff/commit/6a4dbb07ccf92836bb4adac7be4575672d0ac5f1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-3990.patch              | 66 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
new file mode 100644
index 0000000..7bf52ee
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
@@ -0,0 +1,66 @@
+From 6a4dbb07ccf92836bb4adac7be4575672d0ac5f1 Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Mon, 15 Aug 2016 20:49:48 +0000
+Subject: [PATCH] * libtiff/tif_pixarlog.c: Fix write buffer overflow in
+ PixarLogEncode if more input samples are provided than expected by
+ PixarLogSetupEncode. Idea based on libtiff-CVE-2016-3990.patch from
+ libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, but with different and
+ simpler check. (bugzilla #2544)
+
+invalid tests that rejected valid files. (bugzilla #2545)
+
+CVE: CVE-2016-3990
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/6a4dbb07ccf92836bb4adac7be4575672d0ac5f1
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ ChangeLog              | 10 +++++++++-
+ libtiff/tif_pixarlog.c |  7 +++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 9c0ab29..db4ea18 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,10 +1,18 @@
+ 2016-08-15 Even Rouault <even.rouault at spatialys.com>
+ 
++	* libtiff/tif_pixarlog.c: Fix write buffer overflow in PixarLogEncode
++	if more input samples are provided than expected by PixarLogSetupEncode.
++	Idea based on libtiff-CVE-2016-3990.patch from
++	libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, but with different and
++	simpler check. (bugzilla #2544)
++
++2016-08-15 Even Rouault <even.rouault at spatialys.com>
++
+ 	* tools/tiff2rgba.c: Fix integer overflow in size of allocated
+ 	buffer, when -b mode is enabled, that could result in out-of-bounds
+ 	write. Based initially on patch tiff-CVE-2016-3945.patch from
+ 	libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction for
+-	invalid tests that rejected valid files.
++	invalid tests that rejected valid files. (bugzilla #2545)
+ 
+ 2016-07-11 Even Rouault <even.rouault at spatialys.com>
+ 
+diff --git a/libtiff/tif_pixarlog.c b/libtiff/tif_pixarlog.c
+index e78f788..28329d1 100644
+--- a/libtiff/tif_pixarlog.c
++++ b/libtiff/tif_pixarlog.c
+@@ -1141,6 +1141,13 @@ PixarLogEncode(TIFF* tif, uint8* bp, tmsize_t cc, uint16 s)
+ 	}
+ 
+ 	llen = sp->stride * td->td_imagewidth;
++    /* Check against the number of elements (of size uint16) of sp->tbuf */
++    if( n > td->td_rowsperstrip * llen )
++    {
++        TIFFErrorExt(tif->tif_clientdata, module,
++                     "Too many input bytes provided");
++        return 0;
++    }
+ 
+ 	for (i = 0, up = sp->tbuf; i < n; i += llen, up += llen) {
+ 		switch (sp->user_datafmt)  {
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index b978528..dfb2996 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-5321.patch \
            file://CVE-2016-5323.patch \
            file://CVE-2016-3945.patch \
+           file://CVE-2016-3990.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


