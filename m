Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15F3C433FE
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:39:03 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.12750.1636468742593660706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229916011"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229916011"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:47 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956952"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 24/26] scripts/convert-srcuri: Update SRC_URI
 conversion script to handle github url changes
Date: Tue,  9 Nov 2021 22:37:59 +0800
Message-Id: 
 <fc9209fa892b31b2226008bdaf474750c3b61f38.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:39:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158046

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Github are dropping support for git:// protocol fetching. Update the script
to learn about corner cases found in the previous conversion and
support remapping the github urls as needed too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e59fe8279b209f67ff79b9d6dbb69389a64db236)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/contrib/convert-srcuri.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/convert-srcuri.py b/scripts/contrib/convert-srcuri.py
index 4bf9e3013d..5b362ea2e8 100755
--- a/scripts/contrib/convert-srcuri.py
+++ b/scripts/contrib/convert-srcuri.py
@@ -19,19 +19,33 @@ if len(sys.argv) < 2:
     sys.exit(1)
 
 def processfile(fn):
+    def matchline(line):
+        if "MIRROR" in line or ".*" in line or "GNOME_GIT" in line:
+            return False
+        return True
     print("processing file '%s'" % fn)
     try:
+        if "distro_alias.inc" in fn or "linux-yocto-custom.bb" in fn:
+            return
         fh, abs_path = tempfile.mkstemp()
         modified = False
         with os.fdopen(fh, 'w') as new_file:
             with open(fn, "r") as old_file:
                 for line in old_file:
-                    if ("git://" in line or "gitsm://" in line) and "branch=" not in line and "MIRROR" not in line and ".*" not in line:
+                    if ("git://" in line or "gitsm://" in line) and "branch=" not in line and matchline(line):
                         if line.endswith('"\n'):
                             line = line.replace('"\n', ';branch=master"\n')
                         elif line.endswith(" \\\n"):
                             line = line.replace(' \\\n', ';branch=master \\\n')
                         modified = True
+                    if ("git://" in line or "gitsm://" in line) and "github.com" in line and "protocol=https" not in line and matchline(line):
+                        if "protocol=git" in line:
+                            line = line.replace('protocol=git', 'protocol=https')
+                        elif line.endswith('"\n'):
+                            line = line.replace('"\n', ';protocol=https"\n')
+                        elif line.endswith(" \\\n"):
+                            line = line.replace(' \\\n', ';protocol=https \\\n')
+                        modified = True
                     new_file.write(line)
         if modified:
             shutil.copymode(fn, abs_path)
-- 
2.31.1


