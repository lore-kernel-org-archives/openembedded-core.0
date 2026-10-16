Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B64CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:44 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14168.1792122761166508507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=W6nmGNvR;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1568; q=dns/txt;
  s=iport01; t=1792122761; x=1793332361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s/n7MbEMvx15yfnL2ms416WNVbeFO/gnm3FE7MQ2LRE=;
  b=W6nmGNvRJjgAyKGKe75hxQHyxQjC6mCuWhi2nmIvzu8nvBjx7H+ggIGQ
   gowDFisOzXzJHBunFwT20jijY6UUZpd0vxwXaCkzmbnpj3zuzAo/2bUzx
   EWfVCFSz/oPQpK497ud/+t9GMAiHBKlVmFoZPhW+69zyobFBkfoUVx/Bh
   t4oCn5XTgv1gtIqTmNFRd25R1x83oDagfmRzvCFZSOkwQT9h6Z5oG4491
   idD6USoyH8Z5Y1hqHcXQdTCG9dqo3oS38v5VLZODYMJ/kM63joZX3iDDD
   O0lCy2EXKzS+3OLEPDjXq1N4SeA6nvTVNqrfjJYkKKQAtRa2QXPFYlpEC
   g==;
X-CSE-ConnectionGUID: e63MKMgyR1mDbpluKtNf0Q==
X-CSE-MsgGUID: cS8vreOuSTKzYT+gAcw/uQ==
X-IPAS-Result: =?us-ascii?q?A0CUAwAtn9Fq/4v/Ja1ahTB1YENJA5ZHA6AaDwEBAQ89F?=
 =?us-ascii?q?AQBAYUFAo4VAiY4EwECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NkBMCAQMyARgBLRAgMSsrGYMCAYJ0AxG8coIsgQGDKQE/AkNQ2zIBCxQBB?=
 =?us-ascii?q?YEzhUCII3UBhHwnGxuBcoR+gQWEC4V4BIIiehKBeJUpSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHA?=
 =?us-ascii?q?oJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINC?=
 =?us-ascii?q?QcpGA1IESw3FRkEPm4HkhQegmVaNCwEHIFlJwUMpWShDwoog3aMIpU6GjOqb?=
 =?us-ascii?q?wuYfY4Klk+EaYF/JYFZcBWDIglKGQ+OOYNrzlonMg4vAQEHAgcOAwuBaJF+A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:EqT6nKjWcZ4j7hvHKdYqv93IX161NhEKZh0ujC45NGQN5FlHY01je
 htvXz+GOPiLY2P2edx+Oduwp0sCsMLcnd83GgQ6/3hhRX5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUVpL1SIkRB5
 MZBLRwHdhSepP6QzuqCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIYLTFJUPwB7wS
 mTu9F+pHAsXE8Gk9RmXw07vicbEgmTmYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Fxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:5oSZR69XN78NWKSjMbxuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3A22v8eWksaeIBe/jOZpJLAPVZ/VTXOXCDl1LzBkC?=
 =?us-ascii?q?pMz9sZLeNTUKz5IVqy/M7zg=3D=3D?=
X-Talos-MUID: 9a23:0xRazQXS1fheTdzq/DTX1C94OeB12JiNGnEx0povsNbDKBUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536198260"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id A67BB180000F5;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 08CBFCBEF98; Thu, 15 Oct 2026 20:52:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 07/10] openssh: Ignore CVE-2026-106589
Date: Thu, 15 Oct 2026 20:52:33 -0700
Message-Id: <20261016035236.442896-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247921

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- This issue concerns platforms lacking file descriptor passing and
  unprivileged PTY allocation, notably QNX 6 and SCO OpenServer 5.
- Wrynose builds OpenSSH for Linux, where the affected platform-specific
  configuration is not selected.

Reference:
https://ubuntu.com/security/CVE-2026-106589

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 6799e10b99..cd8b7169a8 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -57,6 +57,7 @@ CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Ex
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 CVE_STATUS[CVE-2026-106588] = "not-applicable-platform: Requires the macOS 27 or later SDK and Darwin sandbox; Wrynose builds OpenSSH for Linux."
+CVE_STATUS[CVE-2026-106589] = "not-applicable-platform: Requires platforms without file descriptor passing and unprivileged PTY allocation, such as QNX 6 or SCO OpenServer 5; Wrynose targets Linux."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.35.6


