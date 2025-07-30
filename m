Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3FFC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 22:10:44 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.48085.1753913440619407876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 15:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=aPrvai2e;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250730221038688709f84d9f860876-zfq5pn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250730221038688709f84d9f860876
        for <openembedded-core@lists.openembedded.org>;
        Thu, 31 Jul 2025 00:10:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3BRdHeWVKHF4IaFXxYR/yrp6mzYmM/JmADcGrJpZo4w=;
 b=aPrvai2eUGQ9t8XTzRLFBY3IXQBzyxpa8AVLPah3+ZAdbJbeVet5j08OOOPkD0XEN3JONv
 SCJM+ibOhGtZWUSVt8mCHRCsbsvH21KN3rTjJ8DNhmRgnyrWHKexxde9jeojwGXpld4VTtet
 GxzY7e0Qdo/hsup4lWzL9D4ecOdLzhgkAuxhFdX0H4T6tXE89joCbGB4p2yHT3T3r4dqbMPy
 jPGUgZAzAITqQNTy9JLN22hRfW3BiK31ugWfQ31Tnke8E/BFIGXAqajCK9NMSLrLKezlC9D+
 djDhx6QaLG3EwElmUEtOYMfkSLRCO31kviMkpLEYRNk/QAd32+0I2FRg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] glibc: stable 2.35 branch updates
Date: Thu, 31 Jul 2025 00:09:52 +0200
Message-Id: <20250730220952.14457-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 22:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221172

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline 6e489c17f827317bcf8544efefa65f13b5a079dc..e7c419a2957590fb657900fc92a89708f41abd9d
e7c419a295 (origin/release/2.41/master, release/2.41/master) iconv: iconv -o should not create executable files (bug 33164)
1e16d0096d posix: Fix double-free after allocation failure in regcomp (bug 33185)

Add CVE-2025-8058 to CVE ignore list as this is (bug 33185) commit.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.41.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a2cfd0f308..881a9cce2c 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
+SRCREV_glibc ?= "e7c419a2957590fb657900fc92a89708f41abd9d"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 7ddf7f9127..8a65e8ce9f 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745 CVE-2025-8058"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

