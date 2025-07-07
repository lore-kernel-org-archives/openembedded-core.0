Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02519C71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:43:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.3050.1751921017903839407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 13:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=jw2fzy8j;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202507072043327df88392d39f1569df-qg7oua@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202507072043327df88392d39f1569df
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Jul 2025 22:43:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=872UjRtmO0HUCAyXeYMc5eFR/jDnDieaH5zL4+A0iKI=;
 b=jw2fzy8jchoHwYuQC32c2ccF896Ii2rgr+JSt+fCj8Y+g8A5Pa7Snx/s7Q55HxAe1MnZaX
 0c+hMFUjprXIinZJIakLmU2RF6/EizM1WMFoeXhX2YTKJoRMji0aUhIQW4axegNpaWDqQoGo
 lBLowk3XlokHYcK4dHHvrKLlCkhpUMiZK98WJckxLTuh2Vmjo9LPgfCR4VRk0Wkx755kNdk8
 FvCR4PigYayO0fVjCJPmVfcfmBReAfeWQUjWbA5dduiedh6hGI5ZbCIau2STo+AluWGdDz1e
 QjiACKdEQA5ddQuZKiw+GdM9D+d1oYuOdQ3p9S3ctA9mH00mCsPvBU3w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] bitbake.conf: fix pseudo for devtool deploy-target --strip
Date: Mon,  7 Jul 2025 22:42:55 +0200
Message-ID: <20250707204255.2789178-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 20:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219999

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Without this fix:

devtool deploy-target cmake-example qemu1 --strip
...
cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deploy-target-stripped/usr/lib/libcmake-example-lib.so.1.0.0': Operation not permitted
cp: failed to preserve ownership for ...cmake-example/1.0/devtool-deploy-target-stripped/usr/lib/libcmake-example-lib.so.1: Operation not permitted
cp: failed to preserve ownership for ...cmake-example/1.0/devtool-deploy-target-stripped/usr/lib/libcmake-example-lib.so: Operation not permitted
cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deploy-target-stripped/usr/lib': Operation not permitted
cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deploy-target-stripped/usr/bin/cmake-example': Operation not permitted
cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deploy-target-stripped/usr/bin/test-cmake-example': Operation not permitted
cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deploy-target-stripped/usr/bin': Operation not permitted
cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deploy-target-stripped/usr': Operation not permitted
cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deploy-target-stripped': Operation not permitted
tar: ./usr/lib/libcmake-example-lib.so.1.0.0: time stamp 2025-07-06 16:46:06 is 0.527890738 s in the future
tar: ./usr/lib/libcmake-example-lib.so.1: time stamp 2025-07-06 16:46:06 is 0.527462566 s in the future
tar: ./usr/lib/libcmake-example-lib.so: time stamp 2025-07-06 16:46:06 is 0.526732779 s in the future
tar: ./usr/lib: time stamp 2025-07-06 16:46:06 is 0.526415655 s in the future
tar: ./usr/bin/cmake-example: time stamp 2025-07-06 16:46:06 is 0.52568721 s in the future
tar: ./usr/bin/test-cmake-example: time stamp 2025-07-06 16:46:06 is 0.525054415 s in the future
tar: ./usr/bin: time stamp 2025-07-06 16:46:06 is 0.524821739 s in the future
INFO: Successfully deployed .../cmake-example/1.0/devtool-deploy-target-stripped

With this fix:

devtool deploy-target cmake-example qemu1 --strip
...
INFO: Successfully deployed .../cmake-example/1.0/devtool-deploy-target-stripped

This is most probably related to the commit:
  2502da81709f25de499277b28d33c915638c45f6
  bitbake.conf/pseudo: Switch from exclusion list to inclusion list

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b1f8ac5b117..bd186ffeecc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -745,7 +745,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo"
+PSEUDO_INCLUDE_PATHS = "/proc,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo,${WORKDIR}/devtool-deploy-target-stripped"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.49.0


