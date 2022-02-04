Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B11CC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:12:55 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=FSkNtnDF;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983973; x=1675519973;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GEtuFKBVP2RBCc0eF77gznXRgAPT9CIv3ISg6k1OIJQ=;
  b=FSkNtnDFI82BZE5yREB4v+rtzA9gc+eWrLWCjn8VniwR0DXj/vE2TbmL
   CZtvw8XThkX0FivouIHdytCbMBXJNRr+SLk57XYE6jjXi5lZnjLO8qqKa
   kz15Z/JKSqcFfOPYQrRtPF/knwgB6qdTuRsZSCgyd3Vf4z/GKQ0mebUzh
   Jf2NIMTVLpUUhIYiDeIMtsr7Hbvx7LGbuydu46gohW/6Si1IZmyQ8fxop
   zU4Pjpqfdwix/rBNTOOgo+/4zcqSO1vE4WNSQ3cvEkeQgirT9lr8bPkEG
   0sa01voc0Yi4y5CqlG5Ds2KocCfU+ak/wdc/x7sqamnhvQRgV5BIxgVRx
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321585"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321585"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566749991"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:52 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/17] kernel: introduce python3-dtschema-wrapper
Date: Fri,  4 Feb 2022 22:12:27 +0800
Message-Id: 
 <cc9d4a69e6c6aa99ff58232b37a607ee3ac48a67.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:12:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161348

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
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
index b3b7711a0c..2b54d2d12f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -592,6 +592,7 @@ RECIPE_MAINTAINER:pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr
 RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
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
2.34.1


