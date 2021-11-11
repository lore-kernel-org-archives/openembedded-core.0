Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CD7C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 09:57:40 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.8603.1636624658563057298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 01:57:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AB9vXSD013381
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Nov 2021 01:57:33 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 01:57:31 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 01:57:30 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <foss@0leil.net>
Subject: [PATCH v2] convert-srcuri.py: use regex to check space in SRC_URI
Date: Thu, 11 Nov 2021 17:57:24 +0800
Message-ID: <20211111095724.32167-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 09:57:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158150

From: Kai Kang <kai.kang@windriver.com>

There may be none, one or more spaces including tab before backslash in
SRC_URI. Use regex to check and update. It helps to avoid malformed uri
such as recipe open-iscsi-user in meta-openstack:

SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https  ;branch=master \

And help to check more recipes such as concurrent-ruby in the same
layer:

SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6\

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:
* use re to check and replace

 scripts/contrib/convert-srcuri.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/contrib/convert-srcuri.py b/scripts/contrib/convert-srcuri.py
index 5b362ea2e8..587392334f 100755
--- a/scripts/contrib/convert-srcuri.py
+++ b/scripts/contrib/convert-srcuri.py
@@ -35,16 +35,16 @@ def processfile(fn):
                     if ("git://" in line or "gitsm://" in line) and "branch=" not in line and matchline(line):
                         if line.endswith('"\n'):
                             line = line.replace('"\n', ';branch=master"\n')
-                        elif line.endswith(" \\\n"):
-                            line = line.replace(' \\\n', ';branch=master \\\n')
+                        elif re.search('\s*\\\\$', line):
+                            line = re.sub('\s*\\\\$', ';branch=master \\\\', line)
                         modified = True
                     if ("git://" in line or "gitsm://" in line) and "github.com" in line and "protocol=https" not in line and matchline(line):
                         if "protocol=git" in line:
                             line = line.replace('protocol=git', 'protocol=https')
                         elif line.endswith('"\n'):
                             line = line.replace('"\n', ';protocol=https"\n')
-                        elif line.endswith(" \\\n"):
-                            line = line.replace(' \\\n', ';protocol=https \\\n')
+                        elif re.search('\s*\\\\$', line):
+                            line = re.sub('\s*\\\\$', ';protocol=https \\\\', line)
                         modified = True
                     new_file.write(line)
         if modified:
-- 
2.17.1


