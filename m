Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5140DCD1283
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 07:57:10 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.32679.1711958223576185371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 00:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jLKmIok9;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e24c889618so5210625ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711958222; x=1712563022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0J2F8ZG04HjYfo3B0tkBB9JKIG0nXFCb3AG+gqBpbg=;
        b=jLKmIok9yUX+/DjgVGOtoJm+o1kblqXiBTxIOFgjsBeo3J4cIj8nmrepppeBM4latz
         49T543G/RBMUXli81zapNUjRCEMwCv5utckNSfGFlA5kegdgXRIud4DNdWcsG3MMKt0C
         cJ7pp27Y3LREN/HlWKXCFMA6H2sKZ4bUr5358=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711958222; x=1712563022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0J2F8ZG04HjYfo3B0tkBB9JKIG0nXFCb3AG+gqBpbg=;
        b=s1zTyT+WNXijV6eSan7vKa7UisUl7lKYqZXa9UJvZ50UNar9HVWfXGCb8VU7dgUGmn
         uCbWNfWWa5d0qAqmDG7+3zDG3p2VXqQ4WklFiZOeeolOhW6QD+cGW4WXd3nF/aYWh3Vf
         wIoDGWqfs+g9Dk82Bi9QPbiMZ8W8YHKkbBwcVJfBGrMbOt2nw125AUBLKtQ46ov7++1i
         5nYoO7yPoHv1y0y7+4LK/WY5GDcgTbtuW0bF1XfhrcrLlfmRJHx/bLB8bYst7cYiL0DT
         UnkYHLHBG3TgouOJJDZhnG8+bfNb7lwUE+Lwg2/IHB3J5GgwRYfqnYoLPVbBHotXP8CR
         qblQ==
X-Gm-Message-State: AOJu0Ywf1pVerbYHDqJCM4oi9asWon6wmIU1NdaIWqJX5t2YHytSYG+p
	NLmQaPGUB1Vkvr/mMTFCtfqfooxoO5G5uTVAxX81so3hBAzNQnWfwQ/te74pC3UBEpOkTZM721E
	5
X-Google-Smtp-Source: AGHT+IHeNpKvdxLUoOns02fUR5nXfw4xcX6X7GKAIq0e9sKCwVADxWzhq51g1QHpX5ZehrKukjrl7g==
X-Received: by 2002:a17:902:8304:b0:1e0:e224:a68d with SMTP id bd4-20020a170902830400b001e0e224a68dmr7128531plb.52.1711958221934;
        Mon, 01 Apr 2024 00:57:01 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb1:b5b7:7a4c:9b25:3ce3:1b08])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b001e2526a5cc3sm2039391plb.307.2024.04.01.00.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 00:57:01 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] qemu: Fix for CVE-2023-6683
Date: Mon,  1 Apr 2024 13:26:48 +0530
Message-Id: <20240401075648.67917-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 07:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197676

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/405484b29f6548c7b86549b0f961b906337aa68a

Reference: https://security-tracker.debian.org/tracker/CVE-2023-6683

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-6683.patch             | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 08ce72546d..856fe64fe7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -111,6 +111,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-3019-0001.patch \
            file://CVE-2023-3019-0002.patch \
            file://CVE-2023-3019-0003.patch \
+           file://CVE-2023-6683.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
new file mode 100644
index 0000000000..e528574076
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
@@ -0,0 +1,92 @@
+From 405484b29f6548c7b86549b0f961b906337aa68a Mon Sep 17 00:00:00 2001
+From: Fiona Ebner <f.ebner@proxmox.com>
+Date: Wed, 24 Jan 2024 11:57:48 +0100
+Subject: [PATCH] ui/clipboard: mark type as not available when there is no
+ data
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With VNC, a client can send a non-extended VNC_MSG_CLIENT_CUT_TEXT
+message with len=0. In qemu_clipboard_set_data(), the clipboard info
+will be updated setting data to NULL (because g_memdup(data, size)
+returns NULL when size is 0). If the client does not set the
+VNC_ENCODING_CLIPBOARD_EXT feature when setting up the encodings, then
+the 'request' callback for the clipboard peer is not initialized.
+Later, because data is NULL, qemu_clipboard_request() can be reached
+via vdagent_chr_write() and vdagent_clipboard_recv_request() and
+there, the clipboard owner's 'request' callback will be attempted to
+be called, but that is a NULL pointer.
+
+In particular, this can happen when using the KRDC (22.12.3) VNC
+client.
+
+Another scenario leading to the same issue is with two clients (say
+noVNC and KRDC):
+
+The noVNC client sets the extension VNC_FEATURE_CLIPBOARD_EXT and
+initializes its cbpeer.
+
+The KRDC client does not, but triggers a vnc_client_cut_text() (note
+it's not the _ext variant)). There, a new clipboard info with it as
+the 'owner' is created and via qemu_clipboard_set_data() is called,
+which in turn calls qemu_clipboard_update() with that info.
+
+In qemu_clipboard_update(), the notifier for the noVNC client will be
+called, i.e. vnc_clipboard_notify() and also set vs->cbinfo for the
+noVNC client. The 'owner' in that clipboard info is the clipboard peer
+for the KRDC client, which did not initialize the 'request' function.
+That sounds correct to me, it is the owner of that clipboard info.
+
+Then when noVNC sends a VNC_MSG_CLIENT_CUT_TEXT message (it did set
+the VNC_FEATURE_CLIPBOARD_EXT feature correctly, so a check for it
+passes), that clipboard info is passed to qemu_clipboard_request() and
+the original segfault still happens.
+
+Fix the issue by handling updates with size 0 differently. In
+particular, mark in the clipboard info that the type is not available.
+
+While at it, switch to g_memdup2(), because g_memdup() is deprecated.
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2023-6683
+Reported-by: Markus Frank <m.frank@proxmox.com>
+Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Tested-by: Markus Frank <m.frank@proxmox.com>
+Message-ID: <20240124105749.204610-1-f.ebner@proxmox.com>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/405484b29f6548c7b86549b0f961b906337aa68a]
+CVE: CVE-2023-6683
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ ui/clipboard.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/ui/clipboard.c b/ui/clipboard.c
+index 3d14bffaf80..b3f6fa3c9e1 100644
+--- a/ui/clipboard.c
++++ b/ui/clipboard.c
+@@ -163,9 +163,15 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
+     }
+ 
+     g_free(info->types[type].data);
+-    info->types[type].data = g_memdup(data, size);
+-    info->types[type].size = size;
+-    info->types[type].available = true;
++    if (size) {
++        info->types[type].data = g_memdup2(data, size);
++        info->types[type].size = size;
++        info->types[type].available = true;
++    } else {
++        info->types[type].data = NULL;
++        info->types[type].size = 0;
++        info->types[type].available = false;
++    }
+ 
+     if (update) {
+         qemu_clipboard_update(info);
+-- 
+GitLab
+
-- 
2.25.1


