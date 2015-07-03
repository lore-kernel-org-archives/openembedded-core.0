Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 2B7E775D06
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 02:25:08 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Fri, 3 Jul 2015
	04:25:06 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 0A47628BA1E;
	Fri,  3 Jul 2015 04:25:07 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 04:25:05 +0200
Message-ID: <1435890305-23163-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [dizzy] [PATCH] python: Backport CVE-2013-1752 fix from upstream
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
X-List-Received-Date: Fri, 03 Jul 2015 02:25:10 -0000
Content-Type: text/plain

This back ported patch fixes CVE-2013-1752 for httplib
References:
http://bugs.python.org/issue16037
https://access.redhat.com/security/cve/CVE-2013-1752

The httplib module / package can read arbitrary amounts of data
from its socket when it's parsing the HTTP header. This may lead
to issues when a user connects to a broken HTTP server or
something that isn't a HTTP at all

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../python-2.7.3-CVE-2013-1752-httplib-fix.patch   | 45 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-httplib-fix.patch

diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-httplib-fix.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-httplib-fix.patch
new file mode 100644
index 0000000..e68f53f
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-httplib-fix.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Backport
+
+CVE-2013-1752: httplib: HTTPMessage.readheaders() raises an HTTPException 
+when more than 100 headers are read.
+Patch by Jyrki Pulliainen and Daniel Eriksson.
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+---
+diff -r 133ee2b48e52 Lib/httplib.py
+--- a/Lib/httplib.py	Fri Aug 01 23:51:51 2014 -0700
++++ b/Lib/httplib.py	Sat Aug 02 13:59:25 2014 +0000
+@@ -214,6 +214,7 @@
+ 
+ # maximal line length when calling readline().
+ _MAXLINE = 65536
++_MAXHEADERS = 100
+ 
+ class HTTPMessage(mimetools.Message):
+ 
+@@ -271,6 +272,8 @@
+         elif self.seekable:
+             tell = self.fp.tell
+         while True:
++            if len(hlist) > _MAXHEADERS:
++                raise HTTPException("got more than %d headers" % _MAXHEADERS)
+             if tell:
+                 try:
+                     startofline = tell()
+diff -r 133ee2b48e52 Lib/test/test_httplib.py
+--- a/Lib/test/test_httplib.py	Fri Aug 01 23:51:51 2014 -0700
++++ b/Lib/test/test_httplib.py	Sat Aug 02 13:59:25 2014 +0000
+@@ -262,6 +262,13 @@
+         if resp.read() != "":
+             self.fail("Did not expect response from HEAD request")
+ 
++    def test_too_many_headers(self):
++        headers = '\r\n'.join('Header%d: foo' % i for i in xrange(200)) + '\r\n'
++        text = ('HTTP/1.1 200 OK\r\n' + headers)
++        s = FakeSocket(text)
++        r = httplib.HTTPResponse(s)
++        self.assertRaises(httplib.HTTPException, r.begin)
++
+     def test_send_file(self):
+         expected = 'GET /foo HTTP/1.1\r\nHost: example.com\r\n' \
+                    'Accept-Encoding: identity\r\nContent-Length:'
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index cbe8d7f..d603587 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -40,6 +40,7 @@ SRC_URI += "\
   file://posix_close.patch \
   file://python-2.7.3-CVE-2014-7185.patch \
   file://python2.7.3-nossl3.patch \
+  file://python-2.7.3-CVE-2013-1752-httplib-fix.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


