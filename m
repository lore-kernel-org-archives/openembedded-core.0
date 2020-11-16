Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.32622.1605520581789789203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 01:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,482,1596470400"; 
   d="scan'208";a="101416965"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Nov 2020 17:55:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 15BA44CE4BC3
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 17:55:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Nov 2020 17:55:58 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH v2] libdrm: upgrade 2.4.102 -> 2.4.103
Date: Tue, 17 Nov 2020 05:55:56 +0800
Message-ID: <1605563756-91985-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 15BA44CE4BC3.A374B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

files/0001-xf86drm.c-fix-build-failure.patch
Removed since this is included in 2.4.103.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-xf86drm.c-fix-build-failure.patch    | 87 -------------------
 .../{libdrm_2.4.102.bb => libdrm_2.4.103.bb}  |  5 +-
 2 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/files/0001-xf86drm.c-fix-build-failure.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.102.bb => libdrm_2.4.103.bb} (93%)

diff --git a/meta/recipes-graphics/drm/files/0001-xf86drm.c-fix-build-failure.patch b/meta/recipes-graphics/drm/files/0001-xf86drm.c-fix-build-failure.patch
deleted file mode 100644
index 60c996ca85..0000000000
--- a/meta/recipes-graphics/drm/files/0001-xf86drm.c-fix-build-failure.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From c7d89412884de2dbfa543720d185027377e62f21 Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Fri, 5 Jun 2020 23:46:52 +0200
-Subject: [PATCH] xf86drm.c: fix build failure
-
-./xf86drm.c: In function 'drmNodeIsDRM':
-../xf86drm.c:2825:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-../xf86drm.c: In function 'drmGetMinorNameForFD':
-../xf86drm.c:2938:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-../xf86drm.c: In function 'drmParsePciBusInfo':
-../xf86drm.c:3258:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-../xf86drm.c: In function 'drmParsePciDeviceInfo':
-../xf86drm.c:3427:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-../xf86drm.c: In function 'drmGetDeviceNameFromFd2':
-../xf86drm.c:4305:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- xf86drm.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/xf86drm.c b/xf86drm.c
-index 07a18c4..50a6f09 100644
---- a/xf86drm.c
-+++ b/xf86drm.c
-@@ -2822,7 +2822,7 @@ static bool drmNodeIsDRM(int maj, int min)
-     snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/drm",
-              maj, min);
-     return stat(path, &sbuf) == 0;
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     char name[SPECNAMELEN];
- 
-     if (!devname_r(makedev(maj, min), S_IFCHR, name, sizeof(name)))
-@@ -2935,7 +2935,7 @@ static char *drmGetMinorNameForFD(int fd, int type)
- 
-     closedir(sysdir);
-     return NULL;
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     struct stat sbuf;
-     char dname[SPECNAMELEN];
-     const char *mname;
-@@ -3255,7 +3255,7 @@ static int drmParsePciBusInfo(int maj, int min, drmPciBusInfoPtr info)
-     info->func = pinfo.func;
- 
-     return 0;
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     return get_sysctl_pci_bus_info(maj, min, info);
- #else
- #warning "Missing implementation of drmParsePciBusInfo"
-@@ -3424,7 +3424,7 @@ static int drmParsePciDeviceInfo(int maj, int min,
-     device->subdevice_id = pinfo.subdevice_id;
- 
-     return 0;
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     drmPciBusInfo info;
-     struct pci_conf_io pc;
-     struct pci_match_conf patterns[1];
-@@ -4302,7 +4302,7 @@ drm_public char *drmGetDeviceNameFromFd2(int fd)
-     free(value);
- 
-     return strdup(path);
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     return drmGetDeviceNameFromFd(fd);
- #else
-     struct stat      sbuf;
--- 
-1.8.3.1
-
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.102.bb b/meta/recipes-graphics/drm/libdrm_2.4.103.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.102.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.103.bb
index ad512d14a9..1028d618ae 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.102.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.103.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \ 
-           file://0001-xf86drm.c-fix-build-failure.patch "
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "8bcbf9336c28e393d76c1f16d7e79e394a7fce8a2e929d52d3ad7ad8525ba05b"
+SRC_URI[sha256sum] = "3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222"
 
 inherit meson pkgconfig manpages
 
-- 
2.25.1



