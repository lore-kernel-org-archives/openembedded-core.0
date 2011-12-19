Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RcVfb-0007Ca-QR
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 06:21:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2011 21:14:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87955977"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2011 21:14:48 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	sakoman@gmail.com
Date: Mon, 19 Dec 2011 13:14:49 +0800
Message-Id: <33eb9cf534f8e946cf8cb2d67d64b47f193a89e7.1324271587.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1324271587.git.dexuan.cui@intel.com>
References: <cover.1324271587.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1324271587.git.dexuan.cui@intel.com>
References: <cover.1324271587.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] wget: fix a host intrusion issue introduced by adding --with-ssl=openssl.
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
X-List-Received-Date: Mon, 19 Dec 2011 05:21:52 -0000

On my x86-64 Ubuntu 11.04, with MACHINE=qemux86, "bitbake wget" fails. The
config.log shows:

configure:30072: i586-poky-linux-gcc  -m32   -march=i586
 --sysroot=/distro/dcui/1212/p1/build/tmp/sysroots/qemux86 -o conftest -O2
 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed conftest.c -ldl -lz  /usr/lib/libssl.so /usr/lib/libcrypto.so
 -lz >&5
/usr/lib/libssl.so: could not read symbols: File in wrong format

The patch fixes the issue by specifying libssl-prefix.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-extended/wget/wget.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 7083569..25f36c8 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -4,11 +4,11 @@ LICENSE = "GPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "openssl"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 inherit autotools gettext update-alternatives
 
-EXTRA_OECONF = "--with-libc --enable-ipv6 --with-ssl=openssl"
+EXTRA_OECONF = "--with-libc --enable-ipv6 --with-libssl-prefix=${STAGING_DIR_HOST} --with-ssl=openssl"
 
 do_install_append () {
 	mv ${D}${bindir}/wget ${D}${bindir}/wget.${PN}
-- 
1.7.6



