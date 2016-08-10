Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91D18771F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:11:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7A7BjAT006605
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 10 Aug 2016 00:11:45 -0700
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 10 Aug 2016 00:11:44 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2016 15:11:19 +0800
Message-ID: <c225764f3e16e2bb8864748227294855bac176d5.1470812191.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1470812191.git.yi.zhao@windriver.com>
References: <cover.1470812191.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Cc: akuster@mvista.com
Subject: [PATCH 4/5] tiff: Security fix CVE-2016-5321
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
X-List-Received-Date: Wed, 10 Aug 2016 07:11:44 -0000
Content-Type: text/plain

CVE-2016-5321 libtiff: a maliciously crafted TIFF file could cause the
application to crash when using tiffcrop command

External References:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5321
http://bugzilla.maptools.org/show_bug.cgi?id=2558

Patch from:
https://github.com/vadz/libtiff/commit/d9783e4a1476b6787a51c5ae9e9b3156527589f0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-5321.patch              | 49 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
new file mode 100644
index 0000000..63c6650
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
@@ -0,0 +1,49 @@
+From d9783e4a1476b6787a51c5ae9e9b3156527589f0 Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Mon, 11 Jul 2016 21:26:03 +0000
+Subject: [PATCH 1/2] * tools/tiffcrop.c: Avoid access outside of stack
+ allocated array on a tiled separate TIFF with more than 8 samples per pixel.
+ Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360
+ (CVE-2016-5321, bugzilla #2558)
+
+CVE: CVE-2016-5321
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/d9783e4a1476b6787a51c5ae9e9b3156527589f0
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ ChangeLog        | 7 +++++++
+ tools/tiffcrop.c | 2 +-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index e98d54d..4e0302f 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,10 @@
++2016-07-11 Even Rouault <even.rouault at spatialys.com>
++
++	* tools/tiffcrop.c: Avoid access outside of stack allocated array
++	on a tiled separate TIFF with more than 8 samples per pixel.
++	Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360
++	(CVE-2016-5321, bugzilla #2558)
++
+ 2015-12-27  Even Rouault <even.rouault at spatialys.com>
+
+	* libtiff/tif_next.c: fix potential out-of-bound write in NeXTDecode()
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index d959ae3..6fc8fc1 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -989,7 +989,7 @@ static int  readSeparateTilesIntoBuffer (TIFF* in, uint8 *obuf,
+     nrow = (row + tl > imagelength) ? imagelength - row : tl;
+     for (col = 0; col < imagewidth; col += tw)
+       {
+-      for (s = 0; s < spp; s++)
++      for (s = 0; s < spp && s < MAX_SAMPLES; s++)
+         {  /* Read each plane of a tile set into srcbuffs[s] */
+ 	tbytes = TIFFReadTile(in, srcbuffs[s], col, row, 0, s);
+         if (tbytes < 0  && !ignore)
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 36cb34e..63df126 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -9,6 +9,7 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2015-8781.patch \
            file://CVE-2015-8784.patch \
            file://CVE-2016-3186.patch \
+           file://CVE-2016-5321.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


