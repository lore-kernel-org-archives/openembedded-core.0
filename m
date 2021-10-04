X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 02/11] qemu: fix CVE-2021-3682
Date: Tue,  5 Oct 2021 00:50:46 +0800
Message-Id: <14783d10fb43d10a91d5e61ad9811ad469a0fb46.1633366030.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e16cd155c5ef7cfe8b4d3a94485cb7b13fd95036)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3682.patch             | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c3eecea9d4..463339e42b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -69,6 +69,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3582.patch \
            file://CVE-2021-3607.patch \
            file://CVE-2021-3608.patch \
+           file://CVE-2021-3682.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
new file mode 100644
index 0000000000..50a49233d3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
@@ -0,0 +1,41 @@
+From 5e796671e6b8d5de4b0b423dce1b3eba144a92c9 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 22 Jul 2021 09:27:56 +0200
+Subject: [PATCH] usbredir: fix free call
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+data might point into the middle of a larger buffer, there is a separate
+free_on_destroy pointer passed into bufp_alloc() to handle that.  It is
+only used in the normal workflow though, not when dropping packets due
+to the queue being full.  Fix that.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/491
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-Id: <20210722072756.647673-1-kraxel@redhat.com>
+
+CVE: CVE-2021-3682
+Upstream-Status: Backport [5e796671e6b8d5de4b0b423dce1b3eba144a92c9]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/usb/redirect.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
+index 4ec9326e05..1ec909a63a 100644
+--- a/hw/usb/redirect.c
++++ b/hw/usb/redirect.c
+@@ -476,7 +476,7 @@ static int bufp_alloc(USBRedirDevice *dev, uint8_t *data, uint16_t len,
+     if (dev->endpoint[EP2I(ep)].bufpq_dropping_packets) {
+         if (dev->endpoint[EP2I(ep)].bufpq_size >
+                 dev->endpoint[EP2I(ep)].bufpq_target_size) {
+-            free(data);
++            free(free_on_destroy);
+             return -1;
+         }
+         dev->endpoint[EP2I(ep)].bufpq_dropping_packets = 0;
+-- 
+2.25.1
+
-- 
2.31.1

