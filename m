Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF07C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.2711.1642713868396001307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jmHmyoXi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id v74so3568677pfc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qb8eSgyuT+JEUS+RgqgmziOFT+cSQNQn/aHmo7ASWEw=;
        b=jmHmyoXilB0JtBpbQ/kLOdHsvIlpYlnlYvdsB8/60ruFpNeE5MUyjTpqCHaA1Ol0l9
         si0fvLL12Xcjh7xAJTzVzUZr9EdKZZDQ/bIrPhhYugqv4JCnWTSVy3HOfikxop6hNrUc
         QXV13s0x9eiDCoGssxgrIuurJsR1eJB/gDeGquWuDrZIgYDAobAbodTRMw8dViYs0D0C
         rvb0GVGoO4u80+KMFxy+pd/BCTjUI5imczGb2FScuGqcIMNa9F9FGVlxV3AFJpPL2oRd
         8wkjNnNvSwYp1+nQVuoCJ4GS0c0BZudplkFaj+zh9pEdB0o+E+g9C4atZHOIUNAs+tpk
         r6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qb8eSgyuT+JEUS+RgqgmziOFT+cSQNQn/aHmo7ASWEw=;
        b=yOKqglkOXxGKbKUD3H9xjh0ReMiCXdnfORHYHsA87TxKFRiIv8RUjepFsMVwlTMXLI
         bubv6JwlzR/m4Js90XL8YFOtowSLlSfwN7vw5CVx3XwCxro8FcuI6rk+BBNZhRJJ9ty9
         5ndsYMYvPXLhmTUjQcrPxslVYrESlXq+0nEnwNYzR8nJo0QNGDqFlDc7t3yvdrgU2ujE
         izOrxgT6dGVLzLqJrXsQo3yyj/FFc99Em2ZPEXiXFHx/KoCTv+NAO6AuG6oOsDwNc9/+
         O23lMYgZuCyYRuLbF3HjsEeZnAZDF6Dty8dyVFzRb1YOilH1X1rTap8sjs1T9EJH8Ryq
         +L1Q==
X-Gm-Message-State: AOAM530VUnSvzzeRGM6t6A5xf0m2v+CLdD+ZBN7x/jgw4LlzLVUk4wZx
	khH17r+Jl2sMJSuPkmDxlDebBKMuLwUQ9bqVewU=
X-Google-Smtp-Source: 
 ABdhPJwor5x3+EzFvl/2MK7ic2hUaLzNVgE3QRgBWj6uv4qbC9yDHfacakN5jD4uuFQFgkt4mIweaA==
X-Received: by 2002:a65:4688:: with SMTP id h8mr537916pgr.143.1642713867379;
        Thu, 20 Jan 2022 13:24:27 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/11] kernel: introduce python3-dtschema-wrapper
Date: Thu, 20 Jan 2022 11:23:48 -1000
Message-Id: 
 <010477bc44a90b1f0dea82fbb824c9c9038edc80.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642693490.git.steve@sakoman.com>
References: <cover.1642693490.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160799

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

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from oe-core commit 2566563ad49d.
Signed-off-by: Paul Barker <paul.barker@sancloud.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 895cf89487..1575fce8c7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -576,6 +576,7 @@ RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravch
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-dtschema-wrapper = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
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
2.25.1


