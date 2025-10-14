Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9325CCCD197
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2503.1760481899612661693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mTb+NgUI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so79707455ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481899; x=1761086699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OP+xYJXLbsvcloCWggit6t8xL6ES2uqLGl3ayYU8z74=;
        b=mTb+NgUIeD1hB8q0NElN+zzWLV/F619VE1t2d3jAlVv/wBNNKEFlKxyoNLZNGzc282
         /8vbMMYCB+XaRVOw2c039jcsKqpMbGu66Eije9joRDQ895Y2zCJaB8XhLNqg6E2W6RGl
         UdThPU4eYKkvgiYbGTdukrxFatANVd++HG4kZIrNlvGN64Jhpo9iCeWKs2pfNtva0IbX
         iZY7BVl9EYfXsgXN01t6z1o62gOP7EGZhvM1H99NU3aC8KEc4KqVgH+5y8RtF9rUNlAr
         ynmvOSCcoIHML5QzTBBPI3j6IfHee299L7lYTj0KhTMei+KzYFIkkkLnLXyBuGQBraC4
         AR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481899; x=1761086699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OP+xYJXLbsvcloCWggit6t8xL6ES2uqLGl3ayYU8z74=;
        b=a7SCKKeeNDgf7UUReTGJX1MngWEW616qA1BeNDNnpvvF7VMK7scpmbIwAHLkzsV91C
         sYbyfqiuQ5MQnmRLnlmCB35fhkH0L1D3fMtjglt4FViWQo+F4FzYIF2aaeVCspj2hnlx
         o1PY34lBkY9Tm1Hy21UZW5NyKzEG1d04gqlYyt6ntbgszoZsMtWMQkV+5A46+tUrL9XQ
         YM8oFimde69Wg9PCMVr2ulfkPYLWRIjuv/Tk0OPxSceGE953IPzRO2SzvhJou5wNOHBV
         BYbH1b5AgF8S6ruTUzKGRkHAjy6L6rt8PkDwMy4lizFc6Auy9JCL7wltqGE2Khc3KUx3
         0g1w==
X-Gm-Message-State: AOJu0YzBrwJ57YbSO+3ymw2xOTrDJiHCZFS69e4p3WRgnuC1ifGZka94
	x1ygrMNjXezFdqTx6Am+Svn1bqXfV0TjQbDpL/8RWDQALs/KR7ZWwqFyRjNEvFZIoltCsgSBhlt
	tJYKs
X-Gm-Gg: ASbGncs/ITQdrrWgcSt6Qz8ERge9iFm0jX4P2OtpRDxZ3iD4EO6cF4/3CirfIgac21i
	i/xEiTrOx/jfyQ75qcrsk8B/eaepwYTf/4nGxw3FhSfj72gYaN30HKp9U7/vWLuZ0+jQdPRsTsR
	hUYoV5qeLRYu3vxCTQeLLUTwH+aWcYEe3WE+CbcLJ8JIU2y0QT5P27YFZaCC1aTz5YX7sAEzCab
	BHv1/AS7HKcYGgHvSbVFqYiFXpZrlBsasR9vCAm0ypNkpqFfKsxNZweFJ7OGJra6Cl4kB+tX8KV
	hdLsDy5/J3WnCNVVnFZJXKAOnBNVfxRBLDQBnzRMPBBvGWUaPVtzO5l+mzRJWk3eQCXczP1L1bV
	QIhbFkvW+QSjy4CgLFQ8WEKNUpuvmTHr1
X-Google-Smtp-Source: AGHT+IEaSk2bVNbUetFrvvCAQYtDKBRpLdEPNxhQke5WQiYX5+8Y9E1zn9YmNjVm5Ii3PYLAKZ+AjQ==
X-Received: by 2002:a17:903:298e:b0:27e:eea6:dffc with SMTP id d9443c01a7336-290272e3120mr323524635ad.41.1760481898669;
        Tue, 14 Oct 2025 15:44:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.44.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:44:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/14] qemu: patch CVE-2024-8354
Date: Tue, 14 Oct 2025 15:44:38 -0700
Message-ID: <bebd1b24473e3480ae6c4ae2897fbfdf4942ea11.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224855

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


