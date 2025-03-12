Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD48C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.4759.1741809379093592235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DAF21yZ1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fb0f619dso4729095ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809378; x=1742414178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxcEsmrb4toFcDaBjli3XzhmWVwT2dpnJv4yxX3YDug=;
        b=DAF21yZ1oYaE5LEgiJpMI4DUcmrCD8XDcxKGQ9XTAnHCyExw5Vn2FPZdSBIlS6lj+Z
         qvoc/pR+VGjtBxqIPOc8XB4oIHmfqIUgeV9irTHJfh5d89EVxNyy175hvfNcBe+mzfwY
         fNKz4FXqffTzQKB/KZ5tGrRUquJyEHMc2Y/2ICFYdjS4uzB9A+yVW6U+3Hdfg3gCGoML
         LrFVSDqRMwlCfgJoDGpIAej6I9Mvx69FKuYSWEgxjWSoraECH/2nf493ggztM0SShYoG
         nNiGLM32JEVMDwKqAjduYRlNc37FNoJe5xMnq6a40D/zVP2gGwA4j+PL7NH+styglao9
         33qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809378; x=1742414178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxcEsmrb4toFcDaBjli3XzhmWVwT2dpnJv4yxX3YDug=;
        b=W3NAJ6dY1w/5e7rCwV+ZTFmTR4Y5aK7IX50Na6/erCrkAEjEdqfq4AHmOM5UbI/QaU
         AaCRJsgtQIH+x4plF8+awYGn+Xb/ByWgoIWw4GFM3L/Wfcn7XjVaRER5r4CbxjavZHJ0
         USkLV6As5JxPtGmZ4SaCeA8YoZldBVcin5sX9OWSiBKtD4Is/wOQn6cFd+NLTln5TgY2
         9li+ppdV40XANByuJ/gHS8nUo0FaG9/NU4ZqCgUGI1EtlFlldhNox3L+wLJ9coc9TcWZ
         BSSdc444zzLxzLBI2LdMn3c1YQPMRJqZW5xVxLgOYXk+sc5XUukU5/9b4FzlTa2VLaZU
         bhSw==
X-Gm-Message-State: AOJu0YyAUrYmADgc/KKAQ+C71WO4gH1c9Qqy0l7LoLBUb9OXWIMu5cMP
	dWv5m7ybMZLyLCR8AV4zDumeSX4R6Zbm8ViMt6/18MxDyFH9jKh2xxZTx8KdT+d6Q3ZHFbzw3QV
	e
X-Gm-Gg: ASbGncskyRgjFoJ8Ckd1nft27OrQkLppmFi2alST3ThGD1HKzDCpu3Qb7e8lMYjG5Ok
	slohjF2n0V8oAMIIV0qEbRnQbGET+/ZpI0wxEwC3yP6E5J9D57b1a0ty6msoLeAIO0mswdcIxXl
	DTCQETA+KMhrJDj4prKsgx2/jCdSeoQPCQdyiiCIB4kOibIA5r62yh6dqcDY1EEUyUEo5dknO1w
	DRJ48fxF6vOxkiMNxTBP124v91WXhV0Kqqh48hbOqDYgjLhaJau4V5uDZ/O4AHFzC8hWc4Tsgpi
	objOi/u5DC5cn5YPoaN4aLN1r6/nWHGpkCY=
X-Google-Smtp-Source: AGHT+IGsQWZDJ2K6C3K8FHkYLEkAHl041L6JXNaCCZLP4TFJOK/3WBZb6KwQnPSzy9+5SIoOk3J8LA==
X-Received: by 2002:a05:6a20:d806:b0:1ee:b8bc:3d2e with SMTP id adf61e73a8af0-1f58caf4cabmr14900156637.8.1741809378306;
        Wed, 12 Mar 2025 12:56:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/28] grub: patch CVE-2025-0622
Date: Wed, 12 Mar 2025 12:55:35 -0700
Message-ID: <d9d99bd5baddcb0438e0c28ab6e302ee9fa0c327.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212708

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2025-0622-01.patch         | 35 ++++++++++++++++
 .../grub/files/CVE-2025-0622-02.patch         | 41 +++++++++++++++++++
 .../grub/files/CVE-2025-0622-03.patch         | 38 +++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  3 ++
 4 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
