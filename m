Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.9588.1614347917219206495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gt159YNd;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id 17so5333528pli.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jX63qMsXijbVFQgY6cSp+bZWUeVSOozXNdvCRqPh64U=;
        b=gt159YNdx9LTwJbfJV9ECTDJ9nc3ylC4ZdTgr5nKRuFuVnjKDeazss3rm4vPriOIcP
         SVQm53cBQpQIRpjukR5H1i5P3gWlWBW7+Ru79OrVYtbUEnmEtVud+tkJkO3YdCCRg3WT
         zn2ACCgvjq2ESzI0fPX6860HBPYnePTe2xlCJsnXVYLP6yiOw3zvqcCY+nRTMWa3uoml
         3sgWyWPPcXcVV3REHE4QcHbMjRbuqu3EJ2x1t5/lXMyRvMTIAspdtlt2MZjbFFALddfM
         T8LTYvNTRXU2HwGAWrc5jMlqlaYy8cTbLyU7/R0J7YuZKUaQIU0fBl8huDhDSScxdZAP
         jScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jX63qMsXijbVFQgY6cSp+bZWUeVSOozXNdvCRqPh64U=;
        b=HBPUvL7WfZh1EavpiS6YAvweqtH5Sx+YvQIyMAHoLEK+JtCbCE3xcSIsD6gV6jG4Up
         h2vAiRkgiS1GT9KnT+P0AXVobDpZUbd5cgNhoFPe7N6CjBvEQhfeaqtwXVUp78I4+iS4
         WLDpgZBIfv0aVjlJxuCJvYjIrEFOz4xrwiGXA90A3C6aKlSTf/5XNzMrfLCTNjOGSbcZ
         EDoUVrrxRp8cIDRhaTIaBrIsYF2yMuuQb5TRS+ln2s/j6o6c8JO0SM2MuE/+16csRBiK
         zJtvIQez3aDitCSLPOKxk8AoiA7Pley5cv+DjMiPAG9yw8AXOeIpksNd8bcooEAl59sg
         uFRw==
X-Gm-Message-State: AOAM532T1SguBbX7v7hCHud+nVq8D9H3NdWt91QRo66F77vqjszhaXTu
	ClzcqJi3fhcjK16RHonM9nPAYd6DTXOrqg==
X-Google-Smtp-Source: ABdhPJzWrbIz6tq3rbmBTej9Lp3fW8aQTZiaLfW2/aq/w8tENHWriy3EIH2Si7BawUD3KTkT/83fIg==
X-Received: by 2002:a17:90a:c086:: with SMTP id o6mr2729735pjs.128.1614347916020;
        Fri, 26 Feb 2021 05:58:36 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id t16sm9375687pfe.165.2021.02.26.05.58.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2021 05:58:35 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH] python3: fix CVE-2021-3177
Date: Fri, 26 Feb 2021 22:58:26 +0900
Message-Id: <20210226135826.5811-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace snprintf with Python unicode formatting in ctypes param reprs

Upstream-Status: Backport [https://github.com/python/cpython/commit/916610ef90a0d0761f08747f7b0905541f0977c7]
CVE: CVE-2021-3177
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../python/python3/CVE-2021-3177.patch        | 183 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
new file mode 100644
index 0000000000..b2d22a074d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
@@ -0,0 +1,183 @@
+From 916610ef90a0d0761f08747f7b0905541f0977c7 Mon Sep 17 00:00:00 2001
+From: Benjamin Peterson <benjamin@python.org>
+Date: Mon, 18 Jan 2021 14:47:05 -0600
+Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
+ formatting in ctypes param reprs. (24239)
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/916610ef90a0d0761f08747f7b0905541f0977c7]
+CVE: CVE-2021-3177
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
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
+index 40a05a44edd4c..56ccc2f1e0b5d 100644
+--- a/Modules/_ctypes/callproc.c
++++ b/Modules/_ctypes/callproc.c
+@@ -487,58 +487,47 @@ is_literal_char(unsigned char c)
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
+@@ -547,22 +536,20 @@ PyCArg_repr(PyCArgObject *self)
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
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index a448b3ed97..646e271014 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2020-14422.patch \
            file://CVE-2020-26116.patch \
            file://CVE-2020-27619.patch \
+           file://CVE-2021-3177.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.24.3 (Apple Git-128)

