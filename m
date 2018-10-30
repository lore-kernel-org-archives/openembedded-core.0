Return-Path: <fabien.lahoudere@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 4D46679C57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 10:13:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id E4A96276E93
From: Fabien Lahoudere <fabien.lahoudere@collabora.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Oct 2018 11:12:59 +0100
Message-Id: <5eb43bde3cf8f9d1a8937520c0baf91621ca8625.1540894302.git.fabien.lahoudere@collabora.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/1] archiver: Add xz support to compress sources
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
X-List-Received-Date: Tue, 30 Oct 2018 10:13:05 -0000

In order to be more efficient, we use xz as compression method
to create GPL sources archives.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
---
 meta/classes/archiver.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index abaef87..13c5129 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -36,6 +36,7 @@ ARCHIVER_MODE[diff] ?= "0"
 ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
 ARCHIVER_MODE[dumpdata] ?= "0"
 ARCHIVER_MODE[recipe] ?= "0"
+ARCHIVER_MODE[compression] ?= "gz"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
 ARCHIVER_TOPDIR ?= "${WORKDIR}/deploy-sources"
@@ -292,13 +293,13 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
 
     bb.utils.mkdirhier(ar_outdir)
     if suffix:
-        filename = '%s-%s.tar.gz' % (d.getVar('PF'), suffix)
+        filename = '%s-%s.tar.%s' % (d.getVar('PF'), suffix, d.getVarFlag('ARCHIVER_MODE', 'compression'))
     else:
-        filename = '%s.tar.gz' % d.getVar('PF')
+        filename = '%s.tar.%s' % (d.getVar('PF'), d.getVarFlag('ARCHIVER_MODE', 'compression'))
     tarname = os.path.join(ar_outdir, filename)
 
     bb.note('Creating %s' % tarname)
-    tar = tarfile.open(tarname, 'w:gz')
+    tar = tarfile.open(tarname, 'w:%s' % d.getVarFlag('ARCHIVER_MODE', 'compression'))
     tar.add(srcdir, arcname=os.path.basename(srcdir))
     tar.close()
 
-- 
1.8.3.1


