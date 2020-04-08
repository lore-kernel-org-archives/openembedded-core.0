Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3898.1586310785919499070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88652006"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:53:04 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 267ED49DF126
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2020 09:42:42 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:53:03 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:53:10 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.100 -> 2.4.101
Date: Wed, 8 Apr 2020 02:00:15 -0700
Message-ID: <1586336415-19139-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586336415-19139-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586336415-19139-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 267ED49DF126.A3478
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

musl-ioctl.patch
removed since it is included in 2.4.101

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../drm/libdrm/musl-ioctl.patch               | 35 -------------------
 .../{libdrm_2.4.100.bb => libdrm_2.4.101.bb}  |  7 ++--
 2 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.100.bb => libdrm_2.4.101.bb} (92%)

diff --git a/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch b/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
deleted file mode 100644
index e3d6c5b853..0000000000
--- a/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 46c0fd6c827a8cb4d04e067bf04fab579ac4712e Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 18 Jun 2018 15:07:03 +0100
-Subject: [PATCH] tests/nouveau/threaded: adapt ioctl signature
-
-POSIX says ioctl() has the signature (int, int, ...) but glibc has decided to
-use (int, unsigned long int, ...) instead.
-
-Use a #ifdef to adapt the replacement function as appropriate.
----
- tests/nouveau/threaded.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/tests/nouveau/threaded.c b/tests/nouveau/threaded.c
-index 3669bcd3..e1c27c01 100644
---- a/tests/nouveau/threaded.c
-+++ b/tests/nouveau/threaded.c
-@@ -36,7 +36,11 @@ static int failed;
- 
- static int import_fd;
- 
-+#ifdef __GLIBC__
- int ioctl(int fd, unsigned long request, ...)
-+#else
-+int ioctl(int fd, int request, ...)
-+#endif
- {
- 	va_list va;
- 	int ret;
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.100.bb b/meta/recipes-graphics/drm/libdrm_2.4.101.bb
similarity index 92%
rename from meta/recipes-graphics/drm/libdrm_2.4.100.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.101.bb
index 4859425672..8ec566faa9 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.100.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.101.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
-           file://musl-ioctl.patch"
-SRC_URI[md5sum] = "f47bc87e28198ba527e6b44ffdd62f65"
-SRC_URI[sha256sum] = "c77cc828186c9ceec3e56ae202b43ee99eb932b4a87255038a80e8a1060d0a5d"
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
+SRC_URI[md5sum] = "e6a6f1b88963210b3d62acd7310a1cc7"
+SRC_URI[sha256sum] = "ddf31baa8e49473624860bd166ce654dc349873f7a6c7b3305964249315c78a7"
 
 inherit meson pkgconfig manpages
 
-- 
2.17.1



