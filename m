Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34D0C27C47
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 13:48:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.18013.1698500901544251000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Oct 2023 06:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hH4BOP7y;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: bhstalel@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32dcd3e5f3fso2015237f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 06:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698500899; x=1699105699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Geto+I6BYDjogapb0tGx22rV1csof5fdinCWVnznfeI=;
        b=hH4BOP7yKQicWU5SU601mzY1Ui77Yms4v6OAgvSOCMtoNhsqq5qZUDUr8NXaHaUOP8
         XyxhggUcgR60yuXJpqtNhz1wZU5fdMMODHwET8L+x4qZDrn97AqvnRAjaSEjkPFBR0QN
         AvRLetSgW7r/lRu/9N1d/euhh0qi/BhpIfAbsNdG/Mnz5CJCTwLBsJ++hm/snoK0vZQG
         ask9mc8JQI8OrCAXjQdpS6iJoZD/RliKmhfxSyK4SB2I1S3CJk+MSbqLFQ4goGhExRMV
         xe665mdkBY8sJbWPuv1zJzcv4ZQ5EAMH1qTtzmeAPwLg7NtwZHgwf3xsuiBKQ4kF5nJz
         YXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698500899; x=1699105699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Geto+I6BYDjogapb0tGx22rV1csof5fdinCWVnznfeI=;
        b=qdJ0ORtEz+WbonPzKIdgqr9VnqKhGGZ+XCELN1wr8HqmI+fQSDoHBCCapBoOim9OqG
         p42W6sWpJ9fgpLwkJmKF9mGE9wD6WxCpVhRE8ARFSYizkGXcl8IFrKqQx3rUdHEBTndd
         dNx5WLSoy1JQV34BV4S2qgQqgbdDmzfijWboEwDIJ0uZxCyAbjzB4jezrXvRYGgFreZj
         zNjw3m6PZuCd+5Sm/Fl/+D96brNuS7U5Jkxlm+NqiNvlR5PqzHJCJyWtf4NWSzU7OgJN
         0sMFLjWfFhr1uSCiDK8TagUp/UMtvC+7CPvYMxsUphoNZy8x7frDrMgSIJJgHSj9zlYN
         pRlg==
X-Gm-Message-State: AOJu0Ywc7xKEjy5hyoRnjJUgogkxZRz+ICho88Mi6YhVcoS9hCxj/hkK
	GzwrjKLHJmd7rBtYSVjQTr6kpxYySH/J5w==
X-Google-Smtp-Source: AGHT+IE05j38eY+aCYy5SONbe4wByxFSE90T7x1Mr5p1EiJvb2obDtm+FQA+s5sT3F4Yt/RXK5RPhQ==
X-Received: by 2002:adf:fc49:0:b0:32d:be57:795f with SMTP id e9-20020adffc49000000b0032dbe57795fmr3602367wrs.6.1698500899351;
        Sat, 28 Oct 2023 06:48:19 -0700 (PDT)
Received: from localhost.localdomain ([196.229.6.8])
        by smtp.gmail.com with ESMTPSA id bs27-20020a056000071b00b0032daf848f68sm223414wrb.59.2023.10.28.06.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 06:48:19 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [OE-Core][PATCH v2] meta: classes-recipe: A class for simple Kernel modules
Date: Sat, 28 Oct 2023 14:48:08 +0100
Message-Id: <20231028134808.984028-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 13:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189765

The module class provides what is needed to compile a Linux Kernel module
but since the Makefile is always the same for simple modules that have
their sources in one directory level, I thought of creating new class wrapper
to automatically prepare the Makefile.
Also, using variable flag feature, a recipe can provide multiple modules
and can be handled the same way as PACKAGECONFIG is used to enabled/disable
features.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 meta/classes-recipe/simple-module.bbclass | 134 ++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 meta/classes-recipe/simple-module.bbclass

