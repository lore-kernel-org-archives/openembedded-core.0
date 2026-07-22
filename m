Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272CBC4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:56:38 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44192.1784714192391845550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VvxpDbVR;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5511; q=dns/txt;
  s=iport01; t=1784714192; x=1785923792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mjpgEiHYvrS8TTyPYD38UAzmGV/NRy0KVZj5YGfE/wY=;
  b=VvxpDbVRt+pKaH787r9hi80885s21SMETsjkNgTc8c9+ojwIwsuV6uz8
   oQo2H/wfZMw6O0xFiCql75QG5o8wuiYGPPm6g7pb/BXF1lI12F/5u5ul3
   6vmVn3kyqO3NQCCAtoxy/gN2kf6xQMpulH2Nnr9TtN3jQ35P8crNFrpjs
   YNDWCbzVMa3nNBSvSXy5WMmMvaf3mw3nQnv0DcASyp4HUyrSpJSpRx8wf
   Q5i/nWs1TJKmKIDyLLRUYCw9DE7ZKPHQTvJp1EqGAXgg07ht8kDORPnQv
   B7RGiELM6yujHkA3ypf54yN+t8zSze2bywK1I70QDrT3NF5xjJz0QH/F9
   Q==;
X-CSE-ConnectionGUID: apxuUjQVR2W7FWk5ntLcpQ==
X-CSE-MsgGUID: 3kSiLU2gTUGYAfoY574X+w==
X-IPAS-Result: =?us-ascii?q?A0BHAgA+kmBq/5T/Ja1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxHAcYF5M4EBgygBP?=
 =?us-ascii?q?wJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FyhAh2gQWBXAEDGIENhn4EgiKBD?=
 =?us-ascii?q?IFaGAZQj1JIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYEug?=
 =?us-ascii?q?QKEbiMfAzl/gS91SnctaQESF4EmghSBOgKBAwMLGA1IESw3FBkEPm4HjWkjg?=
 =?us-ascii?q?kABgQ0BBySVPZBEgiGhDwoog3WMIZU6GjOqbAuYfY4KhRyRNIRpgWg8gSgfC?=
 =?us-ascii?q?wdwFYJuAQEBMQlKGQ+OOIVqgxQuyEUnMgIBAQcyAQEHAgcOAwuBaJAAgX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:wNsLNKqadQtQhK6A0CP0c7glsqFeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnQafeOZWL0c9t0bYW+pEwBvcCAx9cwHlE4qSE0EyNBo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8kk35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0u9vEXxz9
 8UmEmoyMT68hL+w3JawUtA506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHZgOxxjI+
 z6uE2LRWRIhNfiikzW5z12dr+HIrH6kBLJRC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:YAhJ4qMb9ZTJYsBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: 9a23:cuA65G7tEuHIReGDbtss/VYEB/0nS0PnlkiPDXC7VGB1bLaNcArF
X-Talos-MUID: 9a23:Z85uQAsrYpcDoju5cM2n3zJZNeNVuauSNW88uJsBipTbaRwzJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="505316854"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:56:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 5A3D218000151;
	Wed, 22 Jul 2026 09:56:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 01FECCAB20F; Wed, 22 Jul 2026 02:56:30 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 4/4] gawk: Fix CVE-2026-40553
Date: Wed, 22 Jul 2026 02:56:27 -0700
Message-Id: <20260722095627.1424705-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722095627.1424705-1-dkelaiya@cisco.com>
References: <20260722095627.1424705-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241643

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3], using the
commit shown in [1]. It also applies the corrective follow-up [2],
which fixes the snprintf() truncation boundary check. Both commits
are included in gawk 5.4.1, identified as the fixed release in [4].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=cca0366144336b49aaa7d5d949966ce8e2c70843
[2] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bfa2e4b890a44100a99d26b54af385479528b12e
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40553
[4] https://cert.pl/en/posts/2026/07/CVE-2026-40467/

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40553_p1.patch         | 50 +++++++++++++++++++
 .../gawk/gawk/CVE-2026-40553_p2.patch         | 44 ++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
new file mode 100644
index 0000000000..07b7df488a
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
@@ -0,0 +1,50 @@
+From aa39cac4bda6333be0f6253ecb7dfade26cb9641 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 15 Apr 2026 09:39:02 +0300
+Subject: [PATCH] Avoid buffer overflow in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=cca0366144336b49aaa7d5d949966ce8e2c70843]
+
+(cherry picked from commit cca0366144336b49aaa7d5d949966ce8e2c70843)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 6 ++++++
+ extension/readdir.c | 6 +++++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index 40ed6dd0..52a4c6ab 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* readdir.c (ftype): Use snprintf() to check for buffer
++	overflow in the file name before calling stat(). Thanks to
++	Marcin Wyczechowski <mwyczechowski@afine.com> for the report.
++
+ 2023-11-02         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 5.3.0: Release tar ball made.
+diff --git a/extension/readdir.c b/extension/readdir.c
+index 788e1d1e..b525fe21 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -117,8 +117,12 @@ ftype(struct dirent *entry, const char *dirname)
+ #endif
+ 	char fname[PATH_MAX];
+ 	struct stat sbuf;
++	int count;
++
++	count = snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->d_name);
++	if (count > sizeof(fname))
++		return "u";	// buffer overflow. skip stat() call.
+ 
+-	sprintf(fname, "%s/%s", dirname, entry->d_name);
+ 	if (stat(fname, &sbuf) == 0) {
+ 		if (S_ISBLK(sbuf.st_mode))
+ 			return "b";
+-- 
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
new file mode 100644
index 0000000000..2f63572af0
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
@@ -0,0 +1,44 @@
+From 8b08dcf6c784e7a98d08e9e63a8fda15040eee30 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 17 Apr 2026 11:48:19 +0300
+Subject: [PATCH] Small fix in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=bfa2e4b890a44100a99d26b54af385479528b12e]
+
+(cherry picked from commit bfa2e4b890a44100a99d26b54af385479528b12e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 5 +++++
+ extension/readdir.c | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index 52a4c6ab..c8839357 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,8 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* readdir.c (ftype): Use >= in check of snprintf() return
++	value. Thanks to Andrew Schorr <aschorr@telemetry-investments.com>.
++
+ 2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* readdir.c (ftype): Use snprintf() to check for buffer
+diff --git a/extension/readdir.c b/extension/readdir.c
+index b525fe21..6f9b6811 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -120,7 +120,7 @@ ftype(struct dirent *entry, const char *dirname)
+ 	int count;
+ 
+ 	count = snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->d_name);
+-	if (count > sizeof(fname))
++	if (count >= sizeof(fname))
+ 		return "u";	// buffer overflow. skip stat() call.
+ 
+ 	if (stat(fname, &sbuf) == 0) {
+-- 
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index 7bd34a3ff8..d71f655ba6 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -25,6 +25,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
            file://CVE-2026-40469.patch \
+           file://CVE-2026-40553_p1.patch \
+           file://CVE-2026-40553_p2.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
-- 
2.35.6


