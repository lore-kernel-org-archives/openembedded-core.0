Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E82C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 27 Jul 2024 19:49:14 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.22742.1722109746101018772
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jul 2024 12:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QtqaYuTD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240727194902013ff233f910f155d3-b3gw0a@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240727194902013ff233f910f155d3
        for <openembedded-core@lists.openembedded.org>;
        Sat, 27 Jul 2024 21:49:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BxMDGGwoH4oru5bERxJcq71X1pEifrUXuuYDxe65DWQ=;
 b=QtqaYuTDN/x4KCflXujxQQaXtD4/BFXkCZN/1jfbq3WmiEntpb4hL9eulPBqwQj/ymzWAg
 H0Zf1xnap1rggKihva65I3MdhWyKIyDGe/nyHVmtkg3hQv+Z4wfeKkfZ/8AMHZO8hbYj0WGo
 kafdUQngno4mQY377iWvevYFe+10UvjOb9tGlJ+fR/xGl5iFfDqGmx+kS87aLvprgNYtoAZH
 lOaKdkRMBjCcwXJJ68GbdNAEwpZ6OS8AuPQMDjLbOgXUBB45IPKYsiTuLqx3zK3dapGlmtDm
 fM30pzlZZIusHc6Y4J6cQvMW9HLOQud02UGAOVMoKq126H/jkQYUg4gg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] gcc-runtime: remove bashism
Date: Sat, 27 Jul 2024 21:48:13 +0200
Message-Id: <20240727194813.8424-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jul 2024 19:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202561

From: Peter Marko <peter.marko@siemens.com>

Debian 12 no longer supports replacing dash with bash as default shell.
Therefore to achieve compatibility with Debian 12, all bashisms need
to be removed.

Shell comparison via == gives an error with dash and thus the condition
is always false.

(From OE-Core rev: 3723b26f82219ff71823335d550dbf29086d63d4)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d019b0790b..3aa8fe4045 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -145,7 +145,7 @@ do_install:append:class-target () {
 		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
 	fi
 
-	if [ "${TARGET_ARCH}" == "x86_64" -a "${MULTILIB_VARIANTS}" != "" ];then
+	if [ "${TARGET_ARCH}" = "x86_64" -a "${MULTILIB_VARIANTS}" != "" ];then
 		ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
 	fi
 
-- 
2.30.2


