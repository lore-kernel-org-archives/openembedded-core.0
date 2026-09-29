Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6964BCA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 03:57:56 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.350.1790654267403601653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 20:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BpZs4qq9;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3113; q=dns/txt;
  s=iport01; t=1790654267; x=1791863867;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zTqb8hqJ5U925cz3u0YTdZYKdyOpF9cLTndCKjtpaTQ=;
  b=BpZs4qq9XeExk6Li0SEYr6i0b++yDECWFKCK4/cSTH/H1x7fto2vv+Oy
   MtKA5keAmfQnXCsJI3TuwQhKYATpjjP4+beP3ZEFDFQ84g73pMnzGf8rm
   PfXhRWC9ChyWUh2UsigWOtXKzG+701sbaOjAK9RVCcNzAAefG1BV2a90N
   YTJD5YX8GaWHVavwm/9VMUxq4xy1L1tnibLubXxxcsGWqPFc6tHpr/51+
   0E/m49wQFaxAruFc4VenAu+z2ti4y/ax5NU6U4OQSpdE1W+Pus0S1bWAi
   6sYI1S0Es8qNHhVYMs+TXTEzP8i26B7d+nsmlEHr5WwKf/poCWnV/U28p
   A==;
X-CSE-ConnectionGUID: J7MXGWcRRp2PNvUulSUuFw==
X-CSE-MsgGUID: mLiJOgIkQWyL0IAXu/kWxQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgBANrtq/5D/Ja1aglmCV3VgQ0mWSp4dgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GjgoCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBAgEqCwEYAS0sAwECWiMhgwIBgnQDEcAOgXkzgQGDKQE/AkNQ2?=
 =?us-ascii?q?zIBCxQBBYEzhUCII10YAYR8JxsbgXKBFYNpgQWBXAICAReBDSGGXQSCInoSg?=
 =?us-ascii?q?VoekzhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBHYEgghkjG?=
 =?us-ascii?q?TZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVFEkcmIggSCQETGjALg?=
 =?us-ascii?q?SE4QQkoPxgNSBEsNxUZBD5uB5A/HoJlWjQBK4INkzZZkgaBNZ9aCiiDdowik?=
 =?us-ascii?q?jCDChozqm8LmH2OCpZQhGmBaDyBWXAVgyIJShkPjjmDa4UTxyYnMgsyAQEHA?=
 =?us-ascii?q?gcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:5bBUda4Zk8vowiNQW+VErwxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mZOWDvQPq3bZTP8eNkkPIS0/EJVuZSGm4BkQQQ6rSw3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqajNOu/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eH9I9yslIClt07
 aYgDi4wcxS4uv+Y3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYCKKofWGJ4O9qqej
 mfi/kbeDTAZDeOO7WKk20KxwezwjRquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjdCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:LRiVtayMsqsLVtSIBr8OKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:gN5tUWMSmbV0wu5DenZCxGErEfofaifl6mntPkuDNHtHV+jA
X-Talos-MUID: 9a23:M7esFgncFp+3udMxDWEhdnpnEMZKxKuPC3kygLFemuC0KGtzBCek2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="527834533"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 03:57:46 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 5A1F118000239;
	Tue, 29 Sep 2026 03:57:46 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 04762CC1611; Mon, 28 Sep 2026 20:57:46 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 1/3] openssh: fix CVE-2026-73283
Date: Mon, 28 Sep 2026 20:57:43 -0700
Message-Id: <20260929035745.321529-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 03:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246803

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix that makes the authorized_keys
restrict keyword apply to tunnel forwarding. The upstream fix commit
is referenced in [1], and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b
[2] https://www.cve.org/CVERecord?id=CVE-2026-73283

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-73283.patch      | 42 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
new file mode 100644
index 00000000000..d2660149e31
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
@@ -0,0 +1,42 @@
+From d322f2ccf7da095ce94d1d99cb563246f61487b Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 14 Jul 2026 01:05:05 +0000
+Subject: [PATCH] upstream: make authorized_keys "restrict" keyword apply
+ correctly
+
+to tunnel forwarding (which is administratively disabled by default).
+
+Reported by Erichen, Institute of Computing Technology,
+Chinese Academy of Sciences
+
+OpenBSD-Commit-ID: 5b3cc987a64749c94b20e12755db32a83f8f01e6
+
+CVE: CVE-2026-73283
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk and retained the Wrynose
+  OpenSSH 10.3p1 revision.
+
+(cherry picked from commit d322f2ccf7da095ce94d1d99cb563246f61487b)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ serverloop.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index 8e63480ec..9d8a3429 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -523,7 +523,8 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding ||
++	    auth_opts->restricted) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index e6bc9e9a5b6..3085f71bc6e 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-60001.patch \
            file://CVE-2026-60002.patch \
            file://CVE-2026-60000.patch \
+           file://CVE-2026-73283.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


