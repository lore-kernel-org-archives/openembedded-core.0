Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id EB83C78757
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:28:15 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3zF3Wj1LTYz1qsT4;
	Sun,  7 Jan 2018 17:19:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3zF3Wj17l0z1qqkJ;
	Sun,  7 Jan 2018 17:19:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id okocLZBJIHjl; Sun,  7 Jan 2018 17:19:28 +0100 (CET)
X-Auth-Info: Ilw++KV/83SqwYS5d1hmhZqv4ydm7UDOhIOYKp7QtBQ=
Received: from kurokawa.lan (ip-86-49-107-50.net.upcbroadband.cz
	[86.49.107.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun,  7 Jan 2018 17:19:28 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 17:19:19 +0100
Message-Id: <20180107161920.30937-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 1/2] xenomai: Add xenomai recipe
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
X-List-Received-Date: Sun, 07 Jan 2018 16:28:16 -0000

Add recipe for the xenomai. This recipe is used twice, once to build
the xenomai userspace components and again to patch the kernel with
the cobalt core. Therefore, the xenomai sources are installed into
work-shared rather then work to make them accessible to the kernel
recipe, which triggers the patching.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/xenomai/xenomai_git.bb | 54 ++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta/recipes-kernel/xenomai/xenomai_git.bb

diff --git a/meta/recipes-kernel/xenomai/xenomai_git.bb b/meta/recipes-kernel/xenomai/xenomai_git.bb
new file mode 100644
index 0000000000..98b371dbda
--- /dev/null
+++ b/meta/recipes-kernel/xenomai/xenomai_git.bb
@@ -0,0 +1,54 @@
+SUMMARY = "Xenomai 3 userspace libraries"
+DESCRIPTION = "Xenomai 3 userspace libraries"
+HOMEPAGE = "http://www.xenomai.org/"
+SECTION = "libs"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+	file://include/COPYING;md5=79ed705ccb9481bf9e7026b99f4e2b0e \
+	file://kernel/cobalt/COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33 \
+	file://kernel/cobalt/posix/COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33 \
+	file://kernel/cobalt/rtdm/COPYING;md5=c99f6e66e37d1cb50ad8be4f5be2ea5d \
+	file://lib/alchemy/COPYING;md5=68ad62c64cc6c620126241fd429e68fe \
+	file://lib/analogy/COPYING;md5=68ad62c64cc6c620126241fd429e68fe \
+	file://lib/boilerplate/COPYING;md5=68ad62c64cc6c620126241fd429e68fe \
+	file://lib/cobalt/COPYING;md5=68ad62c64cc6c620126241fd429e68fe \
+	file://lib/copperplate/COPYING;md5=68ad62c64cc6c620126241fd429e68fe \
+	file://lib/psos/COPYING;md5=68ad62c64cc6c620126241fd429e68fe \
+	file://lib/smokey/COPYING;md5=68ad62c64cc6c620126241fd429e68fe \
+	file://lib/trank/COPYING;md5=68ad62c64cc6c620126241fd429e68fe \
+	file://lib/vxworks/COPYING;md5=68ad62c64cc6c620126241fd429e68fe \
+	"
+
+RDEPENDS_${PN} = "libgcc"
+
+SRC_URI = "git://git.xenomai.org/xenomai-3.git;branch=stable-3.0.x"
+SRCREV="cbc6b87bed0fe7d6d932d943fc8ca0fb49bb5b71"
+
+S = "${TMPDIR}/work-shared/${MACHINE}/xenomai-source"
+B = "${WORKDIR}/build"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--includedir=${includedir}/${PN} --with-demodir=${bindir}"
+
+do_unpack_extra() {
+	rmdir ${S}
+	mv ${WORKDIR}/git ${S}
+}
+addtask unpack_extra after do_unpack before do_patch
+
+do_install_append() {
+	rmdir ${D}/dev
+}
+
+PACKAGES =+ "${PN}-demo"
+FILES_${PN} += " \
+	${libdir}/cobalt.wrappers ${libdir}/modechk.wrappers \
+	${libdir}/dynlist.ld \
+	"
+FILES_${PN}-demo = " \
+	${bindir}/altency ${bindir}/bufp-label ${bindir}/bufp-readwrite \
+	${bindir}/can_rtt ${bindir}/cross-link ${bindir}/cyclictest \
+	${bindir}/eth_p_all ${bindir}/iddp-label ${bindir}/iddp-sendrecv \
+	${bindir}/xddp-echo ${bindir}/xddp-label ${bindir}/xddp-stream \
+	"
-- 
2.11.0


