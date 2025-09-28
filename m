Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0270CAC5B5
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 22:15:29 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.41291.1759097725038312241
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 15:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=j3EoPlzE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250928221522817c2fbcdf0002073a-xre4ag@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250928221522817c2fbcdf0002073a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 29 Sep 2025 00:15:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=0kAYkGWzbBvyhtvWpemr2/3hghcS4+ACL5JeplR9wFk=;
 b=j3EoPlzE+P6sjUu14PMUG3HzAiFdIV96FL7jf3utPpijAjJxSgWabRL+fdMbQaEGSZOull
 TuGvlTY0cVb2BJ432vWM0Sowh0WSyOEStzgsvBzjDw87ZDpGQPXHMuIeiN0bSBR7sdEjBM/t
 Ik4EB4MFQq9TaGcovhUCwbsBXnpVhTMDzJ+o1OJngpT2m1nW3QZXipklizq3aAoKb00kx9nh
 3XY4Oz/l5rhnm8c1yl5vZZ3PtFSwVt1RJZnrv+x55OYvBslmrOnkXdIOiwvlTTfO+w8a5Qpr
 c7U66nwpzrJHT+OseWmQ9/zbXZvWFmIZxWwkfMG8ohUpkB5hAGkXVp7A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] busybox: patch CVE-2025-46394
Date: Mon, 29 Sep 2025 00:14:36 +0200
Message-Id: <20250928221436.1334895-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 22:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224106

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2025-46394.patch      | 57 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394.patch
new file mode 100644
index 00000000000..c95cba3c33b
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
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 069544cc8a8..a0c907a150d 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -59,6 +59,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            file://CVE-2022-48174.patch \
            file://CVE-2023-39810.patch \
+           file://CVE-2025-46394.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

