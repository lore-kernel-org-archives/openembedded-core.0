Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 882BE7F7DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AF6C19C0198;
	Wed, 20 Nov 2019 04:34:07 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id cjaI87CahftS; Wed, 20 Nov 2019 04:34:06 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CF25F9C027E;
	Wed, 20 Nov 2019 04:34:06 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id NypNLpsedJx0; Wed, 20 Nov 2019 04:34:06 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 7A4209C0286;
	Wed, 20 Nov 2019 04:34:05 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:42 +0100
Message-Id: <20191120093358.11622-2-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 01/17] devtool: npm: update command line options
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:06 -0000
Content-Transfer-Encoding: quoted-printable

This commit renames the '--fetch-dev' option into '--npm-dev' which is
more easily understandable.

It also adds the '--npm-registry' option to allow creating a npm recipe
with a non default npm registry (e.g. if the SRC_URI is using git://).

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/devtool/standard.py  |  9 ++++++---
 scripts/lib/recipetool/create.py | 12 +++++++-----
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 8d9c1a3022..7068a02a01 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -145,8 +145,10 @@ def add(args, config, basepath, workspace):
         extracmdopts +=3D ' --src-subdir "%s"' % args.src_subdir
     if args.autorev:
         extracmdopts +=3D ' -a'
-    if args.fetch_dev:
-        extracmdopts +=3D ' --fetch-dev'
+    if args.npm_dev:
+        extracmdopts +=3D ' --npm-dev'
+    if args.npm_registry:
+        extracmdopts +=3D ' --npm-registry "%s"' % args.npm_registry
     if args.mirrors:
         extracmdopts +=3D ' --mirrors'
     if args.srcrev:
@@ -2197,7 +2199,8 @@ def register_commands(subparsers, context):
     group.add_argument('--same-dir', '-s', help=3D'Build in same directo=
ry as source', action=3D"store_true")
     group.add_argument('--no-same-dir', help=3D'Force build in a separat=
e build directory', action=3D"store_true")
     parser_add.add_argument('--fetch', '-f', help=3D'Fetch the specified=
 URI and extract it to create the source tree (deprecated - pass as posit=
ional argument instead)', metavar=3D'URI')
-    parser_add.add_argument('--fetch-dev', help=3D'For npm, also fetch d=
evDependencies', action=3D"store_true")
+    parser_add.add_argument('--npm-dev', help=3D'For npm, also fetch dev=
Dependencies', action=3D"store_true")
+    parser_add.add_argument('--npm-registry', help=3D'For npm, use the s=
pecified registry', type=3Dstr)
     parser_add.add_argument('--version', '-V', help=3D'Version to use wi=
thin recipe (PV)')
     parser_add.add_argument('--no-git', '-g', help=3D'If fetching source=
, do not set up source tree as a git repository', action=3D"store_true")
     group =3D parser_add.add_mutually_exclusive_group()
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index 1fb6b55530..932dc3f374 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -716,10 +716,11 @@ def create_recipe(args):
         lines_after.append('INSANE_SKIP_${PN} +=3D "already-stripped"')
         lines_after.append('')
=20
-    if args.fetch_dev:
-        extravalues['fetchdev'] =3D True
-    else:
-        extravalues['fetchdev'] =3D None
+    if args.npm_dev:
+        extravalues['NPM_INSTALL_DEV'] =3D 1
+
+    if args.npm_registry:
+        extravalues['NPM_REGISTRY'] =3D args.npm_registry
=20
     # Find all plugins that want to register handlers
     logger.debug('Loading recipe handlers')
@@ -1315,7 +1316,8 @@ def register_commands(subparsers):
     group.add_argument('-S', '--srcrev', help=3D'Source revision to fetc=
h if fetching from an SCM such as git (default latest)')
     parser_create.add_argument('-B', '--srcbranch', help=3D'Branch in so=
urce repository if fetching from an SCM such as git (default master)')
     parser_create.add_argument('--keep-temp', action=3D"store_true", hel=
p=3D'Keep temporary directory (for debugging)')
-    parser_create.add_argument('--fetch-dev', action=3D"store_true", hel=
p=3D'For npm, also fetch devDependencies')
+    parser_create.add_argument('--npm-dev', action=3D"store_true", help=3D=
'For npm, also fetch devDependencies')
+    parser_create.add_argument('--npm-registry', help=3D'For npm, use th=
e specified registry', type=3Dstr)
     parser_create.add_argument('--devtool', action=3D"store_true", help=3D=
argparse.SUPPRESS)
     parser_create.add_argument('--mirrors', action=3D"store_true", help=3D=
'Enable PREMIRRORS and MIRRORS for source tree fetching (disabled by defa=
ult).')
     parser_create.set_defaults(func=3Dcreate_recipe)
--=20
2.20.1


