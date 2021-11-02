Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2D8C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 05:25:36 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.5411.1635830730657573654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 22:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A25PT97002543
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 1 Nov 2021 22:25:29 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Nov 2021 22:25:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 1 Nov 2021 22:25:28 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 1 Nov 2021 22:25:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] opkg: use oe.qa.add_message istead of
 package_qa_add_message
Date: Mon, 1 Nov 2021 22:25:28 -0700
Message-ID: <20211102052528.38144-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 05:25:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157737

Since the following commit, package_qa_add_message is no longer
available, use oe.qa.add_message instead.

"""
commit f0ad152ef4cc15c042bc9eeefb6af096d054b220
Author: Mike Crowe <mac@mcrowe.com>
Date:   Fri Oct 15 15:39:53 2021 +0100

    lib/oe/qa,insane: Move extra error handling functions to library

    Extract package_qa_write_error, package_qa_handle_error and
    package_qa_add_message functions from insane.bbclass to lib/oe/qa.py and
    drop the package_qa_ prefixes.
...
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
index ef18ccf63a..f5c7d11191 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
@@ -67,7 +67,7 @@ def package_qa_check_openssl_deprecation (package, d, messages):
 
     pkgconfig = (d.getVar("PACKAGECONFIG") or "").split()
     if pkgconfig and 'openssl' in pkgconfig:
-        package_qa_add_message(messages, 'openssl-deprecation', '"openssl" in opkg.bb PACKAGECONFIG. Feed signature checking with OpenSSL will be deprecated in the next opkg release. Consider using GPG checking instead.')
+        oe.qa.add_message(messages, 'openssl-deprecation', '"openssl" in opkg.bb PACKAGECONFIG. Feed signature checking with OpenSSL will be deprecated in the next opkg release. Consider using GPG checking instead.')
         sane = False
 
     return sane
-- 
2.33.0


