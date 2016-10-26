Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB0E71AAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:27:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9Q8R9Fc021827
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 01:27:10 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 26 Oct 2016 01:27:09 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 16:26:47 +0800
Message-ID: <04011c68da9d6453149248aa0bd0ff7327546cfc.1477470209.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477470209.git.yi.zhao@windriver.com>
References: <cover.1477470209.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 4/5] tiff: Security fix CVE-2016-3623
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
X-List-Received-Date: Wed, 26 Oct 2016 08:27:08 -0000
Content-Type: text/plain

CVE-2016-3623 libtiff: The rgb2ycbcr tool in LibTIFF 4.0.6 and earlier
allows remote attackers to cause a denial of service (divide-by-zero) by
setting the (1) v or (2) h parameter to 0.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3623
http://bugzilla.maptools.org/show_bug.cgi?id=2569

Patch from:
https://github.com/vadz/libtiff/commit/bd024f07019f5d9fea236675607a69f74a66bc7b

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-3623.patch              | 52 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
new file mode 100644
index 0000000..f554ac5
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
@@ -0,0 +1,52 @@
+From bd024f07019f5d9fea236675607a69f74a66bc7b Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Mon, 15 Aug 2016 21:26:56 +0000
+Subject: [PATCH] * tools/rgb2ycbcr.c: validate values of -v and -h parameters
+ to avoid potential divide by zero. Fixes CVE-2016-3623 (bugzilla #2569)
+
+CVE: CVE-2016-3623
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/bd024f07019f5d9fea236675607a69f74a66bc7b
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ ChangeLog         | 5 +++++
+ tools/rgb2ycbcr.c | 4 ++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 5d60608..3e6642a 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,5 +1,10 @@
+ 2016-08-15 Even Rouault <even.rouault at spatialys.com>
+ 
++	* tools/rgb2ycbcr.c: validate values of -v and -h parameters to
++	avoid potential divide by zero. Fixes CVE-2016-3623 (bugzilla #2569)
++
++2016-08-15 Even Rouault <even.rouault at spatialys.com>
++
+ 	* tools/tiffcrop.c: Fix out-of-bounds write in loadImage().
+ 	From patch libtiff-CVE-2016-3991.patch from
+ 	libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro (bugzilla #2543)
+diff --git a/tools/rgb2ycbcr.c b/tools/rgb2ycbcr.c
+index 3829d6b..51f4259 100644
+--- a/tools/rgb2ycbcr.c
++++ b/tools/rgb2ycbcr.c
+@@ -95,9 +95,13 @@ main(int argc, char* argv[])
+ 			break;
+ 		case 'h':
+ 			horizSubSampling = atoi(optarg);
++            if( horizSubSampling != 1 && horizSubSampling != 2 && horizSubSampling != 4 )
++                usage(-1);
+ 			break;
+ 		case 'v':
+ 			vertSubSampling = atoi(optarg);
++            if( vertSubSampling != 1 && vertSubSampling != 2 && vertSubSampling != 4 )
++                usage(-1);
+ 			break;
+ 		case 'r':
+ 			rowsperstrip = atoi(optarg);
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 713cf24..466dfbb 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-3945.patch \
            file://CVE-2016-3990.patch \
            file://CVE-2016-3991.patch \
+           file://CVE-2016-3623.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


