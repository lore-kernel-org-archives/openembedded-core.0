Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278F1CCF2C4
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5937.1792189484440055300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AFZjt8cQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so198453f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189483; x=1792794283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aQDiFzuB4yFlyXJliB5N73/Mw4EP49wFfNxPMvbPdas=;
        b=AFZjt8cQHu+llvxhW7zyKNEgPTv92uH+n0zfmbcOMRJvRN9n0XXtzF+e21vLFa7jGR
         Rq6Nh0Ci1d4WSWNuFmAPdfwZdvlWUzM7xV6hTwSZpv1zaLIj07NGzqk7xsWmnVcmm3Qb
         K6RUtrtQkGElRotd0qQZTOqEPVBJEVU3yv3NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189483; x=1792794283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aQDiFzuB4yFlyXJliB5N73/Mw4EP49wFfNxPMvbPdas=;
        b=FbKuEqzmm3wMDlUls0t/NR3qTpbWmracEI4S6DdYDJgo8xWzqPfCj/wSowAq8IPFzS
         V1doaSa6x9xGJ0Q10/alVasqgT34niJEBjOhZgJO7cyus36I9byKh57UyNaw5S5oIbIY
         bqxJ0buRyIpkVuFOsikAIJzlCG5XLSWEyhHA8JKyTNqmS18icn5FnSJKWpHgSmMTXNfc
         IIiw75PqQzpa2lhC9pkjMcZx0HsAS54MjVxRZbz4N8Blbc8Cm4WpOdh0+MK88PsUMLKw
         CPZh7Vnje+Pg0EoF9qED65xihEQ5zHgEm6VNmNTGfFeTpNGcxSiHUebU+WwOYHGwkpVU
         c6Gg==
X-Gm-Message-State: AFq9FYJEVsFcNbAisgQrknFWJPqP1ljcH+J183TTfNRbyVmsPhnDiYDw
	sWAAwWK6cyJTc3Rygh3RwwnbW0bAz2WFSzU3SliUBT6juv1ywSPRF6/qfsZr8SKCj14nbTiCHCs
	XySfgLoQ=
X-Gm-Gg: AYBFou2Pe9A3A4nJiFInge4rF2AeDbssZSsDU9D2S3xWZxIei4Azwksy4UoLv/CBaFI
	5mhtVRnY0VUmOZVdCXSUrLrbLQLBkmY3LQU4OVFfQzZzuTe2MzqC6XmZJIl495wAGHUoBlw11PA
	RUzmNq3QtzASXytnW1kvDPt0owRrr+cgLZjS/rqXNeBcf6CSXPhebSF3jbI5oWSU4OtFHpHxZVs
	gJ3DigJHo0rJMwaU52kRV8ZYc8HjusXtl78YhychCLz+8NyCJUWe7fAbWzaOTStEkOOnmh7FqDW
	rMUYTgqHxp8S02I+hAnoL9+sDrAc4AaPWNhQWIv+I5cDDh+C1NRcQ7lS8X2LcxFH3osCYRrFuVc
	3kwsjd6fLn3PSurw5Yuk+16UPM5EmS8RsnufMes3auFgM4+2sZFHVxqCsEt67603HTf9nRCZboj
	yM1ich5h56wQTb9y++9JhO9G6NByW/9USZ5m8nt6fqp21/yiUFsZ58cOr8lgXhBUd14KG8MS4qI
	tpBEUN2lvfOfR022yOj6nEZMK48c2SEv7dXfvhEFsEvREE00GsMusKjNB659PyWMc4gQbcefw==
X-Received: by 2002:a05:6000:40dc:b0:48e:21d:7265 with SMTP id ffacd0b85a97d-48e07bc6ee4mr1705196f8f.34.1792189482680;
        Fri, 16 Oct 2026 15:24:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 06/17] expat: patch CVE-2026-102633
Date: Sat, 17 Oct 2026 00:24:08 +0200
Message-ID: <ea4c42d17745bf32439224280fb25e65694421c1.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248055

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-102633

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-102633.patch         | 68 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-102633.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-102633.patch b/meta/recipes-core/expat/expat/CVE-2026-102633.patch
new file mode 100644
index 00000000000..e3a3013a9a9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-102633.patch
@@ -0,0 +1,68 @@
+From 69edbec09f2cd3e0bd6e0a093b55ea38af902d7d Mon Sep 17 00:00:00 2001
+From: Filippo Tedeschi <filippotedeschi98@gmail.com>
+Date: Thu, 24 Sep 2026 21:14:23 +0200
+Subject: [PATCH] lib|tests: Replace assert with runtime overflow check in
+ expat_realloc
+
+In expat_realloc, the size passed to realloc_fcn is calculated as
+sizeof(size_t) + EXPAT_MALLOC_PADDING + size. Previously, expat_realloc
+relied on an assertion:
+assert(SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING >= size);
+under the assumption that preceding accounting checks and parser
+invariants preclude reaching an overflow state in practice.
+
+However, in release builds compiled with NDEBUG, assertions are
+compiled out. Replace the assert with an explicit runtime check:
+if (size > SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING) {
+  return NULL;
+}
+immediately preceding the addition, ensuring consistent defensive
+behavior across all build configurations.
+
+Also extend test_alloc_tracker_size_recorded in alloc_tests.c to
+exercise SIZE_MAX and SIZE_MAX / 2 with expat_realloc, verifying
+that the allocation fails and the recorded size remains unchanged.
+
+Signed-off-by: Filippo Tedeschi <filippotedeschi98@gmail.com>
+
+CVE: CVE-2026-102633
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/69edbec09f2cd3e0bd6e0a093b55ea38af902d7d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c      | 7 ++++---
+ tests/alloc_tests.c | 4 ++++
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index dfcfb0c2..67005454 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -998,9 +998,10 @@ expat_realloc(XML_Parser parser, void *ptr, size_t size, int sourceLine) {
+     }
+   }
+ 
+-  // NOTE: Integer overflow detection has already been done for us
+-  //       by expat_heap_increase_tolerable(..) above
+-  assert(SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING >= size);
++  // Detect and prevent integer overflow
++  if (size > SIZE_MAX - sizeof(size_t) - EXPAT_MALLOC_PADDING) {
++    return NULL;
++  }
+ 
+   // Actually allocate
+   mallocedPtr = parser->m_mem.realloc_fcn(
+diff --git a/tests/alloc_tests.c b/tests/alloc_tests.c
+index 6be0a073..a5cea463 100644
+--- a/tests/alloc_tests.c
++++ b/tests/alloc_tests.c
+@@ -2118,6 +2118,10 @@ START_TEST(test_alloc_tracker_size_recorded) {
+     assert_true(ptr != NULL);
+     assert_true(sizeRecordedFor(ptr) == 10);
+ 
++    assert_true(expat_realloc(parser, ptr, SIZE_MAX, -1) == NULL);
++
++    assert_true(sizeRecordedFor(ptr) == 10); // i.e. unchanged
++
+     assert_true(expat_realloc(parser, ptr, SIZE_MAX / 2, -1) == NULL);
+ 
+     assert_true(sizeRecordedFor(ptr) == 10); // i.e. unchanged
diff --git a/meta/recipes-core/expat/expat_2.8.5.bb b/meta/recipes-core/expat/expat_2.8.5.bb
index c032e18c77a..dfb07d249ae 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2026-102633.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

