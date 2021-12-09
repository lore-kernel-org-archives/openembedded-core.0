Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE72C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:29:51 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235503963"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235503963"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298054"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/33] buildhistory: Fix srcrevs output
Date: Thu,  9 Dec 2021 09:29:07 +0800
Message-Id: 
 <8b6e565afcfb73a33e3759486554365798e74d66.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:29:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159409

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The code was assuming that the a recipe with only one srcrev wouldn't "name"
it. This isn't the case as the glibc or bzip2 recipes show, you can have
a single srcrev which is named.

We can pull the data from the fetcher and in fact we already have it, we just
need to handle the "default" case and make that code the default for all srcrev
regardless of length.

[YOCTO #14017]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45ae567932ba52b758eb41754453e9828d9533a1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/buildhistory.bbclass | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7c44fec2d1..810c4fae73 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -979,23 +979,19 @@ def write_latest_srcrev(d, pkghistdir):
                         value = value.replace('"', '').strip()
                         old_tag_srcrevs[key] = value
         with open(srcrevfile, 'w') as f:
-            orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
-            if orig_srcrev != 'INVALID':
-                f.write('# SRCREV = "%s"\n' % orig_srcrev)
-            if len(srcrevs) > 1:
-                for name, srcrev in sorted(srcrevs.items()):
-                    orig_srcrev = d.getVar('SRCREV_%s' % name, False)
-                    if orig_srcrev:
-                        f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
-                    f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
-            else:
-                f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
-            if len(tag_srcrevs) > 0:
-                for name, srcrev in sorted(tag_srcrevs.items()):
-                    f.write('# tag_%s = "%s"\n' % (name, srcrev))
-                    if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
-                        pkg = d.getVar('PN')
-                        bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name], srcrev))
+            for name, srcrev in sorted(srcrevs.items()):
+                suffix = "_" + name
+                if name == "default":
+                    suffix = ""
+                orig_srcrev = d.getVar('SRCREV%s' % suffix, False)
+                if orig_srcrev:
+                    f.write('# SRCREV%s = "%s"\n' % (suffix, orig_srcrev))
+                f.write('SRCREV%s = "%s"\n' % (suffix, srcrev))
+            for name, srcrev in sorted(tag_srcrevs.items()):
+                f.write('# tag_%s = "%s"\n' % (name, srcrev))
+                if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
+                    pkg = d.getVar('PN')
+                    bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name], srcrev))
 
     else:
         if os.path.exists(srcrevfile):
-- 
2.33.1


