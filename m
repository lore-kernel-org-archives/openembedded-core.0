Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E647CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:06:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24943.1791219988715356082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=O02HbH+p;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026100517062729131ae4f1000207fc-8bh2xw@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026100517062729131ae4f1000207fc
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 Oct 2026 19:06:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dgLowGhjnYYDGM8Cj+NYQgHMc11B2J3rsiFhl3H/KDA=;
 b=O02HbH+pP80sdxSnU8vjVjXaYttuJAzXjEyc4nvEhrSEnlpLq5xuXFDzUGBo74Z1llZvIo
 if5XbdVKEyfa3tHYwtMjz6sWOAGOsIoQgRaJp9rI/uWff5YEaPITgUqiyQw36d4z8bS2vp+7
 0EA8421vF9AiGkosdZqFL8R6XAif9quDnw/Bqc7gLOEqsBK83CfJSC4ci/7A6tdHBzO4YYYt
 ApP2FzrZUPL3SstaBTV5ajsOThwN51KSjlIXHfla5BHGuCs68Q46BgHKEDFO7/4AZKBTJ4aK
 denVM0QWBaGYL6qqtJp3pcKvkCT31kI+DiDmTf3B07C1BhYxAWXqZG4A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 7/7] util-linux: patch CVE-2026-76642
Date: Mon,  5 Oct 2026 19:05:12 +0200
Message-ID: <20261005170513.632348-7-peter.marko@siemens.com>
In-Reply-To: <20261005170513.632348-1-peter.marko@siemens.com>
References: <20261005170513.632348-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247252

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.6 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-76642.patch           | 136 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-76642.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 10803e38938..fdc8c62f6e5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -62,6 +62,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-78410-01.patch \
            file://CVE-2026-78410-02.patch \
            file://CVE-2026-78410-03.patch \
