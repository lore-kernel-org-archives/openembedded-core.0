Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C04CD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:47:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3147.1712116037565834819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=O6EGda6I;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ea8ee55812so5901752b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712116037; x=1712720837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZNgdTk8Zu6i94fZnTMsuYYRjim1b9EkpC0WJmIz7QU=;
        b=O6EGda6Ihfguiq7f8dn+2EkD2ymsw23r/+c7wMvqkYvw7xeVfQWwbOus/7nLS0dw+3
         T8ILHTx9AN+M1XGpU4cCje1zidvuRvjEJLdbNNRS9IjRrA+kvpxN64d/XKhxVnx/bOm/
         jQxZaSw49acq5eTAJc1BJURAhaf19sPmHZuaqANmU/aWmsImVYmkw3bQ1JrxxD+gDJPX
         5bFJ3qETHy6YaMyvNtlvEYDG5/Utul02eWJhl6HTPzfX2zpLV3m5g8YEisgDE7H3SWj3
         Dutog1FKiDrj0tsA7RHruayrz/VKzWoUcBI36BB/xH4K/GtEgSlX0lJXHS+WNIsjtGSK
         VEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712116037; x=1712720837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZNgdTk8Zu6i94fZnTMsuYYRjim1b9EkpC0WJmIz7QU=;
        b=A5LVA2VZvy6Zkt+l7/pSfGsV3KeX5pbo9EPBv19LGR2G+dSL+jenLXk1ifFO8m9XgW
         4xuln2Eqd+zBjWK5bCu+rIoNDvjZiBmaI8ZiGudvTmrwsl9qLIxpDRVEHiVM/LjK4KB/
         DdrY68o/RrrHC4VjhGWgkEYPCc3uY3ecliyPlEq0/EKvzCX757e1BubA10ycOlwjaXX5
         Ajaq8VV10Fe3CHE/uieiqaHZ5P0Noai3yv/BNm9oKe1HctUEDKRoGl5BeOX8IizXrOud
         rUd4hU4Xe3eM1QrVtbqoClqHjUvjW4tyyv1IdmA0PlVYKfApEUltx2t5aJnGdkDkDV1J
         ldTw==
X-Gm-Message-State: AOJu0Yx1pHX+tbNljWprmEAQP/wor5lArF2W4S8NLC6bbOudO5adkp70
	QPfRSBQMPxCgcifl8OuyDwZIZzvDzvpHpgTsgo8PJG8qULTHmQz4EN94l6AwIuE7G3qaLTEfvSV
	mNcc=
X-Google-Smtp-Source: AGHT+IEeeFrlsoWiC1Qk9zeOqRBl9doxqWMxENWTMbvwXgv8I04bvQCgT0qs6BEAGkaZUOdx/jzV+g==
X-Received: by 2002:a05:6a20:3948:b0:1a3:aecb:db60 with SMTP id r8-20020a056a20394800b001a3aecbdb60mr18641281pzg.9.1712116036761;
        Tue, 02 Apr 2024 20:47:16 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902c44b00b001e278fb17c5sm2326128plm.150.2024.04.02.20.47.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:47:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] qemu: Fix for CVE-2023-6683
Date: Tue,  2 Apr 2024 17:46:58 -1000
Message-Id: <f099f9ff95c42444cbfa63630a6f160fd98997ed.1712115855.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712115855.git.steve@sakoman.com>
References: <cover.1712115855.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197898

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/405484b29f6548c7b86549b0f961b906337aa68a

Reference: https://security-tracker.debian.org/tracker/CVE-2023-6683

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-6683.patch             | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ad6b310137..4747310ae4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -108,6 +108,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the-block-size.patch \
            file://scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch \
            file://CVE-2023-42467.patch \
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
2.34.1


