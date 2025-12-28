Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951F5D3B7E5
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 18:09:56 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29082.1766945391865248844
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Dec 2025 10:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=KDmjBSH+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20251228180948eac5dae7de0002074d-n6lxy5@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251228180948eac5dae7de0002074d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 28 Dec 2025 19:09:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=GNobPU3cHY3TnMiiVvcwA8h5YraTCUxyoB3QXryLg6k=;
 b=KDmjBSH+D74r3In8O6Nmspks7Zo2Pld2zbul1meEqL7XOyJWdLQBn/8AgJrl7Kuixi7+Lu
 ZkMxNkhYcM7yITAmGrEtIEdedv5BerxglhtEhkYeE3pckh+9gTk/eu8Bu1Gb1gDQu7G2hGsW
 KuloX5uvznMvmYKWVymMaH/m59OotThNRfDWru68TYKX9ugV9tCSOMDypX4YZMSkXcBRXTmL
 hL8iz76ybineJWuaO3umMv5Cu3W4LZ3RaEpaJVzOOObzYMVWQgABOEK/+faA3uTG50TrvFWf
 +PtNnCrFtddJCdtQJqOgWI6U/z1nrCTZHknE/SCuRcdnxE8f3wJqwgXw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/3] fragments: add a 'devtool-ide-sdk' fragment
Date: Sun, 28 Dec 2025 19:08:31 +0100
Message-ID: <20251228180935.2077478-2-adrian.freihofer@siemens.com>
In-Reply-To: <20251228180935.2077478-1-adrian.freihofer@siemens.com>
References: <20251228180935.2077478-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 18:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228589

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
index 0000000000..9b4b57f009
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
+# Remote debugging needs gdbserver on the target device
+IMAGE_INSTALL:append = " gdbserver"
-- 
2.52.0


