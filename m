Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bA1-0004Na-Oq
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTqAd026781
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:52 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:51 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:33 -0600
Message-ID: <4c9996feb315d714821ccadf4cb41ff1f063728a.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 06/18] Security Advisory - libexif - CVE-2012-2837
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
X-List-Received-Date: Thu, 07 Feb 2013 23:45:51 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

[ CQID: WIND00366798 ]

The mnote_olympus_entry_get_value function in olympus/mnote-olympus-entry.c
in the EXIF Tag Parsing Library (aka libexif) before 0.6.21 allows remote
attackers to cause a denial of service (divide-by-zero error) via an image
with crafted EXIF tags that are not properly handled during the formatting
of EXIF maker note tags.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libexif/0005-libexif-CVE-2012-2837.patch       | 114 +++++++++++++++++++++
 meta/recipes-support/libexif/libexif_0.6.20.bb     |   3 +-
 2 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/0005-libexif-CVE-2012-2837.patch

diff --git a/meta/recipes-support/libexif/libexif/0005-libexif-CVE-2012-2837.patch b/meta/recipes-support/libexif/libexif/0005-libexif-CVE-2012-2837.patch
new file mode 100644
index 0000000..7a6dd24
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0005-libexif-CVE-2012-2837.patch
@@ -0,0 +1,114 @@
+Index: libexif/olympus/mnote-olympus-entry.c
+===================================================================
+RCS file: /cvsroot/libexif/libexif/libexif/olympus/mnote-olympus-entry.c,v
+retrieving revision 1.54
+retrieving revision 1.55
+diff -c -u -r1.54 -r1.55
+--- a/libexif/olympus/mnote-olympus-entry.c	18 Apr 2011 23:46:33 -0000	1.54
++++ b/libexif/olympus/mnote-olympus-entry.c	12 Jul 2012 17:29:05 -0000	1.55
+@@ -76,6 +76,9 @@
+ 	}                                                               \
+ }
+ 
++#define R2L(n) ((n).denominator ? (long)(n).numerator/(n).denominator : 0L)
++#define R2D(n) ((n).denominator ? (double)(n).numerator/(n).denominator : 0.0)
++
+ static const struct {
+ 	ExifTag tag;
+ 	ExifFormat fmt;
+@@ -372,20 +375,20 @@
+ 		CF (entry->format, EXIF_FORMAT_RATIONAL, v, maxlen);
+ 		CC (entry->components, 4, v, maxlen);
+ 		vr = exif_get_rational (entry->data, entry->order);
+-		r = (double)vr.numerator / vr.denominator;
++		r = R2D(vr);
+ 		vr = exif_get_rational (entry->data+8, entry->order);
+-		b = (double)vr.numerator / vr.denominator;
++		b = R2D(vr);
+ 		snprintf (v, maxlen, _("Red Correction %f, blue Correction %f"), r,b);
+ 		break;
+ 	case MNOTE_NIKON_TAG_MANUALFOCUSDISTANCE:
+ 		CF (entry->format, EXIF_FORMAT_RATIONAL, v, maxlen);
+ 		CC (entry->components, 1, v, maxlen);
+ 		vr = exif_get_rational (entry->data, entry->order);
+-		if (vr.numerator) {
+-			r = (double)vr.numerator / vr.denominator;
+-			snprintf (v, maxlen, _("%2.2f meters"), r);
+-		} else {
++		if (!vr.numerator || !vr.denominator) {
+ 			strncpy (v, _("No manual focus selection"), maxlen);
++		} else {
++			r = R2D(vr);
++			snprintf (v, maxlen, _("%2.2f meters"), r);
+ 		}
+ 		break;
+ 	case MNOTE_NIKON_TAG_SENSORPIXELSIZE:
+@@ -393,8 +396,8 @@
+ 		CC (entry->components, 2, v, maxlen);
+ 		vr = exif_get_rational (entry->data, entry->order);
+ 		vr2 = exif_get_rational (entry->data+8, entry->order);
+-		r = (double)vr.numerator / vr.denominator;
+-		b = (double)vr2.numerator / vr2.denominator;
++		r = R2D(vr);
++		b = R2D(vr2);
+ 		snprintf (v, maxlen, "%2.2f x %2.2f um", r, b);
+ 		break;
+ 	case MNOTE_NIKON_TAG_BRACKETING:
+@@ -450,10 +453,10 @@
+ 		if (entry->format == EXIF_FORMAT_RATIONAL) {
+ 			CC (entry->components, 1, v, maxlen);
+ 			vr = exif_get_rational (entry->data, entry->order);
+-			if (!vr.numerator) {
++			if (!vr.numerator || !vr.denominator) {
+ 				strncpy (v, _("None"), maxlen);
+ 			} else {
+-				r = (double)vr.numerator / vr.denominator;
++				r = R2D(vr);
+ 				snprintf (v, maxlen, "%2.2f", r);
+ 			}
+ 			break;
+@@ -568,13 +571,13 @@
+ 			double c,d;
+ 			unsigned long a,b;
+ 			vr = exif_get_rational (entry->data, entry->order);
+-			a = vr.numerator / vr.denominator;
++			a = R2L(vr);
+ 			vr = exif_get_rational (entry->data+8, entry->order);
+-			b = vr.numerator / vr.denominator;
++			b = R2L(vr);
+ 			vr = exif_get_rational (entry->data+16, entry->order);
+-			c = (double)vr.numerator / vr.denominator;
++			c = R2D(vr);
+ 			vr = exif_get_rational (entry->data+24, entry->order);
+-			d = (double)vr.numerator / vr.denominator;
++			d = R2D(vr);
+ 			snprintf (v, maxlen, "%ld-%ldmm 1:%3.1f - %3.1f",a,b,c,d);
+ 		}
+ 		break;
+@@ -682,7 +685,7 @@
+ 		CF (entry->format, EXIF_FORMAT_RATIONAL, v, maxlen);
+ 		CC (entry->components, 1, v, maxlen);
+ 		vr = exif_get_rational (entry->data, entry->order);
+-		if (vr.numerator == 0) {
++		if (!vr.numerator || !vr.denominator) {
+ 			strncpy (v, _("Unknown"), maxlen);
+ 		}
+ 		else {
+@@ -793,7 +796,7 @@
+ 			if (!vr.denominator) {
+ 				strncpy (v, _("Infinite"), maxlen);
+ 			} else {
+-				r = (double)vr.numerator / vr.denominator;
++				r = R2D(vr);
+ 				snprintf (v, maxlen, "%2.3f", r);
+ 			}
+ 			break;
+@@ -803,7 +806,7 @@
+ 			if (!vsr.denominator) {
+ 				strncpy (v, _("Infinite"), maxlen);
+ 			} else {
+-				r = (double)vsr.numerator / vsr.denominator;
++				r = R2D(vsr);
+ 				snprintf (v, maxlen, "%2.3f", r);
+ 			}
+ 			break;
diff --git a/meta/recipes-support/libexif/libexif_0.6.20.bb b/meta/recipes-support/libexif/libexif_0.6.20.bb
index 25de763..6affc9e 100644
--- a/meta/recipes-support/libexif/libexif_0.6.20.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.20.bb
@@ -10,7 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
 	  file://0001-libexif-CVE-2012-2813.patch \
 	  file://0002-libexif-CVE-2012-2812.patch \
 	  file://0003-libexif-CVE-2012-2841.patch \
-	  file://0004-libexif-CVE-2012-2836.patch"
+	  file://0004-libexif-CVE-2012-2836.patch \
+	  file://0005-libexif-CVE-2012-2837.patch"
 
 SRC_URI[md5sum] = "19844ce6b5d075af16f0d45de1e8a6a3"
 SRC_URI[sha256sum] = "a772d20bd8fb9802d7f0d70fde6ac8872f87d0c66c52b0d14026dafcaa83d715"
-- 
1.8.1.2.545.g2f19ada



