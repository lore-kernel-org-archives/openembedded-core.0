Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.3915.1594291331633758250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 03:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=GTdTTOoJ;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=6077; q=dns/txt; s=axis-central1;
  t=1594291332; x=1625827332;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T+MXP5dSpBmfEuxx1S3cjBvLuVPbPX2UNwOyLff/ux0=;
  b=GTdTTOoJ6QmFhBQqwIEy+P0gM3a2nu3LGKnM748co73dwgVoMIXOuzUb
   fz7LAn4pSkqpyJRAkmyRWYEO41du0qg3fatUf2ELfEtxUutlqNLU0CuJM
   bRESf/jLNIPFU+qSGhDUqaU0s5PUc50yaJ+COfJCRwH0xLWKHv0HEqAIy
   MSif36gc5QCZMPHNaUMW0YqZY3Q9g4+42n1V49vtk3bnmQ78i8c4iXVBq
   BYFdTHWparofmaZ4wffJHls6F4Wozo52HyxGWp0SUtYumCL8dqXhdU0qD
   Q0hjsySpToruLkCAP2JLevahiclmdX8b60sX07gYgzYkzzH7ERmDAliEk
   Q==;
IronPort-SDR: E2bjPgDefnFMLNQXhdVq3VcR/GslVyMHl9s9mId78pzH39hypf4XhWifGx7cPHXQjKanqTVpd+
 yOZnkTXkdybbVyjmOAr6VP+0gGt9q0h4CR/S0lAg7ilaWHDwn6BFLFJlqb8WpLaae3AFx+inJs
 oES9Y3fUbACmMrOrXgRlnDOyVFtfQdIaWnI93DMQ4kdZWbS3I5NYAUYCze3dzMvt5WbEMKz/gs
 Txty7G8kXnJOxBEysCcaSqg5RbpohXvZ/G8FMSOOitIXNHapyDfgE+oqbIovK++xjjGNbeBuLa
 MpA=
X-IronPort-AV: E=Sophos;i="5.75,331,1589234400"; 
   d="scan'208";a="10631160"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Paul Barker <pbarker@konsulko.com>
Subject: Re: [PATCH v4 01/12] Move rpm manifest to its own subdir
Thread-Topic: [PATCH v4 01/12] Move rpm manifest to its own subdir
Thread-Index: AQHWUS9HKFExdm4B+0exxdD/0h6qFKj/GLQw
Date: Thu, 9 Jul 2020 10:42:09 +0000
Message-ID: <1594291329382.85415@axis.com>
References: <20200703114402.8850-1-fredrigu@axis.com>,<20200703114402.8850-2-fredrigu@axis.com>
In-Reply-To: <20200703114402.8850-2-fredrigu@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.15]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
is there something I can do to make this series move forward?=0A=
=0A=
/Fredrik=0A=
________________________________________=0A=
From: Fredrik Gustafsson=0A=
Sent: Friday, July 3, 2020 1:43 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: tools-cfpbuild-internal; Fredrik Gustafsson=0A=
Subject: [PATCH v4 01/12] Move rpm manifest to its own subdir=0A=
=0A=
This is a part of a refactor that will split the package manager=0A=
code so that it's possible to use other package managers in other=0A=
layers.=0A=
=0A=
Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>=0A=
---=0A=
 meta/lib/oe/manifest.py                      | 51 +-----------------=0A=
 meta/lib/oe/package_managers/rpm/__init__.py |  3 ++=0A=
 meta/lib/oe/package_managers/rpm/manifest.py | 56 ++++++++++++++++++++=0A=
 meta/lib/oe/rootfs.py                        |  2 +=0A=
 4 files changed, 62 insertions(+), 50 deletions(-)=0A=
 create mode 100644 meta/lib/oe/package_managers/rpm/__init__.py=0A=
 create mode 100644 meta/lib/oe/package_managers/rpm/manifest.py=0A=
=0A=
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py=0A=
index f7c88f9a09..cf2cbe22eb 100644=0A=
--- a/meta/lib/oe/manifest.py=0A=
+++ b/meta/lib/oe/manifest.py=0A=
@@ -189,56 +189,6 @@ class Manifest(object, metaclass=3DABCMeta):=0A=
         return installed_pkgs=0A=
