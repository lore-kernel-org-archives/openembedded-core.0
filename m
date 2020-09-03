Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.10160.1599125326490207732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 02:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: heng.guo@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0839SjJx014446
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Sep 2020 02:28:45 -0700 (PDT)
Received: from pek-lpd-ccm2.wrs.com (128.224.179.210) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Sep 2020 02:28:44 -0700
From: "Heng Guo" <heng.guo@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python2: fix segmentation fault in ptest test_bigrepeat
Date: Thu, 3 Sep 2020 17:24:48 +0800
Message-ID: <20200903092448.26165-1-heng.guo@windriver.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Segmentation fault at case test_bigrepeat of python ptest. a similar bug
can be found at https://bugs.python.org/issue33153.

tuplerepeat() in Objects/tupleobject.c uses a questionable check that
relies on signed integer overflow. A singed integer overflow is
triggered by ptest case: test_bigrepeat.

Python2 is out of maintainus, so backport the related patch from python3
commit:
https://github.com/python/cpython/commit/c04ddff290fc203d05b75c8569b748525fb76b5b

Signed-off-by: Heng Guo <heng.guo@windriver.com>
---
 ...segmentation-fault-in-test_bigrepeat.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.18.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-python2-fix-segmentation-fault-in-test_bigrepeat.patch

diff --git a/meta/recipes-devtools/python/python/0001-python2-fix-segmentation-fault-in-test_bigrepeat.patch b/meta/recipes-devtools/python/python/0001-python2-fix-segmentation-fault-in-test_bigrepeat.patch
new file mode 100644
index 0000000000..45087bfb8d
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-python2-fix-segmentation-fault-in-test_bigrepeat.patch
@@ -0,0 +1,33 @@
+From 031d06e1e670d40b6500cce4134ab35ec8858a8b Mon Sep 17 00:00:00 2001
+From: Heng Guo <heng.guo@windriver.com>
+Date: Wed, 15 Jul 2020 15:42:13 +0800
+Subject: [PATCH] python2: fix segmentation fault in test_bigrepeat
+
+Port from:
+https://github.com/python/cpython/commit/c04ddff290fc203d05b75c8569b748525fb76b5b
+Only merge codes related to tuplerepeat() in tupleobject.c.
+
+Signed-off-by: Heng Guo <heng.guo@windriver.com>
+---
+ Objects/tupleobject.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Objects/tupleobject.c b/Objects/tupleobject.c
+index 6f4b18c..0b3cf64 100644
+--- a/Objects/tupleobject.c
++++ b/Objects/tupleobject.c
+@@ -487,9 +487,9 @@ tuplerepeat(PyTupleObject *a, Py_ssize_t n)
+         if (Py_SIZE(a) == 0)
+             return PyTuple_New(0);
+     }
+-    size = Py_SIZE(a) * n;
+-    if (size/Py_SIZE(a) != n)
++    if (n > PY_SSIZE_T_MAX / Py_SIZE(a))
+         return PyErr_NoMemory();
++    size = Py_SIZE(a) * n;
+     np = (PyTupleObject *) PyTuple_New(size);
+     if (np == NULL)
+         return NULL;
+-- 
+2.26.1
+
diff --git a/meta/recipes-devtools/python/python_2.7.18.bb b/meta/recipes-devtools/python/python_2.7.18.bb
index 5b856a5097..8a04f2a610 100644
--- a/meta/recipes-devtools/python/python_2.7.18.bb
+++ b/meta/recipes-devtools/python/python_2.7.18.bb
@@ -30,6 +30,7 @@ SRC_URI += " \
            file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
            file://float-endian.patch \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
+	   file://0001-python2-fix-segmentation-fault-in-test_bigrepeat.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.26.1

