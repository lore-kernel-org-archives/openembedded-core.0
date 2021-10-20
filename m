Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CCBC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:30:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.535.1634751011836400042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C2B81063
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 171F23F694
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/runtime: search sys.path explicitly for modules
Date: Wed, 20 Oct 2021 18:30:07 +0100
Message-Id: <20211020173008.443672-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020173008.443672-1-ross.burton@arm.com>
References: <20211020173008.443672-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 17:30:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157265

The controller module loading code needs to be told what directories
to search for modules via the target_modules_path keyword argument, which
is set to BBPATH.

However, as the actual module loading is done via importlib this relies
on the paths being on sys.path, which it is as base.bbclass puts each
layer's lib/ in sys.path.

Simplify the code by removing this indirection, and simply search
sys.path directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/context.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/con=
text.py
index 7908ce1fd4..d707ab263a 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -5,6 +5,7 @@
 #
=20
 import os
+import sys
=20
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.target.ssh import OESSHTarget
@@ -119,8 +120,7 @@ class OERuntimeTestContextExecutor(OETestContextExecu=
tor):
             # XXX: Don't base your targets on this code it will be refac=
tored
             # in the near future.
             # Custom target module loading
-            target_modules_path =3D kwargs.get('target_modules_path', ''=
)
-            controller =3D OERuntimeTestContextExecutor.getControllerMod=
ule(target_type, target_modules_path)
+            controller =3D OERuntimeTestContextExecutor.getControllerMod=
ule(target_type)
             target =3D controller(logger, target_ip, server_ip, **kwargs=
)
=20
         return target
@@ -130,15 +130,15 @@ class OERuntimeTestContextExecutor(OETestContextExe=
cutor):
     # AttributeError raised if not found.
     # ImportError raised if a provided module can not be imported.
     @staticmethod
-    def getControllerModule(target, target_modules_path):
-        controllerslist =3D OERuntimeTestContextExecutor._getControllerM=
odulenames(target_modules_path)
+    def getControllerModule(target):
+        controllerslist =3D OERuntimeTestContextExecutor._getControllerM=
odulenames()
         controller =3D OERuntimeTestContextExecutor._loadControllerFromN=
ame(target, controllerslist)
         return controller
=20
     # Return a list of all python modules in lib/oeqa/controllers for ea=
ch
     # layer in bbpath
     @staticmethod
-    def _getControllerModulenames(target_modules_path):
+    def _getControllerModulenames():
=20
         controllerslist =3D []
=20
@@ -153,9 +153,8 @@ class OERuntimeTestContextExecutor(OETestContextExecu=
tor):
                 else:
                     raise RuntimeError("Duplicate controller module foun=
d for %s. Layers should create unique controller module names" % module)
=20
-        extpath =3D target_modules_path.split(':')
-        for p in extpath:
-            controllerpath =3D os.path.join(p, 'lib', 'oeqa', 'controlle=
rs')
+        for p in sys.path:
+            controllerpath =3D os.path.join(p, 'oeqa', 'controllers')
             if os.path.exists(controllerpath):
                 add_controller_list(controllerpath)
         return controllerslist
--=20
2.25.1


