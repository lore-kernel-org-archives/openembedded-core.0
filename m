Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ADFC5AE5E
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:22 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.621.1700498358241169924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KhS5hVdU;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182, mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35b00cdc9b7so5205005ab.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498357; x=1701103157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gxgc+WpuLLbx2sPSmy/3xjrQhRCQFyYd+KmdPyYOjDs=;
        b=KhS5hVdUQ5u9bazre3kSbTIKvSf5REcjTl8SwkL26LYXJ09k2WAhBFw/D6niWizT84
         Bxmr63TInrQIT9y8mIar08BSWuyjvnZp0COGywnD0BZ3d7j02GHw08pfTfXV8/bJgoSX
         iH2r8UCUAmyMmxguWp/EaN5cjM/kGZ3PPaGoUWA/thJt/lq/qyr95/G+yyFNQEri4Ee9
         ZiGYuO42S0dWgaOBi/OwqB+HK9S1TEZdIbZ5VG1vOhxGPKqmbeDtD+63Uxqa/CYXHjk2
         wZtP0w7hUrJMsBk6wLj7HBbCKtq8+12seP9tRXSOmXKMbdGby+xxWIS0DvPS/LpJTgOC
         d3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498357; x=1701103157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gxgc+WpuLLbx2sPSmy/3xjrQhRCQFyYd+KmdPyYOjDs=;
        b=bWlkqu4DzFCU+QdiV01kI4rBaymCbuzpyLCIYKkX8IDQia65rVdX1/VjgsmQa9q4py
         F5qykfYuDSZOoEEAy5vyiUb+cAtBJVbi0Usp+W1t9T3854Tmzr3t3EaqdcsKJqeNJR//
         aJNHN2lt1pMFa/xIDB+tk6cFKgZOVtlF7KGZ3vsKvLKQ8gJnhHom3EYgC/RKz+jeW3Oh
         iGbkZTcicatWicU2bxiLH3Evjwd8s4o3ROrzc/aXRkd/R+i1lbw46eD4y3ks+AFYuDaR
         xp8xrJ2bxRbNHjOxDt4Og3JaWq2p/ssxPKXMYnLN2+3loypRIdxS2+vOSk9FBa8SsMJz
         reVg==
X-Gm-Message-State: AOJu0YwVGXHXiDJKa6CQOIvGsotDU60jxFMaCsNtkGlTg4k7sUIMDuOl
	9hB18PWiGWyVc1VJZZB8igXlRzSt82OOUxncFps3+A==
X-Google-Smtp-Source: AGHT+IE4eu8LIFEN6Set7qE4obRfQBYFSoEUjFZViolER0UUFhQBk4QHCW3y/0u41yIihSo8oOP6LA==
X-Received: by 2002:a05:6e02:f42:b0:359:cc15:b0b3 with SMTP id y2-20020a056e020f4200b00359cc15b0b3mr9018643ilj.25.1700498357025;
        Mon, 20 Nov 2023 08:39:17 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 11/33] kernel.bbclass: Use strip utility used for kernel build in do_package
Date: Mon, 20 Nov 2023 06:38:25 -1000
Message-Id: <e0bd7ce93a75c7ddb6b1c572453c37407e7e32da.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190900

From: Khem Raj <raj.khem@gmail.com>

os.environ does not pass this down to runstrip() function and in
strip_execs() its using STRIP bitbake variable to find the strip utility
to use. Since there might be a trailing whitespace in KERNEL_STRIP
remove that otherwise python is not able to launch it.
e.g.

FileNotFoundError: [Errno 2] No such file or directory: 'riscv64-yoe-linux-strip '

This is more evident when STRIP and KERNEL_STRIP are different utilities
e.g. when using clang as default toolchain but using gcc+binutils only for
kernel build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 77497dbdca92ab4d6386a071bc281c42a7e8a14b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 2ec9ea2091..16b85dbca4 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -336,7 +336,7 @@ kernel_do_transform_bundled_initramfs() {
 do_transform_bundled_initramfs[dirs] = "${B}"
 
 python do_package:prepend () {
-    os.environ['STRIP'] = d.getVar('KERNEL_STRIP')
+    d.setVar('STRIP',  d.getVar('KERNEL_STRIP').strip())
 }
 
 python do_devshell:prepend () {
-- 
2.34.1


