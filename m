Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFC3106FD87
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 06:26:21 +0000 (UTC)
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10008.1773383164588766945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 23:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Frcd91Vm;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2304; q=dns/txt;
  s=iport01; t=1773383164; x=1774592764;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5XHrxayg0sLFJiLbx3ftFoK7D30zowryO5L5CnuUaog=;
  b=Frcd91VmJpD5qh4LMvtJYbE1D58wJyhZZtXvImhi6cfW3oDALG5Lb84a
   r6P1OvpsTlP+cLm5vsV9jA2fsBTAvq2TtQf4DhKg+gTeY8VunPQhx8TZB
   5V1XTOMZoKxCVPqTBRo+y74IjkbDz4UXXJKYuqRVeqdj4drp20AunxU1q
   OpKWiQ+oSWd2vIe9H7kLdacliSVeZAnECcG+zmQcSuEMwyDdIQHZ5zwu5
   mQIF9PW3wfOeS3HDl5d7DD5E5OOWz3xGTmsPw7isEwlg2zAM77w3kKnEu
   IMm3+wlRFzq9IBExr0cMo0LaEJa29ycONp8xgGz9UKXsiA+OrtgOG470s
   w==;
X-CSE-ConnectionGUID: mfU1LDlARzefFvS4pADhCA==
X-CSE-MsgGUID: 0rVxt5NtR7yWKgm2aXVR6A==
X-IPAS-Result: =?us-ascii?q?A0CrBgAArbNp/9JK/pBaHgEBCxIMggULgkgPcV9CSZQqg?=
 =?us-ascii?q?iSLZJI2gX8PAQEBD0QNBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBVhwDAQIvIAsjCBEIgwIBg?=
 =?us-ascii?q?joDNgMRrziBeTOBAYNoAkNP2EcNglIBBQYUAYE4hTyCeYUgWxgBhHonGxuBc?=
 =?us-ascii?q?oEVgTuCLYEFgRpCAQMYghOFdwSCIoEOgWGRS0iBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBCxsHBYUaD4hwdG2BE4MoAwsYDUgRLDcUGwQ+bgeNeD2CN?=
 =?us-ascii?q?IEOLKgdoCBxCiiDdIwejz6FfBozqmsLmHuOCYQJkkeEaIFoPIFHCwdwFYMiU?=
 =?us-ascii?q?hkPjjiFaIMUw2M7NQIJMQIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:GuvX7q7KeQSr3c1Bqw2N9AxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 jdLD2mBO/bcY2P2LtkiYNzn9kwEuZ/Tmt5lGVc+rilkZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlNsfrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eOIMlo8JbBUh05
 /EWBi42Mgiqq+Kd6efuIgVsrpxLwMjDNY4F/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkUn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYaNKozRH5s9ckCw/
 nj473ikJA0ga82g6jWAqHucuNWRtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7IQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:xZ93aKAJcoaR77rlHemt55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefygaYvp
 0QFZSXz7bLfD9Hsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3Au9+L+GlNqJ4xf19adjRXOfzk2xPXOXjT8S70D0u?=
 =?us-ascii?q?RM3RkRpOLcgOI0Y9kuOM7zg=3D=3D?=
X-Talos-MUID: 9a23:ioGfUgWEAHBJ0abq/Gf2uiF+aeF02fu/N2MClM8Pi/e+awUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,117,1770595200"; 
   d="scan'208";a="54088326"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Mar 2026 06:26:01 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id AC0C3180001C4
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:26:00 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D62FBCC12B5; Fri, 13 Mar 2026 11:55:58 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 2/3] binutils: CVE-2025-69649
Date: Fri, 13 Mar 2026 11:55:31 +0530
Message-Id: <20260313062532.3247430-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260313062532.3247430-1-deeratho@cisco.com>
References: <20260313062532.3247430-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233027

From: Deepak Rathore <deeratho@cisco.com>

pick the patch [1] as mentioned in [2]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69649

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index cdbe12c97f..ff521e1b46 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -47,4 +47,5 @@ SRC_URI = "\
      file://0019-CVE-2025-11839.patch \
      file://0020-CVE-2025-11840.patch \
      file://CVE-2025-69644.patch \
+     file://CVE-2025-69649.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 0000000000..bd6e577afc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,40 @@
+From afd5151c503b95ce65a492b6585e55c56aba0e75 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 15:58:33 +1030
+Subject: [PATCH] PR 33697, fuzzer segfault
+
+	PR 33697
+	* readelf.c (process_relocs): Don't segfault on no sections.
+
+CVE: CVE-2025-69649
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
+
+(cherry picked from commit 66a3492ce68e1ae45b2489bd9a815c39ea5d7f66)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/readelf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 8f188e8c3e2..1c16ab5f594 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -9621,13 +9621,11 @@ process_relocs (Filedata * filedata)
+       size_t i;
+       bool found = false;
+
+-      for (i = 0, section = filedata->section_headers;
+-	   i < filedata->file_header.e_shnum;
+-	   i++, section++)
+-	{
++    section = filedata->section_headers;
++    if (section != NULL)
++      for (i = 0; i < filedata->file_header.e_shnum; i++, section++)
+	  if (display_relocations (section, filedata))
+	    found = true;
+-	}
+
+       if (! found)
+	{
+--
+2.44.1
-- 
2.35.6


