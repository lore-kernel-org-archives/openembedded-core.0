Return-Path: <Daniel.Bornaz@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5BACA705D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:51:54 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 24 Jul 2014 15:51:50 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4483)	id 723E0288F33;
	Thu, 24 Jul 2014 15:51:50 +0200 (CEST)
From: Daniel BORNAZ <daniel.bornaz@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 15:51:44 +0200
Message-ID: <1406209904-14203-1-git-send-email-daniel.bornaz@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: daniel.bornaz@enea.com does not
	designate permitted sender hosts)
Cc: Benjamin Peterson <benjamin@python.org>
Subject: [PATCH 1/1] python: fix _json module arbitrary process memory read vulnerability
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
X-List-Received-Date: Thu, 24 Jul 2014 13:51:59 -0000
Content-Type: text/plain

http://bugs.python.org/issue21529

Python 2 and 3 are susceptible to arbitrary process memory reading by
a user or adversary due to a bug in the _json module caused by
insufficient bounds checking.

The sole prerequisites of this attack are that the attacker is able to
control or influence the two parameters of the default scanstring
function: the string to be decoded and the index.

The bug is caused by allowing the user to supply a negative index
value. The index value is then used directly as an index to an array
in the C code; internally the address of the array and its index are
added to each other in order to yield the address of the value that is
desired. However, by supplying a negative index value and adding this
to the address of the array, the processor's register value wraps
around and the calculated value will point to a position in memory
which isn't within the bounds of the supplied string, causing the
function to access other parts of the process memory.

Signed-off-by: Benjamin Peterson <benjamin@python.org>

Applied to python-native recipe in order to fix the above mentioned
vulnerability.

Upstream-Status: Submitted

Signed-off-by: Daniel BORNAZ <daniel.bornaz@enea.com>
---
 .../recipes-devtools/python/python-native_2.7.3.bb |  1 +
 .../python/python/json-flaw-fix.patch              | 27 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/json-flaw-fix.patch

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 0571d3a..827654d 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -19,6 +19,7 @@ SRC_URI += "\
            file://parallel-makeinst-create-bindir.patch \
            file://python-fix-build-error-with-Readline-6.3.patch \
            file://gcc-4.8-fix-configure-Wformat.patch \
+           file://json-flaw-fix.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
diff --git a/meta/recipes-devtools/python/python/json-flaw-fix.patch b/meta/recipes-devtools/python/python/json-flaw-fix.patch
new file mode 100644
index 0000000..e9a6cca
--- /dev/null
+++ b/meta/recipes-devtools/python/python/json-flaw-fix.patch
@@ -0,0 +1,27 @@
+
+python: fix _json module arbitrary process memory read vulnerability
+
+Upstream-Status: submitted
+
+Signed-off-by: Daniel BORNAZ <daniel.bornaz@enea.com>
+
+--- a/Modules/_json.c	2014-07-15 15:37:17.151046356 +0200
++++ b/Modules/_json.c	2014-07-15 15:38:37.335605042 +0200
+@@ -1491,7 +1491,7 @@ scan_once_str(PyScannerObject *s, PyObje
+     PyObject *res;
+     char *str = PyString_AS_STRING(pystr);
+     Py_ssize_t length = PyString_GET_SIZE(pystr);
+-    if (idx >= length) {
++    if ( idx < 0 || idx >= length) {
+         PyErr_SetNone(PyExc_StopIteration);
+         return NULL;
+     }
+@@ -1578,7 +1578,7 @@ scan_once_unicode(PyScannerObject *s, Py
+     PyObject *res;
+     Py_UNICODE *str = PyUnicode_AS_UNICODE(pystr);
+     Py_ssize_t length = PyUnicode_GET_SIZE(pystr);
+-    if (idx >= length) {
++    if ( idx < 0 || idx >= length) {
+         PyErr_SetNone(PyExc_StopIteration);
+         return NULL;
+     }
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 0d64172..5be9073 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -36,6 +36,7 @@ SRC_URI += "\
   file://python-2.7.3-CVE-2013-1752-smtplib-fix.patch \
   file://python-fix-build-error-with-Readline-6.3.patch \
   file://python-2.7.3-CVE-2014-1912.patch \
+  file://json-flaw-fix.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


