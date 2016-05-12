Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F53165CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 08:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A471918092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OQJPGalTRcEe
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 5B62618149
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 409351766
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 35D4715E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3456410E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4C8cDRL002001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4C8cDRa002000
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2016 10:38:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:37:50 +0200
Message-Id: <84b56728c90d30cb3393d417aed4a3ae02c66a00.1463042237.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
Subject: [PATCHv2 03/16] libtool-cross: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Thu, 12 May 2016 08:38:21 -0000

---
 meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
index 0204d34..b268310 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
@@ -35,11 +35,6 @@ do_install () {
 	install -c -m 0644 ${S}/m4/*.m4 ${D}${target_datadir}/aclocal/
 }
 
-SYSROOT_PREPROCESS_FUNCS += "libtoolcross_sysroot_preprocess"
-
-libtoolcross_sysroot_preprocess () {
-	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
-	sysroot_stage_dir ${D}${target_datadir} ${SYSROOT_DESTDIR}${target_datadir}
-}
+SYSROOT_DIRS += "${bindir_crossscripts} ${target_datadir}"
 
 SSTATE_SCAN_FILES += "libtoolize *-libtool"
-- 
2.1.0


