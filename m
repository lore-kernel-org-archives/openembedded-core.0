Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78739C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 07:00:27 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4439.1790060425106430505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 00:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=brQyfOWd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202609220700207ad6d3093d00020788-ug0vnb@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202609220700207ad6d3093d00020788
        for <openembedded-core@lists.openembedded.org>;
        Tue, 22 Sep 2026 09:00:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mMI/8ruF+dZYA0KEFS7zKlYToLqXkw1IaWn3/hQgxH8=;
 b=brQyfOWdm9h3/gta8CVzLl0kBfNlewTH7EYUvaYz0P3XXySXJ0WX2TlpaaVlH6WGy1mX+p
 UmoKFDnW864rIM1dhlEY6aBNVlEnmlrN7iIaidRLOt2xBxRRvu04NlzMGptYrin3pJ5Q8UZq
 aXJa8XywWZgOqs+X6C0LucdbiII69jYJClaF1cPkrcrRe56xpSstASmUbr1JkWE5D39J0Q8c
 KSnI3ZitMdXn9OhcpS6cumiIQ+BF2me5Y9Boy597Nw8Py8sgEnUNAMm+NcUGAz0dqUJs3XE+
 yw+rsKAMz2yqQncEjQa3FtjbHMllnn+NSp8g9snNAWVII1D0+5V7PKrg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [wrynose][PATCH] bitbake.conf: pseudo add rootfs-dbg to PSEUDO_INCLUDE_PATHS
Date: Tue, 22 Sep 2026 08:59:49 +0200
Message-ID: <20260922065949.5508-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 07:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246381

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 2dd3a54134c04147a863ada4997edab3e8afc6fa)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 24e095632e..c5f84124f0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -748,7 +748,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo,${WORKDIR}/devtool-deploy-target-stripped"
+PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/rootfs-dbg,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo,${WORKDIR}/devtool-deploy-target-stripped"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"

