Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A65C54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 12:31:29 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10347.1785241879348293336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 05:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EptM0oIn;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2761; q=dns/txt;
  s=iport01; t=1785241879; x=1786451479;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AtPsp3ddbNQ0zdju7/QtLStUpA8+1j+i8YhJUXlgHmg=;
  b=EptM0oInm5SGdGsDq0duVfemVeemQU9z5VxjcjJiMKPIAuTXu9Oa9/H5
   D8HbipOCVUcEssZ1aCgEppIFfIq0JxUGPg0TcmN9knh9riLBc9WwxEVGN
   mBLINd+uRchv7cw1gpWG++bLaPkDhThbgAD20HpOBLDiQ7bjnag2Nyg8a
   7rgpxa6m2vBDoBVHoigBD2IaK+OtYipRN0QCL/+8CfAxd+h3M2c3a8OOP
   GBhLwGCE2+0/a9udLDYZmrYHFs4zJUrSkp2oMNATkglhJK7UptBlg+i5y
   J0kXNAjI3rvmZ/WRO9b081yoT8JSu0QlmeL7x1Yw5X03N802dGD15GBUW
   Q==;
X-CSE-ConnectionGUID: AHGs1cGDTku/368RAhPuuw==
X-CSE-MsgGUID: 7wDyo0UaSlO6h9Q/Gbvfcw==
X-IPAS-Result: =?us-ascii?q?A0BHAgAHoGhq/5AQJK1aglmCV3RfQkmEV5FzihOUC4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjWUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECASYPAUYsAwECAwImAi0jGAmDAgGCdAIBEcFieoEygQGDa?=
 =?us-ascii?q?AJDUNsuAQsUAQWBBS6FP4MdAYUCXBgBhHoCJxsbgXKBFYNpgQWBUQsBAxiBD?=
 =?us-ascii?q?YEGgw6CagSCIoEMgVoegTaPFEiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XNFgbBwWBHYEsYYRYIxk5f4ExdUp3LWkBEheBGoM8AoIVAwsYDUgRLDcUG?=
 =?us-ascii?q?QQ9AW4HjXUigj2BDgEqAYEYLaZdiQuYBAoog3WMIZU6GjOEBIFXpRELmH2CW?=
 =?us-ascii?q?YsxllCEaYFoPIFHCwdwFYMiCUoZD444hWqDFMlCJDUCAQEHMwEHAgcCDAOBc?=
 =?us-ascii?q?5AAgX4BAQ?=
IronPort-Data: A9a23:SIdoG6pIJfAw/Ki7DZw8yOFj4zZeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmDP6zZZWOnf9EiYN/k/U1S6sDcyIdhSwJk+SExRCxD8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8kM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0s9XLnoX/
 tM0FDMQKUvd19ifwIqmV/Y506zPLOGzVG8eknhkyTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtLYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9JYzbFJ0LxhbFz
 o7A1zvmLgAdbOGW8j6irHL9v6jglz31U51HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmEHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:43uaMaFP5/zFD7S0pLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8/
 xG/c5rsCMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOkdK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:A7SXzWMlTzNSie5DcQlI7xcfNewZcWCalymAGWa4MXt0V+jA
X-Talos-MUID: 9a23:oIGLPglMv2gSPYLbskU4dno9K+t55PyTAXsJtssG6vDDGiZuNTyC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,190,1779148800"; 
   d="scan'208";a="789906085"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 12:31:18 +0000
Received: from sjc-ads-8351.cisco.com (sjc-ads-8351.cisco.com [171.68.209.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 43C78180001F4;
	Tue, 28 Jul 2026 12:31:18 +0000 (GMT)
Received: by sjc-ads-8351.cisco.com (Postfix, from userid 1887505)
	id CFDBDCC12A6; Tue, 28 Jul 2026 05:31:17 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][PATCH 1/2] patch: Fix CVE-2026-56289
Date: Tue, 28 Jul 2026 05:31:03 -0700
Message-ID: <20260728123113.3485106-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8351.cisco.com [171.68.209.139];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.209.139, sjc-ads-8351.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 12:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242189

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
2.51.0


