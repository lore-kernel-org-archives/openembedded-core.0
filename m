Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 6DDFB7DE86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 05:56:09 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 31B962202AD;
	Tue, 14 May 2019 17:56:05 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 17:55:59 +1200
Message-Id: <20190514055559.17676-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] distutils: Tidy and simplify for readability
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
X-List-Received-Date: Tue, 14 May 2019 05:56:10 -0000

Line lengths, remove duplication, and use the PYTHON variable provided by
pythonnative.bbclass.

Coincidentally fixes a dormant defect in distutils3.bbclass in which we were
sedding for STAGING_BINDIR_NATIVE/python-python3/python3.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/distutils.bbclass  | 26 +++++++++++---------------
 meta/classes/distutils3.bbclass | 22 ++++++++--------------
 2 files changed, 19 insertions(+), 29 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index b5c9c2fbbd..3759b58263 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -52,25 +52,20 @@ distutils_do_install() {
 
         # support filenames with *spaces*
         # only modify file if it contains path  and recompile it
-        find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \; -exec ${STAGING_BINDIR_NATIVE}/python-native/python -mcompileall {} \;
+        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
+                               -exec sed -i -e s:${D}::g {} \; \
+                               -exec ${STAGING_BINDIR_NATIVE}/python-native/python -mcompileall {} \;
 
-        if test -e ${D}${bindir} ; then	
-            for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
+        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
+            if [ -f "$i" ]; then
+                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
-
-        if [ -e ${D}${sbindir} ]; then
-            for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
+            fi
+        done
 
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py*
-        
+
         #
         # FIXME: Bandaid against wrong datadir computation
         #
@@ -80,7 +75,8 @@ distutils_do_install() {
         fi
 
 	# Fix backport modules
-	if [ -e ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/backports/__init__.py ] && [ -e ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py ]; then
+	if [ -e ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/backports/__init__.py ] && 
+           [ -e ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py ]; then
 	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py;
 	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc;
 	fi
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 42e7f5ae53..05a24bfe26 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -56,24 +56,18 @@ distutils3_do_install() {
         bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
 
         # support filenames with *spaces*
-        find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \;
+        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
+                               -exec sed -i -e s:${D}::g {} \;
 
-        if test -e ${D}${bindir} ; then	
-            for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
+        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
+            if [ -f "$i" ]; then
+                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
-
-        if test -e ${D}${sbindir}; then
-            for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
+            fi
+        done
 
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
-        
+
         #
         # FIXME: Bandaid against wrong datadir computation
         #
-- 
2.17.1


