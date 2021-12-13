Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68813C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:41 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=jmwwWqgz;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369060; x=1670905060;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=KFzSbIsN2I4nkNdCM2Iz7DgjyDd3TSMqgV+PJpYNlHg=;
  b=jmwwWqgzUhnbcamXv7oLtguX0X1zeONxwdu8rkdwPfmknPZpOi4bzfIh
   hyAtbFAL1w6uldYzPpJycPAZKYzKnQ++GHhYvyGxnAfoHpow8c/BiLERS
   91rgO3QayRhXuQwR4lu0Xt6LLhtcv8nLSs6mRxZUeMWmXLX55uX+ErelS
   DFTCgbqjVhx0pd/4qJOrz0dtsmzjXE2xBJQQ86fWCq2S1oqAS1Lnfp5Gb
   DkkUbO75MCP8X+ee2f4ppEgmeUs1CQ67BdOIQayTuupZ9gzj/YipaYybr
   hVrf8PfCMwAWqCC71z8eMB6PJOWhF8ATthjYaI5RkSFCGjB8lVVptrr9F
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602226"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602226"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589282"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/20] recipetool: handle GitLab URLs like we do
 GitHub
Date: Mon, 13 Dec 2021 12:17:07 +0800
Message-Id: 
 <7cc06b578612e4965add12181d76dadc81a9e873.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159598

From: Ross Burton <ross@burtonini.com>

GitHub URLs are automatically transformed to git: fetches, so handle
GitLab URLs too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 651fb951819840fe122458ddbd852ee6c7ec0455)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 116bdfd697..5752db5c2e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -366,7 +366,7 @@ def supports_srcrev(uri):
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
-    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://github.com/[^/]+/[^/]+/?$', checkuri):
+    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri):
         # Appends scheme if the scheme is missing
         if not '://' in uri:
             uri = 'git://' + uri
-- 
2.33.1


