Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F8BC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 14:32:47 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.12543.1642689165850605363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 06:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: kory.maincent@bootlin.com)
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9717E40005;
	Thu, 20 Jan 2022 14:32:43 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	alex.kanavin@gmail.com,
	raj.khem@gmail.com
Subject: [OE-core][PATCH] icu: fix make_icudata dependencies
Date: Thu, 20 Jan 2022 15:32:42 +0100
Message-Id: <20220120143242.35930-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 14:32:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160761

The make_icudata task is set before the configure task then the
dependencies for this task are not populate yet.

Fixed it by setting autoconf, automake and ccache native dependencies
to this task.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 meta/recipes-support/icu/icu_70.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-support/icu/icu_70.1.bb b/meta/recipes-support/icu/icu_70.1.bb
index 0988ae8b8e..ae985bca4f 100644
--- a/meta/recipes-support/icu/icu_70.1.bb
+++ b/meta/recipes-support/icu/icu_70.1.bb
@@ -123,6 +123,14 @@ EXTRA_OECONF:append:libc-musl = " ac_cv_func_strtod_l=no"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[make-icudata] = ",,,"
 
+# Add dependencies to make_icudata
+do_make_icudata[depends] = "autoconf-native:do_populate_sysroot automake-native:do_populate_sysroot"
+python() {
+    if not (bb.data.inherits_class("native", d) or
+            bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
+        d.appendVarFlag('do_make_icudata', 'depends', ' ccache-native:do_populate_sysroot')
+}
+
 do_make_icudata:class-target () {
     ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
     cd ${S}
-- 
2.25.1


