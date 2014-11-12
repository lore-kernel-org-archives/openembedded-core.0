Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E30871FC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 08:25:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAC8Po7Q004999
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 00:25:51 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 00:25:50 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 03:25:48 -0500
Message-ID: <d9848e465b3a5248a66f7ea25e8bc58d5534068c.1415780321.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1415780321.git.wenzong.fan@windriver.com>
References: <cover.1415780321.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python: Fix CVE-2014-7185
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
X-List-Received-Date: Wed, 12 Nov 2014 08:25:52 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Integer overflow in bufferobject.c in Python before 2.7.8 allows
context-dependent attackers to obtain sensitive information from
process memory via a large size and offset in a "buffer" function.

This back-ported patch fixes CVE-2014-7185

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../python/python/python-2.7.3-CVE-2014-7185.patch |   75 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |    1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch

diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch
new file mode 100644
index 0000000..60ef145
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch
@@ -0,0 +1,75 @@
+From 104eb318283dde5203aa6cf7384287bef181e308 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Wed, 12 Nov 2014 01:58:02 -0500
+Subject: [PATCH] python: fix CVE-2014-7185
+
+Reference: http://bugs.python.org/issue21831
+
+CVE-2014-7185: Integer overflow in bufferobject.c in Python before
+2.7.8 allows context-dependent attackers to obtain sensitive
+information from process memory via a large size and offset in a
+"buffer" function.
+
+Upstream-Status: Backport
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ Lib/test/test_buffer.py |    6 ++++++
+ Misc/NEWS               |    3 +++
+ Objects/bufferobject.c  |    2 +-
+ 3 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_buffer.py b/Lib/test/test_buffer.py
+index 6bdc34d..3ac1f8c 100644
+--- a/Lib/test/test_buffer.py
++++ b/Lib/test/test_buffer.py
+@@ -4,6 +4,7 @@ For now, tests just new or changed functionality.
+ 
+ """
+ 
++import sys
+ import unittest
+ from test import test_support
+ 
+@@ -21,6 +22,11 @@ class BufferTests(unittest.TestCase):
+                     self.assertEqual(b[start:stop:step],
+                                      s[start:stop:step])
+ 
++    def test_large_buffer_size_and_offset(self):
++        data = bytearray('hola mundo')
++        buf = buffer(data, sys.maxsize, sys.maxsize)
++        self.assertEqual(buf[:4096], "")
++
+ 
+ def test_main():
+     with test_support.check_py3k_warnings(("buffer.. not supported",
+diff --git a/Misc/NEWS b/Misc/NEWS
+index e8778ad..77396c5 100644
+--- a/Misc/NEWS
++++ b/Misc/NEWS
+@@ -1896,6 +1896,9 @@ What's New in Python 2.7 Release Candidate 1?
+ Core and Builtins
+ -----------------
+ 
++- Issue #21831: Avoid integer overflow when large sizes and offsets are given to
++  the buffer type. CVE-2014-7185.
++
+ - Issue #8271: during the decoding of an invalid UTF-8 byte sequence, only the
+   start byte and the continuation byte(s) are now considered invalid, instead
+   of the number of bytes specified by the start byte.
+diff --git a/Objects/bufferobject.c b/Objects/bufferobject.c
+index c52f0bc..c542506 100644
+--- a/Objects/bufferobject.c
++++ b/Objects/bufferobject.c
+@@ -88,7 +88,7 @@ get_buf(PyBufferObject *self, void **ptr, Py_ssize_t *size,
+             *size = count;
+         else
+             *size = self->b_size;
+-        if (offset + *size > count)
++        if (*size > count - offset)
+             *size = count - offset;
+     }
+     return 1;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index f2e6fde..50c751e 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -39,6 +39,7 @@ SRC_URI += "\
   file://json-flaw-fix.patch \
   file://posix_close.patch \
   file://remove-BOM-insection-code.patch \
+  file://python-2.7.3-CVE-2014-7185.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.9.5


