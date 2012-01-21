Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RoUVi-0003rF-HU
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 07:33:10 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jan 2012 22:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98235465"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 20 Jan 2012 22:25:26 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 22:25:23 -0800
Message-Id: <c67c0ece1b10afa54447af5a350aa17659abbae5.1327127051.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <ffc4c2baa9ed5116336b1d5c2d6110f7e4163c27.1327127051.git.nitin.a.kamble@intel.com>
References: <ffc4c2baa9ed5116336b1d5c2d6110f7e4163c27.1327127051.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1327127051.git.nitin.a.kamble@intel.com>
References: <cover.1327127051.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/4] distutils: Bandaid against wrong libdir computation
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
X-List-Received-Date: Sat, 21 Jan 2012 06:33:10 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

fix python-* recipes install path for some of the files in libdir

This fixes issues like these:

WARNING: For recipe python-pyrex, the following files/directories were
installed but not shipped in any package:
WARNING:   /usr/share
WARNING:   /usr/share/lib
WARNING:   /usr/share/lib/python2.7
WARNING:   /usr/share/lib/python2.7/site-packages
WARNING:   /usr/share/lib/python2.7/site-packages/Pyrex
WARNING:   /usr/share/lib/python2.7/site-packages/Pyrex/Compiler
WARNING:
/usr/share/lib/python2.7/site-packages/Pyrex/Compiler/Lexicon.pickle

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/distutils.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 79b962a..b6383ac 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -66,6 +66,13 @@ distutils_do_install() {
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
         fi
 
+        #
+        # FIXME: Bandaid against wrong libdir computation
+        #
+        if test -e ${D}${datadir}/lib; then
+            cp -r -f ${D}${datadir}/lib/* ${D}${libdir}/
+            rm -rf ${D}${datadir}/lib/
+        fi
         # These are generated files, on really slow systems the storage/speed trade off
         # might be worth it, but in general it isn't 
         find ${D}${libdir}/${PYTHON_DIR}/site-packages -iname '*.pyo' -exec rm {} \;
-- 
1.7.6.4



