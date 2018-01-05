Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD31787E3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 17:37:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w05HbPcc028291
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Jan 2018 09:37:25 -0800 (PST)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 5 Jan 2018 09:37:24 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jan 2018 19:37:23 +0200
Message-ID: <20180105173723.275865-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] python: Fix CVE-2017-1000158
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
X-List-Received-Date: Fri, 05 Jan 2018 17:37:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

CPython (aka Python) up to 2.7.13 is vulnerable to an integer overflow in 
the PyString_DecodeEscape function in stringobject.c, resulting in 
heap-based buffer overflow (and possible arbitrary code execution).

Upstream patches:
https://github.com/python/cpython/commit/c3c9db89273fabc62ea1b48389d9a3000c1c03ae
https://github.com/python/cpython/commit/fd8614c5c5466a14a945db5b059c10c0fb8f76d9

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-1000158

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../python/python-native_2.7.13.bb                 |  1 +
 .../python/python/CVE-2017-1000158.patch           | 49 +++++++++++++++
 .../python/python3-native_3.5.3.bb                 |  1 +
 .../python/python3/CVE-2017-1000158.patch          | 70 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |  1 +
 meta/recipes-devtools/python/python_2.7.13.bb      |  1 +
 6 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/CVE-2017-1000158.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2017-1000158.patch

diff --git a/meta/recipes-devtools/python/python-native_2.7.13.bb b/meta/recipes-devtools/python/python-native_2.7.13.bb
index 7edf153..8864364 100644
--- a/meta/recipes-devtools/python/python-native_2.7.13.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.13.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
             file://builddir.patch \
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
+            file://CVE-2017-1000158.patch \
            "
 
 S = "${WORKDIR}/Python-${PV}"
