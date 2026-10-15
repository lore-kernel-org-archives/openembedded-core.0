Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C8BCC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32447.1792040643326234965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PrvTztPS;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso13555035e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040641; x=1792645441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5qlT/tMAzTBIfqcwnHsy+j7CCn63tTfsj4vZyQ/3Hhg=;
        b=PrvTztPS0+0d5Y8YBYiMzc0N5bg/md6Auwe2DdRgs70upoUKGafaYQaGLcAmLkp3qn
         So4fFt/4RE9sEY9NLtiQEcQURIbovSSpbqcO6n7QxLZhClbmF3rg7O/Eu6hJgYmDWRI+
         za8QvEFrA45qN3q1yOy9+on8d+heHCysAYtkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040641; x=1792645441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5qlT/tMAzTBIfqcwnHsy+j7CCn63tTfsj4vZyQ/3Hhg=;
        b=tBB1FjYa/iUgefmY35nw95NFF7Nfpb6ATLLDecjqazKWHKjfd/eWPO8pgkUrvj2vyh
         XUE1DsDRlwJwTeNd070exH8Yic3rKrIcILrthSnDaHqxnKQB5DiVLx9HXrznDOT9wC+n
         Yk6d5qajnvd2qxGTQOZIYj8jUsHMGEcNF/bmurtKA4z+88vlumHNAmfemHNni0wdhUCW
         BNf/OeUa9wN9o8v8iIdo5R6eOsVEJ4TpawypXDFRixC9PAXnxviA/2UmzxagWfMH0WBi
         BNOfA6Bis6eHS5XD9egnhkY1jRTmOfW3lRu43T8niD5tir4lnF8EgSUw8vqhbiMIxN4/
         vWPA==
X-Gm-Message-State: AFq9FYKf4hqRqwI3CI7ihFzbQDfxRaVdntzA9O4WIuE0tmQTbYTVyWEU
	iaSth2iJI2bVtbYf5vNvvb4g/g8IGSB3EIGNZXKyZqq50xv56ApCQz9epvfbpKLBg6LM28R9pXl
	LeHRTH80=
X-Gm-Gg: AYBFou0rwVCISudM5pwRMJZna7+3baVCIhKJRwIRdgfAy3DG3Ho5+UJnQ61rjhIAdRo
	urUpSyN50au59PESjWhI+DtIVlmP7sN892KYj17Em3NmVNzzHTgwFCSiCTAchyxrblixmDOJSqA
	CqavTjrkaTATpb3pvhrApB1LFCdJ48AE4re2qWlgXAuwRR5JF8ac+2U9jvpMoHdKiFgJL9rMIWc
	5PzqqpOx1OvDWTzJ0CLFXwplkMsRQYijBTfnszvfTxySiD0yux5OowsUGjm0Zr2waOvbovqShyF
	vHYqtnN65fOQzZ2IqwbSBGr8oTPsm56vnvffi1v/Km/UV/J9aUnXgBlpXv6oAl0rk2UI9sWMmMF
	RB3Qwcwj0XniPy41N0G6qLfqoq4f7hPTpMJl5jGb8A6v5f7K5JTecxo7+z1VU7L7pLR55Z8ADDu
	vRXuoJz2waqpZygB2/D8Zovzb0IZFPl7EXohEMr70D/pFxtgUtUYW10Ks5wk6SyRGQ2Ot7FTHIt
	4LjoSkZYuB3KFurdUQ2397agqCs8R8eYgjba8kyq3RJWeOXVKBO1lWCYczHdcelwMH+l3GQZNY=
X-Received: by 2002:a05:600c:870e:b0:4a1:6dca:51e3 with SMTP id 5b1f17b1804b1-4a18e4487ccmr356890205e9.3.1792040641498;
        Wed, 14 Oct 2026 22:04:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 36/55] openssh: fix CVE-2026-73281
Date: Thu, 15 Oct 2026 07:02:59 +0200
Message-ID: <10542c0b4e71d6371062799d6aaa42a6e266b88b.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247834

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
 .../openssh/openssh/CVE-2026-73281.patch      | 76 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch
new file mode 100644
index 00000000000..9f017ece17b
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
index 651b7437a6f..572a614380d 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-60000.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
+           file://CVE-2026-73281.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

