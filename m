Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E5DC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 05:31:59 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2599.1783575110227325297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WGgjtaMA;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1640; q=dns/txt;
  s=iport01; t=1783575110; x=1784784710;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O5Z1+EZU1XeVzWBK8KoCCX/7DB3LjwongV0Qg53Bq/g=;
  b=WGgjtaMA6J1iulcaFBc3IqUW8wW/cp04osm6tnIo7AL55IYYm7OiIL6k
   YPwyDy8quNTKvFlx9XrpKS3u4I+YlrAVxGF86nAlkekBgv2WEhgYf0Dml
   RXNFegruWLFi7uhZiCZ3VxwzANI2mV0MNiZpi8Ud3F5TR1X42jQ09UVdZ
   D6MHa850akih4CXau4eUo99oOQ1onGFGg74LxeTxlZVpOq6oYD6VoRpRy
   UgEFG3OnCOmJDJtVharwzlJEmfio1bghHGkR7qj/Bj+Jj7YH6f+6RZG5A
   XQPSoTlLIOyoKxnML4qjs8rLbcrj1gKAB1ZNdriK2sNbMSvYN0rybUyJc
   Q==;
X-CSE-ConnectionGUID: 7fTdWCA4SJ6cc5vhXU44FQ==
X-CSE-MsgGUID: C/66oN2nSDuNNF/ZOpDy9Q==
X-IPAS-Result: =?us-ascii?q?A0BCAgCiMU9q/5X/Ja1aglmCV3RfQkkDlCagP4F+DwEBA?=
 =?us-ascii?q?Q8uDxQEAQGSVAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZdBTEBGAFdWAREgwIBgnMCARG3XoIsgQGDKAExBQkCQ1DbLgELFAGBO?=
 =?us-ascii?q?IU/iB9zAYR8JxsbgXKBFYNpgQWBXAEBAhiBLmWFeASCInoShAqNVkiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgV+BAoR5Ix8DOX+BL3VKe?=
 =?us-ascii?q?S2BARIeCoFSghY6AwsYDUgRLDcUGwQ+bgeNPBcPgj6BDiyCLKV2oQ8KKIN1j?=
 =?us-ascii?q?CGNPod8GjOqbJkIjgoWljqEaYFoPIFHCwdwFYMiCUoZD444g2uBf4MUyUckN?=
 =?us-ascii?q?QIMLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:9/P3cKwviA1jKY9nmrd6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUDy
 GYcXWrQOqmDN2b1f94nYYuwp0MG6MOGn9c2HQE9q1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYrajJMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJB44AYEn0c8rOkMQ/
 vdFNjA9U0zfqdvjldpXSsE07igiBNPgMIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cMnWjOX9PYH46tPy1imT6eT1RgFmUvqEwpWPUyWSd1ZCxYYqIJo3TFZo9ckCwj
 SWYoWPfWBchGMG57xTCwFW0qv6epHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:WGl3c6GaXmV2if1TpLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhDo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: 9a23:8Jb9r2yuyxE8KLILuJLgBgVLFPwpTVb0kEzyfUSzVHhpeIDJFXGprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AG2hTvw0BAkkGkgK/7nkwRNlX+zUjyOPwVkcry5M?=
 =?us-ascii?q?9l9SiEwI3CRCFoCXme9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="498549187"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:31:49 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 46CFE180001EE
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2026 05:31:49 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id AA90CCB6A93; Wed,  8 Jul 2026 22:31:48 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] openssh: set status for CVE-2026-3497
Date: Wed,  8 Jul 2026 22:30:45 -0700
Message-ID: <20260709053044.2081827-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 05:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240521

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
2.53.0


