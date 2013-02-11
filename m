Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U4zCV-0002Zc-Fu
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 20:38:03 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1BJM0pI018940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 11 Feb 2013 20:22:01 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U4ywy-0007dY-He; Mon, 11 Feb 2013 20:22:00 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 20:21:53 +0100
Message-Id: <1360610513-29322-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360610513-29322-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1360610513-29322-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.9925
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/2] package.bbclass: support dangling path components
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
X-List-Received-Date: Mon, 11 Feb 2013 19:38:03 -0000

Commit ec2aab09769f4b6817d74d2175afa2b7c7598750 introduced a regression
on packages which contain symlinks with unresolvable path components
(e.g. lsof-dbg).  While assigning a variable, an exception was raised
and the exception handler accessed this variable.

Patch deals both with the dangling path components by assuming them as
valid directories and by avoiding the broken assignment.
---
 meta/classes/package.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a74ec8a..f95fdf7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1000,12 +1000,8 @@ python package_fixsymlinks () {
         for path in pkgfiles[pkg]:
                 rpath = path[len(inst_root):]
                 pkg_files[pkg].append(rpath)
-                try:
-                    rtarget = oe.path.realpath(path, inst_root, True)
-                    os.lstat(rtarget)
-                except OSError, (err, strerror):
-                    if err != errno.ENOENT:
-                        raise
+                rtarget = oe.path.realpath(path, inst_root, True, assume_dir = True)
+                if not os.path.lexists(rtarget):
                     dangling_links[pkg].append(os.path.normpath(rtarget[len(inst_root):]))
 
     newrdepends = {}
-- 
1.7.11.7



