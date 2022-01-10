Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FB4C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kMOS42fz;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787769; x=1673323769;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=eH+B04sAS83Dqk2XV/BgZoZYVTOx68gxmSBvoPj3LHI=;
  b=kMOS42fzhGh1zwyZeyCHvcjAb40qyAZEt2JYqFn6QHlTjeBE0axMfz+2
   DJt0XoY02MYetab9AgwGT3uc7tD2K2u0FFRGAFHpZND0ISCC5yTN9rjH9
   Y+oSbQehs0lXGQ4ooDPRy8UtBq13j0ejyuk1UPkDN82p1XPlb4fDflCZh
   cmWNBA7f+ibc2BROutzbOqlexGcEM1RwIA91Qd+6ZDF1VORfKuAzn5Bs0
   HIKRQO8zXPylxtDHQKpLwb3vzj5RXTWsDMF5RxFyk8NPtEpBfyUxG9ggS
   Sjrg90gXW5/ZQmKhSrRM8Sw+6SUbIo+eDjuFCFzTBcfJgMtTgw0yQhEqI
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347364"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347364"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402230"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/10] rpm: remove tmp folder created during install
Date: Mon, 10 Jan 2022 12:09:09 +0800
Message-Id: 
 <3cd717159c607729abf5fba135e031777c1ca647.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160326

From: Samuli Piippo <samuli.piippo@gmail.com>

nativesdk-rpm build is also affected by the stray /var/tmp
created during the rpm install. Remove it to fix QA Issue:
nativesdk-rpm installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28dd1e1a0965646c5736e3de91aad830311a797b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index cb15415d7f..48cd79f9cb 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -133,6 +133,9 @@ do_install:append:class-nativesdk() {
 do_install:append:class-target() {
     rm -rf ${D}/var
 }
+do_install:append:class-nativesdk() {
+    rm -rf ${D}${SDKPATHNATIVE}/var
+}
 
 do_install:append () {
 	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
-- 
2.33.1


