Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8636CC433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 11:45:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.2567.1643024727086989889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 03:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: kory.maincent@bootlin.com)
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9BCD740006;
	Mon, 24 Jan 2022 11:45:24 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	alex.kanavin@gmail.com,
	raj.khem@gmail.com
Subject: [OE-core][PATCH v3] icu: fix make_icudata dependencies
Date: Mon, 24 Jan 2022 12:45:23 +0100
Message-Id: <20220124114523.26069-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 11:45:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160874

The make_icudata task is set before the configure task then the
dependencies for this task are not populate yet.

Fixed it by adding do_prepare_recipe_sysroot task dependency to the
make_icudata task.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
Use deptask flag instead of setting manually the task dependencies with
depends flag.

Change in v3:
Add do_prepare_recipe_sysroot task dependency in place of using deptask
flags.

 meta/recipes-support/icu/icu_70.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_70.1.bb b/meta/recipes-support/icu/icu_70.1.bb
index 0988ae8b8e..dd684fe5b9 100644
--- a/meta/recipes-support/icu/icu_70.1.bb
+++ b/meta/recipes-support/icu/icu_70.1.bb
@@ -147,4 +147,4 @@ do_make_icudata() {
     :
 }
 
-addtask make_icudata before do_configure after do_patch
+addtask make_icudata before do_configure after do_patch do_prepare_recipe_sysroot
-- 
2.25.1


