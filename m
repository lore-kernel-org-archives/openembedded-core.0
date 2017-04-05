Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0D80177A4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491395894; x=1522931894;
	h=from:to:cc:subject:date:message-id;
	bh=rHqt04RJij2BKm3Nld5FTxcjeKUjHiRjbdTu7Pap8FM=;
	b=C2Bp38BzrGl7GoabdWhHqguURLxsnlPQrTFfbJZQX+G5FGz4Yw9PU/Ka
	ugDFjsdBs3JYHrP2BLSaxiEHV9X/Tw==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 05:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,278,1486454400"; d="scan'208";a="244553402"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by fmsmga004.fm.intel.com with ESMTP; 05 Apr 2017 05:38:12 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 15:37:45 +0300
Message-Id: <20170405123745.15688-1-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] python3: fix run-time deps for core python3 libraries
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
X-List-Received-Date: Wed, 05 Apr 2017 12:38:13 -0000

The http.server module from python3-netclient imports the html module
which is in python3-html. Also xmlrpc.server imports pydoc which is a
part of python3-pydoc. But those run-time dependencies are missing
from python3-netclient and python3-xmlrpc respectively.

Add the missing run-time dependencies.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
 scripts/contrib/python/generate-manifest-3.5.py      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 55bcc4b..ec30eb9 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -153,7 +153,7 @@ RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN
 FILES_${PN}-multiprocessing="${libdir}/python3.5/lib-dynload/_multiprocessing.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_multiprocessing.*.so ${libdir}/python3.5/multiprocessing ${libdir}/python3.5/multiprocessing/__pycache__ "
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
-RDEPENDS_${PN}-netclient="${PN}-argparse ${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
+RDEPENDS_${PN}-netclient="${PN}-argparse ${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime ${PN}-html"
 FILES_${PN}-netclient="${libdir}/python3.5/*Cookie*.* ${libdir}/python3.5/__pycache__/*Cookie*.* ${libdir}/python3.5/base64.* ${libdir}/python3.5/__pycache__/base64.* ${libdir}/python3.5/cookielib.* ${libdir}/python3.5/__pycache__/cookielib.* ${libdir}/python3.5/ftplib.* ${libdir}/python3.5/__pycache__/ftplib.* ${libdir}/python3.5/gopherlib.* ${libdir}/python3.5/__pycache__/gopherlib.* ${libdir}/python3.5/hmac.* ${libdir}/python3.5/__pycache__/hmac.* ${libdir}/python3.5/http* ${libdir}/python3.5/http*/__pycache__ ${libdir}/python3.5/httplib.* ${libdir}/python3.5/__pycache__/httplib.* ${libdir}/python3.5/mimetypes.* ${libdir}/python3.5/__pycache__/mimetypes.* ${libdir}/python3.5/nntplib.* ${libdir}/python3.5/__pycache__/nntplib.* ${libdir}/python3.5/poplib.* ${libdir}/python3.5/__pycache__/poplib.* ${libdir}/python3.5/smtplib.* ${libdir}/python3.5/__pycache__/smtplib.* ${libdir}/python3.5/telnetlib.* ${libdir}/python3.5/__pycache__/telnetlib.* ${libdir}/python3.5/urllib ${libdir}/python3.5/urllib/__pycache__ ${libdir}/python3.5/uuid.* ${libdir}/python3.5/__pycache__/uuid.* ${libdir}/python3.5/rfc822.* ${libdir}/python3.5/__pycache__/rfc822.* ${libdir}/python3.5/mimetools.* ${libdir}/python3.5/__pycache__/mimetools.* "
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
@@ -273,7 +273,7 @@ RDEPENDS_${PN}-xml="${PN}-core ${PN}-re"
 FILES_${PN}-xml="${libdir}/python3.5/lib-dynload/_elementtree.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_elementtree.*.so ${libdir}/python3.5/lib-dynload/pyexpat.*.so ${libdir}/python3.5/lib-dynload/__pycache__/pyexpat.*.so ${libdir}/python3.5/xml ${libdir}/python3.5/xml/__pycache__ ${libdir}/python3.5/xmllib.* ${libdir}/python3.5/__pycache__/xmllib.* "
 
 SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
-RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
+RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang ${PN}-pydoc"
 FILES_${PN}-xmlrpc="${libdir}/python3.5/xmlrpclib.* ${libdir}/python3.5/__pycache__/xmlrpclib.* ${libdir}/python3.5/SimpleXMLRPCServer.* ${libdir}/python3.5/__pycache__/SimpleXMLRPCServer.* ${libdir}/python3.5/DocXMLRPCServer.* ${libdir}/python3.5/__pycache__/DocXMLRPCServer.* ${libdir}/python3.5/xmlrpc ${libdir}/python3.5/xmlrpc/__pycache__ "
 
 SUMMARY_${PN}-modules="All Python modules"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 386bdfc..5835de8 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -340,7 +340,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-multiprocessing", "Python multiprocessing support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap",
     "lib-dynload/_multiprocessing.*.so multiprocessing" ) # package
 
-    m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-argparse ${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
+    m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-argparse ${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime ${PN}-html",
     "*Cookie*.* " +
     "base64.* cookielib.* ftplib.* gopherlib.* hmac.* http* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib  uuid.* rfc822.* mimetools.*" )
 
@@ -422,7 +422,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-xml", "Python basic XML support", "${PN}-core ${PN}-re",
     "lib-dynload/_elementtree.*.so lib-dynload/pyexpat.*.so xml xmllib.*" ) # package
 
-    m.addPackage( "${PN}-xmlrpc", "Python XML-RPC support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
+    m.addPackage( "${PN}-xmlrpc", "Python XML-RPC support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang ${PN}-pydoc",
     "xmlrpclib.* SimpleXMLRPCServer.* DocXMLRPCServer.* xmlrpc" )
 
     m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
-- 
2.9.3


