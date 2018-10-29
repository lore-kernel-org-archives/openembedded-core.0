Return-Path: <fabien.lahoudere@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id DA234745FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 11:02:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 7539C2603EA
From: Fabien Lahoudere <fabien.lahoudere@collabora.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:02:29 +0100
Message-Id: <151abd1d0cf82766280c4ae9011d050d4179832c.1540809368.git.fabien.lahoudere@collabora.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/1] archiver - Drop unwanted directories
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
X-List-Received-Date: Mon, 29 Oct 2018 11:02:38 -0000

In sources directory we can find patches/ and temp/.
The first one is filled with symbolic link unusable on another
machines.
The second contains yocto logs to create this archives and are
typically copied when 'S = "${WORKDIR}"'

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
---
 meta/classes/archiver.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index abaef87..0a9fe4f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -275,6 +275,14 @@ python do_ar_configured() {
         create_tarball(d, srcdir, 'configured', ar_outdir)
 }
 
+def exclude_useless_paths(tarinfo):
+    if tarinfo.isdir():
+        if tarinfo.name.endswith('/temp') or tarinfo.name.endswith('/patches') or tarinfo.name.endswith('/.pc'):
+            return None
+        elif tarinfo.name == 'temp' or tarinfo.name == 'patches' or tarinfo.name == '.pc':
+            return None
+    return tarinfo
+
 def create_tarball(d, srcdir, suffix, ar_outdir):
     """
     create the tarball from srcdir
@@ -299,7 +307,7 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
 
     bb.note('Creating %s' % tarname)
     tar = tarfile.open(tarname, 'w:gz')
-    tar.add(srcdir, arcname=os.path.basename(srcdir))
+    tar.add(srcdir, arcname=os.path.basename(srcdir), filter=exclude_useless_paths)
     tar.close()
 
 # creating .diff.gz between source.orig and source
-- 
1.8.3.1


