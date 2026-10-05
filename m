Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE2ACA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:05:46 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24908.1791219943464556503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ui2+FrBB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202610051705415f34293a7900020727-f62u0x@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202610051705415f34293a7900020727
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 Oct 2026 19:05:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ALQobqc+evjUHSRM16+GdohL9S1iuvBE5Uq2at5mEuY=;
 b=ui2+FrBBOsa5gE/dwPUlBsDWlYYBnzSSAv10F7cpE7Q7bJgXKIYACK6zIQInuersgVvwIF
 Aha9EtO5Izb3As3RmYxcgMnisNt69jW9HvMtCDlmWlNAH7RtQgB+3mFUEzUjJDqXdPRSrfH8
 lQhshzpCE0ZcW1NzcSpy5XhxLzxSZF5PdsldULsliulcoop18qgViKTkXB3oFgbbHCjVVO1K
 v4lpcBmwhCKq50iBQ+5GC5DYVWdjY0oZdst+30J4bHEGAb/7WgvfqVo4W9ggjNgDctjYuN/9
 tNrrkzo55VRJCw2/4paIxavA2fckQfUe+f9QdsAHHPhUvFpg9OuvqQDw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 3/7] util-linux: patch CVE-2026-53612
Date: Mon,  5 Oct 2026 19:05:08 +0200
Message-ID: <20261005170513.632348-3-peter.marko@siemens.com>
In-Reply-To: <20261005170513.632348-1-peter.marko@siemens.com>
References: <20261005170513.632348-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247248

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.5 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2026-53612.patch           | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53612.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index db698ef9367..4b889927c80 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -55,6 +55,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-lib-fileutils-fix-unused-parameter-warnings-without-.patch \
            file://0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch \
            file://CVE-2026-53613.patch \
+           file://CVE-2026-53612.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-53612.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-53612.patch
new file mode 100644
index 00000000000..94a70c6159c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-53612.patch
@@ -0,0 +1,92 @@
+From 897a08c2b11dfa66975c3d24d63c7bf5f5be1a7c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 11:15:19 +0200
+Subject: [PATCH] libmount: use fd-based fchownat/chmod in hook_owner
+
+Replace path-based lchown()/chmod() with fd-based operations in the
+X-mount.{owner,group,mode} post-mount hook.
+
+For restricted users the fd_target is pinned in prepare_target() and
+re-opened after mount in hook_attach_target() to point to the mounted
+filesystem root.  For root a local O_PATH fd is opened.  Ownership is
+changed via fchownat(fd, "", ..., AT_EMPTY_PATH), mode via
+/proc/self/fd/N.
+
+This prevents TOCTOU attacks where an ancestor directory is swapped
+between mount and the chmod/chown operations.
+
+CVE-2026-53612
+
+Reported-by: Xinyao Hu <ctf_0x01@foxmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 24da33905c7115c4cbccd0afb2a469804e96467a)
+
+CVE: CVE-2026-53612
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/897a08c2b11dfa66975c3d24d63c7bf5f5be1a7c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/hook_owner.c | 32 ++++++++++++++++++++++++--------
+ 1 file changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/libmount/src/hook_owner.c b/libmount/src/hook_owner.c
+index 11b238c89..99f0e705d 100644
+--- a/libmount/src/hook_owner.c
++++ b/libmount/src/hook_owner.c
+@@ -17,6 +17,7 @@
+ #include <sched.h>
+ 
+ #include "mountP.h"
++#include "pathnames.h"
+ #include "fileutils.h"
+ 
+ struct hook_data {
+@@ -48,7 +49,7 @@ static int hook_post(
+ {
+ 	struct hook_data *hd = (struct hook_data *) data;
+ 	const char *target;
+-	int rc = 0;
++	int rc = 0, fd;
+ 
+ 	assert(cxt);
+ 
+@@ -59,18 +60,33 @@ static int hook_post(
+ 	if (!target)
+ 		return 0;
+ 
++	/* fd_target is pinned in restricted mode (see prepare_target()),
++	 * for root open it here to keep chmod/chown fd-based too */
++	if (mnt_context_target_fd_required(cxt))
++		fd = mnt_context_get_target_fd(cxt);
++	else
++		fd = open(target, O_PATH | O_CLOEXEC);
++
++	if (fd < 0)
++		return -MNT_ERR_CHMOD;
++
+ 	if (hd->owner != (uid_t) -1 || hd->group != (uid_t) -1) {
+-		DBG(CXT, ul_debugobj(cxt, " lchown(%s, %u, %u)", target, hd->owner, hd->group));
+-		if (lchown(target, hd->owner, hd->group) == -1)
+-			return -MNT_ERR_CHOWN;
++		DBG(CXT, ul_debugobj(cxt, " fchownat(%s, %u, %u)", target, hd->owner, hd->group));
++		if (fchownat(fd, "", hd->owner, hd->group, AT_EMPTY_PATH) == -1)
++			rc = -MNT_ERR_CHOWN;
+ 	}
+ 
+-	if (hd->mode != (mode_t) -1) {
+-		DBG(CXT, ul_debugobj(cxt, " chmod(%s, %04o)", target, hd->mode));
+-		if (chmod(target, hd->mode) == -1)
+-			return -MNT_ERR_CHMOD;
++	if (!rc && hd->mode != (mode_t) -1) {
++		char buf[sizeof(_PATH_PROC_FDDIR) + 1 + sizeof(stringify_value(INT_MAX))];
++
++		snprintf(buf, sizeof(buf), _PATH_PROC_FDDIR "/%d", fd);
++		DBG(CXT, ul_debugobj(cxt, " chmod(%s, %04o)", buf, hd->mode));
++		if (chmod(buf, hd->mode) == -1)
++			rc = -MNT_ERR_CHMOD;
+ 	}
+ 
++	if (!mnt_context_target_fd_required(cxt))
++		close(fd);
+ 	return rc;
+ }
+ 

