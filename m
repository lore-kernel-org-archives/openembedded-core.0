Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B84C5321C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 13:03:51 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30211.1785157424408808524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 06:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=B5mp72lt;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2768; q=dns/txt;
  s=iport01; t=1785157424; x=1786367024;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KCmehhblGBLhqXdZ9rglxfFvd+iZwwBPZEpFcl06OM8=;
  b=B5mp72ltgLrx3M13lAG5FvGU23DbOqPzlz8YZ4gPKBX24y/V+zZiHjME
   mikx+uZHnXbccBhNFgno1IV5fEhsN4HiCoZbpn6RONkTKLTLfmloTnZ9E
   Igl5VPHkG3KQOgSF4rDcelh+1YmSv9SmxCVFRGdtjJw5rSps5Tw+/JA6w
   tVafgHsVPgB+DS5xT7k/Ipt9dNnzbaWU7GIiu1iWpAdbOMwd7m59sY7s7
   M9TBS061uL8cXT5iiWjg+IGEVeL9P/TFdr7nVMMpeBVaYVOy0G41q+q0R
   2U//yN5TkdKpJiQLXNUjZDS90cuLLMtiNbGIxb0n/J1JoJT0qHeCf7VmJ
   g==;
X-CSE-ConnectionGUID: bTA87h1zQiaWT/rcGhbmwQ==
X-CSE-MsgGUID: w64AF5I4TiSXDXg7GJ84YQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgDoVmdq/5IQJK1aglmCV3ReQ0mEV5EHnwqBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY1iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEmDwEYAS0sAwECAwImAi0jGAmDAgGCdAMRxBh6gTKBAYMoA?=
 =?us-ascii?q?T8CQ1DbLgELFAEFgQUuhT+DHQGFAlwYAYR8JxsbgXKBFYNpgQWBXAEDGIITg?=
 =?us-ascii?q?w6CagSCIoEMgVqQR0iBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbB?=
 =?us-ascii?q?wWBHYEsYYRYIxk5f4ExdUp3LWkBEheBGoM8AoFMAwsYDUgRLDcUGQQ9AW4Hj?=
 =?us-ascii?q?VYigjuBDgErgUWUFZJIgTWfWgoog3WMIZU6GjOqbAuYfY4KllCEaYFoPIFHC?=
 =?us-ascii?q?wdwFYMiCUoZD44uCguFX4MUwz4nMgIBAQcyAQEHAgcCDAMLgWiQACyBUgEB?=
IronPort-Data: A9a23:H1jhFq68d3oUzevo/oCxiwxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mEcC2CHaaqJNDH2ct5/aIWwp08AvcSGyt9nHgto+yxgZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OtPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eN7Exqrl3WHN39
 PUnFHcXZT+Djeep+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0Mn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCyYYKNIoDTH589ckCwu
 Tya1kqkI00mNeev5QqKrV2O1rP+pHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rErt94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:Td89zKzYnWnb7sj2tmTLKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+MjztCWE7Qr5N0tApTntAsS9qBDnhPxICPcqXYtKNTOO0ADDEGgI1+XfKlPbdxEW39Qtsp
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:wa/xZmxcD3A1ZWB5zaYCBgUeJul1LX2E3k7RKnCETnxiZ72fTECprfY=
X-Talos-MUID: 9a23:NmJWQQQIJ8vZ5y7ARXTz2m1LGppJv5ivM3AhoZpZlOvUaR1JbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,188,1779148800"; 
   d="scan'208";a="790004122"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Jul 2026 13:03:36 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id DBB9C18000149;
	Mon, 27 Jul 2026 13:03:35 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 7BE5BCC12A6; Mon, 27 Jul 2026 06:03:35 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/2] patch: Fix CVE-2026-56289
Date: Mon, 27 Jul 2026 06:03:17 -0700
Message-Id: <20260727130318.56057-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 13:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242098

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced by NVD in [2], using
the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=faba04ef4f2b410257f76c1b9dc85e350929c4b9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56289

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../patch/patch/CVE-2026-56289.patch          | 36 +++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56289.patch

diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch b/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
new file mode 100644
index 0000000000..cfcb2216c3
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
@@ -0,0 +1,36 @@
+From a40c835ab06314526d623e62ae27830d0ad88752 Mon Sep 17 00:00:00 2001
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
+index b348b5c..0e8d5c9 100644
+--- a/src/patch.c
++++ b/src/patch.c
+@@ -1146,9 +1146,6 @@ locate_hunk (lin fuzz)
+     lin max_offset = MAX(max_pos_offset, max_neg_offset);
+     lin min_offset;
+ 
+-    if (!pat_lines)			/* null range matches always */
+-	return first_guess;
+-
+     /* Do not try lines <= 0.  */
+     if (first_guess <= max_neg_offset)
+ 	max_neg_offset = first_guess - 1;
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index e0e44f9c97..74d9085c6b 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
             file://CVE-2019-20633.patch \
+            file://CVE-2026-56289.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.35.6


