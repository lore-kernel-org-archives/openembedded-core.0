Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01736CA9ECF
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23435.1791708073637871388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xM5ZJore;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-487049569b6so598942f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708072; x=1792312872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U/Ajp5IoeOCrSNlJuhn5SUbm2lYhM1iq5jxLdjrr00E=;
        b=xM5ZJoreKuzZtGMUwyEIJturXkOkVORHgrCigTOP0MDX5SarDI2C+7ohMWAhOc8cyY
         JdUHXRW0fYIcStBjo3lYfdkiInXbWZzQhzo+N1kJpT/DeeFvIQyB6W8qkXjXnv+fFw23
         l99VITuAMNvbdmvhQeLMCRBgxAFQviz591n0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708072; x=1792312872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U/Ajp5IoeOCrSNlJuhn5SUbm2lYhM1iq5jxLdjrr00E=;
        b=gv6CefsyHWzCzFx9U5Grc8cvfdTmEKR3MUXyAJyDH5fl+XUI1eGgbqRTYmOcUWzHpU
         11ogbG74e1lJKX8Ty5N/tcDY/vO8WirdJX9WDUlHktEIyfTYbKNP6p8Gg23fH92qKtK2
         UkbNFLKKRMTX97lAt490ZkV+TpDViDjqzpbRaNx2XPmnIDBYNC+KglKBbhF5CNbeUZ8K
         OOaPCvTxVew5UGW84dwZ31SLyAzm4bEi03mC8THt7wwbbk5hYr9p36KdHlseo4tEmDpA
         BGtS8CGuGF9Odas03HOaNW/Ddm9qunGv1Lz7dRf9XOGwBroP4LSNBZECMYryZurlydu5
         Lqqw==
X-Gm-Message-State: AFq9FYL6WwW9hLgcQ3EFitlAJ9ezUJyoNr+1gyX+0SSdSIBQNTNxFrYg
	QF09KNBCRUSBkVJaoyfHw1rhIRP0u76q0wJ5TB1UfbNOrqreCKIK5tOrUtQTTj0XjPUetPU+Hfb
	sxNuM8ro=
X-Gm-Gg: AYBFou2kU9+WAMS7I4PEBw/NlYTuPS0Qmnso/+76sDBiQxUUkktW7I7joqdtHtUEKfS
	+nWs17ba57Z2NPQjH2GWY2dK87fjmo+S7C6X1wdfhj3V/EkaC0bqHhR0hHqqvejfwB0W9CLZ+gu
	exf2m2zZWaPht74IZZJh2FpwOL0NR19PLNCF1EJhaksg3i0bk1qrUu/bxyQoUC7GNQNVTKjnBEB
	lkn1epGvKzDQrAZt15GbfwiaB0ns3avgN00T6TKjxKdySqCUJOwJT0mrH9+nD32b2Fwb5OR6xKy
	euFGZNLTid86yWaAUqoiJ3IHrc4vnJTSSh/Qlp7kv1sz+CYgc0rHSNx8Tcg9jt56g/BaT1sq3iN
	l8aLk4DKuqzRcn4Lvdkf3RKmlfb3owswf4MOVMCObUaPbB4/dGON6fSK3+IJs11u2y7OpTQTm1C
	/Rl1d3eFw+pOjjiJmE6sZjG3KHwlIsnLbzYBPa1MZc4+NRF4fgtWRxCro1zZTuxE3GKO674HTcv
	d0ZI04g+Al0g3RJXQJRTi1Ia+coJ7y4KYLm77PWKGiZDuA+g6tvV6I6RUCBbBeyoxlywGMsxw==
X-Received: by 2002:a05:6000:310c:b0:487:8b9:526a with SMTP id ffacd0b85a97d-48dbacdaa60mr11068364f8f.36.1791708071707;
        Sun, 11 Oct 2026 01:41:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/60] openssh: fix CVE-2026-73281
Date: Sun, 11 Oct 2026 10:39:52 +0200
Message-ID: <925268cdaefa76dd6e2de8b727dfc3825e6a5c22.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247528

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix that permits session-bind requests
while the agent is locked so forwarded sessions remain classified as
remote. The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/6a57081dc35acf3ee298108d4bc3580489608d5
[2] https://www.cve.org/CVERecord?id=CVE-2026-73281

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index c92b059a052..a476645f40f 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-60000.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
+           file://CVE-2026-73281.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

