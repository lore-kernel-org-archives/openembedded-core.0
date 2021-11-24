Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C18C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:48 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.4155.1637788487054926111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E299xVKO;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id t6so5080280qkg.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8IEuULURoP9EffmSQfyN36qWcH1zhq2wf364rgurxDI=;
        b=E299xVKOuItkBeteCQfj1Q8Wxkp4yJ/5S2SVgNihWobOH2jc9J0J9V6//y2dUF+7Qh
         GHuCJu+MNdvgcHtBDPluOReWoq+5e0vsLrdmoIoLeLvTIDs3+RHNY5+eAhnlKZMNLj77
         RxL6ryRYbg4uxzCt0Z4MjgwZlPaUyBMdA/ymUD7AayeFGiW6j1gKUdAZkCHF8yX1bqrM
         3B+yA8LPnTWnFMZYVSaGJuXCoe8CZxazO3tPidxqHVO4f1StSaeGN3ciPhb/tB1GNRw9
         mrvndU/pc0Ckv3GF+3tMUp9sYJQyXRnJbFqrsYaourXd0aPiJVm/kEBkEr8W+P9ALonX
         /JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8IEuULURoP9EffmSQfyN36qWcH1zhq2wf364rgurxDI=;
        b=QMUMWqaNfmZyI4Ya0NaOgEjiYZty/bJDpwCoanHHIvc1ylkDufjHbMQtMkLZ63cJeK
         N7h+Amhjj6aLTLNmQ3cF3P6XSDdEbrXQ8qau1vsSWmE7H3E9vQ9iR7Yor+VnRxsN7z58
         ZpHgkdOxk3Mn1o9plZIex3Gmr9OhQ97u4TisnRqZIIUPZqwbTiyqyQfcs3v+RkFaMdov
         1/d7GCMprX+FnpXvnqQ2wKLAS1JVKwIAy1sOzbg2myTlqLCt8LRjgRQ54sLbAhWW2nie
         hgi8akrSVUbO7JTNI2DiCMdn6ULbUhnW/5cZqEwkD3zdytXrqWlJtDn6nCUIXZAUun68
         d1QA==
X-Gm-Message-State: AOAM5324LqQz8dqoqgmpg6AU8UCDADX/4AWz1PFTJNnuZ0azwhsZZvph
	+02fVCaF2nlTp6WS4x6j1FyjTnnrwg/t3A==
X-Google-Smtp-Source: 
 ABdhPJyJ7BocKgmqM7IkVXirC/c7sRp9FZEqQZ19hH9yUYxV68tM/a9f4h4ZEKOFWEw4l4D8vKTx5g==
X-Received: by 2002:a37:4250:: with SMTP id p77mr9584813qka.430.1637788486179;
        Wed, 24 Nov 2021 13:14:46 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:45 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 17/20] kernel: introduce python3-dtschema-wrapper
Date: Wed, 24 Nov 2021 16:14:23 -0500
Message-Id: 
 <ad8f3958e10e645219f442d8ebb5711767288f16.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158763

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
index c717cfbbe1..464714a7a9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -598,6 +598,7 @@ RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-dtschema-wrapper = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
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


