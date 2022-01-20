Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECAFC433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 16:55:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14865.1642697699113321993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 08:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: kory.maincent@bootlin.com)
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 158DE240007;
	Thu, 20 Jan 2022 16:54:55 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	alex.kanavin@gmail.com,
	raj.khem@gmail.com
Subject: [OE-core][PATCH v2] icu: fix make_icudata dependencies
Date: Thu, 20 Jan 2022 17:54:55 +0100
Message-Id: <20220120165455.42075-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 16:55:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160772

The make_icudata task is set before the configure task then the
dependencies for this task are not populate yet.

Fixed it by setting the deptask flag to do_populate_sysroot. With this, the
do_populate_sysroot task of each item in DEPENDS must complete before
do_make_icudata can execute.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
Use deptask flag instead of setting manually the task dependencies with
depends flag.

 meta/recipes-support/icu/icu_70.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/icu/icu_70.1.bb b/meta/recipes-support/icu/icu_70.1.bb
index 0988ae8b8e..ff5e249e9d 100644
--- a/meta/recipes-support/icu/icu_70.1.bb
+++ b/meta/recipes-support/icu/icu_70.1.bb
@@ -123,6 +123,9 @@ EXTRA_OECONF:append:libc-musl = " ac_cv_func_strtod_l=no"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[make-icudata] = ",,,"
 
+# Add dependencies to make_icudata
+do_make_icudata[deptask] += "do_populate_sysroot"
+
 do_make_icudata:class-target () {
     ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
     cd ${S}
-- 
2.25.1


