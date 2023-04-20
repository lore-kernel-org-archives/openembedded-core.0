Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3203EC77B76
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 11:41:58 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.5569.1681990915017513573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 04:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH] devicetree.bbclass: Allow selection of dts files to build
Date: Thu, 20 Apr 2023 13:40:46 +0200
Message-ID: <20230420114046.873360-1-kubiznak@2n.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 11:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180248

Add DT_FILES variable to allow the user of the class to select specific
dts files to build. This is useful for packages featuring dts files
for multiple machines.

Since many machine configs contain a list of dtb files
(e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/classes-recipe/devicetree.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index ed2a92e447..fb73c44e22 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -53,8 +53,10 @@ KERNEL_INCLUDE ??= " \
 
 DT_INCLUDE[doc] = "Search paths to be made available to both the device tree compiler and preprocessor for inclusion."
 DT_INCLUDE ?= "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
-DT_FILES_PATH[doc] = "Defaults to source directory, can be used to select dts files that are not in source (e.g. generated)."
+DT_FILES_PATH[doc] = "Path to the directory containing dts files to build. Defaults to source directory."
 DT_FILES_PATH ?= "${S}"
+DT_FILES[doc] = "Space-separated list of dts or dtb files to build. If empty, all dts files are built."
+DT_FILES ?= ""
 
 DT_PADDING_SIZE[doc] = "Size of padding on the device tree blob, used as extra space typically for additional properties during boot."
 DT_PADDING_SIZE ??= "0x3000"
@@ -125,7 +127,10 @@ def devicetree_compile(dtspath, includes, d):
     subprocess.run(dtcargs, check = True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
 
 python devicetree_do_compile() {
+    import re
     includes = expand_includes("DT_INCLUDE", d)
+    dtfiles = d.getVar("DT_FILES")
+    filter = [ re.sub('dtb[o]?', 'dts', dtfile) for dtfile in dtfiles.split() ]
     listpath = d.getVar("DT_FILES_PATH")
     for dts in os.listdir(listpath):
         dtspath = os.path.join(listpath, dts)
@@ -134,6 +139,9 @@ python devicetree_do_compile() {
                 continue # skip non-.dts files and non-overlay files
         except:
             continue # skip if can't determine if overlay
+        if filter:
+            if not(dts in filter):
+                continue # skip if dts not in defined filter
         devicetree_compile(dtspath, includes, d)
 }
 
-- 
2.30.2


