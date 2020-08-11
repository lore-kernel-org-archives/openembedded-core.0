Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.8081.1597117470142760789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 20:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: li.zhou@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07B3i8FX008167
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2020 20:44:18 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 10 Aug
 2020 20:43:58 -0700
From: "Li Zhou" <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe][zeus][PATCH] xserver-xorg: Security Advisory - xserver-xorg - CVE-2020-14347
Date: Tue, 11 Aug 2020 11:43:11 +0800
Message-ID: <1597117391-211923-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Content-Type: text/plain

Backport patch from <https://gitlab.freedesktop.org/xorg/xserver/-/
commit/aac28e162e5108510065ad4c323affd6deffd816> to solve
CVE-2020-14347.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../xorg-xserver/xserver-xorg/CVE-2020-14347.patch | 37 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.5.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
new file mode 100644
index 0000000..20a6048
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
@@ -0,0 +1,37 @@
+From aac28e162e5108510065ad4c323affd6deffd816 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Sat, 25 Jul 2020 19:33:50 +0200
+Subject: [PATCH] fix for ZDI-11426
+
+Avoid leaking un-initalized memory to clients by zeroing the
+whole pixmap on initial allocation.
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-14347
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ dix/pixmap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dix/pixmap.c b/dix/pixmap.c
+index 1186d7dbb..5a0146bbb 100644
+--- a/dix/pixmap.c
++++ b/dix/pixmap.c
+@@ -116,7 +116,7 @@ AllocatePixmap(ScreenPtr pScreen, int pixDataSize)
+     if (pScreen->totalPixmapSize > ((size_t) - 1) - pixDataSize)
+         return NullPixmap;
+ 
+-    pPixmap = malloc(pScreen->totalPixmapSize + pixDataSize);
++    pPixmap = calloc(1, pScreen->totalPixmapSize + pixDataSize);
+     if (!pPixmap)
+         return NullPixmap;
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
index 3de6d22..f0f15a2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://0001-test-xtest-Initialize-array-with-braces.patch \
             file://0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch \
             file://sdksyms-no-build-path.patch \
+            file://CVE-2020-14347.patch \
             "
 SRC_URI[md5sum] = "c9fc7e21e11286dbedd22c00df652130"
 SRC_URI[sha256sum] = "a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa5cb614c6d01bac9d"
-- 
1.9.1

