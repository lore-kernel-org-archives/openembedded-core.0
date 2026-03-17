Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96753FB5EBB
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 04:32:47 +0000 (UTC)
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69032.1773721961760439938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 21:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fGAYmiQ+;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2502; q=dns/txt;
  s=iport01; t=1773721961; x=1774931561;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8DDdmJMdXwmzEIRhDbX6LzTQ9eyCW8hcgYPN56lmM2I=;
  b=fGAYmiQ+Q2g5Bg3YL9PTGRpcYnsUg3V/MDcpZ5cFNqeeu5+TSZtWHvkG
   58pTgg5xqxD2Skh8YWicY4WqY/I9iG0mUODnRdXKTWYyQQqipfb0pAB1h
   3wZ+lequPAkzwimh07zgWryyqPbh6WFvC8H9UAGRF9C/vw6gLefR8sIH6
   Hnwh48y7FfRk9qJ1oQHdCr3aDap2RYEeooWizvjp9pv2pgqC5McwywfPA
   1alJWQd72BCpoDm2VIMZdHrp/Glfsu08R7pgN5MHdjcCWHpSbEiNr5cz5
   M0gX+KvXAgP5LfOtwe07ZVdfo44iGnXxOhpywoF9xnnxN2DqF30ywXzKM
   g==;
X-CSE-ConnectionGUID: o1Kqq3DkT8mMsOeYcqpZwA==
X-CSE-MsgGUID: mPho2SaLRZ6kfOuFCY0sgQ==
X-IPAS-Result: =?us-ascii?q?A0BqCwBp2Lhp/9VK/pBaHgEBCxIMggULgkgPcV9CSZQqg?=
 =?us-ascii?q?iSLZJI2gX8PAQEBD0QNBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBVhwDAQIvIAsjCBEIgwIBg?=
 =?us-ascii?q?joDNgMRsmeBeTOBAYNoAkNP2EcNglIBBQYUAYE4hTyCeYUgWxgBhHonGxuBc?=
 =?us-ascii?q?oEVgTuCLYEFgRpCAQMYghOFdwSCIoEOgWGRI0iBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBCxsHBYQkD4htdG2BE4NcAwsYDUgRLDcUGwQ+bgeNTTyCN?=
 =?us-ascii?q?IEOLKgdoCBxCiiDdIwejz6FfBozqmsLmHuOCYQJkkeEaIFoPIFHCwdwFYMiU?=
 =?us-ascii?q?hkPjjiFaIMUwjg7NQIJMwEHAgcOAoFzkX0BAQ?=
IronPort-Data: A9a23:wGlGxKk2VdB8J+5psUT4mv7o5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbD2qHM/nYYDOmcopzb4m+8hhU7MPRz9YyTQFk/yxnH1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpPsv3b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYpB2f9uWk1Ny
 awdDSsqYyGInvqE35vuH4GAhux7RCXqFIoSoDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQUUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeJI4zTHJQE9qqej
 mf+/2OjORg+Du7ByjSi71yHt7fUkhquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:44eJcal2QNXt+JoKDWkGDJPjWnPpDfIt3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNDU1ZmIK6/oTJ2KDYrEd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3Ahl2CPmjRWTsriI2ofCVJ1YxDtjJudST+1W6LD0y?=
 =?us-ascii?q?EWWNMU5qYeFSJ4JF7up87?=
X-Talos-MUID: 9a23:+VFoIQhLwJy+m1YNZwaa28MpMf9o5P6VAWQ3o8sFte6ZGwdBYyyStWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,124,1770595200"; 
   d="scan'208";a="54181199"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Mar 2026 04:32:40 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id B337F18000205
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:32:39 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 54FA0CC12B5; Tue, 17 Mar 2026 10:02:38 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v2 3/4] binutils: Fix CVE-2025-69649
Date: Tue, 17 Mar 2026 10:02:27 +0530
Message-Id: <20260317043227.2945754-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260313062532.3247430-1-deeratho@cisco.com>
References: <20260313062532.3247430-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233294

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69649

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes from v1 -> v2: 
- CVE-2025-69648 is fixed first as per commit history timeline so the
  patch is rebased on top of CVE-2025-69648, CVE-2025-69644 and
  CVE-2025-69647 patch.

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 48579b3602..2f34037eed 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -48,4 +48,5 @@ SRC_URI = "\
      file://0020-CVE-2025-11840.patch \
      file://CVE-2025-69648.patch \
      file://CVE-2025-69644_CVE-2025-69647.patch \
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


