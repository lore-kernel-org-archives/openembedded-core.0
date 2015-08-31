Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3DCE576E99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 16:16:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 31 Aug 2015 09:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,442,1437462000"; d="scan'208";a="552303482"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2015 09:16:36 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 08:10:00 +0000
Message-Id: <a7907c41259e51fd12a5e4519cd4cb2bd0fd561b.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v3 2/3] devtool-upgrade: sample recipe to test the devtool feature
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
X-List-Received-Date: Mon, 31 Aug 2015 16:16:38 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

In order to have an 'upgradable' recipe, a base recipe is created
(devtool-upgrade_0.1.bb). Under the files folder, source code of
the base (0.1) and the upgrade (0.2) is located.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../recipes-test/devtool/devtool-upgrade_0.1.bb    |  25 +++++++++++++++++++
 ...-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch |  27 +++++++++++++++++++++
 .../devtool/files/devtool-upgrade-0.1.tar.gz       | Bin 0 -> 411 bytes
 .../devtool/files/devtool-upgrade-0.2.tar.gz       | Bin 0 -> 411 bytes
 4 files changed, 52 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
 create mode 100644 meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
 create mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
new file mode 100644
index 0000000..33ffc88
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
@@ -0,0 +1,25 @@
+#
+# This file was derived from the 'Hello World!' example recipe in the
+# Yocto Project Development Manual.
+#
+
+DESCRIPTION = "Simple helloworld application used to test the devtool upgrade feature"
+SECTION = "devtool"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+PR = "r0"
+
+SRC_URI = "file://${THISDIR}/files/${P}.tar.gz \
+           file://0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch \
+           "
+
+S = "${WORKDIR}/${P}"
+
+do_compile() {
+	     ${CC} helloworld.c -o helloworld
+}
+
+do_install() {
+	     install -d ${D}${bindir}
+	     install -m 0755 helloworld ${D}${bindir}
+}
diff --git a/meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch b/meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
new file mode 100644
index 0000000..2294a09
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
@@ -0,0 +1,27 @@
+From 0f37affbc6e6c71687301d99d7259f1968e57c48 Mon Sep 17 00:00:00 2001
+From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+Date: Wed, 26 Aug 2015 12:42:23 +0000
+Subject: [PATCH] helloword.c: exit with EXIT_SUCCESS instead of a magic number
+
+---
+ helloworld.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/helloworld.c b/helloworld.c
+index 71f2e46..54bf50b 100644
+--- a/helloworld.c
++++ b/helloworld.c
+@@ -1,8 +1,9 @@
+ #include <stdio.h>
++#include <stdlib.h>
+ 
+ int main(int argc, char **argv)
+ {
+     printf("Hello World!\n");
+ 
+-    return 0;
++    return EXIT_SUCCESS;
+ }
+-- 
+1.8.4.5
+
diff --git a/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz b/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..06a1c49cd9b440bba0cc16363b60d11b206895bf
GIT binary patch
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

literal 0
HcmV?d00001

diff --git a/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz b/meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..9b0dcf4b6c1210f2b907ea62b62288d917effc4b
GIT binary patch
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

literal 0
HcmV?d00001

-- 
1.8.4.5


