Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2240DC79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 06:37:39 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28899.1788763051702421824
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 23:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=RCqqWCcl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260907063729031ffcf3cf0002073d-mf8ib5@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260907063729031ffcf3cf0002073d
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Sep 2026 08:37:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+VkBOLln7N50XDcExWSaiDHl8S8HyFAp6IcJgrUfoxo=;
 b=RCqqWCclJUSP3MYkpeyCq9ZJZSxgtaCP2hk4p0vmlav3FGMj19Xy3dPFw9slK4Tm548rv2
 CaOQgN2I7HP4hSmWmVIBljkzEd6EQwI+DMmypwoPP2Kzz27CHwW2FLR601O1U8Q2M24RKqc/
 FNnDgIYltJGFHB/yff6gZ6vy01dERQ6VsPKHMHYwcWU4nBfhtQ0avnk3VA5Ec1izSPUnGhxP
 IP2nZ2j84C1TFKc1TjvU98A25Pn4oDgPm8tXTeCfk2aJe1haOLG4sFx21vne3CWfCFe2bKaJ
 xU/tnY75v0LnYPV/DKoxenNHZfNRe1sDoj4n7Bu4aJtWKCMV5LEtPp1Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 7/9] runqemu-export-rootfs: set PSEUDO_INCLUDE_PATHS for unfsd
Date: Mon,  7 Sep 2026 08:36:13 +0200
Message-ID: <20260907063720.56742-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260907063720.56742-1-adrian.freihofer@siemens.com>
References: <20260907063720.56742-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245232

From: Adrian Freihofer <adrian.freihofer@siemens.com>

pseudo inverted its path-matching logic some time ago: when set,
PSEUDO_INCLUDE_PATHS acts as an ownership-tracking allowlist, and
anything outside it silently falls through to real chown()/chmod()
instead of being recorded by pseudo. This script never set it, so an
inherited restrictive value could leave files touched by unfsd on
behalf of NFS clients with wrong ownership. Since this script only
ever touches NFS_EXPORT_DIR, setting PSEUDO_INCLUDE_PATHS to it is
enough.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-export-rootfs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 6a8acd0d5a..150513bc50 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -56,6 +56,8 @@ MOUNTPID=~/.runqemu-sdk/mount$NFS_INSTANCE.pid
 PSEUDO_OPTS="-P $OECORE_NATIVE_SYSROOT/usr"
 PSEUDO_LOCALSTATEDIR="$NFS_EXPORT_DIR/../$(basename $NFS_EXPORT_DIR).pseudo_state"
 export PSEUDO_LOCALSTATEDIR
+PSEUDO_INCLUDE_PATHS="$NFS_EXPORT_DIR"
+export PSEUDO_INCLUDE_PATHS
 
 if [ ! -d "$PSEUDO_LOCALSTATEDIR" ]; then
 	echo "Error: $PSEUDO_LOCALSTATEDIR does not exist."
-- 
2.55.0


