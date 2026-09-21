Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DA0C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 21:53:11 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8003.1790027587756770192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 14:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=VmiZZSgk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260921215304a7ef8e0cdd00020753-f0ei1m@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260921215304a7ef8e0cdd00020753
        for <openembedded-core@lists.openembedded.org>;
        Mon, 21 Sep 2026 23:53:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mXwLGJI7efJpy18czynhmrjTOnar0eV4HLHSRw8dZnU=;
 b=VmiZZSgkhIaPJ/4uo6VEYfrLlKbyEcREuvuCxunzp3jZqvk5rLHWpV68qPQ717I+0KbASc
 EhWVtqWltVzfCAThBpKhh5UUhyh84oSLWtouCHY5Z+7rSO3tiu6MLpDz8n7ckTTw1hDyJZoX
 lwWk4ichwkhfDnIFFVaowMNNAL6XBmQzlKYtz45UYYVhrr8TrTmWlavngRcQMz7NwNxQbbEo
 s+k+KrrIJwovEOnvn4f3hc3kGjcgCdM6sB+caROeQx5MtHvjNsChHFIEb8qzJTuWt6XVerFf
 6aESpyPTyh90nvNXKVCPJIxbCJjwHRLYCDQCkmAUau2cEXloGKqTkpAw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] oe-pkgdata-util: use PACKAGE_BASENAME for glob PN-substitution fallback
Date: Mon, 21 Sep 2026 23:50:59 +0200
Message-ID: <20260921215300.582692-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260921215300.582692-1-adrian.freihofer@siemens.com>
References: <20260921215300.582692-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 21:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246364

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Fix the complementary package install logic (oe-pkgdata-util) for
packages which have PACKAGE_BASENAME != PN  (only the kernel).

Add PACKAGE_BASENAME to PKGDATA_VARS so it is recorded in pkgdata like
any other per-package field, and have glob() read it (falling back to
PN, for pkgdata not yet regenerated with the new field) instead of PN
alone.

With this change the kernel -dbg and -src packages are automatically
added to the rootfs-dbg if the kernel is installed in the rootfs.
Removing this kernel packages is possible by
  PACKAGE_EXCLUDE_COMPLEMENTARY += "kernel-*"

Adding the kernel-dbg, -src packges for systems where the kernel is not
installed into the rootfs is possible via IMAGE_INSTALL_DEBUGFS.

Not sure, if there could be a more systaibable fix which would remove
KERNEL_PACKAGE_NAME from the kernel and not need this extra complexity
in the packaging code.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-global/package.bbclass | 2 +-
 scripts/oe-pkgdata-util             | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index e21350a06f..4ead147cd3 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -385,7 +385,7 @@ EXPORT_FUNCTIONS package_name_hook
 
 PKGDESTWORK = "${WORKDIR}/pkgdata"
 
-PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
+PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA PACKAGE_BASENAME pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
 
 python emit_pkgdata() {
     import oe.packagedata
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index acefae24f3..466086f009 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -86,11 +86,16 @@ def glob(args):
                 return os.path.join(args.pkgdata_dir, "runtime", pkgn)
             def readpn(pkgdata_file):
                 pn = ""
+                basename = ""
                 with open(pkgdata_file, 'r') as f:
                     for line in f:
                         if line.startswith("PN:"):
                             pn = line.split(': ')[1].rstrip()
-                return pn
+                        elif line.startswith("PACKAGE_BASENAME:"):
+                            basename = line.split(': ')[1].rstrip()
+                # PACKAGE_BASENAME lets a recipe (e.g. via kernel.bbclass's
+                # KERNEL_PACKAGE_NAME) name its sub-packages differently from PN
+                return basename or pn
             def readrenamed(pkgdata_file):
                 renamed = ""
                 pn = os.path.basename(pkgdata_file)
-- 
2.55.0