diff --git a/meta/classes-recipe/simple-module.bbclass b/meta/classes-recipe/simple-module.bbclass
new file mode 100644
index 0000000000..855f828a42
--- /dev/null
+++ b/meta/classes-recipe/simple-module.bbclass
@@ -0,0 +1,134 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Class to generate Makefile for Linux Kernel modules
+#
+# The aim of this class is to provide a way to gain time
+# when creating recipes for Linux Kernel modules
+#
+# Required variable:
+#   MODULE_SRC
+#
+# This variable itself counts on flags to know what files
+# to use for .ko generation and their .o dependencies
+#
+# Usage:
+#   If you have the following module structure:
+#       |-- module.c
+#       |-- dep1.c
+#       `-- dep2.c
+#   then you set:
+#   MODULE_SRC = "module"
+#   MODULE_SRC[module] = "dep1 dep2"
+#
+# This will generate:
+#   obj-m += module.o
+#   module-objs += dep1.o dep2.o
+#
+# This class supports multiple modules as well
+# each module will be added to obj-m and if it has dependencies
+# an -objs variable will be created, example:
+#
+#   If you have the following module structure:
+#       |-- module1.c
+#       |-- dep1.c
+#       |-- dep2.c
+#       |-- module2.c
+#       `-- dep3.c
+#
+#   then you set:
+#   MODULE_SRC = "module1 module2"
+#   MODULE_SRC[module1] = "dep1 dep2"
+#   MODULE_SRC[module2] = "dep3"
+#
+# This will generate:
+#   obj-m += module1.o module2.o
+#   module1-objs += dep1.o dep2.o
+#   module2-objs += dep3.o
+#
+# A module can be enabled or disabled by adding or removing
+# the module name from MODULE_SRC
+#
+# Limitations:
+#   - All modules source files should exist in the same folder level
+
+inherit module
+
+python do_prepare_makefile() {
+
+    if not (d.getVar('MODULE_SRC') or "").split():
+        bb.warn("You inherited easy-module but did not set drivers in MODULE_SRC")
+
+    kernel_modules = (d.getVar('MODULE_SRC') or "").split()
+
+    if kernel_modules:
+        kernel_modules_flags = d.getVarFlags('MODULE_SRC') or []
+
+        objs_data = {}
+        for k_module in kernel_modules:
+
+            # Check if all enabled drivers have corresponding flag
+            if not k_module in kernel_modules_flags:
+                bb.fatal(f"Driver {k_module} is enabled but does not have a flag entry")
+
+            k_module_file = f"{k_module}.c"
+            if not os.path.isfile(k_module_file):
+                bb.fatal(f"Source file {k_module_file} is not found")
+
+            k_module_o = f"{k_module}.o"
+            objs_data[k_module] = []
+
+            k_module_deps = (d.getVarFlag('MODULE_SRC', k_module) or "").split()
+            for dep in k_module_deps:
+                dep_file = f"{dep}.c"
+                dep_o = f"{dep}.o"
+
+                if not os.path.isfile(dep_file):
+                    bb.fatal(f"Dependency file {dep_file} for the {k_module_file} is not found")
+
+                objs_data[k_module].append(dep_o)
+
+        with open('Makefile', 'w') as mf:
+            # Main modules
+            mf.write(
+                f"""
+# This Makefile is generated automatically by easy-module class
+obj-m += {' '.join([objm + '.o' for objm in objs_data.keys()])}
+""")
+
+            # Modules dependencies
+            for k_module, deps in objs_data.items():
+                if deps:
+                    mf.write(
+                        f"""
+{k_module}-objs += {' '.join([dep for dep in deps])}
+""")
+
+            # Rest of Makefile
+            mf.write(
+                """
+SRC := $(shell pwd)
+
+all:
+\t$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
+
+modules_install:
+\t$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
+
+clean:
+\trm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
+\trm -f Module.markers Module.symvers modules.order
+\trm -rf .tmp_versions Modules.symvers
+""")
+}
+
+RPROVIDES:${PN} += "kernel-module-${PN}"
+
+export SRC = "${B}"
+
+do_prepare_makefile[docs] = "Automate Makefile preparation for simple Kernel modules"
+do_prepare_makefile[dirs] = "${B}"
+addtask do_prepare_makefile before do_configure after do_patch
\ No newline at end of file
-- 
2.25.1


