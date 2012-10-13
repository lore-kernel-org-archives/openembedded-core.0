Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TN0mX-0007yZ-LJ
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Oct 2012 14:25:29 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q9DCCBgt002985
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 13 Oct 2012 14:12:12 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TN0Ze-0000oj-Vg; Sat, 13 Oct 2012 14:12:11 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Oct 2012 14:12:02 +0200
Message-Id: <1350130322-3100-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.6
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] package.bbclass: search for dangling links in installation directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Oct 2012 12:25:29 -0000

The old dangling link detection used os.stat() on the file and
registered it as a dangling link when it was not found. This causes
problems when the link is an absolute one because it will check files of
the host system.

E.g. when there is a link

.../tmp/work/../etc/cron.root -> /var/spool/cron/root

Then

* existence of /var/spool/cron/root but not of
  ../tmp/work/.../var/spool/cron/root will be checked

* the build aborts because a 'permission denied' exception is thrown
  but only 'not found' be catched. E.g. build of systemd on an SELinux
  enabled host aborts with:

  | ERROR: Error executing a python function in .../systemd/systemd_git.bb:
  | OSError: [Errno 13] Permission denied: '.../packages-split/systemd-initramfs/init'
  | ...
  | ERROR:      0219:                try:
  | ERROR:  *** 0220:                    s = os.stat(path)
  | ERROR:      0221:                except OSError, (err, strerror):

This patch uses os.lstat() to check whether source file is a link, adds
it to the installation root direction and checks for the existence of
this file then.

As this is only a QA mechanism which does not affect the resulting
package, rebuilds are not needed

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/package.bbclass | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 73c4358..30614f0 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1063,14 +1063,23 @@ python populate_packages () {
                 path = os.path.join(root, f)
                 rpath = path[len(inst_root):]
                 pkg_files[pkg].append(rpath)
+
+                if not os.path.islink(path):
+                    continue
+
+                target = os.readlink(path)
+                if target[0] != '/':
+                    # make path absolute relative to inst_root
+                    target = os.path.join(root[len(inst_root):], target)
+
+                # make path absolute; do not use os.path.join() here
+                # because target might start with multiple '/'
+                rtarget = inst_root + target
                 try:
-                    s = os.stat(path)
+                    os.lstat(rtarget)
                 except OSError, (err, strerror):
                     if err != errno.ENOENT:
                         raise
-                    target = os.readlink(path)
-                    if target[0] != '/':
-                        target = os.path.join(root[len(inst_root):], target)
                     dangling_links[pkg].append(os.path.normpath(target))
 
     for pkg in package_list:
-- 
1.7.11.7



