Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCuLM-0008U6-0W
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 16:59:24 +0200
Received: by pbcum15 with SMTP id um15so1721508pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hkcn9udRI3oHsRFEvhybZ8fkinXvvRPWm9Q9fnieOkY=;
	b=ohjwGfjHXGauZ06fRQFlU1NI5GsFkNQN8b49wJkRDyT9FU18bXLSG+/fM7dDyZRdM+
	bRKPQIg5N7p3PqnHk9HWUboBJPQP9Q+r9O9i26tEySXdJQzQvpIppXMfyaolWOo/Lmbr
	uA5UWr6W0jrKfPPaz7wiQQhCBo1lYdF6dnSnYglAL+gQYhqnTxM+EAHRpbssJGmOhO8J
	weVZx7WpLkwEJ70g6CF+qpdvdr0UH5CujAIDbwiYnS8PuGe1O1NHI1dbYM06Iw7Cz1fn
	sDdm2lYFcdAow9aSOHCtksdiYPBpTY6AS4yDyDmHwXbSOZaopHvjwc6u7Ipwsx86+kAw
	2e2w==
Received: by 10.68.132.6 with SMTP id oq6mr47668097pbb.66.1332946221112;
	Wed, 28 Mar 2012 07:50:21 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id jm4sm2824756pbc.73.2012.03.28.07.50.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 07:50:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2012 07:49:21 -0700
Message-Id: <1332946161-11606-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC][PATCH] gcc-configure: Pass distinct target flags
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
X-List-Received-Date: Wed, 28 Mar 2012 14:59:24 -0000

When building gcc-cross-canadian libgcc is built using
headers from gcc-crosssdk and not the target sysroot
because we do not pass proper CFLAGS for target bits
so it ends up using CFLAGS that were meant for compiling
canadian gcc itself. It does not show up as a problem
when building SDK with eglibc because eglibc-nativesdk
and eglibc have identical headers. The problem shows
up clearly when you try to build uclibc based meta-toolchain
since then nativesdk libc and target libc are different

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    4 ++++
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    4 ++++
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    6 +++++-
 3 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 04eda9e..8ec8dd1 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -104,6 +104,10 @@ do_configure () {
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
 	export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
+	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
+	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
 
 	oe_runconf
diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
index 91834c2..65e340a 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
@@ -20,6 +20,10 @@ do_compile_prepend () {
 	export LD_FOR_TARGET="${TARGET_SYS}-ld"
 	export NM_FOR_TARGET="${TARGET_SYS}-nm"
 	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc ${TARGET_CC_ARCH}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
+	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
+	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 }
 
 LIBGCCS_VAR = "-lgcc_s"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index 3043814..54e8ede 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -30,7 +30,7 @@ export WINDRES_FOR_TARGET = "${TARGET_PREFIX}windres"
 #
 # We need to override this and make sure the compiler can find staging
 #
-export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET}"
+export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem =${target_includedir}"
 
 do_configure () {
 	export CC_FOR_BUILD="${BUILD_CC}"
@@ -39,6 +39,10 @@ do_configure () {
 	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
+	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
+	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
 	oe_runconf
 }
-- 
1.7.5.4



