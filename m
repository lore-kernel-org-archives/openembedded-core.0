Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF1BC433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 03:48:20 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.6113.1636602499140696251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 19:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AB3mH4H029507
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 19:48:17 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 19:48:16 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 10 Nov 2021 19:48:16 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 10 Nov 2021 19:48:15 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] convert-srcuri.py: remove extra spaces before backslash
Date: Thu, 11 Nov 2021 11:48:14 +0800
Message-ID: <20211111034814.16625-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 03:48:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158131

From: Kai Kang <kai.kang@windriver.com>

There may be more than one spaces before backslash in SRC_URI. Strip
them otherwise it forges a malformed uri such as open-iscsi-user in
meta-openstack:

SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https  ;branch=master \

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 scripts/contrib/convert-srcuri.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/convert-srcuri.py b/scripts/contrib/convert-srcuri.py
index 5b362ea2e8..e7a97fdbd4 100755
--- a/scripts/contrib/convert-srcuri.py
+++ b/scripts/contrib/convert-srcuri.py
@@ -36,7 +36,7 @@ def processfile(fn):
                         if line.endswith('"\n'):
                             line = line.replace('"\n', ';branch=master"\n')
                         elif line.endswith(" \\\n"):
-                            line = line.replace(' \\\n', ';branch=master \\\n')
+                            line = line.replace(' \\\n', '').rstrip() + ';branch=master \\\n'
                         modified = True
                     if ("git://" in line or "gitsm://" in line) and "github.com" in line and "protocol=https" not in line and matchline(line):
                         if "protocol=git" in line:
@@ -44,7 +44,7 @@ def processfile(fn):
                         elif line.endswith('"\n'):
                             line = line.replace('"\n', ';protocol=https"\n')
                         elif line.endswith(" \\\n"):
-                            line = line.replace(' \\\n', ';protocol=https \\\n')
+                            line = line.replace(' \\\n', '').rstrip() + ';protocol=https \\\n'
                         modified = True
                     new_file.write(line)
         if modified:
-- 
2.17.1


