Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B540DCA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:05:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24902.1791219928092385261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup fm1._domainkey.siemens.com on 127.0.0.53:53: no such host" header.i=peter.marko@siemens.com header.s=fm1 header.b=guE270JW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026100517052444bc6e15e9000207eb-cpygi3@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026100517052444bc6e15e9000207eb
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 Oct 2026 19:05:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RqnvrFDPrP+7l7BdcNkHTiUa0j7OyD+T7B1nvszIrCI=;
 b=guE270JW0JbSIw4nDGWood7u0E3Bct/gPHTOQJAnUMzpYldJosUTmW3BnRViI6Aqdo/8Zl
 1tQ73k/er5jVglfQK1FaqyT5dHrJZmGusk2wzkUNs1TFUHIPhyEWpC1HlsF3wixJ9ZF/xRcV
 PvHcs84Y0d7YqfA1lJm5GYKu/P0HaYX9iSA9zBw8oq6bvt2VJwYLtpFY5HDuBVoMP+Ksbawh
 0FKeUCN4SE10ske4HoWeX6uVLKyJNSi6T6M8krB63OYogkmHy0r5+qB/NdIUb2CadpIWYkhg
 jjjI+09TNWC0Sypwtt4+Q0WHRbaexiKC0O9hROUtBRYCyp/E/bz226YQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/7] util-linux: patch CVE-2026-53614
Date: Mon,  5 Oct 2026 19:05:06 +0200
Message-ID: <20261005170513.632348-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247246

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.5 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2026-53614.patch           | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53614.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f651dc2dab4..70acf6dfec3 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -49,6 +49,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-27456.patch \
            file://CVE-2026-13595.patch \
            file://CVE-2026-3184.patch \
+           file://CVE-2026-53614.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-53614.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-53614.patch
new file mode 100644
index 00000000000..f1dd4ae5d74
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-53614.patch
@@ -0,0 +1,83 @@
+From cc81bbcec598cb91f0eb8456282f33eed820ed5f Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 10:58:32 +0200
+Subject: [PATCH] libmount: fix SUID bypass via LIBMOUNT_FORCE_MOUNT2 and
+ legacy mount path
+
+Use safe_getenv() for LIBMOUNT_FORCE_MOUNT2 to ignore the variable
+in SUID context, consistent with LIBMOUNT_FSTAB and other sensitive
+environment variables.
+
+Additionally, refuse multi-step mount(2) sequences (bind+remount and
+propagation) for restricted (non-root) users in the legacy mount path.
+The two-step approach has a window between syscalls where security
+flags (nosuid, noexec, ...) are not yet applied.  The new mount API
+handles this atomically.
+
+CVE-2026-53614
+
+Reported-by: Xinyao Hu <ctf_0x01@foxmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 9cbfb823500f510b34767edabd3ffd5b436987b4)
+
+CVE: CVE-2026-53614
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/cc81bbcec598cb91f0eb8456282f33eed820ed5f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/hook_mount.c        | 3 ++-
+ libmount/src/hook_mount_legacy.c | 8 ++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
+index 1ffd19e83..37179fb59 100644
+--- a/libmount/src/hook_mount.c
++++ b/libmount/src/hook_mount.c
+@@ -44,6 +44,7 @@
+  */
+ 
+ #include "mountP.h"
++#include "env.h"
+ #include "fileutils.h"	/* statx() fallback */
+ #include "strutils.h"
+ #include "mount-api-utils.h"
+@@ -627,7 +628,7 @@ fail:
+ 
+ static int force_classic_mount(struct libmnt_context *cxt)
+ {
+-	const char *env = getenv("LIBMOUNT_FORCE_MOUNT2");
++	const char *env = safe_getenv("LIBMOUNT_FORCE_MOUNT2");
+ 
+ 	if (env) {
+ 		if (strcmp(env, "always") == 0)
+diff --git a/libmount/src/hook_mount_legacy.c b/libmount/src/hook_mount_legacy.c
+index 18b7a0066..94a8fc685 100644
+--- a/libmount/src/hook_mount_legacy.c
++++ b/libmount/src/hook_mount_legacy.c
+@@ -282,6 +282,8 @@ static int hook_prepare(struct libmnt_context *cxt,
+ 
+ 	/* add extra mount(2) calls for each propagation flag  */
+ 	if (flags & MS_PROPAGATION) {
++		if (mnt_context_is_restricted(cxt))
++			goto eperm;
+ 		rc = prepare_propagation(cxt, hs);
+ 		if (rc)
+ 			return rc;
+@@ -291,12 +293,18 @@ static int hook_prepare(struct libmnt_context *cxt,
+ 	if ((flags & MS_BIND)
+ 	    && (flags & MNT_BIND_SETTABLE)
+ 	    && !(flags & MS_REMOUNT)) {
++		if (mnt_context_is_restricted(cxt))
++			goto eperm;
+ 		rc = prepare_bindremount(cxt, hs);
+ 		if (rc)
+ 			return rc;
+ 	}
+ 
+ 	return rc;
++eperm:
++	DBG(HOOK, ul_debugobj(hs,
++		"multi-step mount(2) refused for non-root user"));
++	return -EPERM;
+ }
+ 
+ const struct libmnt_hookset hookset_mount_legacy =

