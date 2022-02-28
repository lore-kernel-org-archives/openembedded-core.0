Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14B5C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:57 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GWeAeVLY;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056916; x=1677592916;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Si7Gu96fX/mx2VMhEuzwY7vjBydb5Q8CkXFnoGgEy+Q=;
  b=GWeAeVLY9m++TA7kRbd5GBR9x/YwKs9YpTMGYM/1WRKt1w+8U6ddOKqY
   KXXGG45gAdsFq0qNbwLUWJlMI1Fe8QFX2P4agncezMaBFXNLxn+zCjWvB
   QJukd5OR1f0QKzUsGhTPKZE5WmRzS6zNvc5+th1Byv2Zby+pyaO4bIqYV
   oZOqKcoNA2B+GeAXedvWK/pIZ/NF6rIddzP292fk0ea+rrjaxD7Gbbkgs
   yA7aIrjZFH9nYhvjKZp1pxtlzNB5dKx2ebYFy+nJmgwydPlq/l4PJZ2Al
   t1aHNzZ3m6I/1sUn1cNseAvs1Rf19ou08lVkjDiLzYLRMmH3qLw3LOEPm
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857523"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857523"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:37 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092883"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 39/39] scripts/buildhistory-diff: drop use of
 distutils
Date: Mon, 28 Feb 2022 22:00:29 +0800
Message-Id: 
 <94db7109f21cdefd50baea5660b691e5fe44a0d1.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162495

From: Tim Orling <timothy.t.orling@intel.com>

The use of distutils.version.LooseVersion to check for GitPython > 0.3.1
is not really needed anymore since any supported distribution has at least
1.0.0 (centos-7 via epel7, debian-9, ubuntu-16.04)

If we want to reinstate this check, alternatives would be to require
python3-packaging on all hosts and use packaging.version.Version or
use an imported LooseVersion in bb.version.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc90dcae9f53ddc246942f4d9b8ae8943e3b9754)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/buildhistory-diff | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 3bd40a2a1e..a6e785aa23 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -11,7 +11,6 @@
 import sys
 import os
 import argparse
-from distutils.version import LooseVersion
 
 # Ensure PythonGit is installed (buildhistory_analysis needs it)
 try:
@@ -73,10 +72,6 @@ def main():
     parser = get_args_parser()
     args = parser.parse_args()
 
-    if LooseVersion(git.__version__) < '0.3.1':
-        sys.stderr.write("Version of GitPython is too old, please install GitPython (python-git) 0.3.1 or later in order to use this script\n")
-        sys.exit(1)
-
     if len(args.revisions) > 2:
         sys.stderr.write('Invalid argument(s) specified: %s\n\n' % ' '.join(args.revisions[2:]))
         parser.print_help()
-- 
2.35.1


