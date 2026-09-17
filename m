Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAECC982D9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:47 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.642.1789670320606720005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 11:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=nk7eXvBx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260917183838d3ce1a3a04000207f9-g_2z_y@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260917183838d3ce1a3a04000207f9
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Sep 2026 20:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=lbSR9TIPNgfw0SK54GXx83a56iROlharzJesCQQfL0Q=;
 b=nk7eXvBxTr44X99LNQHIus3mp8Y04xoYkAQggrY0YKSoM4MLLv0lrjMg8XGDGdsl0HbQNu
 D3AhorDU9pInrdw6CRW+w9AytAlN/lALEViO/Ig0ReLyJUTWMtdl/vcdHP8DRhKKWpa+5rwG
 ypV67v3WccueedgICqogfwjFGqgPKZP1tVeHbtd1AWglGIhnaBa1IS3aanybqC7COUe0nmNF
 jpeCeEfYcuda95jouf/JmylZN2kfSGBv82UXufXKxv9yUFpec826ro8mSpQo5uBcsNHdWkeq
 Fn26wazzi3vkXY9rFQuhjxwPaPgsuaApHY4ONYoJsRl+mzwyJvgTjFIQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/7] oe-selftest: devtool ide-sdk: enable qemu -d
Date: Thu, 17 Sep 2026 20:37:56 +0200
Message-ID: <20260917183832.998361-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260917183832.998361-1-adrian.freihofer@siemens.com>
References: <20260917183832.998361-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 18:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246086

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Pass "-d" to runqemu for the ide-sdk selftests when oe-selftest's own
logger is at DEBUG level, to get qemu's verbose logging for free when
diagnosing a failure (e.g. slirp hostfwd port allocation) instead of
having to hardcode it on for every run.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 535ffed9f0..490a1d0bf0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3620,7 +3620,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
             self._verify_nfs_launch_json(tempdir_cmake, nfs_rootfs)
             self._verify_nfs_launch_json(tempdir_meson, nfs_rootfs)
 
-            launch_cmd = '%s nographic' % shlex.quote(runqemu_helper)
+            qemu_debug_opt = ' -d' if self.logger.isEnabledFor(logging.DEBUG) else ''
+            launch_cmd = '%s nographic%s' % (shlex.quote(runqemu_helper), qemu_debug_opt)
             runqemuparams = ''
             if slirp:
                 launch_cmd += ' slirp'
@@ -3629,7 +3630,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
                 runqemuparams = 'slirp'
             qemu_cm = runqemu(testimage, runqemuparams=runqemuparams, launch_cmd=launch_cmd)
         else:
-            runqemuparams = "nographic slirp" if slirp else "nographic"
+            qemu_debug_opt = ' -d' if self.logger.isEnabledFor(logging.DEBUG) else ''
+            runqemuparams = ("nographic slirp" if slirp else "nographic") + qemu_debug_opt
             qemu_cm = runqemu(testimage, runqemuparams=runqemuparams)
 
         with qemu_cm as qemu:
-- 
2.55.0


