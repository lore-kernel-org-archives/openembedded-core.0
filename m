Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3b9z-0004NI-6W
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTp6j006237
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:51 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:49 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:30 -0600
Message-ID: <444e6b81cc0a37323ff32d342080fe758ff72975.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 03/18] Security Advisory - libexif - CVE-2012-2812
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
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

[ CQID: WIND00366794 ]

The exif_entry_get_value function in exif-entry.c in the EXIF Tag
Parsing Library (aka libexif) before 0.6.21 allows remote attackers
to cause a denial of service (out-of-bounds read) or possibly obtain
sensitive information from process memory via crafted EXIF tags in an image.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libexif/0002-libexif-CVE-2012-2812.patch       | 87 ++++++++++++++++++++++
 meta/recipes-support/libexif/libexif_0.6.20.bb     |  3 +-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/0002-libexif-CVE-2012-2812.patch

diff --git a/meta/recipes-support/libexif/libexif/0002-libexif-CVE-2012-2812.patch b/meta/recipes-support/libexif/libexif/0002-libexif-CVE-2012-2812.patch
new file mode 100644
index 0000000..e4a6c66
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0002-libexif-CVE-2012-2812.patch
@@ -0,0 +1,87 @@
+Index: libexif/exif-entry.c
+===================================================================
+RCS file: /cvsroot/libexif/libexif/libexif/exif-entry.c,v
+retrieving revision 1.147
+retrieving revision 1.148
+diff -c -u -r1.147 -r1.148
+--- a/libexif/exif-entry.c	12 Jul 2012 17:12:24 -0000	1.147
++++ b/libexif/exif-entry.c	12 Jul 2012 17:13:03 -0000	1.148
+@@ -611,6 +611,30 @@
+ 	printf ("%s  Value: %s\n", buf, exif_entry_get_value (e, value, sizeof(value)));
+ }
+ 
++/*! Check if a string consists entirely of a single, repeated character.
++ * Up to first n bytes are checked.
++ * 
++ * \param[in] data pointer of string to check
++ * \param[in] ch character to match
++ * \param[in] n maximum number of characters to match
++ *
++ * \return 0 if the string matches or is of zero length, nonzero otherwise
++ */
++static int
++match_repeated_char(const unsigned char *data, unsigned char ch, size_t n)
++{
++	int i;
++	for (i=n; i; --i, ++data) {
++		if (*data == 0) {
++			i = 0;	/* all bytes before NUL matched */
++			break;
++		}
++		if (*data != ch)
++			break;
++	}
++	return i;
++}
++
+ #define CF(entry,target,v,maxlen)					\
+ {									\
+ 	if (entry->format != target) {					\
+@@ -806,7 +830,6 @@
+ exif_entry_get_value (ExifEntry *e, char *val, unsigned int maxlen)
+ {
+ 	unsigned int i, j, k;
+-	const unsigned char *t;
+ 	ExifShort v_short, v_short2, v_short3, v_short4;
+ 	ExifByte v_byte;
+ 	ExifRational v_rat;
+@@ -948,9 +971,9 @@
+ 		/*
+ 		 * First part: Photographer.
+ 		 * Some cameras store a string like "   " here. Ignore it.
++		 * Remember that a corrupted tag might not be NUL-terminated
+ 		 */
+-		if (e->size && e->data &&
+-		    (strspn ((char *)e->data, " ") != strlen ((char *) e->data)))
++		if (e->size && e->data && match_repeated_char(e->data, ' ', e->size))
+ 			strncpy (val, (char *) e->data, MIN (maxlen, e->size));
+ 		else
+ 			strncpy (val, _("[None]"), maxlen);
+@@ -959,15 +982,20 @@
+ 
+ 		/* Second part: Editor. */
+ 		strncat (val, " - ", maxlen - strlen (val));
++		k = 0;
+ 		if (e->size && e->data) {
+-			size_t ts;
+-			t = e->data + strlen ((char *) e->data) + 1;
+-			ts = e->data + e->size - t;
+-			if ((ts > 0) && (strspn ((char *)t, " ") != ts))
+-				strncat (val, (char *)t, MIN (maxlen - strlen (val), ts));
+-		} else {
+-			strncat (val, _("[None]"), maxlen - strlen (val));
++			const unsigned char *tagdata = memchr(e->data, 0, e->size);
++			if (tagdata++) {
++				int editor_ofs = tagdata - e->data;
++				int remaining = e->size - editor_ofs;
++				if (match_repeated_char(tagdata, ' ', remaining)) {
++					strncat (val, (const char*)tagdata, MIN (maxlen - strlen (val), remaining));
++					++k;
++				}
++			}
+ 		}
++		if (!k)
++			strncat (val, _("[None]"), maxlen - strlen (val));
+ 		strncat (val, " ", maxlen - strlen (val));
+ 		strncat (val, _("(Editor)"), maxlen - strlen (val));
+ 
diff --git a/meta/recipes-support/libexif/libexif_0.6.20.bb b/meta/recipes-support/libexif/libexif_0.6.20.bb
index a1a1816..45b697d 100644
--- a/meta/recipes-support/libexif/libexif_0.6.20.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.20.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
-	  file://0001-libexif-CVE-2012-2813.patch"
+	  file://0001-libexif-CVE-2012-2813.patch \
+	  file://0002-libexif-CVE-2012-2812.patch"
 
 SRC_URI[md5sum] = "19844ce6b5d075af16f0d45de1e8a6a3"
 SRC_URI[sha256sum] = "a772d20bd8fb9802d7f0d70fde6ac8872f87d0c66c52b0d14026dafcaa83d715"
-- 
1.8.1.2.545.g2f19ada



