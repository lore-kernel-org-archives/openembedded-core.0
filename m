Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C35C433FE
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 02:20:32 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.1399.1637547629207164788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 18:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298122192"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="298122192"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:31 -0800
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="739428784"
Received: from kkleong1-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.135])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:30 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/16] convert-srcuri.py: use regex to check space
 in SRC_URI
Date: Mon, 22 Nov 2021 10:20:08 +0800
Message-Id: 
 <0a25dbe3912bff88e5c8cbc50302cae3c261dfbc.1637546583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637546583.git.anuj.mittal@intel.com>
References: <cover.1637546583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 02:20:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158540

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


