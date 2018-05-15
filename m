Return-Path: <joe.rutledge@phabrix.com>
Received: from ion-systems.net (custmail.ion-systems.net [213.129.94.130])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1B074FA0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 09:45:06 +0000 (UTC)
Received: from Thripper.dynamic.ziggo.nl ([217.63.252.239]) by ion-systems.net
	with MailEnable ESMTP; Tue, 15 May 2018 10:45:05 +0100
From: Joe Rutledge <joe.rutledge@phabrix.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 10:45:01 +0100
Message-Id: <1526377501-7367-1-git-send-email-joe.rutledge@phabrix.com>
X-Mailer: git-send-email 2.7.4
X-ME-Bayesian: 0.000000
Subject: [PATCH] python-3.5: Include _posixsubprocess in package
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
X-List-Received-Date: Tue, 15 May 2018 09:45:07 -0000

Change the python-3.5-manifest.inc file to also include:
lib-dynload/_posixsubprocess.*.so

This is needed for Python subprocess support but was not included.

Signed-off-by: Joe Rutledge <joe.rutledge@phabrix.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 0ad9186..7b642c3 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -231,7 +231,7 @@ FILES_${PN}-stringold="${libdir}/python3.5/lib-dynload/strop.*.so ${libdir}/pyth
 
 SUMMARY_${PN}-subprocess="Python subprocess support"
 RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal ${PN}-selectors"
-FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* "
+FILES_${PN}-subprocess="${libdir}/python3.5/subprocess.* ${libdir}/python3.5/lib-dynload/_posixsubprocess.*.so "
 
 SUMMARY_${PN}-syslog="Python syslog interface"
 RDEPENDS_${PN}-syslog="${PN}-core"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index eac493a..0db8540 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -17,7 +17,7 @@ import os
 import sys
 import time
 
-VERSION = "3.5.0"
+VERSION = "3.5.1"
 
 __author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 __version__ = "20140131"
@@ -173,7 +173,7 @@ if __name__ == "__main__":
     "warnings.* site.* stat.* " +
     "UserDict.* UserList.* UserString.* " +
     "lib-dynload/binascii.*.so lib-dynload/_struct.*.so lib-dynload/time.*.so " +
-    "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* "  + 
+    "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* "  +
     "_weakrefset.* sysconfig.* _sysconfigdata.* config/Makefile " +
     "${includedir}/python${PYTHON_BINABI}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/collections " +
@@ -349,7 +349,7 @@ if __name__ == "__main__":
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle ${PN}-signal ${PN}-selectors",
-    "subprocess.*" )
+    "subprocess.* lib-dynload/_posixsubprocess.*.so" )
 
     m.addPackage( "${PN}-signal", "Python set handlers for asynchronous events support", "${PN}-core",
     "signal.*" )
-- 
2.7.4


