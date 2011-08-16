Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtSJS-0005W0-8U
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 00:40:46 +0200
Received: by ywe9 with SMTP id 9so332293ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 15:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WXlogdI+H7fkUyOkjw6Fz4qM7zA5eSSxj2S7ZYFb6XU=;
	b=r34jDohKIN3qE0IyZEv1D82P40/mWS4WxFUtMkN9FCFpOOGln3Vk7IOhTQCTC6PiLT
	3ROVZX1BX8rUpxmY7Y5KPDTi4R7xdKbIGVS6QoJtZSzSuA7qRArfqlKSeg3hZEyu8YzV
	UBFR9zi9c4lfnMWqCu1dzprs/KMHvW5xq8WVs=
Received: by 10.236.175.102 with SMTP id y66mr1099314yhl.28.1313534168175;
	Tue, 16 Aug 2011 15:36:08 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c63sm581513yhe.18.2011.08.16.15.36.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 15:36:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 15:35:48 -0700
Message-Id: <fcafbb92c3e07d372066a36e6af2dc13f0a99a1f.1313533911.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313533911.git.raj.khem@gmail.com>
References: <cover.1313533911.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] conf,recipes: Redefine LINKER_HASH_STYLE
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
X-List-Received-Date: Tue, 16 Aug 2011 22:40:46 -0000

LINKER_HASH_STYLE is not set to either sysv or gnu
depending upon architecture e.g. mips does not support
gnu hash style among the supported architectures so
we make sure its set to 'sysv' form mips

Linker flags are munged to adhere to renamed variable

Third option is to set it to 'both' we do
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



