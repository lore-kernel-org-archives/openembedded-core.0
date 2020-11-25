Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web10.10022.1606324875995208595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 09:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0APHLD8p030484
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2020 18:21:13 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.38.171])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 0APHLCsX032611;
	Wed, 25 Nov 2020 18:21:12 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 4329C9508F2;
	Wed, 25 Nov 2020 18:21:12 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: yocto@lists.yoctoproject.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v2] kernel-dummy: fix executing unexpected tasks
Date: Wed, 25 Nov 2020 18:20:45 +0100
Message-Id: <20201125172045.8697-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201125165417.29781-1-andrej.valek@siemens.com>
References: <20201125165417.29781-1-andrej.valek@siemens.com>

 - correctly save files into sstate
  - fix: ERROR: Task linux-dummy.do_fetch attempted to execute unexpectedly

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 62cf6f5ea6..1498da392c 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -5,10 +5,12 @@ where you wish to build the kernel externally from the build system."
 SECTION = "kernel"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 PROVIDES += "virtual/kernel"
 
+inherit deploy
+
 PACKAGES_DYNAMIC += "^kernel-module-.*"
 PACKAGES_DYNAMIC += "^kernel-image-.*"
 PACKAGES_DYNAMIC += "^kernel-firmware-.*"
@@ -60,6 +62,6 @@ do_deploy() {
 }
 
 addtask bundle_initramfs after do_install before do_deploy
-addtask deploy after do_install
+addtask deploy after do_populate_sysroot do_packagedata
 addtask shared_workdir after do_compile before do_install
 addtask compile_kernelmodules
-- 
2.11.0

