Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6E256FFCE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:08:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAH88KMu029253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 00:08:20 -0800 (PST)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 17 Nov 2016 00:08:19 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2016 16:08:10 +0800
Message-ID: <1479370090-26155-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479370090-26155-1-git-send-email-yi.zhao@windriver.com>
References: <1479370090-26155-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 2/2] tiff: Security fix CVE-2016-3632
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
X-List-Received-Date: Thu, 17 Nov 2016 08:08:18 -0000
Content-Type: text/plain

CVE-2016-3632 libtiff: The _TIFFVGetField function in tif_dirinfo.c in
LibTIFF 4.0.6 and earlier allows remote attackers to cause a denial of
service (out-of-bounds write) or execute arbitrary code via a crafted
TIFF image.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3632
http://bugzilla.maptools.org/show_bug.cgi?id=2549
https://bugzilla.redhat.com/show_bug.cgi?id=1325095

The patch is from RHEL7.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-3632.patch              | 34 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch
new file mode 100644
index 0000000..a839250
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch
@@ -0,0 +1,34 @@
+From d3f9829a37661749b200760ad6525f77cf77d77a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Nikola=20Forr=C3=B3?= <nforro@redhat.com>
+Date: Mon, 11 Jul 2016 16:04:34 +0200
+Subject: [PATCH 4/8] Fix CVE-2016-3632
+
+CVE-2016-3632 libtiff: The _TIFFVGetField function in tif_dirinfo.c in
+LibTIFF 4.0.6 and earlier allows remote attackers to cause a denial of service
+(out-of-bounds write) or execute arbitrary code via a crafted TIFF image.
+
+CVE: CVE-2016-3632
+Upstream-Status: Backport [RedHat RHEL7]
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ tools/thumbnail.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/thumbnail.c b/tools/thumbnail.c
+index fd1cba5..75e7009 100644
+--- a/tools/thumbnail.c
++++ b/tools/thumbnail.c
+@@ -253,7 +253,8 @@ static struct cpTag {
+     { TIFFTAG_WHITEPOINT,		2, TIFF_RATIONAL },
+     { TIFFTAG_PRIMARYCHROMATICITIES,	(uint16) -1,TIFF_RATIONAL },
+     { TIFFTAG_HALFTONEHINTS,		2, TIFF_SHORT },
+-    { TIFFTAG_BADFAXLINES,		1, TIFF_LONG },
++    // disable BADFAXLINES, CVE-2016-3632
++    //{ TIFFTAG_BADFAXLINES,		1, TIFF_LONG },
+     { TIFFTAG_CLEANFAXDATA,		1, TIFF_SHORT },
+     { TIFFTAG_CONSECUTIVEBADFAXLINES,	1, TIFF_LONG },
+     { TIFFTAG_INKSET,			1, TIFF_SHORT },
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index edd560f..9b4aff3 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-3623.patch \
            file://CVE-2016-3622.patch \
            file://CVE-2016-3658.patch \
+           file://CVE-2016-3632.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
2.7.4


