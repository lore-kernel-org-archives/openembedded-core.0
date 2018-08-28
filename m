Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E40378D86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:22:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7S7MKkq007794
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 00:22:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 28 Aug 2018 00:22:19 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2018 15:22:18 +0800
Message-ID: <1535440938-243685-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libexif: patch for CVE-2017-7544
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
X-List-Received-Date: Tue, 28 Aug 2018 07:22:19 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libexif/libexif/CVE-2017-7544.patch            | 40 ++++++++++++++++++++++
 meta/recipes-support/libexif/libexif_0.6.21.bb     |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2017-7544.patch

diff --git a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch b/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
new file mode 100644
index 0000000..e49481f
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
@@ -0,0 +1,40 @@
+From 8a92f964a66d476ca8907234359e92a70fc1325b Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 28 Aug 2018 15:12:10 +0800
+Subject: [PATCH] On saving makernotes, make sure the makernote container tags
+ has a type with 1 byte components.
+
+Fixes (at least):
+	https://sourceforge.net/p/libexif/bugs/130
+	https://sourceforge.net/p/libexif/bugs/129
+
+Upstream-Status: Backport[https://github.com/libexif/libexif/commit/
+c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083ec00cd]
+
+CVE: CVE-2017-7544
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libexif/exif-data.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libexif/exif-data.c b/libexif/exif-data.c
+index 67df4db..6bf89eb 100644
+--- a/libexif/exif-data.c
++++ b/libexif/exif-data.c
+@@ -255,6 +255,12 @@ exif_data_save_data_entry (ExifData *data, ExifEntry *e,
+ 			exif_mnote_data_set_offset (data->priv->md, *ds - 6);
+ 			exif_mnote_data_save (data->priv->md, &e->data, &e->size);
+ 			e->components = e->size;
++                        if (exif_format_get_size (e->format) != 1) {
++				/* e->format is taken from input code,
++				 * but we need to make sure it is a 1 byte
++				 * entity due to the multiplication below. */
++				e->format = EXIF_FORMAT_UNDEFINED;
++			}
+ 		}
+ 	}
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.21.bb b/meta/recipes-support/libexif/libexif_0.6.21.bb
index cff4cae..b550a11 100644
--- a/meta/recipes-support/libexif/libexif_0.6.21.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.21.bb
@@ -4,7 +4,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
+           file://CVE-2017-7544.patch"
 
 SRC_URI[md5sum] = "27339b89850f28c8f1c237f233e05b27"
 SRC_URI[sha256sum] = "16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a"
-- 
2.7.4


