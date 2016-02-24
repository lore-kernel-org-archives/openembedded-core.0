Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0B43A77396
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:09:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305724"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:09:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:33 +1300
Message-Id: <e72435a3b6d5b81692d294308caecb3413e1d5eb.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/14] oe-selftest: devtool: rework devtool upgrade test
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:29 -0000

* Use a more real-world test of a recipe pointing to a remote file
* The cleanup tracking / teardown commands need to be added towards the
  top, or they won't have the desired effect of cleaning up if the test
  fails.
* Check that a versioned subdirectory gets renamed to match the new
  version
* Ensure the recipe contents gets changed as we expect it to
* Check that the recipe directory is deleted by devtool reset at the end

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...01-Add-a-note-line-to-the-quick-reference.patch |  25 +++++++++++++++++++
 .../devtool/devtool-upgrade-test1_1.5.3.bb         |  16 ++++++++++++
 .../devtool-upgrade-test1_1.5.3.bb.upgraded        |  14 +++++++++++
 .../recipes-test/devtool/devtool-upgrade_0.1.bb    |  25 -------------------
 ...-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch |  27 ---------------------
 .../devtool/files/devtool-upgrade-0.1.tar.gz       | Bin 411 -> 0 bytes
 .../devtool/files/devtool-upgrade-0.2.tar.gz       | Bin 411 -> 0 bytes
 meta/lib/oeqa/selftest/devtool.py                  |  27 ++++++++++++++-------
 8 files changed, 73 insertions(+), 61 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
 delete mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
 delete mode 100644 meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
 delete mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz
 delete mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
