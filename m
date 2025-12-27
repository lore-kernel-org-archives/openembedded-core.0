Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB6BE92715
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 17:23:39 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11033.1766856209782723816
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 09:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=k6tJ6vQS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2025122717232674324d4bca000207b3-wxszra@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025122717232674324d4bca000207b3
        for <openembedded-core@lists.openembedded.org>;
        Sat, 27 Dec 2025 18:23:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=buu+AOW4g4NEbL005+Hq5bXfQGBT9IWSkTo/wWIWLd0=;
 b=k6tJ6vQSKwPiNjSSFwQyKIvZvG3FRqsCq8aX4nghMEmBegzlv3cetzDLP+EmE3zH/aQ9hj
 Yq8j/lQARSck9DZW2xUbNNYv5wDVdANB13RxpAcXoXaa1iXsJX8g5Gjalmb7cOzkVxxk+C84
 oDZfDB15ZE7sDyRRT/6s31JxqL4yy0I3OOFNUPmg7G4TLMYGPgEDG9sRNBnPBksZRJq8+f6N
 6rmyTGFVt1AFnIrYHf2YN4rW/dEuUsni0YN1jeKANhoRib8+7v20D+UzfvUSPhTSzaSahZ9R
 1lfGZUTEegAiUoU3BhVFl5QoESrGC5nQYmSJMM82QSmJ9+chU3npjYPw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] fragments: add a 'devtool-ide-sdk' fragment
Date: Sat, 27 Dec 2025 18:23:01 +0100
Message-ID: <20251227172301.1967831-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 17:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228576

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a configuration fragment that enables devtool ide-sdk workflow
for development and remote debugging.
The configuration is intended to streamline the development workflow
where developers can modify recipes with devtool and debug them
remotely on target devices using IDEs like VSCode.

This also includes the EXTRA_IMAGE_FEATURES from
root-login-with-exmpty-password.conf. Ideally there would be a possibility
to define fragment dependencies, so that this fragment could just depend on
that one instead of duplicating the content here.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../conf/fragments/yocto/devtool-ide-sdk.conf | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/conf/fragments/yocto/devtool-ide-sdk.conf

diff --git a/meta/conf/fragments/yocto/devtool-ide-sdk.conf b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
new file mode 100644
index 0000000000..4e09eb82a5
--- /dev/null
+++ b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
@@ -0,0 +1,32 @@
+BB_CONF_FRAGMENT_SUMMARY = "Use devtool ide-sdk for development and remote debugging."
+BB_CONF_FRAGMENT_DESCRIPTION = "\
+This configuration enables the use of devtool ide-sdk. \
+Example usage: \
+  1. The recipe (my-recipe in this case) must be in IMAGE_INSTALL. \
+  2. Devtool modify --debug-build my-recipe \
+  3. devtool ide-sdk my-recipe core-image-full-cmdline --target root@192.168.7.2' \
+  4. runqemu snapshot \
+  5. code $BUILDDIR/workspace/sources/my-recipe \
+  6. Develop and debug the sources of my-recipe from VSCode remotely on the device. \
+"
+
+# Build the companion debug file system
+IMAGE_GEN_DEBUGFS = "1"
+
+# Optimize build time: with devtool ide-sdk the dbg tar is not needed
+# (if booting the target via NFS is not used for remote debugging)
+IMAGE_FSTYPES_DEBUGFS = ""
+
+# Without copying the binaries into roofs-dbg, GDB does not find all source files.
+IMAGE_CLASSES += "image-combined-dbg"
+
+# SSH is mandatory, no password simplifies the usage
+EXTRA_IMAGE_FEATURES += "\
+   ssh-server-openssh \
+   allow-empty-password \
+   allow-root-login \
+   empty-root-password \
+"
+
+# Remote debugging needs gdbserver on the target device
+IMAGE_INSTALL:append = " gdbserver"
-- 
2.52.0


