Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7F97E71DBE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:52:48 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id l66so45065497ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=nYT+z1eZmJ8HonXxjP8c5enLpj+c3Aj6emFIlqdy5VQ=;
	b=f+N8/pNYQ9gYQa/x0wT/TMLFCo7E9Od4dDVPa0FvguZEIjU3Qf+cAAgjyHjIVAl5zi
	dGzpVmZLlOjfQYK1FaEpBbq11IFVqnF2yEDm98zZaUvoicFIreF5/zYdnhIagXNmQVWG
	23KWIl65uCZOhbeMlqVHMBybVx4DWzyb77srl/S76RoATU6Xh4pNmCEo42WbivFzNMFk
	0/r7Y7cnclXIUGC2qcNEpCInxdSVf/7HHGd8ln7FQLbuIMU5e0pDM2WQe4z6JqJ0pK7v
	8DHbQKsulr2DIJ9G/v2I2NRpMagiGM9mTKR0KCdrywPdsXe0JOUmwbWq2i06Uxr7Gqpa
	Gp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=nYT+z1eZmJ8HonXxjP8c5enLpj+c3Aj6emFIlqdy5VQ=;
	b=VN7y7rhbqzyDIk+ZgNigoBtyHawzKhE2pQAD5WVHhXluZETn+vd8TqT3OST+6I8DZr
	JAZ1MitIwKWMS/OQkuwPR3CG3s/j5nKd+WL77+rfIQhbR+Tx0k2wlXM+VrTcB8w5hvnr
	5oUX00XQgpTuu8a5phEJM4oWC4nOwkeS+sZhKXUOdR+1FUrebdKRwvnWnar3UW89DMDC
	B/DlKUtjE3IEkyewYCkONmfHddqCr7+IeHnZdyowEpe378E1OfVjQ5SalzFGmzbH1DSF
	0SQg3z/+w/AJ8bmizcTMEn4oJF8Im/e7rhM2YjmmBKHOSrjxPMdR3p2l+KW43IZqDKij
	405g==
X-Gm-Message-State: AIkVDXKoKrKNvHaVYnmuEHq1YlFYi5lAkf3rB5z1ncilIidGAgKbJ5vGjizOiCQvvvLyEh7a
X-Received: by 10.107.52.204 with SMTP id b195mr6206590ioa.59.1484319168183;
	Fri, 13 Jan 2017 06:52:48 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56056.dip0.t-ipconnect.de.
	[87.165.96.86]) by smtp.gmail.com with ESMTPSA id
	o138sm989394itc.18.2017.01.13.06.52.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 06:52:46 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:52:33 +0100
Message-Id: <ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Fri, 13 Jan 2017 14:52:48 -0000

Having do_rm_work depend on do_build had one major disadvantage:
do_build depends on the do_build of other recipes, to ensure that
runtime dependencies also get built. The effect is that when work on a
recipe is complete and it could get cleaned up, do_rm_work still
doesn't run because it waits for those other recipes, thus leading to
more temporary disk space usage than really needed.

The right solution is to inject do_rm_work before do_build and after
all tasks of the recipe. Achieving that depends on the new bitbake
bb.event.RecipeTaskPreProcess and bb.build.preceedtask().

It can't just run in an anonymous function, because other anonymous
functions that run later may add more tasks. There's still such a
potential conflict when some future RecipeTaskPreProcess event handler
also wants to change task dependencies, but that's not a problem
now. Should it ever occur, the two handlers will have to know about
each other and cooperate to resolve the conflict.

Benchmarking (see "rm_work + pybootchart enhancements" on the OE-core
mailing list) showed that builds with the modified rm_work.bbclass
were both faster (albeit not by much) and required considerably less
disk space (14230MiB instead of 18740MiB for core-image-sato).
Interestingly enough, builds with rm_work.bbclass were also faster
than those without.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/rm_work.bbclass | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 3516c7e..fda7bd6 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -18,9 +18,6 @@ BB_SCHEDULER ?= "completion"
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
@@ -117,7 +107,13 @@ rm_work_rootfs () {
 }
 rm_work_rootfs[cleandirs] = "${WORKDIR}/rootfs"
 
-python () {
+# We have to add the do_rmwork task already now, because all tasks are
+# meant to be defined before the RecipeTaskPreProcess event triggers.
+# The inject_rm_work event handler then merely changes task dependencies.
+addtask do_rm_work
+addhandler inject_rm_work
+inject_rm_work[eventmask] = "bb.event.RecipeTaskPreProcess"
+python inject_rm_work() {
     if bb.data.inherits_class('kernel', d):
         d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN"))
     # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
@@ -126,4 +122,17 @@ python () {
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
+        # In practice, addtask() here merely updates the dependencies.
+        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
 }
-- 
git-series 0.9.1