+           file://CVE-2026-76642.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-76642.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-76642.patch
new file mode 100644
index 00000000000..b5d811770a3
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-76642.patch
@@ -0,0 +1,136 @@
+From a15c00a9e545aa8b9cf6ec0f888ff6c7b3eaeedc Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 28 Jul 2026 11:40:25 +0200
+Subject: [PATCH] libmount: skip post-mount hooks after failed mount helper
+ [CVE-2026-76642]
+
+When an external mount.<type> helper exits nonzero, exec_helper()
+stores the failure in helper_status but returns zero (meaning the
+fork/exec/wait infrastructure succeeded). This zero propagates as
+the mount result, causing MNT_STAGE_MOUNT_POST and MNT_STAGE_POST
+hooks to execute as if the mount had succeeded.
+
+This allows privileged post-mount operations on the pre-existing
+target filesystem:
+
+ - X-mount.idmap clones and idmaps the underlying target, creating
+   an overmount that inherits suid/exec from the root filesystem
+   (ignoring nosuid/nodev/noexec from fstab)
+
+ - X-mount.owner/group/mode changes the physical target inode
+   ownership and permissions even though no mount was created
+
+Gate both MNT_STAGE_MOUNT_POST in mnt_context_do_mount() and
+MNT_STAGE_POST in mnt_context_mount() on is_success_status(), which
+already correctly distinguishes helper exit status from process
+execution status. This is a centralized fix -- individual hooks do
+not need their own guards.
+
+Audit of all hooks registered at these stages:
+
+ MNT_STAGE_MOUNT_POST:
+  - hook_mount.c (attach, propagation, vfsflags): already skip when
+    helper executed (commit f94a7760)
+  - hook_idmap.c: would clone+idmap pre-existing target -- now blocked
+  - hook_subdir.c: deinit calls tmptgt_cleanup() -- safe
+  - hook_mount_legacy.c (propagation, bindremount): no resources to leak
+  - hook_loopdev.c: deinit fixed to call delete_loopdev() when the
+    cleanup hook is skipped (was only free(), leaking fd and device)
+  - hook_veritydev.c: deinit calls delete_veritydev() -- safe
+
+ MNT_STAGE_POST:
+  - hook_owner.c: would chown/chmod target -- now blocked; deinit
+    only frees uid/gid/mode struct, no resources to leak
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit f57cea130839c0af8dc0525274267ae4cfd66bbf)
+(cherry picked from commit 1d14676ea70003e9f5b2a6a76af0cadb1190411a)
+
+CVE: CVE-2026-76642
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/a15c00a9e545aa8b9cf6ec0f888ff6c7b3eaeedc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/context_mount.c | 23 ++++++++++++++++++++---
+ libmount/src/hook_loopdev.c  | 13 +++++++++++--
+ 2 files changed, 31 insertions(+), 5 deletions(-)
+
+diff --git a/libmount/src/context_mount.c b/libmount/src/context_mount.c
+index 77435684b..80c45beeb 100644
+--- a/libmount/src/context_mount.c
++++ b/libmount/src/context_mount.c
+@@ -574,6 +574,22 @@ static int is_success_status(struct libmnt_context *cxt)
+ 	return 0;
+ }
+ 
++/* Check if the mount stage explicitly failed (helper or syscall returned
++ * an error). Unlike is_success_status(), this treats "nothing happened"
++ * as not-failed -- the MOUNT stage may be a no-op for operations like
++ * bind/move with the new mount API where open_tree() runs in PREP and
++ * move_mount() is deferred to MOUNT_POST. */
++static int is_mount_stage_failed(struct libmnt_context *cxt)
++{
++	if (mnt_context_helper_executed(cxt))
++		return mnt_context_get_helper_status(cxt) != 0;
++
++	if (mnt_context_syscall_called(cxt))
++		return mnt_context_get_status(cxt) != 1;
++
++	return 0;
++}
++
+ /* try mount(2) for all items in comma separated list of the filesystem @types */
+ static int do_mount_by_types(struct libmnt_context *cxt, const char *types)
+ {
+@@ -874,8 +890,9 @@ int mnt_context_do_mount(struct libmnt_context *cxt)
+ 	} else
+ 		res = do_mount_by_pattern(cxt, cxt->fstype_pattern);
+ 
+-	/* after mount stage */
+-	if (res == 0) {
++	/* after mount stage -- the post-mount hooks are commit-path only,
++	 * skip them if the mount helper or syscall has failed */
++	if (res == 0 && !is_mount_stage_failed(cxt)) {
+ 		rc = mnt_context_call_hooks(cxt, MNT_STAGE_MOUNT_POST);
+ 		if (rc)
+ 			return rc;
+@@ -1058,7 +1075,7 @@ again:
+ 		}
+ 	}
+ 
+-	if (rc == 0)
++	if (rc == 0 && !is_mount_stage_failed(cxt))
+ 		rc = mnt_context_call_hooks(cxt, MNT_STAGE_POST);
+ 
+ 	mnt_context_deinit_hooksets(cxt);
+diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
+index 34351116c..af9a52227 100644
+--- a/libmount/src/hook_loopdev.c
++++ b/libmount/src/hook_loopdev.c
+@@ -23,6 +23,8 @@ struct hook_data {
+ 	int loopdev_fd;
+ };
+ 
++static int delete_loopdev(struct libmnt_context *cxt, struct hook_data *hd);
++
+ /* de-initiallize this module */
+ static int hookset_deinit(struct libmnt_context *cxt, const struct libmnt_hookset *hs)
+ {
+@@ -30,9 +32,16 @@ static int hookset_deinit(struct libmnt_context *cxt, const struct libmnt_hookse
+ 
+ 	DBG(HOOK, ul_debugobj(hs, "deinit '%s'", hs->name));
+ 
+-	/* remove all our hooks */
++	/* remove all our hooks and free hook data */
+ 	while (mnt_context_remove_hook(cxt, hs, 0, &data) == 0) {
+-		free(data);
++		if (data) {
++			struct hook_data *hd = (struct hook_data *) data;
++
++			/* cleanup after skipped MOUNT_POST hook */
++			if (hd->loopdev_fd > -1)
++				delete_loopdev(cxt, hd);
++			free(hd);
++		}
+ 		data = NULL;
+ 	}
+ 

