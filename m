Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7579C72325
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:39 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id w10so3084603pde.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RGjxWzdLzFo1atKW9j4oE9nvKf7AhCku4s25TFKSNjE=;
	b=B29lX3qFUyJvESFan3BzOzN7Ib5zBivBFw3PwCmQ/y+8N3r8JUGkUq2jIOYj2Bho+V
	2wY2oc/A37P8h7sRoexSMAizUF+1isotmta/tQ7pzgduUYkowC/VSNFgSFQz5jL2WyF1
	Ltw7/HmLr7CljgXkNesSwAlhonJGF6q9CydocNxobFixE2lHAA0/yI2dThcnmLmfSQUW
	vdu/kgHaHuyfBLuzWN5cs/ne11Sy09BySZhQVYrQcmHlkyZ3ZFRJr8Shnb6Gb5xh+eBv
	5gE/orHcUWRplWBgRCDvvIbBXZfkfcleXAiKm//vGl81IgeRZei/PjPb6+yUTuA9gOjg
	PIFA==
X-Received: by 10.70.123.169 with SMTP id mb9mr55160556pdb.62.1417018960035;
	Wed, 26 Nov 2014 08:22:40 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:12 -0800
Message-Id: <abdab2e7a74480c18a6320e30fc54b8ea1fa6cc1.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
References: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
Subject: [PATCH 08/11] python: Fix CVE-2014-7185
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:39 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Integer overflow in bufferobject.c in Python before 2.7.8 allows
context-dependent attackers to obtain sensitive information from
process memory via a large size and offset in a "buffer" function.

This back-ported patch fixes CVE-2014-7185

(From OE-Core rev: 49ceed974e39ab8ac4be410e5caa5e1ef7a646d9)

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Conflicts:
	meta/recipes-devtools/python/python_2.7.3.bb

hand merged bb file since I did not take previous patch.
---
 .../python/python/python-2.7.3-CVE-2014-7185.patch | 75 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
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
index cc92ebc..2547ea4 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -38,6 +38,7 @@ SRC_URI += "\
   file://python-2.7.3-CVE-2014-1912.patch \
   file://json-flaw-fix.patch \
   file://posix_close.patch \
+  file://python-2.7.3-CVE-2014-7185.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


