Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B112C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:43 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=XrRqZ4IO;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369062; x=1670905062;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=s6vlBNssnaLPVm5ws/1XcKZSMFsCd/vB9wS2xuTqduA=;
  b=XrRqZ4IO12JU/bd9pUSf66s7t53TXzD+kmh1pJ2INk3KyhCrs5VKHsXI
   Awrgvbt33ahJkcbEagDMD/orInUcY3QwyMQhlXVP1LLvzrYBsyZlQZxls
   8X14v+r8ijls+0LLNDVYwXjICOkOiGWSUbqvcxmiCHbbMXTuZdWcmxMbp
   8kZTNPZ67G+1dheYzBkFq8ZkPZGZjXDsvOE9KMfyRFw5w3MOg1mJrP+dU
   b6/5ogY581VzqPDa/Qi6CbfHpjSlYn/v3bSTfPLGIWh6Gq0LFQVQsYKFE
   ZhpZ2SDLzxP2Ev9GbnrK/q+5owyYSe5nlCBsBIJI8kUDVXl90zVeN9uqm
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602235"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602235"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589286"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/20] recipetool: extend curl detection when
 creating recipes
Date: Mon, 13 Dec 2021 12:17:08 +0800
Message-Id: 
 <39e5b3b37c3a0116fb01be6183b320d9afea3bfe.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159599

From: Ross Burton <ross@burtonini.com>

If a configure.ac uses LIBCURL_CHECK_CONFIG it wants curl.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 16e830ca1352cee61e4ae4b98b1203f849bf71f3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 35a97c9345..5015634476 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -545,7 +545,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 deps.append('zlib')
             elif keyword in ('AX_CHECK_OPENSSL', 'AX_LIB_CRYPTO'):
                 deps.append('openssl')
-            elif keyword == 'AX_LIB_CURL':
+            elif keyword in ('AX_LIB_CURL', 'LIBCURL_CHECK_CONFIG'):
                 deps.append('curl')
             elif keyword == 'AX_LIB_BEECRYPT':
                 deps.append('beecrypt')
@@ -624,6 +624,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AX_CHECK_OPENSSL',
                     'AX_LIB_CRYPTO',
                     'AX_LIB_CURL',
+                    'LIBCURL_CHECK_CONFIG',
                     'AX_LIB_BEECRYPT',
                     'AX_LIB_EXPAT',
                     'AX_LIB_GCRYPT',
-- 
2.33.1


