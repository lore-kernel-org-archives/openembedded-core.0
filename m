Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE83789F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 13:26:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6HDQSOe017619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jul 2018 06:26:29 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 17 Jul 2018 06:26:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 17 Jul 2018 21:36:35 +0800
Message-ID: <1531834595-4814-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LZW2UdP221rM_z5f2Eq5uyc65hbYZUOUDmz8CZn-o4G_w@mail.gmail.com>
References: <CAJTo0LZW2UdP221rM_z5f2Eq5uyc65hbYZUOUDmz8CZn-o4G_w@mail.gmail.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH V2] distutils/setuptools-native, distutils3/setuptools3-native: do not try to fetch code during do_compile
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
X-List-Received-Date: Tue, 17 Jul 2018 13:26:41 -0000
Content-Type: text/plain

If a python recipe is using setuptools and the setup_requires argument, where
setuptools will use easy_install to fetch the module if it isn't
present.

The build failed on a machine where a proxy was required, but succeeded on a
machine which had direct access to the internet

Add var-NO_FETCH_BUILD, and set it in distutils_do_compile which does not
allow to fetch code from internet during do_compile.

Example result:
...
ERROR: Do not try to fetch `pytest-runner1' for building. Please add its native recipe to DEPENDS.
Traceback (most recent call last):
  File "setup.py", line 56, in <module>
...

The improvement is flexible for test_requirements argument (used at
`setup.py test'), where use easy_install also.

[YOCTO #12084]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/distutils.bbclass                     |  1 +
 meta/classes/distutils3.bbclass                    |  1 +
 ...ionally-do-not-fetch-code-by-easy_install.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/python/python-setuptools.inc |  2 ++
 4 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 1930c35..c2f7403 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -8,6 +8,7 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}"
 
 distutils_do_compile() {
+         NO_FETCH_BUILD=1 \
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index d4b92a3..f8aca5e 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -15,6 +15,7 @@ distutils3_do_configure() {
 }
 
 distutils3_do_compile() {
+        NO_FETCH_BUILD=1 \
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
new file mode 100644
index 0000000..4b17921
--- /dev/null
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -0,0 +1,34 @@
+From 019422d19c6401fa8f45b1311ecd31bb087c809d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 17 Jul 2018 10:13:38 +0800
+Subject: [PATCH] conditionally do not fetch code by easy_install
+
+If var-NO_FETCH_BUILD is set, do not allow to fetch code from
+internet by easy_install.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setuptools/command/easy_install.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
+index 85ee40f..7eb9d2a 100755
+--- a/setuptools/command/easy_install.py
++++ b/setuptools/command/easy_install.py
+@@ -637,6 +637,11 @@ class easy_install(Command):
+             os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
+ 
+     def easy_install(self, spec, deps=False):
++        if os.environ.get('NO_FETCH_BUILD', None):
++            log.error("ERROR: Do not try to fetch `%s' for building. "
++                      "Please add its native recipe to DEPENDS." % spec)
++            return None
++
+         if not self.editable:
+             self.install_site_py()
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 25be446..24b3ac4 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,6 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
+SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
+
 SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
 SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
 
-- 
2.7.4


