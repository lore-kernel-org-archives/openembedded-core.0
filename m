Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5113A782C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 07:37:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v817bLiJ015788
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Sep 2017 00:37:21 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Sep 2017 00:37:19 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Sep 2017 03:37:19 -0400
Message-ID: <1504251439-53974-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] python-numpy, python3-numpy: Fix CVE-2017-12852
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
X-List-Received-Date: Fri, 01 Sep 2017 07:37:20 -0000
Content-Type: text/plain

Backport upstream patch to fix CVE-2017-12852

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...inite-loop-when-creating-np.pad-on-an-emp.patch | 45 ++++++++++++++++++++++
 .../python-numpy/python-numpy_1.13.1.bb            |  1 +
 .../python-numpy/python3-numpy_1.13.1.bb           |  1 +
 3 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/python-numpy/files/0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch

diff --git a/meta/recipes-devtools/python-numpy/files/0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch b/meta/recipes-devtools/python-numpy/files/0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch
new file mode 100644
index 0000000..b9e5856
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch
@@ -0,0 +1,45 @@
+From 4170b98e0d5864ef4db1c5704a6e9428c3be9fb8 Mon Sep 17 00:00:00 2001
+From: Iryna Shcherbina <ishcherb@redhat.com>
+Date: Thu, 24 Aug 2017 18:01:43 +0200
+Subject: [PATCH] BUG: fix infinite loop when creating np.pad on an empty array
+
+Upstream-Status: Backport [https://github.com/numpy/numpy/pull/9599/commits/6f9ea0abbd305d53f9017debab3a3a591fe0e249]
+CVE: CVE-2017-12852
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ numpy/lib/arraypad.py            | 3 +++
+ numpy/lib/tests/test_arraypad.py | 4 ++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/numpy/lib/arraypad.py b/numpy/lib/arraypad.py
+index 2dad99c..294a689 100644
+--- a/numpy/lib/arraypad.py
++++ b/numpy/lib/arraypad.py
+@@ -1406,6 +1406,9 @@ def pad(array, pad_width, mode, **kwargs):
+             newmat = _append_min(newmat, pad_after, chunk_after, axis)
+ 
+     elif mode == 'reflect':
++        if narray.size == 0:
++            raise ValueError("There aren't any elements to reflect in `array`")
++
+         for axis, (pad_before, pad_after) in enumerate(pad_width):
+             # Recursive padding along any axis where `pad_amt` is too large
+             # for indexing tricks. We can only safely pad the original axis
+diff --git a/numpy/lib/tests/test_arraypad.py b/numpy/lib/tests/test_arraypad.py
+index 056aa45..0f71d32 100644
+--- a/numpy/lib/tests/test_arraypad.py
++++ b/numpy/lib/tests/test_arraypad.py
+@@ -1014,6 +1014,10 @@ class ValueError1(TestCase):
+         assert_raises(ValueError, pad, arr, ((-2, 3), (3, 2)),
+                       **kwargs)
+ 
++    def test_check_empty_array(self):
++        assert_raises(ValueError, pad, [], 4, mode='reflect')
++        assert_raises(ValueError, pad, np.ndarray(0), 4, mode='reflect')
++
+ 
+ class ValueError2(TestCase):
+     def test_check_negative_pad_amount(self):
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
index 63821d3..13e8f4f 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://remove-build-path-in-comments.patch \
            file://fix_shebang_f2py.patch \
+           file://0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch \
            ${CONFIGFILESURI} "
 
 SRC_URI[md5sum] = "6d459e4a24f5035f720dda3c57716a92"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb
index 0bf9e91..29874b8 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://remove-build-path-in-comments.patch \
            file://fix_shebang_f2py.patch \
+           file://0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch \
            ${CONFIGFILESURI} "
 SRC_URI[md5sum] = "6d459e4a24f5035f720dda3c57716a92"
 SRC_URI[sha256sum] = "de020ec06f1e9ce1115a50161a38bf8d4c2525379900f9cb478cc613a1e7cd93"
-- 
2.8.1


