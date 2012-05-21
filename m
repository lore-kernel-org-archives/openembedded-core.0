Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWZmO-00080O-Fw
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 23:04:36 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2012 22:54:23 +0200
Message-Id: <1337633664-19754-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] distutils.bbclass: don't delete .pyo files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2012 21:04:36 -0000

* Deleting .pyo files causes them to get compiled on the target.
* First boot gets *really* slow for python based projects.
* No space gets saved on the target.
* The package manager doesn't know about the files and
  therefore fails to uninstall them, occupying space and causing
  uninstalled python scripts to remain executable.
* It's inconsistent, because python itself and autotools based
  projects already ship .pyo files.
* Probably .pyo files were deleted because .pyc files were
  available earlier, but this has changed and OE-Core's python
  now only generates optimized .pyo files. Deletion of .pyo was
  introduced in 2008, python/04-default-is-optimized.patch
  was introduced in 2009.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/distutils.bbclass |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 18ae805..bcddf8d 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -65,10 +65,6 @@ distutils_do_install() {
         if test -e ${D}${datadir}/share; then
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
         fi
-
-        # These are generated files, on really slow systems the storage/speed trade off
-        # might be worth it, but in general it isn't 
-        find ${D}${libdir}/${PYTHON_DIR}/site-packages -iname '*.pyo' -exec rm {} \;
 }
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
1.7.9.5



