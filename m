Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20814C6FA86
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:24:26 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.6452.1663849457801816910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1obLFX-00EUzZ-B1; Thu, 22 Sep 2022 15:24:15 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1obLFX-0009hO-8e; Thu, 22 Sep 2022 15:24:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] git-describe.bbclass: add new class for "git describe
 --tags --allways --dirty"
Date: Thu, 22 Sep 2022 15:24:02 +0300
Message-Id: <20220922122402.32710-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220922122402.32710-1-mikko.rapeli@linaro.org>
References: <20220922122402.32710-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20220922122402.32710-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 12:24:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170970

Output from git_describe() function can then be used in various places
and from various git trees to create a user friend(lier) name to builds.
Examples where this could be used is BUILD_ID, SDK_VERSION and
IMAGE_VERSION_SUFFIX.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes/git-describe.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/classes/git-describe.bbclass

diff --git a/meta/classes/git-describe.bbclass b/meta/classes/git-describe.bbclass
new file mode 100644
index 0000000000..3a2b06b3fd
--- /dev/null
+++ b/meta/classes/git-describe.bbclass
@@ -0,0 +1,24 @@
+# Defines a simple function which calls 'git describe --tags --always --dirty'
+# on specified directory and returns the string.
+#
+# Can be used for example to easily generate a BUILD_ID in local.conf if
+# TOPDIR build directory is under the main git tree for the project:
+# INHERIT += "git-describe"
+# BUILD_ID = "${@git_describe("${TOPDIR}/../meta-mylayer", d)}"
+# # BUILD_ID to /etc/os-release
+# OS_RELEASE_FIELDS:append:pn-os-release = " BUILD_ID"
+# # Add os-release to all images
+# IMAGE_INSTALL:append = " os-release"
+# # BUILD_ID to image file name
+# IMAGE_VERSION_SUFFIX = "-${BUILD_ID}"
+# # BUILD_ID to SDK file names and paths
+# SDK_VERSION = "${BUILD_ID}"
+
+def git_describe(p, d):
+    import bb.process
+    try:
+        describe, _ = bb.process.run('git describe --tags --always --dirty', cwd=p)
+    except bb.process.ExecutionError:
+        describe = ''
+    return describe.strip()
+
-- 
2.17.1


