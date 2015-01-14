Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 097E565D19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lhRA003252
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:26 -0800
Message-ID: <dc295a820761c967664f5b38037728a64e231479.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/27] qemu: fix B != S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:46 -0000
Content-Type: text/plain

And bump PR to avoid:
Makefile:16: *** This is an out of tree build but your source tree
(/path/to/qemu-2.2.0) seems to have been used for an in-tree build. You
can fix this by running "make distclean && rm -rf *-linux-user
*-softmmu" in your source tree.  Stop.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c9a5d32..49415c1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -5,9 +5,11 @@ DEPENDS = "glib-2.0 zlib pixman"
 RDEPENDS_${PN}_class-target += "bash python"
 
 require qemu-targets.inc
-inherit autotools-brokensep
+inherit autotools
 BBCLASSEXTEND = "native nativesdk"
 
+PR = "r1"
+
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
@@ -37,13 +39,13 @@ do_configure_prepend_class-native() {
 	fi
 
 	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
-	sed -i 's/-lX11//g' Makefile.target
+	sed -i 's/-lX11//g' ${S}/Makefile.target
 }
 
 do_configure_prepend_class-nativesdk() {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "" ] ; then
 		# Undo the -lX11 added by linker-flags.patch
-		sed -i 's/-lX11//g' Makefile.target
+		sed -i 's/-lX11//g' ${S}/Makefile.target
 	fi
 }
 
-- 
1.7.9.5


