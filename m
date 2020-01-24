Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6310B7FDB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 17:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9A4E49C02D3;
	Fri, 24 Jan 2020 12:08:07 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id VCjOI9pI4kzS; Fri, 24 Jan 2020 12:08:07 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E78C99C02D7;
	Fri, 24 Jan 2020 12:08:06 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id l6saUApDsZ7c; Fri, 24 Jan 2020 12:08:06 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 724519C02D9;
	Fri, 24 Jan 2020 12:08:05 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 18:07:40 +0100
Message-Id: <20200124170743.20463-11-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200124170743.20463-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v6 10/13] devtool/standard: npm: update the append file
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
X-List-Received-Date: Fri, 24 Jan 2020 17:08:06 -0000
Content-Transfer-Encoding: quoted-printable

When creating a recipe using devtool, a workspace is created to store
the new recipe, the recipe source and some append files. These append
files are used by devtool to build the recipe using externalsrc (to use
the source which are in the workspace). They can also have some
additional actions according to the class of the recipe.

This commit updates the append file for the npm recipes. The
devtool / externalsrc files are removed in the npm package directory
instead of the install directory.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/devtool/standard.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index f33018de3f..52efeae938 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -260,14 +260,10 @@ def add(args, config, basepath, workspace):
                 f.write('}\n')
=20
             if bb.data.inherits_class('npm', rd):
-                f.write('do_install_append() {\n')
-                f.write('    # Remove files added to source dir by devto=
ol/externalsrc\n')
-                f.write('    rm -f ${NPM_INSTALLDIR}/singletask.lock\n')
-                f.write('    rm -rf ${NPM_INSTALLDIR}/.git\n')
-                f.write('    rm -rf ${NPM_INSTALLDIR}/oe-local-files\n')
-                f.write('    for symlink in ${EXTERNALSRC_SYMLINKS} ; do=
\n')
-                f.write('        rm -f ${NPM_INSTALLDIR}/${symlink%%:*}\=
n')
-                f.write('    done\n')
+                f.write('python do_configure_append() {\n')
+                f.write('    pkgdir =3D d.getVar("NPM_PACKAGE")\n')
+                f.write('    lockfile =3D os.path.join(pkgdir, "singleta=
sk.lock")\n')
+                f.write('    bb.utils.remove(lockfile)\n')
                 f.write('}\n')
=20
         # Check if the new layer provides recipes whose priorities have =
been
--=20
2.20.1


