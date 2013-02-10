Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U4WTp-0000NG-Tf
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 13:58:04 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1ACfr2R027422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 10 Feb 2013 13:41:54 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U4WED-00075o-8k; Sun, 10 Feb 2013 13:41:53 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Feb 2013 13:41:47 +0100
Message-Id: <69be0b1aae50eb097172bcfa2e9aa02157f62436.1360499939.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <7acaf76adbd1f0c29b17da721267392533d3a703.1360499939.git.enrico.scholz@sigma-chemnitz.de>
References: <7acaf76adbd1f0c29b17da721267392533d3a703.1360499939.git.enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <7acaf76adbd1f0c29b17da721267392533d3a703.1360499939.git.enrico.scholz@sigma-chemnitz.de>
References: <7acaf76adbd1f0c29b17da721267392533d3a703.1360499939.git.enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/3] package.bbclass: use oe.path.realpath()
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
X-List-Received-Date: Sun, 10 Feb 2013 12:58:12 -0000

oe.path.realpath() provides are common and more correct implementation
for resolving symlinks within sysroot. Use it.

Old implementation suffered from lot of problems; e.g.

* redundant code

* calls 'os.stat()' which references files on host; this can give wrong
  results about existing/non-existing and can cause EPERM (instead of
  the catched ENONENT) exceptions

* does not deal with special cases like '..' leaving the sysroot.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/package.bbclass | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b10e6f6..a74ec8a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -741,7 +741,8 @@ python split_and_strip_files () {
                     continue
 
                 try:
-                    s = os.stat(file)
+                    ltarget = oe.path.realpath(file, dvar, False)
+                    s = os.lstat(ltarget)
                 except OSError, (err, strerror):
                     if err != errno.ENOENT:
                         raise
@@ -752,11 +753,6 @@ python split_and_strip_files () {
                     # If it's a symlink, and points to an ELF file, we capture the readlink target
                     if os.path.islink(file):
                         target = os.readlink(file)
-                        if not os.path.isabs(target):
-                            ltarget = os.path.join(os.path.dirname(file), target)
-                        else:
-                            ltarget = target
-
                         if isELF(ltarget):
                             #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
                             symlinks[file] = target
@@ -1005,14 +1001,12 @@ python package_fixsymlinks () {
                 rpath = path[len(inst_root):]
                 pkg_files[pkg].append(rpath)
                 try:
-                    s = os.stat(path)
+                    rtarget = oe.path.realpath(path, inst_root, True)
+                    os.lstat(rtarget)
                 except OSError, (err, strerror):
                     if err != errno.ENOENT:
                         raise
-                    target = os.readlink(path)
-                    if target[0] != '/':
-                        target = os.path.join(os.path.dirname(path)[len(inst_root):], target)
-                    dangling_links[pkg].append(os.path.normpath(target))
+                    dangling_links[pkg].append(os.path.normpath(rtarget[len(inst_root):]))
 
     newrdepends = {}
     for pkg in dangling_links:
-- 
1.7.11.7



