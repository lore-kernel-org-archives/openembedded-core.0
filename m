Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8243C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 08:05:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.9223.1635408343155113718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 01:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1mg0Ps-0001Ib-3p; Thu, 28 Oct 2021 10:05:40 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1mg0Pp-0001z9-MV; Thu, 28 Oct 2021 10:05:37 +0200
Received: from ejo by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1mg0Pp-008ynp-Ck; Thu, 28 Oct 2021 10:05:37 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Enrico Jorns <ejo@pengutronix.de>
Subject: [dunfell][PATCH] devtool: fix modify with patches in override
 directories
Date: Thu, 28 Oct 2021 10:05:37 +0200
Message-Id: <20211028080537.2140303-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 08:05:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157578

From: Ross Burton <ross@burtonini.com>

If a recipe applies patches which are in machine-specific override
directories, devtool will fail to fetch the patches that don't match the
default configuration.  For example where there are patches at
qemux86/x86.patch and qemuarm/arm.patch:

SRC_URI = "file://source"
SRC_URI_append_qemuarm = " file://arm.patch"
SRC_URI_append_qemux86 = " file://x86.patch"

The patch apply phase sets OVERRIDES but does not set FILESOVERRIDES, so
it cannot find the patch files as the search path isn't correct.  Fix
this by setting FILESOVERRIDES too.

Also when iterating through the overrides we need to be sure that other
overrides that are used are not enabled, so extend no_overrides instead of
simply appending the current override.

Fixes most but not all of [ YOCTO #14060 ].

(From OE-Core rev: a372cdf8e175423c47faeecc98ad076ee26bbec8)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a35bcc9d164ac038a31356a15a0f61ccdd38be2)
Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/classes/devtool-source.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 280d6009f3..41900e651f 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -199,6 +199,7 @@ python devtool_post_patch() {
             # Run do_patch function with the override applied
             localdata = bb.data.createCopy(d)
             localdata.setVar('OVERRIDES', ':'.join(no_overrides))
+            localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides))
             bb.build.exec_func('do_patch', localdata)
             rm_patches()
             # Now we need to reconcile the dev branch with the no-overrides one
@@ -216,7 +217,8 @@ python devtool_post_patch() {
                 # Reset back to the initial commit on a new branch
                 bb.process.run('git checkout %s -b devtool-override-%s' % (initial_rev, override), cwd=srcsubdir)
                 # Run do_patch function with the override applied
-                localdata.appendVar('OVERRIDES', ':%s' % override)
+                localdata.setVar('OVERRIDES', ':'.join(no_overrides + [override]))
+                localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides + [override]))
                 bb.build.exec_func('do_patch', localdata)
                 rm_patches()
                 # Now we need to reconcile the new branch with the no-overrides one
-- 
2.30.2


