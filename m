Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A23C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 07:16:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.88631.1638342986688137482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 23:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236344638"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="236344638"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:35 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="459918904"
Received: from mwong12-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.129.81])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/14] os-release: Add DISTRO_CODENAME as vardeps
 for do_compile
Date: Wed,  1 Dec 2021 15:16:11 +0800
Message-Id: 
 <92cdee5c20c917f0d7bcfa44b0751e28966f3c44.1638342222.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638342222.git.anuj.mittal@intel.com>
References: <cover.1638342222.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 07:16:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159014

From: Daniel Gomez <daniel@qtec.com>

DISTRO_CODENAME is part of VERSION variable but not used as dependency
for do_compile task. Append it to the vardeps list to rebuild in case it
changes.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee0345057459c6d77fb64902a955e836c6c1e8e4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/os-release/os-release.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index a29d678125..33f75e39b8 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -12,7 +12,9 @@ do_configure[noexec] = "1"
 
 # Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
 #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
-OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
+OS_RELEASE_FIELDS = "\
+    ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME DISTRO_CODENAME \
+"
 OS_RELEASE_UNQUOTED_FIELDS = "ID VERSION_ID VARIANT_ID"
 
 ID = "${DISTRO}"
-- 
2.33.1


