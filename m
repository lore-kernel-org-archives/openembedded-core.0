Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8Obv-00060b-Ek
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 05:45:35 +0200
Received: by ywf7 with SMTP id 7so6057302ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 20:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=UNSQYzTN435gB0yGL008abz0lNcd0IvxoB7Qbh7xWO4=;
	b=gX4i9HVmdCSqrN/VfEBf2yIVJTKRvBk7yRtW21FI+6bQUdbcAHRaYK3TH4rTluax6f
	IAbiJ5DTu81FDFro4fKUGfZTY77zVxcdR0QTefgr2w4z9VB94qUvWKZpiuKgApDDdsj0
	rzo1V18bC8/G+7CwBjVxvQKxHdS7d4ldKJNog=
Received: by 10.151.85.2 with SMTP id n2mr7128344ybl.154.1317094810200;
	Mon, 26 Sep 2011 20:40:10 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id g38sm29871657ann.4.2011.09.26.20.40.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 20:40:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 20:39:51 -0700
Message-Id: <fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1317094542.git.raj.khem@gmail.com>
References: <cover.1317094542.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] conf, recipes: Add new variable LINKER_HASH_STYLE
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
X-List-Received-Date: Tue, 27 Sep 2011 03:45:35 -0000

LINKER_HASH_STYLE in OE is set to either 'sysv' or 'gnu'
depending upon processor architecture e.g. mips does not support
gnu hash style so is uses sysv

besides 'sysv' and 'gnu' third option is to set it to 'both' we do
not do that by default but user can still set it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf                      |    3 ++-
 meta/conf/distro/include/tcmode-default.inc |    6 +++++-
 meta/recipes-core/uclibc/uclibc.inc         |    2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 730439c..47e8547 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -476,7 +476,8 @@ BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
                     -Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
                     -Wl,-rpath,${base_libdir} -Wl,-O1"
 
-TARGET_LINK_HASH_STYLE ??= ""
+LINKER_HASH_STYLE ??= "gnu"
+TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('LINKER_HASH_STYLE', d, True) == 'gnu']}"
 export LDFLAGS = "${TARGET_LDFLAGS}"
 export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
 #export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 2857215..1ddfbce 100644
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
index 222c34f..f104114 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -201,5 +201,5 @@ do_configure() {
 
 do_install() {
         oe_runmake PREFIX=${D} install
-        oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" install_utils
+	oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" install_utils
 }
-- 
1.7.5.4



