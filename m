Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E2EC665D4F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 11:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bd1mc009455; Tue, 4 Nov 2014 11:39:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MDCLiKk9C8P4; Tue,  4 Nov 2014 11:39:02 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4BcecN009424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 4 Nov 2014 11:38:41 GMT
Received: from richard by ted with local (Exim 4.82)
	(envelope-from <richard@dan.rpsys.net>)
	id 1XlcS6-0000JN-0p; Tue, 04 Nov 2014 11:39:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:39:05 +0000
Message-Id: <1415101148-1142-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/8] mdadm: 3.3.1 -> 3.3.2
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
X-List-Received-Date: Tue, 04 Nov 2014 11:39:40 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/mdadm/mdadm_3.3.1.bb | 45 ------------------------------
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb | 45 ++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/mdadm_3.3.1.bb
 create mode 100644 meta/recipes-extended/mdadm/mdadm_3.3.2.bb

diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.1.bb b/meta/recipes-extended/mdadm/mdadm_3.3.1.bb
deleted file mode 100644
index 59bc587..0000000
--- a/meta/recipes-extended/mdadm/mdadm_3.3.1.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "Tool for managing software RAID under Linux"
-HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
-
-# Some files are GPLv2+ while others are GPLv2.
-LICENSE = "GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
-                    file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
-
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
-           file://mdadm-3.2.2_fix_for_x32.patch \
-           file://gcc-4.9.patch \
-	  "
-
-SRC_URI[md5sum] = "4227d48de62dfb217c92fa0c54171bbe"
-SRC_URI[sha256sum] = "d8c74112cfd77bdc1dbc1291fe8d9243c76d91bfa276fcb95f2a75ca7717ab02"
-
-CFLAGS += "-fno-strict-aliasing"
-
-inherit autotools-brokensep
-
-# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
-do_configure_prepend () {
-	sed -i -e '/.*ansidecl.h.*/d' ${S}/sha1.h
-}
-
-EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
-# PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
-# prevents 64-bit userland from seeing this definition, instead defaulting
-# to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
-# int-ll64.h included
-EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
-EXTRA_OEMAKE_append_mips64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
-
-do_compile() {
-	oe_runmake
-}
-
-do_install() {
-	export STRIP=""
-	autotools_do_install
-}
-
-FILES_${PN} += "${base_libdir}/udev/rules.d/*.rules"
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
new file mode 100644
index 0000000..c9392b4
--- /dev/null
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Tool for managing software RAID under Linux"
+HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
+
+# Some files are GPLv2+ while others are GPLv2.
+LICENSE = "GPLv2 & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
+                    file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
+
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
+           file://mdadm-3.2.2_fix_for_x32.patch \
+           file://gcc-4.9.patch \
+	  "
+
+SRC_URI[md5sum] = "44698d351501cac6a89072dc877eb220"
+SRC_URI[sha256sum] = "0f3a7e1a76b13892b79f9fceaf99ecb23513260389a768ac644ffa3ae06e5b8c"
+
+CFLAGS += "-fno-strict-aliasing"
+
+inherit autotools-brokensep
+
+# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
+do_configure_prepend () {
+	sed -i -e '/.*ansidecl.h.*/d' ${S}/sha1.h
+}
+
+EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
+# PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
+# prevents 64-bit userland from seeing this definition, instead defaulting
+# to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
+# int-ll64.h included
+EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
+EXTRA_OEMAKE_append_mips64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	export STRIP=""
+	autotools_do_install
+}
+
+FILES_${PN} += "${base_libdir}/udev/rules.d/*.rules"
-- 
2.0.2


