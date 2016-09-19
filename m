Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C73556FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 20:25:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8JKP6ig016989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 13:25:07 -0700 (PDT)
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 19 Sep 2016 13:25:06 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2016 16:22:18 -0400
Message-ID: <1474316538-7482-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [v2] e2fsprogs: add packageconfig for -file-
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
X-List-Received-Date: Mon, 19 Sep 2016 20:25:08 -0000
Content-Type: text/plain

Without a packageconfig dependency for the file utility, there's
a rare compile faiure caused by a race where the magic.h
header file is not found:

 ../../../git/lib/support/plausible.c:33:19: fatal error: magic.h: No such file or directory

This file, plausible.c, is part of libsupport.a which is used by
many binaries produced by the e2fsprogs package. plausible.c attempts
to dynamically load libmagic.so if the e2fsprogs configure detects
that magic was available. Adding the packageconfig will eliminate
the compile-time as well as the possible configure-time race condition.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
index f4855bc..0d7a42b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
@@ -22,7 +22,8 @@ EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
 
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "file"
+PACKAGECONFIG[file] = ',,file'
 PACKAGECONFIG[fuse] = '--enable-fuse2fs,--disable-fuse2fs,fuse'
 
 do_configure_prepend () {
-- 
1.9.1


