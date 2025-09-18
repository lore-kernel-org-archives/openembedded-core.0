Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4360CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:20 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.310.1758229694851914021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=h0VrNadm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20250918210812042ff41a2c00020703-suwyyr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250918210812042ff41a2c00020703
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1moeDp1RSORs4bGQi61R5RMqDKPFxlRoZmLbcUvkzxs=;
 b=h0VrNadmFdMNwwd0Me6QOBpxdGXjia78bFbhU2ZH4nKeE1r2uYYjl2gERpEPgE+LwvKZCk
 ujuRS1AC+QqBeFFYPD3Mqj5QfAf/encExTplfe7Ja1W5dER39TnqhI4KUNi7DVnekX4rST1P
 N/Vy3Q+ylBQJkTyInDocMI6bLBw7apwpqkVYCO/J6fSGKn4+bEBO06qBDALBuU0+qtqpOaGM
 6KH+b3TVJUEK7LNZIhDqbCYQu7K5UTB1X+y1HgATsPaK6C1XF1tAbrO6RkCBOP9xlvRc3938
 hVIev2uWuE029ToWrj8TRRd6jWDDHh5v8hX2u84AJ3sIoXriFtkRVBgw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 18/19] module.bbclass: move environment setup to kernel_module.py
Date: Thu, 18 Sep 2025 23:07:20 +0200
Message-ID: <20250918210754.477049-19-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223676

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Refactor: move kernel module environment setup from do_devshell to
kernel_module.py

Extract the kernel module environment variable setup from do_devshell
into oe.kernel_module.kernel_module_os_env(). This enables code reuse
for future features such as devtool ide-sdk.

Note: it would also be possible to e.g. bb.utils.py. But when every such
a widely used utility function gets changed, bitbake needs to recompile
a lot of code. Therefore it's probably better to put it into a
separate file. It also is a very specific function, so oe.kernel_module
seems to be a good place.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/module.bbclass | 21 ++-------------------
 meta/lib/oe/kernel_module.py       | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 19 deletions(-)
 create mode 100644 meta/lib/oe/kernel_module.py

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 4948e995c5d..ca2dcba43e0 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -25,25 +25,8 @@ python do_package:prepend () {
 }
 
 python do_devshell:prepend () {
-    os.environ['CFLAGS'] = ''
-    os.environ['CPPFLAGS'] = ''
-    os.environ['CXXFLAGS'] = ''
-    os.environ['LDFLAGS'] = ''
-
-    os.environ['KERNEL_PATH'] = d.getVar('STAGING_KERNEL_DIR')
-    os.environ['KERNEL_SRC'] = d.getVar('STAGING_KERNEL_DIR')
-    os.environ['KERNEL_VERSION'] = d.getVar('KERNEL_VERSION')
-    os.environ['CC'] = d.getVar('KERNEL_CC')
-    os.environ['LD'] = d.getVar('KERNEL_LD')
-    os.environ['AR'] = d.getVar('KERNEL_AR')
-    os.environ['OBJCOPY'] = d.getVar('KERNEL_OBJCOPY')
-    os.environ['STRIP'] = d.getVar('KERNEL_STRIP')
-    os.environ['O'] = d.getVar('STAGING_KERNEL_BUILDDIR')
-    kbuild_extra_symbols = d.getVar('KBUILD_EXTRA_SYMBOLS')
-    if kbuild_extra_symbols:
-        os.environ['KBUILD_EXTRA_SYMBOLS'] = kbuild_extra_symbols
-    else:
-        os.environ['KBUILD_EXTRA_SYMBOLS'] = ''
+    import oe.kernel_module
+    oe.kernel_module.kernel_module_os_env(d, os.environ)
 }
 
 module_do_compile() {
diff --git a/meta/lib/oe/kernel_module.py b/meta/lib/oe/kernel_module.py
new file mode 100644
index 00000000000..678f7de03b4
--- /dev/null
+++ b/meta/lib/oe/kernel_module.py
@@ -0,0 +1,22 @@
+
+# Set up the environment for building kernel modules
+def kernel_module_os_env(d, env_dict):
+    env_dict['CFLAGS'] = ''
+    env_dict['CPPFLAGS'] = ''
+    env_dict['CXXFLAGS'] = ''
+    env_dict['LDFLAGS'] = ''
+
+    env_dict['KERNEL_PATH'] = d.getVar('STAGING_KERNEL_DIR')
+    env_dict['KERNEL_SRC'] = d.getVar('STAGING_KERNEL_DIR')
+    env_dict['KERNEL_VERSION'] = d.getVar('KERNEL_VERSION')
+    env_dict['CC'] = d.getVar('KERNEL_CC')
+    env_dict['LD'] = d.getVar('KERNEL_LD')
+    env_dict['AR'] = d.getVar('KERNEL_AR')
+    env_dict['OBJCOPY'] = d.getVar('KERNEL_OBJCOPY')
+    env_dict['STRIP'] = d.getVar('KERNEL_STRIP')
+    env_dict['O'] = d.getVar('STAGING_KERNEL_BUILDDIR')
+    kbuild_extra_symbols = d.getVar('KBUILD_EXTRA_SYMBOLS')
+    if kbuild_extra_symbols:
+        env_dict['KBUILD_EXTRA_SYMBOLS'] = kbuild_extra_symbols
+    else:
+        env_dict['KBUILD_EXTRA_SYMBOLS'] = ''
-- 
2.51.0


