Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TCFNz-0005Bl-5h
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 21:47:39 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8DJYrhZ002911;
	Thu, 13 Sep 2012 12:34:54 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 13 Sep 2012 15:34:36 -0400
Message-Id: <bb06b4675f0ee95c126b75c1b418a918bfc0384d.1347564407.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1347564407.git.bruce.ashfield@windriver.com>
References: <cover.1347564407.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1347564407.git.bruce.ashfield@windriver.com>
References: <cover.1347564407.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel-yocto: fix kernel configuration audit for custom yocto kernels
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
X-List-Received-Date: Thu, 13 Sep 2012 19:47:39 -0000

It was reported that the kernel configuration checks for custom yocto
kernels had the following output:

  NOTE: validating kernel configuration
  grep: /meta-series: No such file or directory
  grep: /meta-series: No such file or directory
  WARNING: Can't find any BSP hardware or required configuration fragments.
  WARNING: Looked at //cfg///hdw_frags.txt and //cfg///required_frags.txt in directory: //cfg//
  NOTE: Tasks Summary: Attempted 375 tasks of which 367 didn't need to be rerun and all succeeded.

which is not inspire confidence in the output of the process.

Completely inhibiting the check is one option to remove the messages,
but that removes the ability see output, which can help move users to
a better or more fully configured linux-yocto based kernel.

To fix this, we have to ensure that the path to the meta-series is
always valid, and that the tools can deal with not all files existing
in the audit directory.

Since custom yocto kernels do not set KMETA (they don't have a meta branch),
we ensure that a default of 'meta' is passed to the audit ('meta' is always
valid), and that kconf_check itself can deal with an incomplete set of
input audit files.

The net result is output like this (using a defconfig with invalid options
for the kernel being built):

  NOTE: validating kernel configuration
  This BSP sets 19 invalid/obsolete kernel options.
  These config options are not offered anywhere within this kernel.
  The full list can be found in your kernel src dir at:
  meta/cfg/standard/qemux86/invalid.cfg

  There were 1 instances of config fragment errors.
  The full list can be found in your kernel src dir at:
  meta/cfg/standard/qemux86/fragment_errors.txt

  The full list can be found in your kernel src dir at:
  meta/cfg/standard/qemux86/missing_required.cfg

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |    7 ++++++-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 724e5cd..f78d63b 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -212,8 +212,13 @@ python do_kernel_configcheck() {
 
     bb.plain("NOTE: validating kernel configuration")
 
+    # if KMETA isn't set globally by a recipe using this routine, we need to
+    # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
+    # meta-series for processing
+    kmeta = d.getVar( "KMETA", True ) or "meta"
+
     pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH', True), "${S}/scripts/util/")
-    cmd = d.expand("cd ${S}; kconf_check -config- ${KMETA}/meta-series ${S} ${B}")
+    cmd = d.expand("cd ${S}; kconf_check -config- %s/meta-series ${S} ${B}" % kmeta)
     ret, result = commands.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     bb.plain( "%s" % result )
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e8926ee..1381fd1 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "0c7b625280eb9ff62d40b53308e7238ddd164f38"
+SRCREV = "a04138a02644eada0d012196e5ac3db4f516114d"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



