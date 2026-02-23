Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE95CEC112B
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:08:14 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5272.1771880890345762746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Wx+ClTrq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260223210807a14af387970002079b-qtr4k1@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260223210807a14af387970002079b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Feb 2026 22:08:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nBRvOTm+8GW0PCCmEmkK6+Ak1lvgiok7CAoYlvaMRfk=;
 b=Wx+ClTrqdxozITQmXVtRpmikJpQ3Q1XmhA/zFevCNUkj1ocE5hYMUxIxcPJlIRz+E0in9l
 sNydSw0fzz2gl/De2oyFseCcb8rX+N+8iHa5WH6F9qaEzHtDwys2opp+zMM2TpzqOzBUM2H6
 qamFACiAWP95Bxv2FWs4IeXui0/CRdPsIx++XamObM8hkOcyVX9yGlRY8Uz9dVpClBKSlZQP
 oHybhgyIA5YDshDLcWTF5LuRv9ISG8yCJcsd0Wfel8R6CF7wCnZ+hme6oaTH54vIXjskfyco
 oeMii4vSUvd33OYC/D/seM7cHTlPcc7BbwUFJyql+UL8VrpN4awUJ+QQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 6/7] meta-selftest: add test kernel module recipe
Date: Mon, 23 Feb 2026 22:06:39 +0100
Message-ID: <20260223210748.1905502-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
References: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231696

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a minimal out-of-tree kernel module and corresponding recipe under
meta-selftest for devtool ide-sdk test coverage.

This provides a simple module source and Makefile that can be built via
the module class in selftest scenarios.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../selftest-kmodule/files/Makefile           | 16 ++++++
 .../selftest-kmodule/files/selftest-kmodule.c | 56 +++++++++++++++++++
 .../selftest-kmodule/selftest-kmodule.bb      | 18 ++++++
 3 files changed, 90 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-kmodule/files/Makefile
 create mode 100644 meta-selftest/recipes-test/selftest-kmodule/files/selftest-kmodule.c
 create mode 100644 meta-selftest/recipes-test/selftest-kmodule/selftest-kmodule.bb

diff --git a/meta-selftest/recipes-test/selftest-kmodule/files/Makefile b/meta-selftest/recipes-test/selftest-kmodule/files/Makefile
new file mode 100644
index 0000000000..9a26462bfc
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-kmodule/files/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: MIT
+
+obj-m := selftest-kmodule.o
+
+SRC := $(shell pwd)
+
+all:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
+
+modules_install:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
+
+clean:
+	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
+	rm -f Module.markers Module.symvers modules.order
+	rm -rf .tmp_versions Modules.symvers
diff --git a/meta-selftest/recipes-test/selftest-kmodule/files/selftest-kmodule.c b/meta-selftest/recipes-test/selftest-kmodule/files/selftest-kmodule.c
new file mode 100644
index 0000000000..a72e0a9786
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-kmodule/files/selftest-kmodule.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * A simple test kernel module with sysfs interface for devtool ide-sdk testing
+ *
+ * Usage:
+ *   cat /sys/kernel/selftest_kmodule/magic
+ *   Hello from selftest-kmodule
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("OpenEmbedded Contributors");
+MODULE_DESCRIPTION("A simple test kernel module with sysfs interface for devtool ide-sdk testing");
+
+/* Change this string to verify the modify/rebuild/redeploy workflow */
+#define SELFTEST_MAGIC_STRING "Hello from selftest-kmodule"
+
+static struct kobject *selftest_kobj;
+
+static ssize_t magic_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	return sysfs_emit(buf, "%s\n", SELFTEST_MAGIC_STRING);
+}
+
+static struct kobj_attribute magic_attr = __ATTR_RO(magic);
+
+static int __init selftest_kmodule_init(void)
+{
+	int ret;
+
+	selftest_kobj = kobject_create_and_add("selftest_kmodule", kernel_kobj);
+	if (!selftest_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_file(selftest_kobj, &magic_attr.attr);
+	if (ret)
+		kobject_put(selftest_kobj);
+
+	pr_info("selftest-kmodule: loaded\n");
+	return ret;
+}
+
+static void __exit selftest_kmodule_exit(void)
+{
+	sysfs_remove_file(selftest_kobj, &magic_attr.attr);
+	kobject_put(selftest_kobj);
+	pr_info("selftest-kmodule: unloaded\n");
+}
+
+module_init(selftest_kmodule_init);
+module_exit(selftest_kmodule_exit);
diff --git a/meta-selftest/recipes-test/selftest-kmodule/selftest-kmodule.bb b/meta-selftest/recipes-test/selftest-kmodule/selftest-kmodule.bb
new file mode 100644
index 0000000000..5b3f00c5a0
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-kmodule/selftest-kmodule.bb
@@ -0,0 +1,18 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "A simple kernel module for testing devtool ide-sdk"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit module
+
+SRC_URI = "\
+    file://selftest-kmodule.c \
+    file://Makefile \
+"
+
+S = "${UNPACKDIR}"
-- 
2.53.0


