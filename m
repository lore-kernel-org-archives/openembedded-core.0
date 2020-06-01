Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.37326.1591018840349359737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 06:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 3X37WA6sFKnq/CRGCg4/nCu082x2EQbKIbEAmhsWXIFNI2ptuT8XmD6NJuTyVjRwMUexEv/d4g
 Xg/nZTugRj2w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 06:40:39 -0700
IronPort-SDR: 4pXTBNk2sFB8YxLq+z8PKWP0sgyrMhIA5DHB/apxI5jRl5RCgKPWTnnYod63kTahE78EmaMvIa
 idUWYRCZl1zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; 
   d="scan'208";a="470290114"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2020 06:40:38 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: fix CVE-2020-13361
Date: Mon,  1 Jun 2020 21:40:37 +0800
Message-Id: <1591018837-83073-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 .../qemu/qemu/CVE-2020-13361.patch                 | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 126e7d4..3e50069 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://CVE-2020-11102.patch \
 	   file://CVE-2020-11869.patch \
+	   file://CVE-2020-13361.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch
new file mode 100644
index 0000000..e0acc70
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch
@@ -0,0 +1,61 @@
+From 369ff955a8497988d079c4e3fa1e93c2570c1c69 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Fri, 15 May 2020 01:36:08 +0530
+Subject: [PATCH] es1370: check total frame count against current frame
+
+A guest user may set channel frame count via es1370_write()
+such that, in es1370_transfer_audio(), total frame count
+'size' is lesser than the number of frames that are processed
+'cnt'.
+
+    int cnt = d->frame_cnt >> 16;
+    int size = d->frame_cnt & 0xffff;
+
+if (size < cnt), it results in incorrect calculations leading
+to OOB access issue(s). Add check to avoid it.
+
+Reported-by: Ren Ding <rding@gatech.edu>
+Reported-by: Hanqing Zhao <hanqing@gatech.edu>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20200514200608.1744203-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg03983.html]
+CVE: CVE-2020-13361
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/audio/es1370.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
+index 89c4dabcd44..5f8a83ff562 100644
+--- a/hw/audio/es1370.c
++++ b/hw/audio/es1370.c
+@@ -643,6 +643,9 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
+     int csc_bytes = (csc + 1) << d->shift;
+     int cnt = d->frame_cnt >> 16;
+     int size = d->frame_cnt & 0xffff;
++    if (size < cnt) {
++        return;
++    }
+     int left = ((size - cnt + 1) << 2) + d->leftover;
+     int transferred = 0;
+     int temp = MIN (max, MIN (left, csc_bytes));
+@@ -651,7 +654,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
+     addr += (cnt << 2) + d->leftover;
+ 
+     if (index == ADC_CHANNEL) {
+-        while (temp) {
++        while (temp > 0) {
+             int acquired, to_copy;
+ 
+             to_copy = MIN ((size_t) temp, sizeof (tmpbuf));
+@@ -669,7 +672,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
+     else {
+         SWVoiceOut *voice = s->dac_voice[index];
+ 
+-        while (temp) {
++        while (temp > 0) {
+             int copied, to_copy;
+ 
+             to_copy = MIN ((size_t) temp, sizeof (tmpbuf));
-- 
2.7.4

