Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CC3CCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:54:55 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14184.1792122890302983322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bqG2ioEh;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4307; q=dns/txt;
  s=iport01; t=1792122890; x=1793332490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j2eGOtt3dFSJiC6l2YnjU55M1mLOz9fMhJO092LPlgg=;
  b=bqG2ioEh8cPFEq8TSZdAPPE+zAIuoF4uq+cd05oPGzupmNAhrQi5XmMl
   eAWAYUbL3Oy3uFlM5Ucb0UbpNF58D+wGDGXonXkUZojkcclziUiNo1IZ2
   tk1EcR3irumMrXnDU6UgBOuzo7fE5f93q6qpl9PGJA3770bdEtDF8xIyd
   BuIoiRDNGqNKUotWi8oK5W452I34G54Czeh5QvMQ6Xk0CH1gFMgWAHFy9
   oG7rUPQxsG5J0vsVJcwWVz9X/eI06PJeoNpmbwv8PG77sOfQVKxrqaIXq
   YaHnXatCQZO53LZlwctFCdycK3/FU8vANuL2AAeY//LFtXzGHDj3gn5Uv
   Q==;
X-CSE-ConnectionGUID: Uc1GsuEfQweNMoNQWts0Qg==
X-CSE-MsgGUID: 4wUQX28dRaq2RRSfXSWPAw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCwntFq/5H/Ja1aglmCV3VhQkmWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQCARG8cIF5M4EBg?=
 =?us-ascii?q?ykBPwJDUNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FygRWDaYEFgVwBAQOIIgSCI?=
 =?us-ascii?q?noSgVoelSlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETG?=
 =?us-ascii?q?jALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CZVk1ARMXA?=
 =?us-ascii?q?YE0T5NekkChDwoog3aMIpU6GjOqbwuYfY4KlTWBGoRpgWg8gUcLB3AVgyIJS?=
 =?us-ascii?q?hkPjjmDa4F/gxTJRyQ1CzIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:oQdJw65wYMvRCNG2jgE1sAxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mofUW2POfrZNDaje91/PIS+800Gv57UydNqSgRrrXxmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eAIZB1f1qLG936
 vE+DTcrVy+fnLqPz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkESUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYCMK4PXG58K9qqej
 j7Zwl3JWEEWDtWGkwC/yXycvdD3tDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:bB7M/aGor2EqeM2UpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:l0hPt26k2TnjkL7EPNssyUVNNds4X3Pk03r2BkieMFl1U+WsRgrF
X-Talos-MUID: 9a23:deiEWQjY9sW5BhrPoLHcS8MpaNhV2pT0WEw3mIxcgfO/OxxLBA+0k2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521975627"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:54:49 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 5E94818000443;
	Fri, 16 Oct 2026 03:54:49 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 037E3CC129C; Thu, 15 Oct 2026 20:54:49 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 1/1] openssh: fix CVE-2026-106587
Date: Thu, 15 Oct 2026 20:54:48 -0700
Message-Id: <20261016035448.3083867-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035448.3083867-1-hthakar@cisco.com>
References: <20261016035448.3083867-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247924

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1]..

[1] https://github.com/openssh/openssh-portable/commit/526fd2771342f36142099bec82c49ce0457c5016
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106587

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106587.patch     | 76 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
new file mode 100644
index 0000000000..53c42dce1a
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
@@ -0,0 +1,76 @@
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
+- Retained the OpenSSH 9.6p1 OpenBSD revision identifier in servconf.c.
+- Kept the 9.6p1 M_CP_STROPT calls for post-authentication options; the
+  upstream copy_server_option_string helper does not exist in this version.
+
+(cherry picked from commit 526fd2771342f36142099bec82c49ce0457c5016)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ servconf.c | 27 +++++++++++++++++++--------
+ 1 file changed, 19 insertions(+), 8 deletions(-)
+
+diff --git a/servconf.c b/servconf.c
+--- a/servconf.c
++++ b/servconf.c
+@@ -2791,6 +2791,22 @@ copy_set_server_options(ServerOptions *dst, ServerOptions *src, int preauth)
+ 	/* Arguments that accept '+...' need to be expanded */
+ 	assemble_algorithms(dst);
+ 
++	/*
++	 * These options may be "none" to clear a global setting.  They are
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
++
+ 	/*
+ 	 * The only things that should be below this point are string options
+ 	 * which are only used after authentication.
+@@ -2800,15 +2816,10 @@ copy_set_server_options(ServerOptions *dst, ServerOptions *src, int preauth)
+ 
+ 	/* These options may be "none" to clear a global setting */
+ 	M_CP_STROPT(adm_forced_command);
+-	if (option_clear_or_none(dst->adm_forced_command)) {
+-		free(dst->adm_forced_command);
+-		dst->adm_forced_command = NULL;
+-	}
+ 	M_CP_STROPT(chroot_directory);
+-	if (option_clear_or_none(dst->chroot_directory)) {
+-		free(dst->chroot_directory);
+-		dst->chroot_directory = NULL;
+-	}
++	CLEAR_ON_NONE(dst->chroot_directory);
++	CLEAR_ON_NONE(dst->adm_forced_command);
++#undef CLEAR_ON_NONE
+ 
+ 	/* Subsystems require merging. */
+ 	servconf_merge_subsystems(dst, src);
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 572a614380..d71e3d3d87 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
+           file://CVE-2026-106587.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.35.6


