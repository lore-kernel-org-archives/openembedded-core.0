Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACF4C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:42:47 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29044.1784655765073749438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jNEiwnPU;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3588; q=dns/txt;
  s=iport01; t=1784655765; x=1785865365;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1OvmNXfoge7dcFxLqoa8kim7Z7TtUmFXtWGY9Q+RYeU=;
  b=jNEiwnPU7ZXgyYIdhyFaxi6uJyCB+Sq941NNAhoIJlDNexR5WX2oP6ew
   Cdk60h8EeNCYKVC1gFM9ckTG03+bv2z8b60C6xVwiIeGeKMxJNLzT1EIS
   /LbkHmYUfvYsoH0kzDvbCiLg6RdtMdOQTgohLYXv9MEOvKCeIZLQbW+KI
   oJIjetUN4fTtd4Vlu3wEg2XwF9G/JRf9rMrO55WIf15ZZXvvEPV2p39ez
   EJPhH34JmFPIgjwzeYKPWqbzyKuWJK2Rhlzytz8CtBExp9ySxP2O/BYh6
   D2dA80iNlVdrPDxMDrzwR+ywxtCfVuSSMfut4jJmT8sKDjpZ0q2NXpp4t
   Q==;
X-CSE-ConnectionGUID: 7y0CsWR3TSGiLgBb47TS2w==
X-CSE-MsgGUID: 3OqQxumPTSCZa/DYGbIBIw==
X-IPAS-Result: =?us-ascii?q?A0BIAgD/rl9q/4v/Ja1aglmCV3RfQkkDlCaCIQOBE50Ig?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMnCwE0IhwDAQIvKyMIEQiDAgGCdAMRv34aN4F5M?=
 =?us-ascii?q?4EBg2gCQ1DbLgELFAGBOIU/iCBcGAGEfCcbG4FygRWCc3aBBYFcAoglBIIig?=
 =?us-ascii?q?QyBWhgGhG+CBokaSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFg?=
 =?us-ascii?q?R2BLoEChG4jHwM5f4EvdUp3LWoSF4EmghSBOgJVAwsYDUgRLDcUGQQ+bgeNV?=
 =?us-ascii?q?COCOQctEEIPASuCLJMlGpI0oRIKKIN1jCGVOhozhVulEQuYfY4KlgBQhGmBa?=
 =?us-ascii?q?DyBWXAVgyIJShkPjjiDa4QHgQzHJjw1CwMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:WVNdrK9LqJjwCL5I8Qj3DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GcfWjyEMvyOM2vxeI1+adm1oB5Q7cOGyYIwHlRrqytEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThNs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lpLNUz4dlNWl112
 v08JxoHMk+/vLiplefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYOOJIbRHpgJ9qqej
 jnh5l3pHxQiCOe0+zPC3kODjM7lvDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rd94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:bpUn7KpNBwtAoVpttmgOWOUaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AXFqMumtTQIoAGNw2Fa3XU5to6It6YyX210jqeHO?=
 =?us-ascii?q?DJmdNR5efFQCsw/l7xp8=3D?=
X-Talos-MUID: 9a23:+yviRwYVXZYTx+BT7Bj1vSF/Mf9U2I+cAQchoLoMmuOlKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,177,1779148800"; 
   d="scan'208";a="513623354"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:42:42 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 3310018000200
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:42 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 537D0CC037D; Tue, 21 Jul 2026 23:12:40 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 5/8] cups: fix CVE-2026-34979
Date: Tue, 21 Jul 2026 23:12:14 +0530
Message-Id: <20260721174217.229620-5-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721174217.229620-1-deeratho@cisco.com>
References: <20260721174217.229620-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241563

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/0ff8897367c7341f2500770c3977038cdd7c0214
[2] https://security-tracker.debian.org/tracker/CVE-2026-34979

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the patch on current Scarthgap CUPS recipe context.
- Refreshed the embedded source patch context; no CVE logic changes.

 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-34979.patch            | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34979.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 7a8b845953..a0ac1a2612 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -28,6 +28,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34980.patch \
            file://CVE-2026-34980-regression_p1.patch \
            file://CVE-2026-34980-regression_p2.patch \
+           file://CVE-2026-34979.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34979.patch b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
new file mode 100644
index 0000000000..38ac7b6e91
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
@@ -0,0 +1,61 @@
+From 471b4dc802455c7c59f9fd594fec8b6f3acb0db5 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:50:06 -0400
+Subject: [PATCH] Expand allocation of options string.
+
+CVE: CVE-2026-34979
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/0ff8897367c7341f2500770c3977038cdd7c0214]
+
+Backport Changes:
+- Rebase scheduler/job.c IPP length context to the CUPS 2.4.11 source
+  carried by this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 0ff8897367c7341f2500770c3977038cdd7c0214)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/job.c |   16 ++++------------
+ 1 file changed, 4 insertions(+), 12 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 915ba94..880c25f 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4195,18 +4195,6 @@ ipp_length(ipp_t *ipp)			/* I - IPP request */
+ 
+   for (attr = ipp->attrs; attr != NULL; attr = attr->next)
+   {
+-   /*
+-    * Skip attributes that won't be sent to filters...
+-    */
+-
+-    if (attr->value_tag == IPP_TAG_NOVALUE ||
+-	attr->value_tag == IPP_TAG_MIMETYPE ||
+-	attr->value_tag == IPP_TAG_NAMELANG ||
+-	attr->value_tag == IPP_TAG_TEXTLANG ||
+-	attr->value_tag == IPP_TAG_URI ||
+-	attr->value_tag == IPP_TAG_URISCHEME)
+-      continue;
+-
+    /*
+     * Add space for a leading space and commas between each value.
+     * For the first attribute, the leading space isn't used, so the
+@@ -4282,10 +4270,14 @@ ipp_length(ipp_t *ipp)			/* I - IPP request */
+ 
+       case IPP_TAG_TEXT :
+       case IPP_TAG_NAME :
++      case IPP_TAG_TEXTLANG :
++      case IPP_TAG_NAMELANG :
++      case IPP_TAG_MIMETYPE :
+       case IPP_TAG_KEYWORD :
+       case IPP_TAG_CHARSET :
+       case IPP_TAG_LANGUAGE :
+       case IPP_TAG_URI :
++      case IPP_TAG_URISCHEME :
+          /*
+ 	  * Strings can contain characters that need quoting.  We need
+ 	  * at least 2 * len + 2 characters to cover the quotes and
+-- 
+2.43.7
+
-- 
2.35.6


