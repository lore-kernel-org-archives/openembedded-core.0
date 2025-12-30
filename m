Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845B3E95A74
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 10:56:40 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62165.1767092191521442273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 02:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=WtA3+8IO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2025123010562829a61d70fd000207cb-cwp6x9@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025123010562829a61d70fd000207cb
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 11:56:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4/uGZtJa7jkdDSMv8G1rkybLZZ7loMXMXN0DbUe1m9k=;
 b=WtA3+8IOjqGn0KK+qM13CCAwAQ/ZqIkkuWMS5IB1wqXmfF661MBGf90jJdIhf61/QHEzQW
 RDiWNItad7uOX4XFUNhEQAqg2xQtuzbH9LQFZk5q9ujLmZ0/p4RO4KoZsUYzVshw6jB6OYtT
 WkzUpjjWPIjqD3QPv8DGdXYKTkQCb1x5Y8cgtBUbkb72yIAj6wPVqKvQ05xiCHsNvmRavoeC
 ZNdkp9Uvo39XBufz9zD2sESoiS+HZ+S8dAa6ViUJK/bSF2ytsxHutQqRA8oAhXeccepdWPFY
 Q+1pmMc4j6TART+Wla9XmlElspMY3TSv9fQLDdOxs4Eozc/zIIBDS3xQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 1/4] fragments: add a 'devtool-ide-sdk' fragment
Date: Tue, 30 Dec 2025 11:52:56 +0100
Message-ID: <20251230105607.2615849-2-adrian.freihofer@siemens.com>
In-Reply-To: <20251230105607.2615849-1-adrian.freihofer@siemens.com>
References: <20251230105607.2615849-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 10:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228659

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a configuration fragment that enables devtool ide-sdk workflow
for development and remote debugging.
The configuration is intended to streamline the development workflow
where developers can modify recipes with devtool and debug them
remotely on target devices using IDEs like VSCode.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../conf/fragments/yocto/devtool-ide-sdk.conf | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/conf/fragments/yocto/devtool-ide-sdk.conf

diff --git a/meta/conf/fragments/yocto/devtool-ide-sdk.conf b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
new file mode 100644
index 0000000000..ca0269543b
--- /dev/null
+++ b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
@@ -0,0 +1,26 @@
+BB_CONF_FRAGMENT_SUMMARY = "Use devtool ide-sdk for development and remote debugging."
+BB_CONF_FRAGMENT_DESCRIPTION = "\
+This configuration enables the use of devtool ide-sdk. \
+Example usage: \
+  1. bitbake-config-build enable-fragment core/yocto/devtool-ide-sdk \
+     bitbake-config-build enable-fragment core/yocto/root-login-with-empty-password \
+  2. The recipe (my-recipe in this case) must be in IMAGE_INSTALL. \
+  3. Devtool modify --debug-build my-recipe \
+  4. devtool ide-sdk my-recipe core-image-full-cmdline --target root@192.168.7.2' \
+  5. runqemu snapshot \
+  6. code $BUILDDIR/workspace/sources/my-recipe \
+  7. Develop and debug the sources of my-recipe from VSCode remotely on the device. \
+\
+Optimize build time: with devtool ide-sdk the dbg tar is not needed \
+(if booting the target via NFS is not used for remote debugging) \
+IMAGE_FSTYPES_DEBUGFS = "" \
+"
+
+# Build the companion debug file system
+IMAGE_GEN_DEBUGFS = "1"
+
+# Without copying the binaries into roofs-dbg, GDB does not find all source files.
+IMAGE_CLASSES += "image-combined-dbg"
+
+# Remote debugging needs gdbserver on the target device
+IMAGE_INSTALL:append = " gdbserver"
-- 
2.52.0


