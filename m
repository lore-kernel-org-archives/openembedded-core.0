Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243EDCD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 17:06:36 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2353.1778691981028483341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 10:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QGMcN6Q8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202605131706191a98823d76000207db-al1ewh@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202605131706191a98823d76000207db
        for <openembedded-core@lists.openembedded.org>;
        Wed, 13 May 2026 19:06:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=SoUsCu2POo7s7jpS8gmD0dfZS3UzH29Xz2bVtOVRt3k=;
 b=QGMcN6Q8emm2zmul/2+AUrxTLLIOLMelHXoeAaA/pR8Jb+JhadKiqDXcDh7eHD5ZhcpoSz
 odm+X4iWqkyK5W7eCGqVj+/6rCvYvOp+lKCrjB/67Zt7tVjaw+ZJKwlvy/B1hzObbVJmSd9f
 L841sYLGXlbWhBbeeavI06zGq3WIeHEYoZ7XczhypsBam7q5hGo6IuYTIIlP/GbQspcPD4VN
 ISvSSoz9xM0ho2W2w0V5yv2/Wc8zoz/CLItfnUAE9hKdw94KB0jX5fPNA3uwtSS2DsdBGsVZ
 gRfEuyAPEGlcG7TsvtuI+ETQUgeefd0j5RqWOPRc2HGEgwU0mUpYV+/g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [scarthgap][PATCH 2/3] go.bbclass: disable workspaces
Date: Wed, 13 May 2026 19:05:32 +0200
Message-ID: <20260513170533.2467950-2-peter.marko@siemens.com>
In-Reply-To: <20260513170533.2467950-1-peter.marko@siemens.com>
References: <20260513170533.2467950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 17:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236994

From: Peter Bergin <peter@berginkonsult.se>

go has a feature of workspaces [1]. If there is a file called go.work
in your working directory on any of its parent directories that will
be read and used during build. For OE where the builds shall
be sandboxed this is bad as a workspace file outside of the build
environment can be picked up. This commit wil disable that feature
according to the instruction in [1].

This was found and introduced build failures when a file go.work was
in the parent directory outside of OE build directory.

[1] https://go.dev/ref/mod#workspaces

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>a
(From OE-Core rev: c52c5e88626968b08510818f09829f2e1c9f94ae)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index 61b08a082f7..36103e8eb0f 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -22,6 +22,7 @@ export GOARCH = "${TARGET_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
 export GOHOSTARCH="${BUILD_GOARCH}"
 export GOHOSTOS="${BUILD_GOOS}"
+export GOWORK = "off"
 
 GOARM[export] = "0"
 GOARM:arm:class-target = "${TARGET_GOARM}"

