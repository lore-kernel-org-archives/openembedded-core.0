Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB57C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:19 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=c6OaVbaK;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444878; x=1670980878;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=otQ4ADBx9pTsxE5/p0OEe8/XauZeNuOvlwMcmGLHKuo=;
  b=c6OaVbaKD9fPJlD1WAnUp5GVwlO+sJfTlqKPUjhQ6F2g2izU3IZBjZJj
   p6L4s2Ee8BwwGtxFAjRZu0VyI2j76WfQC4CVSeCEPFh32/2JS2kR0pZH1
   nmu6bRlFXkhO8QBjFSTVIk56VMzF89tzB4V9QirbPm9QKa6dl5vobHmsf
   BydZC9ZlTYmN5YDx4HKPbBzaF6kR0wAscOXUTSLAlnhqkMPjzhs6IkXAq
   QdOC3UwWRfqErOvP+PzqTouWwNIrHokw+5nHqrABukcX2mqkX//snJ8Uf
   yU4KfB++md2GI0byNSkm7Ej3d9sxAN95omK8w3dknmDXJMpucUwZ9KbfF
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682536"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682536"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869214"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/17] selftest/devtool: Check branch in git fetch
Date: Tue, 14 Dec 2021 09:20:46 +0800
Message-Id: 
 <a2bbdb02bdf50e4d7dc1a2439b562a50584b63b9.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159673

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
forget the url branch= parameter in the devtool git fetch test.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1419168a58a5caf99e24ada08c9ab639344a78b4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d2b31af80e..a2b4d7f7d1 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -442,6 +442,7 @@ class DevtoolAddTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         url = 'gitsm://git.yoctoproject.org/mraa'
+        url_branch = '%s;branch=master' % url
         checkrev = 'ae127b19a50aa54255e4330ccfdd9a5d058e581d'
         testrecipe = 'mraa'
         srcdir = os.path.join(tempdir, testrecipe)
@@ -462,7 +463,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '1.0+git${SRCPV}'
-        checkvars['SRC_URI'] = url
+        checkvars['SRC_URI'] = url_branch
         checkvars['SRCREV'] = '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
         # Try with revision and version specified
@@ -481,7 +482,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '1.5+git${SRCPV}'
-        checkvars['SRC_URI'] = url
+        checkvars['SRC_URI'] = url_branch
         checkvars['SRCREV'] = checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
 
-- 
2.33.1


