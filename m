Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 862B177CCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 11:30:15 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id y18so53044644itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 04:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fu/PhYyv9kHMGqGsSwWkbynnM4p7gfNtm5yCWo1OT/8=;
	b=MaH1sXSF2+8bwhDnFnHWewo9pSTz8swvDIwww/XNYaLMVU/njGSL7mAU7sBQCIao02
	ZFMjNVNJnSR1ShrrKf+2Om7e4RqoFrbOpo6z1JrIa+VX5HDxLKEJoTIyvYLZcIf/Zh75
	4VKKYCjZTBIMVGfP1YOFFnprhRarFp0Ix+o6kX0MrLYjgvJH/G28C7o5EOV+fbo6PsY+
	ya8ZKUsR61HOU1+L8hcxB6pzB44/rnhm9cl5IGLrWgvdpZYl/VW57wCUqujAEVuEnPkX
	Wcr8qs1kthwAjvrj1jRVvIWCgaBxpWIS1tl5eCEiCArYLlelj6cMpDqJqszetXbEQ4xM
	CMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fu/PhYyv9kHMGqGsSwWkbynnM4p7gfNtm5yCWo1OT/8=;
	b=ORdsAyM0ZtVsdpTS98eVcf7gxI6q1AX7JIx/aw+iVFdfrhVfBSR6UaK0Pe7tIofzSo
	swgRSd61vu4M1OcYY3E39larO5NqQ45VlR/weIo8k+YEji1amlLUDnga6ln4BtPcIgi4
	89FCsNaz5N6Xtv1qk7XbXYzxDvmc9nOGAYnTExD/KmtbctCeuWTX+R3hILrqmw8HnzQU
	6a79euwYBXp7T54tslm/i3ovlN5yBmQEcVfSxm+tZa1CGPH/SftJauwrRNC6vJZJBRtP
	EcgmMbF8BSbRiVDwR7ibIkG51Uo5lbARQtVzt+ae38DszOMnMdhR9n5MeEuHXBBaeVIi
	dRxA==
X-Gm-Message-State: AFeK/H2XRpd2V+t4A+btXVdADuWmO25sfOUUqtD6NFA4Nd9KyLdUoz4NKHkC2ExCTl0o4rly
X-Received: by 10.36.92.20 with SMTP id q20mr208425itb.49.1490787016375;
	Wed, 29 Mar 2017 04:30:16 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D6D7.dip0.t-ipconnect.de.
	[93.232.214.215]) by smtp.gmail.com with ESMTPSA id
	d196sm3579511ioe.3.2017.03.29.04.30.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Mar 2017 04:30:15 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 13:29:49 +0200
Message-Id: <e9bfdb7e174db5b6436ab126dccf42202dd924b7.1490786957.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.425c03862da4e6657583439f3eb42e3c88fb71ac.1490786957.git-series.patrick.ohly@intel.com>
References: <cover.425c03862da4e6657583439f3eb42e3c88fb71ac.1490786957.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/2] rm_work.bbclass: introduce do_build_without_rm_work
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
X-List-Received-Date: Wed, 29 Mar 2017 11:30:15 -0000

Some classes, for example populate_sdk_ext.bbclass, must be able to
trigger a full build of a recipe without also triggering
do_rm_work. They cannot depend on do_build anymore, because that would
trigger do_rm_work.

Instead, do_build_without_rm_work can be used. It has the exact same
dependencies as do_build, minus do_rm_work and do_rm_work_all.

This may also be useful in a test build of a recipe where one wants
to preserve the work directory without having to modify configuration
settings:
   bitbake foobar:do_build_without_rm_work

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/rm_work.bbclass | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 2490a69..badeaeb 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -121,10 +121,24 @@ rm_work_rootfs () {
 }
 rm_work_rootfs[cleandirs] = "${WORKDIR}/rootfs"
 
-# We have to add the do_rmwork task already now, because all tasks are
+# This task can be used instead of do_build to trigger building
+# without also invoking do_rm_work. It only exists when rm_work.bbclass
+# is active, otherwise do_build needs to be used.
+#
+# The intended usage is
+# ${@ d.getVar('RM_WORK_BUILD_WITHOUT') or 'do_build'}
+# in places that previously used just 'do_build'.
+RM_WORK_BUILD_WITHOUT = "do_build_without_rm_work"
+do_build_without_rm_work () {
+    :
+}
+do_build_without_rm_work[noexec] = "1"
+
+# We have to add these tasks already now, because all tasks are
 # meant to be defined before the RecipeTaskPreProcess event triggers.
 # The inject_rm_work event handler then merely changes task dependencies.
 addtask do_rm_work
+addtask do_build_without_rm_work
 addhandler inject_rm_work
 inject_rm_work[eventmask] = "bb.event.RecipeTaskPreProcess"
 python inject_rm_work() {
@@ -133,6 +147,12 @@ python inject_rm_work() {
     # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
     excludes = (d.getVar("RM_WORK_EXCLUDE") or "").split()
     pn = d.getVar("PN")
+
+    # Determine what do_build depends upon, without including do_build
+    # itself or our own special do_rm_work_all.
+    deps = set(bb.build.preceedtask('do_build', True, d))
+    deps.difference_update(('do_build', 'do_rm_work_all'))
+
     if pn in excludes:
         d.delVarFlag('rm_work_rootfs', 'cleandirs')
         d.delVarFlag('rm_work_populatesdk', 'cleandirs')
@@ -144,8 +164,9 @@ python inject_rm_work() {
         # do_build inherits additional runtime dependencies on
         # other recipes and thus will typically run much later than completion of
         # work in the recipe itself.
-        deps = set(bb.build.preceedtask('do_build', True, d))
-        deps.difference_update(('do_build', 'do_rm_work_all'))
         # In practice, addtask() here merely updates the dependencies.
         bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
+
+    # Always update do_build_without_rm_work dependencies.
+    bb.build.addtask('do_build_without_rm_work', '', ' '.join(deps), d)
 }
-- 
git-series 0.9.1

