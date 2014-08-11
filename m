Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob14.myregisteredsite.com
	(atl4mhob14.myregisteredsite.com [209.17.115.52])
	by mail.openembedded.org (Postfix) with ESMTP id 76B1F65E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:12:05 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.208])
	by atl4mhob14.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	s7BAC48e020791 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 06:12:04 -0400
Received: (qmail 15990 invoked by uid 0); 11 Aug 2014 10:12:04 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 11 Aug 2014 10:12:04 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 12:11:59 +0200
Message-Id: <1407751920-9684-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 1/2] squashfs-tools: Enable LZO support
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
X-List-Received-Date: Mon, 11 Aug 2014 10:12:11 -0000

For systems looking for speed rather than size (e.g. booting from serial NOR
flash) LZO is usually a good tradeoff, and usually boots faster than gzip
or even an uncompressed filesystem.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 .../squashfs-tools/squashfs-tools_4.2.bb           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
index 57400cd..1ded2c9 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2 & PD"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
                    "
-DEPENDS = "attr zlib xz"
+DEPENDS = "attr zlib xz lzo"
 PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
@@ -27,7 +27,7 @@ S = "${WORKDIR}/squashfs${PV}/squashfs-tools"
 # EXTRA_OEMAKE is typically: -e MAKEFLAGS=
 # the -e causes problems as CFLAGS is modified in the Makefile, so
 # we redefine EXTRA_OEMAKE here
-EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1"
+EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. LZO_SUPPORT=1 XZ_SUPPORT=1"
 
 do_compile() {
         oe_runmake mksquashfs
-- 
1.7.9.5


