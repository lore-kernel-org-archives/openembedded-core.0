Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332FAC77B78
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 07:24:57 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.2403.1682493890258127980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 00:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v4] devicetree.bbclass: Allow selection of dts files to build
Date: Wed, 26 Apr 2023 09:22:04 +0200
Message-ID: <20230426072204.3255437-1-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 07:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180407

Add DT_FILES variable to allow the user of the class to select specific
dts files to build. This is useful for packages featuring dts files
for multiple machines.

To make DT_FILES consistent with KERNEL_DEVICETREE, the list works
with both dts and dtb files.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/classes-recipe/devicetree.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index ed2a92e447..bd50d7fa1d 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -53,8 +53,10 @@ KERNEL_INCLUDE ??= " \
 
 DT_INCLUDE[doc] = "Search paths to be made available to both the device tree compiler and preprocessor for inclusion."
 DT_INCLUDE ?= "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
-DT_FILES_PATH[doc] = "Defaults to source directory, can be used to select dts files that are not in source (e.g. generated)."
+DT_FILES_PATH[doc] = "Path to the directory containing dts files to build. Defaults to source directory."
 DT_FILES_PATH ?= "${S}"
+DT_FILES[doc] = "Space-separated list of dts or dtb files (relative to DT_FILES_PATH) to build. If empty, all dts files are built."
+DT_FILES ?= ""
 
 DT_PADDING_SIZE[doc] = "Size of padding on the device tree blob, used as extra space typically for additional properties during boot."
 DT_PADDING_SIZE ??= "0x3000"
@@ -125,9 +127,12 @@ def devicetree_compile(dtspath, includes, d):
     subprocess.run(dtcargs, check = True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
 
 python devicetree_do_compile() {
+    import re
     includes = expand_includes("DT_INCLUDE", d)
+    dtfiles = d.getVar("DT_FILES").split()
+    dtfiles = [ re.sub(r"\.dtbo?$", ".dts", dtfile) for dtfile in dtfiles ]
     listpath = d.getVar("DT_FILES_PATH")
-    for dts in os.listdir(listpath):
+    for dts in dtfiles or os.listdir(listpath):
         dtspath = os.path.join(listpath, dts)
         try:
             if not(os.path.isfile(dtspath)) or not(dts.endswith(".dts") or devicetree_source_is_overlay(dtspath)):
-- 
2.30.2


