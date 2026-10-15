Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2985CCA465
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32446.1792040642836321483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SKZaIq8L;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so14138235e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040641; x=1792645441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xA6psFZy7cpXR9SgU01YypdkBCI0O+r2QXAQk8P3ImA=;
        b=SKZaIq8LMpfRn46ewrgMEyLYB8KaOUstx3rYDjtvkmgfRpOJCfDCCgJXrvlB35mdAH
         X+69zVjFlXnFYYA4ptC5P3iDlt0z7kuvcyQaegVNqJZkdDp4sJ8qTgkvcdA62WE9fQpd
         fkYt9Sdq5cp5lrvKAxLi5VmN9oODyCCHJr7oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040641; x=1792645441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xA6psFZy7cpXR9SgU01YypdkBCI0O+r2QXAQk8P3ImA=;
        b=J662R1xuILOQJF6qnO7a6yARewSukAPMoSQBTKxUieitjcKt7n4DSZYxc0tlFdAr/t
         OLqK3j6S/bU7NnDRZPUn7yPu1ee1WFouqAzqVFkSCAWLUylV6I8u1bruXOZBRyWAKk1G
         gYpOxq+JZhRJpwWHyv3uhuIo4NTqqKNQK1txzFlJZOwDGiOO1x3jZz5pgRtsQ6wMhYvT
         gVKozTBL774dKbGD7KP+lWrLi8acXNCe09FOOlZJtx649dBpF//+5FWd67bRSMBVKpz6
         Y1sj0n4KUEh/AVdKa8Nu7Clf4rlzv19eFhcFRu0Dt6K1mRAkuZBszsV8mvknkt/puQtl
         bEJg==
X-Gm-Message-State: AFq9FYLc1PL6xnAkVDOGPF6183jLQvuRlNGmYU88XHgIdW/hvcFdWEXZ
	8nBD5xJSrPvZUd3rH7G9xxlfww3l/W7gAMvi/tXNCoseIVJYJbW0DMlFqPT3mLtrjhivCJTyKAS
	M7JHPsV8=
X-Gm-Gg: AYBFou3OG+KN+yaN4E6dPEjtpoX/HWxPLlBAIpX5K42S8vVhkIKHJXzDAW94WMmcOi2
	Z27Uo1r3A0in6KBkfjoDmY8WcUYSB984MMnk3lrUa6jYIjumZ6dJ4wmodaWpFDkjXxwftp8Weax
	kz1fiKJ2nleeAJEdUzW8TGdtvOsGDazKlV345O5zn2RIyBldKNfanCPaVK4scs4e0ghsFetKSbC
	u7WMCbh/UNFEsmh0hNpTuYmFiCB3SGWAqm3dFj0X+Zah+GDxYG3Ns5RjVTLsUUmSt7z4aHOuLWf
	BOGvWgz0zTeze5YARAAFaXRMkRTT0ZfwrXlaGojUxsnLAuajNi+Dz4wYhvAehIUh285G3Qxd5Bi
	nvl+yKTL7fUeR1vfbykvNwhbGuA8Y9K4WGPwonPZOVMKcVQYSZEkBVhV0qenLDbfnSKrJbvZlk4
	JwVxQRX5Iar1+CZHehqJUYuOGKDOXlJ27XZKs+2PHGsfXDGDBC8GipsvaUWg8kJ3YtGax2X5biI
	+u7d+XitXcfCcix/tCJ9ygITkyqWhvh6iHOKD1xzYl5yFAO/4YXU2B3EmorQTTFFGxSUS3nau7C
	AtIFk/pZ
X-Received: by 2002:a05:600c:83c7:b0:4a1:7733:5102 with SMTP id 5b1f17b1804b1-4a18e4a3fc8mr339880445e9.15.1792040640968;
        Wed, 14 Oct 2026 22:04:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/55] openssh: fix CVE-2026-73282
