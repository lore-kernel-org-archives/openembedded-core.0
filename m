Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1232D78882
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 03:35:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6H3ZJFi002374
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jul 2018 20:35:19 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 16 Jul 2018 20:35:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 16 Jul 2018 23:34:31 -0400
Message-ID: <dfc75ebfb9a5282585d621ea66b4590dbb8b6b17.1531798346.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1531798346.git.hongxu.jia@windriver.com>
References: <cover.1531798346.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 2/2] distutils3/setuptools3-native: do not try to fetch code during do_compile
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
X-List-Received-Date: Tue, 17 Jul 2018 03:35:19 -0000
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
 meta/classes/distutils3.bbclass                    |  2 ++
 ...ionally-do-not-fetch-code-by-easy_install.patch | 35 ++++++++++++++++++++++
 .../python/python3-setuptools_40.0.0.bb            |  2 ++
 3 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index d4b92a3..fea7368 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -15,6 +15,8 @@ distutils3_do_configure() {
 }
 
 distutils3_do_compile() {
+        NO_FETCH_BUILD=1 \
+        NO_FETCH_BUILD_HELP="Please add its native recipe to DEPENDS." \
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
new file mode 100644
index 0000000..441af16
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -0,0 +1,35 @@
+From 019422d19c6401fa8f45b1311ecd31bb087c809d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 17 Jul 2018 10:13:38 +0800
+Subject: [PATCH] conditionally do not fetch code by easy_install
+
+If var-NO_FETCH_BUILD is set, do not allow to fetch code from
+internet by easy_install, and log the help message from
+var-NO_FETCH_BUILD_HELP
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
++            log.error("ERROR: Do not try to fetch `%s' for building. %s" %
++                             (spec,  os.environ.get('NO_FETCH_BUILD_HELP', '')))
++            return None
++
+         if not self.editable:
+             self.install_site_py()
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_40.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_40.0.0.bb
index 0dc1ed8..713a1b5 100644
--- a/meta/recipes-devtools/python/python3-setuptools_40.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_40.0.0.bb
@@ -1,6 +1,8 @@
 require python-setuptools.inc
 inherit setuptools3
 
+SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
+
 do_install_append() {
     mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
 }
-- 
2.8.1


