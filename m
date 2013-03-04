Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1UCNO0-00074L-Ar
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 05:52:29 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r244a2C3014134
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Mar 2013 20:36:02 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Sun, 3 Mar 2013 20:36:00 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Mar 2013 12:35:57 +0800
Message-ID: <1362371757-3323-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <3450>
References: <3450>
MIME-Version: 1.0
Subject: [PATCH 1/1] Python: Fix for CVE-2012-2135
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
X-List-Received-Date: Mon, 04 Mar 2013 04:52:29 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

Reference:http://bugs.python.org/issue14579

The utf-16 decoder in Python 3.1 through 3.3 does not update the
aligned_end variable after calling the unicode_decode_call_errorhandler
function, which allows remote attackers to obtain sensitive information
(process memory) or cause a denial of service (memory corruption and crash)
via unspecified vectors.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135

[YOCTO #3450]

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 .../python/python/python-2.7.3-CVE-2012-2135.patch | 73 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |  3 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2012-2135.patch

diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2012-2135.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2012-2135.patch
new file mode 100644
index 0000000..3afdbc0
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2012-2135.patch
@@ -0,0 +1,73 @@
+Upstream-Status: Backport
+
+Reference:http://bugs.python.org/issue14579
+
+The utf-16 decoder in Python 3.1 through 3.3 does not update the
+aligned_end variable after calling the unicode_decode_call_errorhandler
+function, which allows remote attackers to obtain sensitive information
+(process memory) or cause a denial of service (memory corruption and crash)
+via unspecified vectors.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135
+
+diff -urpN a/Lib/test/test_codecs.py b/Lib/test/test_codecs.py
+--- a/Lib/test/test_codecs.py
++++ b/Lib/test/test_codecs.py
+@@ -495,8 +495,21 @@ class UTF16LETest(ReadTest):
+         )
+ 
+     def test_errors(self):
+-        self.assertRaises(UnicodeDecodeError, codecs.utf_16_le_decode, "\xff", "strict", True)
+-
++        tests = [
++            (b'\xff', u'\ufffd'),
++            (b'A\x00Z', u'A\ufffd'),
++            (b'A\x00B\x00C\x00D\x00Z', u'ABCD\ufffd'),
++            (b'\x00\xd8', u'\ufffd'),
++            (b'\x00\xd8A', u'\ufffd'),
++            (b'\x00\xd8A\x00', u'\ufffdA'),
++            (b'\x00\xdcA\x00', u'\ufffdA'),
++        ]
++        for raw, expected in tests:
++            print('*****', raw, expected)
++            self.assertRaises(UnicodeDecodeError, codecs.utf_16_le_decode,
++                              raw, 'strict', True)
++            self.assertEqual(raw.decode('utf-16le', 'replace'), expected)
++        
+ class UTF16BETest(ReadTest):
+     encoding = "utf-16-be"
+ 
+@@ -516,7 +529,20 @@ class UTF16BETest(ReadTest):
+         )
+ 
+     def test_errors(self):
+-        self.assertRaises(UnicodeDecodeError, codecs.utf_16_be_decode, "\xff", "strict", True)
++        tests = [
++            (b'\xff', u'\ufffd'),
++            (b'\x00A\xff', u'A\ufffd'),
++            (b'\x00A\x00B\x00C\x00DZ', u'ABCD\ufffd'),
++            (b'\xd8\x00', u'\ufffd'),
++            (b'\xd8\x00\xdc', u'\ufffd'),
++            (b'\xd8\x00\x00A', u'\ufffdA'),
++            (b'\xdc\x00\x00A', u'\ufffdA'),
++        ]
++        for raw, expected in tests:
++            print('*****', raw, expected)
++            self.assertRaises(UnicodeDecodeError, codecs.utf_16_be_decode,
++                              raw, 'strict', True)
++            self.assertEqual(raw.decode('utf-16be', 'replace'), expected)
+ 
+ class UTF8Test(ReadTest):
+     encoding = "utf-8"
+diff -urpN a/Objects/unicodeobject.c b/Objects/unicodeobject.c
+--- a/Objects/unicodeobject.c	2013-03-04 11:34:34.000000000 +0800
++++ b/Objects/unicodeobject.c	2013-03-04 11:36:01.000000000 +0800
+@@ -2564,7 +2564,7 @@ PyUnicode_DecodeUTF16Stateful(const char
+         }
+ 
+         /* UTF-16 code pair: */
+-        if (q >= e) {
++        if (e - q < 2) {
+             errmsg = "unexpected end of data";
+             startinpos = (((const char *)q)-2)-starts;
+             endinpos = ((const char *)e)-starts;
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index f0d5c90..c181933 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -28,6 +28,7 @@ SRC_URI += "\
   file://python-2.7.3-berkeley-db-5.3.patch \
   file://python-2.7.3-remove-bsdb-rpath.patch \
   file://builddir.patch \
+  file://python-2.7.3-CVE-2012-2135.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.11



