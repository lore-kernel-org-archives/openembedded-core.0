Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0513C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:30:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.530.1634751011202789116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9370ED1
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 829E53F694
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/runtime: load modules using importlib
Date: Wed, 20 Oct 2021 18:30:06 +0100
Message-Id: <20211020173008.443672-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 17:30:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157264

Instead of using __import__() which is low-level and discouraged, use
importlib.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/context.py | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/con=
text.py
index 3826f27642..7908ce1fd4 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -175,16 +175,12 @@ class OERuntimeTestContextExecutor(OETestContextExe=
cutor):
     # Search for and return a controller or None from given module name
     @staticmethod
     def _loadControllerFromModule(target, modulename):
-        obj =3D None
-        # import module, allowing it to raise import exception
-        module =3D __import__(modulename, globals(), locals(), [target])
-        # look for target class in the module, catching any exceptions a=
s it
-        # is valid that a module may not have the target class.
         try:
-            obj =3D getattr(module, target)
-        except:
-            obj =3D None
-        return obj
+            import importlib
+            module =3D importlib.import_module(modulename)
+            return getattr(module, target)
+        except AttributeError:
+            return None
=20
     @staticmethod
     def readPackagesManifest(manifest):
--=20
2.25.1


