Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D237B71951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 07:13:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w127D8OC006656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 23:13:08 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 1 Feb 2018 23:13:07 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 15:10:33 +0800
Message-ID: <86eb9d4ef2d932ef855c2ddba1ad0304a5c71dbb.1517555249.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1517555249.git.jackie.huang@windriver.com>
References: <cover.1517555249.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] e2fsprogs: only quiet debugfs for native package
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
X-List-Received-Date: Fri, 02 Feb 2018 07:13:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Many test cases expect the output of running commands for debugfs,
the patch quiet-debugfs.patch suppress the output so ptest failed:
| 292 tests succeeded   47 tests failed

The patch was meant to suppress the output in do_rootfs according
to the original commit:
======================
commit 13a8d3869b0fe0ebdddcee37fb48c5b9cdf718ba
Author: Ross Burton <ross.burton@intel.com>
Date: Mon Dec 23 13:38:34 2013 +0000

    e2fsprogs: silence debugfs

    debugfs echos the commands when it is executing a script, but as the scripts
    used at rootfs time are long this massively inflates the do_rootfs log.

    Comment out the echo so that the rootfs isn't 20K lines longer than it needs to
    be.

    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
======================

So only apply the patch for native package, then the ptest will
be pass for target package.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
index b5cfc6810b..a53585db47 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
@@ -1,7 +1,6 @@
 require e2fsprogs.inc
 
 SRC_URI += "file://remove.ldconfig.call.patch \
-            file://quiet-debugfs.patch \
             file://run-ptest \
             file://ptest.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
@@ -10,7 +9,9 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch \
             "
 
-SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
+SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
+                                file://quiet-debugfs.patch \
+"
 
 SRCREV = "af2eac481cf426c05ae12b946396980e16c8ab19"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
-- 
2.11.0


