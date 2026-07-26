Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36ACC531CC
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7381.1785054618641967893
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OTkaQU8U;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954aff6088so14425015e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054617; x=1785659417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZJhsfO5px4G6PvoB/OWdc5qtbS9034gyKSuUEVGMeg8=;
        b=OTkaQU8UEIzfpWOQD2WeDjuarAQsBwmE3oZYtzvnCew4JViH9Lw9/dzzP6xaI7eWoI
         L+3OEtJ+J3Elu+035d/9jpPCi2j0T9gtHzXbqGzpgSAQ0E3q1HxrQkTOxbHUdiq5+lTe
         QOIXW0nNwTEFKEXi0fkMsnC/IQJrJhYWNDZkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054617; x=1785659417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZJhsfO5px4G6PvoB/OWdc5qtbS9034gyKSuUEVGMeg8=;
        b=nGt1iMw5Y0FI53UtJWycWhPU5pIIMOzwrZyjMQh56TiXKgjHfcLREAwr5rYFCJsExB
         b5Dd34MrhZchVdp53hvCj8ARQWJJk5VCNdP9DXBRn99NWa/f+SWXPQEo/04yjjUc2VJ3
         TwWNJ4mo0tgj6s+m+Dfw0HTl9U2zZxlCjBWKoWKTWVvwF2QXJLYTFnJLwk1oML+mFWRn
         WCuQ0s43aVFo1+QTL0bHIbttPz9v5F892aYOM933BoPgcmBZfJ3XLsF140BNs5mRdBi/
         yu8unpSrIrxTWQrnzhys6ODzENswmv11TF3xaPfhiij63D1V1BeHpIRqN27KeAUsVLi7
         YxBw==
X-Gm-Message-State: AOJu0Yw9+7BQK3CDXiz7caTN75Ju5YJ1q3xKvNLNAfaGDJiRIqJYTxNA
	EwHjIo4vi/mBEZkaY21BOQQcHefg84OL6jDKY1o9dyuPB9rJIj134JVVq+jEWabEJFChga9MqjC
	ljxcJUy4=
X-Gm-Gg: AR+sD12brjyNsVkWoqixxvAUxilgRM2mXhCsIWbOl6y+ep8ohmIcJoBQER5G+j3R3it
	4JoGIG2GosvZkY+wqDo5HelRAny4Ena7H4fBMeggmMEN1uTHXXSCiHhVvCtFiefgVfxAvd+9Bxr
	obqMNJwVVbDXvK+ehwEiU66r8iOXGci26jaILKmr5+hImqx0qptImmgpv/xIycmxIPnHZZ2un8z
	rJPFojKl5C0YW5skwWa8lm40lSwZ450xTJBMJKZo3qjBrZpjtHD1wKlVHngzEpq+aZCmwuMOJnY
	xyX7C0G9FqzyAvVlye7kS1blHXwghghIRaGpGIx0yHEm0bjTzSzNPhzVSFfQXgZNsDWFOrjO8Hr
	3aur/1muZTp+stdAYzuHOdygU3AypMTZI0vRHmEX4sDrb0m02C0oGqeRBasK1b7hpVRoNJjIfAg
	8zeakdVmqlxKLxKiUrtKz7YqSbDJgolI6xNczG/VQCO3llRFBx5arvihI3VYt8t/CAuTM3pT6tV
	UPbjw==
X-Received: by 2002:a05:600c:4455:b0:495:4b24:1b64 with SMTP id 5b1f17b1804b1-496b566b0edmr53744305e9.0.1785054616797;
        Sun, 26 Jul 2026 01:30:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/31] openssh: Fix CVE-2026-60000
