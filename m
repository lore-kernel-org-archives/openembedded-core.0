Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.19575.1599570480512121640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 06:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: rOs4xYciMwvxpzlKyJQ4FRZJR4CmZULVeGDaxWLT7GHIVDQnVphJU+rnc6t6vqtxveNxLmuqtG
 cUAwCYRgPTXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145843903"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="145843903"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:07:46 -0700
IronPort-SDR: rBBJNa/6uMoDArlGcGXJBR76XC5GwU9O0+/qvWRJjp5SqcMa+LS8udLB4AWDERRSSMPmqxJ7Xg
 Cdxa+eAGAnCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="377518772"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga001.jf.intel.com with ESMTP; 08 Sep 2020 06:07:46 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/3] xserver-xorg: fix CVE-2020-14347
Date: Tue,  8 Sep 2020 21:07:42 +0800
Message-Id: <20200908130744.63361-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../xserver-xorg/CVE-2020-14347.patch         | 38 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
new file mode 100644
index 0000000000..cf3f5f9417
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
@@ -0,0 +1,38 @@
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
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/aac28e162e5108510065ad4c323affd6deffd816]
+CVE: CVE-2020-14347
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ dix/pixmap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dix/pixmap.c b/dix/pixmap.c
+index 1186d7dbbf..5a0146bbb6 100644
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
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 3f7fbe85b8..5101134538 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-test-xtest-Initialize-array-with-braces.patch \
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
+           file://CVE-2020-14347.patch \
            "
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
-- 
2.17.1

