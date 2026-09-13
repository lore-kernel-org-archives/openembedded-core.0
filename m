Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94672C88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 16:27:49 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1825.1789315969863413473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 09:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: aurelien.desbrieres@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b30c94so164738f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 09:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789315968; x=1789920768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKnt2josLcpjkPo0C9OcprxZd/yestDDvjzPsyI9fn0=;
        b=GQj6oo+wlrkxNFix+WYtgtK3lZhiVDZj012lOJ1i1d0tdpcWS+PncATKeBg/A7wBKS
         1sN+RH3Rs5Q26WnX5XOlg43ZAGGr9Erixk0Q1zreGn0tgqEKZEldH308WSv1mNnILX+e
         auRAAxkD/lQuir7IbL9zxp0dybbuDwY/RQRSk3HY6IBgMrkIa8/1t3PtOTZCXjxN+k5t
         xmfyLqusspwC3X8Nc0tm0OkaiESNS5LwOp50AEjLJIdtvN5ORz/Kl8yT9TxSwDAGvjHS
         KZ70jsh29F6QIVt3+nmYTJQpEX8tGVcEipyPpIEjvh+BQY+Ro4Vy3D4+LDelgk5ap7fl
         Xsrg==
X-Gm-Message-State: AFuF++nobcQMl1wm29jbCYVoSc7PWpYEHYc88PSPdF9lt6kEYNdC0mT5
	wExvXyX6MTUuWxBUV5Hd3HPkF1sl68WJY91lQnDiZVCmorRSl13Hhh5t2RS8sw==
X-Gm-Gg: AYBFou2wzKmJmzke/Oyd0BOovNGLYW3IBu/5tBx9T5vMm3omCEUlrXS7IYZpVcJKgnD
	Vb3pOcUuu1U3fxF5TGh5g8Hd8DtTD5XF3wqxM8bfoi0NfUl2lZSn0SpJUUxiv4yd5h3tGd6SRtm
	l96OzWT43pbh0IQLUAihQGB6Zv1+9v/6KOFEwmsFAkCKVnc5yH4PgRyjwIYAR5j/hos9ZF7PW1j
	WBR0hcurHk5vFyS9/fuOpH4sN7oCl8Hb/hNtyLJuiiLkM6R/oSLAYRyjYyx00lXFQdWHi8NF7jC
	iywTu+uHx4E6RfGeFqZ+1AoaCDMSn9qpo2LdI5Of5VR/0TMpS1aKiQ0P00Bz8EUAKuEi2sXUQHj
	4MHoY6TGEAYMhwwGXLuie/YZBj/QuypQI0V7nextdbew3JCiGZqyDgQKXlxvhk4rFeNYSHnvuPb
	eUyVoR2LHz71X9L3uhx/gDDdFenN8T02tij/Nn4U00gECZ3e+uaOa9Gye/y/PIfaL9ZBUPJvD+3
	sgQO6V5IaR4I49FNDiPB2rdWIVwzRh/WuuA
X-Received: by 2002:a5d:5846:0:b0:482:e0f3:462c with SMTP id ffacd0b85a97d-486eac89faemr12598617f8f.0.1789315559733;
        Sun, 13 Sep 2026 09:05:59 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm19419818f8f.26.2026.09.13.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 09:05:59 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: openembedded-core@lists.openembedded.org
Cc: aurelien.desbrieres@gmail.com
Subject: [PATCH] flex: fix stage1flex build under a C23 default
Date: Sun, 13 Sep 2026 18:05:58 +0200
Message-ID: <20260913160558.2569053-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 16:27:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245719

lib/malloc.c declares "void *malloc ();" with an empty parameter list
and calls it with one argument. That meant "unspecified" in C89 and
means "none" in C23, so the call is rejected:

  lib/malloc.c:16:15: error: too many arguments to function 'malloc';
                             expected 0, have 1

It is the language mode that decides, not the compiler version: the
same GCC 16 compiles the file with -std=gnu17 and rejects it with
-std=gnu23. GCC 15 made gnu23 the default, so every host from that
release on hits it while GCC 14 does not.

The file is compiled by stage1flex -- the bootstrap scanner flex builds
with the host compiler before it can build itself -- so neither CFLAGS
nor BUILD_CFLAGS reaches that command line and no flag in the recipe
can silence it.

stdlib.h has the right declaration and the file already includes
sys/types.h for size_t. lib/realloc.c includes stdlib.h already and
needs no change.

Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
---
 ...b-malloc-declare-malloc-via-stdlib.h.patch | 38 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-lib-malloc-declare-malloc-via-stdlib.h.patch

diff --git a/meta/recipes-devtools/flex/flex/0001-lib-malloc-declare-malloc-via-stdlib.h.patch b/meta/recipes-devtools/flex/flex/0001-lib-malloc-declare-malloc-via-stdlib.h.patch
new file mode 100644
index 0000000000..a64d6220a8
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-lib-malloc-declare-malloc-via-stdlib.h.patch
@@ -0,0 +1,38 @@
+From: Aurelien Desbrieres <aurelien@hackers.camp>
+Date: Sat, 13 Sep 2026 00:00:00 +0200
+Subject: [PATCH] lib/malloc.c: declare malloc via stdlib.h
+
+The gnulib fallback declares "void *malloc ();" with an empty parameter
+list and calls it with one argument. That meant "unspecified" in C89 and
+means "none" in C23, which GCC 14 and later implement by default, so the
+call is rejected:
+
+  lib/malloc.c:16:15: error: too many arguments to function 'malloc';
+                             expected 0, have 1
+
+stdlib.h has the right declaration and the file already includes
+sys/types.h for size_t, so the local one has nothing to add.
+lib/realloc.c includes stdlib.h already and needs no change.
+
+The file is dead code wherever malloc(0) returns non-NULL -- glibc
+included -- since AC_FUNC_MALLOC substitutes rpl_malloc only where it
+does not, but it is compiled regardless and the build stops there.
+
+Upstream-Status: Inappropriate [flex 2.6.4 is the last release, 2017]
+
+Signed-off-by: Aurelien Desbrieres <aurelien@hackers.camp>
+---
+ lib/malloc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/lib/malloc.c
++++ b/lib/malloc.c
+@@ -3,7 +3,7 @@
+      
+      #include <sys/types.h>
+      
+-     void *malloc ();
++#include <stdlib.h>
+      
+      /* Allocate an N-byte block of memory from the heap.
+         If N is zero, allocate a 1-byte block.  */
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 793a935962..96c596764b 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/flex-${PV}.tar.gz \
            file://check-funcs.patch \
            file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch \
            file://0001-build-tests-add-missing-parser-scanner-dependencies.patch \
+           file://0001-lib-malloc-declare-malloc-via-stdlib.h.patch \
            "
 
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
-- 
2.55.0


