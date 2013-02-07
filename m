Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bA2-0004Ng-B1
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTsav006243
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:54 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:52 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:34 -0600
Message-ID: <eaff27511430cdd77ed0a316b370308ca8129777.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 07/18] Security Advisory - libexif - CVE-2012-2840
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
X-List-Received-Date: Thu, 07 Feb 2013 23:45:50 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

[ CQID: WIND00366793 ]

Off-by-one error in the exif_convert_utf16_to_utf8 function in
exif-entry.c in the EXIF Tag Parsing Library (aka libexif) before
0.6.21 allows remote attackers to cause a denial of service or
possibly execute arbitrary code via crafted EXIF tags in an image.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libexif/libexif/0006-libexif-CVE-2012-2840.patch    | 17 +++++++++++++++++
 meta/recipes-support/libexif/libexif_0.6.20.bb          |  3 ++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/0006-libexif-CVE-2012-2840.patch

diff --git a/meta/recipes-support/libexif/libexif/0006-libexif-CVE-2012-2840.patch b/meta/recipes-support/libexif/libexif/0006-libexif-CVE-2012-2840.patch
new file mode 100644
index 0000000..81c5821
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0006-libexif-CVE-2012-2840.patch
@@ -0,0 +1,17 @@
+Index: libexif/exif-utils.c
+===================================================================
+RCS file: /cvsroot/libexif/libexif/libexif/exif-utils.c,v
+retrieving revision 1.16
+retrieving revision 1.17
+diff -c -u -r1.16 -r1.17
+--- a/libexif/exif-utils.c	27 Oct 2009 06:06:11 -0000	1.16
++++ b/libexif/exif-utils.c	12 Jul 2012 17:11:30 -0000	1.17
+@@ -239,7 +239,7 @@
+ 				break;
+ 			}
+ 		} else {
+-			if (maxlen > 2) {
++			if (maxlen > 3) {
+ 				*out++ = ((*in >> 12) & 0x0F) | 0xE0;
+ 				*out++ = ((*in >> 6) & 0x3F) | 0x80;
+ 				*out++ = (*in++ & 0x3F) | 0x80;
diff --git a/meta/recipes-support/libexif/libexif_0.6.20.bb b/meta/recipes-support/libexif/libexif_0.6.20.bb
index 6affc9e..757163b 100644
--- a/meta/recipes-support/libexif/libexif_0.6.20.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.20.bb
@@ -11,7 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
 	  file://0002-libexif-CVE-2012-2812.patch \
 	  file://0003-libexif-CVE-2012-2841.patch \
 	  file://0004-libexif-CVE-2012-2836.patch \
-	  file://0005-libexif-CVE-2012-2837.patch"
+	  file://0005-libexif-CVE-2012-2837.patch \
+	  file://0006-libexif-CVE-2012-2840.patch"
 
 SRC_URI[md5sum] = "19844ce6b5d075af16f0d45de1e8a6a3"
 SRC_URI[sha256sum] = "a772d20bd8fb9802d7f0d70fde6ac8872f87d0c66c52b0d14026dafcaa83d715"
-- 
1.8.1.2.545.g2f19ada



