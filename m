Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C946C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 17:09:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.50179.1681146587370154457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 10:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZiYg50A+;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id n14so30304204plc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681146586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2ttOyalcSezD6KB8sqQk2EJXKnpiMEISGFNJ0B+kFA=;
        b=ZiYg50A+T2VhtuYdUUZY66d5WANKB+8NHJ4uv7VSyBkUQTTRcJrxMX+m2/au3eOEWS
         aLorpHI64ewAw799tWOVTg7ZCRjKgYSV4gk1eY3GEoCqXtxL8+t7k3wqpqn5wK7wvBBb
         JkwFSIWuKTndDkMy83BA/ey9YciyYTtTA8ZxS+tsHq+q4vmMImnKjyJSvm/dn774wWq8
         oTC4ZTueGD/yMIFu54rSh+voDU4yleXgPtTNpU5qoqrjtAQm1eUtxVY6pcfggI/17AgT
         fzfqO318OSyzZXMp2UH5nNi/DyHGIeWDV80Kz72E09f+YDpbgdn9T/JuyKLyNcVfUgMC
         YipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681146586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2ttOyalcSezD6KB8sqQk2EJXKnpiMEISGFNJ0B+kFA=;
        b=WQSCu7K4nVt0ihMm66uZpeG7zAm1uPLjT16bW6QYsSobBU/3srB1+u29sTVyow5Yu6
         De/A4uFoMvXPkEzE3p/KQc7R4sw+1LAvYv/AyU8c1qm2OkhaftKHXBOgpyWuRPDsVMf8
         3UYmFPR463Tdwx7xz7S8BxzXCkG4n8zjsxfyEdaZGo9GQm2jO1Zefm/Pzfjzk/Bwqi3R
         zgqriqD+KeEg3HlwHXu8f60Jn9W8kmAJLlAnAVZoua4i4WF0A5uw7g7jNy+PM/828ZmS
         msc7Pb7q7X2w2ktFhMVVLbzbkM/VphWV3osvShGb8hRzWE/FhBCWYQUt3oFy5uOQg/L2
         SWxg==
X-Gm-Message-State: AAQBX9fsMnwbvJGDvJ+8Iwe38/f/vMudJ6WNplwTx3ugL8/3KOFo9GJY
	1cKXtrRvTc6CWsUZj9gEcpDO5pXvsye4Sw==
X-Google-Smtp-Source: AKy350bstCD5xwsJP3Hhuz5uqJNIiK4GHpTQclsJgVK4Fr1PJZrtHY5gtmslEAU4sNl+XB9HOfey7g==
X-Received: by 2002:a17:903:453:b0:1a0:4046:23f2 with SMTP id iw19-20020a170903045300b001a0404623f2mr12250136plb.56.1681146586451;
        Mon, 10 Apr 2023 10:09:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::8193])
        by smtp.gmail.com with ESMTPSA id v22-20020a1709028d9600b001a0567811fbsm8040981plo.127.2023.04.10.10.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 10:09:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] systemd: Refresh a musl patch to remove patch-fuzz with 253.3
Date: Mon, 10 Apr 2023 10:09:43 -0700
Message-Id: <20230410170943.432064-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 17:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179895

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>
---
 ...k-parse_printf_format-implementation.patch | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch
index 6f01721459..2090d81dc3 100644
--- a/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch
@@ -21,8 +21,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
 
-diff --git a/meson.build b/meson.build
-index bfc86857d6..fb96143c37 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -755,6 +755,7 @@ endif
@@ -31,10 +29,8 @@ index bfc86857d6..fb96143c37 100644
                    'linux/vm_sockets.h',
 +                  'printf.h',
                    'sys/auxv.h',
+                   'threads.h',
                    'valgrind/memcheck.h',
-                   'valgrind/valgrind.h',
-diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 7aae031d81..1aa9f5006d 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
 @@ -173,6 +173,11 @@ endforeach
@@ -49,9 +45,6 @@ index 7aae031d81..1aa9f5006d 100644
  ############################################################
  
  arch_list = [
-diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
-new file mode 100644
-index 0000000000..49437e5445
 --- /dev/null
 +++ b/src/basic/parse-printf-format.c
 @@ -0,0 +1,273 @@
@@ -328,9 +321,6 @@ index 0000000000..49437e5445
 +
 +        return last;
 +}
-diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
-new file mode 100644
-index 0000000000..47be7522d7
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
@@ -391,8 +381,6 @@ index 0000000000..47be7522d7
 +size_t parse_printf_format(const char *fmt, size_t n, int *types);
 +
 +#endif /* HAVE_PRINTF_H */
-diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index 4e93ac90c9..f9deb6f662 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
 @@ -1,12 +1,12 @@
@@ -409,8 +397,6 @@ index 4e93ac90c9..f9deb6f662 100644
  
  _printf_(3, 4)
  static inline char *snprintf_ok(char *buf, size_t len, const char *format, ...) {
-diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
-index 3b74d2246e..136ebcb153 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
 @@ -2,7 +2,6 @@
@@ -429,6 +415,3 @@ index 3b74d2246e..136ebcb153 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
--- 
-2.39.2
-
-- 
2.40.0


