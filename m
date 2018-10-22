Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id D5A2B79BE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 06:20:13 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [23.96.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 66E5220779;
	Mon, 22 Oct 2018 06:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1540189214;
	bh=bZDHixzyGY3uPR3SumMMLE6AcY7+ILZVXfzP7//R/jg=;
	h=From:To:Cc:Subject:Date:From;
	b=VlPoQBfB4moDkx/MkbQnzMWyKEjzri21m2XsDdwyY+QTUgS1qrE1o1BwuswqXK0f5
	FCybDrFRNKkEp4/ceQVXmOY7V7/fPLmksey5RpU0+D18FKvI8l2eUS+ESww33DK+4x
	03hhqAywqJCPsKYlymBhkNYFMZltc4sPJMJV5LN4=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 06:20:10 +0000
Message-Id: <20181022062010.11727-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [sumo] [PATCH v1] kernel: specify dependencies for compilation for config tasks
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
X-List-Received-Date: Mon, 22 Oct 2018 06:20:14 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@windriver.com>

With recent kernels (i.e. 4.17+) the configuration phase of the kernel
will check for capabilities/options of the compiler for CVE and other
mitigation support.

For a general kernel, we want to ensure that CC is fully defined when
the config targets are invoked (so the proper compiler will be checked).

For linux-yocto, we also need to specify the compiler/tools dependencies
for the configme task since it executes before configure and hence the
main kernel build DEPENDS will not always be in the sysroot before it
executes. Without those dependencies the kernel will be incorrectly
configured (i.e. bison is missing) or the configuration will fail the
mitigation tests.

[YOCTO #12757]

(From OE-Core rev: ff1bdd75d50f0ebac3d599e461685ace29559a82)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/classes/kernel-yocto.bbclass | 5 ++++-
 meta/classes/kernel.bbclass       | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 4ac3a39e475..82d80741a95 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -275,6 +275,9 @@ addtask kernel_metadata after do_validate_branches do_unpack before do_patch
 do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
 do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
 
+do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
+do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
+do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
 	set +e
@@ -304,7 +307,7 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"	ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"	HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
 	if [ $? -ne 0 ]; then
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 78d6c30b07c..727851401cc 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -489,7 +489,7 @@ sysroot_stage_all () {
 	:
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
     oldest_kernel = d.getVar('OLDEST_KERNEL')
-- 
2.19.0


