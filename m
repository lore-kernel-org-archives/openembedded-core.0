Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09DF075D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:15:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7F2f6019122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:15:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:15:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:55 -0700
Message-ID: <0626d6717636234044045e4810e509bf7a0f77ad.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] python-pygtk: remove invalid sed command
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
X-List-Received-Date: Fri, 10 Jul 2015 07:15:02 -0000
Content-Type: text/plain

* There is no 'tests docs' in Makefile.am any more, so remove:
    sed -i 's:tests docs:tests:' ${S}/Makefile.am
* Remove the invalid sed command in do_install_append, only the one for
  pygtk-demo is needed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |   21 --------------------
 1 file changed, 21 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index 053f37f..e4c33a8 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -37,31 +37,10 @@ do_configure_prepend() {
 		-e s:'`$PKG_CONFIG --variable codegendir pygobject-2.0`':\"${STAGING_DATADIR}/pygobject/2.0/codegen\":g \
 		-e s:'`$PKG_CONFIG --variable=fixxref pygobject-2.0`':\"${STAGING_DATADIR}/pygobject/xsl/fixxref.py\":g \
 		${S}/configure.ac
-	sed -i 's:tests docs:tests:' ${S}/Makefile.am
 }
 
 # dirty fix #2: fix build system paths leaking in
 do_install_append() {
-        for i in `find ${D} -name "*.py"` ; do \
-            sed -i -e s:${D}::g $i
-        done
-
-        for i in `find ${D} -name "*.la"` ; do \
-            sed -i -e s:${STAGING_LIBDIR}:${libdir}:g $i
-        done
-        
-        if test -e ${D}${bindir} ; then
-            for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
-
-        if test -e ${D}${sbindir} ; then
-            for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
-
 	sed -i -e '1s|^#!.*python|#!/usr/bin/env python|' ${D}${bindir}/pygtk-demo
 }
 
-- 
1.7.9.5


