Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19336C4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:57:09 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3617.1784570226845009020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IiKv5kou;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6510; q=dns/txt;
  s=iport01; t=1784570226; x=1785779826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UL2BQJX82e0Lv6hmdKQyJhqNmqs5OISl2wIdOt0B1c0=;
  b=IiKv5kouDR6KODMQiSlHNMa7AC8OS2kzefKW0+gzVWlFgujQUmuVz8NV
   5W4BpE8Q7ab8BXemjX9b9zfM7R1vio414PTfnWgATq0i+3WfD7SpqCVWQ
   GiEqM1WDRo/Vm8UyHo9BkP3We6El7Pv733+wNx7Jk974iNdfdQ7/2Snr+
   YRdCk/domVMK8US6PT7DCcvgo7DvTv/Y2jgeMDobZe9ypAeM71ff5vu2j
   cO8i/Z0EFMbJWHXzkJtZ/eCZaSHLOzq0ZPjvsFWNeSFEHecujjj5K8q5N
   MEP8bKzilAgcfx+DxsD/f5KiX6t8st7Rs2sjGoV8btUPckX3R/skJYmjM
   w==;
X-CSE-ConnectionGUID: qkfC+F7WSEmp+U64Sx8vnw==
X-CSE-MsgGUID: /v+k3xMbSRSE4v910wVXVA==
X-IPAS-Result: =?us-ascii?q?A0BIAgAwYV5q/4z/Ja1aglmCV3RfQkmWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNUwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBGxIQHAMBAi8rIwgZgwIBgnQCARG7aoF5M4EBg?=
 =?us-ascii?q?ygBPwJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FygRWBO4IugQWBXAICAReIC?=
 =?us-ascii?q?wSCInoSgVoej3RIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBH?=
 =?us-ascii?q?YE6gQKEdCMfAzl/gS91SnctaQESF4EmghICgTsCDgMLGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?UAjgTxBMw8BWiEJCgETGBc/JYECLwYWBpMMEZI3gTWfWgoog3WMIZU6GjOqb?=
 =?us-ascii?q?AuYfY4KlTYyC12EaYFoPIFZcBWDIglKGQ+OLQsLg2CFE8lHJDULMgEBBwIHD?=
 =?us-ascii?q?gMLgWiRfgEB?=
IronPort-Data: A9a23:jn6mJq3mTXTP3qyNy/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzAPm
 zBMCmuOMveMamL9KI9+Oduw8R4B75CDnNJkSlA53Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuajpKg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGFUI4Fs42pdlMLGRWt
 sFGdAsdPg6FmLfjqF67YrEEasULNsLnOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiYC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+OW0a4aNI4faFK25mG7fu
 CHFpHTcCCogD/HD12vcqm2SttHmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:pcunaqmVUbzo9qsnEbBHK5AuKpjpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:kVJLX24E/QW3qC7hF9ss7U0aMYMLLULm4XLIYHLmVV15GKOTVgrF
X-Talos-MUID: 9a23:LgKRvgmfrVM9i/ssDTIYdnolKoRruLSLAns3qrhapZjdbTNOCwm02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="513401389"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:57:05 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id C14A718000612;
	Mon, 20 Jul 2026 17:57:05 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 3AB05CEC319; Mon, 20 Jul 2026 10:57:05 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][wrynose][PATCH 8/8] openssh: Fix CVE-2026-60000
Date: Mon, 20 Jul 2026 10:55:18 -0700
Message-Id: <20260720175518.3546447-8-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175518.3546447-1-devanshp@cisco.com>
References: <20260720175518.3546447-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241474

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-60000. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192
[2] https://www.cve.org/CVERecord?id=CVE-2026-60000

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-60000.patch      | 140 ++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
new file mode 100644
index 0000000000..e9b62e6454
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
index d3d00b994d..768ffcfbea 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-59995.patch \
            file://CVE-2026-60001.patch \
            file://CVE-2026-60002.patch \
+           file://CVE-2026-60000.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


