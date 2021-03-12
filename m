Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.6176.1615542966005162166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: li.wang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12C9tt09008819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:56:05 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Mar 2021 01:55:59 -0800
Received: from pek-lwang1-u1404.wrs.com (128.224.155.118) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 12 Mar 2021 01:55:58 -0800
From: "Li Wang" <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <li.wang@windriver.com>
Subject: [OE-core][PATCH] linux-dummy: add empty dependent packages
Date: Fri, 12 Mar 2021 17:52:50 +0800
Message-ID: <1615542770-26280-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

some kernel includes kernel-image-image and kernel-devicetree packages.
these patckages are defined in kernel.bbclass
but, when use linux-dummy, these packages are not defined.
so, define them as empty packages for avoiding compile error:

ERROR: Nothing RPROVIDES 'kernel-devicetree'

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/classes/linux-dummy.bbclass         | 26 ++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-dummy.bb |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/linux-dummy.bbclass

diff --git a/meta/classes/linux-dummy.bbclass b/meta/classes/linux-dummy.bbclass
new file mode 100644
index 0000000..cd87915
--- /dev/null
+++ b/meta/classes/linux-dummy.bbclass
@@ -0,0 +1,26 @@
+
+python __anonymous () {
+    if d.getVar('PREFERRED_PROVIDER_virtual/kernel') == 'linux-dummy':
+        # copy part codes from kernel.bbclass
+        kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
+
+        # set an empty package of kernel-devicetree
+        d.appendVar('PACKAGES', ' %s-devicetree' % kname)
+        d.setVar('ALLOW_EMPTY_%s-devicetree' % kname, '1')
+
+        # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
+        type = d.getVar('KERNEL_IMAGETYPE') or ""
+        alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
+        types = d.getVar('KERNEL_IMAGETYPES') or ""
+        if type not in types.split():
+            types = (type + ' ' + types).strip()
+        if alttype not in types.split():
+            types = (alttype + ' ' + types).strip()
+
+        # set empty packages of kernel-image-*
+        for type in types.split():
+            typelower = type.lower()
+            d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
+            d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
+}
+
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 95dc85f..c56f899 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 PROVIDES += "virtual/kernel"
 
-inherit deploy
+inherit deploy linux-dummy
 
 PACKAGES_DYNAMIC += "^kernel-module-.*"
 PACKAGES_DYNAMIC += "^kernel-image-.*"
-- 
2.7.4

