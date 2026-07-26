Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB6FC53219
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7379.1785054617481542265
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZnNCEttw;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956242332dso15443465e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054616; x=1785659416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F9bzdUKOj8JVtnRpSbTmPxZBEghQshYdZPxsnfjYRqU=;
        b=ZnNCEttwV/L28U4BMNawIGMssmUwMK6/4gWWH7gFuMro6V+5ZfLf54KCo0sMIJMkrY
         UlOuzZryChqu9Ye9jKHCHJB1NvGbVdvgddoiZUiutiEyHWeZC5nNK98bzqdDmHAsvWyW
         Hh1HZoVjIKQ9CUXmSxuOU+MQA4q+1JYN5zEbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054616; x=1785659416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F9bzdUKOj8JVtnRpSbTmPxZBEghQshYdZPxsnfjYRqU=;
        b=Wqx+WkMbc87UBqBgAyENex0HrgxQc1sCRcFXq5Udb6joO8vLDBoZnaumb0wPQ4Az/v
         MIXAiqBVa51o2tv2n8vyafltaITJXS6IHlCHhrRvm71McqjH8UiZkXikaI3/aBlZcMBs
         7HVi/XGI8mH3XOP3o01zathhYebPJSeMmXIR0ILEi1a1WT/CkwbA/A8EVARuNRISKNhi
         tmdbKcZJzyA+Dk+6oVTJzAzigH5qgdB/GyGwcem63L5aXCRhz8anPRKPm+Fg+56B7tfm
         PZ0DsqhlaJlgAzgWeJNghyxj2+u8U73wAiYjYwrbR3ThxOn06wNo1UESrFF4UhhH4pvi
         NNqQ==
X-Gm-Message-State: AOJu0YxTioZZXn01917H5tvH5kfBbPfRa0NXE66yMlY8YVpOC+qxQUlj
	43C73M9P3ShlAEsnMyWlBNjify/Z9isZ0mnBMplwbJaLeKHQMhgYnPGBPd0qB97/12u8po1k+Y/
	jOgvZYkw=
X-Gm-Gg: AR+sD13yYIbU+ZwerHmw2MGAgOQYVkulnFyBPIiYJvQxJKbWEoK0tVXfusE1JMunkLH
	GvFW9rmZ2x2LradpU4fNqA5dqnbyS4I04QjfHK6PYLX7Q9f6z20j2hdJYz58iUzOSVWPr35g6cm
	qbX7OQANRiGQvzq1j03x18NLAZswgh8p2Mj398UefFT00u+SPlZGMYr2lwZxi20LvapHZzfNQk9
	3z+iwx2X490LmuRicCQpSA/ZWiE9VhCVuwCkj3MNRlUQyFOARj4Q/qgAz32lwrzBlbdQ0bsEEG/
	6PtlFht/COOdETXFmOgmMI0S/YLv46eoh+DmEuATsHiZUwlNuFVN48aH7PBq4JreX7/UmGGoO2a
	47kvghK6Qu/JjPkITPL/Pnqp+I/Ozv3Cv0dXo3GSYc5s3RaNHNLBdIDYbxKtvJkXPcrcWQyszTA
	kJQubdKx29Exe03Nfkg0j7hzsPT1aPfFcNZNvOpuJlGb9H/9sLy6Rm9DfzFCWh/+PiKoaOwLXF1
	I0yKU+4crLCdOP/
X-Received: by 2002:a05:600c:630d:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-496b56bec0cmr61052995e9.12.1785054615601;
        Sun, 26 Jul 2026 01:30:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/31] openssh: Fix CVE-2026-60001
