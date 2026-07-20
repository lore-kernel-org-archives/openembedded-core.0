Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419B4C4452E
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:57:09 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3656.1784570226468789114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Hla+mVvP;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2937; q=dns/txt;
  s=iport01; t=1784570226; x=1785779826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RjOn3myVC5qRzi8bqHDrE/tPbcPvcuayk/iZe6Cwcpo=;
  b=Hla+mVvPKwZ40Fa2qShdHT6qhoA6pLnR8SOAFPPR6m2hvIBWFZnoV6Sc
   x8gXrHuySHzys/ysKUIjCCS5IBPN47iERXgCPtJmglVUt9G1ZoUjVQvE4
   CvwivfkV6iVZ7j35elVPalAOc49cG72NjeiF+acgA0WdnuJOCWBobuu7r
   y8/k/FeI7279WGYBZGPVlCPHCTpj5JpLacHImmA08oQRUSzWJqAsorEhe
   GBaonk4GQSZF9W1rtaDxhi0IxL6dvAHx+U+4WNu9vt6CsXBziGEGqp7Va
   4hXbRV9KalMPG7n2O2STJNaEwgFAH8ut2RR9nS9Ry0QenNymOboXwEmtS
   w==;
X-CSE-ConnectionGUID: tZY2UjupQ5yVOoMvlbj49Q==
X-CSE-MsgGUID: AkFY2A0kTUqTW7pjZdgOcA==
X-IPAS-Result: =?us-ascii?q?A0BHAgCzYF5q/43/Ja1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDMgEYARsSEBwDAQIvKyMIGYMCAYJ0AgERuysaN4IsgQGDK?=
 =?us-ascii?q?AE/AkNQ2y4BCxQBBYEzhT+IIFwYAYR8JxsbgXKECHaBBYFcAgIBF4IThXgEg?=
 =?us-ascii?q?iJ6EoFaHo90SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BO?=
 =?us-ascii?q?oEChHQjHwM5f4EvdUp3LWkBEheBJoISAoE7Ag4DCxgNSBEsNxQZBD5uB41AI?=
 =?us-ascii?q?4I/AYEOASuCLKV2oQ8KKIN1jCGVOhozqmwLmH2OCpZQhGmBaDyBWXAVgyIJS?=
 =?us-ascii?q?hkPjjiDa4UTyUckNQsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:QYSzEappKoWevp+olEUR4oNSBT1eBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmCM/6LZ2H1ft9yaI2/pkpQsZLWmtJqTlRupHgzRSgSpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8ks34pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vpFMDtz9
 +EAEW0cUDeEovyyyrDnG9A506zPLOGzVG8ekmtrwTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUfrSn8/w7pX7WzFVtluTvqovy2PS1wd2lrPqNbI5f/TXHJ8NwRvE+
 zquE2LRKxI0BYa2kTm5z2uQubDXnxH3V6UZPejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:2ebQ66xeRfYuZ3UTkpIvKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3Ah0odH2nuWvJBPzgR3GyTt9Bt9UDXOWHv/S3tIVK?=
 =?us-ascii?q?gMDt4dpqSbEGU8qE4wvM7zg=3D=3D?=
X-Talos-MUID: 9a23:rhjs0QpQjEz8LbzBbM8ezxhhGvYyyvytNH0UrapZo8u2OSNXMB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512075450"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:57:05 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 674A718000181;
	Mon, 20 Jul 2026 17:57:05 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 058F3CEC315; Mon, 20 Jul 2026 10:57:05 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][wrynose][PATCH 4/8] openssh: Fix CVE-2026-59996
Date: Mon, 20 Jul 2026 10:55:14 -0700
Message-Id: <20260720175518.3546447-4-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175518.3546447-1-devanshp@cisco.com>
References: <20260720175518.3546447-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241469

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-59996. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78
[2] https://www.cve.org/CVERecord?id=CVE-2026-59996

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59996.patch      | 39 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
new file mode 100644
index 0000000000..9db9988690
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
@@ -0,0 +1,39 @@
+From f479595f7498e8c83d3df9d3eddb6e555497ff5b Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 28 Jun 2026 23:47:16 +0000
+Subject: [PATCH] upstream: resist that return ".." via remote glob during
+
+remote/remote copies, similar to fixes for bz3871 for remote/local copies.
+From Swival scanner
+
+OpenBSD-Commit-ID: c0c20a1b746db55c08e53658bf21ea9405b300a5
+
+CVE: CVE-2026-59996
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk in scp.c and retained
+  the Wrynose OpenSSH 10.3p1 revision because this stable backport carries
+  only the functional security change.
+
+(cherry picked from commit 36480181fa22f98e180b4f9e10203480c0346c78)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ scp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/scp.c b/scp.c
+index 1faa9a555..bd01ebffd 100644
+--- a/scp.c
++++ b/scp.c
+@@ -2039,6 +2039,10 @@ throughlocal_sftp(struct sftp_conn *from, struct sftp_conn *to,
+ 			goto out;
+ 		}
+ 
++		/* Special handling for source of '..' */
++		if (strcmp(filename, "..") == 0)
++			filename = "."; /* Download to dest, not dest/.. */
++
+ 		if (targetisdir)
+ 			abs_dst = sftp_path_append(target, filename);
+ 		else
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index b9f2a37c57..807e718ffb 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-59999.patch \
            file://CVE-2026-59997.patch \
            file://CVE-2026-59998.patch \
+           file://CVE-2026-59996.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


