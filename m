Return-Path: <tristan.vanberkom@codethink.co.uk>
Received: from imap0.codethink.co.uk (imap0.codethink.co.uk [185.43.218.159])
	by mail.openembedded.org (Postfix) with ESMTP id BE2BA77CAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 12:42:09 +0000 (UTC)
Received: from imap1.codethink.co.uk ([176.9.8.82])
	by imap0.codethink.co.uk with esmtps (Exim 4.84_2 #1 (Debian))
	id 1ctCvQ-0003ga-HD for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:42:09 +0100
Received: from [114.207.54.40] (helo=think)
	by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
	id 1ctCvN-0002oc-Sa for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:42:08 +0100
Message-ID: <1490791319.18519.23.camel@codethink.co.uk>
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 21:41:59 +0900
Organization: Codethink
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: [PATCHv3] libjpeg-turbo: fix build on aarch64 or non-intel build hosts
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
X-List-Received-Date: Wed, 29 Mar 2017 12:42:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From f54c719dc0ca3444bc579663b7326d016bf2e1e7 Mon Sep 17 00:00:00 2001
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
Date: Fri, 24 Mar 2017 15:37:36 +0000
Subject: [PATCH] libjpeg-turbo: Support building on non intel targets.

nasm is intel specific, however libjpeg-turbo is still desirable
on other architectures.

Without this patch, it would seem that nasm is built on an intel
host and then ignored when compiling libjpeg-turbo for an arm target,
however it has libjpeg-turbo requiring nasm be built when building
on an arm/aarch64 host.

This fixes the issue so that nasm-native is not required on the host
when building for an aarch64 target.

Signed-off-by: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
index 70d38f4a1a..a650d6af2d 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=05bab7c7ad899d85bfba60da1a127
                     file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72 \
                     file://djpeg.c;endline=11;md5=b90b6d2b4119f9e5807cd273f525d2af \
 "
-DEPENDS = "nasm-native"
+DEPENDS_append_x86-64 = " nasm-native"
+DEPENDS_append_x86    = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://fix-mips.patch"
-- 
2.11.0