Date: Thu, 15 Oct 2026 07:02:58 +0200
Message-ID: <45a22c1327d92b9fbe7533770345a40692e98b49.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247833

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix that tracks pending remote-forward
requests by index instead of retaining a pointer that realloc may
invalidate. The upstream fix commit is referenced in [1], and the
public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/9910d5ef53124ce1157d57bc11e222658aa41299
[2] https://www.cve.org/CVERecord?id=CVE-2026-73282

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-73282.patch      | 80 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch
new file mode 100644
index 00000000000..a527cca7626
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch
@@ -0,0 +1,80 @@
+From 9910d5ef53124ce1157d57bc11e222658aa41299 Mon Sep 17 00:00:00 2001
+From: djm@openbsd.org <djm@openbsd.org>
+Date: Fri, 7 Aug 2026 05:03:56 +0000
+Subject: [PATCH] upstream: avoid potential realloc use-after-free in the
+ client if a
+
+remote forwarding is added via the local session multiplexing socket while a
+remote forwarding open request is pending with the server.
+
+Report and fix from Brian Mingus of Cognatory
+
+OpenBSD-Commit-ID: c7888d566576386d0e96859f9ec7310a1e2d3609
+
+CVE: CVE-2026-73282
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/9910d5ef53124ce1157d57bc11e222658aa41299]
+
+Backport Changes:
+- Omitted the upstream OpenBSD RCS revision header update because it does
+  not apply to the OpenSSH 9.6p1 source revision.
+
+(cherry picked from commit 9910d5ef53124ce1157d57bc11e222658aa41299)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ ssh.c | 19 +++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+index aecdb79e..2d2837d4 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -1867,14 +1867,24 @@ forwarding_success(void)
+ 	}
+ }
+ 
++struct rfwd_confirm_ctx {
++	int fid;
++};
++
+ /* Callback for remote forward global requests */
+ static void
+ ssh_confirm_remote_forward(struct ssh *ssh, int type, u_int32_t seq, void *ctxt)
+ {
+-	struct Forward *rfwd = (struct Forward *)ctxt;
++	struct rfwd_confirm_ctx *rctx = (struct rfwd_confirm_ctx *)ctxt;
++	struct Forward *rfwd;
+ 	u_int port;
+ 	int r;
+ 
++	if (rctx->fid < 0 || rctx->fid >= options.num_remote_forwards)
++		fatal_f("invalid forwarding ID %d", rctx->fid);
++	rfwd = &options.remote_forwards[rctx->fid];
++	freezero(rctx, sizeof(*rctx));
++
+ 	/* XXX verbose() on failure? */
+ 	debug("remote forward %s for: listen %s%s%d, connect %s:%d",
+ 	    type == SSH2_MSG_REQUEST_SUCCESS ? "success" : "failure",
+@@ -2052,6 +2062,8 @@ ssh_init_forwarding(struct ssh *ssh, char **ifname)
+ 
+ 	/* Initiate remote TCP/IP port forwardings. */
+ 	for (i = 0; i < options.num_remote_forwards; i++) {
++		struct rfwd_confirm_ctx *rctx;
++
+ 		debug("Remote connections from %.200s:%d forwarded to "
+ 		    "local address %.200s:%d",
+ 		    (options.remote_forwards[i].listen_path != NULL) ?
+@@ -2066,9 +2078,10 @@ ssh_init_forwarding(struct ssh *ssh, char **ifname)
+ 		if ((options.remote_forwards[i].handle =
+ 		    channel_request_remote_forwarding(ssh,
+ 		    &options.remote_forwards[i])) >= 0) {
++			rctx = xcalloc(1, sizeof(*rctx));
++			rctx->fid = i;
+ 			client_register_global_confirm(
+-			    ssh_confirm_remote_forward,
+-			    &options.remote_forwards[i]);
++			    ssh_confirm_remote_forward, rctx);
+ 			forward_confirms_pending++;
+ 		} else if (options.exit_on_forward_failure)
+ 			fatal("Could not request remote forwarding.");
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index f660e78dba7..651b7437a6f 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-60002.patch \
            file://CVE-2026-60000.patch \
            file://CVE-2026-73283.patch \
+           file://CVE-2026-73282.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

