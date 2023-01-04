Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF832C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:47:32 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.10064.1672832842495272297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH 2/2] harfbuzz: remove bindir only if it exists
Date: Wed, 4 Jan 2023 12:45:55 +0100
Message-ID: <20230104114555.575278-2-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104114555.575278-1-kubiznak@2n.com>
References: <20230104114555.575278-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail05w.axis.com
 (10.20.40.11)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175466

In some scenarios (e.g. when "glib" removed from PACKAGECONFIG),
"${D}${bindir}" might not exist which caused `rmdir` to fail.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb
index f56403d428..26692d4e13 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb
@@ -30,9 +30,9 @@ PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
 LEAD_SONAME = "libharfbuzz.so"
 
 do_install:append() {
-    # If no tools are installed due to PACKAGECONFIG then this directory is
-    #still installed, so remove it to stop packaging wanings.
-    rmdir --ignore-fail-on-non-empty ${D}${bindir}
+    # If no tools are installed due to PACKAGECONFIG then this directory might
+    # still be installed, so remove it to stop packaging warnings.
+    [ ! -d ${D}${bindir} ] || rmdir --ignore-fail-on-non-empty ${D}${bindir}
 }
 
 FILES:${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
-- 
2.30.2


