Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3b9y-0004NH-IX
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTnh6026771
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:49 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:48 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:29 -0600
Message-ID: <4e1b2c3b25f9dcffd220fef7f1e654def7c704cc.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 02/18] Security Advisory - libexif - CVE-2012-2813
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
X-List-Received-Date: Thu, 07 Feb 2013 23:45:43 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

[ CQID: WIND00366808 ]

The exif_convert_utf16_to_utf8 function in exif-entry.c in the EXIF
Tag Parsing Library (aka libexif) before 0.6.21 allows remote attackers
to cause a denial of service (out-of-bounds read) or possibly obtain
sensitive information from process memory via crafted EXIF tags in an image.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libexif/0001-libexif-CVE-2012-2813.patch       | 33 ++++++++++++++++++++++
 meta/recipes-support/libexif/libexif_0.6.20.bb     |  5 +++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/0001-libexif-CVE-2012-2813.patch

diff --git a/meta/recipes-support/libexif/libexif/0001-libexif-CVE-2012-2813.patch b/meta/recipes-support/libexif/libexif/0001-libexif-CVE-2012-2813.patch
new file mode 100644
index 0000000..fbd0442
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0001-libexif-CVE-2012-2813.patch
@@ -0,0 +1,33 @@
+Index: libexif/exif-entry.c
+===================================================================
+RCS file: /cvsroot/libexif/libexif/libexif/exif-entry.c,v
+retrieving revision 1.146
+retrieving revision 1.147
+diff -c -u -r1.146 -r1.147
+--- a/libexif/exif-entry.c	12 Jul 2012 17:10:34 -0000	1.146
++++ b/libexif/exif-entry.c	12 Jul 2012 17:12:24 -0000	1.147
+@@ -1346,10 +1346,23 @@
+ 	case EXIF_TAG_XP_AUTHOR:
+ 	case EXIF_TAG_XP_KEYWORDS:
+ 	case EXIF_TAG_XP_SUBJECT:
++	{
++		/* Sanity check the size to prevent overflow */
++		if (e->size+sizeof(unsigned short) < e->size) break;
++
++		/* The tag may not be U+0000-terminated , so make a local
++		   U+0000-terminated copy before converting it */
++		unsigned short *utf16 = exif_mem_alloc (e->priv->mem, e->size+sizeof(unsigned short));
++		if (!utf16) break;
++		memcpy(utf16, e->data, e->size);
++		utf16[e->size/sizeof(unsigned short)] = 0;
++
+ 		/* Warning! The texts are converted from UTF16 to UTF8 */
+ 		/* FIXME: use iconv to convert into the locale encoding */
+-		exif_convert_utf16_to_utf8(val, (unsigned short*)e->data, MIN(maxlen, e->size));
++		exif_convert_utf16_to_utf8(val, utf16, maxlen);
++		exif_mem_free(e->priv->mem, utf16);
+ 		break;
++	}
+ 
+ 	default:
+ 		/* Use a generic value formatting */
diff --git a/meta/recipes-support/libexif/libexif_0.6.20.bb b/meta/recipes-support/libexif/libexif_0.6.20.bb
index f233d3f..a1a1816 100644
--- a/meta/recipes-support/libexif/libexif_0.6.20.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.20.bb
@@ -4,7 +4,10 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
+	  file://0001-libexif-CVE-2012-2813.patch"
 
 SRC_URI[md5sum] = "19844ce6b5d075af16f0d45de1e8a6a3"
 SRC_URI[sha256sum] = "a772d20bd8fb9802d7f0d70fde6ac8872f87d0c66c52b0d14026dafcaa83d715"
-- 
1.8.1.2.545.g2f19ada



