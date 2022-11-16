Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4261C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 13:53:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.7279.1668606814844457972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 05:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1ovIr7-0003V6-2h; Wed, 16 Nov 2022 14:53:33 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1ovIr4-004fIb-T1; Wed, 16 Nov 2022 14:53:31 +0100
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1ovIr4-00EFJR-RB; Wed, 16 Nov 2022 14:53:30 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH] sstatesig: emit more helpful error message when not finding sstate manifest
Date: Wed, 16 Nov 2022 14:53:23 +0100
Message-Id: <20221116135323.3395407-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 13:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173385

Since oe-core commit 64b89f3c8fc31842256c482a3039d90d3f12c1cc
("sstatesig.py: make it fatal error when sstate manifest isn't found")
errors like:

| Manifest [..]/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-dbus.populate_sysroot not found in imx8mm_dummy cortexa53-mx8mm cortexa53 armv8a-crc armv8a aarch64 allarch x86_64_x86_64-nativesdk (variant '')?

are fatal now and cannot be ignored but must be debugged.

Unfortunately, the currently emitted error message is a bit imprecise
with telling the reader what has actually gone wrong.

This commit:

* adds the word 'sstate' to the error message to clarify the scope we
  are dealing with ('sstate manifests', since there are other manifests,
  too)
* does not randomly print the last manifest file searched for as THE
  manifest file that could not be found
  Instead, we print the name of the task the sstate was searched for
* adds the word 'multilib' to variant to make clear which variant we are
  talking about
* adds a separate line noting the searched pkgarchs and adds explicitly
  mentions this word ('pkgarchs')
* prints a list of ALL manifest file locations attempted
* removes the '?' at the end of the message since such errors indeed
  leave the question of what is the cause but the error message itself
  is more like a statement.

The result for the exact same issue as noted above then looks as
follows:

| The sstate manifest for task 'dbus:populate_sysroot' (multilib variant '') could not be found.
| The pkgarchs considered were: imx8mm_dummy, cortexa53-mx8mm, cortexa53, armv8a-crc, armv8a, aarch64, allarch, x86_64_x86_64-nativesdk.
| But none of these manifests exists:
|     [..]/tmp/sstate-control/manifest-imx8mm_dummy-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-cortexa53-mx8mm-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-cortexa53-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-armv8a-crc-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-armv8a-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-aarch64-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-allarch-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-dbus.populate_sysroot

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oe/sstatesig.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index aa273df970..bf48aed7e1 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -469,11 +469,15 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         pkgarchs.append('allarch')
         pkgarchs.append('${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}')
 
+    searched_manifests = []
+
     for pkgarch in pkgarchs:
         manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
         if os.path.exists(manifest):
             return manifest, d2
-    bb.fatal("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+        searched_manifests.append(manifest)
+    bb.fatal("The sstate manifest for task '%s:%s' (multilib variant '%s') could not be found.\nThe pkgarchs considered were: %s.\nBut none of these manifests exists:\n    %s"
+            % (taskdata, taskname, variant, d2.expand(", ".join(pkgarchs)),"\n    ".join(searched_manifests)))
     return None, d2
 
 def OEOuthashBasic(path, sigfile, task, d):
-- 
2.30.2


