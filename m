Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C36BC531C8
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5473.1784741053727829341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GyUroSo7;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so38695865e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741052; x=1785345852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Psk7Yrq+Xj8viEqrOi/gL4fAJ6pLQTCo2rj91DROkTA=;
        b=GyUroSo7uy25FtV2yZcnB9sOO9i5Dr06DIj6RRSOvcr95i11UU9S8zGqu3IoUBkNDx
         SiiBw/fWq/cGN4SAec9JoFvLFxMxjfz/j22VQiA+3fL+Ld+/DeZtX95jliLS7T6o9yLQ
         cAaOhuwTXA1QwJ867ODqPMQgFpyJWWTCkTcjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741052; x=1785345852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Psk7Yrq+Xj8viEqrOi/gL4fAJ6pLQTCo2rj91DROkTA=;
        b=Zuv7+N4xLEtJCP/Gr5XEUDMiQdEODNHVvL4dxj4RB3KpnIVf1zek8DQPZ5D1AeQrVW
         NWjMrUu/l8feADGQQbKxq09rVgOYdbbv4f8PYXqSf9Yn4SebY3c3wDf3nFqniyboc1pM
         Ay1sr/SAc2rQ7IqtRSvZjvxN9n+XVymT2+uRiICp6lngBrbt/p33dkmaed64izib0oLR
         Ub61W1i00laKUGCi78ZHm6Hjc6wxifz1mJvKQ21ZXyQtRY3+yQ2QIldKijCJDlAoKXvx
         6IhDnxEIENHEeoI+Rkp/iAY8sA0T728VrvmTQXbrNYU8DTU7ui0ACi1CJbvV/JJVdPWY
         TKFQ==
X-Gm-Message-State: AOJu0YwbhXpHQUHQuXh+he21Zh2Ogy6srY/hKrSOmoywLSiuICiYYZJb
	De204pt4YZqGnXYjoFQTFvIo+JMulqQn/p9sYgCcw68Y31ASoE+kPMAYDEZNWQpUGXhP0Lq8syV
	YoiRSDHA=
X-Gm-Gg: AR+sD12mL0OmmbHUYyfsOtcM9OaD3WGr0VygQ2OhQ4xDBkWUV2kFUG3taFMh95qBXex
	2IJ1XMKaa/fGyw0zwuYFnMSKuzzomuV3F591Tj/maiG1jxjuEUTfupm7B3eVWQ4pdf/AL8iciBE
	DX4Uy1e39MhyeWzo2mH+VP7jKJrYBP9wXdojFVsU6ej5rz5bKsQvTNPQIDDGUxlSUV9m8z9ItkO
	kYnwMu/XQw6TqRTVxxMWU4kTSso+zWmLqSV0SC/im5mnS9BQu6Xm9iBHaDDWZoeIA0pzii7aNGW
	ry0DvqtXtXhspMLYLdG+9HBG5YiZADsrAMrAoPAjX5lkITnVmRfuHQDFDh5rvyBhVe8dadJmSDS
	8054HffQUhx57/geVEfdSeuJNsJAjGKo7qwYDhkKE5/KE72UdVSqWGK/QQm2pWICDWTGzAnZDI9
	lgjyi41qdKC9r91dVhV+psyIVJDF9Fb474Wk2Z0Jvus0burglX8GgxfTyED7ETC/K048a9Xgc0z
	WjGjPUgnfle
X-Received: by 2002:a05:600c:310b:b0:495:7287:293d with SMTP id 5b1f17b1804b1-495728736b3mr10656585e9.27.1784741051880;
        Wed, 22 Jul 2026 10:24:11 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/27] openssh: Fix CVE-2026-60001
Date: Wed, 22 Jul 2026 19:23:37 +0200
Message-ID: <90d9e72af4a20f0e69bfe2a43f4cbb46c00a26de.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241734

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-60001. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/d43ba60c91cb323ca921049b7d43b1908c318454
[2] https://www.cve.org/CVERecord?id=CVE-2026-60001

