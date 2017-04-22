Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF3660248
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Apr 2017 04:36:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3M4a1nY026398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 21 Apr 2017 21:36:02 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Apr 2017 21:36:01 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Apr 2017 00:36:00 -0400
Message-ID: <1492835760-32583-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-yocto/kern-tools: fix do_validate_branches clean stage
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
X-List-Received-Date: Sat, 22 Apr 2017 04:36:04 -0000
Content-Type: text/plain

It was reported that do_validate_branches was failing with the following
error:

  Log data follows:
  | DEBUG: Executing shell function do_validate_branches
  | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
  | mkdir: cannot create directory .: File exists
  |
  | [ERROR] Can't find patch dir at ./patches/standard/base
  | usage: kgit s2q
  | WARNING: exit code 1 from a shell command.
  | ERROR: Function failed: do_validate_branches

This was triggered by the execution of 'kgit-s2q --clean' after forcing
the SRCREV to something other than the tip of the branch. --clean is
being run to remove any sentinel files from previous kernel builds to
ensure that the tree is in a consistent state.

There were two bugs, --clean was being executed and not exiting the
script as it was supposed to. Hence validation for applying patches
was done, and threw the error that eventually makes it to the console.

And the second bug is that since do_validate_branches actually calls
kgit-s2q --clean, the dependency on kern-tools-native needs to be on
that function (versus do_kernel_metadata which runs later).

With the tweaked kern-tool + the dependency fix, we no longer see this
error.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                       | 2 +-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 0330270d3fea..96c06ef5d68e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -254,7 +254,7 @@ do_kernel_checkout[dirs] = "${S}"
 
 addtask kernel_checkout before do_kernel_metadata after do_unpack
 addtask kernel_metadata after do_validate_branches do_unpack before do_patch
-do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
+do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
 
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 03f8ce3cc253..5e65469a69ca 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "5deada879404820db146685729e89ba0887fc0ee"
+SRCREV = "bd7447cd6274d764a129dcdc246cdbfd8c47b991"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


