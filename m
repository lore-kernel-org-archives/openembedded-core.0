Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D74C27C47
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 00:08:00 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.35199.1698451672167672231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 17:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lCInwD7/;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: bhstalel@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so38927491fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 17:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698451670; x=1699056470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pCvEkaVL8dzM+OEuAKP3tnjE+i2qj2f87UC1qv4RtrM=;
        b=lCInwD7/YbU8gW1y7U4gnqu8BO37x3BMDSyDyemcBfqbB3/vuaW4QBHyIEgDz1F4rJ
         X+M4ehOAdz5Nybfs20TwAD9Gk8tuw5ah+c66jPD2QfkzK/qx3L1Za8BlHbKSlUqT44Yl
         IpyRUKR8SzzyVZ73GzL0j1cLSpriqeIxaVvwcVdbEhojcScMhDMJBZH9POG3wePbKVi1
         4PLp66dU99upumGV6VGfeCs9tcj3vzTyJCb8F+Bvrn584kEW9DXzsNzS4genV8wmBm8R
         EOFClqmBNMFtyTPaBL174Oa1B9faXVn1sckJdbBSjRILSDG+5D8HUdO8naPFkKP0KNmJ
         EUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698451670; x=1699056470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCvEkaVL8dzM+OEuAKP3tnjE+i2qj2f87UC1qv4RtrM=;
        b=mzwv2CbUxft1myB4UzvFXrb73KivA45XIX+cvhhEgrNKqiZGVJYx7Fq4CS4fblL7uk
         UP62RpfIQ64a+0XSgFqO97WKqjiq1H+DUQ3IureJw7YaceD057vq8ZVGVbPeJxm7LDbx
         hjN89pUP13j8k+1YJ6+TTu+LoKcfFaZH444sxe21Zd/xDuJ7WtJit8dL5Xhk7NQwtL2B
         sA+xOU1bcZd1VlkpiFdeoMplbHBi4GPyd642OiBj03jAZDMu9C3qt2zQa+kPDk4tyXNo
         q3lba9yHhvNMA9Eca6kjAPQ9JqrHe2pIcp/eGiqT2W3x/eN3AVvrNIlXDN3bqv3PIakT
         mFRQ==
X-Gm-Message-State: AOJu0YzN0PDaZxcrAYHHj6H9pgJ4+z/GbrTNaBCjeAYZ8ZkIbWz4nm0o
	cPZqK29dhhaHzvLShx0W6ZOj+P0ArQpqCA==
X-Google-Smtp-Source: AGHT+IEEKAcEgj0KI0fJiyonOqd+eozatJeDFxF2CCxo68pD5nOhkYXoT1r6rgTgeb09lfH9FZU2pg==
X-Received: by 2002:a2e:88c2:0:b0:2c5:1df1:ac1 with SMTP id a2-20020a2e88c2000000b002c51df10ac1mr3323482ljk.20.1698451669808;
        Fri, 27 Oct 2023 17:07:49 -0700 (PDT)
Received: from localhost.localdomain ([196.229.6.8])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b004068e09a70bsm2709790wmo.31.2023.10.27.17.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 17:07:49 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [OE-Core][PATCH] meta: classes-recipe: A class for simple Kernel modules
Date: Sat, 28 Oct 2023 01:07:38 +0100
Message-Id: <20231028000738.968009-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 00:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189756

The module class provides what is needed to compile a Linux Kernel module
but since the Makefile is always the same for simple modules that have
their sources in one directory level, I thought of creating new class wrapper
to automatically prepare the Makefile.
Also, using variable flag feature, a recipe can provide multiple modules
and can be handled the same way as PACKAGECONFIG is used to enabled/disable
features.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 .../recipes-kernel/hello-mod/hello-mod_0.1.bb |  11 +-
 meta/classes-recipe/simple-module.bbclass     | 116 ++++++++++++++++++
 2 files changed, 120 insertions(+), 7 deletions(-)
 create mode 100644 meta/classes-recipe/simple-module.bbclass

diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index a2fb212a68..f191b08be5 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -3,16 +3,13 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-inherit module
+inherit simple-module
 
-SRC_URI = "file://Makefile \
-           file://hello.c \
+SRC_URI = "file://hello.c \
            file://COPYING \
           "
 
 S = "${WORKDIR}"
 
-# The inherit of module.bbclass will automatically name module packages with
-# "kernel-module-" prefix as required by the oe-core build environment.
-
-RPROVIDES:${PN} += "kernel-module-hello"
+MODULE_SRC = "hello"
+MODULE_SRC[hello] = ""
\ No newline at end of file
diff --git a/meta/classes-recipe/simple-module.bbclass b/meta/classes-recipe/simple-module.bbclass
new file mode 100644
index 0000000000..a837dec848
--- /dev/null
+++ b/meta/classes-recipe/simple-module.bbclass
@@ -0,0 +1,116 @@
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
+#   MODULE_SRC[module] = "dep1 dep2"
+#
+# This will generate:
+#   obj-m += module.o
+#   module-objs += dep1.o dep2.o
+#
+# This class supports multiple modules as well
+# each module will be added to obj-m and if it has dependencies
+# an -objs variable will be created.
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


