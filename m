Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F69C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 12:37:15 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.120427.1699533432703891408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 04:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NXDcrCiS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20231109123709e8ebb460fbf8d3798b-p3elzb@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20231109123709e8ebb460fbf8d3798b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 09 Nov 2023 13:37:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WVMkw8mRjOUtId0RKn8mwb755BksjuuD0yGg3V0yCkY=;
 b=NXDcrCiSniG0KCM60s291KUMCagmkuaFpIGnWIHTrE888LSqGNPbapwpQktljqFUzOaO0m
 fTVZQVsEc2BZJEztiiXoYS9zLhvRAAJ9aOd09b1ALkJPjgwtfAjb/Mdz0fKXu1BBZhfEIB2L
 OUn+vRraMtR7ix357AsbjKOEVGTII=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH] goarch: Move Go architecture mapping to a library
Date: Thu,  9 Nov 2023 13:36:11 +0100
Message-Id: <20231109123611.146694-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 12:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190384

From: Peter Marko <peter.marko@siemens.com>

Other spaces uses the Go architecture definitions as their own (for
example, container arches are defined to be Go arches). To make it
easier for other places to use this mapping, move the code that does the
translation of OpenEmbedded arches to Go arches to a library.

(From oe-core rev: 3e86f72fc2e1cc2e5ea4b4499722d736941167ce)

This commit together with meta-virtualization commit
115f6367f37095415f289fb6981cda9608ac72ff
broke meta-virtualization master used with
meta-lts-mixins kirkstone/go which is our primary
usecase for having kirkstone/go mixin layer

Manually crafted since cherry-pick had too many conflicts:
* different path to classes
* additional architecture loongarch64
* different way how to import library

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/base.bbclass   |  2 +-
 meta/classes/goarch.bbclass | 27 +++------------------------
 meta/lib/oe/go.py           | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 25 deletions(-)
 create mode 100644 meta/lib/oe/go.py

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b15c5839b6..ee26ee5597 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -12,7 +12,7 @@ inherit logging
 
 OE_EXTRA_IMPORTS ?= ""
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust ${OE_EXTRA_IMPORTS}"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust oe.go ${OE_EXTRA_IMPORTS}"
 OE_IMPORTS[type] = "list"
 
 PACKAGECONFIG_CONFARGS ??= ""
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 92fec16b82..394c0c5d84 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -61,31 +61,10 @@ SECURITY_NOPIE_CFLAGS ??= ""
 CCACHE_DISABLE ?= "1"
 
 def go_map_arch(a, d):
-    import re
-    if re.match('i.86', a):
-        return '386'
-    elif a == 'x86_64':
-        return 'amd64'
-    elif re.match('arm.*', a):
-        return 'arm'
-    elif re.match('aarch64.*', a):
-        return 'arm64'
-    elif re.match('mips64el.*', a):
-        return 'mips64le'
-    elif re.match('mips64.*', a):
-        return 'mips64'
-    elif a == 'mips':
-        return 'mips'
-    elif a == 'mipsel':
-        return 'mipsle'
-    elif re.match('p(pc|owerpc)(64le)', a):
-        return 'ppc64le'
-    elif re.match('p(pc|owerpc)(64)', a):
-        return 'ppc64'
-    elif a == 'riscv64':
-        return 'riscv64'
-    else:
+    arch = oe.go.map_arch(a)
+    if not arch:
         raise bb.parse.SkipRecipe("Unsupported CPU architecture: %s" % a)
+    return arch
 
 def go_map_arm(a, d):
     if a.startswith("arm"):
diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
new file mode 100644
index 0000000000..9996057f12
--- /dev/null
+++ b/meta/lib/oe/go.py
@@ -0,0 +1,32 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import re
+
+def map_arch(a):
+    if re.match('i.86', a):
+        return '386'
+    elif a == 'x86_64':
+        return 'amd64'
+    elif re.match('arm.*', a):
+        return 'arm'
+    elif re.match('aarch64.*', a):
+        return 'arm64'
+    elif re.match('mips64el.*', a):
+        return 'mips64le'
+    elif re.match('mips64.*', a):
+        return 'mips64'
+    elif a == 'mips':
+        return 'mips'
+    elif a == 'mipsel':
+        return 'mipsle'
+    elif re.match('p(pc|owerpc)(64le)', a):
+        return 'ppc64le'
+    elif re.match('p(pc|owerpc)(64)', a):
+        return 'ppc64'
+    elif a == 'riscv64':
+        return 'riscv64'
+    return ''
-- 
2.30.2


