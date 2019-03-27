Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6651C65CE9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 13:40:40 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h4so2997244wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=LULkSiSmJWwEIQk3sXyis1Xd9tv1CZ1dfGWE4bprtIE=;
	b=pkMFBraC8xqpKv2cqx0z5oda9YEFtNtTn/tgVR90EzJWlSJKv7P+BORocprYKYb61N
	RB8kawTqIQkZpH5uGkro+bBrWOgBA5aGWVMV4fonETGJgqnxNe004UBe5dSJ2GLHkTJP
	cNnPEJyeGoQumFsBzoP+L3R6+UnHlClmjmTKQt2uyEUdgoRXlUhKyqhtGskWyVZrGGzZ
	L8zRhIn7k3EUKj/V3ot9J/o6m93MBP6MIbEFJtkkh3JE2sPkChvjEeDlcitij9eCypJ6
	Qmi2anK2H37S/zqL8GPMlNkW1i8cPuPAWX2gqI46u96ZHpvkdkUcK+ZRGVwSwvq/gksy
	8fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=LULkSiSmJWwEIQk3sXyis1Xd9tv1CZ1dfGWE4bprtIE=;
	b=kCyB0aTwRpCLUsYRdROb4QlQbXdi4MdStNpB1aaeKGqq2eafykIhy82exYargJWuXl
	fufbxhyZYPxhpxtr+a8Wn1X7qG36bkPozA0y5cJFyjGPCMUU7xALJuWUthehG6U8dRON
	bt3Qa/RidWtvb/NPhiM5AjPsYs5BxwZHxPZ6jPaqDrjvU38he1JJXAqU8fp8/uiDI+7S
	S8It7NEd39+yJGAHuyYl94TcC3hCdaKylAS7zC1Ycoii4PTgE2tkIuB46mVNiMY9B3MP
	QTpTRUBDxj0h9BpHcbrr3bOOz6X2BQIprLIy/3w0s2Uz65MRxyuW0K41+JtLuy7T/YYt
	A3fA==
X-Gm-Message-State: APjAAAV+wDPB7DEfFCa4V+Ad+puUyTsG+s6uFlKrtuh6i2fCY2Qc9sou
	sb4b0hH2EsB6VPybgSTDxIPWjIjEzyU=
X-Google-Smtp-Source: APXvYqz56F7z3XN5n8C0Xqd4Z1P1k87vOjm08/fGXu+FoEsOzKf8MKInZbt+2iUzV9nBIKFVCrjbig==
X-Received: by 2002:adf:f285:: with SMTP id k5mr4450245wro.110.1553694040651; 
	Wed, 27 Mar 2019 06:40:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h10sm32310477wrs.27.2019.03.27.06.40.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 06:40:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 13:40:38 +0000
Message-Id: <20190327134038.1450-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libexif: fix CVE-2016-6328 and CVE-2018-20030
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
X-List-Received-Date: Wed, 27 Mar 2019 13:40:40 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libexif/libexif/CVE-2016-6328.patch            |  64 ++++++++++++
 .../libexif/libexif/CVE-2018-20030.patch           | 115 +++++++++++++++++++++
 meta/recipes-support/libexif/libexif_0.6.21.bb     |   4 +-
 3 files changed, 182 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2018-20030.patch

