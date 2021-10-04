Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC06C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 16:51:17 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.12465.1633366273427525687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 09:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="222944220"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="222944220"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208950"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/11] scriptutils.py: Add check before deleting
 path
Date: Tue,  5 Oct 2021 00:50:55 +0800
Message-Id: 
 <366070c476405a1f49e22a02c21fd99fc0ec76d9.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 16:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156619

From: Chandana kalluri <ckalluri@xilinx.com>

Add a check before deleting path when using recipetool commands to avoid the following type of errors:

Traceback (most recent call last):
   File "<workdir>/sources/core/scripts/lib/scriptutils.py", line 218, in fetch_url
    shutil.rmtree(path)
  File "/usr/local/lib/python3.7/shutil.py", line 476, in rmtree
    onerror(os.lstat, path, sys.exc_info())
  File "/usr/local/lib/python3.7/shutil.py", line 474, in rmtree
    orig_st = os.lstat(path)
FileNotFoundError: [Errno 2] No such file or directory: '<workdir>/build/tmp/work/recipetool-usg7o81n/work/recipe-sysroot'
ERROR: Command 'script -e -q -c "recipetool --color=always create --devtool -o /tmp/devtool5sq_op37 'file:///<SRCTREE>'  -x <workdir>/build/workspace/sources/devtoolsrcxc1b9zjq -N test" /dev/null' failed

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6aa8b47e023004ffd6958d1cec18c2d9c95d77b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/scriptutils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index f92255d8dc..3164171eb2 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -215,7 +215,8 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
                 pathvars = ['T', 'RECIPE_SYSROOT', 'RECIPE_SYSROOT_NATIVE']
                 for pathvar in pathvars:
                     path = rd.getVar(pathvar)
-                    shutil.rmtree(path)
+                    if os.path.exists(path):
+                        shutil.rmtree(path)
         finally:
             if fetchrecipe:
                 try:
-- 
2.31.1


