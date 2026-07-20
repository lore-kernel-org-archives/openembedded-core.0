Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE98C44531
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:57:09 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3615.1784570226377132936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VInJyR1i;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6098; q=dns/txt;
  s=iport01; t=1784570226; x=1785779826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZpE5IF/kdb6NL/9ti4ooSWs6PRm6vu10DDK37IE+HZ4=;
  b=VInJyR1iCJEzNgjQNXYJZvwscJ2haQkAcmRSDopURWA82dTy4zA+t1kA
   zsi8UIOOuzYI8wmzO1WEFyjdLmdqYBGB++xtaeN75A/80bdKEH4HxJ+m8
   R78rW3A13t/WjXRv3Pi+epqCJOsKOhcNzuQqzK9HOHTlOK4U4u63JuT3r
   AILGhxV7cZxy7MClR3wcHCZf93N/LoQku873RO3e2w6KALu1Co/YhdB9n
   qhsnssiajnXzZNKA6aN7QhIVaCq8mRkNbriS7PZmsnjqK6fb4ifWLjKrL
   h23UqaUZHLAdAeBZ15S30LqrRtPc75MtHIIN/Yy2fPkLzJDRO4IPjrn15
   A==;
X-CSE-ConnectionGUID: iKR+qQz0SPOIOZFsLJlljw==
X-CSE-MsgGUID: uRgiYlpgRHiivOmCjPKdRw==
X-IPAS-Result: =?us-ascii?q?A0BIAgA1YF5q/5D/Ja1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBGAEbEhAcAwECLysjCBmDAgGCdAIBEbt4gXkzgQGDK?=
 =?us-ascii?q?AE/AkNQ2y4BCxQBBYEzhT+IIFwYAYR8JxsbgXKBFYNpgQWBXAICAReICwSCI?=
 =?us-ascii?q?noSgVoej3RIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6g?=
 =?us-ascii?q?QKEdCMfAzl/gS91SnctaQESF4EmghICgTsCDgMLGA1IESw3FBkEPm4HjUAjg?=
 =?us-ascii?q?kCBDgETGIIsHJNbkX+hDwoog3WMIZU6GjOqbAuYfY4KlTaBGoRpgWg8gVlwF?=
 =?us-ascii?q?YMiCUoZD44tCwuDYIUTyUckNQsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:QTBUn62I6TgOHx9DoPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzFSx
 mcZDWiHOfaINGT8ftwnPtuxoU0C7JfXz4JgSwY53Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuajpKg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDWIMfpQh6L5MOUZv0
 s42MxQvahSBmLfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+OW0aouPIYLSG625mG6Fn
 G3HzmDhDSs6Nd2B7j+u8EqPitXQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:rcNTg6v/jqec3gPY3TWog5q17skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:W0ZC7W9lB7vYf7vu6v6Vv083IIM8S2+F90/3AmiKJ31NarmRS0DFrQ==
X-Talos-MUID: 9a23:meNaFQt35ZWIEhvSbs2nmQttNfZs+6uUKEEMj7IDkMu8FiBKJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512923606"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:57:05 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id BFDBD180003CE;
	Mon, 20 Jul 2026 17:57:05 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 1B931CEC317; Mon, 20 Jul 2026 10:57:05 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][wrynose][PATCH 6/8] openssh: Fix CVE-2026-60001
Date: Mon, 20 Jul 2026 10:55:16 -0700
Message-Id: <20260720175518.3546447-6-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175518.3546447-1-devanshp@cisco.com>
References: <20260720175518.3546447-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241472

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-60001. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/d43ba60c91cb323ca921049b7d43b1908c318454
[2] https://www.cve.org/CVERecord?id=CVE-2026-60001

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-60001.patch      | 130 ++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
new file mode 100644
index 0000000000..aa32484b17
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
index 4aa81214e0..dba0dcaa8a 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-59998.patch \
            file://CVE-2026-59996.patch \
            file://CVE-2026-59995.patch \
+           file://CVE-2026-60001.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


