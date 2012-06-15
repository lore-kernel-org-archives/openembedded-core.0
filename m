Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sfd3y-0004Ft-23
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 22:24:10 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5FKDQAB020236;
	Fri, 15 Jun 2012 13:13:27 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 15 Jun 2012 16:23:01 -0400
Message-Id: <40732c1c548493a69d437f3fbb125affa338b3e9.1339791495.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1339791495.git.bruce.ashfield@windriver.com>
References: <cover.1339791495.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339791495.git.bruce.ashfield@windriver.com>
References: <cover.1339791495.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, liang.li@windriver.com,
	saul.wold@intel.com
Subject: [PATCH 1/2] recipes-kernel: make perf a standalone package
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
X-List-Received-Date: Fri, 15 Jun 2012 20:24:10 -0000

From: Liang Li <liang.li@windriver.com>

perf has been coupled to the kernel packages via kernel.bbclass.
While maintaining the build of perf out of the kernel source tree
is desired the package coupling has proved to be awkward in
several situations such as:

  - when a kernel recipe doesn't want to build/provide perf
  - when licensing of dependencies would prohibit perf and hence
    the kernel from being built.

To solve some of these problems, this recipe is the extraction of
the linux-tools.inc provided perf compilation into a standalone
perf recipe that builds out of the kernel source, but is otherwise
independent.

No new functionality is provided above what the linux-tools.inc
variant provided, but the separate recipe provides baseline for
adding new functionality.

Signed-off-by: Liang Li <liang.li@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass          |    7 +----
 meta/recipes-kernel/perf/perf_3.4.bb |   52 ++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 116e10b..02234df 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -469,7 +469,7 @@ python populate_packages_prepend () {
 	metapkg = "kernel-modules"
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
 	d.setVar('FILES_' + metapkg, "")
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'kernel-misc' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
@@ -548,8 +548,3 @@ addtask deploy before do_build after do_install
 
 EXPORT_FUNCTIONS do_deploy
 
-# perf must be enabled in individual kernel recipes
-PACKAGES =+ "perf-dbg perf"
-FILES_perf = "${bindir}/* \
-              ${libexecdir}"
-FILES_perf-dbg = "${FILES_${PN}-dbg}"
diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
new file mode 100644
index 0000000..9c8ceb0
--- /dev/null
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Performance analysis tools for Linux"
+DESCRIPTION = "Performance counters for Linux are a new kernel-based \
+subsystem that provide a framework for all things \
+performance analysis. It covers hardware level \
+(CPU/PMU, Performance Monitoring Unit) features \
+and software features (software counters, tracepoints) \
+as well."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+PR = "r0"
+
+BUILDPERF_libc-uclibc = "no"
+
+PERFDEPENDS = " \
+virtual/${MLPREFIX}libc:do_populate_sysroot \
+${MLPREFIX}elfutils:do_populate_sysroot \
+${MLPREFIX}binutils:do_populate_sysroot \
+"
+RDEPENDS += "elfutils perl python"
+
+PROVIDES = "virtual/perf"
+
+S = "${STAGING_KERNEL_DIR}/source"
+B = "${WORKDIR}/${BPN}-${PV}"
+
+EXTRA_OEMAKE = \
+		'-C ${S}/tools/perf \
+		O=${B} \
+		CROSS_COMPILE=${TARGET_PREFIX} \
+		ARCH=${TARGET_ARCH} \
+		CC="${CC}" \
+		AR="${AR}" \
+		prefix=/usr \
+		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \
+		'
+
+do_configure[depends] = "virtual/kernel:do_populate_sysroot"
+
+do_compile() {
+	oe_runmake all
+}
+
+do_compile[depends] = "${PERFDEPENDS}"
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
-- 
1.7.7



