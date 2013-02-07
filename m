Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bA0-0004NS-Qf
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTrKM006240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:53 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:50 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:32 -0600
Message-ID: <a1aaa76c0be9b565e248ab15a2dbc7eacd90b593.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 05/18] Security Advisory - libexif - CVE-2012-2836
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 23:45:45 -0000
X-List-Received-Date: Thu, 07 Feb 2013 23:45:45 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

[ CQID: WIND00366788 ]

The exif_data_load_data function in exif-data.c in the EXIF Tag
Parsing Library (aka libexif) before 0.6.21 allows remote attackers
to cause a denial of service (out-of-bounds read) or possibly
obtain sensitive information from process memory via crafted EXIF
tags in an image.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libexif/0004-libexif-CVE-2012-2836.patch       | 140 +++++++++++++++++++++
 meta/recipes-support/libexif/libexif_0.6.20.bb     |   3 +-
 2 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/0004-libexif-CVE-2012-2836.patch

diff --git a/meta/recipes-support/libexif/libexif/0004-libexif-CVE-2012-2836.patch b/meta/recipes-support/libexif/libexif/0004-libexif-CVE-2012-2836.patch
new file mode 100644
index 0000000..430e35c
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0004-libexif-CVE-2012-2836.patch
@@ -0,0 +1,140 @@
+Index: libexif/exif-data.c
+===================================================================
+RCS file: /cvsroot/libexif/libexif/libexif/exif-data.c,v
+retrieving revision 1.129
+retrieving revision 1.131
+diff -c -u -r1.129 -r1.131
+--- a/libexif/exif-data.c	8 Oct 2010 06:50:19 -0000	1.129
++++ b/libexif/exif-data.c	12 Jul 2012 17:28:26 -0000	1.131
+@@ -781,15 +781,15 @@
+ 
+ void
+ exif_data_load_data (ExifData *data, const unsigned char *d_orig,
+-		     unsigned int ds_orig)
++		     unsigned int ds)
+ {
+ 	unsigned int l;
+ 	ExifLong offset;
+ 	ExifShort n;
+ 	const unsigned char *d = d_orig;
+-	unsigned int ds = ds_orig, len;
++	unsigned int len, fullds;
+ 
+-	if (!data || !data->priv || !d || !ds) 
++	if (!data || !data->priv || !d || !ds)
+ 		return;
+ 
+ 	exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+@@ -807,21 +807,21 @@
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+ 			  "Found EXIF header.");
+ 	} else {
+-		while (1) {
+-			while ((d[0] == 0xff) && ds) {
++		while (ds >= 3) {
++			while (ds && (d[0] == 0xff)) {
+ 				d++;
+ 				ds--;
+ 			}
+ 
+ 			/* JPEG_MARKER_SOI */
+-			if (d[0] == JPEG_MARKER_SOI) {
++			if (ds && d[0] == JPEG_MARKER_SOI) {
+ 				d++;
+ 				ds--;
+ 				continue;
+ 			}
+ 
+ 			/* JPEG_MARKER_APP0 */
+-			if (d[0] == JPEG_MARKER_APP0) {
++			if (ds >= 3 && d[0] == JPEG_MARKER_APP0) {
+ 				d++;
+ 				ds--;
+ 				l = (d[0] << 8) | d[1];
+@@ -833,7 +833,7 @@
+ 			}
+ 
+ 			/* JPEG_MARKER_APP1 */
+-			if (d[0] == JPEG_MARKER_APP1)
++			if (ds && d[0] == JPEG_MARKER_APP1)
+ 				break;
+ 
+ 			/* Unknown marker or data. Give up. */
+@@ -841,12 +841,12 @@
+ 				  "ExifData", _("EXIF marker not found."));
+ 			return;
+ 		}
+-		d++;
+-		ds--;
+-		if (ds < 2) {
++		if (ds < 3) {
+ 			LOG_TOO_SMALL;
+ 			return;
+ 		}
++		d++;
++		ds--;
+ 		len = (d[0] << 8) | d[1];
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+ 			  "We have to deal with %i byte(s) of EXIF data.",
+@@ -872,9 +872,18 @@
+ 	exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+ 		  "Found EXIF header.");
+ 
+-	/* Byte order (offset 6, length 2) */
++	/* Sanity check the data length */
+ 	if (ds < 14)
+ 		return;
++
++	/* The JPEG APP1 section can be no longer than 64 KiB (including a
++	   16-bit length), so cap the data length to protect against overflow
++	   in future offset calculations */
++	fullds = ds;
++	if (ds > 0xfffe)
++		ds = 0xfffe;
++
++	/* Byte order (offset 6, length 2) */
+ 	if (!memcmp (d + 6, "II", 2))
+ 		data->priv->order = EXIF_BYTE_ORDER_INTEL;
+ 	else if (!memcmp (d + 6, "MM", 2))
+@@ -894,24 +903,25 @@
+ 	exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", 
+ 		  "IFD 0 at %i.", (int) offset);
+ 
++	/* Sanity check the offset, being careful about overflow */
++	if (offset > ds || offset + 6 + 2 > ds)
++		return;
++
+ 	/* Parse the actual exif data (usually offset 14 from start) */
+ 	exif_data_load_data_content (data, EXIF_IFD_0, d + 6, ds - 6, offset, 0);
+ 
+ 	/* IFD 1 offset */
+-	if (offset + 6 + 2 > ds) {
+-		return;
+-	}
+ 	n = exif_get_short (d + 6 + offset, data->priv->order);
+-	if (offset + 6 + 2 + 12 * n + 4 > ds) {
++	if (offset + 6 + 2 + 12 * n + 4 > ds)
+ 		return;
+-	}
++
+ 	offset = exif_get_long (d + 6 + offset + 2 + 12 * n, data->priv->order);
+ 	if (offset) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+ 			  "IFD 1 at %i.", (int) offset);
+ 
+ 		/* Sanity check. */
+-		if (offset > ds - 6) {
++		if (offset > ds || offset + 6 > ds) {
+ 			exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA,
+ 				  "ExifData", "Bogus offset of IFD1.");
+ 		} else {
+@@ -925,7 +935,7 @@
+ 	 * space between IFDs. Here is the only place where we have access
+ 	 * to that data.
+ 	 */
+-	interpret_maker_note(data, d, ds);
++	interpret_maker_note(data, d, fullds);
+ 
+ 	/* Fixup tags if requested */
+ 	if (data->priv->options & EXIF_DATA_OPTION_FOLLOW_SPECIFICATION)
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.20.bb b/meta/recipes-support/libexif/libexif_0.6.20.bb
index 7d8f8fd..25de763 100644
--- a/meta/recipes-support/libexif/libexif_0.6.20.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.20.bb
@@ -9,7 +9,8 @@ PR = "r1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
 	  file://0001-libexif-CVE-2012-2813.patch \
 	  file://0002-libexif-CVE-2012-2812.patch \
-	  file://0003-libexif-CVE-2012-2841.patch"
+	  file://0003-libexif-CVE-2012-2841.patch \
+	  file://0004-libexif-CVE-2012-2836.patch"
 
 SRC_URI[md5sum] = "19844ce6b5d075af16f0d45de1e8a6a3"
 SRC_URI[sha256sum] = "a772d20bd8fb9802d7f0d70fde6ac8872f87d0c66c52b0d14026dafcaa83d715"
-- 
1.8.1.2.545.g2f19ada



