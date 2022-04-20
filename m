Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72737C352A1
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.3158.1650419978333112004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Mq1Dm6W7;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419983; x=1681955983;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=B9cvTqT/B2ewZh9Nx6JRhJANwvG54VQoj3Z17+r9RrI=;
  b=Mq1Dm6W7BDE4GWdFXtIp5Utiq45tu8TzIj05paBJ77o7mPPKrCPlUZ5R
   ZqL1KwkOuv3xQ0Cjta8n51FztaCYiQboLv6GrBrtlOK6uMcTz3zFYvYbX
   2yxi9yCc+hVJTj21l71ev18Jf1mp8PPcq3dzxBHwJzlXsuntrS2XMt2UC
   eeY4PUM3Nl05QtdT1FTx2kPyW1EkPechJIa5kBgxu4iXeB1aORWWVC8kT
   /dZYsfMCu/T9MrDnV+g0MMoWOkWavo8+9U1srzsvn0bDA045oIoSPiZP/
   6q6idVimrORuSkbachSDpwEtJ8rQb59oY2DNZpPGkrNZHm0Dw6EcAcNYN
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263379422"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="263379422"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071670"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:42 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/11] license_image.bbclass: close package.manifest
 file
Date: Wed, 20 Apr 2022 09:59:16 +0800
Message-Id: 
 <4c556b4fd07a3ce9128019b51e5623e8eeeb7400.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164650

From: Martin Jansa <Martin.Jansa@gmail.com>

* fixes:
  NOTE: Executing write_package_manifest ...
  DEBUG: Executing python function write_package_manifest
  /OE/build/oe-core/openembedded-core/meta/classes/license_image.bbclass:23: ResourceWarning: unclosed file <_io.TextIOWrapper name='/OE/build/oe-core/tmp-glibc/deploy/licenses/core-image-minimal-qemux86-64/package.manifest' mode='w+' encoding='UTF-8'>
    'w+').write(output)
  ResourceWarning: Enable tracemalloc to get the object allocation traceback
  DEBUG: Python function write_package_manifest finished

[YOCTO #14772]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3114d5d438b7a63a276b4e825b62f3b1ebceed6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/license_image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 5490d121f1..150e8174f1 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -19,8 +19,8 @@ python write_package_manifest() {
 
     pkgs = image_list_installed_packages(d)
     output = format_pkg_list(pkgs)
-    open(os.path.join(license_image_dir, 'package.manifest'),
-        'w+').write(output)
+    with open(os.path.join(license_image_dir, 'package.manifest'), "w+") as package_manifest:
+        package_manifest.write(output)
 }
 
 python license_create_manifest() {
-- 
2.35.1


