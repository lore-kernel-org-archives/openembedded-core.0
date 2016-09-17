Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F03506FFF7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 01:39:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8H1duY9019744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 18:39:56 -0700 (PDT)
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 16 Sep 2016 18:39:55 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2016 21:37:07 -0400
Message-ID: <1474076227-17032-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: add packageconfig for -file-
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
X-List-Received-Date: Sat, 17 Sep 2016 01:39:57 -0000
Content-Type: text/plain

Without a packageconfig dependency for the file utility, there's
a very rare compile faiure caused by a race where the magic.h
header file is not found:

 ../../../git/lib/support/plausible.c:33:19: fatal error: magic.h: No such file or directory

This file, plausible.c, is part of libsupport.a which is used by
many binaries produced by the e2fsprogs package. plausible.c attempts
to dynamically load libmagic.so if the e2fsprogs configure detects
that magic was available. Adding the packageconfig will eliminate
the build as well as the possible configure-time race condition.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
index f4855bc..1707cb9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
@@ -23,6 +23,7 @@ EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[file] = ',,file'
 PACKAGECONFIG[fuse] = '--enable-fuse2fs,--disable-fuse2fs,fuse'
 
 do_configure_prepend () {
-- 
1.9.1


