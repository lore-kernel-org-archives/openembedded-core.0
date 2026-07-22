Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896DDC4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5534.1784741055148715277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FsTeoK3g;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b966dd74so57331775e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741053; x=1785345853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hIC/W14wqmAWuxK+VKaccwKwKdXtY11Ga4U+fVtG0qY=;
        b=FsTeoK3gQhU/qopIwkGRouUwOwIkA0J+7O9EfmygoksNR6S2E55boWUGH7I1Jhpj6Z
         fBIXSm9KMTDIPGQcDT9N+tchr7fNGBp6fGKaAhKwtSAys84rjnpnbtww6RaZoG9j4zpL
         MFE2CI5mmSOkxjI3Y0PPREyDf8neIJ4iBzUQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741053; x=1785345853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hIC/W14wqmAWuxK+VKaccwKwKdXtY11Ga4U+fVtG0qY=;
        b=qRIHS7GwNMMbvgmECDkDFB24A9+VlZHTHJO82cojsUS9YIi+JtvQdn8vfoP1kU7teV
         ZxHgi34tl0/tncdkYvusbsuw47jqq5oevqK0Vg9wiCqKMqJPuQ9ViNKRfr+3NxNPKPVu
         ZP73WjD00ex82gjmSA6WUhXO8DBZX907m19FXaY0JWbckes826JHk0eqHz79SNy3ZRaR
         aRiFNF2BIfpchKHtRbMXywlroLrqZr9dlKy5FRzblgRJIw1y2pVf3GU88/p52vugb/ai
         TA7ZB23td22JTp2ItxmwrwmlxEZ1OqVl8Sz2nBHiNFR/BPDGSx86CkcjvT7ji1i8P7nk
         hLBg==
X-Gm-Message-State: AOJu0Yzt/QqhDD3JZvMHPYgpL35Zey5kg0Kt+7J77iCKdaJq+AWY4Zin
	zj/R8XPpeqaeSb7zw2+EKRxFz9v4lw7nBiAvuu7AnGoJFbqxEYwDUSeyc0+n1n6h7GP7tuOOE2Y
	Nsy22En0=
X-Gm-Gg: AR+sD11lrFmmouEYJzPxRE0EpimSMd3pc/1z0kZYDXFituBg1SthvJmu0YYOISsafqF
	afjP1rk4hbO0au2+jGwtPUhvxHhv/RQnt06JcfX3fBoyKsQgui87AkbZc3XRW1jh3Q67ZShOSoB
	d1pFuPSVWSX7qqPPMdqpcF3U4rQUxdpw5UyDi24NVMMl3iDNEguDdQvj/PLCuhfRVqgXOcQzLEA
	0bbW1XG4jCht/G9yN+Jhlj8HZ2RdSNE4Q7vHx31aFIEI5aPJUuNJrN5W02x1EgoUAO7oF7Ip0u2
	GSwLS41yQzufBgjCz/3tFZV0ih1DfCidy7wYrecC2tQzofjfPzGdcJTHq9yqQaotuC1Od82AMWI
	Xk/9BuGDDIbV4OFJuvsVNj2iuo5lRJKA03pqvptc5DqenLv7bggZgJdM6dBPjNFUCXCHVweLqOQ
	BmVXRXhyP8seRapqmPxMcn65a1bh7m0S76mDr8XOHbcY72K/I1bl1YdFHYFYZZw+ILhyUS4efWi
	FjodU5rYXKP
X-Received: by 2002:a05:600c:19c8:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-4956202554emr144841375e9.19.1784741053281;
        Wed, 22 Jul 2026 10:24:13 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/27] openssh: Fix CVE-2026-60000
Date: Wed, 22 Jul 2026 19:23:39 +0200
Message-ID: <4c9bd0da0dccaa8a51090c8c172c6b0c5c6fd74c.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241736

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-60000. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192
[2] https://www.cve.org/CVERecord?id=CVE-2026-60000

Signed-off-by: Devansh Patel <devanshp@cisco.com>
[YC: Patch referenced in https://ubuntu.com/security/CVE-2026-60000]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-60000.patch      | 140 ++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
new file mode 100644
index 00000000000..e9b62e64545
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
@@ -0,0 +1,140 @@
+From 884e94fafb20259c78bf394611b9929a7683e2b3 Mon Sep 17 00:00:00 2001
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
+OpenBSD-Commit-ID: ca0acdd64eea435d6f89534538a9eb404a5629d3
+
+CVE: CVE-2026-60000
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk in auth2-gss.c and
+  retained the Wrynose OpenSSH 10.3p1 revision because this stable
+  backport carries only the functional security change.
+
+(cherry picked from commit 5d04ca6af739b82fd30d84d2783ca802ebfa1192)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ auth2-gss.c | 53 ++++++++++++++++++++++++-----------------------------
+ 1 file changed, 24 insertions(+), 29 deletions(-)
+
+diff --git a/auth2-gss.c b/auth2-gss.c
+index f27ac9221..54c96fe4b 100644
+--- a/auth2-gss.c
++++ b/auth2-gss.c
+@@ -111,12 +111,6 @@ userauth_gssapi(struct ssh *ssh, const char *method)
+ 		return (0);
+ 	}
+ 
+-	if (!authctxt->valid || authctxt->user == NULL) {
+-		debug2_f("disabled because of invalid user");
+-		free(doid);
+-		return (0);
+-	}
+-
+ 	if (GSS_ERROR(mm_ssh_gssapi_server_ctx(&ctxt, &goid))) {
+ 		if (ctxt != NULL)
+ 			ssh_gssapi_delete_ctx(&ctxt);
+@@ -178,8 +172,14 @@ input_gssapi_token(int type, uint32_t plen, struct ssh *ssh)
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
+@@ -191,14 +191,18 @@ input_gssapi_token(int type, uint32_t plen, struct ssh *ssh)
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
+@@ -210,10 +214,6 @@ static int
+ input_gssapi_errtok(int type, uint32_t plen, struct ssh *ssh)
+ {
+ 	Authctxt *authctxt = ssh->authctxt;
+-	Gssctxt *gssctxt;
+-	gss_buffer_desc send_tok = GSS_C_EMPTY_BUFFER;
+-	gss_buffer_desc recv_tok;
+-	OM_uint32 maj_status;
+ 	int r;
+ 	u_char *p;
+ 	size_t len;
+@@ -221,26 +221,21 @@ input_gssapi_errtok(int type, uint32_t plen, struct ssh *ssh)
+ 	if (authctxt == NULL)
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
+-	maj_status = mm_ssh_gssapi_accept_ctx(gssctxt, &recv_tok,
+-	    &send_tok, NULL);
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
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 8edb1440fe0..f5184b1fce3 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-59995.patch \
            file://CVE-2026-60001.patch \
            file://CVE-2026-60002.patch \
+           file://CVE-2026-60000.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

