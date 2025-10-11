Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED10CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 21:39:56 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.8459.1760218795125262506
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 14:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GE5ueB7z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20251011213952df33f4ba0d00020727-0ebw2s@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251011213952df33f4ba0d00020727
        for <openembedded-core@lists.openembedded.org>;
        Sat, 11 Oct 2025 23:39:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/3ohv8Jq91/ajTdP6kN7HJhEUsCK4bKuGZlz/j2hTuo=;
 b=GE5ueB7zQSX+VwTxjror3bUe/WVRXIhDRFi6wiyC1UwmT/ZMw61EHsetpgM+hM9Hnyw9VM
 fDnUS3irs+o5Ki4E/bjR2/DuPuEe48Q1nnl24x6c0vaZpHJ43GWVHH2Iz/pr/kIoAoCDLfcW
 a4JTSNR6tadkvM2kgAFj9zMPdtSYtjFyuc1QPW8ZeBsAVnAADhrhMwiB7ooZzHQXZA0IO1gw
 xomqGv6RpH5Pxb19PMcmHQu1Q9Pefx/pVvGNxKSkPVhiNw0rcloqI7m/MMLgjoslsz7gSm+w
 ernQKi4AH0UXu7Zu6BwrROMrugQiMGr5rXNVY0TjiEC2elAQinDkGI3w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] qemu: patch CVE-2024-8354
Date: Sat, 11 Oct 2025 23:39:51 +0200
Message-Id: <20251011213951.4176058-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 21:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224724

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-8354.patch             | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1298514cd7..fd1a8647df 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -128,6 +128,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-3446-0005.patch \
            file://CVE-2024-3446-0006.patch \
            file://CVE-2024-3447.patch \
+           file://CVE-2024-8354.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
new file mode 100644
index 0000000000..c469dcabb4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
@@ -0,0 +1,75 @@
+From 746269eaae16423572ae7c0dfeb66140fa882149 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Mon, 15 Sep 2025 14:29:10 +0100
+Subject: [PATCH] hw/usb/hcd-uhci: don't assert for SETUP to non-0 endpoint
+
+If the guest feeds invalid data to the UHCI controller, we
+can assert:
+qemu-system-x86_64: ../../hw/usb/core.c:744: usb_ep_get: Assertion `pid == USB_TOKEN_IN || pid == USB_TOKEN_OUT' failed.
+
+(see issue 2548 for the repro case).  This happens because the guest
+attempts USB_TOKEN_SETUP to an endpoint other than 0, which is not
+valid.  The controller code doesn't catch this guest error, so
+instead we hit the assertion in the USB core code.
+
+Catch the case of SETUP to non-zero endpoint, and treat it as a fatal
+error in the TD, in the same way we do for an invalid PID value in
+the TD.
+
+This is the UHCI equivalent of the same bug in OHCI that we fixed in
+commit 3c3c233677 ("hw/usb/hcd-ohci: Fix #1510, #303: pid not IN or
+OUT").
+
+This bug has been tracked as CVE-2024-8354.
+
+Cc: qemu-stable@nongnu.org
+Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2548
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
+(cherry picked from commit d0af3cd0274e265435170a583c72b9f0a4100dff)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+CVE: CVE-2024-8354
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/746269eaae16423572ae7c0dfeb66140fa882149]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ hw/usb/hcd-uhci.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
+index 0561a6d801..8f4d6a0f71 100644
+--- a/hw/usb/hcd-uhci.c
++++ b/hw/usb/hcd-uhci.c
+@@ -724,6 +724,7 @@ static int uhci_handle_td(UHCIState *s, UHCIQueue *q, uint32_t qh_addr,
+     bool spd;
+     bool queuing = (q != NULL);
+     uint8_t pid = td->token & 0xff;
++    uint8_t ep_id = (td->token >> 15) & 0xf;
+     UHCIAsync *async;
+ 
+     async = uhci_async_find_td(s, td_addr);
+@@ -767,9 +768,14 @@ static int uhci_handle_td(UHCIState *s, UHCIQueue *q, uint32_t qh_addr,
+ 
+     switch (pid) {
+     case USB_TOKEN_OUT:
+-    case USB_TOKEN_SETUP:
+     case USB_TOKEN_IN:
+         break;
++    case USB_TOKEN_SETUP:
++        /* SETUP is only valid to endpoint 0 */
++        if (ep_id == 0) {
++            break;
++        }
++        /* fallthrough */
+     default:
+         /* invalid pid : frame interrupted */
+         s->status |= UHCI_STS_HCPERR;
+@@ -816,7 +822,7 @@ static int uhci_handle_td(UHCIState *s, UHCIQueue *q, uint32_t qh_addr,
+             return uhci_handle_td_error(s, td, td_addr, USB_RET_NODEV,
+                                         int_mask);
+         }
+-        ep = usb_ep_get(dev, pid, (td->token >> 15) & 0xf);
++        ep = usb_ep_get(dev, pid, ep_id);
+         q = uhci_queue_new(s, qh_addr, td, ep);
+     }
+     async = uhci_async_alloc(q, td_addr);

