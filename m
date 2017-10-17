Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id C6FE86074F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 23:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F85D20A3B;
	Tue, 17 Oct 2017 23:51:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rZUSVbSS_Jwl; Tue, 17 Oct 2017 23:51:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4E52F204B1;
	Tue, 17 Oct 2017 23:51:40 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C7C861626FE;
	Tue, 17 Oct 2017 19:51:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Oct 2017 19:51:30 -0400
Message-Id: <1508284290-137033-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] wayland-protocols: upgrade to 1.11
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
X-List-Received-Date: Tue, 17 Oct 2017 23:51:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

usesysrootprefixforpkgdatadirvariable.patch was a backport from 1.11,
no longer needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - drop usesysrootprefixforpkgdatadirvariable.patch

This is on top of ross/mut, since usesysrootprefixforpkgdatadirvariable.patch
is not yet in master

 .../usesysrootprefixforpkgdatadirvariable.patch    | 27 ----------------------
 ...protocols_1.10.bb => wayland-protocols_1.11.bb} |  5 ++--
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.10.bb => wayland-protocols_1.11.bb} (80%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch b/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch
deleted file mode 100644
index 0922a4d..0000000
--- a/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 875130ee3cbcf62266901ef4b91b9a0fb6adad43 Mon Sep 17 00:00:00 2001
-From: Tomek Bury <tomek.bury@broadcom.com>
-Date: Fri, 4 Aug 2017 16:16:38 +0100
-Subject: Use sysroot prefix for pkgdatadir variable
-
-The pc_sysroot is automatically added to cflags and libs but not
-to 'pkg-config --variable'
-
-Upstream-Status: Backport [https://cgit.freedesktop.org/wayland/wayland-protocols/commit/?id=875130ee3cbcf62266901ef4b91b9a0fb6adad43]
-
-Reviewed-by: Daniel Stone <daniels@collabora.com>
-
-diff --git a/wayland-protocols.pc.in b/wayland-protocols.pc.in
-index a26744c..379be06 100644
---- a/wayland-protocols.pc.in
-+++ b/wayland-protocols.pc.in
-@@ -1,6 +1,6 @@
- prefix=@prefix@
- datarootdir=@datarootdir@
--pkgdatadir=@datadir@/@PACKAGE@
-+pkgdatadir=${pc_sysrootdir}@datadir@/@PACKAGE@
- 
- Name: Wayland Protocols
- Description: Wayland protocol files
--- 
-cgit v0.10.2
-
diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.11.bb
similarity index 80%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.11.bb
index 1ff12c6..26b0094 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.11.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-	   file://usesysrootprefixforpkgdatadirvariable.patch \
            "
-SRC_URI[md5sum] = "84a7846c2b6a6a3e265fc9be36453e60"
-SRC_URI[sha256sum] = "5719c51d7354864983171c5083e93a72ac99229e2b460c4bb10513de08839c0a"
+SRC_URI[md5sum] = "8d0338556d77ad86d7fca84ff086af88"
+SRC_URI[sha256sum] = "3afcee1d51c5b1d70b59da790c9830b354236324b19b2b7af9683bd3b7be6804"
 
 inherit allarch autotools pkgconfig
 
-- 
2.7.4


