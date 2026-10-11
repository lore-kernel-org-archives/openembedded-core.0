Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA88ECA9EC9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 10:45:24 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24907.1791715515447601774
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 03:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jPwrV8P7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261011104511c3fe7c29c80002078e-xzirjn@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261011104511c3fe7c29c80002078e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 12:45:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1pD4sm/9+P2lTF69D0xTr4mffttDOMM9ch5wlq60+JA=;
 b=jPwrV8P7NWxA/NX38IPuwJVSQxTAHYb21riGOjduZ3osthh10zEqEdLwMYATm9ObEmC1ib
 NwZ0cqLfq76dRUam/FDgToouKwQbKyG46OHyPfa9w/QjN0yYOqnE6nLKx7s9kAHh67NKdrKF
 Veuf/hmbA+GK4OTx3LSPABlhuSSreivnOHwuyxDYoeen6dTJmtzT7KYfInxouUBKXMw1b7/3
 wUy396zCaVu9/unaksCca70eu+Uo/+cTeyXDAcZe1fFqWiuVmMJy2I9FhuHPk3qL1o6PCDgM
 9VEoK4rkXfSD1iIStM7lJY9TgRyLHYyiQ8uRSm48VC95SRgaOPR9jd5w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 1/2] expat: patch CVE-2026-102633
Date: Sun, 11 Oct 2026 12:45:05 +0200
Message-ID: <20261011104506.1994371-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 10:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247572

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-102633

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../expat/expat/CVE-2026-102633.patch         | 68 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-102633.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-102633.patch b/meta/recipes-core/expat/expat/CVE-2026-102633.patch
new file mode 100644
index 0000000000..e3a3013a9a
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
index c032e18c77..dfb07d249a 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2026-102633.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

