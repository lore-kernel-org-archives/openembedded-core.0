Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web10.42609.1606636232082890537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 23:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AT7nw5Z008574
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Nov 2020 08:49:58 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.33.96])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 0AT7nvcS024191;
	Sun, 29 Nov 2020 08:49:57 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 58C7E9508F2;
	Sun, 29 Nov 2020 08:49:56 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
Cc: raj.khem@gmail.com, yocto@lists.yoctoproject.org,
        Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v3] kernel-dummy: fix executing unexpected tasks
Date: Sun, 29 Nov 2020 08:49:20 +0100
Message-Id: <20201129074920.2788-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201125165417.29781-1-andrej.valek@siemens.com>
References: <20201125165417.29781-1-andrej.valek@siemens.com>

 - correctly save files into sstate
  - fix: ERROR: Task linux-dummy.do_fetch attempted to execute unexpectedly

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 62cf6f5ea6..649fc04dd1 100644
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
-- 
2.11.0

