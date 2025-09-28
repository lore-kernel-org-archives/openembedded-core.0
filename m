Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F90ECAC5B5
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 22:14:30 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.41196.1759097665679763653
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 15:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=h1mm04vR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250928221421b0f7ff492e0002075c-dicybw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250928221421b0f7ff492e0002075c
        for <openembedded-core@lists.openembedded.org>;
        Mon, 29 Sep 2025 00:14:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gdttRIsbf1+49Vzb9fKW21rT/WMc40RIsd233QmxkQ0=;
 b=h1mm04vRyTXfyFPxf++IdJV1LpdQ/shBB/2dIuyTjcDCNgjInGTi9c0PYLVRwCExiOaFC2
 QgDX/hqXPfmr7zD+n/TFpvu43/CMmZvt5SBxNWrXAX9awRKrNCdLi6adD73KglqkDBbtlyyG
 pV2ZncEkg+BO9CZ1BqM5stJU9D8S6+B1GqlVkXHfnOQPyigzqfoM4SovaIdhljEBzKhGmfnj
 CpKcSmgJkBQ/NvuIuGb1rq60PSki4PzdEwNVEjcYAJ0rOeCWXQ0RZKwqUGAyjfLg02XJtSag
 vN/55fRG46q9k4nbiHrZq1nwX+PvlCYRtuNvh5ZQLd9CQGByG9wnTZZw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] busybox: patch CVE-2025-46394
Date: Mon, 29 Sep 2025 00:13:32 +0200
Message-Id: <20250928221332.1308547-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 22:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224104

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2025-46394.patch      | 57 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
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
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index bec25348b82..d2aed177957 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -56,6 +56,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-archival-disallow-path-traversals-CVE-2023-39810.patch \
            file://0001-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch \
            file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch \
+           file://CVE-2025-46394.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

