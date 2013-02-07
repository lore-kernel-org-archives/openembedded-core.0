Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3b9z-0004NL-TA
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NToX0026776
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:50 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:49 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:31 -0600
Message-ID: <32a676e0135cc4a7f3a24d882e88cc188457aa3a.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 04/18] Security Advisory - libexif - CVE-2012-2841
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
X-List-Received-Date: Thu, 07 Feb 2013 23:45:44 -0000
X-List-Received-Date: Thu, 07 Feb 2013 23:45:44 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

[ CQID: WIND00366809 ]

Integer underflow in the exif_entry_get_value function in exif-entry.c
in the EXIF Tag Parsing Library (aka libexif) 0.6.20 might allow remote
attackers to execute arbitrary code via vectors involving a crafted
buffer-size parameter during the formatting of an EXIF tag, leading to
a heap-based buffer overflow.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libexif/0003-libexif-CVE-2012-2841.patch       | 47 ++++++++++++++++++++++
 meta/recipes-support/libexif/libexif_0.6.20.bb     |  3 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/0003-libexif-CVE-2012-2841.patch

diff --git a/meta/recipes-support/libexif/libexif/0003-libexif-CVE-2012-2841.patch b/meta/recipes-support/libexif/libexif/0003-libexif-CVE-2012-2841.patch
new file mode 100644
index 0000000..2e2c949
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0003-libexif-CVE-2012-2841.patch
@@ -0,0 +1,47 @@
+Index: libexif/exif-entry.c
+===================================================================
+RCS file: /cvsroot/libexif/libexif/libexif/exif-entry.c,v
+retrieving revision 1.148
+retrieving revision 1.149
+diff -c -u -r1.148 -r1.149
+--- a/libexif/exif-entry.c	12 Jul 2012 17:13:03 -0000	1.148
++++ b/libexif/exif-entry.c	12 Jul 2012 17:26:01 -0000	1.149
+@@ -860,14 +860,15 @@ exif_entry_get_value (ExifEntry *e, char
+ 	 */
+ 	bindtextdomain (GETTEXT_PACKAGE, LOCALEDIR);
+ 
++	if (!e || !e->parent || !e->parent->parent || !maxlen)
++		return val;
++
+ 	/* make sure the returned string is zero terminated */
+ 	memset (val, 0, maxlen);
+ 	maxlen--;
+ 	memset (b, 0, sizeof (b));
+ 
+ 	/* We need the byte order */
+-	if (!e || !e->parent || !e->parent->parent)
+-		return val;
+ 	o = exif_data_get_byte_order (e->parent->parent);
+ 
+ 	/* Sanity check */
+@@ -925,17 +926,16 @@ exif_entry_get_value (ExifEntry *e, char
+ 
+ 		/*
+ 		 * If we reach this point, the tag does not
+-		 * comply with the standard and seems to contain data.
++ 		 * comply with the standard but seems to contain data.
+ 		 * Print as much as possible.
+ 		 */
+ 		exif_entry_log (e, EXIF_LOG_CODE_DEBUG,
+ 			_("Tag UserComment does not comply "
+ 			"with standard but contains data."));
+-		for (; (i < e->size)  && (strlen (val) < maxlen - 1); i++) {
++ 		for (j = 0; (i < e->size) && (j < maxlen); i++, j++) {
+ 			exif_entry_log (e, EXIF_LOG_CODE_DEBUG,
+ 				_("Byte at position %i: 0x%02x"), i, e->data[i]);
+-			val[strlen (val)] =
+-				isprint (e->data[i]) ? e->data[i] : '.';
++ 			val[j] = isprint (e->data[i]) ? e->data[i] : '.';
+ 		}
+ 		break;
+ 
diff --git a/meta/recipes-support/libexif/libexif_0.6.20.bb b/meta/recipes-support/libexif/libexif_0.6.20.bb
index 45b697d..7d8f8fd 100644
--- a/meta/recipes-support/libexif/libexif_0.6.20.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.20.bb
@@ -8,7 +8,8 @@ PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
 	  file://0001-libexif-CVE-2012-2813.patch \
-	  file://0002-libexif-CVE-2012-2812.patch"
+	  file://0002-libexif-CVE-2012-2812.patch \
+	  file://0003-libexif-CVE-2012-2841.patch"
 
 SRC_URI[md5sum] = "19844ce6b5d075af16f0d45de1e8a6a3"
 SRC_URI[sha256sum] = "a772d20bd8fb9802d7f0d70fde6ac8872f87d0c66c52b0d14026dafcaa83d715"
-- 
1.8.1.2.545.g2f19ada



