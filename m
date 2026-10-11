Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B483CA9ED1
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23567.1791708073045052628
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k7WMWylY;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso863999f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708071; x=1792312871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5u5G+bRWHYMwkVDP3Ev0nRVPaAtqe1DXG83c3GC/DvE=;
        b=k7WMWylY8y/hazH33EEn3YjlkTWoamujpV9kvwEhmKqhv0SJka7kaGIE15TxSpIeCC
         TLa+DYS82TNNYbU5tmMv63ZxmTT1f+JHVuSQozOV/cVV5pvHBgSg8wcrVJfzPHl+9kiu
         UJ+K8S2t0K7uyz5RU8R0CxG4NDDcGTNKjtPT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708071; x=1792312871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5u5G+bRWHYMwkVDP3Ev0nRVPaAtqe1DXG83c3GC/DvE=;
        b=1SIAReWn6qirRDniEH3ASqGCq/yPDgolD8JPqvVjwS/Z8Ja+TzKQwaPQxXFnqgFp1+
         ASyj3E7DItSmLdLqMl0w6GSbOs4/GNfDenGR4Z9nY95B7/Eoy7+F/TGdOxFmU6iSLdru
         ahhjpA51XW0GmLmiLUC53A7gzsUtAfrzeWE4/VeqBIPFHc/j5ummC+7D4watTrMzkQ/z
         +PNylGXcF9I0k0pY4BRHGZQYoXEUAOuqGF/u9sKcVKuajiRFqFRuHpULEZWMgw+xKAEP
         6bYXgcHpv2fvvUWULDVlcSpZl/xMnfOV5ixJvIBFWWqJFHbONPrB2RkvDSuiw2tzTs6n
         lzTw==
X-Gm-Message-State: AFq9FYK5Y7PGFI45Jfh4k+fWJspYEfknCP59mk/pH/VTtNrDyQvZhsrK
	mA/GYP7AI1JFEc0h3osgmN3ukctnRMVWRXj0jB+bcQJwUBTPv9RA/0YVzDx8c3I0cxmbVCeqfgs
	JSuT/Xqs=
X-Gm-Gg: AYBFou2JWHTZribJ7y82kVWxOnCN0GtOkdhbMjuss8rlHRM076Bqn62RbOCm7+wbm8a
	c/jWhWOdTJ2xFUK2mVeUNE35k0gVFmMGMdNQbkVUuhYbEUhqKRyTSR1DNJ74qK8uo+GPk1NrAef
	nfKWgxUJrdDH/1+eXJO/CN5BMHH+3dL4uFwy5Dh0JFvvFutne1XV/wIEfChLUPn08hlsPA1e3Wg
	x14HHGQxg44UsO8nrd9xEHsFEiSM3CNQZiTFY/024ZVxC0d/eHRTqW3IfgxZVZLm+d+iONoaMu2
	0hm7RkiwxDQRNotSdJLDdCF3oe1I7zst2lDp+bsjDgF6tiyUDHZ561feZHd4A0ZiTmlcviPJH4A
	JFRg0vdvTDKqo0ICm50ZB7gTHPXRcFF/8RSOP5v2grU2Y7afIzDFpUakZ2tUv0LfB6WgCTkSmnP
	K4xunm16baTTjfrcyZ4mlDm31OlIZXUg+lMnCjtXI3qsiNYNWq6ybIZlYrErGdytczsfJG8HjJD
	wifeLOO4+EN44DRaWkUE+9cKt+lTfNPEKpvZNn7cIUkKBp2CMon7kfCHeZXkjnbxKSxlXXzzg==
X-Received: by 2002:a05:6000:240b:b0:487:169f:d339 with SMTP id ffacd0b85a97d-48dbacef394mr10218672f8f.54.1791708071159;
        Sun, 11 Oct 2026 01:41:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/60] openssh: fix CVE-2026-73282
Date: Sun, 11 Oct 2026 10:39:51 +0200
Message-ID: <3005ba08f0b81fe18ce60f3289de4ad892e8aa04.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247527

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
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch
new file mode 100644
index 00000000000..f5b4762e511
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch
@@ -0,0 +1,80 @@
+From 9910d5ef53124ce1157d57bc11e222658aa41299 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
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
+- Omitted the upstream OpenBSD revision-only hunk and retained the Wrynose
+  OpenSSH 10.3p1 revision.
+
+(cherry picked from commit 9910d5ef53124ce1157d57bc11e222658aa41299)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ ssh.c | 19 +++++++++++++++++--
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+index d030b548..e9f99c43 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -1899,14 +1899,24 @@
+ 	}
+ }
+ 
++struct rfwd_confirm_ctx {
++	int fid;
++};
++
+ /* Callback for remote forward global requests */
+ static void
+ ssh_confirm_remote_forward(struct ssh *ssh, int type, uint32_t seq, void *ctxt)
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
+@@ -2084,6 +2094,8 @@
+ 
+ 	/* Initiate remote TCP/IP port forwardings. */
+ 	for (i = 0; i < options.num_remote_forwards; i++) {
++		struct rfwd_confirm_ctx *rctx;
++
+ 		debug("Remote connections from %.200s:%d forwarded to "
+ 		    "local address %.200s:%d",
+ 		    (options.remote_forwards[i].listen_path != NULL) ?
+@@ -2098,9 +2110,10 @@
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
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index e3c8c1944d0..c92b059a052 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-60002.patch \
            file://CVE-2026-60000.patch \
            file://CVE-2026-73283.patch \
+           file://CVE-2026-73282.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

