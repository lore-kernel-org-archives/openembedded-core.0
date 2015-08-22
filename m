Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0CB60657
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 21:59:10 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so41352624wic.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ey14g7MzQfbuehnKKBaL1L6m8CohH0wnWIDH44NCHS4=;
	b=pa+h7/tvQ3wiJoQdw7wFiaOJkrHGSlS8A3mPR19EEUtePUU4GFvIXUPL8vzfvn1Y+6
	cWmFUlPgrTfzFWaBSsvCIx8+gKB0gOItbE6AVcJeVIi1UA79K+qCgolYsOX2sCiep+w0
	l87Caij29jk4gLurRZc+Axw3zHCAb7YzcGsuQq8j6+716y99oAUS0bQWWDSm1w9ptg8R
	GE2qdfbp9fgye/27jdwVEJhVTAG4eCZzJgkvAYwsf5+nYFpXxTBu8K+tcmCbax8vQRx1
	p68MzYRi2M5dTGi5IDaz951U6bt6PTSxzA4pI4jI7bfio5vnalyFFEIc/HMQ3f2iH58E
	wo8A==
X-Received: by 10.180.99.71 with SMTP id eo7mr17174597wib.25.1440280750866;
	Sat, 22 Aug 2015 14:59:10 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host167-191-dynamic.52-82-r.retail.telecomitalia.it.
	[82.52.191.167]) by smtp.gmail.com with ESMTPSA id
	bu12sm16007970wjb.44.2015.08.22.14.59.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Aug 2015 14:59:10 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Aug 2015 23:59:06 +0200
Message-Id: <1440280746-11401-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] mtd-utils: disable xattr if DISTRO_FEATURES doesn't contain acl
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
X-List-Received-Date: Sat, 22 Aug 2015 21:59:14 -0000

After commit 24fde4d do_compile fails:

| mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
|  #include <sys/acl.h>

This is a missing dependency on acl.
To fix this we add a check to disable xattr when acl is not in
DISTRO_FEATURES.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 8d4892a..6a388c8 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -19,7 +19,8 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
 
 S = "${WORKDIR}/git/"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include' 'BUILDDIR=${S}'"
+DISABLE_XATTR = "${@bb.utils.contains('DISTRO_FEATURES', 'acl', '', '-DWITHOUT_XATTR', d)}"
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include ${DISABLE_XATTR}' 'BUILDDIR=${S}'"
 
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-- 
1.9.1


