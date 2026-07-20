Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86944C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:01 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4969.1784573873556979391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k0JqwPtU;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6306; q=dns/txt;
  s=iport01; t=1784573874; x=1785783474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dBCsEnDlRZ6W+N+aj+xuC6ztzmY6RntSIzWrwtNXXSs=;
  b=k0JqwPtUvHudxhLJLvM/pIeslwj8M8b2ga6xNEXCq69EPBXpk6/GJ9m/
   zyzaLVBDDPTlvnow5NiK9QgjXfRUapHuX+YyNRsH7qilUbzN0JPjvYTFA
   wjhH150OWJnMIV5nBvOJgPfDtwPuGrn+32/6N+Jaex/zRa1sEiZhsWpFg
   FKEFRGko3GsBYf/jo7fR1KaE+v4W/J3vIX1t4fL7XGJGZULBwoQgTaIw7
   KtC0zWirQPu0LVWOLv6TcWaNJGfnxXe/RAHAc+rSi0nkbw1Kz1XYCnh6x
   sKwZtwqtt3nFPHN/jeVDKmWMHuWcq5WtvnTkzBRyuDkXakuh5kAQs1Hu/
   w==;
X-CSE-ConnectionGUID: eAmkAk+mSVCzCj90ArWtCg==
X-CSE-MsgGUID: BTj/VWDIR4Sr7j7pgHToKQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgAQb15q/5X/Ja1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNVQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAQIBAi8rHQYIGYMCAYJ0AxG8BYF5M4EBg?=
 =?us-ascii?q?ygBPwJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FygRWCDIFdgQWBXAEBA4giB?=
 =?us-ascii?q?IIiehKBWh6PeUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdg?=
 =?us-ascii?q?TqBAoR0Ix8DOX+BL3VKdy1pARIXgSaCEgKBOwITAwsYDUgRLDcUGQQ+bgeNQ?=
 =?us-ascii?q?SOCQIEECgETFwGCSJNbj16CIaEPCiiDdYwhlToaM6psC5h9jgqVNoEahGmBa?=
 =?us-ascii?q?DyBRwsHcBWDIglKGQ+OLQsLg2CBf4MUyUcnMgsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:s+TmSaMUx+VSA7LvrR30lsFynXyQoLVcMsEvi/4bfWQNrUpxgj1Ux
 2cWC2GPPqzbYjbzc9sgYYS+9klQ6JbSxtRkG3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWYsbAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/hHCUIfPs4dwdhcE0pMp
 KQxMg8RRR/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPXwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQsieOxaoWMK4PiqcN9tHqa4
 Vz500XDXioAa97A0TWlznWPv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:HgDs0q9YKesPQYdaXoZuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdg7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3ABM+R0mhaQGJ9tip/tFlHP97KNDJuf1TYz17TYEq?=
 =?us-ascii?q?DN017Y7/EEXaKx79PnJ87?=
X-Talos-MUID: 9a23:9KDdMgQ0q9KAQwaoRXTGuDMlCvhEwp7yM1pSk8oetOm4Mg9JbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="513427197"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:57:53 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id DA6FC18000326;
	Mon, 20 Jul 2026 18:57:52 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 3A88ECC124C; Mon, 20 Jul 2026 11:57:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH 6/8] openssh: Fix CVE-2026-60001
Date: Mon, 20 Jul 2026 11:57:47 -0700
Message-ID: <20260720185749.4098075-7-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260720185749.4098075-1-devanshp@cisco.com>
References: <20260720185749.4098075-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241482

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-60001. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/d43ba60c91cb323ca921049b7d43b1908c318454
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-60001

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-60001.patch      | 130 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
new file mode 100644
index 0000000000..ff1d14c7c9
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
index b4885ab151..b15b909f60 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -42,6 +42,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-59998.patch \
            file://CVE-2026-59996.patch \
            file://CVE-2026-59995.patch \
+           file://CVE-2026-60001.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.44.4


