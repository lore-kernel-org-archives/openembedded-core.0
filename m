Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id D715971A63
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:47:55 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p66so15251155pga.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b6fRUYOhtFZTzcBqfHHSoaDTuVTl/7x/LzH/0GF/3mY=;
	b=ofPl/uOFuA1KUov2XFBDTSeWhRAN046yt2mFUyZJR373WVtMXsZHAHKnhWLOiRKzxz
	UsUC+wEqSCkhaw8iZcPsDvRtBzSOtQsU0ewMNaY18LiBXtYGgWJoUp324WetLLmCOgvP
	++agoCEAaMmukuWNBJ27op6HBKB7YeZ034IAijiOADYBQNYRdZd+c2GDQi3JNu/3ZVTj
	2iK+NenKEqvDSSPNaR6WdXnHDe0rBKI9eCOQ/uB/0+ykmi09L0g6iCzEq7TMDIAhm6qc
	8n+/glEouF3tbGhplO4/NIJWq0K03mEsO0LceS2LueQRvA8yrAOkdEBJgkMEy79oIFXQ
	ukMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b6fRUYOhtFZTzcBqfHHSoaDTuVTl/7x/LzH/0GF/3mY=;
	b=JsIzCqoONdnadB2x2dS/9b8NJLd/j8X8NSL5PsNIN0qfuDb2Mla/v+cV/GVpzrbqQ/
	F8bjzY0CGndIzFaEK2CUXj7umzV/NjG8CN7kPXh226uDePxDiD6B/uXY3lJCL13+IyXQ
	Gz3oiytcj0G8A/RIQzau3J3HIhkYMcpSIEGbrDx/KDnisHka1xs4POMGw6EhT3qRMpYz
	h+PrS05nCw3xxdfeHGmTaRZ9fGtN9vD7whksdD+xud+Sd4GYjYoFBqi7fdE7Rn7VJyVX
	r/p0L3FIEJWWMpUIs1YDnCYlMvcLlH2zemQMNagFwBayuLU6nAGWYia84AHD1ugVgYbE
	v6iA==
X-Gm-Message-State: ABUngvcXNbTpDQ55G8/RUTJ6xVDZ4M+9OMzs2E/S0JwwZ75OXeMk7ctGvdRcrc5SfTFxjw==
X-Received: by 10.98.141.74 with SMTP id z71mr6215005pfd.53.1479318476646;
	Wed, 16 Nov 2016 09:47:56 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s2sm55946617pfi.10.2016.11.16.09.47.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 09:47:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 09:47:46 -0800
Message-Id: <20161116174748.26994-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161116174748.26994-1-raj.khem@gmail.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
Subject: [PATCH 3/5] musl: Update to latest on master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Nov 2016 17:47:56 -0000

Bobby Bingham (2):
      treat null vdso base same as missing
      add s390x port

Rich Felker (2):
      generalize ELF hash table types not to assume 32-bit entries
      work around gdb issues recognizing sigreturn trampoline on x86_64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/files/CVE-2016-8859.patch | 79 ------------------------
 meta/recipes-core/musl/musl_git.bb               |  3 +-
 2 files changed, 1 insertion(+), 81 deletions(-)
 delete mode 100644 meta/recipes-core/musl/files/CVE-2016-8859.patch

diff --git a/meta/recipes-core/musl/files/CVE-2016-8859.patch b/meta/recipes-core/musl/files/CVE-2016-8859.patch
deleted file mode 100644
index 82da86f..0000000
--- a/meta/recipes-core/musl/files/CVE-2016-8859.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From c3edc06d1e1360f3570db9155d6b318ae0d0f0f7 Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Thu, 6 Oct 2016 18:34:58 -0400
-Subject: [PATCH] fix missing integer overflow checks in regexec buffer size
- computations
-
-most of the possible overflows were already ruled out in practice by
-regcomp having already succeeded performing larger allocations.
-however at least the num_states*num_tags multiplication can clearly
-overflow in practice. for safety, check them all, and use the proper
-type, size_t, rather than int.
-
-also improve comments, use calloc in place of malloc+memset, and
-remove bogus casts.
-
-Upstream-Status: Backport
-CVE: CVE-2016-8859
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- src/regex/regexec.c | 23 ++++++++++++++++++-----
- 1 file changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/src/regex/regexec.c b/src/regex/regexec.c
-index 16c5d0a..dd52319 100644
---- a/src/regex/regexec.c
-+++ b/src/regex/regexec.c
-@@ -34,6 +34,7 @@
- #include <wchar.h>
- #include <wctype.h>
- #include <limits.h>
-+#include <stdint.h>
- 
- #include <regex.h>
- 
-@@ -206,11 +207,24 @@ tre_tnfa_run_parallel(const tre_tnfa_t *tnfa, const void *string,
- 
-   /* Allocate memory for temporary data required for matching.	This needs to
-      be done for every matching operation to be thread safe.  This allocates
--     everything in a single large block from the stack frame using alloca()
--     or with malloc() if alloca is unavailable. */
-+     everything in a single large block with calloc(). */
-   {
--    int tbytes, rbytes, pbytes, xbytes, total_bytes;
-+    size_t tbytes, rbytes, pbytes, xbytes, total_bytes;
-     char *tmp_buf;
-+
-+    /* Ensure that tbytes and xbytes*num_states cannot overflow, and that
-+     * they don't contribute more than 1/8 of SIZE_MAX to total_bytes. */
-+    if (num_tags > SIZE_MAX/(8 * sizeof(int) * tnfa->num_states))
-+      goto error_exit;
-+
-+    /* Likewise check rbytes. */
-+    if (tnfa->num_states+1 > SIZE_MAX/(8 * sizeof(*reach_next)))
-+      goto error_exit;
-+
-+    /* Likewise check pbytes. */
-+    if (tnfa->num_states > SIZE_MAX/(8 * sizeof(*reach_pos)))
-+      goto error_exit;
-+
-     /* Compute the length of the block we need. */
-     tbytes = sizeof(*tmp_tags) * num_tags;
-     rbytes = sizeof(*reach_next) * (tnfa->num_states + 1);
-@@ -221,10 +235,9 @@ tre_tnfa_run_parallel(const tre_tnfa_t *tnfa, const void *string,
-       + (rbytes + xbytes * tnfa->num_states) * 2 + tbytes + pbytes;
- 
-     /* Allocate the memory. */
--    buf = xmalloc((unsigned)total_bytes);
-+    buf = calloc(total_bytes, 1);
-     if (buf == NULL)
-       return REG_ESPACE;
--    memset(buf, 0, (size_t)total_bytes);
- 
-     /* Get the various pointers within tmp_buf (properly aligned). */
-     tmp_tags = (void *)buf;
--- 
-2.7.4
-
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1ee56b6..b0c6098 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "39494a273eaa6b714e0fa0c59ce7a1f5fbc80a1e"
+SRCREV = "54991729fd1e3d3a0cb71884d758d86afe6da9e0"
 
 PV = "1.1.15+git${SRCPV}"
 
@@ -11,7 +11,6 @@ PV = "1.1.15+git${SRCPV}"
 
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
-           file://CVE-2016-8859.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.10.2


