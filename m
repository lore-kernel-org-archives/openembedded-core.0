Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1506CCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:23 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.3200.1760733561412080585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wbkoup/M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7841da939deso2317310b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733560; x=1761338360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZc6cBjbqXIOKjsfZoTQorsImsHPejnobo7+vzkiX50=;
        b=wbkoup/MnobEFANUcHMcGNJ02YF5rwxs+rV2q5aRDOdSrhlZDXv2biQB6+MMfJ3cXi
         xUJSQKrdiwYEEa/9O/H6ACZRZK9hZMM0TjI8JrKh4j2+t+XlHzSDwZDnA3KZYJDCxgMX
         ZqqJGgaR6nyrBXAJgqU/hfha7lRp5+FPH9501TxOJDJFALBxTbEirIFMilRk88Vtc+tB
         FEuG6nYTaMS/jYvDdZzOkDx7PUIo9yhB/qNux17kmWdSCQeuSQoiP1KlLrankA2EvxHb
         FVJ2fGFvLJkqAW+jSjpBQZmf82FRJpd4ewZ9VWm3xAT5PkpxFUJn6fOb/Zal5bFYMbNr
         6jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733560; x=1761338360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZc6cBjbqXIOKjsfZoTQorsImsHPejnobo7+vzkiX50=;
        b=ThqgB+82XsFea5fby+xCNVN7tZPnKpbP7o1EmD6umOW/NfZURzuISOZgKcHy4ems6L
         MVrStBOA7JTes1wHJIltBc7EyB4g4skFjfB6NTZaScBiHkmB1Z3TXKLzUrduO+NsAY4l
         YC0A9CfqnllJPKZPozjyy3Bv8TDpO1QcZUVr754mFSi88KRj/pmh6f+Js+MlQLHVmDFw
         wuVyV/VMomp47pRwmkFHpgqzMzVSydLMFGKSL5EQm7Og+ILT1dGNVkfd/ffyi9k2K6pe
         vjPRfDJL1bgEKB4n4zIjVCOW1VsBPcJwZJmRgBZum2gZD5oKsakil4KsE75wYn1ehK9t
         Ygzg==
X-Gm-Message-State: AOJu0YzfbnPQL5e3QAQPNDdX4M0FuKqLI6QG7fMSMkrCVcf5DoKgMXak
	/L2voMDzLy6oYg0iMm+MNtCtZmBUtGlWzPYlgNWOLAzg3XSFTU3hMkPhh7m53kRRn3JrKW5ZCla
	29g0Ecqs=
X-Gm-Gg: ASbGncuP/aGC2J656VMWiM/amPd6pd8J772teifyDLeHl8yRGTQzB/F1PHYXBtxYRd2
	3eua5yLDpLcvg5NHMwyOCkmQKLhNMVrvVbtf7s2YMRXUX2Enem7WK+3DgOekvCn2omQXwApVq5+
	pOKr+fXCWL0b1+zd3iK2LKIQI8QpgsvnchGrFDs7WC3opnMlZqLi/+OwGLzKULT/LbqmaHxh6To
	F8D3wH+ogk3W/jAzzWg4oL6K2JEF/h6nyqdr+Fq0ZW1gefcep8ZMC2PpmlhmA4paCnXuoDPvmtR
	sHBIGRe1h7ERtvq+sPWit/5jWLQoYVvkUFE0XLmMU7wd1mcFC/KUejNMDzgbJE9ciHx97Y/6C/L
	STq+uJ3ejvFs4xbu4fW3zIep3QyGuKq/AWaBcmsqU2KJ/NjkyGuZh+ugX5Gc29D7dow==
X-Google-Smtp-Source: AGHT+IFO6+acawB6sAicRkFKex2wZQb+qT9hDKe6DiVrBNaxO2AdZCe3QsDZ8sBT0GtR0o0COcDahg==
X-Received: by 2002:a05:6a00:94c3:b0:792:2dd9:d8e9 with SMTP id d2e1a72fcca58-7a2208fe6camr7163166b3a.4.1760733560542;
        Fri, 17 Oct 2025 13:39:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/26] qemu: patch CVE-2024-8354
Date: Fri, 17 Oct 2025 13:38:44 -0700
Message-ID: <4bab523ed8ee34e8c09deb631fc82417aa0784b9.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225035

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2024-8354

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-8354.patch             | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 220f0a161c..60d372fce0 100644
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
index 0000000000..5472efcd09
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
-- 
2.43.0


