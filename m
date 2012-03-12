Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7CrT-0006Vh-2Z
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:32:59 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 22:24:09 +0100
Message-Id: <1331587452-27755-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
References: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/5] python: regenerate plat-linux2/*.py
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
X-List-Received-Date: Mon, 12 Mar 2012 21:32:59 -0000

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
index 7c2ce57..6317bb9 100644
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
1.7.5.4



