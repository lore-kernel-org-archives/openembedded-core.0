Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bA3-0004Nr-7v
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTrXi026784
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:53 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:53 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:35 -0600
Message-ID: <e3ce6986451d9f0250ac7425be996bb91f6ab9d4.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 08/18] Summary:Security Advisory - libtiff - CVE-2012-3401
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

From: Wei Cai <wei.cai@windriver.com>

[ CQID: WIND00374012 ]

A heap-based buffer overflow flaw was found in the way tiff2pdf, a TIFF image to a
PDF document conversion tool, of libtiff, a library of functions for manipulating
TIFF (Tagged Image File Format) image format files, performed write of TIFF image
content into particular PDF document file, when not properly initialized T2P context
struct pointer has been provided by tiff2pdf (application requesting the conversion)
as one of parameters for the routine performing the write. A remote attacker could
provide a specially-crafted TIFF image format file, that when processed by tiff2pdf
would lead to tiff2pdf executable crash or, potentially, arbitrary code execution
with the privileges of the user running the tiff2pdf binary.

Signed-off-by: Wei Cai <wei.cai@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Affects libtiff 4.0.2 and earlier.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libtiff/files/libtiff-CVE-2012-3401.patch                  | 10 ++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.1.bb                  |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2012-3401.patch

diff --git a/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2012-3401.patch b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2012-3401.patch
new file mode 100644
index 0000000..e59addd
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2012-3401.patch
@@ -0,0 +1,10 @@
+--- a/tools/tiff2pdf.c.orig	2012-11-22 17:24:46.000000000 +0800
++++ b/tools/tiff2pdf.c	2012-11-22 17:25:41.000000000 +0800
+@@ -1038,6 +1038,7 @@
+ 				"Can't set directory %u of input file %s", 
+ 				i,
+ 				TIFFFileName(input));
++			t2p->t2p_error = T2P_ERR_ERROR;
+ 			return;
+ 		}
+ 		if(TIFFGetField(input, TIFFTAG_PAGENUMBER, &pagen, &paged)){
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
index 54c4cbc..4bc7499 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
@@ -6,7 +6,8 @@ DEPENDS = "zlib jpeg xz"
 PR = "r1"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
-           file://libtool2.patch"
+           file://libtool2.patch \
+		   file://libtiff-CVE-2012-3401.patch"
 
 SRC_URI[md5sum] = "fae149cc9da35c598d8be897826dfc63"
 SRC_URI[sha256sum] = "9a7a039e516c37478038740f1642818250bfb1414cf404cc8b569e5f9d4bf2f0"
-- 
1.8.1.2.545.g2f19ada



