Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770AEC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 04:59:08 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5041.1785214743091199581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 21:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Q/HJiQtj;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2047; q=dns/txt;
  s=iport01; t=1785214743; x=1786424343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SYv+CEjeKZxVGGtPb82t3wzjxD8HGA+bsVKnAoZpLKU=;
  b=Q/HJiQtjz9k3UKkGq402ICtiEfU5mIXa7Lm5i69iUVP7mFAaZIul5xS7
   qib52RBKiPnQAffoPfinMlgvlwmW3u2Q8wMeTAgDe2lSt/2DHvKqmTQyA
   i9rpHzOvcjggNsEOr/EKvmRB7XRNBzqBsGB5sB+GE0J9tC0k2p1ESIrsL
   WFQvatDBpz/2dK9+Pp4rOKGsa9DXR9PXmjh+ZMI/ZWTXS+2g4BHbeoPNO
   zSjXe7pYLWFjloVsABGsEop+ZYTtUuFJZ/FPVkRBYeaWaA2Sk8udWtURC
   wer+faonibRz3wF1zHI/2lv5K6xtNWb1oZzGfc+VMVpEdGqXLw7Qku8p1
   Q==;
X-CSE-ConnectionGUID: 5RcXpJ2RRq+W4FrEIflD6A==
X-CSE-MsgGUID: 4Zeo+MV7S/KNCzD40dpp8Q==
X-IPAS-Result: =?us-ascii?q?A0BFAgAZH2hq/4oQJK1aHgEBCxIMggULgld0XkNJlkoDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGFBQKNYwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDMgEYAS0QIDErHQENGYMCAYJ0AxHAQYIsgQGDK?=
 =?us-ascii?q?AE/AkNQ2y4BCxQBBYEzhT+IIHQBhHwnGxuBcoEVg2mBBYFcAQECGIIThXgEg?=
 =?us-ascii?q?iJ6EoF4kEpIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYEsY?=
 =?us-ascii?q?YRYIxk5f4ExdUp3LWkBEheBGoM8AoIVAwsYDUgRLDcUGQQ+bgeNdSKCPVoKK?=
 =?us-ascii?q?ixNgXClZaEPCiiDdYwhlToaM6psC5h9jgqWUIRpgWg8gUcLB3AVgyIJShkPj?=
 =?us-ascii?q?jiDa4F/gxTIMicyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:kSgHvq5LGkuC2JmZGwzNNwxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mcYUDyGM/6LZjTwKd10PYW09k8CusPTzYMySgVrpH8wZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OtPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eYLcTyv5VW1t07
 L8ndB4XQzGNg87o6efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZOE0n1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3Fb4uNJYPSG5gI9qqej
 j708mO6Jy9FD5u87xGX3i70ivfXzRquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:Qe047KGHa2cWAjuBpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:8eySZmPny7ddnO5DBRNsxFY2QPofaz7ikFnKDm62DUo3YejA
X-Talos-MUID: 9a23:VDGBKQVLCWBJM9Dq/GPeiTYhEfk32OONLmsfvclet9GcZRUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,189,1779148800"; 
   d="scan'208";a="790770655"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 04:59:02 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id E1738180001B3;
	Tue, 28 Jul 2026 04:59:01 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 76F72CC12A6; Mon, 27 Jul 2026 21:59:01 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2] openssh: set status for CVE-2026-59998
Date: Mon, 27 Jul 2026 21:59:01 -0700
Message-Id: <20260728045901.4183013-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720185749.4098075-4-devanshp@cisco.com>
References: <20260720185749.4098075-4-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 04:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242157

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- CVE-2026-59998 concerns an undocumented limitation of
  GSSAPIStrictAcceptorCheck in Windows Active Directory
  environments [1].
- Upstream OpenSSH 10.4 only documents the existing behavior and
  provides no code remediation [2].
- The recipe disables Kerberos/GSSAPI by default. Mark the CVE
  not-applicable-config when PACKAGECONFIG lacks kerberos, and
  unpatched when kerberos is enabled.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59998
[2] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
Changes in v2:
- Drop the documentation-only backport for CVE-2026-59998.
- Add a configuration-aware CVE_STATUS that reports unpatched when Kerberos
  support is enabled and not-applicable-config otherwise.

 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index ba8aaad9bb..b48e262c72 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -57,6 +57,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
+CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.35.6


