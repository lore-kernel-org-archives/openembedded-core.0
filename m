Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFA8CCD186
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 21:01:46 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.1041.1759352495323491283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 14:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=OuqxO2aO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202510012101324ad6285c2700020715-c0cgtp@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202510012101324ad6285c2700020715
        for <openembedded-core@lists.openembedded.org>;
        Wed, 01 Oct 2025 23:01:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IGgxYctZwqJhhJhhaCVfFI7pDMlkSiA6xdQAFiMPpWQ=;
 b=OuqxO2aOk/jP/00GJVxMPR8IWurnOWl7ihStok6x9z+owdhXYp/s93g4DVoI16yEw3sI4N
 ZrmBh4BTX9WTiFRyFlvVSqu+LoBxObS2gfKKZMgzozdSJDZNmvj97+sk2Wmd0CN/thX4IZkt
 qWfISEvr4PRnfYI0ktZZC1P4EM5q2Se13LNj6jSFiAezwEIdQezoe1FpR0psz81+y/B8zyBX
 83zVz7T9hjbGG5X+sZET4KQwB4SiZyRl2CTn/SC8Qnb2lQwiHiBZ6BIiuOkNoMXfKxlFeJ2/
 /KUwSurD7u/OmRpFrox09e1Np4cicuJ5cx/8vjbFXWwhaGh8NvvkXdvw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [scarthgap][PATCH 1/6] expect: Revert "expect-native: fix do_compile failure with gcc-14"
Date: Wed,  1 Oct 2025 22:58:33 +0200
Message-ID: <20251001210111.1444441-2-adrian.freihofer@siemens.com>
In-Reply-To: <20251001210111.1444441-1-adrian.freihofer@siemens.com>
References: <20251001210111.1444441-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 21:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224329

From: Adrian Freihofer <adrian.freihofer@siemens.com>

In the meantime there is a cleaner fix on the master branch and we also
need to back-port more patches to support gcc-15 as well.

This reverts commit 8bfdb53247c917559e7813c2e1bd2f6eb13c811d which is
not in the master branch as a preparation for cherry-picking the newer
fixes from there.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 158e7af030..174b35ec73 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -85,4 +85,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 # http://errors.yoctoproject.org/Errors/Details/766950/
 # expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
-CFLAGS:append = " -Wno-error=incompatible-pointer-types"
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.51.0


