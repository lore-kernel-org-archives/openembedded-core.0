Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9499C9830E
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 06:00:38 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6931.1790748028742238341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 23:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=M67sZJy+;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4464; q=dns/txt;
  s=iport01; t=1790748028; x=1791957628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6JKwFYo+5Qoc1TsuHWlR8BqlUwKI0ttSVPT/b6MYi4E=;
  b=M67sZJy+qKS/sST46xlyOnkrHKpHNO5TZ8KPbtXhiKcLphLF25gvBYW1
   kAKPaFUwB5q9jK+11ytP6bQIKRkn883XvxwQz+oKuSYn3kaYp7Em/gEhc
   enigENpPHUw4EYIGfq37tKrh2VKtFYHrgrroLXuOOYjXBj0YuwQHTl06+
   sZpALq8vbIOFa6FrVoWjjcgU7YBTcDcakMI9XA9boZi9lMW4yuYjwgHaF
   cihUpF08MKLF8eGtiVKpXQ9pYODvSAX2bwDZ6lZBI9paiQmxlqrj3fIk5
   P+8Ta12dmkLzDffyHa2mD6RLnd7lvH/T8Q25AEY98OjmM+r9aPzIzCk38
   Q==;
X-CSE-ConnectionGUID: gzOW18kJRZSu1kbN26attw==
X-CSE-MsgGUID: C4LU6PQCRPedcZUYc4pQFA==
X-IPAS-Result: =?us-ascii?q?A0BIAgD5pLxq/5L/Ja1aglmCV3VhQkmWSgOeGoF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOCAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQCARG7JIF5M4EBg?=
 =?us-ascii?q?ykBPwJDUNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FygRWDaYEFgVwCAgEXgS6GX?=
 =?us-ascii?q?QSCDRV6EoFaHpMySIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIZIxk2eoEJXoErKWABEBeBB4IHAoJUggACAUlBDgdFUwklRRJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbOD4JKD4YDUgRLDcVGQQ+bgeQNx6BbnKBBAoBEAMXARd6gSmTA?=
 =?us-ascii?q?ySSQaEPCiiDdowilToaM4QEpmsLmH2CWYsxlgBQhGmBaDyBWXAVgyIJShkPj?=
 =?us-ascii?q?i4LC4NghRPHJiQ1CzIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:KZjMtKrbA4OSjbv68KW92LOoVv9eBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnXP/qJNGPxL4p2b963pEhSvpPdmIM1TVQ6/iBhHn9G9ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfrS80s35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0ullJl4Xp
 f86EgI2c0mAjcTsnrunVvY506zPLOGzVG8ekmtrwTecCbMtRorOBv2bo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVvrSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHQFZoJxhnE/
 goq+UzSXjUnauSm4gC9/36ntNL+ln/jYaw7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YQLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:FKdw3qug/ObUThmFQxrRkPaK7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3A3OhHh2oHU8TBBgDZRf65UL3mUc83VUKEnHTyGX2?=
 =?us-ascii?q?DFD9qQpvPF1aM5Lwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AKmiYXwwZMf4Ec5/DKqD1P2TsOumaqI/yLH1Tqaw?=
 =?us-ascii?q?tgfGJOSdCBgaW0CyObKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,132,1787011200"; 
   d="scan'208";a="528740740"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Sep 2026 06:00:27 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id B63E11800058F;
	Wed, 30 Sep 2026 06:00:27 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 5B0F2CC129C; Tue, 29 Sep 2026 23:00:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 2/3] openssh: fix CVE-2026-73282
Date: Tue, 29 Sep 2026 23:00:26 -0700
Message-Id: <20260930060027.1560262-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260930060027.1560262-1-hthakar@cisco.com>
References: <20260930060027.1560262-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 06:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246915

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
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch
new file mode 100644
index 0000000000..a527cca762
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
index f660e78dba..651b7437a6 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-60002.patch \
            file://CVE-2026-60000.patch \
            file://CVE-2026-73283.patch \
+           file://CVE-2026-73282.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.35.6


