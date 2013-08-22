Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E64996B334
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9fg001261; Thu, 22 Aug 2013 12:42:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uDkl55tjP3Cn; Thu, 22 Aug 2013 12:42:17 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9Fx001242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:10 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5c-0001jb-KU; Thu, 22 Aug 2013 12:30:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:59 +0100
Message-Id: <1377171000-6469-27-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 27/28] Drop darwin8/darwin9 usage
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:35 -0000

There were darwin8/darwin9 overrides spinkled in the code from times gone
by. Lets settle on the darwin override and remove the others since its pointless
duplication. We always inject darwin into OVERRIDES if needed in the darwin8/9
cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                                             | 4 ----
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb                | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 45a5221..05259b2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -260,16 +260,12 @@ MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/nativ
 
 SOLIBS = ".so.*"
 SOLIBS_darwin = ".dylib"
-SOLIBS_darwin8 = ".dylib"
-SOLIBS_darwin9 = ".dylib"
 
 SOLIBSDEV = ".so"
 # Due to the ordering of PACKAGES and the naming of the dev symlinks on darwin,
 # we can't make the symlinks end up in the -dev packages easily at this point. This hack
 # at least means builds aren't completely broken and symlinks don't take up much space.
 SOLIBSDEV_darwin = ".dylibbroken"
-SOLIBSDEV_darwin8 = ".dylibbroken"
-SOLIBSDEV_darwin9 = ".dylibbroken"
 
 PACKAGE_BEFORE_PN ?= ""
 PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 63fea28..84fb95d 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -22,7 +22,7 @@ RDEPENDS_${PN} = "\
     nativesdk-automake \
     "
 
-RDEPENDS_${PN}_darwin8 = "\
+RDEPENDS_${PN}_darwin = "\
     odcctools-cross-canadian \
     llvm-cross-canadian \
     nativesdk-pkgconfig \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index d231268..928a0cd 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -10,7 +10,6 @@ SRC_URI[sha256sum] = "b984aaf1fe888d6a4cf8c2e8d397207879599b5368f1d33232c1ec9d68
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
-EXTRA_OECONF_darwin8 = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
 do_configure_prepend () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
-- 
1.8.1.2


