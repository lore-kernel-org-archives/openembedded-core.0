Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id A83E271A17
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 10:01:05 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id x2so12421729itf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 02:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YRdrub6kMB663Ds7BtecACmLK+dRV4Au+MoKq6kbh6E=;
	b=Rk3rURyAsRi9AGPDwTZyzbvHGz0iJi1NgOT14cQfMzjRH9VRm4RjBrXpk2VdOOHEoV
	ltvyltuchVnf3osNggtu//BlHaZcU/wLkfejXX6iCH5FCYaCwRL4+7UHvTk9GJcdcj5V
	wJBvYjWDcVIe0neoJ4xDIsvBfSsThJ9PJIkXeZrO9IKLW87xfLf7QAYdZavs75YKZWos
	9j8mKbfKjRnN5c3g9ZYSujaJb0ZMRDsbUwCTXI0ktuYMevg/or9XDiJAhyQvsR78Z5fK
	mFCRW3BT4cMAENB8Ll+IwAHa1xbUbjZiPXt/yd0gjTlTJevIsfJdPW9oh3r+2yxvKt52
	SHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YRdrub6kMB663Ds7BtecACmLK+dRV4Au+MoKq6kbh6E=;
	b=fPc7KQ4Z7C0TAjk2b9cC/zqFMpbXh2bWlCsBEnw+zna0csfnGI2UrqrV3tPYpz0/w6
	yTYu26fbBxt/aJTuTn48AwiK0S2C/Pf7OxQPDcIeT47neWM1j8FdBBZnE4i0EpwQw7KH
	JZAM3rcy9EdDn2SeRSINqZNryvM9hoI0EM4HXqU08H4Lnb5acEsyGakml4M1e0rc0cGT
	1oTwLZC20uX5WYqM4B4Codke9Ck6C7Te8vWur14BjFIdxsYeY1USIhDn4dopp5Z98qUs
	lHZT+UnOLFNyvvsmjCh3ErIhf3k2EK2S8kIJtQPfGcVMRTErYDstSle/XZTH5fKX8v3e
	+BfA==
X-Gm-Message-State: AIkVDXI5RLwt/IX5lyUk33WMAR18Lf8OoleIx1fobMjKtoQ43Cl+SdqC42jpKOL0GmFI2TqG
X-Received: by 10.36.170.68 with SMTP id y4mr1710597iti.7.1483696520690;
	Fri, 06 Jan 2017 01:55:20 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F5BD.dip0.t-ipconnect.de.
	[93.232.245.189]) by smtp.gmail.com with ESMTPSA id
	m128sm1157680itm.16.2017.01.06.01.55.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Jan 2017 01:55:19 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2017 10:55:03 +0100
Message-Id: <6787329b6c24642352cd015ae22b5dfa579ca010.1483696378.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1483696378.git.patrick.ohly@intel.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
Subject: [PATCH 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Fri, 06 Jan 2017 10:01:05 -0000

Having do_rm_work depend on do_build had one major disadvantage:
do_build depends on the do_build of other recipes, to ensure that
runtime dependencies also get built. The effect is that when work on a
recipe is complete and it could get cleaned up, do_rm_work still
doesn't run because it waits for those other recipes, thus leading to
more temporary disk space usage than really needed.

The right solution is to inject do_rm_work before do_build and after
all tasks of the recipe. Achieving that depends on the new bitbake
support for prioritizing anonymous functions to ensure that
rm_work.bbclass gets to see a full set of existing tasks when adding
its own one. This is relevant, for example, for do_analyseimage in
meta-security-isafw's isafw.bbclass.

In addition, the new "rm_work" scheduler is used by default. It
prioritizes finishing recipes over continuing with the more
important recipes (with "importance" determined by the number of
reverse-dependencies).

Benchmarking (see "rm_work + pybootchart enhancements" on the OE-core
mailing list) showed that builds with the modified rm_work.bbclass
were both faster (albeit not by much) and required considerably less
disk space (14230MiB instead of 18740MiB for core-image-sato).
Interestingly enough, builds with rm_work.bbclass were also faster
than those without.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/rm_work.bbclass | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 3516c7e..1205104 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -11,16 +11,13 @@
 # RM_WORK_EXCLUDE += "icu-native icu busybox"
 #
 
-# Use the completion scheduler by default when rm_work is active
+# Use the dedicated rm_work scheduler by default when rm_work is active
 # to try and reduce disk usage
-BB_SCHEDULER ?= "completion"
+BB_SCHEDULER ?= "rm_work"
 
 # Run the rm_work task in the idle scheduling class
 BB_TASK_IONICE_LEVEL_task-rm_work = "3.0"
 
-RMWORK_ORIG_TASK := "${BB_DEFAULT_TASK}"
-BB_DEFAULT_TASK = "rm_work_all"
-
 do_rm_work () {
     # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
     for p in ${RM_WORK_EXCLUDE}; do
@@ -97,13 +94,6 @@ do_rm_work () {
         rm -f $i
     done
 }
-addtask rm_work after do_${RMWORK_ORIG_TASK}
-
-do_rm_work_all () {
-    :
-}
-do_rm_work_all[recrdeptask] = "do_rm_work"
-addtask rm_work_all after do_rm_work
 
 do_populate_sdk[postfuncs] += "rm_work_populatesdk"
 rm_work_populatesdk () {
@@ -117,7 +107,7 @@ rm_work_rootfs () {
 }
 rm_work_rootfs[cleandirs] = "${WORKDIR}/rootfs"
 
-python () {
+python __anonymous_rm_work() {
     if bb.data.inherits_class('kernel', d):
         d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN"))
     # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
@@ -126,4 +116,19 @@ python () {
     if pn in excludes:
         d.delVarFlag('rm_work_rootfs', 'cleandirs')
         d.delVarFlag('rm_work_populatesdk', 'cleandirs')
+    else:
+        # Inject do_rm_work into the tasks of the current recipe such that do_build
+        # depends on it and that it runs after all other tasks that block do_build,
+        # i.e. after all work on the current recipe is done. The reason for taking
+        # this approach instead of making do_rm_work depend on do_build is that
+        # do_build inherits additional runtime dependencies on
+        # other recipes and thus will typically run much later than completion of
+        # work in the recipe itself.
+        deps = bb.build.preceedtask('do_build', True, d)
+        if 'do_build' in deps:
+            deps.remove('do_build')
+        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
 }
+# Higher priority than the normal 100, and thus we run after other
+# classes like package_rpm.bbclass which also add custom tasks.
+__anonymous_rm_work[__anonprio] = "1000"
-- 
2.1.4


