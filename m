Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763E3F3C9B0
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:27:24 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24399.1771950441491616653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=V9UzCoUD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260224162718095eb4fc1400020702-s_okmx@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260224162718095eb4fc1400020702
        for <openembedded-core@lists.openembedded.org>;
        Tue, 24 Feb 2026 17:27:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FaZHUJBvkEaJ7/6o7v+v6ytgTkUA9ZozyLr6UNneZ0U=;
 b=V9UzCoUDtpyzfG4DGW3CHzC+cbIWBFnPeL1PvBu1+TslzMJh/RiRchCZY2Sjxpb2jm5BtZ
 GJNzx0rGqL71e3MuxmSnfouUFYHoFSfGwE+nHOom18sR/fXQvY7xbLegAsvx1Cz0grpRKL4D
 dwM4fJJKL12a+24zon3wY9D0FY3elo8ouiezphcXRxyrqdkVjF5b7pEwfUoZYzhg+CghJo23
 tMn3PBcVyvAakpGDf4uXcGsNp7y2mgpOenINroX0IoiICz6CoNaEegGXynDbeLB9zu7hSw7W
 1ziMYEPuV7dIMO2f1yXaKBreSSr93NxYkxUqyHCTk+G+GGn70xIpuiGA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
Date: Tue, 24 Feb 2026 17:27:15 +0100
Message-Id: <20260224162715.63617-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231876

From: Peter Marko <peter.marko@siemens.com>

Solves 9.1.2148 (in 9.1.2148), see [1].
Drop patch merged upstream.

Release notes for 9.2, see [2].
Note that almost all changes were already present in our 9.1 updates.

[1] https://github.com/vim/vim/security/advisories/GHSA-9w5c-hwr9-hc68
[2] https://www.vim.org/vim-9.2-released.php

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...001-translation-sv-add-missing-mkdir.patch | 52 -------------------
 .../vim/{vim-tiny_9.1.bb => vim-tiny_9.2.bb}  |  0
 meta/recipes-support/vim/vim.inc              |  5 +-
 .../vim/{vim_9.1.bb => vim_9.2.bb}            |  0
 4 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/0001-translation-sv-add-missing-mkdir.patch
 rename meta/recipes-support/vim/{vim-tiny_9.1.bb => vim-tiny_9.2.bb} (100%)
 rename meta/recipes-support/vim/{vim_9.1.bb => vim_9.2.bb} (100%)

diff --git a/meta/recipes-support/vim/files/0001-translation-sv-add-missing-mkdir.patch b/meta/recipes-support/vim/files/0001-translation-sv-add-missing-mkdir.patch
deleted file mode 100644
index 37337c3d9d..0000000000
--- a/meta/recipes-support/vim/files/0001-translation-sv-add-missing-mkdir.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 2dd7e39942f4f7740c3a645148521d3b6b443c41 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 11 Feb 2026 14:39:06 +0000
-Subject: [PATCH] translation(sv): add missing mkdir
-
-The installtutor target doesn't explicitly create the Swedish directory
-that it is going to put files into:
-
-  make[1]: Entering directory 'vim-9.1.2128/src'
-  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91
-  chmod 755 DESTDIR/usr/share/vim/vim91
-  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/en
-  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/en
-  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/sr
-  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/sr
-  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/it
-  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/it
-  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/ru
-  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/ru
-  cp ../runtime/tutor/README* ../runtime/tutor/tutor* DESTDIR/usr/share/vim/vim91/tutor
-  cp ../runtime/tutor/en/* DESTDIR/usr/share/vim/vim91/tutor/en/
-  cp ../runtime/tutor/it/* DESTDIR/usr/share/vim/vim91/tutor/it/
-  cp ../runtime/tutor/ru/* DESTDIR/usr/share/vim/vim91/tutor/ru/
-  cp ../runtime/tutor/sr/* DESTDIR/usr/share/vim/vim91/tutor/sr/
-  cp ../runtime/tutor/sv/* DESTDIR/usr/share/vim/vim91/tutor/sv/
-  cp: target 'DESTDIR/usr/share/vim/vim91/tutor/sv/': No such file or directory
-
-Add the missing dependency on $(DEST_TUTOR)/sv to ensure this directory
-is created.
-
-Upstream-Status: Submitted [https://github.com/vim/vim/pull/19385]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 75d8ff6c1c..b4c31bed60 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -2487,7 +2487,7 @@ installgtutorbin: $(DEST_BIN)
- 	$(INSTALL_DATA) gvimtutor $(DEST_BIN)/$(GVIMNAME)tutor
- 	chmod $(SCRIPTMOD) $(DEST_BIN)/$(GVIMNAME)tutor
- 
--installtutor: $(DEST_RT) $(DEST_TUTOR)/en $(DEST_TUTOR)/it $(DEST_TUTOR)/sr $(DEST_TUTOR)/ru
-+installtutor: $(DEST_RT) $(DEST_TUTOR)/en $(DEST_TUTOR)/it $(DEST_TUTOR)/sr $(DEST_TUTOR)/sv $(DEST_TUTOR)/ru
- 	-$(INSTALL_DATA) $(TUTORSOURCE)/README* $(TUTORSOURCE)/tutor* $(DEST_TUTOR)
- 	-$(INSTALL_DATA) $(TUTORSOURCE)/en/* $(DEST_TUTOR)/en/
- 	-$(INSTALL_DATA) $(TUTORSOURCE)/it/* $(DEST_TUTOR)/it/
--- 
-2.43.0
-
diff --git a/meta/recipes-support/vim/vim-tiny_9.1.bb b/meta/recipes-support/vim/vim-tiny_9.2.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_9.1.bb
rename to meta/recipes-support/vim/vim-tiny_9.2.bb
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7cc122fe4a..73991ef2a8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,11 +16,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
-           file://0001-translation-sv-add-missing-mkdir.patch \
            "
 
-PV .= ".2144"
-SRCREV = "55c12373f073bacfc97d757e8f4da3daf472e4ac"
+PV .= ".0"
+SRCREV = "e7e21018fc0b60c153c8e668f696d95e574cc5a4"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.2.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_9.1.bb
rename to meta/recipes-support/vim/vim_9.2.bb

