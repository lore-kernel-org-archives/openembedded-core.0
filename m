Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0C3C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 23:11:56 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web08.13652.1658877110733093096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 16:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (ip203.trans.bevcomm.net
 [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26QNBldS024605
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 18:11:50 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] elfutils: Microblaze does not support symvers
Date: Tue, 26 Jul 2022 18:11:47 -0500
Message-Id: <20220726231147.3744000-5-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726231147.3744000-1-mark.hatle@kernel.crashing.org>
References: <20220726231147.3744000-1-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 23:11:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168522

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.187.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.187.bb b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
index d03da61353..561112c580 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.187.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
@@ -49,6 +49,9 @@ RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils iprout
 
 EXTRA_OECONF:append:class-target = " --disable-tests-rpath"
 
+# symver functions not currently supported on microblaze
+EXTRA_OECONF:append:class-target:microblaze = " --disable-symbol-versioning"
+
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-dbg glibc-dev"
 INSANE_SKIP:${PN}-ptest = "debug-deps dev-deps"
 
-- 
2.25.1


