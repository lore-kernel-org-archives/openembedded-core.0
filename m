Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB7ACCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:44 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14417.1792122758616888354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=a8+1W4FV;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10025; q=dns/txt;
  s=iport01; t=1792122758; x=1793332358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8YHDoxha92fmDuzPCQpJ6I95bi5HmWuXef5DT5ZOTkQ=;
  b=a8+1W4FVNYCufOVCkydlN7cIiEmip3dx3pQCTk1jDdpaKC4aOPDBJHW3
   BsRvfovj/cyeI5MfxqydGcKPieihEjT9NYVIcP4G+YZlKUbRU5MQMEhjw
   4eDir910sWfMfiQkFgQC7bH4TQ0J3+rXDCa759ImINhPSAWpuQXmG1h+C
   DPwGIgJSqmBWqRnQb8zeKhTdpedPZfVpJr5pS5XRv4ITyZ3VQay2BHHLt
   AdHxuJy2i1GbN6bJG752HZmS1dz++b0UqPiE7ouAv+Xk8yiV/x1Due59T
   Fp1ojwwRtp82ig+MdZtZQJ7RW0wrROxf8Kgdn5CIHmRGAFTlYtMve3qdl
   w==;
X-CSE-ConnectionGUID: D/CGuEg4SyOV3qdz7MyHBw==
X-CSE-MsgGUID: XjLMxtBPT3e33cfJkgJlBQ==
X-IPAS-Result: =?us-ascii?q?A0DMAgCwntFq/5H/Ja1aglmCV3VgQ0kDlkcDnhwUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRvHCBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAgOBRIZeB?=
 =?us-ascii?q?IINFXoSgVoehHCQOUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiC?=
 =?us-ascii?q?BIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoIvN?=
 =?us-ascii?q?lAKNAErIIIMCgUNoziCIaEPCiiDdowilToaM6pvC5h9jgqVNU1NhGmBagE5g?=
 =?us-ascii?q?VlwFYMiCUoZD44uCwuDYIUTyUcnMgsDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:+DL+l6umScfyBYYGJ/uZfGmO0efnVABfMUV32f8akzHdYApBsoF/q
 tZmKT+DOPvbamD0fNByPd609EkPvpfTm9I3GgRrry0wQSIbgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvra9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw1qFcLnxj+
 qAjORczNQmPlb2T0ZKRVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtKYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4fUG5oFwBzEz
 o7A11T7JjQKKPan9WGIqSmniM3MkgH/crtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:03+CVa6j+xqQn9LEHQPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3ABx0U9mlNuqhMZ8vJwbcOMUw/tDLXOVGa51jNDkD?=
 =?us-ascii?q?kMndOduaMRU3P3bJEudU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxzTYCA4xLpVky8fvCGegm4fdxoxY4YCLGFwnqal?=
 =?us-ascii?q?dtpLfPiJSODi/iB6OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536678624"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id AC1BB1800047E;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 14DF1CBEF6B; Thu, 15 Oct 2026 20:52:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 10/10] openssh: Fix CVE-2026-106553 and CVE-2026-106555
Date: Thu, 15 Oct 2026 20:52:36 -0700
Message-Id: <20261016035236.442896-11-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247920

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the shared upstream fixes referenced in [4] and
[5], using the commits shown in [1], [2], and [3].

[1] https://github.com/openssh/openssh-portable/commit/670510d1e190b0f4e47066f24498c04ada1da0f0
[2] https://github.com/openssh/openssh-portable/commit/6f9cd19af05aa828d7778cfb047faaed1679e8b7
[3] https://github.com/openssh/openssh-portable/commit/d549f99da344c178c5f632a62a6aa60544d7236e
[4] https://ubuntu.com/security/CVE-2026-106553
[5] https://ubuntu.com/security/CVE-2026-106555

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-106553_CVE-2026-106555_p1.patch  | 100 ++++++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p2.patch  |  80 ++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p3.patch  |  42 ++++++++
 .../openssh/openssh_10.3p1.bb                 |   3 +
 4 files changed, 225 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
