Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9247F75CF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 00:57:07 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0224.002; Wed, 11 Nov 2015 01:57:02 +0100
From: Tudor Florea <Tudor.Florea@enea.com>
To: Tudor Florea <Tudor.Florea@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [dizzy] [PATCH] python: Backport CVE-2013-1752 fix from upstream
Thread-Index: AQHQtTd6zR68SDTWGEuFYuvsTW18wJ6Wd0CQ
Date: Wed, 11 Nov 2015 00:57:01 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A428CB1D4B@SESTOEX04.enea.se>
References: <1435890305-23163-1-git-send-email-tudor.florea@enea.com>
In-Reply-To: <1435890305-23163-1-git-send-email-tudor.florea@enea.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.15.34]
MIME-Version: 1.0
Subject: Re: [dizzy] [PATCH] python: Backport CVE-2013-1752 fix from upstream
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
X-List-Received-Date: Wed, 11 Nov 2015 00:57:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There was not feedback on this.
Under the same CVE there lay actually many python vulnerabilities that are =
still applicable for dizzy branch.
Among those only poplib module is covered (python-2.7.3-CVE-2013-1752-popli=
b-fix.patch)
This patch covers httplib modules and I have also a patch for the remaining=
 modules.
Should I (re)send the patch?
Regards
  Tudor.


-----Original Message-----
From: Tudor Florea [mailto:tudor.florea@enea.com]=20
Sent: Friday, July 03, 2015 5:25 AM
To: openembedded-core@lists.openembedded.org
Cc: Tudor Florea <Tudor.Florea@enea.com>
Subject: [dizzy] [PATCH] python: Backport CVE-2013-1752 fix from upstream

This back ported patch fixes CVE-2013-1752 for httplib
References:
http://bugs.python.org/issue16037
https://access.redhat.com/security/cve/CVE-2013-1752

The httplib module / package can read arbitrary amounts of data from its so=
cket when it's parsing the HTTP header. This may lead to issues when a user=
 connects to a broken HTTP server or something that isn't a HTTP at all

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../python-2.7.3-CVE-2013-1752-httplib-fix.patch   | 45 ++++++++++++++++++=
++++
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-20=
13-1752-httplib-fix.patch

diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752=
-httplib-fix.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2=
013-1752-httplib-fix.patch
new file mode 100644
index 0000000..e68f53f
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-htt
+++ plib-fix.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Backport
+
+CVE-2013-1752: httplib: HTTPMessage.readheaders() raises an=20
+HTTPException when more than 100 headers are read.
+Patch by Jyrki Pulliainen and Daniel Eriksson.
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+---
+diff -r 133ee2b48e52 Lib/httplib.py
+--- a/Lib/httplib.py	Fri Aug 01 23:51:51 2014 -0700
++++ b/Lib/httplib.py	Sat Aug 02 13:59:25 2014 +0000
+@@ -214,6 +214,7 @@
+=20
+ # maximal line length when calling readline().
+ _MAXLINE =3D 65536
++_MAXHEADERS =3D 100
+=20
+ class HTTPMessage(mimetools.Message):
+=20
+@@ -271,6 +272,8 @@
+         elif self.seekable:
+             tell =3D self.fp.tell
+         while True:
++            if len(hlist) > _MAXHEADERS:
++                raise HTTPException("got more than %d headers" %=20
++ _MAXHEADERS)
+             if tell:
+                 try:
+                     startofline =3D tell() diff -r 133ee2b48e52=20
+Lib/test/test_httplib.py
+--- a/Lib/test/test_httplib.py	Fri Aug 01 23:51:51 2014 -0700
++++ b/Lib/test/test_httplib.py	Sat Aug 02 13:59:25 2014 +0000
+@@ -262,6 +262,13 @@
+         if resp.read() !=3D "":
+             self.fail("Did not expect response from HEAD request")
+=20
++    def test_too_many_headers(self):
++        headers =3D '\r\n'.join('Header%d: foo' % i for i in xrange(200))=
 + '\r\n'
++        text =3D ('HTTP/1.1 200 OK\r\n' + headers)
++        s =3D FakeSocket(text)
++        r =3D httplib.HTTPResponse(s)
++        self.assertRaises(httplib.HTTPException, r.begin)
++
+     def test_send_file(self):
+         expected =3D 'GET /foo HTTP/1.1\r\nHost: example.com\r\n' \
+                    'Accept-Encoding: identity\r\nContent-Length:'
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-de=
vtools/python/python_2.7.3.bb
index cbe8d7f..d603587 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -40,6 +40,7 @@ SRC_URI +=3D "\
   file://posix_close.patch \
   file://python-2.7.3-CVE-2014-7185.patch \
   file://python2.7.3-nossl3.patch \
+  file://python-2.7.3-CVE-2013-1752-httplib-fix.patch \
 "
=20
 S =3D "${WORKDIR}/Python-${PV}"
--
1.9.1


