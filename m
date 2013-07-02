Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id C070D608A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 09:50:53 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2013 11:50:42 +0200
Message-Id: <1372758642-6302-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1362529925-13211-1-git-send-email-obi@opendreambox.org>
References: <1362529925-13211-1-git-send-email-obi@opendreambox.org>
Subject: [RFC PATCH v3] chrpath.bbclass: strip common parent directories from rpath
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
X-List-Received-Date: Tue, 02 Jul 2013 09:50:54 -0000

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
v2: Fixed reassembly of libpath
v3: Really fixed reassembly of libpath:
    libpath = '/' + '/'.join(libdirs[nparents + 1:])

 I've been using this version of the patch since about four months ago
 and didn't notice any problems.

 meta/classes/chrpath.bbclass | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 0c7ab77..9255aa7 100644
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
+                        libpath = '/' + '/'.join(libdirs[nparents + 1:])
+                        depth -= nparents
                 # otherwise (i.e. cross packages) determine a shared root based on the TMPDIR
                 # NOTE: This will not work reliably for cross packages, particularly in the case
                 # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
-- 
1.8.1.2


