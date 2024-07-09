Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9384BC41513
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 19:30:09 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.4644.1720553409052637471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 12:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NjdumryY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70b4a8a5587so614494b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720553408; x=1721158208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AkAM1EaOuWNSu5L68nqqUF6qxedoScBRBTYayAbNYM=;
        b=NjdumryYDUikSeM05EmHT3UXxI7XFP7FL2FVMLV6Xcsx7caTuWWOs23Rt5E9hXC3ek
         YV2PRJREWa4Kv1bA2gbO37dApVvqfqaAmyUuz6G7Zo1Pld7sXqF+0IemjtKxDfqsRDdZ
         dB0xCUDrrv5Fi8sIC4KMW8eKIRPR/kIp+6Q3+tIiwKVfGin3l4J5uuGX+YnYt0yGMtw6
         ASPQzO48p7doZMiVX7wwe1lUKRSyHpB5xSLY2shmBi54bnp1ytf11KDQGsdnfPo2bXKu
         a8QOKq/OzQ3TP5fmzTIkZkLRJxP/b6/1NG8zpMVeqOpSXggKFjB665HnAT67Tg2O3KRA
         vsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553408; x=1721158208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AkAM1EaOuWNSu5L68nqqUF6qxedoScBRBTYayAbNYM=;
        b=NkFfCtkEriOQYRknfakX1w0BzM1Z1kOADDUpCQmP7GSl3U/2KVP2TBqxvjFJ5Eixo8
         32ZLCYLBZ+CZA3ihfhksx6mMDWttnlxNjoQcpEMI4OeAJC28zW+f6uojhZvUpK0iKE5L
         QiCOvhaa/uZir9gwR6jwuf6OoXR6p5fyYXumlb4PVxM72ai1ZrMCvkDrW9/onrzXjnnm
         bU98CmjATvQZJUYxBkWj3DX8RI8siQWDN7R8DufncR3kFd8VeZ+hbE39sswSrVsxOYfz
         Gpmyytj8tGJGncPpl2yn64xfziWw8JoFe4K2P4jh/qb1ecfcqssrLWcI/GvcBZQvXYW2
         ihcg==
X-Gm-Message-State: AOJu0YzVH0ea3fhzjt8wDb2ie91+u8hQ3khptw+DTwQ6YERXSjIcFvYo
	fcL/0c3bKU8JCIG+MMyaiM1jEt6v6imCSpOaKgVm4H4StWxklbBf2aHVi0PP4MvqGW1IKDaule0
	a
X-Google-Smtp-Source: AGHT+IFeJK3AeeMnJ9CWH96SRW1doapQ4GUR4FfiC6jtiZw4HkuZkn9ayRl8tjSnT0otFOP3lQc0qg==
X-Received: by 2002:a05:6a00:1797:b0:706:759a:70bf with SMTP id d2e1a72fcca58-70b435686b8mr4426087b3a.13.1720553408183;
        Tue, 09 Jul 2024 12:30:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438995a8sm2282780b3a.10.2024.07.09.12.30.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:30:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/7] qemu: Upgrade 8.2.1 -> 8.2.2
Date: Tue,  9 Jul 2024 12:29:55 -0700
Message-Id: <f548a3a24f3fc26b09e2fcc8544065beb5293f91.1720553275.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720553275.git.steve@sakoman.com>
References: <cover.1720553275.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 19:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201675

From: Xiangyu Chen <xiangyu.chen@windriver.com>

This was a bugfix release, this version fixed several important fixes
according to upstream.

