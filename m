Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21823C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 16:27:51 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.10587.1745598464900834938
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 09:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DTGjy0i/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025042516274240f5d7225216b9e868-hpsacb@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025042516274240f5d7225216b9e868
        for <openembedded-core@lists.openembedded.org>;
        Fri, 25 Apr 2025 18:27:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ymvkEbWNd8PzUE5QCc+fA8lCE+AXpF0n5DJvLXSNscA=;
 b=DTGjy0i/cNRiWqP6qPohyCfMndLBuOtbEcbuBff7eqdsXgd6lZPgiZfsZLYJ2Tg5GL0YQQ
 HdNx0g78IX4ZMA1d1TT0ol66woAB8SUR4uV2bkx++du9OMkrdZVtJ2qGh1tuMOTsTD2iSmGG
 J0Q3xvde0F/2ueps9FbdJI0+xJrqnTEMU6i12aR+XWpek4N1HcWKpqfFA+kjBXSoA8Ddf8vo
 +gmZAU0uI8COD8f5vDD4CwpAF4ZZKIzUT4JywBXTFLul69NSuFpFJuKV/b3Q3zxe3hCsjfBq
 mvrmmreU39S4GR6HSke4TsDgRyER3dUGPe3D/PSBHZ/HX0S86RXWS/kg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] ghostscript: ignore CVE-2025-27833
Date: Fri, 25 Apr 2025 18:26:45 +0200
Message-Id: <20250425162645.10474-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 16:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215482

From: Peter Marko <peter.marko@siemens.com>

Vulnerable code was introduced in 9.56.0, so 9.55.0 is not affected yet

Commit introducing vulnerable feature:
* https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/pdf/pdf_fmap.c?id=0a1d08d91a95746f41e8c1d578a4e4af81ee5949
Commit fixing the vulnerability:
* https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=477e36cfa1faa0037069a22eeeb4fc750733f120

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 8499bb3676..3d4ac77cfa 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -22,9 +22,10 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 # As of ghostscript 9.54.0 the jpeg issue in the CVE is present in the gs jpeg sources
 # however we use an external jpeg which doesn't have the issue.
 CVE_CHECK_IGNORE += "CVE-2013-6629"
-
 # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
 CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
+# Vulnerable code was introduced in 9.56.0, so 9.55.0 is not affected yet
+CVE_CHECK_IGNORE += "CVE-2025-27833"
 
 def gs_verdir(v):
     return "".join(v.split("."))

