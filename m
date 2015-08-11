Return-Path: <denis@denix.org>
X-Greylist: delayed 3604 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Aug 2015 00:33:57 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id CF7A3769A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 00:33:57 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSX00COEYRXPN10@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 11 Aug 2015 18:33:38 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8	a=TSjn0UGuVhMxQYcxNYkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4DCEB161B54;	Tue,
	11 Aug 2015 19:33:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 19:33:32 -0400
Message-id: <1439336012-5404-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] kselftests: add 4.1 version of Kernel Selftest suite
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
X-List-Received-Date: Wed, 12 Aug 2015 00:33:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-kernel/kselftests/kselftests_4.1.bb | 86 ++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 meta/recipes-kernel/kselftests/kselftests_4.1.bb

diff --git a/meta/recipes-kernel/kselftests/kselftests_4.1.bb b/meta/recipes-kernel/kselftests/kselftests_4.1.bb
new file mode 100644
index 0000000..d917fb5
--- /dev/null
+++ b/meta/recipes-kernel/kselftests/kselftests_4.1.bb
@@ -0,0 +1,86 @@
+SUMMARY = "Linux Kernel Selftests"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+SRC_URI = "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
+SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
+
+S = "${WORKDIR}/linux-${PV}"
+
+DEPENDS = "virtual/kernel popt"
+
+inherit kernel-arch
+
+TARGETS = "cpu-hotplug efivarfs exec firmware ftrace kcmp memfd memory-hotplug \
+	mount mqueue net ptrace size sysctl timers user vm"
+
+# Arch specific tests
+TARGETS_append_x86 = " breakpoints ipc x86"
+TARGETS_append_x86-64 = " breakpoints ipc x86"
+TARGETS_append_powerpc = " powerpc"
+TARGETS_append_powerpc64 = " powerpc"
+
+EXTRA_OEMAKE += "-C tools/testing/selftests TARGETS="${TARGETS}" INSTALL_PATH=${D}${bindir}/kselftests CC="${CC}""
+
+# Their Makefiles are so sloppy, let's clean up a bit
+do_configure () {
+	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/lib.mk
+	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/timers/Makefile
+	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/memfd/Makefile
+	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/powerpc/switch_endian/Makefile
+	sed "s|gcc|\$(CC)|g" -i ${S}/tools/testing/selftests/breakpoints/Makefile
+	sed "s|^LDFLAGS += -lrt -lpthread|LDLIBS += -lrt -lpthread|g" -i ${S}/tools/testing/selftests/timers/Makefile
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake install
+}
+
+PACKAGE_BEFORE_PN = "${PN}-breakpoints ${PN}-cpu-hotplug ${PN}-efivarfs ${PN}-exec ${PN}-firmware ${PN}-ftrace \
+	${PN}-ipc ${PN}-kcmp ${PN}-memfd ${PN}-memory-hotplug ${PN}-mount ${PN}-mqueue ${PN}-net ${PN}-powerpc \
+	${PN}-ptrace ${PN}-size ${PN}-sysctl ${PN}-timers ${PN}-user ${PN}-vm ${PN}-x86"
+
+FILES_${PN}-breakpoints = "${bindir}/kselftests/breakpoints"
+FILES_${PN}-cpu-hotplug = "${bindir}/kselftests/cpu-hotplug"
+FILES_${PN}-efivarfs = "${bindir}/kselftests/efivarfs"
+FILES_${PN}-exec = "${bindir}/kselftests/exec"
+FILES_${PN}-firmware = "${bindir}/kselftests/firmware"
+FILES_${PN}-ftrace = "${bindir}/kselftests/ftrace"
+FILES_${PN}-ipc = "${bindir}/kselftests/ipc"
+FILES_${PN}-kcmp = "${bindir}/kselftests/kcmp"
+FILES_${PN}-memfd = "${bindir}/kselftests/memfd"
+FILES_${PN}-memory-hotplug = "${bindir}/kselftests/memory-hotplug"
+FILES_${PN}-mount = "${bindir}/kselftests/mount"
+FILES_${PN}-mqueue = "${bindir}/kselftests/mqueue"
+FILES_${PN}-net = "${bindir}/kselftests/net"
+FILES_${PN}-powerpc = "${bindir}/kselftests/powerpc"
+FILES_${PN}-ptrace = "${bindir}/kselftests/ptrace"
+FILES_${PN}-size = "${bindir}/kselftests/size"
+FILES_${PN}-sysctl = "${bindir}/kselftests/sysctl"
+FILES_${PN}-timers = "${bindir}/kselftests/timers"
+FILES_${PN}-user = "${bindir}/kselftests/user"
+FILES_${PN}-vm = "${bindir}/kselftests/vm"
+FILES_${PN}-x86 = "${bindir}/kselftests/x86"
+FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
+
+RDEPENDS_${PN}-cpu-hotplug += "bash"
+RDEPENDS_${PN}-efivarfs += "bash"
+RDEPENDS_${PN}-memory-hotplug += "bash"
+RDEPENDS_${PN}-net += "bash"
+RDEPENDS_${PN}-vm += "bash"
+RDEPENDS_${PN} += "bash ${PN}-cpu-hotplug ${PN}-efivarfs ${PN}-exec ${PN}-firmware ${PN}-ftrace ${PN}-ipc \
+	${PN}-kcmp ${PN}-memfd ${PN}-memory-hotplug ${PN}-mount ${PN}-mqueue ${PN}-net ${PN}-ptrace \
+	${PN}-size ${PN}-sysctl ${PN}-timers ${PN}-user ${PN}-vm"
+
+RDEPENDS_${PN}_append_x86 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
+RDEPENDS_${PN}_append_x86-64 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
+RDEPENDS_${PN}_append_powerpc = " ${PN}-powerpc"
+RDEPENDS_${PN}_append_powerpc64 = " ${PN}-powerpc"
+
+INSANE_SKIP_${PN} = "already-stripped"
-- 
2.2.0


