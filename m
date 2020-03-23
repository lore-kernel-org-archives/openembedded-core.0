Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.47636.1584948039581569611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 00:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: QbiDY3xrX8P2+tqsw3v89wAxHwvCYBVxuCdb68bXx98Yp3Tj13MAWfoKl+aLQ8Sdy8WXE1OuGh
 ArF59P5GtRhg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 00:20:37 -0700
IronPort-SDR: O8QAakX2GDSCTqDWwLcFs8aoUO5PJvtio5MFm6ADsTb4OHUElJUFE7sci8ZYP2O3uwx1cRlKMc
 OBBoCXY/3akg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,295,1580803200"; 
   d="scan'208";a="325487382"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2020 00:20:36 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu/slirp: fix CVE-2020-7211
Date: Mon, 23 Mar 2020 15:20:35 +0800
Message-Id: <1584948035-7484-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Chee Yang Lee <chee.yang.lee@intel.com>

fix CVE-2020-7211 for qemu slirp submodule
see :
https://www.openwall.com/lists/oss-security/2020/01/17/2
https://gitlab.freedesktop.org/slirp/libslirp/commit/14ec36e107a8c9af7d0a80c3571fe39b291ff1d4

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 .../recipes-devtools/qemu/qemu/CVE-2020-7211.patch | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7cf4367..f62220a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-7039-2.patch \
            file://CVE-2020-7039-3.patch \
            file://0001-Add-enable-disable-udev.patch \
+	   file://CVE-2020-7211.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-7211.patch
new file mode 100644
index 0000000..11be4c9
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
2.7.4

