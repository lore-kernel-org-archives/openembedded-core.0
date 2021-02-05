Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.2819.1612492128924055853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 18:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222100"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:28:48 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 79F884CE6F78
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Feb 2021 10:28:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:28:48 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] python3: CVE-2021-3177 Security Advisory
Date: Fri, 5 Feb 2021 10:28:41 +0800
Message-ID: <1612492121-33316-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 79F884CE6F78.A503C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-3177

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python3/CVE-2021-3177.patch        | 179 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.1.bb |   1 +
 2 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
new file mode 100644
index 0000000000..2ff59a8d2d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
@@ -0,0 +1,179 @@
+From 9ff800eb4b605cf0bf663c6bbe4304b93e384e03 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Wed, 3 Feb 2021 15:33:47 +0900
+Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
+ formatting in ctypes param reprs.
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ Lib/ctypes/test/test_parameters.py | 44 ++++++++++++++++++++++++++
+ Modules/_ctypes/callproc.c         | 51 +++++++++++-------------------
+ 2 files changed, 63 insertions(+), 32 deletions(-)
+
+diff --git a/Lib/ctypes/test/test_parameters.py b/Lib/ctypes/test/test_parameters.py
+index e4c25fd..01a91c9 100644
+--- a/Lib/ctypes/test/test_parameters.py
++++ b/Lib/ctypes/test/test_parameters.py
+@@ -201,6 +201,50 @@ class SimpleTypesTestCase(unittest.TestCase):
+         with self.assertRaises(ZeroDivisionError):
+             WorseStruct().__setstate__({}, b'foo')
+ 
++    def test_parameter_repr(self):
++        from ctypes import (
++            c_bool,
++            c_char,
++            c_wchar,
++            c_byte,
++            c_ubyte,
++            c_short,
++            c_ushort,
++            c_int,
++            c_uint,
++            c_long,
++            c_ulong,
++            c_longlong,
++            c_ulonglong,
++            c_float,
++            c_double,
++            c_longdouble,
++            c_char_p,
++            c_wchar_p,
++            c_void_p,
++        )
++        self.assertRegex(repr(c_bool.from_param(True)), r"^<cparam '\?' at 0x[A-Fa-f0-9]+>$")
++        self.assertEqual(repr(c_char.from_param(97)), "<cparam 'c' ('a')>")
++        self.assertRegex(repr(c_wchar.from_param('a')), r"^<cparam 'u' at 0x[A-Fa-f0-9]+>$")
++        self.assertEqual(repr(c_byte.from_param(98)), "<cparam 'b' (98)>")
++        self.assertEqual(repr(c_ubyte.from_param(98)), "<cparam 'B' (98)>")
++        self.assertEqual(repr(c_short.from_param(511)), "<cparam 'h' (511)>")
++        self.assertEqual(repr(c_ushort.from_param(511)), "<cparam 'H' (511)>")
++        self.assertRegex(repr(c_int.from_param(20000)), r"^<cparam '[li]' \(20000\)>$")
++        self.assertRegex(repr(c_uint.from_param(20000)), r"^<cparam '[LI]' \(20000\)>$")
++        self.assertRegex(repr(c_long.from_param(20000)), r"^<cparam '[li]' \(20000\)>$")
++        self.assertRegex(repr(c_ulong.from_param(20000)), r"^<cparam '[LI]' \(20000\)>$")
++        self.assertRegex(repr(c_longlong.from_param(20000)), r"^<cparam '[liq]' \(20000\)>$")
++        self.assertRegex(repr(c_ulonglong.from_param(20000)), r"^<cparam '[LIQ]' \(20000\)>$")
++        self.assertEqual(repr(c_float.from_param(1.5)), "<cparam 'f' (1.5)>")
++        self.assertEqual(repr(c_double.from_param(1.5)), "<cparam 'd' (1.5)>")
++        self.assertEqual(repr(c_double.from_param(1e300)), "<cparam 'd' (1e+300)>")
++        self.assertRegex(repr(c_longdouble.from_param(1.5)), r"^<cparam ('d' \(1.5\)|'g' at 0x[A-Fa-f0-9]+)>$")
++        self.assertRegex(repr(c_char_p.from_param(b'hihi')), "^<cparam 'z' \(0x[A-Fa-f0-9]+\)>$")
++        self.assertRegex(repr(c_wchar_p.from_param('hihi')), "^<cparam 'Z' \(0x[A-Fa-f0-9]+\)>$")
++        self.assertRegex(repr(c_void_p.from_param(0x12)), r"^<cparam 'P' \(0x0*12\)>$")
++
++
+ ################################################################
+ 
+ if __name__ == '__main__':
+diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
+index b0a36a3..11c4588 100644
+--- a/Modules/_ctypes/callproc.c
++++ b/Modules/_ctypes/callproc.c
+@@ -489,58 +489,47 @@ is_literal_char(unsigned char c)
+ static PyObject *
+ PyCArg_repr(PyCArgObject *self)
+ {
+-    char buffer[256];
+     switch(self->tag) {
+     case 'b':
+     case 'B':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++	return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.b);
+-        break;
+     case 'h':
+     case 'H':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++	return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.h);
+-        break;
+     case 'i':
+     case 'I':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++	return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.i);
+-        break;
+     case 'l':
+     case 'L':
+-        sprintf(buffer, "<cparam '%c' (%ld)>",
++	return PyUnicode_FromFormat("<cparam '%c' (%ld)>",
+             self->tag, self->value.l);
+-        break;
+ 
+     case 'q':
+     case 'Q':
+-        sprintf(buffer,
+-#ifdef MS_WIN32
+-            "<cparam '%c' (%I64d)>",
+-#else
+-            "<cparam '%c' (%lld)>",
+-#endif
++	return PyUnicode_FromFormat("<cparam '%c' (%lld)>",
+             self->tag, self->value.q);
+-        break;
+     case 'd':
+-        sprintf(buffer, "<cparam '%c' (%f)>",
+-            self->tag, self->value.d);
+-        break;
+-    case 'f':
+-        sprintf(buffer, "<cparam '%c' (%f)>",
+-            self->tag, self->value.f);
+-        break;
+-
++    case 'f': {
++        PyObject *f = PyFloat_FromDouble((self->tag == 'f') ? self->value.f : self->value.d);
++        if (f == NULL) {
++            return NULL;
++        }
++        PyObject *result = PyUnicode_FromFormat("<cparam '%c' (%R)>", self->tag, f);
++        Py_DECREF(f);
++        return result;
++    }
+     case 'c':
+         if (is_literal_char((unsigned char)self->value.c)) {
+-            sprintf(buffer, "<cparam '%c' ('%c')>",
++	    return PyUnicode_FromFormat("<cparam '%c' ('%c')>",
+                 self->tag, self->value.c);
+         }
+         else {
+-            sprintf(buffer, "<cparam '%c' ('\\x%02x')>",
++	    return PyUnicode_FromFormat("<cparam '%c' ('\\x%02x')>",
+                 self->tag, (unsigned char)self->value.c);
+         }
+-        break;
+ 
+ /* Hm, are these 'z' and 'Z' codes useful at all?
+    Shouldn't they be replaced by the functionality of c_string
+@@ -549,22 +538,20 @@ PyCArg_repr(PyCArgObject *self)
+     case 'z':
+     case 'Z':
+     case 'P':
+-        sprintf(buffer, "<cparam '%c' (%p)>",
++	return PyUnicode_FromFormat("<cparam '%c' (%p)>",
+             self->tag, self->value.p);
+         break;
+ 
+     default:
+         if (is_literal_char((unsigned char)self->tag)) {
+-            sprintf(buffer, "<cparam '%c' at %p>",
++	    return PyUnicode_FromFormat("<cparam '%c' at %p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+         else {
+-            sprintf(buffer, "<cparam 0x%02x at %p>",
++	    return PyUnicode_FromFormat("<cparam 0x%02x at %p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+-        break;
+     }
+-    return PyUnicode_FromString(buffer);
+ }
+ 
+ static PyMemberDef PyCArgType_members[] = {
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.9.1.bb b/meta/recipes-devtools/python/python3_3.9.1.bb
index bdeddc4e68..ad032e97ae 100644
--- a/meta/recipes-devtools/python/python3_3.9.1.bb
+++ b/meta/recipes-devtools/python/python3_3.9.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
+           file://CVE-2021-3177.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.25.1



