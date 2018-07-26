Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95BDF78C40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 25BE21858C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GjlUSWxl3sxi
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:17 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 651AC18572
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:17 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AE481A088
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:17 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F0E81A084
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:17 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:17 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 345802041
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:17 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w6QK34n4032669
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:04 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w6QK34H0032668
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2018 22:03:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 22:02:57 +0200
Message-Id: <20180726200258.32625-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] meson: Split validate-cpu.patch in three
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
X-List-Received-Date: Thu, 26 Jul 2018 20:03:19 -0000

This makes it more suitable to work with, e.g., devtool. It also
prepares for the update to 0.47.0 when the first patch will no longer be
needed (as it is a backport).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/meson/meson.inc              |  4 +-
 ...u.patch => 0001-Validate-cpu_family-3753.patch} | 80 ++++++++++------------
 .../0002-Make-CPU-family-warnings-fatal.patch      | 36 ++++++++++
 ...r-to-our-wiki-instead-of-Meson-bug-system.patch | 40 +++++++++++
 4 files changed, 115 insertions(+), 45 deletions(-)
 rename meta/recipes-devtools/meson/meson/{validate-cpu.patch => 0001-Validate-cpu_family-3753.patch} (55%)
 create mode 100644 meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index b278d33b72..5484a8585b 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -11,7 +11,9 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0003-native_bindir.patch \
            file://0004-Prettifying-some-output-with-pathlib.patch \
            file://0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch \
-           file://validate-cpu.patch \
+           file://0001-Validate-cpu_family-3753.patch \
+           file://0002-Make-CPU-family-warnings-fatal.patch \
+           file://0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch \
            "
 
 SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
diff --git a/meta/recipes-devtools/meson/meson/validate-cpu.patch b/meta/recipes-devtools/meson/meson/0001-Validate-cpu_family-3753.patch
similarity index 55%
rename from meta/recipes-devtools/meson/meson/validate-cpu.patch
rename to meta/recipes-devtools/meson/meson/0001-Validate-cpu_family-3753.patch
index e7dad00d47..6b0d0ca588 100644
--- a/meta/recipes-devtools/meson/meson/validate-cpu.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Validate-cpu_family-3753.patch
@@ -1,13 +1,7 @@
-Validate the passed CPU family (US: backport) and turn the upstream warning to
-an error (US: inappropriate).
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 456f7ea48503731d50a2b7287a0f198b73b4fe61 Mon Sep 17 00:00:00 2001
+From 12fe95b1943eb832a54ba09274fa02c60d04f6b0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross@burtonini.com>
 Date: Wed, 20 Jun 2018 13:45:44 +0100
