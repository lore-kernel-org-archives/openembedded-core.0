Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBE2719CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 09:08:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA4982G9024437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Nov 2016 02:08:03 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Fri, 4 Nov 2016 02:08:01 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Nov 2016 17:07:19 +0800
Message-ID: <20161104090719.30795-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 04 Nov 2016 09:08:02 -0000
Content-Type: text/plain

The swpb in macro MUTEX_SET will cause "undefined instruction" error
on the new arm arches which don't support this assembly instruction
any more. If use ldrex/strex to replace swpb, the old arm arches don't
support them. So to avoid this issue, just disable the ARM assembler
mutex code, and use the default pthreads mutex.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-support/db/db_6.0.30.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index 50a469b..2d08b5e 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -74,15 +74,6 @@ DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disabl
 
 EXTRA_OECONF = "${DB6_CONFIG} --enable-shared --enable-cxx --with-sysroot"
 
-# Override the MUTEX setting here, the POSIX library is
-# the default - "POSIX/pthreads/library".
-# Don't ignore the nice SWP instruction on the ARM:
-# These enable the ARM assembler mutex code
-ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
-MUTEX = ""
-MUTEX_arm = "${ARM_MUTEX}"
-MUTEX_armeb = "${ARM_MUTEX}"
-EXTRA_OECONF += "${MUTEX}"
 EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
 # Cancel the site stuff - it's set for db3 and destroys the
-- 
2.9.3


