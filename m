Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QvHBo-0002Cl-SP
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 01:12:25 +0200
Received: by iyf13 with SMTP id 13so9620252iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2011 16:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=NZWi7uCScjy/550D6nU7FYkgBeZVPbyDpzEvmq37FQg=;
	b=QSrMFWah3Jtc6t5I0KNvvmZwkx6Io5VxBkgeRW5RqQNPPzhoKIUlgQi3QmxzmuUjBb
	LNNN0iAWhtt47joCf6R6KBRQHl9ODHMLraFRaGjPpubGBvK7I9T95CEAP+MDI7talMti
	7X8PpilwX6pc+7vQ8A9GEmfbxwDBKZvsYtSik=
Received: by 10.231.6.159 with SMTP id 31mr4309271ibz.17.1313968060633;
	Sun, 21 Aug 2011 16:07:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p11sm3041777ibf.13.2011.08.21.16.07.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Aug 2011 16:07:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Aug 2011 16:07:17 -0700
Message-Id: <e4bac3e750c5562d3ef77e3cba4b02734a566b37.1313967536.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313967536.git.raj.khem@gmail.com>
References: <cover.1313967536.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] conf,recipes: Redefine LINKER_HASH_STYLE
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
X-List-Received-Date: Sun, 21 Aug 2011 23:12:25 -0000

LINKER_HASH_STYLE in OE is set to either 'sysv' or 'gnu'
depending upon processor architecture e.g. mips does not support
gnu hash style so is uses sysv

Linker flags are munged to adhere to renamed variable

besides 'sysv' and 'gnu' third option is to set it to 'both' we do
not do that by default but user can still set it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf                      |    4 ++--
 meta/conf/distro/include/tcmode-default.inc |    6 +++++-
 meta/recipes-core/uclibc/uclibc.inc         |    2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b309516..58a604a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -475,9 +475,9 @@ BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
                     -Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
                     -Wl,-rpath,${base_libdir} -Wl,-O1"
 
-TARGET_LINK_HASH_STYLE ??= ""
+LINKER_HASH_STYLE ??= "gnu"
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
+export TARGET_LDFLAGS = "-Wl,-O1 -Wl,--hash-style=${LINKER_HASH_STYLE}"
 #export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
 #                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
 #                         -Wl,-O1"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 0d0af38..60f99ac 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -63,5 +63,9 @@ PREFERRED_VERSION_gzip-native ?= "1.4"
 
 # Setup suitable toolchain flags
 require conf/distro/include/as-needed.inc
-TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH', d, True) in ['mips', 'mipsel', 'mips64', 'mips64el']]}"
 
+# mips does not support GNU hash style therefore we hard assign them
+LINKER_HASH_STYLE_mips = "sysv"
+LINKER_HASH_STYLE_mipsel = "sysv"
+LINKER_HASH_STYLE_mips64 = "sysv"
+LINKER_HASH_STYLE_mips64el = "sysv"
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 222c34f..ab10f1b 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -201,5 +201,5 @@ do_configure() {
 
 do_install() {
         oe_runmake PREFIX=${D} install
-        oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" install_utils
+        oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=-Wl,--hash-style=${LINKER_HASH_STYLE}" install_utils
 }
-- 
1.7.5.4



