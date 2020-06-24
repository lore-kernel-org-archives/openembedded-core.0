Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by mx.groups.io with SMTP id smtpd.web10.514.1593027420639185904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 12:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=WAuXMfYQ;
 spf=pass (domain: wdc.com, ip: 216.71.153.144, mailfrom: prvs=437103371=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1593027420; x=1624563420;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1D94ul6nLhujw+19lr56TRJTTDMf8184WTpE9GV+ZYI=;
  b=WAuXMfYQssNtODj5VZtUbT+xSPqfGkfM4X9XzDjoRVp9JcdUnE9RE4BY
   PWLJPxpsANHVVBypHtOTwji6GuOpbQ8byFwvVeXpkANd7yo/9ttaVOP85
   99BInQj0btOBexQGpoeJH0VWzU7y46hxkTwpxQv0Vo/HlIxXzKNRlTxAc
   EMeeROVB6vWyQ0dUTdRV4foHdbNNlWtifzsq0R9ZWRCt9/UUDMMVlpzh5
   mikLDf/eMYXjbDtCRZtBO9SwjnghCUDzzKCDlciTZxdrcIp0OqUx0vCtJ
   05cL7wF8Oevng9m9W4WeaQNQV7S2W/5F3ntAZVoIC1jr1WlE93kb0SiXz
   g==;
IronPort-SDR: x9UhvuzUeI+ZXU/nU08PSIv+8bixgF1xJE0boU9ecFyur/nGBrV8B3SEOhKPwZxS7feqj6XS8U
 4bvGNwStyDBVSuFA6kRIno1xxd7nRTubaqj/vAFjjZfksfGri1KtH4scWxaSuUvddLGMoUKVE8
 jyx5Nb7ylY10mNDlvum3eziS25jC9DNUkiXc22suky79aQS1EgfboIVpbquB7/6nwbUaYETahg
 J8atuynkonAqNNRKvp+bFh37YEUt/ZpAcLw7hUuKHScsz9Zmr5a+JX20sFRFWqo7zTTaPVCri+
 d80=
X-IronPort-AV: E=Sophos;i="5.75,276,1589212800"; 
   d="scan'208";a="141069986"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 25 Jun 2020 03:37:00 +0800
IronPort-SDR: EW6pZPHPVxFLcfAaeTP0CoVEY8OL2/9lKl9WuBMlQPhxgAxWgZREEuUOD/gDdhQIypcmWQlHqT
 V+wf/DQNNeamWlRNIGTQdQUaQJyTbKgoI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2020 12:26:02 -0700
IronPort-SDR: qBdCIP/CbaoWoHIDKK2NyFFg2H5h3fN4w7LoP7RR3inpKs5aSc7Fydc33kC7cNt+oNB/WfY7p5
 D8ZVDMoZ4Vcg==
WDCIronportException: Internal
Received: from hb7qjc2.ad.shared (HELO risc6-mainframe.hgst.com) ([10.86.58.225])
  by uls-op-cesaip01.wdc.com with ESMTP; 24 Jun 2020 12:36:59 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] opensbi: Update to OpenSBI v0.8 release
Date: Wed, 24 Jun 2020 12:27:50 -0700
Message-Id: <20200624192750.1852000-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc |  2 +-
 .../{opensbi_0.6.bb => opensbi_0.8.bb}        | 21 +++++++++----------
 2 files changed, 11 insertions(+), 12 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_0.6.bb => opensbi_0.8.bb} (65%)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index a42346f361..759c8a196e 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -18,7 +18,7 @@ WKS_FILE ?= "qemuriscv.wks"
 MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
 
 EXTRA_IMAGEDEPENDS += "opensbi"
-RISCV_SBI_PLAT ?= "qemu/virt"
+RISCV_SBI_PLAT ?= "generic"
 RISCV_SBI_PAYLOAD ?= "${KERNEL_IMAGETYPE}-${MACHINE}.bin"
 
 UBOOT_ENTRYPOINT_riscv32 = "0x80400000"
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.6.bb b/meta/recipes-bsp/opensbi/opensbi_0.8.bb
similarity index 65%
rename from meta/recipes-bsp/opensbi/opensbi_0.6.bb
rename to meta/recipes-bsp/opensbi/opensbi_0.8.bb
index 56f2d4b915..818efac733 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.6.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.8.bb
@@ -7,8 +7,8 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "ac5e821d50be631f26274765a59bc1b444ffd862"
-SRC_URI = "git://github.com/riscv/opensbi.git \
+SRCREV = "a98258d0b537a295f517bbc8d813007336731fa9"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master \
            file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
           "
 
@@ -25,22 +25,21 @@ do_install_append() {
 	# In the future these might be required as a dependency for other packages.
 	# At the moment just delete them to avoid warnings
 	rm -r ${D}/include
-	rm -r ${D}/platform/${RISCV_SBI_PLAT}/lib
-	rm -r ${D}/platform/${RISCV_SBI_PLAT}/firmware/payloads
-	rm -r ${D}/lib
+	rm -r ${D}/lib*
+	rm -r ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/payloads
 }
 
 do_deploy () {
-	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.* ${DEPLOYDIR}/
-	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.* ${DEPLOYDIR}/
-	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_dynamic.* ${DEPLOYDIR}/
+	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.* ${DEPLOYDIR}/
+	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.* ${DEPLOYDIR}/
+	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.* ${DEPLOYDIR}/
 }
 
 addtask deploy before do_build after do_install
 
-FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
-FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
-FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
+FILES_${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
+FILES_${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
+FILES_${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
 
 COMPATIBLE_HOST = "(riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.27.0

