Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55996C44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 05:28:19 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2559.1783574894477542523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Czeua6cG;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1640; q=dns/txt;
  s=iport01; t=1783574894; x=1784784494;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GYkPNrqZS7LQUAek9PiB1C+Ab1MFZL4rNCwqf7GT5W8=;
  b=Czeua6cGiYrT7LROIQ0eQ7fTxGsTAEXLamX0VswDuKc6GSWJDTf/LtMV
   5ETCJ+Z5b3EmHSz2fVNU9DWRvI/im1dMLyg4+0pPP/UxCOQ7qe/OUTT2y
   Ux6TmR7tS2OqvRteVw1yLAYmpsqjS6e3LVa/AG4Bi2o43igSqJDzzhiPw
   ETt64qT84V9f/P+rB0OwstM1RmnKFhdvHtyDs2QIlKG5PbUKtAadI3e4H
   hIO0vi4rRG+bSjS6F+kl//GyV1pPqPpgjIqc5NzzPohL7qRC4rCv7qBic
   cLjrAPlm1WNCl1NU8SzgV7H6XssWTQkmzBfMk4Nq/sycA+gH7k+M7dXxL
   A==;
X-CSE-ConnectionGUID: Z9p8xGheSfO5n2jSwwLYNg==
X-CSE-MsgGUID: NLS5a9CFR4S3MnHsrQeVXg==
X-IPAS-Result: =?us-ascii?q?A0BCAgCkME9q/4//Ja1aglmCV3RfQkkDlCagP4F+DwEBA?=
 =?us-ascii?q?Q8uDxQEAQGSVAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZdBTEBGAFdWAREgwIBgnMCARG3XIIsgQGDKAExBQkCQ1DbLgELFAGBO?=
 =?us-ascii?q?IU/iB9zAYR8JxsbgXKBFYNpgQWBXAEBAhiBLmWFeASCInoShAqNVkiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgV+BAoR5Ix8DOX+BL3VKe?=
 =?us-ascii?q?S2BARIeCoFSghY6AwsYDUgRLDcUGwQ+bgeNPBcPgj6BDiyCLKV2oQ8KKIN1j?=
 =?us-ascii?q?CGNPod8GjOqbJkIjgoWljqEaYFoPIFHCwdwFYMiCUoZD444g2uBf4MUyUckN?=
 =?us-ascii?q?QIMLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:5X0/dq7XwXtJd3VNaGb8DQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mNNDzqCa66Ia2SnLtkga47jpk1T65fVnNRkHAY9/yA1Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1Mu/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eD9wAqvZYAWx1+
 9tFLmoPVQ+co9OQz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc6FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEUUrsUIMpWcOOAnWTzbjhSqFu9rqss6G+Vxwt0uFToGIeNJYfaGp4Fzy50o
 Erg21+kC0AxGubD8mGg9FK3nNbCoxP0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBaCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:gZyfO6vIo/otllyU31HUNrtn7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBEDjexLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:ZuMkSWFWnQ2GoVNGqmJVpVZECu8lf0bT6yrWeU2DFnlNeZuaHAo=
X-Talos-MUID: 9a23:j+5CowgJUIm854bDKBwFRsMpEuNTvq3/I243za5dns+kLjZJNgmtg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507387389"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:28:13 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 998E31800025B
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2026 05:28:13 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 2923BCB6A93; Wed,  8 Jul 2026 22:28:13 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] openssh: set status for CVE-2026-3497
Date: Wed,  8 Jul 2026 22:27:31 -0700
Message-ID: <20260709052730.1736113-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 05:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240520

From: Sudhir Dumbhare <sudumbha@cisco.com>

Analysis:
 - CVE-2026-3497 affects downstream OpenSSH GSSAPI Key Exchange patches.
 - The vulnerable code uses sshpkt_disconnect() in the GSSAPI KEX server path.
 - Upstream OpenSSH/OE-Core does not carry the vulnerable GSSAPI key-exchange delta.
 - Hence ignoring the CVE for this version.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3497
https://github.com/advisories/ghsa-wcpp-3x59-h8vp
https://ubuntu.com/security/CVE-2026-3497
https://security-tracker.debian.org/tracker/CVE-2026-3497
https://www.openwall.com/lists/oss-security/2026/03/12/3

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a050475532..8669d080b6 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -36,6 +36,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
+CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.51.0


