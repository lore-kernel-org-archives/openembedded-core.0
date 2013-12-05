Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEF016E227
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 23:52:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB5Nqqx0025318
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 15:52:52 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 15:52:51 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 17:52:15 -0600
Message-ID: <2480298100282ff73fcd5e3c2371ab1080d92edd.1386287394.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386287394.git.mark.hatle@windriver.com>
References: <cover.1386287394.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/6][master] libtiff: CVE-2013-4232
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
X-List-Received-Date: Thu, 05 Dec 2013 23:52:53 -0000
Content-Type: text/plain

From: Baogen Shang <baogen.shang@windriver.com>

cve description:
Use-after-free vulnerability in the t2p_readwrite_pdf_image function
in tools/tiff2pdf.c in libtiff 4.0.3 allows remote attackers to cause
a denial of service (crash) or possible execute arbitrary code via a
crafted TIFF image.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4232

Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libtiff/files/libtiff-CVE-2013-4232.patch             | 15 +++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb             |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4232.patch

diff --git a/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4232.patch b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4232.patch
new file mode 100644
index 0000000..9ebf8f9a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4232.patch
@@ -0,0 +1,15 @@
+This patch comes from: http://bugzilla.maptools.org/attachment.cgi?id=513&action=diff 
+
+Upstream-Status: Pending
+
+Signed-off-by: Baogen shang <baogen.shang@windriver.com>
+--- a/tools/tiff2pdf.c	2013-10-21 10:36:38.214170346 +0800
++++ b/tools/tiff2pdf.c	2013-10-21 10:38:58.246170329 +0800
+@@ -2387,6 +2387,7 @@
+ 					TIFFFileName(input));
+ 				t2p->t2p_error = T2P_ERR_ERROR;
+ 			  _TIFFfree(buffer);
++			  return(0);
+ 			} else {
+ 				buffer=samplebuffer;
+ 				t2p->tiff_datasize *= t2p->tiff_samplesperpixel;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index def408e..2d38c68 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -6,7 +6,8 @@ DEPENDS = "zlib jpeg xz"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
-           file://libtiff-CVE-2013-1960.patch"
+           file://libtiff-CVE-2013-1960.patch \
+           file://libtiff-CVE-2013-4232.patch"
 
 SRC_URI[md5sum] = "051c1068e6a0627f461948c365290410"
 SRC_URI[sha256sum] = "ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872"
-- 
1.8.3.4


