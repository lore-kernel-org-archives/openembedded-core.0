Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF43C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 03:16:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.43664.1643685415829502594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 19:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF95640C5D;
	Tue,  1 Feb 2022 03:16:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxGDR0_FwjZ0; Tue,  1 Feb 2022 03:16:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B21AF40A28;
	Tue,  1 Feb 2022 03:16:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D560F17471A;
	Mon, 31 Jan 2022 22:16:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] yocto-check-layer: add ability to perform tests from a global
 bbclass
Date: Mon, 31 Jan 2022 22:16:42 -0500
Message-Id: <1643685402-43865-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 03:16:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161145

This is useful when needing to test layer's recipes, where this special
bbclass can define a global python function that gets called on each
recipe parsing during "bitbake -S none world" signature dump and be able
to fail layer's check accordingly.

First test being added is to detect recipes skipping "installed-vs-shipped"
QA check. As "installed-vs-shipped" is a packaging QA check, it happens very
late in the build process and failing it could mean some potential issues
with packaging, especially when recipe uses BBCLASSEXTEND="nativesdk" and
resulting package is used in an SDK.

In OE-Core failing this QA check leads to an error, but other layers can
suppress it or change it to a warning. Detecting weird packaging problems
with SDKs is quite difficult and time consuming. Also, waiting for the
actual "installed-vs-shipped" packaging QA check to fail means that all
recipes in the layer under test have to run through all standard tasks in
the build chain, equivalent to a multi-hour world-build.

Hence yocto-check-layer takes a shortcut and only detects a mere attempt
at skipping "installed-vs-shipped" QA check in the INSANE_SKIP list during
initial parsing when dumping the signature information for the layer.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/classes/yocto-check-layer.bbclass | 16 ++++++++++++++++
 scripts/lib/checklayer/__init__.py     |  5 ++++-
 scripts/lib/checklayer/cases/common.py | 15 +++++++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/yocto-check-layer.bbclass

diff --git a/meta/classes/yocto-check-layer.bbclass b/meta/classes/yocto-check-layer.bbclass
new file mode 100644
index 0000000..329d3f8
--- /dev/null
+++ b/meta/classes/yocto-check-layer.bbclass
@@ -0,0 +1,16 @@
+#
+# This class is used by yocto-check-layer script for additional per-recipe tests
+# The first test ensures that the layer has no recipes skipping 'installed-vs-shipped' QA checks
+#
+
+WARN_QA:remove = "installed-vs-shipped"
+ERROR_QA:append = " installed-vs-shipped"
+
+python () {
+    packages = set((d.getVar('PACKAGES') or '').split())
+    for package in packages:
+        skip = set((d.getVar('INSANE_SKIP') or "").split() +
+                   (d.getVar('INSANE_SKIP:' + package) or "").split())
+        if 'installed-vs-shipped' in skip:
+            oe.qa.handle_error("installed-vs-shipped", 'Package %s is skipping "installed-vs-shipped" QA test.' % package, d)
+}
diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index e69a10f..9186160 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -261,7 +261,7 @@ def check_command(error_msg, cmd, cwd=None):
         raise RuntimeError(msg)
     return output
 
-def get_signatures(builddir, failsafe=False, machine=None):
+def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
     import re
 
     # some recipes needs to be excluded like meta-world-pkgdata
@@ -273,6 +273,9 @@ def get_signatures(builddir, failsafe=False, machine=None):
     tune2tasks = {}
 
     cmd = 'BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE BB_SIGNATURE_HANDLER" BB_SIGNATURE_HANDLER="OEBasicHash" '
+    if extravars:
+        cmd += extravars
+        cmd += ' '
     if machine:
         cmd += 'MACHINE=%s ' % machine
     cmd += 'bitbake '
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 9f15e05..318cda1 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -54,6 +54,21 @@ class CommonCheckLayer(OECheckLayerTestCase):
         '''
         get_signatures(self.td['builddir'], failsafe=False)
 
+    def test_world_inherit_class(self):
+        '''
+        This also does "bitbake -S none world" along with inheriting "yocto-check-layer"
+        class, which can do additional per-recipe test cases.
+        '''
+        msg = []
+        try:
+            get_signatures(self.td['builddir'], failsafe=False, machine=None, extravars='BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE INHERIT" INHERIT="yocto-check-layer"')
+        except RuntimeError as ex:
+            msg.append(str(ex))
+        if msg:
+            msg.insert(0, 'Layer %s failed additional checks from yocto-check-layer.bbclass\nSee below log for specific recipe parsing errors:\n' % \
+                self.tc.layer['name'])
+            self.fail('\n'.join(msg))
+
     def test_signatures(self):
         if self.tc.layer['type'] == LayerType.SOFTWARE and \
            not self.tc.test_software_layer_signatures:
-- 
2.7.4


