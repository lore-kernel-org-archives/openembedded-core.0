Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1A2CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 14:38:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.20515.1760971088206577106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 07:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bsDsLDvG;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-426edfffc66so3282171f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760971086; x=1761575886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViRjxr2YxQOmRJvCYU2hRB3cDDoanMttN6Xx2qbuBp0=;
        b=bsDsLDvGGvWUe5Biqd7ZG1LtIc6NoSAa7ptcP2KatPiBXa/l4J1jt2Onzx663B2UCE
         zGtuN+wJ/RGOjyhYtw0iVxSpO9pTA0ilZIRMWq7/g6dN1p4RHwgTRv02L2/OEKFpMPll
         jm/e4R2tR80Rq8g4NZjIMoCUnVtYA98hnpb2XryByoHZzhvMUe+R7Z7yia/+Xsk9OH54
         MS9+9NbKpZEcgDlriS3k7mtRCD63b6d/SOu79ejG41EHzBWaWUxI64EzJATbqc0r6Moe
         MQ5Rms9XftYXOajBYirqjm/ZZ4VsdUCnPd9T55uuA15VUv1iiiGKKxHNj+ytVnepQHNa
         o3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760971086; x=1761575886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViRjxr2YxQOmRJvCYU2hRB3cDDoanMttN6Xx2qbuBp0=;
        b=aLnLU3I0gA/tiM0fQvTj1FH8xA/h4WE8jH655JOKIQPd0YxYJyZYf/g5sHe7ypKNNK
         Pn/sy3MAtaFvFQu6s7mZvOhEsnGVYdafmE6PKXAxTfrdSLcBJXxmj8othfBFA88obR+X
         mYz9/kJMP9N5lXMKHM9kVAP0Pc/FM/1FlynV8urJ1cwE0uTj+8p6knRP8txSXZBu8yUE
         v5EecHbxZPshyTY+WnqQCReiCKRz1gjBdrEvPQ/E9uMoKXm3yXSmhFreYULEniGk61Kz
         kqfbVyhdAI6v35dn3kRN0TnLlL2hAKfyfwruJTwKfPoFUE8J8q+cj7m1/afoJyLtRdhQ
         fsOg==
X-Gm-Message-State: AOJu0Yx6RfPapVBGdKr/9Bers6YdIiXahIr4abSP6vfgLK1jGwnBW95g
	dwUsEr3eYyX54ILmL9JjhwtAXZj3yNdps6zCRZwrcXniVfrEiWUTlMgKhfzDFQ==
X-Gm-Gg: ASbGncvL7DIUBbNXX4dLvkpCUdmaXmjSgAGQEbYFX2C584PpS/cjpwmslydgOU4CH2x
	5WkHjc/iLpdryqcrd/cc9L0nKmXZIeOVun8h+pY2jHWvNtO6FuwDai/QekA3SHeZSCA631Ywgsz
	BbJMJ+5h3/Z97Ox8SkdZLNsg9BqbxrrXaxfsXO32KG7y4fAr2p9XWQLir5k2GkJObNC99AgirNH
	ScNV1M8+ycqxezJEoqZTt56btdoLvfJyb4mEcL3Dri6HD9Voe8EFuR4MeMtWYD0tmOroppk9+rc
	VV947F/C+VsMhLeThGNs1AdAEuzZ+NavNkA1PGS8FtVeJKN/sMiZbaSmb8MaF5rsniZg+TOnLQu
	ShJyVFpFZRWalHqzRJxTPMyBo7ARo0IZT676E62A3sojNY0Irx9ArcQlI4TlT236b8pTtnrAXJh
	+kdCeWwGcz1olaME3Gq/r1q8TWqn81uLdnakvpVy2xC8pW
X-Google-Smtp-Source: AGHT+IFC59GF8AjRW5yyvOCRB2uD80yfxM76kYRXr/eRxarZjv929awEIEm0acnFVvDbs8YytCwPYg==
X-Received: by 2002:a05:6000:144e:b0:426:fb63:c01f with SMTP id ffacd0b85a97d-42704bf71ecmr10045021f8f.29.1760971086360;
        Mon, 20 Oct 2025 07:38:06 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm13559472f8f.10.2025.10.20.07.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:38:05 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] flex: fix build with gcc-15 on host
Date: Mon, 20 Oct 2025 16:37:59 +0200
Message-ID: <20251020143759.859329-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 14:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225120

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/853017/

../../flex-2.6.4/src/../lib/malloc.c:6:12: warning: conflicting types for built-in function ‘malloc’; expected ‘void *(long unsigned int)’ [-Wbuiltin-declaration-mismatch]
    6 |      void *malloc ();
      |            ^~~~~~
../../flex-2.6.4/src/../lib/malloc.c:5:1: note: ‘malloc’ is declared in header ‘<stdlib.h>’
    4 |      #include <sys/types.h>
  +++ |+#include <stdlib.h>
    5 |
../../flex-2.6.4/src/../lib/malloc.c: In function ‘rpl_malloc’:
../../flex-2.6.4/src/../lib/malloc.c:16:15: error: too many arguments to function ‘malloc’; expected 0, have 1
   16 |        return malloc (n);
      |               ^~~~~~  ~
../../flex-2.6.4/src/../lib/malloc.c:6:12: note: declared here
    6 |      void *malloc ();
      |            ^~~~~~
make[2]: *** [Makefile:1431: ../lib/stage1flex-malloc.o] Error 1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...01-Match-malloc-signature-to-its-use.patch | 25 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-Match-malloc-signature-to-its-use.patch

diff --git a/meta/recipes-devtools/flex/flex/0001-Match-malloc-signature-to-its-use.patch b/meta/recipes-devtools/flex/flex/0001-Match-malloc-signature-to-its-use.patch
new file mode 100644
index 0000000000..fc3b8c563d
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-Match-malloc-signature-to-its-use.patch
@@ -0,0 +1,25 @@
+From cec508013706ef06dbac036905a90cbe075fa03d Mon Sep 17 00:00:00 2001
+From: Richard Barnes <rbarnes@umn.edu>
+Date: Wed, 2 Oct 2024 10:35:09 -0700
+Subject: [PATCH] Match `malloc` signature to its use
+
+Upstream-Status: Submitted [https://github.com/westes/flex/pull/674]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ lib/malloc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/malloc.c b/lib/malloc.c
+index 75e8ef9..701b9b3 100755
+--- a/lib/malloc.c
++++ b/lib/malloc.c
+@@ -3,7 +3,7 @@
+      
+      #include <sys/types.h>
+      
+-     void *malloc ();
++     void *malloc (size_t n);
+      
+      /* Allocate an N-byte block of memory from the heap.
+         If N is zero, allocate a 1-byte block.  */
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index f7d4ef1f08..52543b6e02 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/flex-${PV}.tar.gz \
            file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch \
            file://check-funcs.patch \
            file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch \
+           file://0001-Match-malloc-signature-to-its-use.patch \
            "
 
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"

