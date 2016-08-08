Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 497 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Aug 2016 10:04:28 UTC
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3CA770CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 10:04:28 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id BB494392; Mon,  8 Aug 2016 11:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 8B1D21CF;
	Mon,  8 Aug 2016 11:56:11 +0200 (CEST)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 11:56:09 +0200
Message-Id: <1470650169-5252-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.8.1
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH] dpkg: Avoid automatic target architecture detection
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
X-List-Received-Date: Mon, 08 Aug 2016 10:04:29 -0000

dpkg is using a script (dpkg-architecture.pl) to detect the target
architecture automatically.
Unfortunately, it is using the cross compiler prefix to do the detection
and for ARM, oe-core is using <vendor>-linux-gnueabi for toolchains with
and without call-convention hard. The script then always detects
'armel' and never gets 'armhf' for call-convention hard.

This solves:
dpkg: error processing archive evtest_1.32+0+b8343ec112-r0_armhf.deb (--install):
 package architecture (armhf) does not match system (armel)
 Errors were encountered while processing:
 evtest_1.32+0+b8343ec112-r0_armhf.deb

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 440a500..1f29113 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -35,6 +35,7 @@ EXTRA_OECONF = "\
 		"
 
 EXTRA_OECONF += "TAR=tar"
+EXTRA_OECONF += "DEB_HOST_ARCH=${DPKG_ARCH}"
 
 do_configure () {
     echo >> ${S}/m4/compiler.m4
-- 
1.9.1


