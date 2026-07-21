Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50139C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:42:58 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29034.1784655770118670418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TRPhNRs9;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2781; q=dns/txt;
  s=iport01; t=1784655770; x=1785865370;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mwFg5EfugCKNkA183oA04Y2VflF7RVNm9yPLw/0bnIM=;
  b=TRPhNRs9gUmdQJ5I0nGmFMfscD43y+Uil87l0FKW23q5ZE/67qlULZrS
   0m0jx1pbC14+5d5SEGleOPlgMQAvtCtiAhdk35N5ahevtCzXBn6yj+nWf
   fWsxcNM15W1TXddc04jP63tKD45XdYlfZpRHFkxX4bxR+jGKutpTwk/nB
   ek5hxow8rQomiKZeW87Mc9Ij5uqdE0QYxX4AWPspfVW4taEZRyoBSf4fa
   BFooGG+giqlVkAIlf9GgGZKbaeXSW6G3ec88gP2YCOKN8hAa6gq88hUgP
   gxGuKdRoULCjdnasMNXUWNW1aS8xkm5XeTeb0ZRZGPklwFigdbzLloIbH
   w==;
X-CSE-ConnectionGUID: 3SICc0PoQYuvmg3w9EjOmA==
X-CSE-MsgGUID: OpJE5NmQRHaOrTFfK4QjKA==
X-IPAS-Result: =?us-ascii?q?A0BIAgCXrl9q/47/Ja1aglmCV3RfQkkDlCaCIQOBE50Ig?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMyATQiHAMBAi8rIwgRCIMCAYJ0AxHAEBo3giyBA?=
 =?us-ascii?q?YNoAkNQ2y4BCxQBgTiFP4ggXBgBhHwnGxuBcoEVgnN2gQWBXAKCLYV4BIIig?=
 =?us-ascii?q?QyBWhgGgXaCeYIGiRpIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbB?=
 =?us-ascii?q?wWBHYEugQKEbiMfAzl/gS91SnctahIXgSaCFIE6AlUDCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?41UI4JAPQ1EASuBfS+TJZJOoRIKKIN1jCGVOhozhASBV6URC5h9glmLMZZQh?=
 =?us-ascii?q?GmBaDyBWXAVO4JnCUoZD444g2uEB4EMxyY8NQsDLwEBBwIHDgMLgWiRHmABA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:bmGzYqgEYB31ESVHf0AAZvY5X161MREKZh0ujC45NGQN5FlHY01je
 htvUWiCbvneN2GgeIsiO42+8B8DvJbSm9VmHFBspCAzECpjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPja8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVDwcdcCjl28
 sUpNS4IYUuc1s+057eSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9J4XQG5sJwR7Cz
 o7A10PhIDxHEtmm8xqM1WiQqOHswRr5e6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:pKP2kaz6+zWIQkY3TIdRKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:2FUXwGAiEXpezev6E3Jc1WUfQvgiS0zA0nLfeFDpJGROTZTAHA==
X-Talos-MUID: 9a23:II6r4AWtUml0Fnfq/Bj0phw/EsJR2YSnL1oxv5sl5/CGFgUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,177,1779148800"; 
   d="scan'208";a="512664702"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:42:49 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 09B5318000201
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:49 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2D89ACC037D; Tue, 21 Jul 2026 23:12:47 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 8/8] cups: fix CVE-2026-39316
Date: Tue, 21 Jul 2026 23:12:17 +0530
Message-Id: <20260721174217.229620-8-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721174217.229620-1-deeratho@cisco.com>
References: <20260721174217.229620-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241566

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f
[2] https://security-tracker.debian.org/tracker/CVE-2026-39316

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the patch on current Scarthgap CUPS recipe context.
- Refreshed the embedded source patch context; no CVE logic changes.

 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39316.patch            | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39316.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 575dbf9c57..4c158aaee1 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -31,6 +31,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34990.patch \
            file://CVE-2026-39314.patch \
+           file://CVE-2026-39316.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39316.patch b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
new file mode 100644
index 0000000000..d3c9edf974
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
@@ -0,0 +1,40 @@
+From 7c4d7951d189e931563f21086196d5a55fb2fa15 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 11:33:23 -0400
+Subject: [PATCH] Expire per-printer subscriptions before deleting.
+
+CVE: CVE-2026-39316
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f]
+
+Backport Changes:
+- Rebase scheduler/printers.c delete-printer context to the CUPS 2.4.11
+  source carried by this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/printers.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/scheduler/printers.c b/scheduler/printers.c
+index bf493a3..ca983f9 100644
+--- a/scheduler/printers.c
++++ b/scheduler/printers.c
+@@ -641,6 +641,12 @@ cupsdDeletePrinter(
+                      update ? "Job stopped due to printer being deleted." :
+ 		              "Job stopped.");
+ 
++ /*
++  * Expire subscriptions on the printer...
++  */
++
++  cupsdExpireSubscriptions(p, /*job*/NULL);
++
+  /*
+   * Remove the printer from the list...
+   */
+-- 
+2.43.7
+
-- 
2.35.6


