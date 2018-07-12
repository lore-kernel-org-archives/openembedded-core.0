Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E94DD78480
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 18:48:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6CImINv010190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 11:48:18 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 12 Jul 2018 11:48:17 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2018 11:48:17 -0700
Message-ID: <20180712184817.149892-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH V2 1/1] tiff: security fix CVE-2018-10963
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
X-List-Received-Date: Thu, 12 Jul 2018 18:48:18 -0000
Content-Type: text/plain

Denial of service described at https://nvd.nist.gov/vuln/detail/CVE-2018-10963.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libtiff/files/CVE-2018-10963.patch             | 39 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.9.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
new file mode 100644
index 0000000..7252298
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
@@ -0,0 +1,39 @@
+From de144fd228e4be8aa484c3caf3d814b6fa88c6d9 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 12 May 2018 14:24:15 +0200
+Subject: [PATCH] TIFFWriteDirectorySec: avoid assertion. Fixes
+ http://bugzilla.maptools.org/show_bug.cgi?id=2795.
+ CVE-2018-10963
+
+---
+CVE: CVE-2018-10963
+
+Upstream-Status: Backport [gitlab.com/libtiff/libtiff/commit/de144f...]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ libtiff/tif_dirwrite.c |    7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
+index 2430de6..c15a28d 100644
+--- a/libtiff/tif_dirwrite.c
++++ b/libtiff/tif_dirwrite.c
+@@ -695,8 +695,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64* pdiroff)
+ 								}
+ 								break;
+ 							default:
+-								assert(0);   /* we should never get here */
+-								break;
++								TIFFErrorExt(tif->tif_clientdata,module,
++								            "Cannot write tag %d (%s)",
++								            TIFFFieldTag(o),
++                                                                            o->field_name ? o->field_name : "unknown");
++								goto bad;
+ 						}
+ 					}
+ 				}
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
index 8c3bba5..e8e2a11 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2017-9935.patch \
            file://CVE-2017-18013.patch \
            file://CVE-2018-5784.patch \
+           file://CVE-2018-10963.patch \
           "
 
 SRC_URI[md5sum] = "54bad211279cc93eb4fca31ba9bfdc79"
-- 
2.7.4


