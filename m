Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EC7CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 03:57:57 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.349.1790654267326168547
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 20:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Dyto1GOu;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4146; q=dns/txt;
  s=iport01; t=1790654267; x=1791863867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QmULaKJuyd5yY3p9aEKrjGqaH3RAMwTc+oEZ39TcAm0=;
  b=Dyto1GOuNxjdkJYSFBJ/qjBWP5TIqjt1IIboMnlAevhd1Q/nNN0ntpky
   jpPdjJgDW7PaQ2eB4XAniq3brHSQfMBhVRz09EEZH/QkMVWQFlEYqBXWd
   dXIHSKdhQ7bRzWkmDkYBQZkAmTtwsUvr63evpRrPpKSF5xwYakFM/ejnM
   QbJ9i4bOJ553SlBgvrkML4SyAxjJ/ZcEe40AaJCqI6hqvolCvCGJfZrgs
   LIzJSd8hxLFF91z7Azbwqde5hTFlGBrJm4ajK5IqDQpHooD8DASFQNoGq
   7TQkmYHIK3XKZyw+nvTnBWhQFVuMkO4ZEuxuVKy72164+N704rLwJ4HA/
   w==;
X-CSE-ConnectionGUID: cO5PBzc3Saa5afyBONjf6A==
X-CSE-MsgGUID: Evu86D3WTWyuU++681lLdw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCBNbtq/5P/Ja1SCB4BAQsSDIIFC4JXdWBDSZZKA?=
 =?us-ascii?q?54agX4PAQEBD0QNBAEBhD9GAo4IAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRw?=
 =?us-ascii?q?A2BeTOBAYMpAT8CQ1DbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoR+gQWBXAICA?=
 =?us-ascii?q?ReBH4ZsBIINFXoSgVoeZZJTSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BIIIZIxk2eoEJXoErKWABEBeBB4IHAoJUggECAUlDDgdFUwklR?=
 =?us-ascii?q?RJHJiIIEgkBExowC4EhOEEJKD8YDUgRLDcVGQQ+bgeQPx6CXgcBgQ0BEAMYg?=
 =?us-ascii?q?jIIo0eCIaEPCiiDdowilToaM6pvC5h9jgqWAFCEaYFoPIFZcBWDIglKGQ+OO?=
 =?us-ascii?q?YNrhRPHBSEnMgsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:jv3LC6PqudVBPCfvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUoq0jMHz
 jBKDG+HPfbcM2Kgcoh0O421909QvJfTn982TXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgf0gW4saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/5JUXkcL4ZDwe9+XGhA5
 NY/DjIDMDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzM3wsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FErgeK1YYOJIrRmQ+14gFvI+
 E6dwFjGEwwnd5/BmWOB1n6z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:j7ggcq5mER+HxvM6SAPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AkDYbwWt+RPW7koO3LpgxBx4T6IsuVSDl5mXbeHS?=
 =?us-ascii?q?xADtgRqy/bnmS9v1Nxp8=3D?=
X-Talos-MUID: 9a23:ThPWGwnxkFIsJHdTh0rydnpPKto4vYj1N3wygIg7+IraZXV0HzuC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="529209140"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 03:57:46 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 60D1D18000276;
	Tue, 29 Sep 2026 03:57:46 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 0CAC3CBF202; Mon, 28 Sep 2026 20:57:46 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 3/3] openssh: fix CVE-2026-73281
Date: Mon, 28 Sep 2026 20:57:45 -0700
Message-Id: <20260929035745.321529-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929035745.321529-1-hthakar@cisco.com>
References: <20260929035745.321529-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 03:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246802

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix that permits session-bind requests
while the agent is locked so forwarded sessions remain classified as
remote. The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/6a57081dc35acf3ee298108d4bc3580489608d5
[2] https://www.cve.org/CVERecord?id=CVE-2026-73281

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-73281.patch      | 80 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch
new file mode 100644
index 00000000000..6dbe7b33ff3
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch
@@ -0,0 +1,80 @@
+From 6a57081dc35acf3ee298108d4bc3580489608d5 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6a57081dc35acf3ee298108d4bc3580489608d5]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk and retained the Wrynose
+  OpenSSH 10.3p1 revision.
+- OpenSSH 10.3p1 lacks the later `replied` result tracking in
+  process_extension(), so retained `success = process_ext_query(e)`.
+
+(cherry picked from commit 6a57081dc35acf3ee298108d4bc3580489608d5)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ ssh-agent.c | 23 +++++++++++++++++++----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+index 5fc73d69..1604f540 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1795,12 +1795,22 @@
+ 		return;
+ 	}
+ 
+-	if (strcmp(name, "query") == 0)
+-		success = process_ext_query(e);
+-	else if (strcmp(name, "session-bind@openssh.com") == 0)
++	/*
++	 * This function can be called while the agent is locked to allow
++	 * session binds to be processed for new channels.
++	 * Other operations should be refused when locked.
++	 */
++
++	if (strcmp(name, "session-bind@openssh.com") == 0) {
+ 		success = process_ext_session_bind(e);
+-	else {
++	} else if (locked) {
++		debug_f("attempt to use extension \"%s\" while locked", name);
++		goto generic_fail;
++	} else if (strcmp(name, "query") == 0) {
++		success = process_ext_query(e);
++	} else {
+ 		debug_f("unsupported extension \"%s\"", name);
++ generic_fail:
+ 		free(name);
+ 		send_status(e, 0);
+ 		return;
+@@ -1857,14 +1867,17 @@
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
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 00e2cd8726e..0b34e4563ca 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-60000.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
+           file://CVE-2026-73281.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


