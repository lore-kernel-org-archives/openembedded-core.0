Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.4781.1588369277814969501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 14:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=DNXlIQQB;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=4yvm=6p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49DQfy4H71z4y
	for <openembedded-core@lists.openembedded.org>; Fri,  1 May 2020 23:41:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588369274;
	bh=nztgOG/LYLOARM5EuzdPh+oCNtiKdCIPbvLwzCYAzrk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DNXlIQQBbB6lbMoeY40LTKQTdhr8OCOCh4KOdkig59EHIp42Vgud0///039qtIJnH
	 9/6HnH8zn8uFsYkm6uTozI9+5TB9xbnAdqyOtmcBdTxZ/XqUsbjPQdGE7ac2scmTfa
	 kbNyfKLFJ63jkktaOeRyhg5lGs9sAX6OMt5s/VK7CvdJxDcgGCTqpJvJa338P9FysO
	 IAgv+gpyFnBcSRRaeDwM7e5UmfhLbevZswxY4sT9xZlu/5L/A9O21rfd1VoxeuoFgc
	 J27uBnDeC1J18teuQCBl4voctuX+Q7nIVlsN6CKKULtU3P4m63zfWA+XFVUA9XBl4H
	 Khio9W5dd4Z4AHK1nfnQfTdOV1vlfDXBLGD/ItvKxB+4gKc4zvgaF1LdGugiMF7+R1
	 zYl8xLGZj4WhtLJjB7lbpPeygnRmKptPhI8UKdphYTR1yivPDGTxaJZQ+rLhI1IoGO
	 K/3Dv44Z6HAgjkbLjpazfQCIyQjYLgpzsqbBGJ0fq4Gy6xflAWXnv37y2LzpTiE/85
	 PjGaHIR7zqmRaNMf6KJucZ7BABAIgn5IfYVYm4jlr97wxV2WwOu46bujHdlr8R9rl0
	 XUFnpXyfREnq3IzZuH8fsB80+X5/k6kuDn41YVbKf86112CIIOEuigml2cRI0R7tSL
	 i2lYFsYbJeuWokKdjn/qCmZQ=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] qemu/slirp: fix CVE-2020-7211
Date: Sat,  2 May 2020 00:41:13 +0300
Message-Id: <20200501214113.23843-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501214113.23843-1-bunk@stusta.de>
References: <20200501214113.23843-1-bunk@stusta.de>

From: Chee Yang Lee <chee.yang.lee@intel.com>

fix CVE-2020-7211 for qemu slirp submodule
see :
https://www.openwall.com/lists/oss-security/2020/01/17/2
https://gitlab.freedesktop.org/slirp/libslirp/commit/14ec36e107a8c9af7d0a80c3571fe39b291ff1d4

(From OE-Core rev: 31362d739834377ac4ab880029c3e3dda0cd7698)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-7211.patch             | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 119530f7e6..e18eaa0962 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-7039-1.patch \
            file://CVE-2020-7039-2.patch \
            file://CVE-2020-7039-3.patch \
+	   file://CVE-2020-7211.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
new file mode 100644
index 0000000000..11be4c92e7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
@@ -0,0 +1,46 @@
+From 14ec36e107a8c9af7d0a80c3571fe39b291ff1d4 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Mon, 13 Jan 2020 17:44:31 +0530
+Subject: [PATCH] slirp: tftp: restrict relative path access
+
+tftp restricts relative or directory path access on Linux systems.
+Apply same restrictions on Windows systems too. It helps to avoid
+directory traversal issue.
+
+Fixes: https://bugs.launchpad.net/qemu/+bug/1812451
+Reported-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+Message-Id: <20200113121431.156708-1-ppandit@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/slirp/libslirp/-/commit/14ec36e107a8c9af7d0a80c3571fe39b291ff1d4.patch]
+CVE: CVE-2020-7211
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ slirp/src/tftp.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c
+index 093c2e0..e52e71b 100644
+--- a/slirp/src/tftp.c
++++ b/slirp/src/tftp.c
+@@ -344,8 +344,13 @@ static void tftp_handle_rrq(Slirp *slirp, struct sockaddr_storage *srcsas,
+     k += 6; /* skipping octet */
+ 
+     /* do sanity checks on the filename */
+-    if (!strncmp(req_fname, "../", 3) ||
+-        req_fname[strlen(req_fname) - 1] == '/' || strstr(req_fname, "/../")) {
++    if (
++#ifdef G_OS_WIN32
++        strstr(req_fname, "..\\") ||
++        req_fname[strlen(req_fname) - 1] == '\\' ||
++#endif
++        strstr(req_fname, "../") ||
++        req_fname[strlen(req_fname) - 1] == '/') {
+         tftp_send_error(spt, 2, "Access violation", tp);
+         return;
+     }
+-- 
+2.24.1
+
-- 
2.17.1