Date: Sun, 26 Jul 2026 10:29:36 +0200
Message-ID: <c3dad1896c5377635506c87a09234240c5bbca90.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241994

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-60000. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-60000

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-60000.patch      | 140 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
new file mode 100644
index 00000000000..9c25786ced0
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
@@ -0,0 +1,140 @@
+From 055316632809a2e2e58eac2020699b52187d1b11 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 6 Jul 2026 07:53:30 +0000
+Subject: [PATCH] upstream: Fix multiple RFC 4462 (GSSAPIAuthentication)
+ compliance
+
+problems
+
+1) Remove an early failure return for GSSAPI authentication attempts
+made for invalid accounts that yielded different behaviour for
+valid vs invalid accounts.
+
+2) Fix a situation where some GSSAPI requestes were not correctly
+subjected to MaxAuthTries.
+
+3) Fix a moderate pre-authentication resource DoS related to #2.
+
+Add missing logging for error cases.
+
+Report and fixes from Manfred Kaiser, milCERT AT
+
+CVE: CVE-2026-60000
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192]
+
+Backport Changes:
+- Kept Scarthgap's PRIVSEP(ssh_gssapi_server_ctx()) interface and its
+  authentication-context guard while applying the upstream RFC 4462 state,
+  failure, logging, and MaxAuthTries changes.
+- Retained the Scarthgap auth2-gss.c OpenBSD revision identifier.
+
+OpenBSD-Commit-ID: ca0acdd64eea435d6f89534538a9eb404a5629d3
+(cherry picked from commit 5d04ca6af739b82fd30d84d2783ca802ebfa1192)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ auth2-gss.c | 53 ++++++++++++++++++++++++-----------------------------
+ 1 file changed, 24 insertions(+), 29 deletions(-)
+
+diff --git a/auth2-gss.c b/auth2-gss.c
+index 195578bcf..6846eae5b 100644
+--- a/auth2-gss.c
++++ b/auth2-gss.c
+@@ -110,12 +110,6 @@ userauth_gssapi(struct ssh *ssh, const char *method)
+ 		return (0);
+ 	}
+ 
+-	if (!authctxt->valid || authctxt->user == NULL) {
+-		debug2_f("disabled because of invalid user");
+-		free(doid);
+-		return (0);
+-	}
+-
+ 	if (GSS_ERROR(PRIVSEP(ssh_gssapi_server_ctx(&ctxt, &goid)))) {
+ 		if (ctxt != NULL)
+ 			ssh_gssapi_delete_ctx(&ctxt);
+@@ -177,8 +171,14 @@ input_gssapi_token(int type, u_int32_t plen, struct ssh *ssh)
+ 			    (r = sshpkt_send(ssh)) != 0)
+ 				fatal_fr(r, "send ERRTOK packet");
+ 		}
++		logit("Failed gssapi-with-mic for %s%.100s "
++		    "from %.200s port %d ssh2",
++		    authctxt->valid ? "" : "invalid user ",
++		    authctxt->user,
++		    ssh_remote_ipaddr(ssh), ssh_remote_port(ssh));
+ 		authctxt->postponed = 0;
+ 		ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
++		ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_ERRTOK, NULL);
+ 		userauth_finish(ssh, 0, "gssapi-with-mic", NULL);
+ 	} else {
+ 		if (send_tok.length != 0) {
+@@ -190,14 +190,18 @@ input_gssapi_token(int type, u_int32_t plen, struct ssh *ssh)
+ 				fatal_fr(r, "send TOKEN packet");
+ 		}
+ 		if (maj_status == GSS_S_COMPLETE) {
+-			ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+-			if (flags & GSS_C_INTEG_FLAG)
+-				ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_MIC,
++			ssh_dispatch_set(ssh,
++			    SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
++			/* note: keep ERRTOK handler as per RFC 4462 s3.4 */
++			if (flags & GSS_C_INTEG_FLAG) {
++				ssh_dispatch_set(ssh,
++				    SSH2_MSG_USERAUTH_GSSAPI_MIC,
+ 				    &input_gssapi_mic);
+-			else
++			} else {
+ 				ssh_dispatch_set(ssh,
+ 				    SSH2_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE,
+ 				    &input_gssapi_exchange_complete);
++			}
+ 		}
+ 	}
+ 
+@@ -209,10 +213,6 @@ static int
+ input_gssapi_errtok(int type, u_int32_t plen, struct ssh *ssh)
+ {
+ 	Authctxt *authctxt = ssh->authctxt;
+-	Gssctxt *gssctxt;
+-	gss_buffer_desc send_tok = GSS_C_EMPTY_BUFFER;
+-	gss_buffer_desc recv_tok;
+-	OM_uint32 maj_status;
+ 	int r;
+ 	u_char *p;
+ 	size_t len;
+@@ -220,26 +220,21 @@ input_gssapi_errtok(int type, u_int32_t plen, struct ssh *ssh)
+ 	if (authctxt == NULL || (authctxt->methoddata == NULL && !use_privsep))
+ 		fatal("No authentication or GSSAPI context");
+ 
+-	gssctxt = authctxt->methoddata;
+-	if ((r = sshpkt_get_string(ssh, &p, &len)) != 0 ||
++	/* Minimal error handling - just cancel auth and return FAILURE */
++	if ((r = sshpkt_get_string_direct(ssh, NULL, NULL)) != 0 ||
+ 	    (r = sshpkt_get_end(ssh)) != 0)
+ 		fatal_fr(r, "parse packet");
+-	recv_tok.value = p;
+-	recv_tok.length = len;
+-
+-	/* Push the error token into GSSAPI to see what it says */
+-	maj_status = PRIVSEP(ssh_gssapi_accept_ctx(gssctxt, &recv_tok,
+-	    &send_tok, NULL));
+-
+-	free(recv_tok.value);
+ 
+-	/* We can't return anything to the client, even if we wanted to */
++	logit("Failed gssapi-with-mic for %s%.100s from %.200s port %d ssh2",
++	    authctxt->valid ? "" : "invalid user ",
++	    authctxt->user,
++	    ssh_remote_ipaddr(ssh), ssh_remote_port(ssh));
++	authctxt->postponed = 0;
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_ERRTOK, NULL);
+-
+-	/* The client will have already moved on to the next auth */
+-
+-	gss_release_buffer(&maj_status, &send_tok);
++	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_MIC, NULL);
++	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE, NULL);
++	userauth_finish(ssh, 0, "gssapi-with-mic", NULL);
+ 	return 0;
+ }
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 708399e8022..ba8aaad9bbb 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-59995.patch \
            file://CVE-2026-60001.patch \
            file://CVE-2026-60002.patch \
+           file://CVE-2026-60000.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

