Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2665C982DA
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 21:04:29 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36572.1789938265776269278
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 14:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=CckpT0JI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260920210421b3d89e8e410002075e-dpjvrw@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260920210421b3d89e8e410002075e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 20 Sep 2026 23:04:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AYpSgrVhK+8N0bdzQXeCPRnd7O/nh9K6MiscHbHu6S8=;
 b=CckpT0JICPCciEPOptsOK60owDHNihzRMZmvF0vGP5QNf7tmRB+Fchw408jR3hWjw+7i7H
 MZYHazoSc1/W0RcCMHD1J3QPvxyGPI8xa1dl1A6xPVUZ4YRTZxDABRjR1A7C99Pskee3RWVu
 4bny3Tvv225Z+0M0vJHQ8dJUzlyODoT25/An8Z+JtuH5rFF6OFWnC+gCEG4vD+J0gGZYMgrd
 3ZNdLry4bZxZMJ2JPzLew9M9L27GCKg9OhNkeEkeRq12NC01zuYqmLo3gaBlwTqrqUvu+eEw
 nkKNe0bhG4YZ5YSrilu1DMVmLBvRV14KHolR0TWDKBoKZ7XRQUNc4e0Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] bitbake.conf: pseudo add rootfs-dbg to PSEUDO_INCLUDE_PATHS
Date: Sun, 20 Sep 2026 23:04:16 +0200
Message-ID: <20260920210416.623402-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 21:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246269

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a fix for commit 2502da8170 ("bitbake.conf/pseudo: Switch from
exclusion list to inclusion list"), which forgot ${WORKDIR}/rootfs-dbg.

oe/rootfs.py's _setup_dbg_rootfs() builds the debug tree under
${WORKDIR}/rootfs (already included) and only renames it to
${WORKDIR}/rootfs-dbg as the very last step, so the rename itself
doesn't lose anything: pseudo's database is keyed by (device, inode),
not by path. But PSEUDO_INCLUDE_PATHS also gates whether pseudo
intercepts any *later* access made through the new path prefix, and
rootfs-dbg wasn't covered.

That silently broke image-combined-dbg.bbclass's combine_dbg_image(),
which runs under fakeroot in do_image:

  tar -C ${IMAGE_ROOTFS} -cf - . | tar -C ${IMAGE_ROOTFS}-dbg -xf -

The extracting tar's chown() calls into ${IMAGE_ROOTFS}-dbg fell
through to real, unprivileged syscalls instead of being faked by
pseudo, so files copied into rootfs-dbg silently ended up owned by the
build user instead of their correct target ownership.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b289aeab41..f82ee0f039 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -758,7 +758,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo"
+PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/rootfs-dbg,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.55.0


