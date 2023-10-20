Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00D9CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 04:41:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.47836.1697776864940678013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 21:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=noYPk8w0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86573ca7bc=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K3nrL6021475
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=PQo+i
	U/Cm4MHn2WYtKuqkyYbdeHqwucSXNNqswwaFcE=; b=noYPk8w0ADSnVa970sATo
	ewpR6IMmvgSzMZknizLtpW6soXKtx8Fb6GhEqPOvEa1TvXHtm3OOL81L9aewK1xN
	du70EV50FT0akACcN6ePa/SFKKtBxRqoAkBieJD/47YiPUVwudp95a9T2gEHkO3g
	oHXp63nWTQwNGwTfQxTBTa3VhRIbBHZcKC1kCUFQPkhQIWGWX5nsYbsJVI4Yzg39
	ua7vhv2YzXEiISFEQN7lgyStQwcvInrL1sqI6rmTc5922rImGKSzvIyQs2YTJEk7
	ijENG46DMbgiIzAlfceMIsZtq28IjZekU6U4ODn+YrArSa7X95I34JalSBccHfUw
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuf3a84u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:41:04 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 21:41:01 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] libx11: fix CVE-2023-43787
Date: Fri, 20 Oct 2023 04:40:46 +0000
Message-ID: <20231020044046.1167832-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: O193l2XU38ynPGubeiT1w_SZ-TxgV8Bd
X-Proofpoint-ORIG-GUID: O193l2XU38ynPGubeiT1w_SZ-TxgV8Bd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_02,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310200039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189493

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability was found in libX11 due to an integer overflow
within the XCreateImage() function. This flaw allows a local
user to trigger an integer overflow and execute arbitrary code
with elevated privileges.

Reference:
https://security-tracker.debian.org/tracker/CVE-2023-43787
https://www.openwall.com/lists/oss-security/2023/10/03/1

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../xorg-lib/libx11/CVE-2023-43787.patch      | 64 +++++++++++++++++++
 .../xorg-lib/libx11_1.7.3.1.bb                |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787.patch
new file mode 100644
index 0000000000..48cb56831b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787.patch
@@ -0,0 +1,64 @@
+From 7916869d16bdd115ac5be30a67c3749907aea6a0 Mon Sep 17 00:00:00 2001
+From: Yair Mizrahi <yairm@jfrog.com>
+Date: Tue, 17 Oct 2023 08:26:32 +0000
+Subject: [PATCH] CVE-2023-43787: Integer overflow in XCreateImage() leading to
+  a heap overflow
+
+When the format is `Pixmap` it calculates the size of the image data as:
+    ROUNDUP((bits_per_pixel * width), image->bitmap_pad);
+There is no validation on the `width` of the image, and so this
+calculation exceeds the capacity of a 4-byte integer, causing an overflow.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+CVE: CVE-2023-43787
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/7916869d16bdd115ac5be30a67c3749907aea6a0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/ImUtil.c | 20 +++++++++++++++-----
+ 1 file changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/src/ImUtil.c b/src/ImUtil.c
+index 36f08a0..fbfad33 100644
+--- a/src/ImUtil.c
++++ b/src/ImUtil.c
+@@ -30,6 +30,7 @@ in this Software without prior written authorization from The Open Group.
+ #include <X11/Xlibint.h>
+ #include <X11/Xutil.h>
+ #include <stdio.h>
++#include <limits.h>
+ #include "ImUtil.h"
+
+ static int _XDestroyImage(XImage *);
+@@ -361,13 +362,22 @@ XImage *XCreateImage (
+	/*
+	 * compute per line accelerator.
+	 */
+-	{
+-	if (format == ZPixmap)
++	if (format == ZPixmap) {
++	    if ((INT_MAX / bits_per_pixel) < width) {
++		Xfree(image);
++		return NULL;
++	    }
++
+	    min_bytes_per_line =
+-	       ROUNDUP((bits_per_pixel * width), image->bitmap_pad);
+-	else
++		ROUNDUP((bits_per_pixel * width), image->bitmap_pad);
++	} else {
++	    if ((INT_MAX - offset) < width) {
++		Xfree(image);
++		return NULL;
++	    }
++
+	    min_bytes_per_line =
+-	        ROUNDUP((width + offset), image->bitmap_pad);
++		ROUNDUP((width + offset), image->bitmap_pad);
+	}
+	if (image_bytes_per_line == 0) {
+	    image->bytes_per_line = min_bytes_per_line;
+--
+2.35.5
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
index 19687d546b..e77b148d76 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://disable_tests.patch \
             file://CVE-2022-3554.patch \
             file://CVE-2022-3555.patch \
             file://CVE-2023-3138.patch \
+            file://CVE-2023-43787.patch \
            "
 SRC_URI[sha256sum] = "2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4b60989"
 
-- 
2.35.5


