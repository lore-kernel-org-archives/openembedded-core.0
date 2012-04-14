Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJ6xL-0007MC-4V for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 19:40:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3EHUquW014969
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 18:30:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14464-04 for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 18:30:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3EHUgUQ014963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 18:30:43 +0100
Message-ID: <1334424642.8545.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Apr 2012 18:30:42 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] external-poky-toolchain: This is broken and confusing now, remove it
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
X-List-Received-Date: Sat, 14 Apr 2012 17:40:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids a number of bogus preferred providers warnings too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/meta/external-poky-toolchain.bb b/meta/recipes-core/meta/external-poky-toolchain.bb
deleted file mode 100644
index 5507746..0000000
--- a/meta/recipes-core/meta/external-poky-toolchain.bb
+++ b/dev/null
@@ -1,40 +0,0 @@
-PROVIDES = "\
-    linux-libc-headers \
-    virtual/${TARGET_PREFIX}gcc \
-    virtual/${TARGET_PREFIX}gcc-intermediate \
-    virtual/${TARGET_PREFIX}gcc-initial \
-    virtual/${TARGET_PREFIX}binutils \
-    virtual/${TARGET_PREFIX}libc-for-gcc \
-    virtual/libc \
-    virtual/libintl \
-    virtual/libiconv \
-    virtual/linux-libc-headers "
-RPROVIDES = "glibc-utils libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
-PACKAGES_DYNAMIC = "glibc-gconv-*"
-INHIBIT_DEFAULT_DEPS = "1"
-PR = "r1"
-
-# License applies to this recipe code, not the toolchain itself
-LICENSE = "MIT"
-
-do_install() {
-	if [ ! -e  ${prefix}/environment-setup ]; then
-		echo "The Poky toolchain could not be found in ${prefix}!"
-		exit 1
-	fi
-
-	install -d ${DEPLOY_DIR}/ipk/
-	install -d ${STAGING_DIR}/pkgdata/
-	install -d ${STAGING_DIR_TARGET}/shlibs/
-	install -d ${STAGING_DIR_TARGET}/${base_libdir}/
-	install -d ${STAGING_DIR_TARGET}/${libdir}/
-	install -d ${STAGING_DIR_TARGET}/${includedir}/
-
-	cp -ar ${prefix}/ipk/* ${DEPLOY_DIR}/ipk/
-	cp -ar ${prefix}/pkgdata/* ${STAGING_DIR}/pkgdata/
-	cp -ar ${prefix}/${TARGET_SYS}/shlibs/* ${STAGING_DIR_TARGET}/shlibs/
-	cp -ar ${prefix}/${TARGET_SYS}/lib/* ${STAGING_DIR_TARGET}/${base_libdir}/
-	cp -ar ${prefix}/${TARGET_SYS}/usr/include/* ${STAGING_DIR_TARGET}/${includedir}/
-	cp -ar ${prefix}/${TARGET_SYS}/usr/lib/* ${STAGING_DIR_TARGET}/${libdir}/
-}
-




