Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38C2CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 12:27:41 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.8112.1755779256420011429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 05:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QofnCxQV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2025082112273396f62742c0715e4269-o9gqoa@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025082112273396f62742c0715e4269
        for <openembedded-core@lists.openembedded.org>;
        Thu, 21 Aug 2025 14:27:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=aQ8cp43PZgjtTV+GS0sEUXu3GPrnkfy9imyNKSXRScU=;
 b=QofnCxQV4RM2wvZCOoyYiM90Q220JXusLYwZWtxmmy5jJV1xLM+eIi1a6dU3so9Vx6FlwA
 9Apmp8xGJcI+yqCR1e7osApahjC9BEBPWnS0dpoDb8d66O65+RGaFQpKA4rLmaJPfxztOY8+
 CketQZEaU4ZcAPvGBzLlQhVoJxN6TRziFAMIUsFUmsTa4D0W+0yNEeujoSzeV1wTBlyRWTIU
 kT6gIOgbTEJKPVmXIDONHo9LTag4Icz2JRZupJCeiQ5hY0WzlMzIpBoDjd5ZDHzHJBisWxsB
 KacXE83/bW6V49/m4sxrL5kyXY62ksyI7D8dk7BblXtmyNijLAngPzdA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] rust: handle softfp fpu
Date: Thu, 21 Aug 2025 14:26:55 +0200
Message-Id: <20250821122655.14029-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 12:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222233

From: Peter Marko <peter.marko@siemens.com>

With TARGET_FPU set to "softfp" stdlib-rs fails with:
error: Error loading target specification: ARM targets must specify their float ABI. Run `rustc --print target-list` for a list of built-in targets

This fpu type is set for example for arm in file
meta/conf/machine/include/arm/feature-arm-vfp.inc
when TUNE_FEATURES do not contain "callconvention-hard",
e.g. when using tune
DEFAULTTUNE = "cortexa8"

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index cac6e90a9e..fc926fe778 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -409,7 +409,7 @@ def rust_gen_target(d, thing, wd, arch):
     if features != "":
         tspec['features'] = features
     fpu = d.getVar('TARGET_FPU')
-    if fpu == "soft":
+    if fpu in ["soft", "softfp"]:
         tspec['llvm-floatabi'] = "soft"
     elif fpu == "hard":
         tspec['llvm-floatabi'] = "hard"