=0A=
=0A=
-class RpmManifest(Manifest):=0A=
-    """=0A=
-    Returns a dictionary object with mip and mlp packages.=0A=
-    """=0A=
-    def _split_multilib(self, pkg_list):=0A=
-        pkgs =3D dict()=0A=
-=0A=
-        for pkg in pkg_list.split():=0A=
-            pkg_type =3D self.PKG_TYPE_MUST_INSTALL=0A=
-=0A=
-            ml_variants =3D self.d.getVar('MULTILIB_VARIANTS').split()=0A=
-=0A=
-            for ml_variant in ml_variants:=0A=
-                if pkg.startswith(ml_variant + '-'):=0A=
-                    pkg_type =3D self.PKG_TYPE_MULTILIB=0A=
-=0A=
-            if not pkg_type in pkgs:=0A=
-                pkgs[pkg_type] =3D pkg=0A=
-            else:=0A=
-                pkgs[pkg_type] +=3D " " + pkg=0A=
-=0A=
-        return pkgs=0A=
-=0A=
-    def create_initial(self):=0A=
-        pkgs =3D dict()=0A=
-=0A=
-        with open(self.initial_manifest, "w+") as manifest:=0A=
-            manifest.write(self.initial_manifest_file_header)=0A=
-=0A=
-            for var in self.var_maps[self.manifest_type]:=0A=
-                if var in self.vars_to_split:=0A=
-                    split_pkgs =3D self._split_multilib(self.d.getVar(var)=
)=0A=
-                    if split_pkgs is not None:=0A=
-                        pkgs =3D dict(list(pkgs.items()) + list(split_pkgs=
.items()))=0A=
-                else:=0A=
-                    pkg_list =3D self.d.getVar(var)=0A=
-                    if pkg_list is not None:=0A=
-                        pkgs[self.var_maps[self.manifest_type][var]] =3D s=
elf.d.getVar(var)=0A=
-=0A=
-            for pkg_type in pkgs:=0A=
-                for pkg in pkgs[pkg_type].split():=0A=
-                    manifest.write("%s,%s\n" % (pkg_type, pkg))=0A=
-=0A=
-    def create_final(self):=0A=
-        pass=0A=
-=0A=
-    def create_full(self, pm):=0A=
-        pass=0A=
-=0A=
-=0A=
 class OpkgManifest(Manifest):=0A=
     """=0A=
     Returns a dictionary object with mip and mlp packages.=0A=
@@ -332,6 +282,7 @@ class DpkgManifest(Manifest):=0A=
=0A=
 def create_manifest(d, final_manifest=3DFalse, manifest_dir=3DNone,=0A=
                     manifest_type=3DManifest.MANIFEST_TYPE_IMAGE):=0A=
+    from oe.package_managers.rpm.manifest import RpmManifest=0A=
     manifest_map =3D {'rpm': RpmManifest,=0A=
                     'ipk': OpkgManifest,=0A=
                     'deb': DpkgManifest}=0A=
diff --git a/meta/lib/oe/package_managers/rpm/__init__.py b/meta/lib/oe/pac=
kage_managers/rpm/__init__.py=0A=
new file mode 100644=0A=
index 0000000000..a2094304c9=0A=
--- /dev/null=0A=
+++ b/meta/lib/oe/package_managers/rpm/__init__.py=0A=
@@ -0,0 +1,3 @@=0A=
+#=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+#=0A=
diff --git a/meta/lib/oe/package_managers/rpm/manifest.py b/meta/lib/oe/pac=
kage_managers/rpm/manifest.py=0A=
new file mode 100644=0A=
index 0000000000..9047462951=0A=
--- /dev/null=0A=
+++ b/meta/lib/oe/package_managers/rpm/manifest.py=0A=
@@ -0,0 +1,56 @@=0A=
+#=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+#=0A=
+=0A=
+from oe.manifest import Manifest=0A=
+=0A=
+class RpmManifest(Manifest):=0A=
+    """=0A=
+    Returns a dictionary object with mip and mlp packages.=0A=
+    """=0A=
+    def _split_multilib(self, pkg_list):=0A=
+        pkgs =3D dict()=0A=
+=0A=
+        for pkg in pkg_list.split():=0A=
+            pkg_type =3D self.PKG_TYPE_MUST_INSTALL=0A=
+=0A=
+            ml_variants =3D self.d.getVar('MULTILIB_VARIANTS').split()=0A=
+=0A=
+            for ml_variant in ml_variants:=0A=
+                if pkg.startswith(ml_variant + '-'):=0A=
+                    pkg_type =3D self.PKG_TYPE_MULTILIB=0A=
+=0A=
+            if not pkg_type in pkgs:=0A=
+                pkgs[pkg_type] =3D pkg=0A=
+            else:=0A=
+                pkgs[pkg_type] +=3D " " + pkg=0A=
+=0A=
+        return pkgs=0A=
+=0A=
+    def create_initial(self):=0A=
+        pkgs =3D dict()=0A=
+=0A=
+        with open(self.initial_manifest, "w+") as manifest:=0A=
+            manifest.write(self.initial_manifest_file_header)=0A=
+=0A=
+            for var in self.var_maps[self.manifest_type]:=0A=
+                if var in self.vars_to_split:=0A=
+                    split_pkgs =3D self._split_multilib(self.d.getVar(var)=
)=0A=
+                    if split_pkgs is not None:=0A=
+                        pkgs =3D dict(list(pkgs.items()) + list(split_pkgs=
.items()))=0A=
+                else:=0A=
+                    pkg_list =3D self.d.getVar(var)=0A=
+                    if pkg_list is not None:=0A=
+                        pkgs[self.var_maps[self.manifest_type][var]] =3D s=
elf.d.getVar(var)=0A=
+=0A=
+            for pkg_type in pkgs:=0A=
+                for pkg in pkgs[pkg_type].split():=0A=
+                    manifest.write("%s,%s\n" % (pkg_type, pkg))=0A=
+=0A=
+    def create_final(self):=0A=
+        pass=0A=
+=0A=
+    def create_full(self, pm):=0A=
+        pass=0A=
+=0A=
+=0A=
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py=0A=
index a0ac33ada6..b6d2028e9b 100644=0A=
--- a/meta/lib/oe/rootfs.py=0A=
+++ b/meta/lib/oe/rootfs.py=0A=
@@ -359,6 +359,8 @@ class RpmRootfs(Rootfs):=0A=
         self.log_check_regex =3D r'(unpacking of archive failed|Cannot fin=
d package'\=0A=
                                r'|exit 1|ERROR: |Error: |Error |ERROR '\=
=0A=
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)=
'=0A=
+=0A=
+        from oe.package_managers.rpm.manifest import RpmManifest=0A=
         self.manifest =3D RpmManifest(d, manifest_dir)=0A=
=0A=
         self.pm =3D RpmPM(d,=0A=
--=0A=
2.20.1=0A=
=0A=
