Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R4Nnn-0002O7-2n
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 04:05:15 +0200
Received: by mail-iy0-f175.google.com with SMTP id x2so1971809iad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 19:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=e5PNytotFzCZpWz84kXlOLE+3s3A04I2pcKlpy4azQk=;
	b=WYkzTcn8SSZRfeU9Jw5GdHUuVMR0ssqJ6vPGOlIIeIbx2HBki5ksFnKadYj42V1IzM
	VUzKj8whXuoc+PhDooA49zwpxA5cNDs9sIx8fWkm3YGyPMeVT+6fAd3evzdHmGio4EhB
	LothGda0gWsbAvsO8duWgx1kRdR0bB8gL+hMg=
Received: by 10.42.141.202 with SMTP id p10mr83123icu.179.1316138404985;
	Thu, 15 Sep 2011 19:00:04 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id r2sm7188837ibq.7.2011.09.15.19.00.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 19:00:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 18:59:53 -0700
Message-Id: <34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1316138063.git.raj.khem@gmail.com>
References: <cover.1316138063.git.raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 16 Sep 2011 02:05:15 -0000

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
index b7bcc23..60ab000 100644
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



