Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50644CCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 21:39:46 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.8510.1760218782485090660
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 14:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=E79L1Fvi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025101121393902e2cc504700020701-rfnzbj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025101121393902e2cc504700020701
        for <openembedded-core@lists.openembedded.org>;
        Sat, 11 Oct 2025 23:39:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=sMijwykB0gd0Qj9EiooQvV418P03/fWhZms7TRLcYPg=;
 b=E79L1FvijGGCkjI2wmqPOseyduypW5+0pDvKhvlt2K5o/mqp3nJgNCrny8B/TArK1oVg4f
 Vc330S5KXBplQtuABOTbuD6K2XAl0F3uSrU8f84Lvl56Dma9TpfWFE5YvfOHAjPzQt25P0Ma
 af1VMtpSz6B1OAONZqo6JekN7Cbav7p6fxwqjQrQ2B3xdEBtjdsTo34vAibOnyItSoxJzVgL
 SXQ4VV3KrfhPXnwRagheeQCnugJZ50tl1wzx45ogZBb4pxCw2WpTAM6h7ykenWNmje1qJ1rW
 ptHhMjDDPgauSspmm9rJfCPPXsgevKxVOGk2Gb/13wDQeoc7lTpSxbxA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] qemu: patch CVE-2024-8354
Date: Sat, 11 Oct 2025 23:39:36 +0200
Message-Id: <20251011213936.4176031-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 21:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224723

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2024-8354

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-8354.patch             | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 220f0a161cd..60d372fce02 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://CVE-2024-8354.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
new file mode 100644
index 00000000000..5472efcd096
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
+@@ -722,6 +722,7 @@ static int uhci_handle_td(UHCIState *s, UHCIQueue *q, uint32_t qh_addr,
+     bool spd;
+     bool queuing = (q != NULL);
+     uint8_t pid = td->token & 0xff;
++    uint8_t ep_id = (td->token >> 15) & 0xf;
+     UHCIAsync *async;
+ 
+     async = uhci_async_find_td(s, td_addr);
+@@ -765,9 +766,14 @@ static int uhci_handle_td(UHCIState *s, UHCIQueue *q, uint32_t qh_addr,
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
+@@ -814,7 +820,7 @@ static int uhci_handle_td(UHCIState *s, UHCIQueue *q, uint32_t qh_addr,
+             return uhci_handle_td_error(s, td, td_addr, USB_RET_NODEV,
+                                         int_mask);
+         }
+-        ep = usb_ep_get(dev, pid, (td->token >> 15) & 0xf);
++        ep = usb_ep_get(dev, pid, ep_id);
+         q = uhci_queue_new(s, qh_addr, td, ep);
+     }
+     async = uhci_async_alloc(q, td_addr);

