X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 01/12] qemu: fix CVE-2021-3713
Date: Mon,  7 Feb 2022 17:06:51 +0800
Message-Id: <7879ba4406eb9633079275c57abeee9e738b1c99.1644224643.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3713.patch             | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 463339e42b..3aad41088a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -70,6 +70,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3607.patch \
            file://CVE-2021-3608.patch \
            file://CVE-2021-3682.patch \
+           file://CVE-2021-3713.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch
new file mode 100644
index 0000000000..33fca66d3d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch
@@ -0,0 +1,68 @@
+From 9a8f71ec660e67c51cc5905dd9d2a12ff78ce743 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Wed, 18 Aug 2021 14:05:05 +0200
+Subject: [PATCH 08/12] uas: add stream number sanity checks.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The device uses the guest-supplied stream number unchecked, which can
+lead to guest-triggered out-of-band access to the UASDevice->data3 and
+UASDevice->status3 fields.  Add the missing checks.
+
+Fixes: CVE-2021-3713
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reported-by: Chen Zhe <chenzhe@huawei.com>
+Reported-by: Tan Jingguo <tanjingguo@huawei.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-Id: <20210818120505.1258262-2-kraxel@redhat.com>
+(cherry picked from commit 13b250b12ad3c59114a6a17d59caf073ce45b33a)
+Signed-off-by: Michael Roth <michael.roth@amd.com>
+
+Upstream-Status: Backport [36403e8788a264dc96174f52584681ebcb4f54b1]
+CVE: CVE-2021-3713
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/usb/dev-uas.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
+index cec071d96..157734eb0 100644
+--- a/hw/usb/dev-uas.c
++++ b/hw/usb/dev-uas.c
+@@ -831,6 +831,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
+         }
+         break;
+     case UAS_PIPE_ID_STATUS:
++        if (p->stream > UAS_MAX_STREAMS) {
++            goto err_stream;
++        }
+         if (p->stream) {
+             QTAILQ_FOREACH(st, &uas->results, next) {
+                 if (st->stream == p->stream) {
+@@ -858,6 +861,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
+         break;
+     case UAS_PIPE_ID_DATA_IN:
+     case UAS_PIPE_ID_DATA_OUT:
++        if (p->stream > UAS_MAX_STREAMS) {
++            goto err_stream;
++        }
+         if (p->stream) {
+             req = usb_uas_find_request(uas, p->stream);
+         } else {
+@@ -893,6 +899,11 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
+         p->status = USB_RET_STALL;
+         break;
+     }
++
++err_stream:
++    error_report("%s: invalid stream %d", __func__, p->stream);
++    p->status = USB_RET_STALL;
++    return;
+ }
+ 
+ static void usb_uas_unrealize(USBDevice *dev)
+-- 
+2.31.1
+
-- 
2.34.1

