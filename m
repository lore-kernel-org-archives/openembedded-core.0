Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950EBC25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 21:31:03 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.27669.1716067852235802047
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 14:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=d+NIcwEJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20240518213049cef8b2456f23761b4a-s7qwsv@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240518213049cef8b2456f23761b4a
        for <openembedded-core@lists.openembedded.org>;
        Sat, 18 May 2024 23:30:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FFOYoNrsKHH/QXGmOSulJHe/y/RBePKRbaGYTEDNTdI=;
 b=d+NIcwEJ0EmXXeQYR76UAoyxD2Aqe0FO5UCG/UJCopZMuEke1VdkWfsDgPIub9MHwlpHDd
 Pu9q6posmuEv4W4jSCgGe9ePYmdq4Yd0z0k6CknwmNAPlgHD7hNSTBT26UfZMwLzr9KZ23bv
 BToWKW3qeRrdHHiMSLj2XbRsppEVU=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] ncurses: switch to new mirror
Date: Sat, 18 May 2024 23:29:53 +0200
Message-Id: <20240518212954.788524-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 21:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199538

From: Peter Marko <peter.marko@siemens.com>

github.com/mirror/ncurses is not updated for over a year.
Switch to new mirror from Thomas Dickey (ncurses maintainer).

Sources are identical.

Updated upstream check regex by:
* changed dot to underscore as this repo is tagged like this
* added v prefix to not propose updates to some old tags
* removed third part to not propose updates to development snapshots

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/ncurses/ncurses.inc    | 2 +-
 meta/recipes-core/ncurses/ncurses_6.4.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 761b6a3d31..3b72f3efdd 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "git://github.com/mirror/ncurses.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master"
 
 EXTRA_AUTORECONF = "-I m4"
 
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 97130c06d6..61558ecfa8 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -10,10 +10,10 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://CVE-2023-45918.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
+SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+_\d+)$"
 
 # This is needed when using patchlevel versions like 6.1+20181013
 #CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.30.2


