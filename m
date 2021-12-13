Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D000C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:50 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=VtP1nKEZ;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369069; x=1670905069;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=akbMTj7NMj+AqODrTxKnIata8rVFgpCfdjuCPqYiXno=;
  b=VtP1nKEZHWAnmQajzED1X+QOV8MsSddEskOfm4gRQMmdYY6A8NS9pu06
   pEhA0PNNE88fTweKy64iHzRBh59S3+izGCcVElf52/GdzaNGv8iZl3ZQQ
   dDl+HKQOUXP6p8cCwxzFhm0Xw8kk3Dk3WRlVgjJlIbFdLtRj8N4ACZZBg
   rsCtklpItqNiRWdZF7u938Ts3uEs4Tv+sfsR/s4GzGBFA7Og1uNSH3oGr
   pksft8HR1Ijs7yqW9C8Uv1TwGGd1ZgLMirytsfGLoQSHkwAxo6+pCBUfF
   H7flAZXWgsmTmGOXBklxjPRXxUo6MmkUcwmXzGjlG0/eyCSzBRISYncyq
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602251"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602251"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589316"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/20] selftest/devtool: Check branch in git fetch
Date: Mon, 13 Dec 2021 12:17:13 +0800
Message-Id: 
 <8cddb33800476866b0249f885b77d73626e57688.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159604

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
index 66e326253e..7ac1fcfbeb 100644
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