-Subject: [PATCH 1/2] Validate cpu_family (#3753)
+Subject: [PATCH 1/3] Validate cpu_family (#3753)
 
 * environment: validate cpu_family in cross file
 
@@ -25,12 +19,16 @@ $ python3
 import platform; platform.machine()
 
 Partial fix for #3751
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
  mesonbuild/environment.py | 24 ++++++++++++++++++++++++
- 1 file changed, 24 insertions(+)
+ run_unittests.py          | 18 ++++++++++++++++++
+ 2 files changed, 42 insertions(+)
 
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 6920b8d6..091d92dc 100644
+index d02a837..678d009 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
 @@ -72,6 +72,22 @@ from .compilers import (
@@ -78,41 +76,35 @@ index 6920b8d6..091d92dc 100644
                  if self.ok_type(res):
                      self.config[s][entry] = res
                  elif isinstance(res, list):
--- 
-2.11.0
-
-
-From 202e0199d3ffd2637f4dbee08f8351520f7dde3b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 3 Jul 2018 13:59:09 +0100
-Subject: [PATCH 2/2] Make CPU family warnings fatal
-
----
- mesonbuild/environment.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 091d92dc..67177c1f 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -228,7 +228,7 @@ def detect_cpu_family(compilers):
-     # Add fixes here as bugs are reported.
- 
-     if trial not in known_cpu_families:
--        mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
-+        raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
+diff --git a/run_unittests.py b/run_unittests.py
+index 3c215db..7185008 100755
+--- a/run_unittests.py
++++ b/run_unittests.py
+@@ -2065,6 +2065,24 @@ recommended as it can lead to undefined behaviour on some platforms''')
+         self.wipe()
  
-     return trial
- 
-@@ -1043,7 +1043,7 @@ class CrossBuildInfo:
-                     raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
  
-                 if entry == 'cpu_family' and res not in known_cpu_families:
--                    mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
-+                    raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % value)
- 
-                 if self.ok_type(res):
-                     self.config[s][entry] = res
++    @unittest.skipIf(not os.path.isdir('docs'), 'Doc dir not found, presumably because this is a tarball release.')
++    def test_cpu_families_documented(self):
++        with open("docs/markdown/Reference-tables.md") as f:
++            md = f.read()
++        self.assertIsNotNone(md)
++
++        sections = list(re.finditer(r"^## (.+)$", md, re.MULTILINE))
++        for s1, s2 in zip(sections[::2], sections[1::2]):
++            if s1.group(1) == "CPU families":
++                # Extract the content for this section
++                content = md[s1.end():s2.start()]
++                # Find the list entries
++                arches = [m.group(1) for m in re.finditer(r"^\| (\w+) +\|", content, re.MULTILINE)]
++                # Drop the header
++                arches = set(arches[1:])
++                self.assertEqual(arches, set(mesonbuild.environment.known_cpu_families))
++
++
+ class FailureTests(BasePlatformTests):
+     '''
+     Tests that test failure conditions. Build files here should be dynamically
 -- 
-2.11.0
+2.12.0
 
diff --git a/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
new file mode 100644
index 0000000000..3b377351a2
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
@@ -0,0 +1,36 @@
+From 9681c5bdea6a67abf014d94a392ef42eea7df0cd Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 3 Jul 2018 13:59:09 +0100
+Subject: [PATCH 2/3] Make CPU family warnings fatal
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ mesonbuild/environment.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 678d009..8b32892 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -228,7 +228,7 @@ def detect_cpu_family(compilers):
+     # Add fixes here as bugs are reported.
+ 
+     if trial not in known_cpu_families:
+-        mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
++        raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
+ 
+     return trial
+ 
+@@ -1043,7 +1043,7 @@ class CrossBuildInfo:
+                     raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
+ 
+                 if entry == 'cpu_family' and res not in known_cpu_families:
+-                    mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
++                    raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
+ 
+                 if self.ok_type(res):
+                     self.config[s][entry] = res
+-- 
+2.12.0
+
diff --git a/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch b/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch
new file mode 100644
index 0000000000..8f4603e767
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch
@@ -0,0 +1,40 @@
+From 62f4702a1d5076d0c225f899fe65cd3badfdd022 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 6 Jul 2018 15:51:15 +0100
+Subject: [PATCH 3/3] Send user to our wiki instead of Meson bug system
+
+If a CPU family isn't recognised the first step should be to verify the
+mapping. Send the user to a wiki page explaining what to do, instead of
+directly to the Meson bug tracker.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ mesonbuild/environment.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 8b32892..a0580a2 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -228,7 +228,7 @@ def detect_cpu_family(compilers):
+     # Add fixes here as bugs are reported.
+ 
+     if trial not in known_cpu_families:
+-        raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
++        raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
+ 
+     return trial
+ 
+@@ -1043,7 +1043,7 @@ class CrossBuildInfo:
+                     raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
+ 
+                 if entry == 'cpu_family' and res not in known_cpu_families:
+-                    raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
++                    raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % value)
+ 
+                 if self.ok_type(res):
+                     self.config[s][entry] = res
+-- 
+2.12.0
+
-- 
2.12.0


