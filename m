Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1410C433FE
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:50 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.420.1637080369344062201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="233669502"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="233669502"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956781"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:21 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/17] scripts/oe-package-browser: Fix after
 overrides change
Date: Wed, 17 Nov 2021 00:31:52 +0800
Message-Id: 
 <b27a11f4ddc0c10ff7e5fb447431bff1411a5417.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158362

From: Richard Purdie <richard.purdie@linuxfoundation.org>

After the overrides change, the format of pkgdata changed and this
usage of configparser no longer works. This change is a bandaid to make
things work but the pkgdata format isn't very similar to ini files
so this may need to be reimplmented in a better way in the long run.

[YOCTO #14619]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 25a8ec6e2891b71bc280aacaf5f62ecc4b0bd1d1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/oe-pkgdata-browser | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 8d223185a4..e07005b807 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -49,11 +49,11 @@ def load(filename, suffix=None):
     from configparser import ConfigParser
     from itertools import chain
 
-    parser = ConfigParser()
+    parser = ConfigParser(delimiters=('='))
     if suffix:
-        parser.optionxform = lambda option: option.replace("_" + suffix, "")
+        parser.optionxform = lambda option: option.replace(":" + suffix, "")
     with open(filename) as lines:
-        lines = chain(("[fake]",), lines)
+        lines = chain(("[fake]",), (line.replace(": ", " = ", 1) for line in lines))
         parser.read_file(lines)
 
     # TODO extract the data and put it into a real dict so we can transform some
-- 
2.33.1


