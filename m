Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE645CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 18:52:42 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.1976.1759517553946532122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 11:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=CY1ffwvw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025100318523031c841926700020778-k_99nt@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025100318523031c841926700020778
        for <openembedded-core@lists.openembedded.org>;
        Fri, 03 Oct 2025 20:52:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=K+CQ3Q1k5vqy/GEMF7RowKQF+F3+JstD7s0eOBat3X0=;
 b=CY1ffwvwn6v6y9a1M9bBCb1rhIdXjvPFS+9IB46Hq57N6Xaql5fKI85iEL4zpuIpudmCtw
 u2Q7M6p7xxUHuYKF1bBfemLLVog035Ax+UFa7dFWK8OLxFvRUwvTB8xXC7pPjUFpyS0XKCJ/
 ykbu6OV/RdGSJrJOUhzyuSrEthWZNhssNQJeLaP5E0RhVA9HzWIIQkZh8s4m1DmauaUIgWNK
 AMsMR99Rzw3SRT5UNoCplliEHK9z5jnlJJrgY2YGoK+LNo0LrVy291PHSi7XEV6cF2Hq5L4b
 Sy6DmzKJaTM9ar6nNcTw02nnflaxceg6yQU4kRleMjMroPQSSzn6+9Ng==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH v2] busybox: patch CVE-2025-46394
Date: Fri,  3 Oct 2025 20:52:27 +0200
Message-Id: <20251003185228.1394571-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 18:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224417

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioning this CVE.
Additionally fix test broken by the CVE fix.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2025-46394-01.patch   | 57 +++++++++++++++++++
 .../busybox/busybox/CVE-2025-46394-02.patch   | 32 +++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
new file mode 100644
index 00000000000..c95cba3c33b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
@@ -0,0 +1,57 @@
+From f5e1bf966b19ea1821f00a8c9ecd7774598689b4 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 24 Sep 2025 03:28:47 +0200
+Subject: [PATCH] archival/libarchive: sanitize filenames on output (prevent
+ control sequence attacks
+
+This fixes CVE-2025-46394 (terminal escape sequence injection)
+
+Original credit: Ian.Norton at entrust.com
+
+function                                             old     new   delta
+header_list                                            9      15      +6
+header_verbose_list                                  239     244      +5
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 11/0)               Total: 11 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2025-46394
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=f5e1bf966b19ea1821f00a8c9ecd7774598689b4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ archival/libarchive/header_list.c         | 2 +-
+ archival/libarchive/header_verbose_list.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/archival/libarchive/header_list.c b/archival/libarchive/header_list.c
+index 0621aa406..9490b3635 100644
+--- a/archival/libarchive/header_list.c
++++ b/archival/libarchive/header_list.c
+@@ -8,5 +8,5 @@
+ void FAST_FUNC header_list(const file_header_t *file_header)
+ {
+ //TODO: cpio -vp DIR should output "DIR/NAME", not just "NAME" */
+-	puts(file_header->name);
++	puts(printable_string(file_header->name));
+ }
+diff --git a/archival/libarchive/header_verbose_list.c b/archival/libarchive/header_verbose_list.c
+index a575a08a0..e7a09430d 100644
+--- a/archival/libarchive/header_verbose_list.c
++++ b/archival/libarchive/header_verbose_list.c
+@@ -57,13 +57,13 @@ void FAST_FUNC header_verbose_list(const file_header_t *file_header)
+ 		ptm->tm_hour,
+ 		ptm->tm_min,
+ 		ptm->tm_sec,
+-		file_header->name);
++		printable_string(file_header->name));
+ 
+ #endif /* FEATURE_TAR_UNAME_GNAME */
+ 
+ 	/* NB: GNU tar shows "->" for symlinks and "link to" for hardlinks */
+ 	if (file_header->link_target) {
+-		printf(" -> %s", file_header->link_target);
++		printf(" -> %s", printable_string(file_header->link_target));
+ 	}
+ 	bb_putchar('\n');
+ }
diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
new file mode 100644
index 00000000000..ec17b9285a7
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
@@ -0,0 +1,32 @@
+From 7378db981d87b4a2264e14d60340a7fb5c67ae59 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Fri, 3 Oct 2025 16:12:56 +0200
+Subject: [PATCH] testsuite/tar.tests: fix test after CVE-2025-46394
+
+tar now sanitizes output and this test needs to expect that.
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+CVE: CVE-2025-46394
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-October/091743.html]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ testsuite/tar.tests | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testsuite/tar.tests b/testsuite/tar.tests
+index 0f2e89112..48fc38114 100755
+--- a/testsuite/tar.tests
++++ b/testsuite/tar.tests
+@@ -325,9 +325,9 @@ unset LANG
+ rm -rf etc usr
+ ' "\
+ etc/ssl/certs/3b2716e5.0
+-etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
++etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.pem
+ etc/ssl/certs/f80cc7f6.0
+-usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
++usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.crt
+ 0
+ etc/ssl/certs/3b2716e5.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
+ etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem -> /usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 069544cc8a8..d3f259d45b4 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -59,6 +59,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            file://CVE-2022-48174.patch \
            file://CVE-2023-39810.patch \
+           file://CVE-2025-46394-01.patch \
+           file://CVE-2025-46394-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

