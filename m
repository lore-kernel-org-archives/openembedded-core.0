Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJsvf-0005Dd-0A
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:53:44 +0200
Received: by ggcy3 with SMTP id y3so2774020ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 13:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wQiHRe0ClbZ1oX8ngQqnjd426bNog4jWUaUq77+5iaY=;
	b=xbf6674RXzJ70t7ZF1lp18Kf4ABAYEy/kAQChzlA61ymTl1G5e8vum14BhH4vfsSpO
	9h6aK2cLqQ6/njVJe25/dhgfLQJqWBDNmMI0WgyEqBqvfuD/9gGuwHEFFS85Qn39X2aM
	xgzoImNzG7w8Yx0Bt65Qq22fKQSYzW1doWR2mXywN4CH8ySRu6iyOYLzKjRJrzDDOz4R
	INtyIjv0PCYnQvicKgnjGCVVlStxF/keQrZ58FqeMbwpj1O8eKuEdbmos/7cnp0xe4qG
	CNn1eSbYv+yJ8y9YYm9NWjLG+tGXOXIQiOywJwiXYFpRGaq22O1LjCXPk8iZliCRHKUr
	Zppw==
Received: by 10.60.4.199 with SMTP id m7mr17492245oem.65.1334609056970;
	Mon, 16 Apr 2012 13:44:16 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id hh2sm20659762obb.1.2012.04.16.13.44.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 13:44:16 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 15:44:04 -0500
Message-Id: <542099b94f9c870235e57b0bf0e69201f756db59.1334608810.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
References: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
In-Reply-To: <cover.1334608810.git.kergoth@gmail.com>
References: <cover.1334608810.git.kergoth@gmail.com>
Subject: [PATCH 7/7] external-csl-toolchain: update for locale bits
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
X-List-Received-Date: Mon, 16 Apr 2012 20:53:44 -0000

- drop SUPPORTED, as it's only used for locale generation, and we now use the
  precompiled locale files from the external toolchain
- stop rm -r'ing locale files from do_install_locale, as it's not needed

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index 8798541..6ddabf7 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -24,12 +24,10 @@ PROVIDES += "\
 	virtual/linux-libc-headers \
 "
 PV = "${CSL_VER_MAIN}"
-PR = "r4"
+PR = "r5"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
 
-SRC_URI = "file://SUPPORTED"
-
 do_install() {
 	# Use optimized files if available
 	sysroot="${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc"
@@ -74,10 +72,6 @@ do_install() {
         sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libpthread.so
 }
 
-do_install_locale_append () {
-	rm -r ${D}${datadir}/locale ${D}${libdir}/locale
-}
-
 SYSROOT_PREPROCESS_FUNCS += "external_toolchain_sysroot_adjust"
 external_toolchain_sysroot_adjust() {
        if [ -n "${CSL_TARGET_CORE}" ]; then
-- 
1.7.7



