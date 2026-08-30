Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9F4C624A4
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:54 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9457.1788100183424561305
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=iaNlMKd0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20260830142940d062225f6a00020788-es__xi@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260830142940d062225f6a00020788
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1MFyrhowzv77hBhM/3YCJUI/rso4OyTeawAo9wglhOw=;
 b=iaNlMKd03v1Z2Ts6DcrIS7m8zguKmSChUsksoIXcov2fvQwn32Re0Gpw/8mFpbJPAVkXvR
 o0bMzlin1aOIKAOxCbuNFZf3rliEADhbOuHxepx7XaOF1bwLtfcDHgiIm7ppDcglHcGysFYC
 GJCKIeuR3LjO4b+8/MdPYrfmeIoBMXZmfzJ6W0S6h6u68GpGraayXyF+x8RaI089jMTTb8lS
 WZ0gUSJaCFFDtHTCprI/rifcbnn14EC392acj8cIqaUXv4MzOh9W9DCBiiPwyriPhItxiVOJ
 oGouPzHIzWCEEShrv/cTOXXpM4TrqFhyHqCij+nT6Oo/jWfcM0YBNMjA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 01/24] runqemu-extract-sdk: set PSEUDO_INCLUDE_PATHS for the extraction
Date: Sun, 30 Aug 2026 16:28:28 +0200
Message-ID: <20260830142922.17241-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260830142922.17241-1-adrian.freihofer@siemens.com>
References: <20260830142922.17241-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244672

From: Adrian Freihofer <adrian.freihofer@siemens.com>

pseudo inverted its path-matching logic some time ago: when set,
PSEUDO_INCLUDE_PATHS acts as an ownership-tracking allowlist, and
anything outside it silently falls through to real chown()/chmod()
instead of being recorded by pseudo. This script never set it, so an
inherited restrictive value could leave the extracted rootfs with
wrong ownership. Since this script only ever touches SDK_ROOTFS_DIR,
setting PSEUDO_INCLUDE_PATHS to it is enough.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-extract-sdk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 528ef76430..db9813e1dc 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -85,6 +85,8 @@ mkdir -p "$pseudo_state_dir"
 touch "$pseudo_state_dir/pseudo.pid"
 PSEUDO_LOCALSTATEDIR="$pseudo_state_dir"
 export PSEUDO_LOCALSTATEDIR
+PSEUDO_INCLUDE_PATHS="$SDK_ROOTFS_DIR"
+export PSEUDO_INCLUDE_PATHS
 
 echo "Extracting rootfs tarball using pseudo..."
 echo "$PSEUDO $PSEUDO_OPTS tar -C \"$SDK_ROOTFS_DIR\" $TAR_OPTS \"$ROOTFS_TARBALL\""
-- 
2.55.0


