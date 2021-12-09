Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E329C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:29:44 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235503931"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235503931"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298010"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/33] rust-cross: Fix directory not deleted for
 race glibc vs. musl
Date: Thu,  9 Dec 2021 09:29:01 +0800
Message-Id: 
 <3c71fe1c487682950a115348cb8308e74c20e250.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:29:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159403

From: Pgowda <pgowda.cve@gmail.com>

Use different recipe names for the two different targets so that
when switching libcs overlapping files in the sysroot don't cause
issues.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33be44a02beb7c52f075f660ad8e0641e360011c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/rust/rust-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index bee7c9f12f..33be83bf5a 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -32,7 +32,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
 DEPENDS += "rust-native"
 
 PROVIDES = "virtual/${TARGET_PREFIX}rust"
-PN = "rust-cross-${TARGET_ARCH}"
+PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
 
 # In the cross compilation case, rustc doesn't seem to get the rpath quite
 # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
-- 
2.33.1


