Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id B37607F80D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E94C99C0286;
	Wed, 20 Nov 2019 04:34:12 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id GKbcWsSCZG4A; Wed, 20 Nov 2019 04:34:12 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 47DF49C01C2;
	Wed, 20 Nov 2019 04:34:12 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id XcHKqN2-jjq9; Wed, 20 Nov 2019 04:34:12 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 030619C0286;
	Wed, 20 Nov 2019 04:34:10 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:46 +0100
Message-Id: <20191120093358.11622-6-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 05/17] devtool/standard.py: npm: update the append file
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:11 -0000
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
index 7068a02a01..2604b79be3 100644
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


