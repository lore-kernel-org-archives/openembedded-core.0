Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E23C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 03:57:57 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.315.1790654267326614252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 20:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=G88yIfSW;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4322; q=dns/txt;
  s=iport01; t=1790654267; x=1791863867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rjgV/8T7U4zp2EaUSMlkgT4PsIE02gBrsgOrh+BODLw=;
  b=G88yIfSWXg0YjkOoE6zXrSpdqjzto8N24RdF/HmlE1XL6FxBBqhhq8Ut
   /lIRgcvdWuj3sdoBTyPim62Xe8zDKJg5M1YlWcTjIep5z0uIRzzsHH1J9
   mzK7rdT9YRJ9Qkz5zePw4jkIfptu5N0zrui+YML0TgdtLA4j3PaXFC+dz
   WVTXLB+pUBa9+i6K5UOpSHkg3re+tl6g5CxPMPAv7a6zHJUTnD/VZSTl+
   XusOCJ6aLvHxkeYo06RWV/3wSp4BnsTluSviKwaQ0+JgtLXVBWdSnKaLo
   qb02Cj+WqpSPr1UMSk0c80LZYGzo59o4y1UO9xI62qSBKD209T/yXIWgE
   w==;
X-CSE-ConnectionGUID: 3I0yKE9oTm2Tq1H8BD/2Tg==
X-CSE-MsgGUID: Z4TIuNbfT6iwvAlPiWsSYA==
X-IPAS-Result: =?us-ascii?q?A0BIAgCBNbtq/4//Ja1aglmCV3VgQ0mWSgOeGoF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOCAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEcANgXkzgQGDK?=
 =?us-ascii?q?QE/AkNQ2zIBCxQBBYEzhUCII10YAYR8JxsbgXKBFYNpgQWBXAICAReBLoZdB?=
 =?us-ascii?q?IINFXoSgVoekzhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVFEkcmIggSC?=
 =?us-ascii?q?QETGjALgSE4QQkoPxgNSBEsNxUZBD5uB5A/HoFzcoEECgEQAxgXeoEpkwMkk?=
 =?us-ascii?q?kGhDwoog3aMIpU6GjOqbwuYfY4KlgBQhGmBaDyBWXAVgyIJShkPji4LC4Ngh?=
 =?us-ascii?q?RPHJicyCzIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:ncGc86+1b5D0I1r8igtqDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TRMUGHUO/rYZGLwcth1adi3pxkP75TcndRkGQs5qi5EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAsYzhEs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2ltHNUJ2csmBl1Lr
 8ABcRBdRDzE3d65lefTpulE3qzPLeHxN48Z/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Yn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCwaoqKI4TSG509ckCwl
 D763nnfCB8mat2A1xOBynOTndT+tHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:yaHUJqtNNaENJikXNOOamEwB7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:ZUWyomMUJHLykO5DAwg/5W05S8cZdyfh1S7wc2WUTjxVR+jA
X-Talos-MUID: 9a23:LWdwTQb5Y35FKOBThWPQpSxEPslUvaWxFmkJqZQ5oPK1HHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528710060"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 03:57:46 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 5DF3E180000B5;
	Tue, 29 Sep 2026 03:57:46 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 08AD1CBF201; Mon, 28 Sep 2026 20:57:46 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 2/3] openssh: fix CVE-2026-73282
Date: Mon, 28 Sep 2026 20:57:44 -0700
Message-Id: <20260929035745.321529-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929035745.321529-1-hthakar@cisco.com>
References: <20260929035745.321529-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 03:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246804

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix that tracks pending remote-forward
requests by index instead of retaining a pointer that realloc may
invalidate. The upstream fix commit is referenced in [1], and the
public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/9910d5ef53124ce1157d57bc11e222658aa41299
[2] https://www.cve.org/CVERecord?id=CVE-2026-73282

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
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
index 3085f71bc6e..00e2cd8726e 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-60002.patch \
            file://CVE-2026-60000.patch \
            file://CVE-2026-73283.patch \
+           file://CVE-2026-73282.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