new file mode 100644
index 0000000000..b27d31d3c9
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
@@ -0,0 +1,100 @@
+From 670510d1e190b0f4e47066f24498c04ada1da0f0 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:37:07 +0000
+Subject: [PATCH] upstream: Reset GSSAPI client state before authentication
+
+Avoids situation where a partially-completed GSSAPI authentication attempt
+can retain state that is subsequently used by a later attempt.
+
+Report and feedback Moritz Theile, also reported by several others.
+
+ok markus, deraadt
+
+OpenBSD-Commit-ID: 95758f23e358b7c19e6205ac1c979193a9145556
+
+CVE: CVE-2026-106553 CVE-2026-106555
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/670510d1e190b0f4e47066f24498c04ada1da0f0]
+
+Backport Changes:
+- Omit upstream OpenBSD revision-only hunks.
+
+(cherry picked from commit 670510d1e190b0f4e47066f24498c04ada1da0f0)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ auth2.c    |  1 +
+ gss-serv.c | 19 ++++++++++++-------
+ monitor.c  |  2 ++
+ ssh-gss.h  |  1 +
+ 4 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/auth2.c b/auth2.c
+--- a/auth2.c
++++ b/auth2.c
+@@ -338,3 +338,4 @@ input_userauth_request(int type, uint32_t seq, struct ssh *ssh)
+ #ifdef GSSAPI
++	ssh_gssapi_cleanup_global_client();
+ 	/* XXX move to auth2_gssapi_stop() */
+ 	ssh_dispatch_set(ssh, SSH2_MSG_USERAUTH_GSSAPI_TOKEN, NULL);
+diff --git a/gss-serv.c b/gss-serv.c
+--- a/gss-serv.c
++++ b/gss-serv.c
+@@ -361,12 +361,21 @@ ssh_gssapi_do_child(char ***envp, u_int *envsizep)
+ 	}
+ }
+ 
++void
++ssh_gssapi_cleanup_global_client()
++{
++	OM_uint32 lmin;
++
++	gss_release_buffer(&lmin, &gssapi_client.displayname);
++	gss_release_buffer(&lmin, &gssapi_client.exportedname);
++	gss_release_cred(&lmin, &gssapi_client.creds);
++	explicit_bzero(&gssapi_client, sizeof(ssh_gssapi_client));
++}
++
+ /* Privileged */
+ int
+ ssh_gssapi_userok(char *user)
+ {
+-	OM_uint32 lmin;
+-
+ 	if (gssapi_client.exportedname.length == 0 ||
+ 	    gssapi_client.exportedname.value == NULL) {
+ 		debug("No suitable client data");
+@@ -377,11 +386,7 @@ ssh_gssapi_userok(char *user)
+ 			return 1;
+ 		else {
+ 			/* Destroy delegated credentials if userok fails */
+-			gss_release_buffer(&lmin, &gssapi_client.displayname);
+-			gss_release_buffer(&lmin, &gssapi_client.exportedname);
+-			gss_release_cred(&lmin, &gssapi_client.creds);
+-			explicit_bzero(&gssapi_client,
+-			    sizeof(ssh_gssapi_client));
++			ssh_gssapi_cleanup_global_client();
+ 			return 0;
+ 		}
+ 	else
+diff --git a/monitor.c b/monitor.c
+--- a/monitor.c
++++ b/monitor.c
+@@ -1990,6 +1990,8 @@ mm_answer_gss_setup_ctx(struct ssh *ssh, int sock, struct sshbuf *m)
+ 	if (!options.gss_authentication)
+ 		fatal_f("GSSAPI authentication not enabled");
+ 
++	ssh_gssapi_cleanup_global_client();
++
+ 	if ((r = sshbuf_get_string(m, &p, &len)) != 0)
+ 		fatal_fr(r, "parse");
+ 	goid.elements = p;
+diff --git a/ssh-gss.h b/ssh-gss.h
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -132,4 +132,5 @@ void ssh_gssapi_cleanup_creds(void);
+ void ssh_gssapi_storecreds(void);
+ const char *ssh_gssapi_displayname(void);
++void ssh_gssapi_cleanup_global_client();
+ 
+ #endif /* GSSAPI */
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
new file mode 100644
index 0000000000..02b7d7661a
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
@@ -0,0 +1,80 @@
+From 6f9cd19af05aa828d7778cfb047faaed1679e8b7 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:37:52 +0000
+Subject: [PATCH] upstream: Only store GSSAPI creds when authn succeeds
+
+Issue report and patch from Moritz Theile
+
+ok markus, deraadt
+
+OpenBSD-Commit-ID: 812bbd22b8dd5a1583094ab2b6ff0045e4088467
+
+CVE: CVE-2026-106553 CVE-2026-106555
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6f9cd19af05aa828d7778cfb047faaed1679e8b7]
+
+Backport Changes:
+- Omit upstream OpenBSD revision-only hunks.
+
+(cherry picked from commit 6f9cd19af05aa828d7778cfb047faaed1679e8b7)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ gss-serv.c | 13 ++++++++++---
+ ssh-gss.h  |  1 +
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/gss-serv.c b/gss-serv.c
+--- a/gss-serv.c
++++ b/gss-serv.c
+@@ -52,7 +52,7 @@ extern ServerOptions options;
+ 
+ static ssh_gssapi_client gssapi_client =
+     { GSS_C_EMPTY_BUFFER, GSS_C_EMPTY_BUFFER,
+-    GSS_C_NO_CREDENTIAL, NULL, {NULL, NULL, NULL, NULL}};
++    GSS_C_NO_CREDENTIAL, NULL, {NULL, NULL, NULL, NULL}, 0};
+ 
+ ssh_gssapi_mech gssapi_null_mech =
+     { NULL, NULL, {0, NULL}, NULL, NULL, NULL, NULL};
+@@ -281,6 +281,7 @@ ssh_gssapi_getclient(Gssctxt *ctx, ssh_gssapi_client *client)
+ 
+ 	gss_buffer_desc ename;
+ 
++	client->userok = 0;
+ 	client->mech = NULL;
+ 
+ 	while (supported_mechs[i]->name != NULL) {
+@@ -332,4 +333,9 @@ ssh_gssapi_storecreds(void)
+ {
++	if (!gssapi_client.userok) {
++		debug_f("GSSAPI client was not authorized, doing nothing");
++		return;
++	}
++
+ 	if (options.gss_deleg_creds == 0) {
+ 		debug_f("delegate credential is disabled, doing nothing");
+ 		return;
+@@ -382,9 +388,10 @@ ssh_gssapi_userok(char *user)
+ 	}
+ 	if (gssapi_client.mech && gssapi_client.mech->userok)
+-		if ((*gssapi_client.mech->userok)(&gssapi_client, user))
++		if ((*gssapi_client.mech->userok)(&gssapi_client, user)) {
++			gssapi_client.userok = 1;
+ 			return 1;
+-		else {
++		} else {
+ 			/* Destroy delegated credentials if userok fails */
+ 			ssh_gssapi_cleanup_global_client();
+ 			return 0;
+ 		}
+diff --git a/ssh-gss.h b/ssh-gss.h
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -72,6 +72,7 @@ typedef struct {
+ 	gss_cred_id_t creds;
+ 	struct ssh_gssapi_mech_struct *mech;
+ 	ssh_gssapi_ccache store;
++	int userok;
+ } ssh_gssapi_client;
+ 
+ typedef struct ssh_gssapi_mech_struct {
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch
new file mode 100644
index 0000000000..0d40de214b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch
@@ -0,0 +1,42 @@
+From d549f99da344c178c5f632a62a6aa60544d7236e Mon Sep 17 00:00:00 2001
+From: "robert@openbsd.org" <robert@openbsd.org>
+Subject: [PATCH] upstream: ssh_gssapi_cleanup_global_client() needs a prototype
+
+CVE: CVE-2026-106553 CVE-2026-106555
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/d549f99da344c178c5f632a62a6aa60544d7236e]
+
+Backport Changes:
+- Retain the Wrynose 10.3p1 context and omit upstream OpenBSD revision-only
+  hunks.
+
+(cherry picked from commit d549f99da344c178c5f632a62a6aa60544d7236e)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ gss-serv.c | 2 +-
+ ssh-gss.h  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gss-serv.c b/gss-serv.c
+--- a/gss-serv.c
++++ b/gss-serv.c
+@@ -368,7 +368,7 @@ ssh_gssapi_do_child(char ***envp, u_int *envsizep)
+ }
+ 
+ void
+-ssh_gssapi_cleanup_global_client()
++ssh_gssapi_cleanup_global_client(void)
+ {
+ 	OM_uint32 lmin;
+ 
+diff --git a/ssh-gss.h b/ssh-gss.h
+--- a/ssh-gss.h
++++ b/ssh-gss.h
+@@ -133,5 +133,5 @@ void ssh_gssapi_cleanup_creds(void);
+ void ssh_gssapi_storecreds(void);
+ const char *ssh_gssapi_displayname(void);
+-void ssh_gssapi_cleanup_global_client();
++void ssh_gssapi_cleanup_global_client(void);
+ 
+ #endif /* GSSAPI */
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a2a5a3b924..925b22e129 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -43,6 +43,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106585.patch \
            file://CVE-2026-106583.patch \
            file://CVE-2026-106552.patch \
+           file://CVE-2026-106553_CVE-2026-106555_p1.patch \
+           file://CVE-2026-106553_CVE-2026-106555_p2.patch \
+           file://CVE-2026-106553_CVE-2026-106555_p3.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


