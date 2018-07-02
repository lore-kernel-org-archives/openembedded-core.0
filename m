Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E91CD6056B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 08:08:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6288jfr029243
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Jul 2018 01:08:45 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 2 Jul 2018 01:08:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 16:18:38 +0800
Message-ID: <1530519518-29205-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ghostscript: fix CVE-2018-10194
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
X-List-Received-Date: Mon, 02 Jul 2018 08:08:46 -0000
Content-Type: text/plain

https://nvd.nist.gov/vuln/detail/CVE-2018-10194

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ard-against-trying-to-output-an-infinite-.patch | 49 ++++++++++++++++++++++
 .../ghostscript/ghostscript_9.23.bb                |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch
new file mode 100644
index 0000000..bac7365
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch
@@ -0,0 +1,49 @@
+From 39b1e54b2968620723bf32e96764c88797714879 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Wed, 18 Apr 2018 15:46:32 +0100
+Subject: [PATCH] pdfwrite - Guard against trying to output an infinite number
+
+Bug #699255 " Buffer overflow on pprintg1 due to mishandle postscript file data to pdf"
+
+The file uses an enormous parameter to xyxhow, causing an overflow in
+the calculation of text positioning (value > 1e39).
+
+Since this is basically a nonsense value, and PostScript only supports
+real values up to 1e38, this patch follows the same approach as for
+a degenerate CTM, and treats it as 0.
+
+Adobe Acrobat Distiller throws a limitcheck error, so we could do that
+instead if this approach proves to be a problem.
+
+Upstream-Status: Backport
+git://git.ghostscript.com/ghostpdl.git
+CVE: CVE-2018-10194
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ devices/vector/gdevpdts.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/devices/vector/gdevpdts.c b/devices/vector/gdevpdts.c
+index 848ad78..172fe6b 100644
+--- a/devices/vector/gdevpdts.c
++++ b/devices/vector/gdevpdts.c
+@@ -103,9 +103,14 @@ append_text_move(pdf_text_state_t *pts, double dw)
+ static int
+ set_text_distance(gs_point *pdist, double dx, double dy, const gs_matrix *pmat)
+ {
+-    int code = gs_distance_transform_inverse(dx, dy, pmat, pdist);
++    int code;
+     double rounded;
+ 
++    if (dx > 1e38 || dy > 1e38)
++        code = gs_error_undefinedresult;
++    else
++        code = gs_distance_transform_inverse(dx, dy, pmat, pdist);
++
+     if (code == gs_error_undefinedresult) {
+         /* The CTM is degenerate.
+            Can't know the distance in user space.
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.23.bb b/meta/recipes-extended/ghostscript/ghostscript_9.23.bb
index 4b3b370..019d99b 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.23.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.23.bb
@@ -33,6 +33,7 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://cups-no-gcrypt.patch \
+           file://0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.7.4


