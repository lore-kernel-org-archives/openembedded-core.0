Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id D46F67FDA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 17:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0742D9C02CC;
	Fri, 24 Jan 2020 12:08:05 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id MEZG1HU6C02N; Fri, 24 Jan 2020 12:08:04 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0B5369C02D3;
	Fri, 24 Jan 2020 12:08:04 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id BrK8RLTYIuwf; Fri, 24 Jan 2020 12:08:03 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 71D729C02D0;
	Fri, 24 Jan 2020 12:08:02 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 18:07:38 +0100
Message-Id: <20200124170743.20463-9-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v6 08/13] recipetool/create_npm: handle the licenses of the dependencies
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
X-List-Received-Date: Fri, 24 Jan 2020 17:08:04 -0000
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
 scripts/lib/recipetool/create_npm.py | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetoo=
l/create_npm.py
index 7f0d8a04a3..579b7ae48a 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -12,7 +12,10 @@ import sys
 import tempfile
 import bb
 from bb.fetch2.npm import NpmEnvironment
+from bb.fetch2.npmsw import foreach_dependencies
 from recipetool.create import RecipeHandler
+from recipetool.create import guess_license
+from recipetool.create import split_pkg_licenses
=20
 TINFOIL =3D None
=20
@@ -110,6 +113,36 @@ class NpmRecipeHandler(RecipeHandler):
=20
         return os.path.join(srctree, "npm-shrinkwrap.json")
=20
+    def _handle_licenses(self, srctree, shrinkwrap_file, dev):
+        """Return the extra license files and the list of packages"""
+        licfiles =3D []
+        packages =3D {}
+
+        def _licfiles_append(licfile):
+            """Append 'licfile' to the license files list"""
+            licfilepath =3D os.path.join(srctree, licfile)
+            licmd5 =3D bb.utils.md5_file(licfilepath)
+            licfiles.append("file://%s;md5=3D%s" % (licfile, licmd5))
+
+        # Handle the parent package
+        _licfiles_append("package.json")
+        packages["${PN}"] =3D ""
+
+        # Handle the dependencies
+        def _handle_dependency(name, params, deptree):
+            suffix =3D "-".join([self._npm_name(dep) for dep in deptree]=
)
+            destdirs =3D [os.path.join("node_modules", dep) for dep in d=
eptree]
+            destdir =3D os.path.join(*destdirs)
+            _licfiles_append(os.path.join(destdir, "package.json"))
+            packages["${PN}-" + suffix] =3D destdir
+
+        with open(shrinkwrap_file, "r") as f:
+            shrinkwrap =3D json.load(f)
+
+        foreach_dependencies(shrinkwrap, _handle_dependency, dev)
+
+        return licfiles, packages
+
     def process(self, srctree, classes, lines_before, lines_after, handl=
ed, extravalues):
         """Handle the npm recipe creation"""
=20
@@ -199,6 +232,19 @@ class NpmRecipeHandler(RecipeHandler):
         (_, newlines) =3D bb.utils.edit_metadata(lines_before, ["SRC_URI=
"], _handle_srcuri)
         lines_before[:] =3D [line.rstrip('\n') for line in newlines]
=20
+        # In order to generate correct licence checksums in the recipe t=
he
+        # dependencies have to be fetched again using the npmsw url
+        bb.note("Fetching npm dependencies ...")
+        bb.utils.remove(os.path.join(srctree, "node_modules"), recurse=3D=
True)
+        fetcher =3D bb.fetch2.Fetch([url_local], d)
+        fetcher.download()
+        fetcher.unpack(srctree)
+
+        bb.note("Handling licences ...")
+        (licfiles, packages) =3D self._handle_licenses(srctree, shrinkwr=
ap_file, dev)
+        extravalues["LIC_FILES_CHKSUM"] =3D licfiles
+        split_pkg_licenses(guess_license(srctree, d), packages, lines_af=
ter, [])
+
         classes.append("npm")
         handled.append("buildsystem")
=20
--=20
2.20.1


