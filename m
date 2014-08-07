Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 18BC0709FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 15:26:01 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hTYSV1slDz3hhqW;
	Thu,  7 Aug 2014 17:26:02 +0200 (CEST)
X-Auth-Info: 0vjjPgd9IeYpT0GHZqhmkSrtwWKqlUuwg77fqjy2CCc=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3hTYSV0bbZz7S6S5; 
	Thu,  7 Aug 2014 17:26:02 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 17:25:57 +0200
Message-Id: <1407425157-2736-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] Yocto: qt4: Let qmake control some compiler/linker flags
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
X-List-Received-Date: Thu, 07 Aug 2014 15:26:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the case of building an Qt application outside of the Yocto
build system, we want to make sure that a "debug" configuration
of the application does contain debug symbols and is has the
compiler optimalization unset. On the other hand, we want to
have a "release" build which does not contain the debug symbols
and has the compiler optimalization turned on.

The OE_QMAKE_* flags serve to pass all kinds of flags into the
qmake-generated Makefile. Currently, we set OE_QMAKE_CFLAGS to
be ${CFLAGS} and ditto for CXXFLAGS and LDFLAGS in the SDK
toolchain environment script. This poses a problem, since the
CFLAGS can contain optimization options (-O*) and even flags to
produce debugging info (-g). The LDFLAGS may also contain some
harmful flags.

The easy way out is to let qmake's army of configuration files
handle the proper configuration of CFLAGS, CXXFLAGS and LDFLAGS
for the generated Makefile and don't interfere with qmake's
decisions by adding arbitrary flags. This patch completely
scrubs OE_QMAKE_C{,XX}FLAGS and leaves only harmless flags in
OE_QMAKE_LDFLAGS. With this patch, the behavior is as it is
explained in the first paragraph.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-qt/meta/meta-toolchain-qt.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt/meta/meta-toolchain-qt.inc
index c9bdeae..6b162bd 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -7,9 +7,9 @@ require recipes-core/meta/meta-toolchain.bb
 QT_TOOLS_PREFIX = "${SDKPATHNATIVE}${bindir_nativesdk}"
 
 toolchain_create_sdk_env_script_append() {
-    echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
-    echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
-    echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
+    echo 'export OE_QMAKE_CFLAGS=""' >> $script
+    echo 'export OE_QMAKE_CXXFLAGS=""' >> $script
+    echo 'export OE_QMAKE_LDFLAGS="${TARGET_LINK_HASH_STYLE}"' >> $script
     echo 'export OE_QMAKE_CC=$CC' >> $script
     echo 'export OE_QMAKE_CXX=$CXX' >> $script
     echo 'export OE_QMAKE_LINK=$CXX' >> $script
-- 
2.0.1


