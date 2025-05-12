Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB424C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 15:59:25 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.54169.1747065556016357101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 08:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=e4Hp6f6g;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202505121559111961acc4ae8d28b6bc-orwtcw@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202505121559111961acc4ae8d28b6bc
        for <openembedded-core@lists.openembedded.org>;
        Mon, 12 May 2025 17:59:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QKd0JcsJE3dDK5ow6d19Ie+NrPYy3PFVZH4lVTEDBIM=;
 b=e4Hp6f6gOgpqC3TWj0AvleJ+0F9xFa7No9MiXKYko3dACszoyJ5rUm/A6lcGPdJ9NfwiOc
 4TZQyRXeO023Meys21POMKG/PkiUGl0dVj/kurdPsBpoiH0zrBPdEXrxTgMWU8UZYdo2dimB
 wRlGHjZJzwwCNjVGFxB1SJ4fqqK5LDjELjTlQbPp+G8DhPdtzCWycOe0hNtSV0GtXFn/1Mhk
 zHCAr4siFhZvmOmYGtJB0jMk9cCZZ8gWoLVrW1UwYiPpmn2fXm0daglyOersPXJgqhpp70nn
 8nQWEAbZWBPPaAJMVSE4y+hDR+1KHwIhhVuuMGelb7VTcMqKrACLftGQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] testimage: get real os-release file
Date: Mon, 12 May 2025 17:58:35 +0200
Message-Id: <20250512155835.9159-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 15:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216379

From: Peter Marko <peter.marko@siemens.com>

/etc/os-release is a symlink to /usr/lib.
Symlink is retrieved as a dead link which points to nowhere if also the
original file is not accompanying it.
Fetch the real file instead of this link.

Alternative could be to use "tar -h" (supported also by busybox tar),
however that could lose some important information if links are relevant
for failure analysis.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index e090b1ef4b..862f3e53a3 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -26,7 +26,7 @@ TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${localstatedir}/log \
     ${localstatedir}/volatile/log \
     ${sysconfdir}/version \
-    ${sysconfdir}/os-release"
+    ${nonarch_libdir}/os-release"
 
 # If some ptests are run and fail, retrieve corresponding directories
 TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/*/ptest', '', d)}"

