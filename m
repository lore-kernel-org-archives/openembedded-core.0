Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37CAC36017
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 17:02:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.107.1743613360829803186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 10:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFA86106F
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 10:02:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 97DDF3F694
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 10:02:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] lib/oe: remove redundant __name__ == "__main__" checks
Date: Wed,  2 Apr 2025 18:02:33 +0100
Message-ID: <20250402170235.2868624-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 17:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214286

There's no point in checking if __name__ =3D=3D "__main__" (i.e., is this
module being invoked) and then doing nothing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/manifest.py | 4 ----
 meta/lib/oe/rootfs.py   | 9 ---------
 meta/lib/oe/sdk.py      | 3 ---
 3 files changed, 16 deletions(-)

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 61f18adc4ac..cf7a13c2475 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -200,7 +200,3 @@ def create_manifest(d, final_manifest=3DFalse, manife=
st_dir=3DNone,
         manifest.create_final()
     else:
         manifest.create_initial()
-
-
-if __name__ =3D=3D "__main__":
-    pass
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 90d49749653..6b56adaf031 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -427,12 +427,3 @@ def image_list_installed_packages(d, rootfs_dir=3DNo=
ne):
     import importlib
     cls =3D importlib.import_module('oe.package_manager.' + img_type)
     return cls.PMPkgsList(d, rootfs_dir).list_pkgs()
-
-if __name__ =3D=3D "__main__":
-    """
-    We should be able to run this as a standalone script, from outside b=
itbake
-    environment.
-    """
-    """
-    TBD
-    """
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 3dc3672210b..11759aba489 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -155,6 +155,3 @@ def get_extra_sdkinfo(sstate_dir):
                 extra_info['tasksizes'][task] =3D origtotal + fsize
                 extra_info['filesizes'][fn] =3D fsize
     return extra_info
-
-if __name__ =3D=3D "__main__":
-    pass
--=20
2.43.0


