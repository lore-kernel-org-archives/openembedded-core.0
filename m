Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79146C46CD3
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:41:35 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.17246.1703058088308000443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TfMnXZ0U;
 spf=pass (domain: mvista.com, ip: 209.85.210.54, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6da69dd6e9fso2425497a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 23:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703058087; x=1703662887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAqLrn9bAdOLblt5VoOUCO7yHVKU66w5fKjNMRNKNws=;
        b=TfMnXZ0UprPkiY4tMAiI2iQyPTVC0kE50ty595xfa2aRKccl2tQMvUb+roSyF/XUUZ
         y7DJviGkbVfhVW3B6KufDHxwbljMpi4avyW5Fpvj0Cs60fcmoKsQX6zop2dqeWT6SmpT
         qUlX33BmUHvbkgnMCp59ByplYTZolQ877YQKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703058087; x=1703662887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAqLrn9bAdOLblt5VoOUCO7yHVKU66w5fKjNMRNKNws=;
        b=J573hZ49sFwShx7MRA3TebWcTqsxo0GEFBCf3irZ1EIiPEjW/2JUKgHKROqy899B/y
         mkGKfGxiogbPUzSL5vcnNhVs0SAAehmd3XpCh2eO9wj/5yQJ4vHUZGNht3PWsqnfXybu
         ifv1DPJ/godql7jTh1bRU0XTDrzpwjyEhEzU4+6QwVqoaG24SM054JzOAWI6FeOw28ww
         v60iKNhmD+01hniamgT/c6HNEXomAwFDlFC8RI8Z1YTDaaPHjAY1FAs9ZrOc/L+0RQ7W
         vWPg7MxaEsqmkb10FIuCQgTTo9ZnK/CNitY3toSAxpPuvyZG1NX2mAsz1BFmSLL2hbj6
         MwRQ==
X-Gm-Message-State: AOJu0YxWFAyYQOEGX0wXcoK3ZeN4aqBLFB9cAWCKrf0DyFp8B2EzXBgI
	fmTLnfOXWlePgtPfnijDGCSWcYtRUHy7Mlxb9vk=
X-Google-Smtp-Source: AGHT+IFNt4182PU5YduTzPzv6LGq5TjdcuZPG+hoPfOJCxQk65Cpb6W9279ZIqWptPa1pXHaC8Q+Aw==
X-Received: by 2002:a9d:6293:0:b0:6d9:f1ba:1f01 with SMTP id x19-20020a9d6293000000b006d9f1ba1f01mr16103680otk.6.1703058086698;
        Tue, 19 Dec 2023 23:41:26 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.5.216])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78746000000b006d9632b6195sm200759pfo.43.2023.12.19.23.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:41:26 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [OE-core][kirkstone][PATCH 3/4] libssh: Fix build with clang16
Date: Wed, 20 Dec 2023 13:08:59 +0530
Message-Id: <20231220073900.96121-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220073900.96121-1-vanusuri@mvista.com>
References: <20231220073900.96121-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192775

From: Vijay Anusuri <vanusuri@mvista.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>

Ref: https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/nanbield-nut&id=9323b287ef588f41c13f3520de85eb198f6eaf83

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...prototype-of-des3_encrypt-des3_decry.patch | 46 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.4.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch b/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
new file mode 100644
index 000000000..19775fa52
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
@@ -0,0 +1,46 @@
+From 0cade4573334571055127a2d4fe3641e2397948d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Mar 2023 21:59:19 -0700
+Subject: [PATCH] libgcrypt.c: Fix prototype of des3_encrypt/des3_decrypt
+
+This is to match the prototype for callback functions which are now emitted as
+errors by clang16
+
+Fixes
+
+TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/libssh/0.10.4-r0/git/src/libgcrypt.c:903:20: error: incompatible function pointer types initializing 'void (*)(struct ssh_cipher_struct *, void *, void *, size_t)' (aka 'void (*)(struct ssh_cipher_struct *, void *, void *, unsigned int)') with an expression of type 'void (struct ssh_cipher_struct *, void *, void *, unsigned long)' [-Wincompatible-function-pointer-types]
+    .encrypt     = des3_encrypt,
+                   ^~~~~~~~~~~~
+TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/libssh/0.10.4-r0/git/src/libgcrypt.c:904:20: error: incompatible function pointer types initializing 'void (*)(struct ssh_cipher_struct *, void *, void *, size_t)' (aka 'void (*)(struct ssh_cipher_struct *, void *, void *, unsigned int)') with an expression of type 'void (struct ssh_cipher_struct *, void *, void *, unsigned long)' [-Wincompatible-function-pointer-types]
+    .decrypt     = des3_decrypt
+                   ^~~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libgcrypt.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libgcrypt.c b/src/libgcrypt.c
+index da5588ad..e482b654 100644
+--- a/src/libgcrypt.c
++++ b/src/libgcrypt.c
+@@ -469,12 +469,12 @@ static int des3_set_key(struct ssh_cipher_struct *cipher, void *key, void *IV) {
+ }
+ 
+ static void des3_encrypt(struct ssh_cipher_struct *cipher, void *in,
+-    void *out, unsigned long len) {
++    void *out, size_t len) {
+   gcry_cipher_encrypt(cipher->key[0], out, len, in, len);
+ }
+ 
+ static void des3_decrypt(struct ssh_cipher_struct *cipher, void *in,
+-    void *out, unsigned long len) {
++    void *out, size_t len) {
+   gcry_cipher_decrypt(cipher->key[0], out, len, in, len);
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
index 801644d95..4b2ced5e5 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
@@ -8,6 +8,7 @@ DEPENDS = "zlib openssl"
 
 SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10 \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
+           file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
           "
 SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
-- 
2.25.1


