Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UD1xp-0008J5-0D
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 01:12:14 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2013 00:55:33 +0100
Message-Id: <1362527733-3589-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][RFC] chrpath.bbclass: strip common parent directories from rpath
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
X-List-Received-Date: Wed, 06 Mar 2013 00:12:19 -0000

Allows to use shorter TMPDIRs in corner cases, e.g. with native
perl modules, having a deep directory structure.

The problem is that the original absolute rpath may be shorter
than the newly generated relative rpath.

The failing rpaths were '/ab/cde/tmp/sysroots/x86_64-linux/usr/lib'
(old) and '$ORIGIN/../../../../../../../../../usr/lib' (new) for
'/ab/cde/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/auto/XML/Parser/Expat/Expat.so'

The new rpath is '$ORIGIN/../../../../../../..'.

The new code doesn't just compare libdir, because I guess it
should also work if only parts of libdir share a parent directory
with the binary.

This patch also adds a check for len(basedir) > 0, because I think
basedir is empty in the cross-compile case, in which case
rpath.find(basedir) would always return 0, but I'm unsure whether
I understood that part of the code correctly or not.

[YOCTO #3989]

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/chrpath.bbclass |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 0c7ab77..ed4a0b2 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -55,9 +55,22 @@ def process_dir (directory, d):
                 rpath =  os.path.normpath(rpath)
                 # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
                 # base_prefix shared root
-                if rpath.find(basedir) != -1:
-                    depth = fpath.partition(basedir)[2].count('/')
+                if len(basedir) > 0 and rpath.find(basedir) != -1:
+                    relfpath = fpath.partition(basedir)[2].strip()
                     libpath = rpath.partition(basedir)[2].strip()
+                    depth = relfpath.count('/')
+                    # Compare common parent directories to reduce the length of the new rpath.
+                    # Ignore the first (empty) element.
+                    libdirs = libpath.split('/')
+                    relfdirs = relfpath.split('/')
+                    nparents = 0
+                    for i in range(1, min(len(libdirs), len(relfdirs))):
+                        if libdirs[i] != relfdirs[i]:
+                            break
+                        nparents += 1
+                    if nparents > 0:
+                        libpath = '/'.join(libdirs[:-nparents])
+                        depth -= nparents
                 # otherwise (i.e. cross packages) determine a shared root based on the TMPDIR
                 # NOTE: This will not work reliably for cross packages, particularly in the case
                 # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
-- 
1.7.10.4



