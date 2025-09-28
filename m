Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9899CAC5B5
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 22:14:49 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.41200.1759097680208478654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 15:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=unm3jwoq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025092822143812431114c10002076c-etxbbw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025092822143812431114c10002076c
        for <openembedded-core@lists.openembedded.org>;
        Mon, 29 Sep 2025 00:14:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=h6sb5CU8VmaV/NfKQEs9OJItfOlaGc4RJuwWDozDjSc=;
 b=unm3jwoqDx+B7olibJ9C7sC532InC8TX50lLIslgnS4nXqz6uplH7byYti1qH5hzuNRlMI
 puqBcXMlUv+sADbjOY7xtbdQIVSvBAY8rKIpN+Dk1mJDOri9rb0+FvlOf5JdXj0trUhRu1AS
 nyo+tiPMqcTthWdWI2hQiVLjBFvfi8drOO7Q1xsHhaPNVoce7oIfnu8XNvxN20uL5gSe2nN2
 zkHURaKimTy9FCzxg/o1WTXDFJsz52xYTlxIaFXCCeVuEkbfuZ8uZGn+KBID85kHipF9t/Ey
 w0KJJgZNi1AZiLovfCHibHkUD8G2U1QHK3Ynw9Y96JVi7qDNz607p/Yg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] busybox: patch CVE-2025-46394
Date: Mon, 29 Sep 2025 00:13:46 +0200
Message-Id: <20250928221346.1310838-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 22:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224105

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2025-46394.patch      | 57 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394.patch
new file mode 100644
index 0000000000..c95cba3c33
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-46394.patch
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
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 1886410dd2..f8e8eb1125 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -59,6 +59,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-42366.patch \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            file://CVE-2023-39810.patch \
+           file://CVE-2025-46394.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 

