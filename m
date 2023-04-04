Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1756BC76196
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 03:10:19 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.92404.1680577810504366884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 20:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 334398XL009005;
	Mon, 3 Apr 2023 22:09:08 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, Qi.Chen@windriver.com
Subject: [master][mickledore][PATCH] sanity.bbclass: Update minimum gcc version to 8.0
Date: Mon,  3 Apr 2023 22:09:06 -0500
Message-Id: <1680577746-26462-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 03:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179672

From: Mark Hatle <mark.hatle@amd.com>

With a gcc older then 8.0, meta-native will fail to build with the error:
  sorry, unimplemented: non-trivial designated initializers not supported

According to https://docs.mesa3d.org/install.html?highlight=gcc+version#compile
the required minimum compiler version is now GCC 8.0.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes-global/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 2d1ff7072c..abb52fbe21 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -475,7 +475,7 @@ def check_wsl(d):
             bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
     return None
 
-# Require at least gcc version 7.5.
+# Require at least gcc version 8.0
 #
 # This can be fixed on CentOS-7 with devtoolset-6+
 # https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
@@ -488,8 +488,8 @@ def check_gcc_version(sanity_data):
     
     build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
     if build_cc.strip() == "gcc":
-        if bb.utils.vercmp_string_op(version, "7.5", "<"):
-            return "Your version of gcc is older than 7.5 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
+        if bb.utils.vercmp_string_op(version, "8.0", "<"):
+            return "Your version of gcc is older than 8.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
     return None
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
-- 
2.17.1


