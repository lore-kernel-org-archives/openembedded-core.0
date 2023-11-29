Return-Path: <pooadire@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0744C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 04:56:40 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web11.24668.1701233791785737897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 20:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=N14vGIkW;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: pooadire@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2644; q=dns/txt; s=iport;
  t=1701233791; x=1702443391;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nqbrtcqaqtCONWTilpX0AtHvGtKi9q5IdVgvz5jUi2M=;
  b=N14vGIkWY8aHcLhky5DHebeiHxqCQoDDL28uEQkOioTaRBtHoyjQNdj2
   5Hi17u2DnjappwtYxQm2y99+PFaVUL7v3U7xiA0upPl1siiROa4cDFLmL
   vnwslBgOMA3qBMp5ccmFYVZaCFMxBKVG9BNM2Pc9cLnZ/WU8MmPf79SYV
   I=;
X-CSE-ConnectionGUID: pIq/tLifQO+cwk2P8tI2TA==
X-CSE-MsgGUID: nF4wTd84RhirdU3F+0KC2Q==
X-IronPort-AV: E=Sophos;i="6.04,234,1695686400"; 
   d="scan'208";a="148517756"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:56:31 +0000
Received: from sjc-ads-3769.cisco.com (sjc-ads-3769.cisco.com [171.68.250.216])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 3AT4uUIX025206
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 29 Nov 2023 04:56:30 GMT
Received: by sjc-ads-3769.cisco.com (Postfix, from userid 1807045)
	id 51843CC1293; Tue, 28 Nov 2023 20:56:30 -0800 (PST)
From: poojitha adireddy <pooadire@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, pooadire@cisco.com
Subject: [OE-core] [dunfell] [PATCH] binutils 2.34: Fix CVE-2021-46174
Date: Tue, 28 Nov 2023 20:56:26 -0800
Message-Id: <20231129045626.1211447-1-pooadire@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.250.216, sjc-ads-3769.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 04:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191427

Upstream Repository: https://sourceware.org/git/binutils-gdb.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2021-46174
Type: Security Fix
CVE: CVE-2021-46174
Score: 7.5
Patch: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=cad4d6b91e97

Signed-off-by: poojitha adireddy <pooadire@cisco.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 .../binutils/binutils/CVE-2021-46174.patch    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-46174.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index a9a2bf332f..371e8e9fa4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -54,5 +54,6 @@ SRC_URI = "\
      file://0001-CVE-2021-45078.patch \
      file://CVE-2022-38533.patch \
      file://CVE-2023-25588.patch \
+     file://CVE-2021-46174.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2021-46174.patch b/meta/recipes-devtools/binutils/binutils/CVE-2021-46174.patch
new file mode 100644
index 0000000000..2addf5139e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2021-46174.patch
@@ -0,0 +1,35 @@
+From 46322722ad40ac1a75672ae0f62f4969195f1368 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 20 Jan 2022 13:58:38 +1030
+Subject: [PATCH] PR28753, buffer overflow in read_section_stabs_debugging_info
+
+	PR 28753
+	* rddbg.c (read_section_stabs_debugging_info): Don't read past
+	end of section when concatentating stab strings.
+
+CVE: CVE-2021-46174
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=cad4d6b91e97]
+
+(cherry picked from commit 085b299b71721e15f5c5c5344dc3e4e4536dadba)
+(cherry picked from commit cad4d6b91e97b6962807d33c04ed7e7797788438)
+Signed-off-by: poojitha adireddy <pooadire@cisco.com>
+---
+ binutils/rddbg.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/binutils/rddbg.c b/binutils/rddbg.c
+index 72e934055b5..5e76d94a3c4 100644
+--- a/binutils/rddbg.c
++++ b/binutils/rddbg.c
+@@ -207,7 +207,7 @@ read_section_stabs_debugging_info (bfd *abfd, asymbol **syms, long symcount,
+ 		     an attempt to read the byte before 'strings' would occur.  */
+ 		  while ((len = strlen (s)) > 0
+ 			 && s[len  - 1] == '\\'
+-			 && stab + 12 < stabs + stabsize)
++			 && stab + 16 <= stabs + stabsize)
+ 		    {
+ 		      char *p;
+ 
+-- 
+2.23.1
+
-- 
2.35.6


