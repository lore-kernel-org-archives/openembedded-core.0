Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF2473D13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:04:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G24Gk3007094
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:04:16 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:04:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2015 19:04:12 -0700
Message-ID: <784f5cb6f20261634703f3b4d5e09f6ae054b651.1442311946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442311946.git.liezhi.yang@windriver.com>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] multilib.bbclass: install all bits toochains when populate mlprefix SDK
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
X-List-Received-Date: Wed, 16 Sep 2015 02:04:18 -0000
Content-Type: text/plain

Fixed when:
$ bitbake lib32-core-image-minimal  -cpopulate_sdk

Only 32 bit toolchain was installed but there were both
environment-setup-core2-64-poky-linux and
environment-setup-core2-64-pokymllib32-linux in extracted sdk, this was
becase multilib.bbclass mapped TOOLCHAIN_TARGET_TASK into only lib32-
ones, and dropped 64 bit ones. This patches fixes the problem.

[YOCTO #8089]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/multilib.bbclass |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 8f61d8d..465e208 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -94,8 +94,22 @@ python __anonymous () {
         d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
 
     if bb.data.inherits_class('populate_sdk_base', d):
+        orig_task = (d.getVar('TOOLCHAIN_TARGET_TASK', True) or "").split()
+        orig_task_attemptonly = (d.getVar('TOOLCHAIN_TARGET_TASK_ATTEMPTONLY', True) or "").split()
         clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK")
         clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY")
+        # Append original tasks since all bits (such as 32 and 64)
+        # toolchains should be installed when mutilib.
+        task = (d.getVar('TOOLCHAIN_TARGET_TASK', True) or "").split()
+        task_attemptonly = (d.getVar('TOOLCHAIN_TARGET_TASK_ATTEMPTONLY', True) or "").split()
+        for t in orig_task:
+            if t not in task:
+                task.append(t)
+        for t in orig_task_attemptonly:
+            if t not in task_attemptonly:
+                task_attemptonly.append(t)
+        d.setVar("TOOLCHAIN_TARGET_TASK", " ".join(task))
+        d.setVar("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", " ".join(task_attemptonly))
 
     if bb.data.inherits_class('image', d):
         return
-- 
1.7.9.5


