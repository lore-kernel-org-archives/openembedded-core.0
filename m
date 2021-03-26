Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.6424.1616721188287413785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JbmRzBZe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12Q1D6eE079272;
	Thu, 25 Mar 2021 20:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616721186;
	bh=oFZLPj/RV65ifJVMJyhloZzLC/iaRrnznzwEVT4fJH0=;
	h=From:To:CC:Subject:Date;
	b=JbmRzBZeGevwBHOgsNa0SoiO9yTOQOWKIIgE1li9vWbIVxKGXOGJdgHxHisu8AQPd
	 xrMWttMIcg7s8DvqKN+WbM1TYIEvNMDA0adUxwEmUN/O0XDGdet1iEvJN4tCU3dRhP
	 qhNjnI9euovHwANCxsI9TVWMjvlUK4U4+LvtfxZ8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12Q1D5JD020522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Mar 2021 20:13:06 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 25
 Mar 2021 20:13:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 25 Mar 2021 20:13:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12Q1D5GD019412;
	Thu, 25 Mar 2021 20:13:05 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <openembedded-core@lists.openembedded.org>
CC: <praneeth@ti.com>, <denis@denix.org>, Nishanth Menon <nm@ti.com>
Subject: [PATCH] make-mod-scripts: Provide the correct objcopy to kernel make
Date: Thu, 25 Mar 2021 20:13:04 -0500
Message-ID: <20210326011304.25640-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When cross-compiling with v5.12-rc3, prepare fails[1] build of vdso at
the objcopy stage since it seems to be using the local host's objcopy
rather than the cross-compile version we want it to use.

This can be trivially reproduced in a localbuild of the kernel
following the build parameters provided in the process[2]

Lets fix this by passing OBJCOPY over to the kernel.

[1] https://pastebin.ubuntu.com/p/pNcQtb93wr/
[2] https://pastebin.ubuntu.com/p/vZGqgh9Sq5/
Signed-off-by: Nishanth Menon <nm@ti.com>
---

NOTE:
1. This is a different problem and is not resolved with
https://lists.openembedded.org/g/openembedded-core/message/149943

2. Though reproduced during a dunfell build, this should probably
apply else where as well.

3. I have'nt been able to cleanly bisect things, but my best guess was
that this might be a consequence of kernel fixup exposing this.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a5b8ca97fbf8300a5e21c393df25ce6f521e7939

 meta/classes/kernel-arch.bbclass                             | 3 +++
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 07ec242e63bb..3d25fc7ac531 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -60,9 +60,12 @@ TARGET_LD_KERNEL_ARCH ?= ""
 HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
+TARGET_OBJCOPY_KERNEL_ARCH ?= ""
+HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 TOOLCHAIN = "gcc"
 
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 87b7d240f51a..2d73e8093c2e 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -25,7 +25,7 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
 do_configure() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	for t in prepare scripts_basic scripts; do
-		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}"\
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
-- 
2.31.0

