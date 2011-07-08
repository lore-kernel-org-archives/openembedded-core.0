Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QfEvy-0004qT-Vl
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:33:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2011 10:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="24991311"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2011 10:29:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:29:40 -0700
Message-Id: <d80b64403133501ff6d3a61a33ae08838499b508.1310145969.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310145969.git.sgw@linux.intel.com>
References: <cover.1310145969.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310145969.git.sgw@linux.intel.com>
References: <cover.1310145969.git.sgw@linux.intel.com>
Subject: [PATCH v2 2/4] eglibc: unbash ldd (from oe.dev)
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
X-List-Received-Date: Fri, 08 Jul 2011 17:33:47 -0000

    (From oe-dev rev: 0a831e2cd1c27d30cd76ddada9a44a703ab60f41)

    * replace shebang of ldd by /bin/sh, so ldd doesn't depend on bash
      anymore. Tested with busybox sh.
    * added to do_configure_prepend because do_patch is only a python function

    Signed-off-by: Thomas Zimmermann <ml@vdm-design.de>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 74afb9d..1b2e630 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -21,8 +21,6 @@ siteconfig_do_siteconfig_gencache_prepend = " \
 
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
-#this leads to circular deps, so lets not add it yet
-#RDEPENDS_ldd += " bash"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
@@ -47,5 +45,6 @@ PACKAGES = "glibc catchsegv sln nscd ldd glibc-utils glibc-dev glibc-doc libsegf
 
 OE_FEATURES = "${@features_to_eglibc_settings(d)}"
 do_configure_prepend() {
+	sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
 	echo '${OE_FEATURES}' > ${B}/option-groups.config
 }
-- 
1.7.3.4



