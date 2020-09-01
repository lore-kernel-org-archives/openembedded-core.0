Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.12946.1598966945758301963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 06:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mtr@pengutronix.de)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1kD6LP-0002zy-Fm; Tue, 01 Sep 2020 15:29:04 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <mtr@dude03.red.stw.pengutronix.de>)
	id 1kD6LO-005Qhl-2T; Tue, 01 Sep 2020 15:29:02 +0200
From: "Michael Tretter" <m.tretter@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Michael Tretter <m.tretter@pengutronix.de>
Date: Tue,  1 Sep 2020 15:29:00 +0200
Message-Id: <20200901132900.1294251-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=BAYES_00,RDNS_NONE,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
	version=3.4.2
Subject: [PATCH] devtool: deploy-target: Fix size calculation for hard links
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

If a package contains hard links to a file, the file size is added for
each hard link instead of once for the file. Therefore, the calculated
size may be much larger than the actual package size.

For example, the mesa-megadriver package contains several hard links to
the same library.

Keep track of the inode numbers when listing the files that are
installed and use the actual size only for the first occurrence of an
inode. All further hard links to the same inode are added to the file
list, but accounted with size 0.

All file names need to be added to the file list, because the list is
used for preserving the files/hard links on the target.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 scripts/lib/devtool/deploy.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index b1749ce67298..e5af2c95aec1 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -177,13 +177,19 @@ def deploy(args, config, basepath, workspace):
                         rd.getVar('base_libdir'), rd)
 
         filelist = []
+        inodes = set({})
         ftotalsize = 0
         for root, _, files in os.walk(recipe_outdir):
             for fn in files:
+                fstat = os.lstat(os.path.join(root, fn))
                 # Get the size in kiB (since we'll be comparing it to the output of du -k)
                 # MUST use lstat() here not stat() or getfilesize() since we don't want to
                 # dereference symlinks
-                fsize = int(math.ceil(float(os.lstat(os.path.join(root, fn)).st_size)/1024))
+                if fstat.st_ino in inodes:
+                    fsize = 0
+                else:
+                    fsize = int(math.ceil(float(fstat.st_size)/1024))
+                inodes.add(fstat.st_ino)
                 ftotalsize += fsize
                 # The path as it would appear on the target
                 fpath = os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn)
-- 
2.20.1

