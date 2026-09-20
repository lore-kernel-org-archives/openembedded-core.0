Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41288C982D8
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 19:16:14 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35017.1789931764589105380
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 12:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UCBkyiVb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026092019160269b9a3c8c100020760-ww9zec@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026092019160269b9a3c8c100020760
        for <openembedded-core@lists.openembedded.org>;
        Sun, 20 Sep 2026 21:16:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=orCWDOMw1DwiZrfcX6uy/3rDjqLr2JlB7JA2a6c9y5o=;
 b=UCBkyiVbKDVzqeBzH44XHAYOi3ArnXrfqd7BGEGjMckWMVPRY25fc5G/AYK+SEUXrnVyqe
 cikXsGcXsFDLgvkbmV8LCpVR9GkeDUIcJ/vqCkQgaiTRgWl+1wCyx7YGXTvxJ37FWalShMLA
 O/OpckaN591cEqJJ/fddwt/LQhk8dopnCe9MKcBfT5ZHPhsgfmiLIDbLvXSx2m1blMH1TiI6
 RbKgHnWEM4/3QrV4k4cZJnKkVpv50kteIoP23rMzIwLI0nsFdsNaHX2fsYe0n4SF+oiY6wxG
 tIzyTYMIyWaHDh6MBDBYTtofkOOojoFVoDH3VvunpoyQ+D37Dy0c70yA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 2/5] sbom-cve-check-update-db: Exclude recipes from rm_work
Date: Sun, 20 Sep 2026 21:15:28 +0200
Message-ID: <20260920191531.113024-2-peter.marko@siemens.com>
In-Reply-To: <20260920191531.113024-1-peter.marko@siemens.com>
References: <20260920191531.113024-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 19:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246264

From: Benjamin Robin <benjamin.robin@bootlin.com>

If the "rm_work" task runs on these recipes, the next execution of the
do_sbom_cve_check task would force the CVE databases to be extracted
again. Excluding the recipes from "rm_work" allows the build system to
remember that the unpack and patch tasks were already executed, so
it does not run them a second time. Extracting the CVE databases is
slow, and it also removes the database "index", which sbom-cve-check
has to regenerate — an even slower step.

Keeping WORKDIR around is cheap: for the recipes downloading the CVE
databases, it stays below 400 kB (not counting the "temp" directory,
which rm_work leaves in place anyway).

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3b81e8bc30552359125f2ca40f36ad11ce8ee969)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
index fbdc561e8c..2efc080b93 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -2,6 +2,7 @@
 
 INHIBIT_DEFAULT_DEPS = "1"
 EXCLUDE_FROM_WORLD = "1"
+RM_WORK_EXCLUDE += "${PN}"
 
 inherit native
 require conf/sbom-cve-check-config.inc

