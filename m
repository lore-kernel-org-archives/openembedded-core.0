Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B77A771F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:11:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A7Bmro016929
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Aug 2016 00:11:49 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 10 Aug 2016 00:11:48 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2016 15:11:20 +0800
Message-ID: <5215c84af52388404946f6091213c24e99055a00.1470812191.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1470812191.git.yi.zhao@windriver.com>
References: <cover.1470812191.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Cc: akuster@mvista.com
Subject: [PATCH 5/5] tiff: Security fix CVE-2016-5323
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
X-List-Received-Date: Wed, 10 Aug 2016 07:11:48 -0000
Content-Type: text/plain

CVE-2016-5323 libtiff: a maliciously crafted TIFF file could cause the
application to crash when using tiffcrop command

External References:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5323
http://bugzilla.maptools.org/show_bug.cgi?id=2559

Patch from:
https://github.com/vadz/libtiff/commit/2f79856097f423eb33796a15fcf700d2ea41bf31

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-5323.patch              | 107 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
new file mode 100644
index 0000000..41eab91
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
@@ -0,0 +1,107 @@
+From 2f79856097f423eb33796a15fcf700d2ea41bf31 Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Mon, 11 Jul 2016 21:38:31 +0000
+Subject: [PATCH 2/2] (CVE-2016-5321 / CVE-2016-5323 , bugzilla #2558 / #2559)
+
+CVE: CVE-2016-5323
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/2f79856097f423eb33796a15fcf700d2ea41bf31
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ ChangeLog        |  2 +-
+ tools/tiffcrop.c | 16 ++++++++--------
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 4e0302f..62dc1b5 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -3,7 +3,7 @@
+ 	* tools/tiffcrop.c: Avoid access outside of stack allocated array
+ 	on a tiled separate TIFF with more than 8 samples per pixel.
+ 	Reported by Kaixiang Zhang of the Cloud Security Team, Qihoo 360
+-	(CVE-2016-5321, bugzilla #2558)
++	(CVE-2016-5321 / CVE-2016-5323 , bugzilla #2558 / #2559)
+ 
+ 2016-07-10 Even Rouault <even.rouault at spatialys.com>
+ 
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 6fc8fc1..27abc0b 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -3738,7 +3738,7 @@ combineSeparateSamples8bits (uint8 *in[], uint8 *out, uint32 cols,
+ 
+       matchbits = maskbits << (8 - src_bit - bps); 
+       /* load up next sample from each plane */
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+         {
+ 	src = in[s] + src_offset + src_byte;
+         buff1 = ((*src) & matchbits) << (src_bit);
+@@ -3837,7 +3837,7 @@ combineSeparateSamples16bits (uint8 *in[], uint8 *out, uint32 cols,
+       src_bit  = bit_offset % 8;
+ 
+       matchbits = maskbits << (16 - src_bit - bps); 
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+         {
+ 	src = in[s] + src_offset + src_byte;
+         if (little_endian)
+@@ -3947,7 +3947,7 @@ combineSeparateSamples24bits (uint8 *in[], uint8 *out, uint32 cols,
+       src_bit  = bit_offset % 8;
+ 
+       matchbits = maskbits << (32 - src_bit - bps); 
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+         {
+ 	src = in[s] + src_offset + src_byte;
+         if (little_endian)
+@@ -4073,7 +4073,7 @@ combineSeparateSamples32bits (uint8 *in[], uint8 *out, uint32 cols,
+       src_bit  = bit_offset % 8;
+ 
+       matchbits = maskbits << (64 - src_bit - bps); 
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+ 	{
+ 	src = in[s] + src_offset + src_byte;
+ 	if (little_endian)
+@@ -4263,7 +4263,7 @@ combineSeparateTileSamples8bits (uint8 *in[], uint8 *out, uint32 cols,
+ 
+       matchbits = maskbits << (8 - src_bit - bps); 
+       /* load up next sample from each plane */
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+         {
+ 	src = in[s] + src_offset + src_byte;
+         buff1 = ((*src) & matchbits) << (src_bit);
+@@ -4362,7 +4362,7 @@ combineSeparateTileSamples16bits (uint8 *in[], uint8 *out, uint32 cols,
+       src_bit  = bit_offset % 8;
+ 
+       matchbits = maskbits << (16 - src_bit - bps); 
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+         {
+ 	src = in[s] + src_offset + src_byte;
+         if (little_endian)
+@@ -4471,7 +4471,7 @@ combineSeparateTileSamples24bits (uint8 *in[], uint8 *out, uint32 cols,
+       src_bit  = bit_offset % 8;
+ 
+       matchbits = maskbits << (32 - src_bit - bps); 
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+         {
+ 	src = in[s] + src_offset + src_byte;
+         if (little_endian)
+@@ -4597,7 +4597,7 @@ combineSeparateTileSamples32bits (uint8 *in[], uint8 *out, uint32 cols,
+       src_bit  = bit_offset % 8;
+ 
+       matchbits = maskbits << (64 - src_bit - bps); 
+-      for (s = 0; s < spp; s++)
++      for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+ 	{
+ 	src = in[s] + src_offset + src_byte;
+ 	if (little_endian)
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 63df126..83d88df 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -10,6 +10,7 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2015-8784.patch \
            file://CVE-2016-3186.patch \
            file://CVE-2016-5321.patch \
+           file://CVE-2016-5323.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


