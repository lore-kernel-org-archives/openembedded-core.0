Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B97C44530
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:01 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4966.1784573873450746313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YmHfRJaX;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2874; q=dns/txt;
  s=iport01; t=1784573873; x=1785783473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gFMswEvsWiKtFx8bzYmeEAGh/oNW2wVMXfehTDUl9G4=;
  b=YmHfRJaXAYovq/MlmL3bWTXDp65OwsbML4+iPzZvWZPh/HjiCBufqF7j
   DYWw72kY/JNvP/wWcVxN0P+dFEMxIkE8HzQuzCL7Y2lOpVJcijJxfzfl6
   p3PCLYSvtzWY9d88ENRvIz/s2/LNa1I402py3V/CT4rw8JplifxT1dlmd
   CUPdvS8mfLSvGQaWdnA4JavykP0ke8YhdhvoYwajIVDK0uTd0r4KT6aUs
   ZMcZAwnW2gQcllQhzOAQQjuj3RsuFJFcVvhpQyOlbnKckT58pVyxSrOkV
   sMJbVXTfleXcurAJe3G1nm+ZxCbXs6zkqek8Z4dkb9GLldfeEDNlFNFNt
   g==;
X-CSE-ConnectionGUID: UbsiLL60RPGtYplDZprpZg==
X-CSE-MsgGUID: C2i9xm8JSqeR66+GC6zYCA==
X-IPAS-Result: =?us-ascii?q?A0BHAgAQb15q/5D/Ja1aglmCV3ReQ0mWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GAo1VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDMgEYAS0QHAMBAi8rIwgZgwIBgnQDEbs0GjeCLIEBgygBP?=
 =?us-ascii?q?wJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FyhAh2gQWBXAEBA4IqhXgEgiJ6E?=
 =?us-ascii?q?oFaHo95SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BOoECh?=
 =?us-ascii?q?HQjHwM5f4EvdUp3LWkBEheBJoISAoE7AhMDCxgNSBEsNxQZBD5uB41BI4JAg?=
 =?us-ascii?q?Q4BKgGoIqEPCiiDdYwhlToaM6psC5h9jgqWUIRpgWg8gUcLB3AVgyIJShkPj?=
 =?us-ascii?q?jiDa4F/gxTJRycyCzIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:WL1Q0qk0eINhavTolUUGM0vo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJND26Ab/zZM2KgftwlOty//U8HvpeAytJlSwprqHxgFVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfrb9nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbAS4edTJT8Wz
 8Q3NAEVajyxn/iu8r3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMicBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZj/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKII4bUG5wLxB7wS
 mTu1D74UwEfZP6k0De/rCzvqcSRjxLQcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:qMwP36yQcq1TpvaMW/LcKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICOsqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:7Ep/924ozcsjmokFOdssyUQPG+QBLCXn9FjMEle8JVRxUqWnRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A1zL2bA+3SdDlv6/CVyjCPb2Qf+wy4vW+DRAvqow?=
 =?us-ascii?q?LgZfadgNbZSWspx3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512661620"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:57:52 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 8694818000210;
	Mon, 20 Jul 2026 18:57:52 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 308D0CC124A; Mon, 20 Jul 2026 11:57:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH 4/8] openssh: Fix CVE-2026-59996
Date: Mon, 20 Jul 2026 11:57:45 -0700
Message-ID: <20260720185749.4098075-5-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260720185749.4098075-1-devanshp@cisco.com>
References: <20260720185749.4098075-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241483

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-59996. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59996

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../openssh/openssh/CVE-2026-59996.patch      | 37 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
new file mode 100644
index 0000000000..b13390b25b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
@@ -0,0 +1,37 @@
+From 762b3d438547893d62ce3e147dce6cef14697b09 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 28 Jun 2026 23:47:16 +0000
+Subject: [PATCH] upstream: resist that return ".." via remote glob during
+
+remote/remote copies, similar to fixes for bz3871 for remote/local copies.
+From Swival scanner
+
+CVE: CVE-2026-59996
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78]
+
+Backport Changes:
+- Retained the Scarthgap scp.c OpenBSD revision identifier because the
+  10.4 identifier does not describe the older source baseline.
+
+OpenBSD-Commit-ID: c0c20a1b746db55c08e53658bf21ea9405b300a5
+(cherry picked from commit 36480181fa22f98e180b4f9e10203480c0346c78)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ scp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/scp.c b/scp.c
+index 2c21fa19a..00d87517d 100644
+--- a/scp.c
++++ b/scp.c
+@@ -2043,6 +2043,10 @@ throughlocal_sftp(struct sftp_conn *from, struct sftp_conn *to,
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 256d90e7bd..c2e172c8d6 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-59999.patch \
            file://CVE-2026-59997.patch \
            file://CVE-2026-59998.patch \
+           file://CVE-2026-59996.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.44.4


