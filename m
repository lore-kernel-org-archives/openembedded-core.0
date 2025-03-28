Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541C5C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 18:06:50 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.904.1743185200884362429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 11:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=B7dE/Lep;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250328180637b0c841f311b3c15f0e-dlibne@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250328180637b0c841f311b3c15f0e
        for <openembedded-core@lists.openembedded.org>;
        Fri, 28 Mar 2025 19:06:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kvXn/HJJAf4WHsduiUH6Mp2aGYCCzjetZAU9J2793nI=;
 b=B7dE/Lep/N06Sr8AJBsVK9ifyCYgu9NTDLCrD+dyzIIanYr/t/xN1nDyhRVYMHekKOPHhG
 2C2reKc/jKQv3d7RaNgWvZGo27FExlon0zJ8SjnEZ6HX+FqQaCMQqwl5AK1Y71DX8SJZ13C5
 l7t/lmMlRu8jE9j8FQLFa+g23V5883uNjnOgc97w3omIii9feLI0KoEbHYbt/8CGpIbh6vrC
 FBM41XuDDn/akvHIATFAuUBsgZewfcvH778xsQnKQRfAxNGFmWn4oOTASzZJD1TKpzV1uAmF
 hBX1rI2QZNJMDdf5kmlFRfuaDe8NkFHzgj2MhHjEUrK0X0T1T71KXyCQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] perl: ignore CVE-2023-47038
Date: Fri, 28 Mar 2025 19:05:50 +0100
Message-Id: <20250328180550.19979-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 18:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213862

From: Peter Marko <peter.marko@siemens.com>

Fix for this CVE was backported to 5.34.2 in
https://github.com/Perl/perl5/commit/12c313ce49b36160a7ca2e9b07ad5bd92ee4a010

This commit is listed in
https://security-tracker.debian.org/tracker/CVE-2023-47038

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/perl/perl_5.34.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
index 215990c8fa..ed3518b62d 100644
--- a/meta/recipes-devtools/perl/perl_5.34.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -50,6 +50,8 @@ export ENC2XS_NO_COMMENTS = "1"
 
 # Duplicate of CVE-2023-47038, which has already been patched as of perl_5.34.3
 CVE_CHECK_IGNORE:append = " CVE-2023-47100"
+# This is fixed in 5.34.2 via https://github.com/Perl/perl5/commit/12c313ce49b36160a7ca2e9b07ad5bd92ee4a010
+CVE_CHECK_IGNORE:append = " CVE-2023-47038"
 
 do_configure:prepend() {
     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}