new file mode 100644
index 0000000..4ea3d74
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
@@ -0,0 +1,25 @@
+From 1478846ebfac690684e9c48049d08e0065f97a36 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 24 Feb 2016 17:43:03 +1300
+Subject: [PATCH] Add a note line to the quick reference
+
+A test patch so we have a file to move around.
+---
+ doc/quickref.1.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/doc/quickref.1.in b/doc/quickref.1.in
+index 389008b..226615c 100644
+--- a/doc/quickref.1.in
++++ b/doc/quickref.1.in
+@@ -560,6 +560,7 @@ you want, at runtime, to change the parameters of.
+ .P
+ If you find any other problems, please report them.
+ 
++NOTE: this is an important note.
+ 
+ .SH REPORTING BUGS
+ Report bugs in
+-- 
+2.5.0
+
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
new file mode 100644
index 0000000..e93b0d5
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Pipe viewer test recipe for devtool upgrade test"
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
+
+SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
+           file://0001-Add-a-note-line-to-the-quick-reference.patch"
+
+SRC_URI[md5sum] = "9365d86bd884222b4bf1039b5a9ed1bd"
+SRC_URI[sha256sum] = "681bcca9784bf3cb2207e68236d1f68e2aa7b80f999b5750dc77dcd756e81fbc"
+
+PR = "r5"
+
+S = "${WORKDIR}/pv-${PV}"
+
+inherit autotools
+
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
new file mode 100644
index 0000000..afcc4aa
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
@@ -0,0 +1,14 @@
+SUMMARY = "Pipe viewer test recipe for devtool upgrade test"
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
+
+SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
+           file://0001-Add-a-note-line-to-the-quick-reference.patch"
+
+SRC_URI[md5sum] = "062bca5ff33df1dd09472e7fc3bbe332"
+SRC_URI[sha256sum] = "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5afd2f6bc3b07fd82c3"
+
+S = "${WORKDIR}/pv-${PV}"
+
+inherit autotools
+
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
deleted file mode 100644
index 33ffc88..0000000
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-#
-# This file was derived from the 'Hello World!' example recipe in the
-# Yocto Project Development Manual.
-#
-
-DESCRIPTION = "Simple helloworld application used to test the devtool upgrade feature"
-SECTION = "devtool"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-PR = "r0"
-
-SRC_URI = "file://${THISDIR}/files/${P}.tar.gz \
-           file://0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch \
-           "
-
-S = "${WORKDIR}/${P}"
-
-do_compile() {
-	     ${CC} helloworld.c -o helloworld
-}
-
-do_install() {
-	     install -d ${D}${bindir}
-	     install -m 0755 helloworld ${D}${bindir}
-}
diff --git a/meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch b/meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
deleted file mode 100644
index 2294a09..0000000
--- a/meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 0f37affbc6e6c71687301d99d7259f1968e57c48 Mon Sep 17 00:00:00 2001
-From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
-Date: Wed, 26 Aug 2015 12:42:23 +0000
-Subject: [PATCH] helloword.c: exit with EXIT_SUCCESS instead of a magic number
-
----
- helloworld.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/helloworld.c b/helloworld.c
-index 71f2e46..54bf50b 100644
---- a/helloworld.c
-+++ b/helloworld.c
-@@ -1,8 +1,9 @@
- #include <stdio.h>
-+#include <stdlib.h>
- 
- int main(int argc, char **argv)
- {
-     printf("Hello World!\n");
- 
--    return 0;
-+    return EXIT_SUCCESS;
- }
--- 
-1.8.4.5
-
diff --git a/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz b/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz
deleted file mode 100644
index 06a1c49cd9b440bba0cc16363b60d11b206895bf..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 411
zcmV;M0c8FkiwFRs0OVBw1MSs8Z-Ous2XM}Oiq2isOzbNymALKfakpJ|X@DsSf+^rk
zmVNiNCX1Wm=7!Ojz2Bwa6WR*@r#F01t4X5bM3)};AjB|EmQ_(?gL*O5=JNsdz-fgV
z0q5({*d8hP%mF4Om}BOHL(M8cIAqms+QZakrL<W}+xu*9?n3yK%&T;s+yUq2_ZO0Z
z7X*CdQx4KKRrRF`fyV{2RmN;J+JEi2cZLqp5cc7*=dgK@LfDZ3h4ndX`oTIbTlx2;
zbci_iLYjQ!KPy!p7t6h^t}ac7{N_Fvn*XNfzw?hUOR}tZDRdTl(I4jcx&MQG{(<y;
z^IDkifs_*a|4FcL)BmXmSs(*1q#*?1i2b(xf2p2(W9T4F`EMEb9iQ^w*#Cixo&0m^
zkduVypZEXkG>@`6PRMOp#cAQq?p-&{D>7GU-n9oxPoo<W&6FnnzByU;+*g+v3vJ5J
z-Oj|mE#%R@E>}-^r#E)jWt~*D&Iuj6Z`cbELI@#*5JCtcgb+dqA%qY*jd!bMh~WSz
F005Y))ZYLA

diff --git a/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz b/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz
deleted file mode 100644
index 9b0dcf4b6c1210f2b907ea62b62288d917effc4b..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 411
zcmV;M0c8FkiwFQe0OVBw1MSs8Z-Ous0ASDjiq2is%-WWgLfm%txZ5tfG{BSu!4z~R
z%l`WwB#YDG=7!Ojz3)=mS1E<QCmlVQ^&~b?YzxYTuf-^eS7n~3!{uUXVSLD_=(NIs
zCuQA&-Ij4zbhuEOR~-%GTqz+tWZiDr!z_!^Sa_7S_u1Xtg>V^}m&rW7<5I%=SDuhm
zOW${y473ALvlZon20nwRVs$j!|J!r#3>~5&*+<7-qfTq3s#b8u>ptJqgF0Py@?XL<
zqK^F_O+NBJEld{WE53goRLF1cbD{a)^!>m5Bh2D7&0lhxMl}4x8b8;6UVVR0yDl6H
zm?vP+#rl5=BG}Y_rUKz<j|ME@Uf_%0mjA8jxi^Lm(v<%#)BTH2`QKRoxm4Tv&$X6N
z|4))c|GfTRCs~*-qnO+lWt8M}cJDYzR+70%vR-vz>@>U~;mlYv7(i#$cU~O=78b(K
zz3!wsE#$E}E>}-kw?B63u#L;5%?KMiZ&(WuLI@#*5JCtcgb+dqA%qY*jdwLBEfxSM
F003pq%-sM0

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 0361464..4d280bb 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1095,14 +1095,18 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_upgrade(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         # Check parameters
         result = runCmd('devtool upgrade -h')
         for param in 'recipename srctree --version -V --branch -b --keep-temp --no-patch'.split():
             self.assertIn(param, result.output)
         # For the moment, we are using a real recipe.
-        recipe='devtool-upgrade'
-        version='0.2'
+        recipe = 'devtool-upgrade-test1'
+        version = '1.6.0'
+        oldrecipefile = get_bb_var('FILE', recipe)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
         # Check that recipe is not already under devtool control
         result = runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
@@ -1110,22 +1114,27 @@ class DevtoolTests(DevtoolBase):
         # we are downgrading instead of upgrading.
         result = runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, version))
         # Check if srctree at least is populated
-        self.assertTrue(len(os.listdir(tempdir)) > 0, 'scrtree (%s) should be populated with new (%s) source code' % (tempdir, version))
-        # Check new recipe folder is present
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir,'recipes',recipe)), 'Recipe folder should exist')
+        self.assertTrue(len(os.listdir(tempdir)) > 0, 'srctree (%s) should be populated with new (%s) source code' % (tempdir, version))
+        # Check new recipe subdirectory is present
+        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe, '%s-%s' % (recipe, version))), 'Recipe folder should exist')
         # Check new recipe file is present
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir,'recipes',recipe,"%s_%s.bb" % (recipe,version))), 'Recipe folder should exist')
+        newrecipefile = os.path.join(self.workspacedir, 'recipes', recipe, '%s_%s.bb' % (recipe, version))
+        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file should exist after upgrade')
         # Check devtool status and make sure recipe is present
         result = runCmd('devtool status')
         self.assertIn(recipe, result.output)
         self.assertIn(tempdir, result.output)
+        # Check recipe got changed as expected
+        with open(oldrecipefile + '.upgraded', 'r') as f:
+            desiredlines = f.readlines()
+        with open(newrecipefile, 'r') as f:
+            newlines = f.readlines()
+        self.assertEqual(desiredlines, newlines)
         # Check devtool reset recipe
         result = runCmd('devtool reset %s -n' % recipe)
         result = runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after resetting')
 
     @testcase(1352)
     def test_devtool_layer_plugins(self):
-- 
2.5.0


