Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E1EC433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:09 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.813.1637704688662123513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qttcxyWC;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id q64so672272qkd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2U1E2krX92EOx6o7PXCPaZFuYVqEBwSUdzULcXWtMg=;
        b=qttcxyWCF7x/6uwFULz7NqE+7VeLYJDbXTjYi+R/FZ43gSc2570XjLs487RSs5v/l4
         JOpB11PMbzM+uLsLwdobcdhzN6+eXC0y6Y5hmsDyVWHKY/MEc2fLGjjoSxReBvTVfD7+
         JwGmVOQtH71voGd2Si+pd0rmUv7n5eG0gzWmNTwof1Zm+Dg7pRXlXomRnsd1LTCSFZkQ
         SmTr0A96ckH1vHGJ9/L1Sofgs3cfkLg3fAXVXfgtWlHzyFVZVgIX1QlAz9dhC9x+nb9k
         MoZKqFokC+5lraflASsWI0qcTWWYzHhJJKKkMnhh5IBQE62HQ5bxslALddILLBVIGwL5
         lsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2U1E2krX92EOx6o7PXCPaZFuYVqEBwSUdzULcXWtMg=;
        b=SWTZjrYohBvOUtsSmac1dCcyZyYR6UcwQe/EBpBvKkhMqJSJFrtVPjhWpLaQM7kdva
         gQsSQN/YZbq1GAx4a0+/b+5Vegq3r1ew+MR17t+rdYjirP/kQUEcUWCmAiY5KORnYiiS
         okTYg6tvUN5U/dJxN36K4ppf0zZOXew38FosvTSosdwwv5oJ3wzy0pc/bGC5DcMitEu9
         NkfGmYcDO1gPrKBpqSxRjPt/1POQ7B9egu591whXVNCz9VB1d10ZcLYdcacbkuq+UOYP
         9OBQC70xaGJn0yyqi8WrM2VQEii4uxTfZO9vi/VHhfHkHI2a9eU9eWIDZX6QiHIGrVT1
         Fu9g==
X-Gm-Message-State: AOAM530P8pTjQUod2PWwZdNU2unVx0aXQdzM0HdaSyt/eVEhVcvgIi/0
	ym8PsGjCTe+IOI+TDOziLITJY0U4Rce/uw==
X-Google-Smtp-Source: 
 ABdhPJzLECOr28GqNKooe6mtuWj3DwLz3Vq3t4caWjmAx2bLFUTtCp5pKmK3idKgtBblsw7oSqXyLQ==
X-Received: by 2002:a05:620a:4489:: with SMTP id
 x9mr746404qkp.38.1637704687791;
        Tue, 23 Nov 2021 13:58:07 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:07 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 17/20] kernel: introduce python3-dtschema-wrapper
Date: Tue, 23 Nov 2021 16:57:44 -0500
Message-Id: 
 <e331131cff1f9dfb198120799f3df8c057ace12c.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158638

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.16 kernel introduced mandatory schema checking on any dtb file
built through the kernel.

That funcionality is provided via python3-dt-schema.

The dependencies to enable that functionality is not small, and may
not always be desired (in particular on architectures that do not
support dtbs, or in development cycles). It may also be useful for
allowing a non-conformant dts to be compiled.

This commit introduces a set of wrapper scripts that when added
as a depenency to the kernel, can pass both the validation testing
and validation steps of a dts.

We use the wrapper by default, while more dts file are brought up
to spec and the dt-validation matures upstream.

To enable valiation, simply add 'dt-valiation' to the PACKAGECONFIG
variable and the full dt-schema package will be selected and
validation will occur.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python3-dtschema-wrapper/dt-doc-validate  | 20 +++++++++++++++++++
 .../dtc/python3-dtschema-wrapper/dt-mk-schema | 20 +++++++++++++++++++
 .../dtc/python3-dtschema-wrapper/dt-validate  | 20 +++++++++++++++++++
 .../dtc/python3-dtschema-wrapper_2021.10.bb   | 17 ++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3919c5ede6..ba7a47c30d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -598,6 +598,7 @@ RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-dtschema-wrapper = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
new file mode 100644
index 0000000000..2aa57851c7
--- /dev/null
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
@@ -0,0 +1,20 @@
+#!/bin/sh
+# dt-doc-validate wrapper to allow kernel dt-validation to pass
+#
+# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
+# License: MIT (see COPYING.MIT at the root of the repository for terms)
+
+for arg; do
+    case "$arg" in
+        --version)
+            echo "v2021.10"
+            ;;
+    esac
+done
+
+# TBD: left for future consideration
+# exec dt-doc-validate.real "$@"
+
+# we always succeed
+exit 0
+
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
new file mode 100644
index 0000000000..24b89d8619
--- /dev/null
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
@@ -0,0 +1,20 @@
+#!/bin/sh
+# dt-mk-schema wrapper to allow kernel dt-validation to pass
+#
+# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
+# License: MIT (see COPYING.MIT at the root of the repository for terms)
+
+for arg; do
+    case "$arg" in
+        --version)
+            echo "v2021.10"
+            ;;
+    esac
+done
+
+# TBD: left for future consideration
+# exec dt-mk-schema.real "$@"
+
+# we always succeed
+exit 0
+
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
new file mode 100644
index 0000000000..8a4710a7ed
--- /dev/null
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
@@ -0,0 +1,20 @@
+#!/bin/sh
+# dt-validate wrapper to allow kernel dt-validation to pass
+#
+# Copyright (C) 2021 Bruce Ashfield <bruce.ashfield@gmail.com>
+# License: MIT (see COPYING.MIT at the root of the repository for terms)
+
+for arg; do
+    case "$arg" in
+        --version)
+            echo "v2021.10"
+            ;;
+    esac
+done
+
+# TBD: left for future consideration
+# exec dt-validate.real "$@"
+
+# we always succeed
+exit 0
+
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
new file mode 100644
index 0000000000..c869274d09
--- /dev/null
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Wrapper for tooling for devicetree validation using YAML and jsonschema"
+HOMEPAGE = "https://yoctoproject.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://dt-doc-validate \
+           file://dt-mk-schema \
+           file://dt-validate"
+
+do_install() {
+    install -d ${D}${bindir}/
+    install -m 755 ${WORKDIR}/dt-doc-validate ${D}${bindir}/
+    install -m 755 ${WORKDIR}/dt-mk-schema ${D}${bindir}/
+    install -m 755 ${WORKDIR}/dt-validate ${D}${bindir}/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


