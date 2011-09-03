Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QzgbJ-00054u-Vn
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 05:08:58 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8333sL9012398;
	Fri, 2 Sep 2011 20:03:55 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  2 Sep 2011 23:03:24 -0400
Message-Id: <9aa500528701813afab7d3860c9d242840120178.1315017994.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1315017994.git.bruce.ashfield@windriver.com>
References: <cover.1315017994.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1315017994.git.bruce.ashfield@windriver.com>
References: <cover.1315017994.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: generalize kernel config search pattern
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Sep 2011 03:08:58 -0000

After constructing a kernel configuration file it then needs
to be located in the tree so it can be audited against the
final .config. The previous string that was used for the search
pattern contains the kernel version. If the recipe space kernel
version and internal tree version are out of sync, this will
cause the constructed config to not be found. By removing the
version from the search string, we can still find out config and
gracefully adapt to minor version skew.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index daaee50..0f92267 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -105,7 +105,7 @@ python do_kernel_configcheck() {
     bb.plain("NOTE: validating kernel configuration")
 
     pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, True)
-    cmd = bb.data.expand("cd ${B}/..; kconf_check -${LINUX_KERNEL_TYPE}-config-${LINUX_VERSION} ${B} ${S} ${B} ${KBRANCH}",d )
+    cmd = bb.data.expand("cd ${B}/..; kconf_check -${LINUX_KERNEL_TYPE}-config- ${B} ${S} ${B} ${KBRANCH}",d )
     ret, result = commands.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     bb.plain( "%s" % result )
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 1649bbc..edaaea6 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "eab0c4eeb9fdb3d83e7aca4b70334cc7b02540b6"
+SRCREV = "60723c84395a9ac1753589824e30be39a781bb82"
 PR = r10
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.4.1



