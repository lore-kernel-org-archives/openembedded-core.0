Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB3E65F20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 06:32:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4J6WF47004349
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 23:32:15 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 18 May 2014 23:32:14 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 14:32:13 +0800
Message-ID: <1400481133-7232-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] tiff: fix for Security Advisory CVE-2013-4231
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
X-List-Received-Date: Mon, 19 May 2014 06:32:15 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Multiple buffer overflows in libtiff before 4.0.3 allow remote attackers
to cause a denial of service (out-of-bounds write) via a crafted (1)
extension block in a GIF image or (2) GIF raster image to
tools/gif2tiff.c or (3) a long filename for a TIFF image to
tools/rgb2ycbcr.c. NOTE: vectors 1 and 3 are disputed by Red Hat, which
states that the input cannot exceed the allocated buffer size.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4231Multiple
buffer overflows in libtiff before 4.0.3 allow remote attackers to cause
a denial of service (out-of-bounds write) via a crafted (1) extension
block in a GIF image or (2) GIF raster image to tools/gif2tiff.c or (3)
a long filename for a TIFF image to tools/rgb2ycbcr.c. NOTE: vectors 1
and 3 are disputed by Red Hat, which states that the input cannot exceed
the allocated buffer size.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4231

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../libtiff/files/libtiff-CVE-2013-4231.patch      |   44 ++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |    3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4231.patch

diff --git a/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4231.patch b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4231.patch
new file mode 100644
index 0000000..d8d4e96
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4231.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Backport
+
+Multiple buffer overflows in libtiff before 4.0.3 allow remote attackers
+to cause a denial of service (out-of-bounds write) via a crafted (1)
+extension block in a GIF image or (2) GIF raster image to
+tools/gif2tiff.c or (3) a long filename for a TIFF image to
+tools/rgb2ycbcr.c. NOTE: vectors 1 and 3 are disputed by Red Hat, which
+states that the input cannot exceed the allocated buffer size.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4231Multiple
+buffer overflows in libtiff before 4.0.3 allow remote attackers to cause
+a denial of service (out-of-bounds write) via a crafted (1) extension
+block in a GIF image or (2) GIF raster image to tools/gif2tiff.c or (3)
+a long filename for a TIFF image to tools/rgb2ycbcr.c. NOTE: vectors 1
+and 3 are disputed by Red Hat, which states that the input cannot exceed
+the allocated buffer size.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4231
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+
+Index: tools/gif2tiff.c
+===================================================================
+RCS file: /cvs/maptools/cvsroot/libtiff/tools/gif2tiff.c,v
+retrieving revision 1.12
+retrieving revision 1.13
+diff -u -r1.12 -r1.13
+--- a/tools/gif2tiff.c	15 Dec 2010 00:22:44 -0000	1.12
++++ b/tools/gif2tiff.c	14 Aug 2013 05:18:53 -0000	1.13
+@@ -1,4 +1,4 @@
+-/* $Id: gif2tiff.c,v 1.12 2010-12-15 00:22:44 faxguy Exp $ */
++/* $Id: gif2tiff.c,v 1.13 2013-08-14 05:18:53 fwarmerdam Exp $ */
+ 
+ /*
+  * Copyright (c) 1990-1997 Sam Leffler
+@@ -333,6 +333,8 @@
+     int status = 1;
+ 
+     datasize = getc(infile);
++    if (datasize > 12)
++	return 0;
+     clear = 1 << datasize;
+     eoi = clear + 1;
+     avail = clear + 2;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index fb9e0bf..6483655 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -8,7 +8,8 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtiff-CVE-2013-1960.patch \
            file://libtiff-CVE-2013-4232.patch \
            file://libtiff-CVE-2013-4243.patch \
-           file://libtiff-CVE-2013-4244.patch"
+           file://libtiff-CVE-2013-4244.patch \
+           file://libtiff-CVE-2013-4231.patch "
 
 SRC_URI[md5sum] = "051c1068e6a0627f461948c365290410"
 SRC_URI[sha256sum] = "ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872"
-- 
1.7.10.4


