Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276F8D35666
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 02:25:49 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4468.1769567146788246491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 18:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 28 Jan 2026 11:25:44 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.151 with ESMTP; 28 Jan 2026 11:25:44 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] apt: Set gid to nogroup
Date: Wed, 28 Jan 2026 11:25:14 +0900
Message-ID: <20260128022514.3257715-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 02:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230069

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

With no --no-user-group, it tries to assign "_apt" gid which ends up
with an error when using static gid values and "_apt" is not defined in
USERADD_GID_TABLES. Conventionally "_apt" does not have its own gid but
rather uses "nogroup".

| apt was skipped: Recipe apt, package apt: normal groupname "_apt" does not have a static ID defined.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 meta/recipes-devtools/apt/apt_3.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 7f0a38ab29..d2dfe48e9a 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -38,7 +38,7 @@ inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --home /nonexistent --no-create-home _apt"
+USERADD_PARAM:${PN} = "--system --home /nonexistent --no-create-home --no-user-group --gid nogroup _apt"
 
 BBCLASSEXTEND = "native nativesdk"
 

