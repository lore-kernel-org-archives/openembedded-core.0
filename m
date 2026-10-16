Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BDDCC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:44 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14416.1792122758296922573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eGYodol8;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2836; q=dns/txt;
  s=iport01; t=1792122758; x=1793332358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r5VTbcg2PTJlUoZR4O0wcBqP8CmFkHexHZLBv6H9oUU=;
  b=eGYodol8bjYX2cfAVjHmyB8BXEPg8hlwdRjiabPkxe49eAb7OrUAzVES
   jQDec+mFBAg4okdX3Qmnj2E17wkoHDBSo+qLrVTfuBR/ZxAKd4yzR+Et5
   hvBpnGmRHSH2MIWHbvRZFjS0Bo1FHmD8dlat+2wJHBD2ZZewwq+y9QZa1
   Mvaj2dtORV5n3/9KpwR3wQljKojH1BnGZcBYdD9s0TkmZdn8MgbN96i2t
   MUhTNSWx5dfIFxs9u5Evok/LeT0GuMvqgVTkzNI48nw9WpQbBWhgJM3p7
   ARWFBXog4KyYEmMJiZMXJbV96M1PxEZ/1LDIDz1Cvjbm/hVahZbg0gnFr
   w==;
X-CSE-ConnectionGUID: G5Jucg81RFukpopNTnc20w==
X-CSE-MsgGUID: iJzAGrNhQ2+wgtRTKXRNJg==
X-IPAS-Result: =?us-ascii?q?A0BIAgAbntFq/4r/Ja1aglmCV3VgQ0kDlkqeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMyARgBLRAcAwECLysjCBmDAgGCdAMRvG+CLIEBgykBP?=
 =?us-ascii?q?wJDUNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FyhH6BBYFcAgOCKoV4BIIiehKBW?=
 =?us-ascii?q?h6VKUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZN?=
 =?us-ascii?q?nqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBG?=
 =?us-ascii?q?zg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJlexMBK4IspXWhD?=
 =?us-ascii?q?woog3aMIpU6GjOqbwuYfY4Klk+EaYFoPIFZcBWDIglKGQ+OOYNrhRPJRycyC?=
 =?us-ascii?q?wMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:3G1jF6jER0l/tSj4pE8/nQMuX161NhEKZh0ujC45NGQN5FlHY01je
 htvDTqEOPbbNDbwct9/aN7ipExUucDTyNBkHgA6+yg3RitjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU3p8RqCm4er
 MY2NTMVaQilu+S9muqkH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQd/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIYHQFZQNxRjwS
 mTu/kbrKz4AEtymk3ma/W6Wusz/pwXZV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:veCj76voIMw+F7F6//v54kQf7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:LgwDuG4vyeyXS2tttdss2xM2B8sqIiTn4mrTO0igL1pvQ+fNVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AnqgmIA2VlLYFrw8H79XiJd2rhzUj4oa8IW8Xt5U?=
 =?us-ascii?q?/4YqbOjBKBxStthKVTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535289036"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 456DB18000314;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id E33F3CBF201; Thu, 15 Oct 2026 20:52:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
Date: Thu, 15 Oct 2026 20:52:27 -0700
Message-Id: <20261016035236.442896-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247912

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a469911a229b9117e7134766311
[2] https://ubuntu.com/security/CVE-2026-106584

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106584.patch     | 39 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
new file mode 100644
index 0000000000..31b35aad9a
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
@@ -0,0 +1,39 @@
+From aef20dfe30e68a469911a229b9117e7134766311 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 15 Sep 2026 08:31:46 +0000
+Subject: [PATCH] upstream: Correct handling of DST when converting dates
+
+Timestamps conversion was ignoring Daylight Savings Time (DST) causing
+date conversions to be +/-1 hour under some circumstances.
+
+bz4004; from Khush Patel, ok deraadt
+
+OpenBSD-Commit-ID: bd5eb2603c04d4b5072b0e593b137a98ef75b731
+
+CVE: CVE-2026-106584
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a469911a229b9117e7134766311]
+
+Backport Changes:
+- Omitted the upstream misc.c OpenBSD revision-only hunk. OpenSSH 10.3p1
+  also lacks earlier error-sentinel handling; that is not part of this
+  DST fix and is not imported here.
+
+(cherry picked from commit aef20dfe30e68a469911a229b9117e7134766311)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ misc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/misc.c b/misc.c
+--- a/misc.c
++++ b/misc.c
+@@ -2591,6 +2591,7 @@ parse_absolute_time(const char *s, uint64_t *tp)
+ 		if ((tt = timegm(&tm)) < 0)
+ 			return SSH_ERR_INVALID_FORMAT;
+ 	} else {
++		tm.tm_isdst = -1;	/* mktime decides DST */
+ 		if ((tt = mktime(&tm)) < 0)
+ 			return SSH_ERR_INVALID_FORMAT;
+ 	}
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 0b34e4563c..aceaa6420f 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
+           file://CVE-2026-106584.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


