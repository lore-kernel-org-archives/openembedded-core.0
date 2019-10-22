Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id A02E87D391
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 09:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 325299C0471;
	Tue, 22 Oct 2019 05:04:03 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id kxWDcFiLJU-k; Tue, 22 Oct 2019 05:04:02 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8DAD89C046B;
	Tue, 22 Oct 2019 05:04:02 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id jdDAnKL9f5cK; Tue, 22 Oct 2019 05:04:02 -0400 (EDT)
Received: from sulaco.home (lfbn-1-7821-217.w92-167.abo.wanadoo.fr
	[92.167.224.217])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id DA6EE9C045F;
	Tue, 22 Oct 2019 05:04:01 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 11:03:51 +0200
Message-Id: <20191022090353.21151-5-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: brendan.le.foll@intel.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com
Subject: [RFC][PATCH 4/6] devtool/standard.py: update the append file for the npm recipes
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
X-List-Received-Date: Tue, 22 Oct 2019 09:11:21 -0000
Content-Transfer-Encoding: quoted-printable

When creating a recipe using devtool, a workspace is created to store
the new recipe, the recipe source and some append files. These append
files are used by devtool to build the recipe using externalsrc (to use
the source which are in the workspace). They can also have some
additional actions according to the class of the recipe.

This commit updates the append file for the npm recipes. The
devtool / externalsrc files are removed in the npm build directory
instead of the install directory.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/devtool/standard.py | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index fedf8b8262..28c079c5f6 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -262,14 +262,11 @@ def add(args, config, basepath, workspace):
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
+                f.write('do_compile_append() {\n')
+                f.write('    rm -rf ${B}/lib/node_modules/*/.git\n')
+                f.write('    rm -rf ${B}/lib/node_modules/@*/*/.git\n')
+                f.write('    rm -f ${B}/lib/node_modules/*/singletask.lo=
ck\n')
+                f.write('    rm -f ${B}/lib/node_modules/@*/*/singletask=
.lock\n')
                 f.write('}\n')
=20
         # Check if the new layer provides recipes whose priorities have =
been
--=20
2.20.1


