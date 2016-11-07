Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA66719CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 03:02:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA732nL8000628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Nov 2016 19:02:49 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 6 Nov 2016 19:02:47 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 11:02:16 +0800
Message-ID: <1478487736-115662-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH version2] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Mon, 07 Nov 2016 03:02:48 -0000
Content-Type: text/plain

The swpb in macro MUTEX_SET will cause "undefined instruction" error
on the new arm arches which don't support this assembly instruction
any more. If use ldrex/strex to replace swpb, the old arm arches don't
support them. So to avoid this issue, just disable the ARM assembler
mutex code, and use the default pthreads mutex.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-support/db/db_6.0.35.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-support/db/db_6.0.35.bb b/meta/recipes-support/db/db_6.0.35.bb
index f60edf9..b1bec0e 100644
--- a/meta/recipes-support/db/db_6.0.35.bb
+++ b/meta/recipes-support/db/db_6.0.35.bb
@@ -77,15 +77,6 @@ do_configure() {
 	oe_runconf
 }
 
-# Override the MUTEX setting here, the POSIX library is
-# the default - "POSIX/pthreads/library".
-# Don't ignore the nice SWP instruction on the ARM:
-# These enable the ARM assembler mutex code
-ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
-MUTEX = ""
-MUTEX_arm = "${ARM_MUTEX}"
-MUTEX_armeb = "${ARM_MUTEX}"
-EXTRA_OECONF += "${MUTEX}"
 EXTRA_OEMAKE_append_class-target = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 EXTRA_OEMAKE += "STRIP=true docdir=${docdir}/db/"
 
-- 
1.9.1


