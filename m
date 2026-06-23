Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBE7CDB47F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:31:03 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18586.1782214253718627716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ASBQw0rV;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3850; q=dns/txt;
  s=iport01; t=1782214253; x=1783423853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rSpAMm1+mv+gzwILomEn5CUYfiFlJeYLK1z5FvYuP9I=;
  b=ASBQw0rVcD2tk5OHS/rqQKA7ezivylj+MewFBWXTIvizbPzMPlm6kC6p
   PEFLQS6Hu10J0I6NdF2ylBldGbwv/XT8BFdCH2E/N7jtYuwfSSexaCA1c
   YQppS00VaGaliB5QS+SzLV6fDR3uG2+eYNU8lmdSf/ofbifXTJGsDShT0
   fVo61Vo+IHOBkyjnBr5bG9xzPjXg6LihJXDSsLWdj2pBrBZGpSHvFXIPH
   E1YRJo0nhHc++XNGJrk9SyRtUN8mWa+DHVLgzJeGZCBjYf7LCq3hJJfsW
   /2CwrCrGBw1BbmfNV3byD/DbDB8SldbbSntbIlkJzuHNVrxchicYcMWoq
   Q==;
X-CSE-ConnectionGUID: J9+7M83dQ8+NjbMzFyd4GQ==
X-CSE-MsgGUID: 2UrEOnCeQbGyi3A2JZbqOg==
X-IPAS-Result: =?us-ascii?q?A0BHAgCDbTpq/5T/Ja1aHgEBCxIMggULgld0X0JJA5ZIA?=
 =?us-ascii?q?54bgX4PAQEBD0QNBAEBhQYCjUoCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMnCwE0EhAcAwECLysjCBmDAgGCcwIBEbNtG?=
 =?us-ascii?q?jeBeTOBAYNoAkNQ2ywBCxQBBYEzhT+IH1sYAYR8JxsbgXKBFYNpgQWBXAKIJ?=
 =?us-ascii?q?QSCIoEMgVoYBo8JSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFg?=
 =?us-ascii?q?R2BboEEhQIjHwM5f4E/gSRkZhUwNYEBAREfCoErAwsYDUgRLDcUGwQ+bgeMW?=
 =?us-ascii?q?hcPgjYHLU4EDwErIIIMkzgHkjehDwoog3WMIZU6GjOFW6URC5h9jgqWAFCEa?=
 =?us-ascii?q?IFoPIFZcBWDIglKGQ+OLQsLg2CEB4EMxH4kNQsDLwEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:vZn1m6P8iQfY9KfvrR30lsFynXyQoLVcMsEvi/4bfWQNrUpx1GNWy
 DFKWW6BbP2PNmanc9FwPd6zoEMH7MWGx9NqTXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV/lV
 e/a+ZWFZgf7gWUsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69c/Tx4TbdYUw7Y0J2NE0
 O42OTxRQSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPHwsYDUXUrsTIJsym+Gnj2PyWzZZs1mS46Ew5gA/ySQtgei9aIGLJoDiqcN9xHuCi
 0XA1GnACD4LNYe2kxi3+GuLibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:fg/dVqqdarICrgozVTChejMaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:lPTgeGN7T5PMHe5Dengkq2tEQcwcIj77zn31MWGpBTpGcejA
X-Talos-MUID: 9a23:mrl7twlraPkUGywVeVXodno4Cd1FxKKFBXkHvoQH4ODeFx56IhCS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,220,1774310400"; 
   d="scan'208";a="498803644"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jun 2026 11:30:52 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 7D941180002CA;
	Tue, 23 Jun 2026 11:30:52 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 26894CC12A9; Tue, 23 Jun 2026 04:30:52 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 4/8] cups: Fix CVE-2026-34979
Date: Tue, 23 Jun 2026 04:30:28 -0700
Message-ID: <20260623113037.28968-4-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260623113037.28968-1-adongare@cisco.com>
References: <20260623113037.28968-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239352

From: Anil Dongare <adongare@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/0ff8897367c7341f2500770c3977038cdd7c0214
[2] https://security-tracker.debian.org/tracker/CVE-2026-34979

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-34979.patch            | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34979.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index dc5b971195..7dedb2daef 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -27,6 +27,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34980.patch \
            file://CVE-2026-34980-regression_p1.patch \
            file://CVE-2026-34980-regression_p2.patch \
+           file://CVE-2026-34979.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34979.patch b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
new file mode 100644
index 0000000000..4adb6415b1
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
@@ -0,0 +1,73 @@
+From 471b4dc802455c7c59f9fd594fec8b6f3acb0db5 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:50:06 -0400
+Subject: [PATCH] Expand allocation of options string.
+
+CVE: CVE-2026-34979
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/0ff8897367c7341f2500770c3977038cdd7c0214]
+
+Backport Changes:
+- Rebase CHANGES.md placement and scheduler/job.c IPP length context to the
+  CUPS 2.4.11 source carried by this recipe.
+
+(cherry picked from commit 0ff8897367c7341f2500770c3977038cdd7c0214)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md      |  2 ++
+ scheduler/job.c | 16 ++++------------
+ 2 files changed, 6 insertions(+), 12 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 9863c17..f203e9a 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -11,6 +11,8 @@ Changes in CUPS v2.4.10 (2024-06-18)
+   directory.
+ - CVE-2026-34980: The scheduler did not filter control characters from option
+   values.
++- CVE-2026-34979: The scheduler did not always allocate enough memory for a
++  job's options string.
+ - Fixed error handling when reading a mixed `1setOf` attribute.
+ - Fixed scheduler start if there is only domain socket to listen on (Issue #985)
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
2.44.4