Dropped CVE-2023-6683.patch since already contained the fix.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...u-native_8.2.1.bb => qemu-native_8.2.2.bb} |  0
 ...e_8.2.1.bb => qemu-system-native_8.2.2.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 .../qemu/qemu/CVE-2023-6683.patch             | 91 -------------------
 .../qemu/{qemu_8.2.1.bb => qemu_8.2.2.bb}     |  0
 5 files changed, 1 insertion(+), 93 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.1.bb => qemu-native_8.2.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.1.bb => qemu-system-native_8.2.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
 rename meta/recipes-devtools/qemu/{qemu_8.2.1.bb => qemu_8.2.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb b/meta/recipes-devtools/qemu/qemu-native_8.2.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.2.1.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.2.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.2.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.2.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d22bc31ce3..e121ae70cc 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,7 +39,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0003-linux-user-Add-strace-for-shmat.patch \
            file://0004-linux-user-Rewrite-target_shmat.patch \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch \
-           file://CVE-2023-6683.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            file://CVE-2024-3446-01.patch \
@@ -63,7 +62,7 @@ SRC_URI:append:class-native = " \
 	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch \
         "
 
-SRC_URI[sha256sum] = "8562751158175f9d187c5f22b57555abe3c870f0325c8ced12c34c6d987729be"
+SRC_URI[sha256sum] = "847346c1b82c1a54b2c38f6edbd85549edeb17430b7d4d3da12620e2962bc4f3"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
deleted file mode 100644
index 732cb6af18..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 405484b29f6548c7b86549b0f961b906337aa68a Mon Sep 17 00:00:00 2001
-From: Fiona Ebner <f.ebner@proxmox.com>
-Date: Wed, 24 Jan 2024 11:57:48 +0100
-Subject: [PATCH] ui/clipboard: mark type as not available when there is no
- data
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With VNC, a client can send a non-extended VNC_MSG_CLIENT_CUT_TEXT
-message with len=0. In qemu_clipboard_set_data(), the clipboard info
-will be updated setting data to NULL (because g_memdup(data, size)
-returns NULL when size is 0). If the client does not set the
-VNC_ENCODING_CLIPBOARD_EXT feature when setting up the encodings, then
-the 'request' callback for the clipboard peer is not initialized.
-Later, because data is NULL, qemu_clipboard_request() can be reached
-via vdagent_chr_write() and vdagent_clipboard_recv_request() and
-there, the clipboard owner's 'request' callback will be attempted to
-be called, but that is a NULL pointer.
-
-In particular, this can happen when using the KRDC (22.12.3) VNC
-client.
-
-Another scenario leading to the same issue is with two clients (say
-noVNC and KRDC):
-
-The noVNC client sets the extension VNC_FEATURE_CLIPBOARD_EXT and
-initializes its cbpeer.
-
-The KRDC client does not, but triggers a vnc_client_cut_text() (note
-it's not the _ext variant)). There, a new clipboard info with it as
-the 'owner' is created and via qemu_clipboard_set_data() is called,
-which in turn calls qemu_clipboard_update() with that info.
-
-In qemu_clipboard_update(), the notifier for the noVNC client will be
-called, i.e. vnc_clipboard_notify() and also set vs->cbinfo for the
-noVNC client. The 'owner' in that clipboard info is the clipboard peer
-for the KRDC client, which did not initialize the 'request' function.
-That sounds correct to me, it is the owner of that clipboard info.
-
-Then when noVNC sends a VNC_MSG_CLIENT_CUT_TEXT message (it did set
-the VNC_FEATURE_CLIPBOARD_EXT feature correctly, so a check for it
-passes), that clipboard info is passed to qemu_clipboard_request() and
-the original segfault still happens.
-
-Fix the issue by handling updates with size 0 differently. In
-particular, mark in the clipboard info that the type is not available.
-
-While at it, switch to g_memdup2(), because g_memdup() is deprecated.
-
-Cc: qemu-stable@nongnu.org
-Fixes: CVE-2023-6683
-Reported-by: Markus Frank <m.frank@proxmox.com>
-Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Tested-by: Markus Frank <m.frank@proxmox.com>
-Message-ID: <20240124105749.204610-1-f.ebner@proxmox.com>
-
-CVE: CVE-2023-6683
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/405484b29f6548c7b86549b0f961b906337aa68a]
-Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
-
----
- ui/clipboard.c | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/ui/clipboard.c b/ui/clipboard.c
-index 3d14bffaf80f..b3f6fa3c9e1f 100644
---- a/ui/clipboard.c
-+++ b/ui/clipboard.c
-@@ -163,9 +163,15 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
-     }
- 
-     g_free(info->types[type].data);
--    info->types[type].data = g_memdup(data, size);
--    info->types[type].size = size;
--    info->types[type].available = true;
-+    if (size) {
-+        info->types[type].data = g_memdup2(data, size);
-+        info->types[type].size = size;
-+        info->types[type].available = true;
-+    } else {
-+        info->types[type].data = NULL;
-+        info->types[type].size = 0;
-+        info->types[type].available = false;
-+    }
- 
-     if (update) {
-         qemu_clipboard_update(info);
diff --git a/meta/recipes-devtools/qemu/qemu_8.2.1.bb b/meta/recipes-devtools/qemu/qemu_8.2.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.2.1.bb
rename to meta/recipes-devtools/qemu/qemu_8.2.2.bb
-- 
2.34.1


