Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0B9C433FE
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 08:37:54 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.5953.1638434272198952852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 00:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B28bmdi002300
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 2 Dec 2021 00:37:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1B28bhW0007890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Dec 2021 00:37:48 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 2 Dec 2021 00:37:43 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 2 Dec 2021 00:37:42 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jacob.kroon@gmail.com>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH] native/cross: make ar wrapper support to read options from
 file
Date: Thu, 2 Dec 2021 00:37:42 -0800
Message-ID: <20211202083742.69650-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 08:37:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159076

If ar input params starts with @, it means to read options from file
$ ar -h
...
  @<file>      - read options from <file>
...

It failed to call ar wrapper to read options from file:
$ path_to/oe-core/scripts/native-intercept/ar @bazel-out/k8-opt/bin/external/llvm-project/llvm/libSupport.a-2.params
|path_to/oe-core/scripts/native-intercept/ar: invalid option -- '@'
| Usage: path_to/oe-core/scripts/native-intercept/ar [emulation options]
[-]{dmpqrstx}[abcDfilMNoPsSTuvV] [--plugin <name>] [member-name] [count] archive-file file...

If input params start with @, append option -D to argv list

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/native-intercept/ar | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/native-intercept/ar b/scripts/native-intercept/ar
index dcc623e3ed..32f45171d6 100755
--- a/scripts/native-intercept/ar
+++ b/scripts/native-intercept/ar
@@ -19,6 +19,8 @@ argv = sys.argv
 if argv[1].startswith('--'):
     # No modifier given
     None
+elif argv[1].startswith('@'):
+    argv.append('-D')
 else:
     # remove the optional '-'
     if argv[1][0] == '-':
-- 
2.33.0


