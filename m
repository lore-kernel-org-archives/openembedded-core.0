Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C09DC77B6C
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 06:46:41 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6296.1681368394176573668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 23:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bUHod0ZQ;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1681368395;
  x=1712904395;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WWxPVfBXU7L3WTY4DpXeJnlatBrdgrHw/H/OUau39jI=;
  b=bUHod0ZQXfFooPPYYE56OjmYhIF8aszr/AiBksHRD9Oo5hd7V8Rd8Yy6
   xThUx/BYB1mTgHZciUubaFZqiPSQ5E3HMC6gSpgdJh1FuGD//duvcohmN
   nY/DmBdrWtEUIiKiGE0fRoHt601TMpwuklW6JS9Og1iCbjqYLHKrucjkU
   CD9LK7bwbrmUNQeiJcKLsPoO8F1aPiekJeiG7vsGmrKr4BWn0nyOMu1zs
   zeueuyDq6shtKad1S0p/F05wLmb6d7F67n68c6GZkgbUlmlSn7jCUCIkj
   +YtIggQGOcKrQk3g4cNSq/dcxUIs1gq0lkvQpGpsfHRQyzL1hTcuZ4LKB
   w==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] package: Use shlex instead of deprecated pipe
Date: Thu, 13 Apr 2023 08:46:32 +0200
Message-ID: <20230413064632.3239129-2-olani@axis.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413064632.3239129-1-olani@axis.com>
References: <20230413064632.3239129-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 06:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179960

The pipe library is deprecated in Python 3.11 and will be removed in
Python 3.13.  pipe.quote is just an import of shlex.quote anyway.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/lib/oe/package.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 7a6b31957a..edb70daaf1 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -8,7 +8,7 @@ import errno
 import fnmatch
 import itertools
 import os
-import pipes
+import shlex
 import re
 import glob
 import stat
@@ -41,7 +41,7 @@ def runstrip(arg):
 
     stripcmd = [strip]
     skip_strip = False
-    # kernel module    
+    # kernel module
     if elftype & 16:
         if is_kernel_module_signed(file):
             bb.debug(1, "Skip strip on signed module %s" % file)
@@ -1556,7 +1556,7 @@ def process_shlibs(pkgfiles, d):
         sonames = set()
         renames = []
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
-        cmd = d.getVar('OBJDUMP') + " -p " + pipes.quote(file) + " 2>/dev/null"
+        cmd = d.getVar('OBJDUMP') + " -p " + shlex.quote(file) + " 2>/dev/null"
         fd = os.popen(cmd)
         lines = fd.readlines()
         fd.close()
@@ -2012,4 +2012,3 @@ def process_depchains(pkgfiles, d):
                 for dep in bb.utils.explode_deps(d.getVar('RDEPENDS:' + base) or ""):
                     add_dep(rdeps, dep)
                 pkg_addrrecs(pkg, base, suffix, func, rdeps, d)
-
-- 
2.39.2


