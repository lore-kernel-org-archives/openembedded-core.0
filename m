Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1ia-000293-BF
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:00:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jan 2012 09:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="114994032"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2012 09:52:56 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:11 +0800
Message-Id: <5da104c33636cbe2d512779de0799f78edbedd37.1327255445.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 06/18] iptables: upgrade to 1.4.12.2
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
X-List-Received-Date: Sun, 22 Jan 2012 18:00:40 -0000

This patch is to upgrade iptables to 1.4.12.2, and introduce a patch not to check unknown symbols.
Otherwise, when it is compiled, it will report "libxtables.so.7" from LD_PRELOAD cannot be preloaded.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../iptables/iptables/GNUmakefile.patch            |   18 ++++++++++++++++++
 .../{iptables_1.4.12.1.bb => iptables_1.4.12.2.bb} |    7 ++++---
 2 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/GNUmakefile.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.12.1.bb => iptables_1.4.12.2.bb} (88%)

diff --git a/meta/recipes-extended/iptables/iptables/GNUmakefile.patch b/meta/recipes-extended/iptables/iptables/GNUmakefile.patch
new file mode 100644
index 0000000..c60e84f
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/GNUmakefile.patch
@@ -0,0 +1,18 @@
+Don't check unknown symbols.
+
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+diff -r abb89394ce0c extensions/GNUmakefile.in
+--- a/extensions/GNUmakefile.in	Mon Jan 23 00:12:27 2012 +0800
++++ b/extensions/GNUmakefile.in	Mon Jan 23 00:38:32 2012 +0800
+@@ -68,7 +68,7 @@
+ 
+ .PHONY: all install clean distclean FORCE
+ 
+-all: ${targets} check
++all: ${targets}
+ 
+ check: ${targets}
+ 	@echo "  CHECK    unknown symbols in .so files"; \
diff --git a/meta/recipes-extended/iptables/iptables_1.4.12.1.bb b/meta/recipes-extended/iptables/iptables_1.4.12.2.bb
similarity index 88%
rename from meta/recipes-extended/iptables/iptables_1.4.12.1.bb
rename to meta/recipes-extended/iptables/iptables_1.4.12.2.bb
index 52aa4d5..2d3d311 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.12.1.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.12.2.bb
@@ -21,10 +21,11 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
 FILES_${PN} =+ "${libdir}/xtables/"
 FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
-SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2"
+SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
+           file://GNUmakefile.patch"
 
-SRC_URI[md5sum] = "b08a1195ec2c1ebeaf072db3c55fdf43"
-SRC_URI[sha256sum] = "77e6581f21f15946a814fa311236e5f3f7c6593180f9d695cea06aa95e464aba"
+SRC_URI[md5sum] = "212112389c7f10c72efb31a4ed193a4c"
+SRC_URI[sha256sum] = "09fff7dfe6af95675474fd5d0fc67622fac5a0f3d6e02ee614deae9a2e5dae13"
 
 inherit autotools
 
-- 
1.7.6



