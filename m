Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7466AC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:34 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=QQrjXP3P;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369053; x=1670905053;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RMju0L+mmZyn8u4CACLgGVHLlrUIOEQw2C0EfuJgqts=;
  b=QQrjXP3PddOdB2txJFx/juSx/x4gM8HRitH4fdmQzUPMdX0QR35AN371
   k60UU4prYxME1VaSwG9IhkiuIif5YAl3nmxR02KfQRF/YglUgufN29nL6
   Q9gVmIM2i3W9R0H3JxMwDRt9z7tc0YOCtavijGiuC4EHC9ZVocydn2oFV
   6aqC4sxvTwHCRY63dAdZl0532HiC0kzhVsqqU1WbA4wVmu/eueFzosdos
   UipKsXUd0hFSh+WP2PkNbiE9R37cHLru7PODda4n+sx5ijh7zSzfnB8CK
   nBBhvDOfUItMO8IGRJPRaNfKR+6kage/6ct3fPkTUd6+mi4VFEVVPIrY1
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602204"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602204"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589257"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/20] buildhistory: Fix srcrevs output
Date: Mon, 13 Dec 2021 12:17:02 +0800
Message-Id: 
 <f21ae68097f331e772960bdb0d488fdd53a21055.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159593

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
index 49af61c9c5..b2cf9aa28a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -960,23 +960,19 @@ def write_latest_srcrev(d, pkghistdir):
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


