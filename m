Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8947.1599639082885077012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3ybAE84bIq806GkoYmVnxGwM4Hd2RPtJdrd0OOWO+1bB6djTQaS+v+Da2+fzJU7k9W1u2hJlHx
 XqEcF2x+Q/bA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155766984"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155766984"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:23 -0700
IronPort-SDR: rj/oyJdrZw2pV6N+sENLPwsTHwUNbn+UiFYqRpjSQVRiojJpJtPvTbLzux+qnqDL6sf0LWt6ka
 C/vvFGqcFmVw==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371034"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 01/11] xserver-xorg: Security Advisory - xserver-xorg - CVE-2020-14347
Date: Wed,  9 Sep 2020 16:11:03 +0800
Message-Id: <509800b1c813d234ac0272868efdf7f76cecf62a.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhou <li.zhou@windriver.com>

Backport patch from <https://gitlab.freedesktop.org/xorg/xserver/-/
commit/aac28e162e5108510065ad4c323affd6deffd816> to solve
CVE-2020-14347.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../xserver-xorg/CVE-2020-14347.patch         | 37 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.5.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
new file mode 100644
index 0000000000..20a604869b
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
index 3de6d22e57..f0f15a2584 100644
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
2.26.2

