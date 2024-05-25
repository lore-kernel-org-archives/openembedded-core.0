Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FE9C25B79
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 10:49:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.9074.1716634168803042469
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 03:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Uhp6nQ+n;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2024052510492593ba82bc3cc9a7bb1b-4fj9_k@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2024052510492593ba82bc3cc9a7bb1b
        for <openembedded-core@lists.openembedded.org>;
        Sat, 25 May 2024 12:49:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=P1SAoQy8ScH/8JNInLH/IXMPgGwD216yYWe2OG4odpE=;
 b=Uhp6nQ+nv3Ggac1nunlnORib7vB2wFLSwnWanyLlrGJiDlOYzZkecQVJBCFEnMg9mDTgLH
 aVTHrWeXifiHtEDQJ1xj+f1Yj/MtqP+5X/qt3uBiKm1GmenuFlqMAxwGKAJR4qSpmvj+B6kv
 Itxv/PJLYBbJdozniJpD8nIAKq9Q8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 3/6] llvm: Switch to using release tarballs
Date: Sat, 25 May 2024 12:48:35 +0200
Message-Id: <20240525104838.619254-4-peter.marko@siemens.com>
In-Reply-To: <20240525104838.619254-1-peter.marko@siemens.com>
References: <20240525104838.619254-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199874

From: Khem Raj <raj.khem@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

git checkouts are in excess of 3G, which is not
ideal for everyone to download/clone, instead switch to
fetching release tarball which is ~126M as of 18.1.5 release

(From OE-Core rev: 800e6576e4f3af10846af13c2f217f986c1afdb4)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../llvm/{llvm_git.bb => llvm_18.1.5.bb}            | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_git.bb => llvm_18.1.5.bb} (93%)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_18.1.5.bb
similarity index 93%
rename from meta/recipes-devtools/llvm/llvm_git.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.5.bb
index dfaa031012..4b6763e580 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.5.bb
@@ -13,27 +13,26 @@ DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
 RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
-
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.5${VER_SUFFIX}"
+PV .= "${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
-BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "617a15a9eac96088ae5e9134248d8236e34b91b1"
-SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
+SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
+SRC_URI[sha256sum] = "3591a52761a7d390ede51af01ea73abfecc4b1d16445f9d019b67a57edd7de56"
 
-UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
+UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/git/llvm"
+S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 
-- 
2.30.2


