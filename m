Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob06.myregisteredsite.com
	(atl4mhob06.myregisteredsite.com [209.17.115.44])
	by mail.openembedded.org (Postfix) with ESMTP id 25A196DF81
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2013 06:47:00 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob06.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	rB66kwqB027611 for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Dec 2013 01:46:58 -0500
Received: (qmail 18487 invoked by uid 0); 6 Dec 2013 06:46:58 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 6 Dec 2013 06:46:58 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 07:46:51 +0100
Message-Id: <1386312411-11429-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Cc: Mike Looijmans <mike.looijmans@topic.nl>, mlauer@vanille-media.de
Subject: [PATCH] python: Add missing RDEPENDS for python-unittest
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
X-List-Received-Date: Fri, 06 Dec 2013 06:47:01 -0000

After installing python-unittest, the following errors occur when executing
"import unittest" from a python commandline:
ImportError: No module named StringIO
ImportError: No module named pprint
ImportError: No module named difflib
ImportError: No module named pprint
ImportError: No module named fnmatch

Fix this by adding the missing dependencies to the generator script and run
the generator.
---
 .../python/python-2.7-manifest.inc                 |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 6d3a9e6..8e52252 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -251,7 +251,7 @@ RDEPENDS_${PN}-tkinter="${PN}-core"
 FILES_${PN}-tkinter="${libdir}/python2.7/lib-dynload/_tkinter.so ${libdir}/python2.7/lib-tk "
 
 DESCRIPTION_${PN}-unittest="Python Unit Testing Framework"
-RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang"
+RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
 FILES_${PN}-unittest="${libdir}/python2.7/unittest/ "
 
 DESCRIPTION_${PN}-unixadmin="Python Unix Administration Support"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 124a1a4..6e73c48 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -367,7 +367,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-tkinter", "Python Tcl/Tk Bindings", "${PN}-core",
     "lib-dynload/_tkinter.so lib-tk" ) # package
 
-    m.addPackage( "${PN}-unittest", "Python Unit Testing Framework", "${PN}-core ${PN}-stringold ${PN}-lang",
+    m.addPackage( "${PN}-unittest", "Python Unit Testing Framework", "${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell",
     "unittest/" )
 
     m.addPackage( "${PN}-unixadmin", "Python Unix Administration Support", "${PN}-core",
-- 
1.7.9.5


