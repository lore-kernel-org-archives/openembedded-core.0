Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523C6C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 17:48:45 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.28894.1739987315593594304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 09:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WHukIFso;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250219174832ca269ea27fa0cb3e4a-cv4iob@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250219174832ca269ea27fa0cb3e4a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 19 Feb 2025 18:48:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xQtzmD6Z74A1pkx7zQk3X3LP3JCZi0rwO71+39GOerw=;
 b=WHukIFso6MXhP58Gxgf+IPbeAki66FZEu+CZPUPjCADqyLGLF9lLjEP9YOCp4jyIXhNE1A
 vYxYqA81VXd0hSOoAYsu3kPBCjT13ldQozMJuxmQXXdnSjjwB1E9wZpJFqR0ho0DBeugZ3nI
 W5W78UOmcsqqmxjNSTa2/K34Ymy1g/MgOLEKjdzfPPdZgAagShYJXnZs8MmjZE7bpjWaHRaq
 pYKj4CS6i1gpRhqCiu/uc3xR0mMT2cdu3Nq8Pg/PkQGt/0hGuVKaKDoInN0o2fDpdwWhKnz7
 NidNo+uSTd+S1KIeQdXdcfHwHhB3UWZq80ffEo4ToW5+tV7BoMpPHbkA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] sassc,libsass: move recipes to oe-core
Date: Wed, 19 Feb 2025 18:47:45 +0100
Message-Id: <20250219174745.3487602-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 17:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211723

From: Peter Marko <peter.marko@siemens.com>

These recipes are now part of oe-core:
https://git.openembedded.org/openembedded-core/commit/?id=0a1d3607da7bb7c586c69cefadf8ade52c7b1987

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/sass/libsass_git.bb | 14 --------------
 meta-oe/recipes-support/sass/sassc_git.bb   | 16 ----------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta-oe/recipes-support/sass/libsass_git.bb
 delete mode 100644 meta-oe/recipes-support/sass/sassc_git.bb

diff --git a/meta-oe/recipes-support/sass/libsass_git.bb b/meta-oe/recipes-support/sass/libsass_git.bb
deleted file mode 100644
index f0824944b9..0000000000
--- a/meta-oe/recipes-support/sass/libsass_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "C/C++ port of the Sass CSS precompiler"
-HOMEPAGE = "http://sass-lang.com/libsass"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
-
-inherit autotools
-
-SRC_URI = "git://github.com/sass/libsass.git;branch=master;protocol=https"
-SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
-PV = "3.6.6"
-
-S = "${WORKDIR}/git"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/sass/sassc_git.bb b/meta-oe/recipes-support/sass/sassc_git.bb
deleted file mode 100644
index 94d69642a7..0000000000
--- a/meta-oe/recipes-support/sass/sassc_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "libsass command line driver "
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2f8a76980411a3f1f1480b141ce06744"
-
-DEPENDS = "libsass"
-
-inherit autotools pkgconfig
-
-SRC_URI = "git://github.com/sass/sassc.git;branch=master;protocol=https"
-SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
-S = "${WORKDIR}/git"
-PV = "3.6.2"
-
-CVE_STATUS[CVE-2022-43357] = "cpe-incorrect: this is CVE for libsass, not sassc wrapper"
-
-BBCLASSEXTEND = "native"