diff --git a/meta/recipes-devtools/python/python/CVE-2017-1000158.patch b/meta/recipes-devtools/python/python/CVE-2017-1000158.patch
new file mode 100644
index 0000000..1a15f80
--- /dev/null
+++ b/meta/recipes-devtools/python/python/CVE-2017-1000158.patch
@@ -0,0 +1,49 @@
+From 6ddb35c6203626dc6ca9549d6e70264e93d86166 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Fri, 5 Jan 2018 13:50:01 +0000
+Subject: [PATCH] bpo-30657: Check & prevent integer overflow in
+ PyString_DecodeEscape (#2174)
+
+Upstream-Status: Backport
+CVE: CVE-2017-1000158
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Misc/ACKS              | 1 +
+ Objects/stringobject.c | 8 +++++++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Misc/ACKS b/Misc/ACKS
+index 9c374b7..eefb4c0 100644
+--- a/Misc/ACKS
++++ b/Misc/ACKS
+@@ -151,6 +151,7 @@ Gregory Bond
+ Matias Bordese
+ Jonas Borgström
+ Jurjen Bos
++Jay Bosamiya
+ Peter Bosch
+ Dan Boswell
+ Eric Bouck
+diff --git a/Objects/stringobject.c b/Objects/stringobject.c
+index f2db6da..5614ad9 100644
+--- a/Objects/stringobject.c
++++ b/Objects/stringobject.c
+@@ -612,7 +612,13 @@ PyObject *PyString_DecodeEscape(const char *s,
+     char *p, *buf;
+     const char *end;
+     PyObject *v;
+-    Py_ssize_t newlen = recode_encoding ? 4*len:len;
++    Py_ssize_t newlen;
++    /* Check for integer overflow */
++    if (recode_encoding && (len > PY_SSIZE_T_MAX / 4)) {
++        PyErr_SetString(PyExc_OverflowError, "string is too large");
++        return NULL;
++    }
++    newlen = recode_encoding ? 4*len:len;
+     v = PyString_FromStringAndSize((char *)NULL, newlen);
+     if (v == NULL)
+         return NULL;
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/recipes-devtools/python/python3-native_3.5.3.bb
index 8cd9c88..d07b5c0 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
@@ -25,6 +25,7 @@ file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
+file://CVE-2017-1000158.patch \
 "
 
 SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
diff --git a/meta/recipes-devtools/python/python3/CVE-2017-1000158.patch b/meta/recipes-devtools/python/python3/CVE-2017-1000158.patch
new file mode 100644
index 0000000..52d3870
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2017-1000158.patch
@@ -0,0 +1,70 @@
+From 6ddb35c6203626dc6ca9549d6e70264e93d86166 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Fri, 5 Jan 2018 13:50:01 +0000
+Subject: [PATCH] bpo-30657: Check & prevent integer overflow in
+ PyString_DecodeEscape (#2174)
+
+Fixes possible integer overflow in PyBytes_DecodeEscape.
+
+Upstream-Status: Backport
+CVE: CVE-2017-1000158
+
+Co-Authored-By: Jay Bosamiya <jaybosamiya@gmail.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Misc/ACKS                                                         | 2 ++
+ .../NEWS.d/next/Security/2017-12-01-18-51-03.bpo-30657.Fd8kId.rst | 2 ++
+ Objects/bytesobject.c                                             | 8 +++++++-
+ 3 files changed, 11 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2017-12-01-18-51-03.bpo-30657.Fd8kId.rst
+
+diff --git a/Misc/ACKS b/Misc/ACKS
+index fbf110d..1a35aad 100644
+--- a/Misc/ACKS
++++ b/Misc/ACKS
+@@ -167,6 +167,7 @@ Médéric Boquien
+ Matias Bordese
+ Jonas Borgström
+ Jurjen Bos
++Jay Bosamiya
+ Peter Bosch
+ Dan Boswell
+ Eric Bouck
+@@ -651,6 +652,7 @@ Ken Howard
+ Brad Howes
+ Mike Hoy
+ Ben Hoyt
++Miro Hrončok
+ Chiu-Hsiang Hsu
+ Chih-Hao Huang
+ Christian Hudon
+diff --git a/Misc/NEWS.d/next/Security/2017-12-01-18-51-03.bpo-30657.Fd8kId.rst b/Misc/NEWS.d/next/Security/2017-12-01-18-51-03.bpo-30657.Fd8kId.rst
+new file mode 100644
+index 0000000..75359b6
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2017-12-01-18-51-03.bpo-30657.Fd8kId.rst
+@@ -0,0 +1,2 @@
++Fixed possible integer overflow in PyBytes_DecodeEscape, CVE-2017-1000158.
++Original patch by Jay Bosamiya; rebased to Python 3 by Miro Hrončok.
+diff --git a/Objects/bytesobject.c b/Objects/bytesobject.c
+index 77dd45e..9b29dc3 100644
+--- a/Objects/bytesobject.c
++++ b/Objects/bytesobject.c
+@@ -970,7 +970,13 @@ PyObject *PyBytes_DecodeEscape(const char *s,
+     char *p, *buf;
+     const char *end;
+     PyObject *v;
+-    Py_ssize_t newlen = recode_encoding ? 4*len:len;
++    Py_ssize_t newlen;
++    /* Check for integer overflow */
++    if (recode_encoding && (len > PY_SSIZE_T_MAX / 4)) {
++        PyErr_SetString(PyExc_OverflowError, "string is too large");
++        return NULL;
++    }
++    newlen = recode_encoding ? 4*len:len;
+     v = PyBytes_FromStringAndSize((char *)NULL, newlen);
+     if (v == NULL)
+         return NULL;
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 7f54ea4..6c56d05 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -38,6 +38,7 @@ SRC_URI += "\
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
             file://Fix-29519-weakref-spewing-exceptions-during-interp-f.patch \
             file://pass-missing-libraries-to-Extension-for-mul.patch \
+            file://CVE-2017-1000158.patch \
            "
 SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
 SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 754c029..2283bf6 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -29,6 +29,7 @@ SRC_URI += "\
   file://Don-t-use-getentropy-on-Linux.patch \
   file://pass-missing-libraries-to-Extension-for-mul.patch \
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
+  file://CVE-2017-1000158.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.10.2


