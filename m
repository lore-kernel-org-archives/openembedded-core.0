Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.29654.1612155700189377465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 21:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: iKSYtTebQQ1CQ5rVtbOvvZMM8Kr84irqOhba46scRQYRreQeyvX/rkMv98bZDdWMAfvsvmsQsI
 Fm8KPzUgqYng==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="265466008"
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="265466008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2021 21:01:39 -0800
IronPort-SDR: afBpvB2nJWYNH03k44RRaSpp52mywo8fHWW0w8i94MgH6DlscTid+bL+C5b4ZqQxqeCSCdfdDB
 wj6Ji7mRaGhg==
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="432159991"
Received: from hhan1-mobl.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.124])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2021 21:01:37 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: fix CVE-2021-3177
Date: Mon,  1 Feb 2021 13:01:33 +0800
Message-Id: <20210201050133.98227-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/python3/CVE-2021-3177.patch        | 191 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.1.bb |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
new file mode 100644
index 0000000000..a48207162f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
@@ -0,0 +1,191 @@
+From c347cbe694743cee120457aa6626712f7799a932 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 18 Jan 2021 13:29:31 -0800
+Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
+ formatting in ctypes param reprs. (GH-24247)
+
+(cherry picked from commit 916610ef90a0d0761f08747f7b0905541f0977c7)
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+
+CVE: CVE-2021-3177
+Upstream-Status: Backport [https://github.com/python/cpython/commit/c347cbe694743cee120457aa6626712f7799a932]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/ctypes/test/test_parameters.py            | 43 ++++++++++++++++
+ .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst  |  2 +
+ Modules/_ctypes/callproc.c                    | 51 +++++++------------
+ 3 files changed, 64 insertions(+), 32 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+
+diff --git a/Lib/ctypes/test/test_parameters.py b/Lib/ctypes/test/test_parameters.py
+index e4c25fd880cef..531894fdec838 100644
+--- a/Lib/ctypes/test/test_parameters.py
++++ b/Lib/ctypes/test/test_parameters.py
+@@ -201,6 +201,49 @@ def __dict__(self):
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
+ ################################################################
+ 
+ if __name__ == '__main__':
+diff --git a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+new file mode 100644
+index 0000000000000..7df65a156feab
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+@@ -0,0 +1,2 @@
++Avoid static buffers when computing the repr of :class:`ctypes.c_double` and
++:class:`ctypes.c_longdouble` values.
+diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
+index b0a36a30248f7..f2506de54498e 100644
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
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.b);
+-        break;
+     case 'h':
+     case 'H':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.h);
+-        break;
+     case 'i':
+     case 'I':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.i);
+-        break;
+     case 'l':
+     case 'L':
+-        sprintf(buffer, "<cparam '%c' (%ld)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%ld)>",
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
++        return PyUnicode_FromFormat("<cparam '%c' (%lld)>",
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
++            return PyUnicode_FromFormat("<cparam '%c' ('%c')>",
+                 self->tag, self->value.c);
+         }
+         else {
+-            sprintf(buffer, "<cparam '%c' ('\\x%02x')>",
++            return PyUnicode_FromFormat("<cparam '%c' ('\\x%02x')>",
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
++        return PyUnicode_FromFormat("<cparam '%c' (%p)>",
+             self->tag, self->value.p);
+         break;
+ 
+     default:
+         if (is_literal_char((unsigned char)self->tag)) {
+-            sprintf(buffer, "<cparam '%c' at %p>",
++            return PyUnicode_FromFormat("<cparam '%c' at %p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+         else {
+-            sprintf(buffer, "<cparam 0x%02x at %p>",
++            return PyUnicode_FromFormat("<cparam 0x%02x at %p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+-        break;
+     }
+-    return PyUnicode_FromString(buffer);
+ }
+ 
+ static PyMemberDef PyCArgType_members[] = {
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
2.29.2

