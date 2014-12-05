Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id C7FC372391
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 17:08:55 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Fri, 5 Dec 2014
	18:08:54 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 662652800CB;
	Fri,  5 Dec 2014 18:08:54 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Dec 2014 18:08:49 +0100
Message-ID: <1417799329-31577-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] python: fix ssl import error
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
X-List-Received-Date: Fri, 05 Dec 2014 17:08:59 -0000
Content-Type: text/plain

Fix this ssl import error:
Python 2.7.3 (default, Dec  5 2014, 16:24:17)
[GCC 4.9.1] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import ssl
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/ssl.py", line 92, in <module>
    import base64        # for DER-to-PEM translation
ImportError: No module named base64

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-2.7.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index a8afe13..9a514b1 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -122,7 +122,7 @@ RDEPENDS_${PN}-importlib="${PN}-core"
 FILES_${PN}-importlib="${libdir}/python2.7/importlib "
 
 SUMMARY_${PN}-io="Python low-level I/O"
-RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils"
+RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient"
 FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_io.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* ${libdir}/python2.7/io.* ${libdir}/python2.7/_pyio.* "
 
 SUMMARY_${PN}-json="Python JSON support"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 65486d8..21b874f 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -275,7 +275,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-image", "Python graphical image handling", "${PN}-core",
     "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
 
-    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math ${PN}-textutils",
+    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient",
     "lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
     "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
 
-- 
1.9.1


