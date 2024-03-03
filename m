Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5B7C48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 17:53:33 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web10.78207.1709488410373231681
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 09:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=UdYS9r7d;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2282; q=dns/txt; s=iport;
  t=1709488410; x=1710698010;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ntoJFU4ejdJamyVfSpp3U7CDpT7gg8+oq+RR/YhHEks=;
  b=UdYS9r7dKRNII+WBbchZRpGe+ilzyPQxBHZwutT6Q+x2OhuoozN2wI+S
   dKIiaXYooAIwQFHGPBmmM6ODxcNFYYs/s99fxrJVIhLXqU0VYuO8ERmQS
   xGBNJekloZUeVtecn+8/XWIziUG7z9Zt0CLuTgxcqjlduFJydBGmdozZn
   8=;
X-CSE-ConnectionGUID: 14stDheQSFCttsaJwRNPQg==
X-CSE-MsgGUID: PWhuPQyHR12jhDh1k0mmEA==
X-IronPort-AV: E=Sophos;i="6.06,201,1705363200"; 
   d="scan'208";a="199262020"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:53:29 +0000
Received: from sjc-ads-6228.cisco.com (sjc-ads-6228.cisco.com [10.28.89.212])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 423HrT7S028622
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 17:53:29 GMT
Received: by sjc-ads-6228.cisco.com (Postfix, from userid 1820939)
	id 0612FCC1251; Sun,  3 Mar 2024 09:53:28 -0800 (PST)
From: dnagodra@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Dhairya Nagodra <dnagodra@cisco.com>
Subject: [master] [PATCH] cve-check: Add provision to exclude classes
Date: Sun,  3 Mar 2024 09:53:23 -0800
Message-Id: <20240303175323.2526814-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.89.212, sjc-ads-6228.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 17:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196574

From: Dhairya Nagodra <dnagodra@cisco.com>

- There are times when exluding a package that inherits a particular
  class/classes may be desired.
- This provides the framework for that via the variable:
  CVE_CHECK_CLASS_EXCLUDELIST

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/classes/cve-check.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 56ba8bceef..6d459642fe 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -100,6 +100,8 @@ CVE_CHECK_LAYER_EXCLUDELIST ??= ""
 # Layers to be included
 CVE_CHECK_LAYER_INCLUDELIST ??= ""
 
+# Classes to be excluded
+CVE_CHECK_CLASS_EXCLUDELIST ??= ""
 
 # set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
@@ -466,6 +468,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
 
     include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
     exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
+    exclude_classes = d.getVar("CVE_CHECK_CLASS_EXCLUDELIST").split()
 
     report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
 
@@ -475,6 +478,10 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
     if include_layers and layer not in include_layers:
         return
 
+    for excluded in exclude_classes:
+        if bb.data.inherits_class(excluded, d):
+            return
+
     # Early exit, the text format does not report packages without CVEs
     if not patched+unpatched+ignored:
         return
@@ -581,6 +588,7 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
 
     include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
     exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
+    exclude_classes = d.getVar("CVE_CHECK_CLASS_EXCLUDELIST").split()
 
     report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
 
@@ -590,6 +598,10 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
     if include_layers and layer not in include_layers:
         return
 
+    for excluded in exclude_classes:
+        if bb.data.inherits_class(excluded, d):
+            return
+
     unpatched_cves = []
 
     product_data = []
-- 
2.35.6


