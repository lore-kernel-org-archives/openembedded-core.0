Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mlq-0000Hp-Rd
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321830"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:59:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:54 -0700
Message-Id: <8d240f4980352fc95b902648cbabeca582630db3.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/23] python: regenerate plat-linux2/*.py
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
X-List-Received-Date: Tue, 13 Mar 2012 08:07:51 -0000

From: Andreas Oberritter <obi@opendreambox.org>

* If plat-linux2/DLFCN.py was present, python was broken in our
  image, i.e. it was unable to load many modules. This was due
  to changed RTLD_* constants in dlfcn.h
* Python includes a script, plat-linux2/regen, to regenerate
  the py source codes in this directory.
* Do what plat-linux2/regen would do, but use files from
  STAGING_INCDIR.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/python/python_2.7.2.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 5ad4109..0a8e534 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -37,6 +37,17 @@ do_configure_prepend() {
 }
 
 do_compile() {
+        # regenerate platform specific files, because they depend on system headers
+        cd Lib/plat-linux2
+        include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python \
+                ${S}/Tools/scripts/h2py.py -i '(u_long)' \
+                ${STAGING_INCDIR}/dlfcn.h \
+                ${STAGING_INCDIR}/linux/cdrom.h \
+                ${STAGING_INCDIR}/netinet/in.h \
+                ${STAGING_INCDIR}/sys/types.h
+        sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
+        cd -
+
 	#
 	# Copy config.h and an appropriate Makefile for distutils.sysconfig,
 	# which laters uses the information out of these to compile extensions
-- 
1.7.7.6



