Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7927F7E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DB0B69C02F8;
	Wed, 20 Nov 2019 04:34:23 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id uYXa9oHETAzR; Wed, 20 Nov 2019 04:34:23 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 178059C03AF;
	Wed, 20 Nov 2019 04:34:23 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id yI7w2x6viNxN; Wed, 20 Nov 2019 04:34:22 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C770B9C02F8;
	Wed, 20 Nov 2019 04:34:21 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:54 +0100
Message-Id: <20191120093358.11622-14-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 13/17] recipetool/create_npm.py: convert the shrinkwrap file
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:23 -0000
Content-Transfer-Encoding: quoted-printable

A local npm cache pre filled with the dependencies is used to be able to
install the npm package without doing any unauthorized network access.

When it is offline, the npm cache identify a package using its integrity
metadata [1] but only the sha512 algorithm is used (this is the
default cacache algorithm [2]). And to create the shrinkwrap file, npm
use the integrity set in the registry which is not necessarily using
the sha512 algorithm.

The generated shrinkwrap file needs to be converted to use only sha512
integrity to ensure that the packages will be fetched from the cache and
not from the network.

1: https://www.w3.org/TR/SRI/
2: https://www.npmjs.com/package/cacache#optsalgorithms

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/recipetool/create_npm.py | 47 ++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetoo=
l/create_npm.py
index e6eb002251..dec9b741c5 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -7,15 +7,17 @@
     Recipe creation tool - npm module support plugin
 """
=20
+import base64
+import copy
 import json
 import os
 import re
-import shutil
 import sys
 import tempfile
 import bb
 from bb.fetch2 import runfetchcmd
 from bb.fetch2.npm import fetch_dependencies
+from bb.fetch2.npm import fetch_dependency
 from bb.fetch2.npm import foreach_dependencies
 from bb.fetch2.npm import unpack_dependencies
 from recipetool.create import RecipeHandler
@@ -132,6 +134,47 @@ class NpmRecipeHandler(RecipeHandler):
=20
         runfetchcmd(cmd, d, workdir=3Dd.getVar("S"))
=20
+    @staticmethod
+    def _convert_shrinkwrap(d, src_shrinkwrap, dst_shrinkwrap):
+        """
+            When adding local tarball to the npm cache, only the sha512
+            algorithm is used to create the cache metadata. The shrinkwr=
ap file
+            must be converted to use only sha512 integrity to be able to
+            retrieve dependencies from the npm cache.
+        """
+
+        def sha512_integrity(name, version):
+            tarball =3D fetch_dependency(d, name, version)
+            sha512 =3D bb.utils.sha512_file(tarball)
+            return "sha512-" + base64.b64encode(bytes.fromhex(sha512)).d=
ecode()
+
+        def convert_deps(src):
+            if src is None:
+                return None
+            dst =3D copy.deepcopy(src)
+            for name in src:
+                version =3D src[name].get("version")
+                integrity =3D src[name].get("integrity")
+                if integrity is not None and not integrity.startswith("s=
ha512"):
+                    dst[name]["integrity"] =3D sha512_integrity(name, ve=
rsion)
+                deps =3D src[name].get("dependencies")
+                if deps is not None:
+                    dst[name]["dependencies"] =3D convert_deps(deps)
+            return dst
+
+        def convert(src):
+            dst =3D copy.deepcopy(src)
+            deps =3D src.get("dependencies")
+            if deps is not None:
+                dst["dependencies"] =3D convert_deps(deps)
+            return dst
+
+        with open(src_shrinkwrap, "r") as f:
+            src =3D json.load(f)
+
+        with open(dst_shrinkwrap, "w") as f:
+            print(json.dumps(convert(src), indent=3D2), file=3Df)
+
     def _generate_shrinkwrap(self, d, lines, extravalues, development):
         """
             Check and generate the npm-shrinkwrap.json file if needed.
@@ -151,7 +194,7 @@ class NpmRecipeHandler(RecipeHandler):
         # Convert the shrinkwrap file and save it in a temporary locatio=
n
         tmpdir =3D tempfile.mkdtemp(prefix=3D"recipetool-npm")
         tmp_shrinkwrap =3D os.path.join(tmpdir, "npm-shrinkwrap.json")
-        shutil.move(src_shrinkwrap, tmp_shrinkwrap)
+        self._convert_shrinkwrap(d, src_shrinkwrap, tmp_shrinkwrap)
=20
         # Add the shrinkwrap file as 'extrafiles'
         extravalues.setdefault("extrafiles", {})
--=20
2.20.1


