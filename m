Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599E9F36C41
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:44:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14874.1776671096247635251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y3eoITPf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6E385C5C98B;
	Mon, 20 Apr 2026 07:45:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB37E5FFA5;
	Mon, 20 Apr 2026 07:44:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0754310460B77;
	Mon, 20 Apr 2026 09:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pzWGKDshtKNTCjUbPQZaCjTWMfUwLmySdV3gSl83BII=;
	b=Y3eoITPfELCk/y4cddTAHHX2rl+uKQhf8e/wNPTqvm6QrpJqLUt2Akid0R9IyLY45xRH6r
	XncnvBJemkfp3FyaEgnMBCiJE36zgckNLTa4uGbGM34La5Hhyo5p5Z0RMT4ffzlc4a/+p9
	779YHh1lwENijPJsQ5cn9Z/jV7q8CifI9ntnSXLlgymh9JveZYdKbUXXbmPh0wl7QPFq05
	F/MMV8YMZQKSFl6OVS0POFM9NFB1+kVgEiUYTyojxFBSIdXSm/7ypC/pBBWdx6s3fI68bi
	luEJjKttnCYvQDgqCMMMyEihWj1iQ3XiCphCqDpXN30zeEDd7P//O0ATzhSymw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:39 +0200
Subject: [PATCH 08/10] oe/spdx_common: Remove unused local variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-8-27e0d5edcdbe@bootlin.com>
References: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
In-Reply-To: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235549

The deploy_dir_spdx variable is assigned from "DEPLOY_DIR_SPDX", but
never used, so remove it. Same for pn variable.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx_common.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 47d14b55c701..6b1a409c40c2 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -135,8 +135,6 @@ def collect_package_providers(d, direct_deps):
     Returns a dictionary where each RPROVIDES is mapped to the package that
     provides it
     """
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-
     providers = {}
 
     all_deps = direct_deps + [Dep(d.getVar("PN"), d.getVar("BB_HASHFILENAME"), True)]
@@ -175,7 +173,6 @@ def get_patched_src(d):
     """
     spdx_workdir = d.getVar("SPDXWORK")
     spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
-    pn = d.getVar("PN")
 
     workdir = d.getVar("WORKDIR")
 

-- 
2.53.0


