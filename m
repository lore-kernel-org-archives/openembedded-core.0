Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 34499773B4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Sep 2016 16:28:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sRyky506Lz3hjXT;
	Sun,  4 Sep 2016 18:20:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sRyky4ksDzvkGP;
	Sun,  4 Sep 2016 18:20:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id duDM9Le6gXng; Sun,  4 Sep 2016 18:20:25 +0200 (CEST)
X-Auth-Info: HjS6Ap+yxZIU62+kS4R+pXdYff7xlQAYYUHqF9kDz7E=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Sun,  4 Sep 2016 18:20:25 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Sep 2016 18:20:20 +0200
Message-Id: <20160904162020.13197-1-marex@denx.de>
X-Mailer: git-send-email 2.9.3
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] libcap: Replace EXTRA_OECONF with PACKAGECONFIG_CONFARGS
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
X-List-Received-Date: Sun, 04 Sep 2016 16:28:40 -0000

When building libcap and DISTRO_FEATURES does not contain pam,
the build will fail on missing pam headers. This is because the
bits from EXTRA_OECONF moved to PACKAGECONFIG_CONFARGS and thus
the necessary options are not propagated to oe_runmake anymore.
Replace EXTRA_OECONF with PACKAGECONFIG_CONFARGS to fix this.

| arm-poky-linux-gnueabi-gcc  -march=armv7-a -mfpu=vfp  -mfloat-abi=softfp --sysroot=/b/tmp/sysroots/board  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/b/tmp/work/armv7a-vfp-poky-linux-gnueabi/libcap/2.25-r0=/usr/src/debug/libcap/2.25-r0 -fdebug-prefix-map=/b/tmp/sysroots/x86_64-linux= -fdebug-prefix-map=/b/tmp/sysroots/board=  -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Dlinux -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wshadow -g  -Dlinux -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wshadow -g  -fPIC -I/b/tmp/work/armv7a-vfp-poky-linux-gnueabi/libcap/2.25-r0/libcap-2.25/pam_cap/../libcap/include/uapi -I/b/tmp/work/armv7a-vfp-poky-linux-gnueabi/libcap/2.25-r0/libcap-2.25/pam_cap/../libcap/include -c pam_cap.c -o pam_cap.o
| pam_cap.c:19:34: fatal error: security/pam_modules.h: No such file or directory
|  #include <security/pam_modules.h>
|                                   ^
| compilation terminated.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-support/libcap/libcap_2.25.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index 8f3f11e..7ced4be 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -47,12 +47,12 @@ EXTRA_OEMAKE_append_class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
 CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 
 do_compile() {
-	oe_runmake ${EXTRA_OECONF}
+	oe_runmake ${PACKAGECONFIG_CONFARGS}
 }
 
 do_install() {
 	oe_runmake install \
-		${EXTRA_OECONF} \
+		${PACKAGECONFIG_CONFARGS} \
 		DESTDIR="${D}" \
 		prefix="${prefix}" \
 		SBINDIR="${sbindir}"
-- 
2.9.3


