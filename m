Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B38E775574
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 11:55:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5EBtWPK003047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 04:55:48 -0700
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 14 Jun 2018 04:55:22 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2018 14:55:21 +0300
Message-ID: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/1] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Thu, 14 Jun 2018 11:55:57 -0000
Content-Type: text/plain

The swpb in macro MUTEX_SET will cause "undefined instruction" error
on the new arm arches which don't support this assembly instruction
any more. If use ldrex/strex to replace swpb, the old arm arches don't
support them. So to avoid this issue, just disable the ARM assembler
mutex code, and use the default pthreads mutex.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 093ee44909..15b4155a29 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -59,18 +59,7 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
 # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
 DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
 
-EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot"
-
-# Override the MUTEX setting here, the POSIX library is
-# the default - "POSIX/pthreads/library".
-# Don't ignore the nice SWP instruction on the ARM:
-# These enable the ARM assembler mutex code, this won't
-# work with thumb compilation...
-ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
-MUTEX = ""
-MUTEX_arm = "${ARM_MUTEX}"
-MUTEX_armeb = "${ARM_MUTEX}"
-EXTRA_OECONF += "${MUTEX} STRIP=true"
+EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot STRIP=true"
 EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
 
 EXTRA_AUTORECONF += "--exclude=autoheader  -I ${S}/dist/aclocal -I${S}/dist/aclocal_java"
-- 
2.17.1


