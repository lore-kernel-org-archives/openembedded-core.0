Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5880C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=JI2olYTK;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787777; x=1673323777;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=81D6O0PxwYkPM9V/LHavBtOwJ56SulCLdNI57RnX8XQ=;
  b=JI2olYTKgOr1nSlkiDMPoSa6dgVvPk2TAGN7EpMx4w/fqrzhKodKbqnw
   57b7yPT2BgX0XUWnTzDi58MJiFrYO2uvhy2WuzVdoCDt03HL+UEOaLrpY
   nTQWkEoocmQGUZlLgac3Tjjb8LdUzDW//GkUUK+inEdxav6lC/25pfMmG
   /4NSfxwbYSBrT5G+Mj8jzattraJwxMTm5VqpHM81RUBPLqjb5s2H1c4dM
   ccKr2Cwe2RxJCONqMRKpf2aJCHqZI4xy/qL9dAE1dqA0WMGR5NT4UpS/c
   FCB9CDQiWPws0OqY50iVbBBhR+4Gfh7ZgXbSU8DVernm3MWEB4fw6Ltnu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347396"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347396"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402270"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/10] scripts/buildhistory-diff: drop use of
 distutils
Date: Mon, 10 Jan 2022 12:09:14 +0800
Message-Id: 
 <17ef30dd6abe764c836c66dc59d1c9cf65ebd984.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160331

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
2.33.1