new file mode 100644
index 0000000000..09dbfce5f8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
@@ -0,0 +1,35 @@
+From 2123c5bca7e21fbeb0263df4597ddd7054700726 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 1 Nov 2024 19:24:29 +0000
+Subject: [PATCH 1/3] commands/pgp: Unregister the "check_signatures" hooks on
+ module unload
+
+If the hooks are not removed they can be called after the module has
+been unloaded leading to an use-after-free.
+
+Fixes: CVE-2025-0622
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0622
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2123c5bca7e21fbeb0263df4597ddd7054700726]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/pgp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/grub-core/commands/pgp.c b/grub-core/commands/pgp.c
+index c6766f044..5fadc33c4 100644
+--- a/grub-core/commands/pgp.c
++++ b/grub-core/commands/pgp.c
+@@ -1010,6 +1010,8 @@ GRUB_MOD_INIT(pgp)
+ 
+ GRUB_MOD_FINI(pgp)
+ {
++  grub_register_variable_hook ("check_signatures", NULL, NULL);
++  grub_env_unset ("check_signatures");
+   grub_verifier_unregister (&grub_pubkey_verifier);
+   grub_unregister_extcmd (cmd);
+   grub_unregister_extcmd (cmd_trust);
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
new file mode 100644
index 0000000000..be01da3355
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
@@ -0,0 +1,41 @@
+From 9c16197734ada8d0838407eebe081117799bfe67 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 1 Nov 2024 23:46:55 +0000
+Subject: [PATCH 2/3] normal: Remove variables hooks on module unload
+
+The normal module does not entirely cleanup after itself in
+its GRUB_MOD_FINI() leaving a few variables hooks in place.
+It is not possible to unload normal module now but fix the
+issues for completeness.
+
+On the occasion replace 0s with NULLs for "pager" variable
+hooks unregister.
+
+Fixes: CVE-2025-0622
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0622
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c16197734ada8d0838407eebe081117799bfe67]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/normal/main.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
+index 838f57fa5..04d058f55 100644
+--- a/grub-core/normal/main.c
++++ b/grub-core/normal/main.c
+@@ -582,7 +582,9 @@ GRUB_MOD_FINI(normal)
+   grub_xputs = grub_xputs_saved;
+ 
+   grub_set_history (0);
+-  grub_register_variable_hook ("pager", 0, 0);
++  grub_register_variable_hook ("pager", NULL, NULL);
++  grub_register_variable_hook ("color_normal", NULL, NULL);
++  grub_register_variable_hook ("color_highlight", NULL, NULL);
+   grub_fs_autoload_hook = 0;
+   grub_unregister_command (cmd_clear);
+ }
diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch b/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
new file mode 100644
index 0000000000..79078a4350
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
@@ -0,0 +1,38 @@
+From 7580addfc8c94cedb0cdfd7a1fd65b539215e637 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 1 Nov 2024 23:52:06 +0000
+Subject: [PATCH 3/3] gettext: Remove variables hooks on module unload
+
+The gettext module does not entirely cleanup after itself in
+its GRUB_MOD_FINI() leaving a few variables hooks in place.
+It is not possible to unload gettext module because normal
+module depends on it. Though fix the issues for completeness.
+
+Fixes: CVE-2025-0622
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0622
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7580addfc8c94cedb0cdfd7a1fd65b539215e637]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/gettext/gettext.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index 7a1c14e4f..e4f4f8ee6 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -535,6 +535,10 @@ GRUB_MOD_INIT (gettext)
+ 
+ GRUB_MOD_FINI (gettext)
+ {
++  grub_register_variable_hook ("locale_dir", NULL, NULL);
++  grub_register_variable_hook ("secondary_locale_dir", NULL, NULL);
++  grub_register_variable_hook ("lang", NULL, NULL);
++
+   grub_gettext_delete_list (&main_context);
+   grub_gettext_delete_list (&secondary_context);
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0378d5ee72..3c8860948c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0624.patch \
            file://CVE-2024-45774.patch \
            file://CVE-2024-45775.patch \
+           file://CVE-2025-0622-01.patch \
+           file://CVE-2025-0622-02.patch \
+           file://CVE-2025-0622-03.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


