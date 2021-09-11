Received: from MTA-13-3.privateemail.com (MTA-13-3.privateemail.com [198.54.118.204])
 by mx.groups.io with SMTP id smtpd.web12.8497.1631392321700699410
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Sep 2021 13:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: whitetree.xyz, ip: 198.54.118.204, mailfrom: charles.davies@whitetree.xyz)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
	by mta-13.privateemail.com (Postfix) with ESMTP id 5F6CC18000B7;
	Sat, 11 Sep 2021 16:32:00 -0400 (EDT)
Received: from localhost.localdomain (unknown [10.20.151.216])
	by mta-13.privateemail.com (Postfix) with ESMTPA id BB94A18000B3;
	Sat, 11 Sep 2021 16:31:58 -0400 (EDT)
From: "Charlie Davies" <charles.davies@whitetree.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Charlie Davies <charles.davies@whitetree.xyz>
Subject: [PATCH] [hardknott] module.bbclass: Improve kernel module dependency detection
Date: Sat, 11 Sep 2021 21:28:51 +0100
Message-Id: <20210911202850.24488-1-charles.davies@whitetree.xyz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable

If a kernel module recipe specifies a DEPENDS on another
kernel module currently the module being depended on
must have a name starting with kernel-module- .

It is perfectly valid to name a package without the
kernel-module- scheme and instead use:

RPROVIDES_${PN} +=3D "kernel-module-my-module"

in the package's recipe to provide an alias package
name.

This commit introduces functionality which will search
through the RPROVIDES aliases of each dependency package
to allow packages not named kernel-module- to be
recognised as dependencies.

Signed-off-by: Charlie Davies <charles.davies@whitetree.xyz>
---
 meta/classes/module.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index a09ec3ed1e..c4f052234d 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -6,11 +6,25 @@ MODULES_INSTALL_TARGET ?=3D "modules_install"
 MODULES_MODULE_SYMVERS_LOCATION ?=3D ""
=20
 python __anonymous () {
+    import oe.packagedata
+
     depends =3D d.getVar('DEPENDS')
     extra_symbols =3D []
     for dep in depends.split():
         if dep.startswith("kernel-module-"):
             extra_symbols.append("${STAGING_INCDIR}/" + dep + "/Module.s=
ymvers")
+        else:
+            if oe.packagedata.has_subpkgdata(dep, d):
+                data =3D oe.packagedata.read_subpkgdata(dep, d)
+                key =3D "RPROVIDES_%s" % dep
+                rprovs =3D data.get(key)
+
+                if rprovs is not None:
+                    for rprov in rprovs.split():
+                        if rprov.startswith("kernel-module-"):
+                            extra_symbols.append("${STAGING_INCDIR}/" + =
dep + "/Module.symvers")
+                            break
+
     d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
 }
=20
--=20
2.33.0

