Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51940C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 10:54:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12376.1715684066337544143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 03:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9E951007
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 03:54:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F5843F762
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 03:54:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] lib/oe/package-manager: allow including self in create_packages_dir
Date: Tue, 14 May 2024 10:54:21 +0000
Message-Id: <20240514105423.2496922-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 10:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199256

This function is typically used to construct a limited feed for image
creation, but there are other cases when you might want a limited feed
and include the current recipe's packages in it.

To ensure that existing behaviour is preserved, add a boolean to control
this behaviour and default it to False.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package_manager/__init__.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/packag=
e_manager/__init__.py
index 6774cdb794d..d3b23178949 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -449,7 +449,7 @@ class PackageManager(object, metaclass=3DABCMeta):
             return res
         return _append(uris, base_paths)
=20
-def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydep=
endencies):
+def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydep=
endencies, include_self=3DFalse):
     """
     Go through our do_package_write_X dependencies and hardlink the pack=
ages we depend
     upon into the repo directory. This prevents us seeing other packages=
 that may
@@ -486,14 +486,17 @@ def create_packages_dir(d, subrepo_dir, deploydir, =
taskname, filterbydependencie
         bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
     pkgdeps =3D set()
     start =3D [start]
-    seen =3D set(start)
+    if include_self:
+        seen =3D set()
+    else:
+        seen =3D set(start)
     # Support direct dependencies (do_rootfs -> do_package_write_X)
     # or indirect dependencies within PN (do_populate_sdk_ext -> do_root=
fs -> do_package_write_X)
     while start:
         next =3D []
         for dep2 in start:
             for dep in taskdepdata[dep2][3]:
-                if taskdepdata[dep][0] !=3D pn:
+                if include_self or taskdepdata[dep][0] !=3D pn:
                     if "do_" + taskname in dep:
                         pkgdeps.add(dep)
                 elif dep not in seen:
--=20
2.34.1


