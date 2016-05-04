Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D45ED70178
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:53:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u44HrKBf003321
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 May 2016 10:53:20 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 10:53:20 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 May 2016 13:53:07 -0400
Message-ID: <949388b35200d578e2b67ba7039b65c6261e3621.1462383941.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462383941.git.bruce.ashfield@windriver.com>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] kernel-yocto: allow branch auditing to be suspended
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
X-List-Received-Date: Wed, 04 May 2016 17:53:21 -0000
Content-Type: text/plain

When working on the yocto-bsp and kernel-lab update for yocto 1.2
we found it was impossible for a end-user BSP to isolate patches
on a branch, since with the following commit:

  [kernel-yocto: enforce SRC_URI specified branch]

Any new branch would be switched to whatever was specified on the
SRC_URI and undoing the work that the yocto-bsp tool did to support
board specific patches.

To fix this, we'll keep the enforcing of branch consistency enabled
by default, but introduce a variable "KMETA_AUDIT" that when not
set will skip the check.

There's no impact for existing users, and it is only something that
other plumbing commands and tools will need to use (or care about).

[YOCTO: #9120]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass         | 23 ++++++++++++++---------
 meta/recipes-kernel/linux/linux-yocto.inc |  1 +
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index f86b3ef011a3..a9d42053da01 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -170,15 +170,20 @@ do_patch() {
 		fi
 	fi
 
-        current_branch=`git rev-parse --abbrev-ref HEAD`
-        machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
-        if [ "${current_branch}" != "${machine_branch}" ]; then
-            bbwarn "After meta data application, the kernel tree branch is ${current_branch}. The"
-            bbwarn "SRC_URI specified branch ${machine_branch}. The branch will be forced to ${machine_branch},"
-            bbwarn "but this means the board meta data (.scc files) do not match the SRC_URI specification."
-            bbwarn "The meta data and branch ${machine_branch} should be inspected to ensure the proper"
-            bbwarn "kernel is being built."
-            git checkout -f ${machine_branch}
+        if [ -n "${KMETA_AUDIT}" ]; then
+            current_branch=`git rev-parse --abbrev-ref HEAD`
+            machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
+            if [ "${current_branch}" != "${machine_branch}" ]; then
+                bbwarn "After meta data application, the kernel tree branch is ${current_branch}."
+                bbwarn "The SRC_URI specified branch ${machine_branch}."
+                bbwarn ""
+                bbwarn "The branch will be forced to ${machine_branch}, but this means the board meta data"
+                bbwarn "(.scc files) do not match the SRC_URI specification."
+                bbwarn ""
+                bbwarn "The meta data and branch ${machine_branch} should be inspected to ensure the proper"
+                bbwarn "kernel is being built."
+                git checkout -f ${machine_branch}
+            fi
         fi
 
 	if [ "${machine_srcrev}" != "AUTOINC" ]; then
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 6b161fc064be..bd9157044228 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -35,6 +35,7 @@ SRCREV_FORMAT ?= "meta_machine"
 #   2: report options that are not hardware related, but set by a BSP
 KCONF_AUDIT_LEVEL ?= "1"
 KCONF_BSP_AUDIT_LEVEL ?= "0"
+KMETA_AUDIT ?= "yes"
 
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-- 
2.5.0


