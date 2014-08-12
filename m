Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob13.myregisteredsite.com
	(atl4mhob13.myregisteredsite.com [209.17.115.51])
	by mail.openembedded.org (Postfix) with ESMTP id B000462252
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:55:12 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.206])
	by atl4mhob13.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	s7C7tAup021894 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 03:55:10 -0400
Received: (qmail 2346 invoked by uid 0); 12 Aug 2014 07:55:10 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 12 Aug 2014 07:55:10 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Aug 2014 09:54:58 +0200
Message-Id: <1407830099-17923-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407753199.22187.4.camel@ted>
References: <1407753199.22187.4.camel@ted>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2 1/2] squashfs-tools: Add support for LZO and LZ4 compression
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
X-List-Received-Date: Tue, 12 Aug 2014 07:55:17 -0000

For systems that want to optimize for speed rather than size, LZO is
usually a better choice than gzip or XZ. Kernel support for LZO has
been available since 2.6.29.

LZ4 support isn't in the mainline kernel yet, but we might as well add
it now for those who want to experiment with it.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 .../squashfs-tools/squashfs-tools_4.3.bb           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
index 54fd3bb..e3783fd 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2 & PD"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
                    "
-DEPENDS = "attr zlib xz"
+DEPENDS = "attr zlib xz lzo lz4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
            http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
@@ -23,7 +23,7 @@ S = "${WORKDIR}/squashfs${PV}/squashfs-tools"
 # EXTRA_OEMAKE is typically: -e MAKEFLAGS=
 # the -e causes problems as CFLAGS is modified in the Makefile, so
 # we redefine EXTRA_OEMAKE here
-EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1"
+EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1 LZO_SUPPORT=1 LZ4_SUPPORT=1"
 
 do_compile() {
         oe_runmake mksquashfs
-- 
1.7.9.5


