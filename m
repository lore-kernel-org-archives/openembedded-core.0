Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1A5CCA48F
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:45 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14165.1792122758374104954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E3I4zsUN;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3809; q=dns/txt;
  s=iport01; t=1792122758; x=1793332358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oiu/W1PqltvOJpUUHkqYuCLyI9cTKWkVX9eKNmiKLeg=;
  b=E3I4zsUNMs6TB51ka7rsXHCI5n6WGfoC9HiouFmwD/Y1hK26CJ1VnrDV
   CI6akf7HkisDFjW3lwMVKVQE2S1TnNlH3aSWXYwIX2AwCZdtoZzhozEsM
   ExEOi56x+JIwdIF9i4Jq7vzRjvbA08iQd2HB1+BgNFg2vzC7mbJzNX05m
   Ptn5Ya3S9g+EOV4oxZ3icNsXP9XbUnUT6nQ2NgnfERnsP9Awaa1HKkok5
   Gb5YUP14RHjGp84MpsN4IIY6EgXXtQJ171QXpr5BCFo7nVBGUwhVx46OO
   nMgEdELG9ZbsX40FfaQKFu+qpgNTEiWoqJpTguU7HrMiAeykwkAbP40ux
   w==;
X-CSE-ConnectionGUID: vLN0gyqxQTG9YmawNARiIw==
X-CSE-MsgGUID: uie0gWa5SJqAeB3bD9xE5Q==
X-IPAS-Result: =?us-ascii?q?A0BMAgCwntFq/43/Ja1aglmCGD91YENJA4RUkXMDnhyBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDIwQLARgBLRAcAwECAwImAgIrIwgZgwIBgnQDE?=
 =?us-ascii?q?bxwen8zgQGDKQE/AkNQ2zIBCxQBBYEFLoVAgx8BhQNdGAGEfCcbG4FygRWDa?=
 =?us-ascii?q?YEFgVwCA4U4gmoEgiJ6EoFaHpUpSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPhcvWBsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZB?=
 =?us-ascii?q?D0BbgeSFB6CZTEoNQETGIE0eJM1kkChDwoog3aMIpU6GjOqbwuYfY4KlTWBG?=
 =?us-ascii?q?oRpgWg8gVlwFYMiCUoZD445gR8BAoJJhRPJRycyCwMvAQEHAgcOAwuBaJF+A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:CeKWgqws5nbTG2f2o456t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUAy
 TQaDWvVO6rbZTDxe4p1adux8B5SsJDUy4AyS1Zqq1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJF8SG9UX6/9nOF1hp
 M0dIS8rRyqCpv3jldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW3YIKPJ43XG625mG6Fp
 2+e8FvwXyo4LfWS42GP3iO8q7L2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:FdFRwaz2NqJ3lreW6ZmYKrPw8r1zdoMgy1knxilNoNJuHfBw8P
 re+sjztCWE7wr5N0tApTntAsS9qDbnhPxICOoqTNOftXfd2FdARbsKheCJ/9SjIVyaygc378
 ldmsZFZOEYJGIK9PoSmDPIcOoI8Z2g7L2ig/vYwjNGSAFnbLwl0iJCYzzranGfgGJ9dOAE/F
 323Ls9mwad
X-Talos-CUID: 9a23:5SKzZmGlmBPs4DGIqmJ50GhMFdE8YkTh4ybhJkanL09TSZyKHAo=
X-Talos-MUID: 9a23:nXeqpwp8OjqPTMbuOgQezyxjOZ9n3K3zM2IUuJgs4MOoZDxdZg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528025956"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 4BE0F18000182;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id EBCEACBF203; Thu, 15 Oct 2026 20:52:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 03/10] openssh: Fix CVE-2026-106587
Date: Thu, 15 Oct 2026 20:52:29 -0700
Message-Id: <20261016035236.442896-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247913

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/526fd2771342f36142099bec82c49ce0457c5016
[2] https://ubuntu.com/security/CVE-2026-106587

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106587.patch     | 62 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
new file mode 100644
index 0000000000..203dd8cc05
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
@@ -0,0 +1,62 @@
+From 526fd2771342f36142099bec82c49ce0457c5016 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:35:09 +0000
+Subject: [PATCH] upstream: Correctly handle some options that accept "none"
+
+Some options, including AuthorizedPrincipalsFile were documented as accepting
+"none" as a way to disable them, however when overriddes by a ssh_config(5)
+Match keyword, this argument was being interpreted as a literal file.
+
+With Chris Rohlf in collaboration with Claude and Anthropic Research
+
+ok markus, deraadt
+
+OpenBSD-Commit-ID: 802f3a7695eba20924c05e500b0ecd34ec877756
+
+CVE: CVE-2026-106587
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/526fd2771342f36142099bec82c49ce0457c5016]
+
+Backport Changes:
+- Omitted the upstream servconf.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+- Adapted the fix to OpenSSH 10.3p1's manual Match-option copy routine;
+  the upstream commit uses generated option-copy helpers. Left the
+  older version's existing post-authentication cleanup in place, so
+  the CLEAR_ON_NONE macro is undefined immediately after the three
+  pre-authentication options rather than reused below.
+
+(cherry picked from commit 526fd2771342f36142099bec82c49ce0457c5016)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ servconf.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/servconf.c b/servconf.c
+--- a/servconf.c
++++ b/servconf.c
+@@ -2884,6 +2884,23 @@ copy_set_server_options(ServerOptions *dst, ServerOptions *src, int preauth)
+ 
+ 	/* Arguments that accept '+...' need to be expanded */
+ 	assemble_algorithms(dst);
++
++	/*
++	 * These options may be "none" to clear a global setting.  They are
++	 * consulted before authentication, so they must be cleared here
++	 * rather than in the post-auth section below.
++	 */
++#define CLEAR_ON_NONE(v) \
++	do { \
++		if (option_clear_or_none(v)) { \
++			free(v); \
++			v = NULL; \
++		} \
++	} while(0)
++	CLEAR_ON_NONE(dst->authorized_principals_file);
++	CLEAR_ON_NONE(dst->trusted_user_ca_keys);
++	CLEAR_ON_NONE(dst->banner);
++#undef CLEAR_ON_NONE
+ 
+ 	/*
+ 	 * The only things that should be below this point are string options
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 7760dae931..a70ca30b15 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106586_p1.patch \
            file://CVE-2026-106586_p2.patch \
            file://CVE-2026-106586_p3.patch \
+           file://CVE-2026-106587.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


