Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D979BC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:38:16 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.12976.1636468691816879860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915825"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915825"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956799"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/26] opkg: Fix poor operator combination choice
Date: Tue,  9 Nov 2021 22:37:40 +0800
Message-Id: 
 <0ed0fd99153dd8a4560b6fbbbaa0decc60f79c5a.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:38:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158026

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Combining :append with += rarely makes sense. Improve it to use the standard
format (and tweak the implied spacing).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 768766dc007ebe9b4bc38d425584be03fbdb98c1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
index ef18ccf63a..8152fa0658 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
@@ -60,7 +60,7 @@ do_install_ptest () {
 	sed -i -e '/@PYTHONPATH=. $(PYTHON) $^/a\\t@if [ "$$?" != "0" ];then echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
 }
 
-WARN_QA:append += "openssl-deprecation"
+WARN_QA:append = " openssl-deprecation"
 QAPKGTEST[openssl-deprecation] = "package_qa_check_openssl_deprecation"
 def package_qa_check_openssl_deprecation (package, d, messages):
     sane = True
-- 
2.31.1