diff --git a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch b/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
new file mode 100644
index 00000000000..a6f307439bf
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
@@ -0,0 +1,64 @@
+CVE: CVE-2016-6328
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 41bd04234b104312f54d25822f68738ba8d7133d Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Tue, 25 Jul 2017 23:44:44 +0200
+Subject: [PATCH] fixes some (not all) buffer overreads during decoding pentax
+ makernote entries.
+
+This should fix:
+https://sourceforge.net/p/libexif/bugs/125/ CVE-2016-6328
+---
+ libexif/pentax/mnote-pentax-entry.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/libexif/pentax/mnote-pentax-entry.c b/libexif/pentax/mnote-pentax-entry.c
+index d03d159..ea0429a 100644
+--- a/libexif/pentax/mnote-pentax-entry.c
++++ b/libexif/pentax/mnote-pentax-entry.c
+@@ -425,24 +425,34 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
+ 		case EXIF_FORMAT_SHORT:
+ 		  {
+ 			const unsigned char *data = entry->data;
+-		  	size_t k, len = strlen(val);
++		  	size_t k, len = strlen(val), sizeleft;
++
++			sizeleft = entry->size;
+ 		  	for(k=0; k<entry->components; k++) {
++				if (sizeleft < 2)
++					break;
+ 				vs = exif_get_short (data, entry->order);
+ 				snprintf (val+len, maxlen-len, "%i ", vs);
+ 				len = strlen(val);
+ 				data += 2;
++				sizeleft -= 2;
+ 			}
+ 		  }
+ 		  break;
+ 		case EXIF_FORMAT_LONG:
+ 		  {
+ 			const unsigned char *data = entry->data;
+-		  	size_t k, len = strlen(val);
++		  	size_t k, len = strlen(val), sizeleft;
++
++			sizeleft = entry->size;
+ 		  	for(k=0; k<entry->components; k++) {
++				if (sizeleft < 4)
++					break;
+ 				vl = exif_get_long (data, entry->order);
+ 				snprintf (val+len, maxlen-len, "%li", (long int) vl);
+ 				len = strlen(val);
+ 				data += 4;
++				sizeleft -= 4;
+ 			}
+ 		  }
+ 		  break;
+@@ -455,5 +465,5 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
+ 		break;
+ 	}
+ 
+-	return (val);
++	return val;
+ }
diff --git a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch b/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
new file mode 100644
index 00000000000..76233e6dc9b
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
@@ -0,0 +1,115 @@
+CVE: CVE-2018-20030
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 6aa11df549114ebda520dde4cdaea2f9357b2c89 Mon Sep 17 00:00:00 2001
+From: Dan Fandrich <dan@coneharvesters.com>
+Date: Fri, 12 Oct 2018 16:01:45 +0200
+Subject: [PATCH] Improve deep recursion detection in
+ exif_data_load_data_content.
+
+The existing detection was still vulnerable to pathological cases
+causing DoS by wasting CPU. The new algorithm takes the number of tags
+into account to make it harder to abuse by cases using shallow recursion
+but with a very large number of tags.  This improves on commit 5d28011c
+which wasn't sufficient to counter this kind of case.
+
+The limitation in the previous fix was discovered by Laurent Delosieres,
+Secunia Research at Flexera (Secunia Advisory SA84652) and is assigned
+the identifier CVE-2018-20030.
+
+diff --git a/libexif/exif-data.c b/libexif/exif-data.c
+index 67df4db..8d9897e 100644
+--- a/libexif/exif-data.c
++++ b/libexif/exif-data.c
+@@ -35,6 +35,7 @@
+ #include <libexif/olympus/exif-mnote-data-olympus.h>
+ #include <libexif/pentax/exif-mnote-data-pentax.h>
+ 
++#include <math.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -344,6 +345,20 @@ if (data->ifd[(i)]->count) {				\
+ 	break;						\
+ }
+ 
++/*! Calculate the recursion cost added by one level of IFD loading.
++ *
++ * The work performed is related to the cost in the exponential relation
++ *   work=1.1**cost
++ */
++static unsigned int
++level_cost(unsigned int n)
++{
++    static const double log_1_1 = 0.09531017980432493;
++
++	/* Adding 0.1 protects against the case where n==1 */
++	return ceil(log(n + 0.1)/log_1_1);
++}
++
+ /*! Load data for an IFD.
+  *
+  * \param[in,out] data #ExifData
+@@ -351,13 +366,13 @@ if (data->ifd[(i)]->count) {				\
+  * \param[in] d pointer to buffer containing raw IFD data
+  * \param[in] ds size of raw data in buffer at \c d
+  * \param[in] offset offset into buffer at \c d at which IFD starts
+- * \param[in] recursion_depth number of times this function has been
+- * recursively called without returning
++ * \param[in] recursion_cost factor indicating how expensive this recursive
++ * call could be
+  */
+ static void
+ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 			     const unsigned char *d,
+-			     unsigned int ds, unsigned int offset, unsigned int recursion_depth)
++			     unsigned int ds, unsigned int offset, unsigned int recursion_cost)
+ {
+ 	ExifLong o, thumbnail_offset = 0, thumbnail_length = 0;
+ 	ExifShort n;
+@@ -372,9 +387,20 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	if ((((int)ifd) < 0) || ( ((int)ifd) >= EXIF_IFD_COUNT))
+ 	  return;
+ 
+-	if (recursion_depth > 30) {
++	if (recursion_cost > 170) {
++		/*
++		 * recursion_cost is a logarithmic-scale indicator of how expensive this
++		 * recursive call might end up being. It is an indicator of the depth of
++		 * recursion as well as the potential for worst-case future recursive
++		 * calls. Since it's difficult to tell ahead of time how often recursion
++		 * will occur, this assumes the worst by assuming every tag could end up
++		 * causing recursion.
++		 * The value of 170 was chosen to limit typical EXIF structures to a
++		 * recursive depth of about 6, but pathological ones (those with very
++		 * many tags) to only 2.
++		 */
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
+-			  "Deep recursion detected!");
++			  "Deep/expensive recursion detected!");
+ 		return;
+ 	}
+ 
+@@ -416,15 +442,18 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 			switch (tag) {
+ 			case EXIF_TAG_EXIF_IFD_POINTER:
+ 				CHECK_REC (EXIF_IFD_EXIF);
+-				exif_data_load_data_content (data, EXIF_IFD_EXIF, d, ds, o, recursion_depth + 1);
++				exif_data_load_data_content (data, EXIF_IFD_EXIF, d, ds, o,
++					recursion_cost + level_cost(n));
+ 				break;
+ 			case EXIF_TAG_GPS_INFO_IFD_POINTER:
+ 				CHECK_REC (EXIF_IFD_GPS);
+-				exif_data_load_data_content (data, EXIF_IFD_GPS, d, ds, o, recursion_depth + 1);
++				exif_data_load_data_content (data, EXIF_IFD_GPS, d, ds, o,
++					recursion_cost + level_cost(n));
+ 				break;
+ 			case EXIF_TAG_INTEROPERABILITY_IFD_POINTER:
+ 				CHECK_REC (EXIF_IFD_INTEROPERABILITY);
+-				exif_data_load_data_content (data, EXIF_IFD_INTEROPERABILITY, d, ds, o, recursion_depth + 1);
++				exif_data_load_data_content (data, EXIF_IFD_INTEROPERABILITY, d, ds, o,
++					recursion_cost + level_cost(n));
+ 				break;
+ 			case EXIF_TAG_JPEG_INTERCHANGE_FORMAT:
+ 				thumbnail_offset = o;
diff --git a/meta/recipes-support/libexif/libexif_0.6.21.bb b/meta/recipes-support/libexif/libexif_0.6.21.bb
index a6c9c647c89..d847beab185 100644
--- a/meta/recipes-support/libexif/libexif_0.6.21.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.21.bb
@@ -5,7 +5,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
-           file://CVE-2017-7544.patch"
+           file://CVE-2017-7544.patch \
+           file://CVE-2016-6328.patch \
+           file://CVE-2018-20030.patch"
 
 SRC_URI[md5sum] = "27339b89850f28c8f1c237f233e05b27"
 SRC_URI[sha256sum] = "16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a"
-- 
2.11.0


