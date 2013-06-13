Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id A97276A5DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 11:16:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.87,858,1363132800"; d="scan'208";a="18269706"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 13 Jun 2013 12:16:02 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>) id 1Un5VZ-0007gx-Od
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Jun 2013 12:16:01 +0100
Date: Thu, 13 Jun 2013 12:16:01 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130613111601.GA27137@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: populate-sysroot files in sstate cache overwritten by "empty" ones
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
X-List-Received-Date: Thu, 13 Jun 2013 11:16:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've managed to find a relatively easy way to cause a perfectly valid
sstate populate-sysroot file to be overwritten with a (virtually) empty
one. The circumstances that provoke this in our layer are rather more
complex but end up with the same situation.

The problem seems to be caused by having an ancillary task in recipe1 that
depends on do_configure and the same ancillary task in recipe2 that depends
on recipe1:populate-sysroot. The result is that recipe1:do_configure runs
followed by recipe1:do_populate_sysroot without the intervening important
tasks such as do_install.

To reproduce the problem, first apply this patch to oe-core to arrange for
the required dependencies to exist:

diff --git a/meta/recipes-core/mac-test/mac-test.bb b/meta/recipes-core/mac-test/mac-test.bb
new file mode 100644
index 0000000..48d656a
--- /dev/null
+++ b/meta/recipes-core/mac-test/mac-test.bb
@@ -0,0 +1,15 @@
+inherit module
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+DEPENDS = "virtual/kernel"
+
+do_extract_config() {
+}
+addtask extract_config after do_populate_sysroot
+
+do_compile() {
+}
+
+do_install() {
+}
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 1517f40..3f14603 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -28,3 +28,9 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+
+do_extract_config() {
+		    cp ${B}/.config /tmp/somewhere-safe
+}
+
+addtask extract_config after do_configure


Now do:

 export BB_NUMBER_THREADS=8
 bitbake kernel-yocto mac-test

 # At this point kernel-yocto's populate-sysroot.tgz file in the sstate
 # cache is correct.

 bitbake -c clean kernel-yocto mac-test
 bitbake -c extract_config kernel-yocto mac-test

 # Now kernel-yocto's populate-sysroot.tgz file is virtually empty


The log from the failing build looks like:

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Running setscene task 35 of 36 (/home/mac/nobackup/git/oe-core/meta/recipes-core/mac-test/mac-test.bb, do_populate_sysroot_setscene)
NOTE: recipe mac-test-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mac-test-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 36 of 36 (/home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_populate_sysroot_setscene: Succeeded
NOTE: Executing RunQueue Tasks
NOTE: Running task 175 of 269 (ID: 6, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_fetch)
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_fetch: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_fetch: Succeeded
NOTE: Running task 248 of 269 (ID: 2, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_unpack)
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_unpack: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_unpack: Succeeded
NOTE: Running task 249 of 269 (ID: 1, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_kernel_checkout)
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_kernel_checkout: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_kernel_checkout: Succeeded
NOTE: Running task 250 of 269 (ID: 0, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_validate_branches)
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_validate_branches: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_validate_branches: Succeeded
NOTE: Running task 251 of 269 (ID: 3, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_patch)
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_patch: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_patch: Succeeded
NOTE: Running task 252 of 269 (ID: 7, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_kernel_configme)
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_kernel_configme: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_kernel_configme: Succeeded
NOTE: Running task 253 of 269 (ID: 8, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_configure)
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_configure: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_configure: Succeeded
NOTE: Running task 262 of 269 (ID: 5, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_populate_sysroot)
NOTE: Running task 263 of 269 (ID: 16, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_extract_config)
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_extract_config: Started
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_extract_config: Succeeded
NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_populate_sysroot: Succeeded
NOTE: Running task 269 of 269 (ID: 25, /home/mac/nobackup/git/oe-core/meta/recipes-core/mac-test/mac-test.bb, do_extract_config)
NOTE: recipe mac-test-1.0-r0: task do_extract_config: Started
NOTE: recipe mac-test-1.0-r0: task do_extract_config: Succeeded
NOTE: Tasks Summary: Attempted 269 tasks of which 259 didn't need to be rerun and all succeeded.


Thanks.

Mike.

