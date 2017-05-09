Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF4F70018
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 00:39:04 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 17:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,311,1491289200"; d="scan'208";a="99545551"
Received: from nmaideen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.191.208])
	by fmsmga006.fm.intel.com with ESMTP; 08 May 2017 17:39:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 May 2017 12:38:39 +1200
Message-Id: <46e1b7defd97fc79116f9922404e9fb62cb02aa7.1494290288.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1494290288.git.paul.eggleton@linux.intel.com>
References: <cover.1494290288.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/buildhistory: fix failures collecting output signatures
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
X-List-Received-Date: Tue, 09 May 2017 00:39:04 -0000

It's possible for tasks to stage symlinks that point to non-existent
files; an example is ncurses-native.do_populate_sysroot. There wasn't
any error checking here so this broke the build when "task" was included
in BUILDHISTORY_FEATURES. In any case we shouldn't be following symlinks
and getting the sha256sum of the link target - we need concern ourselves
only with the target path, so check if the file is a link and sha256 the
target path instead if it is. If it's neither a regular file nor a
symlink (perhaps a pipe or a device), just skip it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f543bb7..8eafdc9 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -301,6 +301,8 @@ python buildhistory_emit_outputsigs() {
     if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
         return
 
+    import hashlib
+
     taskoutdir = os.path.join(d.getVar('BUILDHISTORY_DIR'), 'task', 'output')
     bb.utils.mkdirhier(taskoutdir)
     currenttask = d.getVar('BB_CURRENTTASK')
@@ -314,7 +316,17 @@ python buildhistory_emit_outputsigs() {
             if fname == 'fixmepath':
                 continue
             fullpath = os.path.join(root, fname)
-            filesigs[os.path.relpath(fullpath, cwd)] = bb.utils.sha256_file(fullpath)
+            try:
+                if os.path.islink(fullpath):
+                    sha256 = hashlib.sha256(os.readlink(fullpath).encode('utf-8')).hexdigest()
+                elif os.path.isfile(fullpath):
+                    sha256 = bb.utils.sha256_file(fullpath)
+                else:
+                    continue
+            except OSError:
+                bb.warn('buildhistory: unable to read %s to get output signature' % fullpath)
+                continue
+            filesigs[os.path.relpath(fullpath, cwd)] = sha256
     with open(taskfile, 'w') as f:
         for fpath, fsig in sorted(filesigs.items(), key=lambda item: item[0]):
             f.write('%s %s\n' % (fpath, fsig))
-- 
2.9.3


