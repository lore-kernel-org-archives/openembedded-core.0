Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SDkRn-0008Tl-Cv
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:37:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Mar 2012 15:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125417096"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 30 Mar 2012 15:28:25 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 15:28:22 -0700
Message-Id: <512eae1ae0678b247076db900304725702acc91e.1333145263.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1333145263.git.nitin.a.kamble@intel.com>
References: <cover.1333145263.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/3] nasm: fix issue with repeat configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 22:37:31 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This Fixes bug: [YOCTO #2176]

This fixes the following issue as mentioned in the bug:
If nasm-native has to be rebuilt (due to a signature change) it will fail:

| checking for a BSD-compatible install... /usr/bin/install -c
| /media/large/tmp/work/x86_64-linux/nasm-native-2.07-r1/nasm-2.07/configure:
line 4261: syntax error near unexpected token `-W'
| /media/large/tmp/work/x86_64-linux/nasm-native-2.07-r1/nasm-2.07/configure:
line 4261: `PA_ADD_CFLAGS(-W)'
| ERROR: oe_runconf failed
NOTE: package nasm-native-2.07-r1: task do_configure: Failed

The failure appears to be caused by do_patch_fixaclocal being run a second time

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/nasm/nasm_2.07.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/nasm/nasm_2.07.bb b/meta/recipes-devtools/nasm/nasm_2.07.bb
index 9b75496..fc2d531 100644
--- a/meta/recipes-devtools/nasm/nasm_2.07.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.07.bb
@@ -13,12 +13,12 @@ SRC_URI[sha256sum] = "ac70ee451c73d742c9ff830502e5f8b1f648b2abffa8fd00944243283b
 
 inherit autotools
 
-do_patch_fixaclocal () {
-	mv aclocal.m4 acinclude.m4
+do_configure_prepend () {
+	if [ -f aclocal.m4 ] && [ ! -f acinclude.m4 ]; then
+		mv aclocal.m4 acinclude.m4
+	fi
 }
 
-addtask do_patch_fixaclocal after do_patch before do_configure
-
 do_install() {
 	install -d ${D}${bindir}
 	install -d ${D}${mandir}/man1
-- 
1.7.6.4



