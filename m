Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD40CA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:06:16 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24923.1791219970724437418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Lu5QaPyV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261005170608190ae80683000207f2-zpfeqy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261005170608190ae80683000207f2
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 Oct 2026 19:06:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=d9E9Y/RjjoliH5ftZ0EBSvd60dBY4qDRbkdeECMHl4Y=;
 b=Lu5QaPyVrd33/ShxcMs14Ps6hCJchkpqWUOs/FW5spzZrz1pRsV6fOfgMfA5A+QLifwoPm
 EVJtU2pHH/0ktXc3ZJNCE+fu4FKANw4UWzVfKWq2/nfP9yOonGNcTmFycNDRy2mdTv/tHRfp
 p3Mm67g1TNhIxvTGmIebiMDNMBg7VZIwQe6r0zIfF6hTVa9ZMKOjpiXLB2bGxJj608UYU2+X
 c5kqNsWDTa1dIhHVYTIVhTsINg/nJTfHEOs/TrXUtkVS3xAtK4uEM5v+n3RPJ9bHz7Wcj3gN
 IsV1cRUzVKL3tZVHLvpoeLlJN7BRuV/saHQEBeflcXtfWIaeBvdlB5AQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 5/7] util-linux: patch CVE-2026-78408
Date: Mon,  5 Oct 2026 19:05:10 +0200
Message-ID: <20261005170513.632348-5-peter.marko@siemens.com>
In-Reply-To: <20261005170513.632348-1-peter.marko@siemens.com>
References: <20261005170513.632348-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247250

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.6 release.

Regression patch as submitted to Wrynose is not needed as that code is
not yet present in 2.39.3.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2026-78408.patch           | 98 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6598a92b30f..2eb9251a704 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -57,6 +57,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-53613.patch \
            file://CVE-2026-53612.patch \
            file://CVE-2024-28085-0003.patch \
+           file://CVE-2026-78408.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch
new file mode 100644
index 00000000000..36f3c91ddc5
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch
@@ -0,0 +1,98 @@
+From 43ec8a89f6c99130727084b3496a2ffd2b4200f0 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 31 Aug 2026 17:03:32 +0200
+Subject: [PATCH] nsenter, unshare: add O_CLOEXEC to all open() calls
+ [CVE-2026-78408]
+
+Add O_CLOEXEC (and EFD_CLOEXEC for eventfd) as defense in depth to
+all file descriptor creation sites in nsenter and unshare. All these
+descriptors are already explicitly closed before exec, but O_CLOEXEC
+provides a safety net against future code changes that might
+accidentally introduce a leak path.
+
+No functional change.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2026-78408
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/43ec8a89f6c99130727084b3496a2ffd2b4200f0]
+Backport notes:
+- 2 hunks left out as that code is not yet present in 2.39.3.
+- Verified that no other "open(" calls are in this version in patched files.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sys-utils/nsenter.c | 6 +++---
+ sys-utils/unshare.c | 8 ++++----
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/sys-utils/nsenter.c b/sys-utils/nsenter.c
+index cf6c83174..9d9d90a48 100644
+--- a/sys-utils/nsenter.c
++++ b/sys-utils/nsenter.c
+@@ -134,7 +134,7 @@ static void open_target_fd(int *fd, const char *type, const char *path)
+ 	if (*fd >= 0)
+ 		close(*fd);
+ 
+-	*fd = open(path, O_RDONLY);
++	*fd = open(path, O_RDONLY | O_CLOEXEC);
+ 	if (*fd < 0)
+ 		err(EXIT_FAILURE, _("cannot open %s"), path);
+ }
+@@ -492,7 +492,7 @@ int main(int argc, char *argv[])
+ 
+ 	/* Remember the current working directory if I'm not changing it */
+ 	if (root_fd >= 0 && wd_fd < 0 && wdns == NULL) {
+-		wd_fd = open(".", O_RDONLY);
++		wd_fd = open(".", O_RDONLY | O_CLOEXEC);
+ 		if (wd_fd < 0)
+ 			err(EXIT_FAILURE,
+ 			    _("cannot open current working directory"));
+@@ -515,7 +515,7 @@ int main(int argc, char *argv[])
+ 
+ 	/* working directory specified as in-namespace path */
+ 	if (wdns) {
+-		wd_fd = open(wdns, O_RDONLY);
++		wd_fd = open(wdns, O_RDONLY | O_CLOEXEC);
+ 		if (wd_fd < 0)
+ 			err(EXIT_FAILURE,
+ 			    _("cannot open current working directory"));
+diff --git a/sys-utils/unshare.c b/sys-utils/unshare.c
+index 05db627be..c47739862 100644
+--- a/sys-utils/unshare.c
++++ b/sys-utils/unshare.c
+@@ -108,7 +108,7 @@ static void setgroups_control(int action)
+ 		return;
+ 	cmd = setgroups_strings[action];
+ 
+-	fd = open(file, O_WRONLY);
++	fd = open(file, O_WRONLY | O_CLOEXEC);
+ 	if (fd < 0) {
+ 		if (errno == ENOENT)
+ 			return;
+@@ -125,7 +125,7 @@ static void map_id(const char *file, uint32_t from, uint32_t to)
+ 	char *buf;
+ 	int fd;
+ 
+-	fd = open(file, O_WRONLY);
++	fd = open(file, O_WRONLY | O_CLOEXEC);
+ 	if (fd < 0)
+ 		 err(EXIT_FAILURE, _("cannot open %s"), file);
+ 
+@@ -219,7 +219,7 @@ static void settime(time_t offset, clockid_t clk_id)
+ 
+ 	len = snprintf(buf, sizeof(buf), "%d %" PRId64 " 0", clk_id, (int64_t) offset);
+ 
+-	fd = open("/proc/self/timens_offsets", O_WRONLY);
++	fd = open("/proc/self/timens_offsets", O_WRONLY | O_CLOEXEC);
+ 	if (fd < 0)
+ 		err(EXIT_FAILURE, _("failed to open /proc/self/timens_offsets"));
+ 
+@@ -289,7 +289,7 @@ static pid_t fork_and_wait(int *fd)
+ 	pid_t pid;
+ 	uint64_t ch;
+ 
+-	*fd = eventfd(0, 0);
++	*fd = eventfd(0, EFD_CLOEXEC);
+ 	if (*fd < 0)
+ 		err(EXIT_FAILURE, _("eventfd failed"));
+ 

