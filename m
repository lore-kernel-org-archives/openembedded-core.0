Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340C7CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 20:47:06 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.667.1759351615312411717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 13:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=B5j5UXMx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2025100120465164d571ada600020724-k4vzvj@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025100120465164d571ada600020724
        for <openembedded-core@lists.openembedded.org>;
        Wed, 01 Oct 2025 22:46:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BqUpO1WCw+wbH5NdzBDVbQHEAoJh1no4rGNYfZKM7OY=;
 b=B5j5UXMxED8Yjg93xKQOlwVUi+jhEFfX8tzxqfsQSiH4s49nktelBuVCm1A/3tt4BCG/fU
 M41UZBQapVLFEbPjzZ/hDnMbi0GT+1D8zs9jp9D4R+PjJwVrgRH2aqXq3ZADBYdnqRbsxS6D
 6qi0mfGDSqXU53pHB18IKGH4fSkRvbUBOiwIxDkUEkx38utNqE+QAYYQd+CFDgISD7JDskSU
 1vARRN7GQbtyANwjkk28qk+aXXHqh/tk2b/24uh8tuK84G+VP7y/TYp0QhzBL9GvPCRyTrl0
 zeWN17TZ+G8mdNxq+VFBoQZorpA5JoQk0pYQToZeJh2iVLR9PHJqzsaw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] expect: fix native build with GCC 15
Date: Wed,  1 Oct 2025 22:46:38 +0200
Message-ID: <20251001204638.1442908-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 20:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224323

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This does not work for native builds:
  CFLAGS += "-std=gnu17"
The line from native.bbclass gets priority:
  CFLAGS = "${BUILD_CFLAGS}"

From bitbake-getvar -r expect-native CFLAGS
  ...
  append ...poky/meta/recipes-devtools/expect/expect_5.45.4.bb:44
     "-std=gnu17"
  set ...poky/meta/classes-recipe/native.bbclass:44
     "${BUILD_CFLAGS}"
  ...

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index a89b48ef1c3..f1d30d82172 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -41,7 +41,7 @@ S = "${WORKDIR}/${BPN}${PV}"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-CFLAGS += "-std=gnu17"
+CFLAGS:append = " -std=gnu17"
 
 do_install:append() {
     mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
-- 
2.51.0


