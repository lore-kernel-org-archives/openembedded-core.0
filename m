Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF4E7391D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 07:17:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t677HMS3006367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 00:17:22 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 00:17:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Jul 2015 00:17:20 -0700
Message-ID: <b43e9f344635ef03616702689d946a769132e171.1436253346.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436253346.git.liezhi.yang@windriver.com>
References: <cover.1436253346.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] toolchain-scripts.bbclass: use MLPREFIX to instead of MULTILIB_VARIANTS
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
X-List-Received-Date: Tue, 07 Jul 2015 07:17:23 -0000
Content-Type: text/plain

Fixed when enable multilib:
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal

No lib32 package should be built since we don't build
lib32-core-image-minimal, but a lot them are built:
lib32-opkg-utils
lib32-cryptodev-linux
lib32-sqlite3
lib32-libtool-cross
lib32-ncurses
lib32-db
lib32-diffutils
lib32-zlib
lib32-gcc-cross-i686
lib32-gcc-cross-initial-i686
lib32-flex
lib32-libgcc-initial
lib32-libffi
lib32-linux-libc-headers
lib32-expat
lib32-openssl
lib32-glibc
lib32-binutils-cross-i686
lib32-gcc-runtime

This is because MULTILIB_VARIANTS is always avaliable when multlib is
enabled, use MLPREFIX to fix the problem so that lib32/lib64 packages will
only be built when build lib32/lib64-core-image-minimal.

[YOCTO #7961]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 9378918..d05a5a3 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -144,8 +144,9 @@ python __anonymous () {
     deps = ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
-        for variant in (d.getVar('MULTILIB_VARIANTS', True) or "").split():
-            clsextend = oe.classextend.ClassExtender(variant, d)
+        mlprefix = d.getVar('MLPREFIX', True)
+        if mlprefix:
+            clsextend = oe.classextend.ClassExtender(mlprefix[:-1], d)
             newdep = clsextend.extend_name(dep)
             deps += " %s:do_populate_sysroot" % newdep
     d.appendVarFlag('do_configure', 'depends', deps)
-- 
1.7.9.5


