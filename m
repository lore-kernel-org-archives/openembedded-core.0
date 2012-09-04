Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T8scr-0008Pj-20
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:53:05 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84Cecwq008783;
	Tue, 4 Sep 2012 05:40:40 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Sep 2012 08:40:33 -0400
Message-Id: <922e1083ea1a1a2f0d5e8616ea7f0ad2f3d9b2ba.1346762109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346762109.git.bruce.ashfield@windriver.com>
References: <cover.1346762109.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346762109.git.bruce.ashfield@windriver.com>
References: <cover.1346762109.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/6] linux-yocto: fix unapplied patch error message
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 12:53:05 -0000

When patches fail to apply, the status of all pending patches should
be exported to the logs and to the user. Currently, a missing export
of GUILT_BASE makes it look more like an internal error, than a 'normal'
patch failure:

    | [ERROR] unable to complete push
    | pending patches are:
    | Patches directory doesn't exist, try guilt-init

With this variable exported, we have this:

  | [INFO] validating against known patches  (qemux86-standard-meta)
  | error: patch failed: Makefile:2
  | error: Makefile: patch does not apply
  | To force apply this patch, use 'guilt push -f'
  | [ERROR] unable to complete push
  | pending patches are:
  | links/files/0002-makefile-patch.patch

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |    3 ++-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3dcc8b5..45918d6 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -97,7 +97,8 @@ do_patch() {
 	# executes and modifies the source tree as required
 	patchme ${KMACHINE}
 	if [ $? -ne 0 ]; then
-		echo "ERROR. Could not apply updates for ${KMACHINE}"
+		echo "ERROR. Could not apply patches for ${KMACHINE}."
+		echo "       Patch failures can be resolved in the devshell (bitbake -c devshell ${PN})"
 		exit 1
 	fi
 
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e1fc0a3..b560059 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "c82d67d0cf17bc3b499f19667690c56bd00d3ddc"
+SRCREV = "6e92eca3bd30d73222dfeaae6d2d1d9764a5a3f8"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



