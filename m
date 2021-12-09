Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1285AC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:15 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5668.1639013411655338325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504090"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504090"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298314"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:13 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 28/33] recipetool: extend curl detection when
 creating recipes
Date: Thu,  9 Dec 2021 09:29:27 +0800
Message-Id: 
 <d647fa0136bde43544b142136f519b597ed749c1.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159428

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


