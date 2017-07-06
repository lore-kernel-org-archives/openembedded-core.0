Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 75CCC77805
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 15:47:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v66FlQmq032524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 6 Jul 2017 16:47:28 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dT902-0003Od-MR; Thu, 06 Jul 2017 16:47:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 16:47:22 +0100
Message-Id: <1499356042-13015-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 06 Jul 2017 16:47:28 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] base: Add MultiConfigParsed handler to deal with unstable build signatures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jul 2017 15:47:30 -0000

This uses the newly added MultiConfigParsed event to handle problems where
checksums in multiconfig build were not fuctioning as expected.

The issue arises around SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS which contains
entries like:

* gcc-cross-${TARGET_ARCH}->virtual/${TARGET_PREFIX}libc-for-gcc
* gcc-cross-${TARGET_ARCH}->linux-libc-headers

These need to be expanded in the multiconfig data store but then placed
into the shared main datastore used by the siggen code. The only other
alternative would be a siggen instance for each multiconfig however that
seemed even more complex and invasive.

In real world usage, this issue would mean a qemux86 base config with
other armv5 and armv7 configs (e.g. beaglebone and qemuarm) would
try and build gcc-cross twice since dependencies normaly excluded
(e.g. linux-libc-headers) would now be included. This breaks sstate reuse
as well as breaking builds unless separate tmpdirs are used.

This patch adds all the entries for each multiconfig. Whilst there may
be duplicates, this shouldn't be an issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3762c8a..27a28b8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -220,7 +220,7 @@ def buildcfg_neededvars(d):
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
 addhandler base_eventhandler
-base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete bb.event.RecipeParsed"
+base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete bb.event.RecipeParsed"
 python base_eventhandler() {
     import bb.runqueue
 
@@ -235,6 +235,16 @@ python base_eventhandler() {
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
 
+    if isinstance(e, bb.event.MultiConfigParsed):
+        # We need to expand SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in each of the multiconfig data stores
+        # own contexts so the variables get expanded correctly for that arch, then inject back into
+        # the main data store.
+        deps = []
+        for config in e.mcdata:
+            deps.append(e.mcdata[config].getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS"))
+        deps = " ".join(deps)
+        e.mcdata[''].setVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", deps)
+
     if isinstance(e, bb.event.BuildStarted):
         localdata = bb.data.createCopy(e.data)
         statuslines = []
-- 
2.7.4


