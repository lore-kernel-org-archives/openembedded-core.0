Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3193.1588661906694787605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bbi/ZdlRYSirT0mgTxTDHpIXfyQY0F7wZjSG8YUW0npEPNCy6aqDJhW7Fh7WIKBbWEOPuxtTin
 C2hYSzY2F+JA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:36 -0700
IronPort-SDR: 4bsGny6mOaAp7UfwCtyVP7eR0FypQszDVoXl/s7Hr+cJ3Kieb4CqiMY1jj1XACesOJFhPM2ML3
 GoKy2iJC1RwQ==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144822"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:34 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 13/18] qemu/slirp: fix CVE-2020-7211
Date: Tue,  5 May 2020 14:56:48 +0800
Message-Id: <c68323151b9bafb5f52dda6a4bd11712feff2e83.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chee Yang Lee <chee.yang.lee@intel.com>

fix CVE-2020-7211 for qemu slirp submodule
see :
https://www.openwall.com/lists/oss-security/2020/01/17/2
https://gitlab.freedesktop.org/slirp/libslirp/commit/14ec36e107a8c9af7d0a80c3571fe39b291ff1d4

(From OE-Core rev: 31362d739834377ac4ab880029c3e3dda0cd7698)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-7211.patch             | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 22cb10b1c2..ba31c3ba60 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
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
2.25.4

