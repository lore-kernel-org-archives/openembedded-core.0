Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <milo-software@users.sourceforge.net>)
	id 1U5tEc-00045k-4N for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 08:28:00 +0100
Received: from atl4mhob08.myregisteredsite.com
	(atl4mhob08.myregisteredsite.com [209.17.115.46])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1E7AbM4028524 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 02:10:37 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob08.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1E7AZLO012121 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 02:10:35 -0500
Received: (qmail 7878 invoked by uid 0); 14 Feb 2013 07:10:35 -0000
Received: from unknown (HELO phenom.lan) (mike@milosoftware.com@85.150.144.104)
	by 0 with ESMTPA; 14 Feb 2013 07:10:35 -0000
From: MiLo <milo-software@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 08:10:30 +0100
Message-Id: <1360825830-2520-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 1.7.5.4
Cc: MiLo <milo-software@users.sourceforge.net>
Subject: [PATCH] Python: Add missing dependency "textutils" to "io" package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2013 07:28:00 -0000
X-List-Received-Date: Thu, 14 Feb 2013 07:28:00 -0000

Modify the include file and script to generate a missing RDEPENDS.

Install python on target with python-io. Import ssl:

Python 2.7.3 (default, Feb  9 2013, 16:04:35)
[GCC 4.7.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import ssl
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/ssl.py", line 58, in <module>
ImportError: No module named textwrap

Installing python-textutils solves the issue.

Signed-off-by: MiLo <milo-software@users.sourceforge.net>
---
 .../python/python-2.7-manifest.inc                 |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 3c7be7e..84e5a0b 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -119,7 +119,7 @@ RDEPENDS_${PN}-image="${PN}-core"
 FILES_${PN}-image="${libdir}/python2.7/colorsys.* ${libdir}/python2.7/imghdr.* ${libdir}/python2.7/lib-dynload/imageop.so ${libdir}/python2.7/lib-dynload/rgbimg.so "
 
 DESCRIPTION_${PN}-io="Python Low-Level I/O"
-RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
+RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils"
 FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_io.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* ${libdir}/python2.7/io.* ${libdir}/python2.7/_pyio.* "
 
 DESCRIPTION_${PN}-json="Python JSON Support"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 6a11c89..22470f9 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -272,7 +272,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-image", "Python Graphical Image Handling", "${PN}-core",
     "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
 
-    m.addPackage( "${PN}-io", "Python Low-Level I/O", "${PN}-core ${PN}-math",
+    m.addPackage( "${PN}-io", "Python Low-Level I/O", "${PN}-core ${PN}-math ${PN}-textutils",
     "lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
     "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
 
-- 
1.7.5.4



