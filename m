Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2j-00056a-AS
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034685"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:23 -0700
Message-Id: <7d53fac61bf097fb97b018ac51a45176d574a8d1.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 20/28] distutils.bbclass: don't delete .pyo files
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
X-List-Received-Date: Thu, 24 May 2012 04:52:57 -0000

From: Andreas Oberritter <obi@opendreambox.org>

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
 1 files changed, 0 insertions(+), 4 deletions(-)

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
1.7.7.6



