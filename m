Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D514C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 01:21:46 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.9584.1684804896896615854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 18:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=nPRQtQWS;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1684804898;
  x=1716340898;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XCnH96HTOemW8dGhqKCae8nJ+SN0tSKGOujlksL5+hQ=;
  b=nPRQtQWSh0WW2ImtoFh5FDsStji317oWe8FXnFS5Csa3MH6Z5zj5WpNv
   dYLp22+NQibOtHyexbRi1+JFUrWmvI13qSsCgj7AJ3hKU9iYLPplNcTjR
   S1XScTsbT3MOU9haoQdE38Vw8k9T328kq+MuiaxcRkyRcTEBk+nwfXSRD
   T8l4eROL+roQWebTD83z0U8qT1tn8V5Oib3rVswUjyQW6G5auVergNqNP
   yqm9AZ0YePtiMSGl1WuyuCPmeBGBwlVQB7VRY5rAoNkEwZ2uCdg9DfU9o
   1yhVljOlBkZzmAuaekezVK2drDyvpduNUh5y+GtwcwynnEP4/G+5FYmIx
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/2] musl: Correct SRC_URI
Date: Tue, 23 May 2023 03:21:30 +0200
Message-ID: <20230523012131.50450-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 01:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181621

When the protocol used to fetch the Git repository was changed from
"git" to "https" in commit 139102a73d (recipes: Default to https git
protocol where possible), the URI was not updated to match.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 19b07d6be9..7c8434f23f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -12,7 +12,7 @@ PV = "${BASEVER}+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-SRC_URI = "git://git.musl-libc.org/musl;branch=master;protocol=https \
+SRC_URI = "git://git.musl-libc.org/git/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
           "

