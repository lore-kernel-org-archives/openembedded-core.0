Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A13CA5FAB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 06:00:39 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7106.1790748028808637812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 23:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UOjjF9HF;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4089; q=dns/txt;
  s=iport01; t=1790748028; x=1791957628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1qmah9xUD8VLpZjBjvS4dywbd9sQiVQop52OuMFz3mw=;
  b=UOjjF9HFQJJf2DTUe8a41T0cB9nv26hqX7vZCSL9aJqoyYBJtyrJonsj
   zylVZiP4JhasCwSLEgLJ6lkA0ERI+jIqkZ+W48AswkbXzIaeWZ1AMGBxq
   skIDGwf6gzXYJHG9duNad5PgOFGL79DBPAbBd03LiDWHteru0Z1YANuBD
   P+eVP/ljaGuH/vlEKPXR+if3uZUmolgRwHeftrj1iofFmd4BSuAv0yUJe
   dI9eFu25TsofuLmI+0+RpMr27KjKweJ+On7vc5V5vzT+mHkTrrEurYt65
   PAfJIT+/y6dMGv8EFLzKb9KKuuck73arPeNYXOMML5yDTqYTitmjNZPVN
   A==;
X-CSE-ConnectionGUID: 52l1iK6fQI2NudSkfJpcZQ==
X-CSE-MsgGUID: Fxp35mzDTxC6q/PDWy9OPg==
X-IPAS-Result: =?us-ascii?q?A0BJAgD5pLxq/5L/Ja1SCIJZgld1YUJJlkoDkUmMUYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOCAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rGgkIGYMCAYJ0AgERuySBe?=
 =?us-ascii?q?TOBAYMpAT8CQ1DbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoR+gQWBXAICAReBH?=
 =?us-ascii?q?4ZsBIINFXoSgVoeZZJNSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BIIIZIxk2eoEJXoErKWABEBeBB4IHAoJUggACAUlBDgdFUwklRRJHJ?=
 =?us-ascii?q?iIIEgkBExowC4EbOD4JKD4YDUgRLDcVGQQ+bgeQNx6CWQcBgQ0BEAMXAYIyC?=
 =?us-ascii?q?KNHgiGhDwoog3aMIpU6GjOEBKZrC5h9glmLMZYAA02EaYFoPIFZcBWDIglKG?=
 =?us-ascii?q?Q+OOYNrhRPHBSEkNQsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:UXtKH6L984bjtNy/FE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS3zNWy
 zcdUGyAPPjYZjT0fo0gYNy+oxxX7JLTx9dqHgEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH9imUsajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0zVkVvPK5G9N9WW0dT+
 ccbJhIVZSK60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsiuG3a4qPIIDiqcN9sFaA/
 T/D7UjFEjpELZun5QWUo1WUibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:ZMo/8qx1wz6gwKHuxhGSKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3AwpSqomkXmrNjD1BX+ihAiJqcac/XOSCHyC7RABG?=
 =?us-ascii?q?2MEczbqCZclye2rtvofM7zg=3D=3D?=
X-Talos-MUID: 9a23:oO10kAY7IIr1KuBTmS/032xnJutU84/wEQc1vaoX6u68Onkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,132,1787011200"; 
   d="scan'208";a="521238224"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Sep 2026 06:00:27 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id B7B66180005A0;
	Wed, 30 Sep 2026 06:00:27 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 5E06BCC12B5; Tue, 29 Sep 2026 23:00:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 3/3] openssh: fix CVE-2026-73281
Date: Tue, 29 Sep 2026 23:00:27 -0700
Message-Id: <20260930060027.1560262-3-hthakar@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 06:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246917

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix that permits session-bind requests
while the agent is locked so forwarded sessions remain classified as
remote. The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/6a57081dc35acf3ee298108d4bc3580489608d5
[2] https://www.cve.org/CVERecord?id=CVE-2026-73281

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-73281.patch      | 76 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch
new file mode 100644
index 0000000000..9f017ece17
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch
@@ -0,0 +1,76 @@
+From df8fe9ebecc57c486f2d1ea5b1a5c34b22858bcb Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 7 Aug 2026 05:18:05 +0000
+Subject: [PATCH] upstream: Allow session-bind@openssh.com requests when the
+ agent is
+
+locked, otherwise forwarding sessions established with an agent was locked
+will be treated as local, rather than remote.
+
+Reported by sn0x-sharma
+
+OpenBSD-Commit-ID: 524f210c6f2b3a06e0a2f6d0af5188a9a75fa2c7
+
+CVE: CVE-2026-73281
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6a57081dc35acf3ee298108d4bc3580489608d5f]
+
+Backport Changes:
+- Omitted the upstream OpenBSD RCS revision header update because it does
+  not apply to the OpenSSH 9.6p1 source revision.
+- OpenSSH 9.6p1 lacks the later query extension and replied/generic_fail
+  dispatch, so locked non-session-bind extensions retain the 9.6p1
+  success=false response path.
+
+(cherry picked from commit 6a57081dc35acf3ee298108d4bc3580489608d5f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ ssh-agent.c | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 2d2c6fcc..f1c35fd2 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1778,10 +1778,19 @@ process_extension(SocketEntry *e)
+ 		error_fr(r, "parse");
+ 		goto send;
+ 	}
+-	if (strcmp(name, "session-bind@openssh.com") == 0)
++	/*
++	 * This function can be called while the agent is locked to allow
++	 * session binds to be processed for new channels.
++	 * Other operations should be refused when locked.
++	 */
++
++	if (strcmp(name, "session-bind@openssh.com") == 0) {
+ 		success = process_ext_session_bind(e);
+-	else
++	} else if (locked) {
++		debug_f("attempt to use extension \"%s\" while locked", name);
++	} else {
+ 		debug_f("unsupported extension \"%s\"", name);
++	}
+ 	free(name);
+ send:
+ 	send_status(e, success);
+@@ -1831,16 +1840,19 @@ process_message(u_int socknum)
+ 
+ 	/* check whether agent is locked */
+ 	if (locked && type != SSH_AGENTC_UNLOCK) {
+-		sshbuf_reset(e->request);
+ 		switch (type) {
+ 		case SSH2_AGENTC_REQUEST_IDENTITIES:
+ 			/* send empty lists */
+ 			no_identities(e);
+ 			break;
++		case SSH_AGENTC_EXTENSION:
++			process_extension(e);
++			break;
+ 		default:
+ 			/* send a fail message for all other request types */
+ 			send_status(e, 0);
+ 		}
++		sshbuf_reset(e->request);
+ 		return 1;
+ 	}
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 651b7437a6..572a614380 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-60000.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
+           file://CVE-2026-73281.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.35.6