Signed-off-by: Devansh Patel <devanshp@cisco.com>
[YC: patch referenced in https://ubuntu.com/security/CVE-2026-60001]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-60001.patch      | 130 ++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
new file mode 100644
index 00000000000..aa32484b17d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
@@ -0,0 +1,130 @@
+From 6bc7dd87d543c882994f95c8309846dfda9ab503 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 6 Jul 2026 07:44:48 +0000
+Subject: [PATCH] upstream: Fix cases in GSSAPI and keyboard-interactive
+
+authentication where the minimum per-attempt delay was not being enforced.
+
+Reported by Orange Cyberdefense Vulnerability Team
+
+OpenBSD-Commit-ID: c40bd35cc2428fcaccad7a141703c28baa6da01e
+
+CVE: CVE-2026-60001
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/d43ba60c91cb323ca921049b7d43b1908c318454]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunks in auth.h,
+  auth2-chall.c, auth2-gss.c, and auth2.c and retained the Wrynose
+  OpenSSH 10.3p1 revisions because this stable backport carries only the
+  functional security changes.
+
+(cherry picked from commit d43ba60c91cb323ca921049b7d43b1908c318454)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ auth.h        |  1 +
+ auth2-chall.c |  4 ++++
+ auth2-gss.c   |  7 +++++++
+ auth2.c       | 10 ++++++++--
+ 4 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/auth.h b/auth.h
+index 634a84aa8..c2cfa5ed8 100644
+--- a/auth.h
++++ b/auth.h
+@@ -175,6 +175,7 @@ void	auth_log(struct ssh *, int, int, const char *, const char *);
+ void	auth_maxtries_exceeded(struct ssh *) __attribute__((noreturn));
+ void	userauth_finish(struct ssh *, int, const char *, const char *);
+ int	auth_root_allowed(struct ssh *, const char *);
++void	auth_failure_delay(Authctxt *, double);
+ 
+ char	*auth2_read_banner(void);
+ int	 auth2_methods_valid(const char *, int);
+diff --git a/auth2-chall.c b/auth2-chall.c
+index f3889079b..4687ca8e2 100644
+--- a/auth2-chall.c
++++ b/auth2-chall.c
+@@ -300,6 +300,7 @@ input_userauth_info_response(int type, uint32_t seq, struct ssh *ssh)
+ 	u_int i, nresp;
+ 	const char *devicename = NULL;
+ 	char **response = NULL;
++	double tstart = monotime_double();
+ 
+ 	if (authctxt == NULL)
+ 		fatal_f("no authctxt");
+@@ -358,6 +359,9 @@ input_userauth_info_response(int type, uint32_t seq, struct ssh *ssh)
+ 			auth2_challenge_start(ssh);
+ 		}
+ 	}
++
++	if (!authenticated)
++		auth_failure_delay(authctxt, tstart);
+ 	userauth_finish(ssh, authenticated, "keyboard-interactive",
+ 	    devicename);
+ 	return 0;
+diff --git a/auth2-gss.c b/auth2-gss.c
+index 053548527..f27ac9221 100644
+--- a/auth2-gss.c
++++ b/auth2-gss.c
+@@ -255,6 +255,7 @@ input_gssapi_exchange_complete(int type, uint32_t plen, struct ssh *ssh)
+ {
+ 	Authctxt *authctxt = ssh->authctxt;
+ 	int r, authenticated;
++	double tstart = monotime_double();
+ 
+ 	if (authctxt == NULL)
+ 		fatal("No authentication or GSSAPI context");
+@@ -268,6 +269,8 @@ input_gssapi_exchange_complete(int type, uint32_t plen, struct ssh *ssh)
+ 		fatal_fr(r, "parse packet");
+ 
+ 	authenticated = mm_ssh_gssapi_userok(authctxt->user);
++	if (!authenticated)
++		auth_failure_delay(authctxt, tstart);
+ 
+ 	authctxt->postponed = 0;
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+@@ -288,6 +291,7 @@ input_gssapi_mic(int type, uint32_t plen, struct ssh *ssh)
+ 	gss_buffer_desc mic, gssbuf;
+ 	u_char *p;
+ 	size_t len;
++	double tstart = monotime_double();
+ 
+ 	if (authctxt == NULL)
+ 		fatal("No authentication or GSSAPI context");
+@@ -315,6 +319,9 @@ input_gssapi_mic(int type, uint32_t plen, struct ssh *ssh)
+ 	sshbuf_free(b);
+ 	free(mic.value);
+ 
++	if (!authenticated)
++		auth_failure_delay(authctxt, tstart);
++
+ 	authctxt->postponed = 0;
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_ERRTOK, NULL);
+diff --git a/auth2.c b/auth2.c
+index 3a1682746..7ba611c02 100644
+--- a/auth2.c
++++ b/auth2.c
+@@ -265,6 +265,12 @@ ensure_minimum_time_since(double start, double seconds)
+ 	nanosleep(&ts, NULL);
+ }
+ 
++void
++auth_failure_delay(Authctxt *authctxt, double tstart)
++{
++	ensure_minimum_time_since(tstart, user_specific_delay(authctxt->user));
++}
++
+ static int
+ input_userauth_request(int type, uint32_t seq, struct ssh *ssh)
+ {
+@@ -346,8 +352,8 @@ input_userauth_request(int type, uint32_t seq, struct ssh *ssh)
+ 		authenticated =	m->userauth(ssh, method);
+ 	}
+ 	if (!authctxt->authenticated && strcmp(method, "none") != 0)
+-		ensure_minimum_time_since(tstart,
+-		    user_specific_delay(authctxt->user));
++		auth_failure_delay(authctxt, tstart);
++
+ 	userauth_finish(ssh, authenticated, method, NULL);
+ 	r = 0;
+  out:
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index c3b8d910dd7..d8d73ee5dd0 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-59997.patch \
            file://CVE-2026-59996.patch \
            file://CVE-2026-59995.patch \
+           file://CVE-2026-60001.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

