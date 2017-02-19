Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA7C606B2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 15:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JF0frg030133; Sun, 19 Feb 2017 15:00:41 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dz5il9j_GCJQ; Sun, 19 Feb 2017 15:00:41 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JF0b0C030123
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 19 Feb 2017 15:00:40 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cfSya-0000vi-Vd; Sun, 19 Feb 2017 07:00:36 -0800
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Feb 2017 07:00:34 -0800
Message-Id: <1487516434-3530-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487516434-3530-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1487516434-3530-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] depmodwrapper-cross/qemuwrapper-cross: Drop unneeded binutils dependency
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
X-List-Received-Date: Sun, 19 Feb 2017 15:00:50 -0000

By default these pull in binutils-cross since they're a cross tool
and pull in any native tool requirements. In reality they don't
need such tools at build time or runtime since they're scripts.

Therefore clear the dependency and save on some processing time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb | 2 ++
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index b86400b..e40cdaf 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -7,6 +7,8 @@ DEPENDS += "qemu-native"
 
 inherit qemu
 
+do_populate_sysroot[depends] = ""
+
 do_install () {
 	install -d ${D}${bindir_crossscripts}/
 
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index aa2805b..17a99a4 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -11,6 +11,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SSTATE_SCAN_FILES += "depmodwrapper"
 EXTRA_STAGING_FIXMES = "PKGDATA_DIR"
 
+do_populate_sysroot[depends] = ""
+
 do_install() {
 	install -d ${D}${bindir_crossscripts}/
 
-- 
2.7.4


