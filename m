Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DF6C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:49:19 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19174.1784796555938631398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VWE5vRTq;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2761; q=dns/txt;
  s=iport01; t=1784796555; x=1786006155;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QUSRG8K7UPk1epRsPDO4n/zho9YqJqzJpWWn+SQ/Ndc=;
  b=VWE5vRTqNQM1c5tMLSs+ZMVsyAV55/v4/XdU4a5TydrDOP9AY8VgbowV
   akZJ9FJzaIGdpi4OVVkqYKcX4bAHuPhG72+CYHUCEXFxuGU+bKQD4AcHX
   nmkF3oul7Ubr5UfdDsyo5vBTwK0I8altomo/7mQv6DCgZng0NDTIFg4Hn
   RKyGLWLzkcea/bRBmre+CzttnZM153GGSIt052tuxTVlJ/Z78SG0vb8Ty
   +pLdOBrmgJvuS5gDELUru6L5jxxEmVOzFy8toQhbnqY/sDLCUGId3NNXs
   tZiW5zwAfr94qm9lJ7kN0xJrH1CraiyW9Ts0NezD5BWZtMCpPscD04xdc
   Q==;
X-CSE-ConnectionGUID: 3ePz4RBSS3GuH2TKlfiVqg==
X-CSE-MsgGUID: QrqsIsDyR8+1g0U09TN+BA==
X-IPAS-Result: =?us-ascii?q?A0BHAgCL1GFq/5T/Ja1aglmCV3ReQ0mEV5FzihOUC4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjVwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECASYPAUYsAwECAwImAi0jGAmDAgGCdAMRwUR6gTKBAYNoA?=
 =?us-ascii?q?kNQ2y4BCxQBBYEFLoU/gx0BhQJcGAGEegInGxuBcoEVg2mBBYFRCwEDGIENg?=
 =?us-ascii?q?QaDDoJqBIIigQyBWh6BUI5mSIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?hc0WBsHBYEdgS6BAoRcIx8DOX+BMHVKdy1pARIXgSaCFIE6AoEdAwsYDUgRL?=
 =?us-ascii?q?DcUGQQ9AW4HjXAjgjuBDgEqAYEYLaZdiQuYBAoog3WMIZU6GjOEBIFXpRELm?=
 =?us-ascii?q?H2CWYsxllCEaYFoPIFHCwdwFYMiCUoZD444hWqDFMkBJzICAQEHMgEBBwIHA?=
 =?us-ascii?q?gwDC4FokACBfgEB?=
IronPort-Data: A9a23:2KsNEKO8Ijrq6WXvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUp01DcAm
 mYYXmCAPP2LMWf2eY9wPInl9EJVvp6Bx9A1GnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWUsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj665jNFNqB6cjwb1YHEEUy
 d8cJjEzdx/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPHwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEpjeizYISNIbRmQ+1shF+Dh
 3nq7l6pQUgVbOHHmAajsViF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:yMqDgaxMsXIgIdBL8K8bKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+MjztCWE7Qr5N0tApTntAsS9qBDnhPxICPcqXYtKNTOO0ADDEGgI1+XfKlPbdxEW39Qtsp
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:H74TKW1YVoQdJOeAsSm/+rxfQc0dYCHn5kzreGClKTxVa7mbSGGJ9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AHpIttQ1OtWFNQbWFcRiGsQp59jUj2r63E2EWvYQ?=
 =?us-ascii?q?864rdOnRNY2ahqneda9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="505868603"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:49:14 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id B8A4B18000256;
	Thu, 23 Jul 2026 08:49:14 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 5EF78CD144E; Thu, 23 Jul 2026 01:49:14 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 1/2] patch: Fix CVE-2026-56289
Date: Thu, 23 Jul 2026 01:49:13 -0700
Message-Id: <20260723084914.2718150-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241798

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced by NVD in [2], using
the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=faba04ef4f2b410257f76c1b9dc85e350929c4b9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56289

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-devtools/patch/patch.inc         |  4 ++-
 .../patch/patch/CVE-2026-56289.patch          | 36 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56289.patch

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 44d3046fd8..738bec038d 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -5,7 +5,9 @@ original files, producing patched versions."
 SECTION = "utils"
 HOMEPAGE = "http://savannah.gnu.org/projects/patch/"
 
-SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz \
+	   file://CVE-2026-56289.patch"
+
 S = "${UNPACKDIR}/patch-${PV}"
 
 inherit autotools update-alternatives
diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch b/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
new file mode 100644
index 0000000000..8f98c444fc
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
@@ -0,0 +1,36 @@
+From e89f7be0853836908226e1df746fe07ef7c46769 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 21 Apr 2026 13:16:10 -0700
+Subject: [PATCH] =?UTF-8?q?Don=E2=80=99t=20infloop=20on=20null=20ranges?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/patch.c (locate_hunk): Don’t attempt to optimize
+matches of a null range.  Instead, apply all the checks
+we apply to non-null ranges.
+
+CVE: CVE-2026-56289
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=faba04ef4f2b410257f76c1b9dc85e350929c4b9]
+
+(cherry picked from commit faba04ef4f2b410257f76c1b9dc85e350929c4b9)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/patch.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/patch.c b/src/patch.c
+index e4d0524..1e7dfdc 100644
+--- a/src/patch.c
++++ b/src/patch.c
+@@ -1166,9 +1166,6 @@ locate_hunk (idx_t fuzz)
+     ptrdiff_t max_offset = MAX (max_pos_offset, max_neg_offset);
+     ptrdiff_t min_offset;
+ 
+-    if (!pat_lines)			/* null range matches always */
+-	return first_guess;
+-
+     /* Do not try lines <= 0.  */
+     if (first_guess <= max_neg_offset)
+ 	max_neg_offset = first_guess - 1;
-- 
2.35.6


