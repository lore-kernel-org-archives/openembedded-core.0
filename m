Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772ECC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:38 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.13223.1635347857108672005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456865"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456865"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:36 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617247"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:35 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 28/36] uninative: Improve glob to handle glibc 2.34
Date: Wed, 27 Oct 2021 23:16:36 +0800
Message-Id: 
 <f60da44d32a579f5ba5c95dd60f80d624de39ce4.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157543

From: Ross Burton <ross.burton@arm.com>

With glibc 2.34, the libraries were renamed. Tweak the glob to support both
as this is needed for newer uninative versions.

[RP: tweak commit message]
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98248306e4b5f023e96375293b60524574ebb686)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 1e19917a97..3c7ccd66f4 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -100,7 +100,7 @@ ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
   ${UNINATIVE_LOADER} \
   ${UNINATIVE_LOADER} \
   ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative \
-  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so" % chksum)
+  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so*" % chksum)
         subprocess.check_output(cmd, shell=True)
 
         with open(loaderchksum, "w") as f:
-- 
2.31.1


