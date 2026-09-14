Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85598C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 10:52:14 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16127.1789376001772865060
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 01:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.225.140, mailfrom: aurelien.desbrieres@gmail.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1a5b5eso664315e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 01:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376000; x=1789980800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaKEgHevzbsTWLPqZt+7BBPzayhBYBaGhAGmM45fu8g=;
        b=BE7NfMhiI9zIp6fKAIR7SGOPfTtWgGgU5E2d2wmrYixLEH7lFqcCZbTjZBZ0h4+kyo
         tIlDg6Y7GVU5JorBS5NvQBtQe0XNfZt7cqsRjhYa8k01HLZX2getACkfEUB27vl6iR9N
         7ZO/F1Q5sGYCcbiOvqEPbZU0ltWrwLIsfflFcdXol3OclUYdwe3fJE5QS4EPHkgn+k/1
         hQPJue3FiJcVLtYb6jNSWp27r4dVAL4/gGKNQ2y2DnRehYjbMkjs+kC3D1Q6xOYfaVgI
         KSrr5+FsOMkC2zVZvcBO/OqYke91YsxSIj09JnehXLRojp4S4Pm6Ma8fRvTD7+Tq3VUS
         SF5A==
X-Gm-Message-State: AFuF++kjr6cmBbWbEO+MYe5vDqYaK7+vWHBjdZQExppA7k+hrfsJvolJ
	R9+JjRntVLHuo4OoXV7NuKhbn1obSkvdK+Q7STeS8DP/beimnFyAeNDRVE9yLQ==
X-Gm-Gg: AYBFou1KsUaS94rBbdcfomWSumdw4y8xiXJhbeGZU3QyIxtvAoOA5mc/zbVBY+ydatg
	wbqNG3f6vYlHs0vtrqID0Y6TZVZgblmVSxf0+nh11LvRM2KJ8dQKvxyO9XQyCQpuTdRDuYaEbcH
	GEVcsne8gTFLYD2hUYnhtxzPEPkO0wnXQjMPm6j4fy/RoIX/4toXB11gdAKtg1TO/rjywYLrghW
	2mHni6IJzIFDqodiTCPoWlTt3hL5nVVtQNJQQXvB/gykJjp5BtSdIHp9lbObS3A9xJKMaXmGPDe
	w+5s1fSe9JFOYrnt0+TvN9r9KosTPIlj4Jlp5bpNNex8iH3zRbFcVpvol0TqoDT4NW6ItFiw0id
	09xjj01WSrRWSDslkh/8JdOGf7QMltmjecB6PJuapXRanvI0h6Q5I+g0v31kSr69/guPss87dD3
	uEm9k90jZt26+kJW+R6WhfP/zQMmcP8XB/y7ayFaDd2jroGQ2M9xEW6bBAQfpBLsK/69DmUzKg2
	lto48v5bHW2cSqev+Hwb/FpbZJSi4Hu8ba0
X-Received: by 2002:a05:600c:35cb:b0:49e:479b:c13b with SMTP id 5b1f17b1804b1-49e7a66b723mr19765735e9.1.1789375999837;
        Mon, 14 Sep 2026 01:53:19 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm200873905e9.1.2026.09.14.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:53:19 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: openembedded-core@lists.openembedded.org
Cc: aurelien.desbrieres@gmail.com
Subject: [PATCH v2] flex: backport the upstream malloc prototype fix
Date: Mon, 14 Sep 2026 10:53:18 +0200
Message-ID: <20260914085318.67139-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3d12110d88ce771519ccedb12e7b6d0d24d7d17a.camel@linuxfoundation.org>
References: <3d12110d88ce771519ccedb12e7b6d0d24d7d17a.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 10:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245762

lib/malloc.c declares "void *malloc ();" with an empty parameter list
and calls it with one argument. That meant "unspecified" in C89 and
means "none" in C23, so a host compiler defaulting to C23 -- GCC 15 and
later -- rejects the call:

  lib/malloc.c:16:15: error: too many arguments to function 'malloc';
                             expected 0, have 1

The file is built by stage1flex with the build host's compiler before
flex can build itself, so neither CFLAGS nor BUILD_CFLAGS reaches that
command line and no flag in the recipe can silence it.

Upstream fixed it in bf254c75b1e0 and the patch falls out when flex
next releases. Gentoo carries the same backport as
flex-2.6.4-fix-malloc-prototype.patch.

Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
---
 ....c-match-malloc-signature-to-its-use.patch | 37 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-lib-malloc.c-match-malloc-signature-to-its-use.patch

diff --git a/meta/recipes-devtools/flex/flex/0001-lib-malloc.c-match-malloc-signature-to-its-use.patch b/meta/recipes-devtools/flex/flex/0001-lib-malloc.c-match-malloc-signature-to-its-use.patch
new file mode 100644
index 0000000000..7adeedcaa6
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-lib-malloc.c-match-malloc-signature-to-its-use.patch
@@ -0,0 +1,37 @@
+From bf254c75b1e0d2641ebbd7fc85fb183f36a62ea7 Mon Sep 17 00:00:00 2001
+From: Richard Barnes <rbarnes@umn.edu>
+Date: Wed, 2 Oct 2024 10:35:09 -0700
+Subject: [PATCH] Match `malloc` signature to its use
+
+The gnulib fallback declares "void *malloc ();" with an empty parameter
+list and calls it with one argument. That meant "unspecified" in C89 and
+means "none" in C23, so a compiler defaulting to C23 -- GCC 15 and later
+-- rejects the call:
+
+  lib/malloc.c:16:15: error: too many arguments to function 'malloc';
+                             expected 0, have 1
+
+The file is built by stage1flex with the build host's compiler before
+flex can build itself, so neither CFLAGS nor BUILD_CFLAGS reaches that
+command line and no flag in the recipe can silence it.
+
+Upstream-Status: Backport [https://github.com/westes/flex/commit/bf254c75b1e0d2641ebbd7fc85fb183f36a62ea7]
+
+Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
+---
+ lib/malloc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/malloc.c b/lib/malloc.c
+index 75e8ef97c..701b9b39d 100755
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
index 793a935962..3b652bda80 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/flex-${PV}.tar.gz \
            file://check-funcs.patch \
            file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch \
            file://0001-build-tests-add-missing-parser-scanner-dependencies.patch \
+           file://0001-lib-malloc.c-match-malloc-signature-to-its-use.patch \
            "
 
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
-- 
2.55.0


