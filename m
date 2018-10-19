Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1D579CB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 02:37:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9J2bRhL019969
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 19:37:37 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 18 Oct 2018 19:37:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2018 10:43:15 +0800
Message-ID: <ac58ce31a9a0c4ea1b8a9696feffcc51f9d46955.1539853014.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1539853014.git.Qi.Chen@windriver.com>
References: <cover.1539853014.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python: backport patch to fix CVE-2018-14647
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
X-List-Received-Date: Fri, 19 Oct 2018 02:37:47 -0000
Content-Type: text/plain

Backport patch to fix the following CVE.

CVE: CVE-2018-14647

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...23-Use-XML_SetHashSalt-in-_elementtree-GH.patch | 98 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.15.bb      |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch

diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
new file mode 100644
index 0000000..42c64ca
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
@@ -0,0 +1,98 @@
+From 3ffc80959f01f9fde548f1632694b9f950c2dd7c Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Tue, 18 Sep 2018 15:13:09 +0200
+Subject: [PATCH] [2.7] bpo-34623: Use XML_SetHashSalt in _elementtree
+ (GH-9146) (GH-9394)
+
+The C accelerated _elementtree module now initializes hash randomization
+salt from _Py_HashSecret instead of libexpat's default CPRNG.
+
+Signed-off-by: Christian Heimes <christian@python.org>
+
+https://bugs.python.org/issue34623.
+(cherry picked from commit cb5778f00ce48631c7140f33ba242496aaf7102b)
+
+Co-authored-by: Christian Heimes <christian@python.org>
+
+
+
+https://bugs.python.org/issue34623
+
+Upstream-Status: Backport
+
+Fix CVE-2018-14647
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Include/pyexpat.h                                                  | 4 +++-
+ Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst | 2 ++
+ Modules/_elementtree.c                                             | 5 +++++
+ Modules/pyexpat.c                                                  | 5 +++++
+ 4 files changed, 15 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
+
+diff --git a/Include/pyexpat.h b/Include/pyexpat.h
+index 5340ef5..3fc5fa5 100644
+--- a/Include/pyexpat.h
++++ b/Include/pyexpat.h
+@@ -3,7 +3,7 @@
+ 
+ /* note: you must import expat.h before importing this module! */
+ 
+-#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.0"
++#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.1"
+ #define PyExpat_CAPSULE_NAME "pyexpat.expat_CAPI"
+ 
+ struct PyExpat_CAPI 
+@@ -43,6 +43,8 @@ struct PyExpat_CAPI
+         XML_Parser parser, XML_UnknownEncodingHandler handler,
+         void *encodingHandlerData);
+     void (*SetUserData)(XML_Parser parser, void *userData);
++    /* might be none for expat < 2.1.0 */
++    int (*SetHashSalt)(XML_Parser parser, unsigned long hash_salt);
+     /* always add new stuff to the end! */
+ };
+ 
+diff --git a/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
+new file mode 100644
+index 0000000..31ad92e
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
+@@ -0,0 +1,2 @@
++The C accelerated _elementtree module now initializes hash randomization
++salt from _Py_HashSecret instead of libexpat's default CSPRNG.
+diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
+index 1d316a1..a19cbf7 100644
+--- a/Modules/_elementtree.c
++++ b/Modules/_elementtree.c
+@@ -2574,6 +2574,11 @@ xmlparser(PyObject* self_, PyObject* args, PyObject* kw)
+         PyErr_NoMemory();
+         return NULL;
+     }
++    /* expat < 2.1.0 has no XML_SetHashSalt() */
++    if (EXPAT(SetHashSalt) != NULL) {
++        EXPAT(SetHashSalt)(self->parser,
++                           (unsigned long)_Py_HashSecret.prefix);
++    }
+ 
+     ALLOC(sizeof(XMLParserObject), "create expatparser");
+ 
+diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
+index 2b4d312..1f8c0d7 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -2042,6 +2042,11 @@ MODULE_INITFUNC(void)
+     capi.SetProcessingInstructionHandler = XML_SetProcessingInstructionHandler;
+     capi.SetUnknownEncodingHandler = XML_SetUnknownEncodingHandler;
+     capi.SetUserData = XML_SetUserData;
++#if XML_COMBINED_VERSION >= 20100
++    capi.SetHashSalt = XML_SetHashSalt;
++#else
++    capi.SetHashSalt = NULL;
++#endif
+ 
+     /* export using capsule */
+     capi_object = PyCapsule_New(&capi, PyExpat_CAPSULE_NAME, NULL);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index e8c9475..dd969d8 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -32,6 +32,7 @@ SRC_URI += "\
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
   file://float-endian.patch \
   file://0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch \
+  file://0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