Date: Sun, 26 Jul 2026 10:29:34 +0200
Message-ID: <11cf9397c6ca0d8c080fbceb190d2a2b72b40da6.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241992

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-60001. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/d43ba60c91cb323ca921049b7d43b1908c318454
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-60001

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-60001.patch      | 130 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
new file mode 100644
index 00000000000..ff1d14c7c9b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
@@ -0,0 +1,130 @@
+From ef41798b35a53757f8aa08ad14ee1463b0fe9b15 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 6 Jul 2026 07:44:48 +0000
+Subject: [PATCH] upstream: Fix cases in GSSAPI and keyboard-interactive
+
+authentication where the minimum per-attempt delay was not being enforced.
+
+Reported by Orange Cyberdefense Vulnerability Team
+
+CVE: CVE-2026-60001
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/d43ba60c91cb323ca921049b7d43b1908c318454]
+
+Backport Changes:
+- Kept Scarthgap's PRIVSEP(ssh_gssapi_userok()) interface and GSSAPI
+  display-name recording while adding the upstream failure-delay calls;
+  mm_ssh_gssapi_userok() belongs to the later split-sshd architecture.
+- Retained the Scarthgap OpenBSD revision identifiers in auth.h,
+  auth2-chall.c, auth2-gss.c, and auth2.c.
+
+OpenBSD-Commit-ID: c40bd35cc2428fcaccad7a141703c28baa6da01e
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
+index 6d2d39762..9ad4898c5 100644
+--- a/auth.h
++++ b/auth.h
+@@ -173,6 +173,7 @@ void	auth_log(struct ssh *, int, int, const char *, const char *);
+ void	auth_maxtries_exceeded(struct ssh *) __attribute__((noreturn));
+ void	userauth_finish(struct ssh *, int, const char *, const char *);
+ int	auth_root_allowed(struct ssh *, const char *);
++void	auth_failure_delay(Authctxt *, double);
+ 
+ char	*auth2_read_banner(void);
+ int	 auth2_methods_valid(const char *, int);
+diff --git a/auth2-chall.c b/auth2-chall.c
+index 021df8291..20e70d222 100644
+--- a/auth2-chall.c
++++ b/auth2-chall.c
+@@ -296,6 +296,7 @@ input_userauth_info_response(int type, u_int32_t seq, struct ssh *ssh)
+ 	u_int i, nresp;
+ 	const char *devicename = NULL;
+ 	char **response = NULL;
++	double tstart = monotime_double();
+ 
+ 	if (authctxt == NULL)
+ 		fatal_f("no authctxt");
+@@ -354,6 +355,9 @@ input_userauth_info_response(int type, u_int32_t seq, struct ssh *ssh)
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
+index f72a38998..195578bcf 100644
+--- a/auth2-gss.c
++++ b/auth2-gss.c
+@@ -255,6 +255,7 @@ input_gssapi_exchange_complete(int type, u_int32_t plen, struct ssh *ssh)
+ 	Authctxt *authctxt = ssh->authctxt;
+ 	int r, authenticated;
+ 	const char *displayname;
++	double tstart = monotime_double();
+ 
+ 	if (authctxt == NULL || (authctxt->methoddata == NULL && !use_privsep))
+ 		fatal("No authentication or GSSAPI context");
+@@ -268,6 +269,8 @@ input_gssapi_exchange_complete(int type, u_int32_t plen, struct ssh *ssh)
+ 		fatal_fr(r, "parse packet");
+ 
+ 	authenticated = PRIVSEP(ssh_gssapi_userok(authctxt->user));
++	if (!authenticated)
++		auth_failure_delay(authctxt, tstart);
+ 
+ 	if ((!use_privsep || mm_is_monitor()) &&
+ 	    (displayname = ssh_gssapi_displayname()) != NULL)
+@@ -293,6 +296,7 @@ input_gssapi_mic(int type, u_int32_t plen, struct ssh *ssh)
+ 	const char *displayname;
+ 	u_char *p;
+ 	size_t len;
++	double tstart = monotime_double();
+ 
+ 	if (authctxt == NULL || (authctxt->methoddata == NULL && !use_privsep))
+ 		fatal("No authentication or GSSAPI context");
+@@ -320,6 +324,9 @@ input_gssapi_mic(int type, u_int32_t plen, struct ssh *ssh)
+ 	sshbuf_free(b);
+ 	free(mic.value);
+ 
++	if (!authenticated)
++		auth_failure_delay(authctxt, tstart);
++
+ 	if ((!use_privsep || mm_is_monitor()) &&
+ 	    (displayname = ssh_gssapi_displayname()) != NULL)
+ 		auth2_record_info(authctxt, "%s", displayname);
+diff --git a/auth2.c b/auth2.c
+index 271789a77..18077d625 100644
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
+ input_userauth_request(int type, u_int32_t seq, struct ssh *ssh)
+ {
+@@ -348,8 +354,8 @@ input_userauth_request(int type, u_int32_t seq, struct ssh *ssh)
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 37f4dc20dd9..0d9d33c4597 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-59997.patch \
            file://CVE-2026-59996.patch \
            file://CVE-2026-59995.patch \
+           file://CVE-2026-60001.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

