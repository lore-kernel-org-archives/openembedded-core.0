Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08E8C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 08:42:14 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.8838.1633596133570530168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 01:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4D38320B85E6;
	Thu,  7 Oct 2021 01:42:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4D38320B85E6
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-image: Fix do_image dependencies
Date: Thu,  7 Oct 2021 02:42:05 -0600
Message-Id: <20211007084205.2641356-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 08:42:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156706

Commit 282d596b8 added a fix for image.bbclass related to QEMU
dependencies, such fix made the older logic borrowed from
image.bbclass incompatible.

Update the dependency logic to reflect new changes, we no longer
need to add the do_addto_recipe_sysroot dependency specifically.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes/baremetal-image.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremeta=
l-image.bbclass
index 089c445522..81f5e5e93d 100644
--- a/meta/classes/baremetal-image.bbclass
+++ b/meta/classes/baremetal-image.bbclass
@@ -105,13 +105,17 @@ inherit qemuboot
 python(){
     # do_addto_recipe_sysroot doesnt exist for all recipes, but we need =
it to have
     # /usr/bin on recipe-sysroot (qemu) populated
+    # The do_addto_recipe_sysroot dependency is coming from EXTRA_IMAGDE=
PENDS now,
+    # we just need to add the logic to add its dependency to do_image.
     def extraimage_getdepends(task):
         deps =3D ""
         for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
         # Make sure we only add it for qemu
             if 'qemu' in dep:
-                deps +=3D " %s:%s" % (dep, task)
+                if ":" in dep:
+                    deps +=3D " %s " % (dep)
+                else:
+                    deps +=3D " %s:%s" % (dep, task)
         return deps
-    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_add=
to_recipe_sysroot'))
-    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_pop=
ulate_sysroot'))
+    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_pop=
ulate_sysroot'))=20
 }
--=20
2.25.1


