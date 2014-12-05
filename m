Return-Path: <magnus@minimum.se>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Dec 2014 10:13:36 UTC
Received: from mail.glesys.se (mail.glesys.se [195.238.77.166])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA8A7233B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 10:13:36 +0000 (UTC)
Received: from DEV095.hms.se (smtp.hms.se [88.131.56.171])
	(Authenticated sender: magnus@minimum.se)
	by mail.glesys.se (Postfix) with ESMTPSA id 50EEA600A74;
	Fri,  5 Dec 2014 11:01:44 +0100 (CET)
From: Magnus Olsson <magnus@minimum.se>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 11:03:46 +0100
Message-Id: <1417773826-28197-1-git-send-email-magnus@minimum.se>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] Add python-codecs runtime dependency for python-json
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
X-List-Received-Date: Fri, 05 Dec 2014 10:13:44 -0000

A piece of JSON initialization code that runs when you "import json"
tries to use the hex-decoder, thus breaks if you do not have
python-codecs installed. Example:

    >>> import json
    Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    File "/usr/lib/python2.7/json/__init__.py", line 108, in <module>
        from .decoder import JSONDecoder
      File "/usr/lib/python2.7/json/decoder.py", line 24, in <module>
        NaN, PosInf, NegInf = _floatconstants()
      File "/usr/lib/python2.7/json/decoder.py", line 18, in _floatconstants
        _BYTES = '7FF80000000000007FF0000000000000'.decode('hex')
    LookupError: no codec search functions registered: can't find encoding

This patch adds a runtime dependency on python-codecs for python-json and
re-generates the python manifests for Python v2.7. Solves [YOCTO #7020].

Signed-off-by: Magnus Olsson <magnus@minimum.se>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 meta/recipes-devtools/python/python.inc              | 2 +-
 scripts/contrib/python/generate-manifest-2.7.py      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index a8afe13..cb0f2b5 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -126,7 +126,7 @@ RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils"
 FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_io.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* ${libdir}/python2.7/io.* ${libdir}/python2.7/_pyio.* "
 
 SUMMARY_${PN}-json="Python JSON support"
-RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
+RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re ${PN}-codecs"
 FILES_${PN}-json="${libdir}/python2.7/json ${libdir}/python2.7/lib-dynload/_json.so "
 
 SUMMARY_${PN}-lang="Python low-level language support"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 19942ba..e9d8e2d 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
-INC_PR = "r0"
+INC_PR = "r1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed3abfd1059e2d3a36a8cff3986f9bb6"
 
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 65486d8..2139094 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -279,7 +279,7 @@ if __name__ == "__main__":
     "lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
     "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
 
-    m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-math ${PN}-re",
+    m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-math ${PN}-re ${PN}-codecs",
     "json lib-dynload/_json.so" ) # package
 
     m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core",
-- 
1.9.1


