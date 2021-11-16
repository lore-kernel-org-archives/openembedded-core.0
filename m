Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95BEC4332F
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:55 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.421.1637080374291423425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="294545638"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="294545638"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956767"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/17] convert-srcuri.py: use regex to check space
 in SRC_URI
Date: Wed, 17 Nov 2021 00:31:51 +0800
Message-Id: 
 <f87a3aba3086cd3fd89274337f25fc1717d6c981.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158364

From: Kai Kang <kai.kang@windriver.com>

There may be none, one or more spaces including tab before backslash in
SRC_URI. Use regex to check and update. It helps to avoid malformed uri
such as recipe open-iscsi-user in meta-openstack:

SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https  ;branch=master \

And help to check more recipes such as concurrent-ruby in the same
layer:

SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6\

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a69a53573b1987ee5834a6fc27763f9bbf5fe5a4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
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
2.33.1


