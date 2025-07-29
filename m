Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B605C87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 21:46:45 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.20219.1753825601979912788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 14:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TQdZkVfC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2025072921463932262bfee66f039403-146ibn@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025072921463932262bfee66f039403
        for <openembedded-core@lists.openembedded.org>;
        Tue, 29 Jul 2025 23:46:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jxnimgETLrLPqOtTEpCenMS9AxzOZd4yaca5dkMMcVg=;
 b=TQdZkVfCE39qhHazMXZguhbk63TWZSbdvZEkC8PAvCI1EMPYSDVfVjiKbmUPnEYEA+d3+A
 E6xNpWiRTEwwYvaAwVwmcZEOUpW7fWFBZEdsKBQchmL8A+ACe9zSLxgT16B16jB+vvu0/bD+
 mtYgJwkzbgwcxbwcwxe0xpjVvBrblw5kKmRS0W/DHq35bJmZVR3AY3/C38MfLagIvi9/Gc6R
 6NAb3ZonQwT88NmR68fLo8aUYdmF/3OYUl9vNMJG8oJ/ckHDHkevfxabuudqH5FLMW6XkCPQ
 gPzafmNjFgTVd0NoRRmA8Ng/1XYVVz0S7/+WKKlXfWkmQ1orrGYyVH4Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] glibc: fix CVE-2025-8058
Date: Tue, 29 Jul 2025 23:45:52 +0200
Message-Id: <20250729214552.3641582-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 21:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221088

From: Peter Marko <peter.marko@siemens.com>

This is a single commit bump containing only CVE fix
$ git log --oneline cff1042cceec3502269947e96cf7023451af22f3..b027d5b145f1b2908f370bdb96dfe40180d0fcb6
b027d5b145 posix: Fix double-free after allocation failure in regcomp (bug 33185)

Test results didn't change except newly added test succeeding.
(tst-regcomp-bracket-free)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.39.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 6ee9fc7a0b..89e532fd67 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "cff1042cceec3502269947e96cf7023451af22f3"
+SRCREV_glibc ?= "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index c87eb76f41..ff6c8f3b43 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -18,7 +18,7 @@ easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
-    CVE-2025-4802 CVE-2025-5702"
+    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

