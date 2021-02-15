Received: from MTA-09-3.privateemail.com (MTA-09-3.privateemail.com [68.65.122.19])
 by mx.groups.io with SMTP id smtpd.web08.37277.1613419774469360153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 12:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: whitetree.xyz, ip: 68.65.122.19, mailfrom: charles.davies@whitetree.xyz)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
	by MTA-09.privateemail.com (Postfix) with ESMTP id D29AD6004C;
	Mon, 15 Feb 2021 15:09:33 -0500 (EST)
Received: from localhost.localdomain (unknown [10.20.151.213])
	by MTA-09.privateemail.com (Postfix) with ESMTPA id E00776003F;
	Mon, 15 Feb 2021 20:09:32 +0000 (UTC)
From: "Charlie Davies" <charles.davies@whitetree.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Charlie Davies <charles.davies@whitetree.xyz>
Subject: [master][dunfell][gatesgarth][PATCH 2/2] bitbake-bblayers/create: Add optional layerid argument
Date: Mon, 15 Feb 2021 20:07:44 +0000
Message-Id: <20210215200744.20802-2-charles.davies@whitetree.xyz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210215200744.20802-1-charles.davies@whitetree.xyz>
References: <20210215200744.20802-1-charles.davies@whitetree.xyz>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable

This commit adds an optional layerid argument which can
be passed to the bitbake-layers create-layer command.
This allows for creation of a layer with a layer id
different to that of the layer's name. The default
behaviour of the command where the layer's id is set
to the layer's name is still retained.

Signed-off-by: Charlie Davies <charles.davies@whitetree.xyz>
---
 meta/lib/bblayers/create.py            |  4 +++-
 meta/lib/bblayers/templates/layer.conf | 10 +++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index f49b48d1b4..7ddb777dc7 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -35,6 +35,7 @@ class CreatePlugin(LayerPlugin):
         bb.utils.mkdirhier(conf)
=20
         layername =3D os.path.basename(os.path.normpath(args.layerdir))
+        layerid =3D args.layerid if args.layerid is not None else layern=
ame
=20
         # Create the README from templates/README
         readme_template =3D  read_template('README').format(layername=3D=
layername)
@@ -54,7 +55,7 @@ class CreatePlugin(LayerPlugin):
=20
         # Create the layer.conf from templates/layer.conf
         layerconf_template =3D read_template('layer.conf').format(
-                layername=3Dlayername, priority=3Dargs.priority, compat=3D=
compat)
+                layerid=3Dlayerid, priority=3Dargs.priority, compat=3Dco=
mpat)
         layerconf =3D os.path.join(conf, 'layer.conf')
         with open(layerconf, 'w') as fd:
             fd.write(layerconf_template)
@@ -71,6 +72,7 @@ class CreatePlugin(LayerPlugin):
     def register_commands(self, sp):
         parser_create_layer =3D self.add_command(sp, 'create-layer', sel=
f.do_create_layer, parserecipes=3DFalse)
         parser_create_layer.add_argument('layerdir', help=3D'Layer direc=
tory to create')
+        parser_create_layer.add_argument('--layerid', '-i', help=3D'Laye=
r id to use if different from layername')
         parser_create_layer.add_argument('--priority', '-p', default=3D6=
, help=3D'Priority of recipes in layer')
         parser_create_layer.add_argument('--example-recipe-name', '-e', =
dest=3D'examplerecipe', default=3D'example', help=3D'Filename of the exam=
ple recipe')
         parser_create_layer.add_argument('--example-recipe-version', '-v=
', dest=3D'version', default=3D'0.1', help=3D'Version number for the exam=
ple recipe')
diff --git a/meta/lib/bblayers/templates/layer.conf b/meta/lib/bblayers/t=
emplates/layer.conf
index e2eaff4346..dddfbf716e 100644
--- a/meta/lib/bblayers/templates/layer.conf
+++ b/meta/lib/bblayers/templates/layer.conf
@@ -5,9 +5,9 @@ BBPATH .=3D ":${{LAYERDIR}}"
 BBFILES +=3D "${{LAYERDIR}}/recipes-*/*/*.bb \
             ${{LAYERDIR}}/recipes-*/*/*.bbappend"
=20
-BBFILE_COLLECTIONS +=3D "{layername}"
-BBFILE_PATTERN_{layername} =3D "^${{LAYERDIR}}/"
-BBFILE_PRIORITY_{layername} =3D "{priority}"
+BBFILE_COLLECTIONS +=3D "{layerid}"
+BBFILE_PATTERN_{layerid} =3D "^${{LAYERDIR}}/"
+BBFILE_PRIORITY_{layerid} =3D "{priority}"
=20
-LAYERDEPENDS_{layername} =3D "core"
-LAYERSERIES_COMPAT_{layername} =3D "{compat}"
+LAYERDEPENDS_{layerid} =3D "core"
+LAYERSERIES_COMPAT_{layerid} =3D "{compat}"
--=20
2.30.0

