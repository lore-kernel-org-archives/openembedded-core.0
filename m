Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC09FC369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 17:08:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.12669.1745687318178427979
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 10:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3I7dEQV;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0782d787so20893245e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745687316; x=1746292116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbJxiTOQVLqoBGLhgm2Tc3N8xovipRmmQ4MsMaeCbrg=;
        b=l3I7dEQVtuBzY/4rlbmncf7CVx/TLN2q2NsanNOr07cuQL7UPiEop586zjZ25/keOs
         I/g6eT0y6XwM5GZp6o12EsaPvWAkLgQYT90BOy4I6GzcSDfKAjFmehwCS4FbZCt8bBem
         7tSUh324CEbrJNlfVBtHmg/MzT1D+Mec6sOSse0PXDMPxof4PzfosCKewE/HLSeyhB6h
         khMDlHs8CKkvLppVzSedXh3MJ91x/yCiHlZPy/L+pSi9iZ/N1FDROH9wAaKZi6h+s7DS
         X0X1Y+bp4NXfAja2YpnvKIAzH9x/oj265LxHSHRb6vfen/LiJELC7jNbpguyIyido857
         DX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745687316; x=1746292116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbJxiTOQVLqoBGLhgm2Tc3N8xovipRmmQ4MsMaeCbrg=;
        b=DYUzuf2zhya1jGjWlpNRCZwCVw1HzGe8pTTuO9WgMDYqKc1G26JcXlqLFYV7DZab3V
         wKoOHE/pdbJ41LnQaxBNRNLEEf2T9e6Z6dKy8HnxX06qq6j7XOXauP8W7F2SvpUq5aeE
         cYiZaQ6uZwRKo7S9fo/dXZnD/XH7eGcHtBDe8Jk5T0E/swtyzsbzvmSlFj9/mp+MKkDI
         FPbyDwXiJxOeMKG0sIHk8MuMhV0aeScXEwly9+niTH9Ch1c95xVr+9JqPQSr/Qg8bm2p
         MGR8gwFrLnPQ1cibozKDDwr22gYyb662k+lwNofIp0mgpuFElJlJWINi6Wf4BmOfwDHZ
         F4yA==
X-Gm-Message-State: AOJu0YzrGGJtsiboVkGEj5j/J4LE5UJ/vc0L0vdWf0kOMWuAIadpXLlc
	iLEjkN5mZkNdsKiNh2KPx1WaYh7Sglqhv9LscKlIodefWqRGOBr0Ihw83vF/
X-Gm-Gg: ASbGncs6IVgcQ6NsdwNhTq0t6s7e6nZaM9N1HLdEg6UVw3iAJ3vKcQr5PH1vhjjd/QC
	U7bBd6/3DSqWfoyJ061lRGgTrJPEWxSR3N1XCss1Ltr8Erf1oJOK8c8jq8bBn1z7TUSEupspT7W
	SU/Vl6OouZs/MG1LqxEJ8H1fCFVzby7MpaGlXef00DKl70ius0bK95O+BChdCJscSfeih6FfCg4
	dxhw99xbz20Irv3fGXjOLklDUJNGQS5AYF3ffyFdgC6QnOZqYH6DrosQ6yjhR2DkHQDGT7rfwSo
	GZRikyxC/jMYGX9Y5gS7kgGcCjSUt3UXvnJoDBiV4rwLm9mJJC5RsAiz4BEBorGoZJOBTFY5TQ=
	=
X-Google-Smtp-Source: AGHT+IEcMfgCawInMndymTnC1l/A4rHDfS/MyL8/xma4vfgnPPEE0kqAaMuMbphSRDS98WqjoUDZUw==
X-Received: by 2002:a05:600c:3d0b:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-440a64c1820mr68039925e9.2.1745687316378;
        Sat, 26 Apr 2025 10:08:36 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073cbec5csm5921543f8f.43.2025.04.26.10.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 10:08:35 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/3] flex: fix build with gcc-15 on host
Date: Sat, 26 Apr 2025 19:08:21 +0200
Message-ID: <20250426170826.2580706-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 17:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215522

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
index 793a935962..c29377c5eb 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/flex-${PV}.tar.gz \
            file://check-funcs.patch \
            file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch \
            file://0001-build-tests-add-missing-parser-scanner-dependencies.patch \
+           file://0001-Match-malloc-signature-to-its-use.patch \
            "
 
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"

