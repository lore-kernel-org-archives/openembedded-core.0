Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id A7B107F700
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E032C9C01C2;
	Wed, 20 Nov 2019 04:34:19 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id AI0mgxmQu6Ui; Wed, 20 Nov 2019 04:34:19 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 15CD69C02F8;
	Wed, 20 Nov 2019 04:34:19 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id YPtXV_bhOPjM; Wed, 20 Nov 2019 04:34:18 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C65F39C01C2;
	Wed, 20 Nov 2019 04:34:17 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:51 +0100
Message-Id: <20191120093358.11622-11-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 10/17] recipetool/create_npm.py: handle the licenses of the dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2019 09:34:19 -0000
Content-Transfer-Encoding: quoted-printable

As usual the 'LICENSE' and the 'LIC_FILES_CHKSUM' values reflects all
the license files discovered in the source tree (including the
dependencies).

For npm recipes the 'LIC_FILES_CHKSUM' value contains also the status of
the 'package.json' file of every packages as it contains license
informations.

Finally each package has a separate 'LICENSE_${PN}-package-name' value
which describes its license.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/recipetool/create_npm.py | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetoo=
l/create_npm.py
index ea3c3044fc..e6eb002251 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -15,7 +15,12 @@ import sys
 import tempfile
 import bb
 from bb.fetch2 import runfetchcmd
+from bb.fetch2.npm import fetch_dependencies
+from bb.fetch2.npm import foreach_dependencies
+from bb.fetch2.npm import unpack_dependencies
 from recipetool.create import RecipeHandler
+from recipetool.create import guess_license
+from recipetool.create import split_pkg_licenses
=20
 tinfoil =3D None
=20
@@ -176,6 +181,43 @@ class NpmRecipeHandler(RecipeHandler):
         name =3D name.strip("-")
         return name
=20
+    def _handle_licenses(self, d, shrinkwrap_file, lines, extravalues):
+        """
+            This function have 2 goals:
+                - Add all the package.json files as license files.
+                - Split the license into sub packages.
+        """
+
+        lic_files_chksum =3D []
+        packages =3D {}
+
+        def lic_files_chksum_append(licfile):
+            licfilepath =3D os.path.join(d.getVar("S"), licfile)
+            licmd5 =3D bb.utils.md5_file(licfilepath)
+            lic_files_chksum.append("file://{};md5=3D{}".format(licfile,=
 licmd5))
+
+        # Handle the parent package
+        lic_files_chksum_append("package.json")
+        packages["${PN}"] =3D ""
+
+        # Handle the dependencies
+        def handle_dependency(name, version, deptree):
+            prefix =3D "-".join([self._name_from_npm(x, number=3DTrue) f=
or x in deptree])
+            relpath =3D os.path.join(*[os.path.join("node_modules", x) f=
or x in deptree])
+            lic_files_chksum_append(os.path.join(relpath, "package.json"=
))
+            packages["${PN}-" + prefix] =3D relpath
+
+        foreach_dependencies(d, handle_dependency, shrinkwrap_file)
+
+        # Add the extra package.json license files. They will be handled=
 by
+        # the handle_license_vars() function later.
+        extravalues["LIC_FILES_CHKSUM"] =3D lic_files_chksum
+
+        # Split the license into sub packages. The global LICENSE will b=
e
+        # processed by the handle_license_vars() function later.
+        licvalues =3D guess_license(d.getVar("S"), d)
+        split_pkg_licenses(licvalues, packages, lines, [])
+
     def process(self, srctree, classes, lines_before, lines_after, handl=
ed, extravalues):
         """
             Handle the npm recipe creation
@@ -209,6 +251,13 @@ class NpmRecipeHandler(RecipeHandler):
         shrinkwrap =3D self._generate_shrinkwrap(d, lines_before,
                                                extravalues, development)
=20
+        # Fetch and unpack the dependencies
+        fetch_dependencies(d, shrinkwrap)
+        unpack_dependencies(d, shrinkwrap)
+
+        # Handle the licenses
+        self._handle_licenses(d, shrinkwrap, lines_after, extravalues)
+
         extravalues["PN"] =3D self._name_from_npm(data["name"])
         extravalues["PV"] =3D data["version"]
=20
--=20
2.20.1


