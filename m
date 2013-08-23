Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 637146B115
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:08:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7NI8c6A003675
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2013 14:08:39 -0400 (EDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 23 Aug 2013 11:08:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Aug 2013 14:08:16 -0400
Message-ID: <ff045b68722edebf963a6d5010b582afa5b3c848.1377280429.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377280429.git.bruce.ashfield@windriver.com>
References: <cover.1377280429.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] kern-tools: usability, bug fixes and no guilt
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
X-List-Received-Date: Fri, 23 Aug 2013 18:08:40 -0000
Content-Type: text/plain

Updating the kern-tools SRCREV to pick up the following fixes:

   60a894e kgit-s2q: add proper commit ID handling for mixed am/apply usage
   3b08257 kgit-s2q: delete pruning of path support.
   c5868b4 kgit-s2q: Restore implicit exit status to "git apply" section
   1bd00b9 kgit-scc: mask warnings from cleanup phase 5
   bb75299 kgit-s2q: fix commit warp when running "git am --abort"
   ef9571b kgit-scc: cleanup git rebase-apply dir
   fdb7d21 kgit-scc: ensure treegen stops if a meta series fails
   008987b config: add kconfig cleaning options
   69ff569 kgit-s2q: strip blank lines and comments
   e7b4540 kgit-init: disable garbage collection on a new tree
   417eaed kgit-s2q: delete old LTSI patch dir finding code
   21f2200 kgit-scc: better error checking on resume
   ad5084c kern-tools: use .meta as meta data container
   1deb5d8 kgit-meta: don't push patches without a series file
   eb431a1 kgit-s2q: aid patch reject resolution via helper scripts
   f859c40 kgit-s2q: only use patch annotations when explicitly asked
   333ae18 kgit: speed patch application by batching patches
   bf6991d kgit: teach tools about non-default meta dirs
   bcfc712 kgit-s2q: usability improvements
   cb28803 kgit-s2q: fix patch prefix stripping.
   37f40e1 kgit-s2q: warn/exit with error if patch not in series
   f4704d2 kgit-s2q: consistent rm usage
   e11819c kgit-s2q: standardize on use of git mailinfo
   36a5eda kgit: remove guilt dependency
   c461a4f spp/scc: export mark commands to meta-series
   5311162 updateme: ensure that generated features are only used once
   4f7a263 kgit-checkpoint: clear .gitignore for meta branch
   21ee6f2 updateme: enforce a matching machine
   b08749d kgit-scc: remove -meta files after consruction

These are bug fixes, usability changes as well as the removal of the
guilt dependency. During the uprev of the guilt package, the amount of
circumvention of the typical guilt workflow and checks meant that using
it as a series -> branch manager was no longer appropriate. As a result
a new tools kgit-s2q (series 2 queue) was created based on git-quiltimport,
git am, and the LTSI tree generation scripts.

The result is better series to branch validation, faster application and
a simpler management model. This tool is backwards compatible with any
tree previously constructed with guilt. We are now "guilt free"

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                       |    2 ++
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index d513ad2..fcc00e3 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -262,6 +262,8 @@ python do_kernel_configcheck() {
     # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
     # meta-series for processing
     kmeta = d.getVar( "KMETA", True ) or "meta"
+    if not os.path.exists(kmeta):
+        kmeta = "." + kmeta
 
     pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH', True), "${S}/scripts/util/")
     cmd = d.expand("cd ${S}; kconf_check -config- %s/meta-series ${S} ${B}" % kmeta)
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index c414fed..f6fca9e 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Scripts and utilities for managing Yocto branched kernels."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70cd5f52972f8884b80743d"
 
-DEPENDS = "git-native guilt-native"
+DEPENDS = "git-native"
 
-SRCREV = "fbcdcb8e23c38352b46235598f34d7b345f458f1"
+SRCREV = "60a894e1018ab55f4014fbfb2a56624d26d94504"
 PR = "r12"
-PV = "0.1+git${SRCPV}"
+PV = "0.2+git${SRCPV}"
 
 inherit native
 
-- 
1.7.10.4


