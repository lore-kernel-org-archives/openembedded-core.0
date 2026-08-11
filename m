Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7398FC5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:44:59 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55656.1786459455185351792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 07:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alessandro.zini@siemens.com header.s=fm2 header.b=RdCigj0p;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1327013-202608111434077b15145e1600020794-afvx9k@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202608111434077b15145e1600020794
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Aug 2026 16:34:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wqGKe4YA6M9Fp62ctQ2HV7brwAM9KPdnxaDftFNbNMc=;
 b=RdCigj0pSNgaVegjb9i78dLpwxJ1KXdxVgAykuTjQTCUQ9yDlcPpw00rx8yVbFpS9J5vtv
 qPOHNQu00yKPwxcY96ntBaWBhBupdCtTGjMNnZOn8cEMXnFcud85jKiO0SPGgkBzL0xa3oyY
 OMfDfqTWrCqxFYHlDgLwxO6XFYHgIzJ/MR8o3mnnThpnVkt3gYPHk9a1ydBQgmzTq5c7h97G
 jZTuwGmHnkpzt2kjrNyknQq6CDC/7HgGG1r1rLy3i7vIQMZha6kYQeI7Gidw9VvzOjnqy8lp
 Gb3imkI5UqVVhe4Yx0uQa1/S5kDejP2ya7iUbpD4drTCa5ehqvt9dLZQ==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alessandro Zini <alessandro.zini@siemens.com>
Subject: [OE-core][PATCH] toolchain-scripts: fix tree env script restoring caller's cwd
Date: Tue, 11 Aug 2026 16:33:43 +0200
Message-ID: <20260811143343.36011-1-alessandro.zini@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 14:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243210

Backticks inside double quotes are expanded at build time, so the
generated script always cd's back to COREBASE rather than to the
directory the user was in when they sourced the script.

Replace with a (correctly escaped) $(pwd).

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index ab526c31f6..a4e8d3aa9b 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -96,7 +96,7 @@ toolchain_create_tree_env_script () {
 	touch $script
 	echo 'standalone_sysroot_target="${STAGING_DIR}/${MACHINE}"' >> $script
 	echo 'standalone_sysroot_native="${STAGING_DIR}/${BUILD_ARCH}"' >> $script
-	echo "orig=`pwd`; cd ${COREBASE}; set ${TOPDIR} $bitbakedir; . ./oe-init-build-env; cd \$orig" >> $script
+	echo "orig=\$(pwd); cd ${COREBASE}; set ${TOPDIR} $bitbakedir; . ./oe-init-build-env; cd \$orig" >> $script
 	echo 'export PATH=$standalone_sysroot_native/${bindir_native}:$standalone_sysroot_native/${bindir_native}/${TARGET_SYS}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$standalone_sysroot_target' >> $script
 	echo 'export PKG_CONFIG_PATH=$standalone_sysroot_target'"$libdir"'/pkgconfig:$standalone_sysroot_target'"$prefix"'/share/pkgconfig' >> $script
-- 
2.55.0


