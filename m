Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1845D77254
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 04:08:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8548Gxn023893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Sep 2016 21:08:17 -0700 (PDT)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Sun, 4 Sep 2016 21:08:14 -0700
From: Zhixiong Chi <Zhixiong.Chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Sep 2016 12:08:13 +0800
Message-ID: <1473048493-13773-1-git-send-email-Zhixiong.Chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] rpm: ensure rpm2cpio call rpm relocation code
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
X-List-Received-Date: Mon, 05 Sep 2016 04:08:20 -0000
Content-Type: text/plain

We need to call rpmcliInit to ensure the rpm relocation code is called.
when we allow rpm2cpio to be relocatable, The adjusted path used to find
the macro files was being built into the binary and this path was valid
for the machine it was built on and some of our other build machines,
but invalid on some others, and was not being properly overridden at
runtime.

when we export the wrsdk and source the sdk, then execute rpm2cpio xxx.rpm|cpio -t.
we will get the following error :
"rpm-5.4.14/rpmdb/dbconfig.c:493:
db3New: Assertion `dbOpts != ((void *)0) && *dbOpts != '\0'' failed.

Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
---
 ...-ensure-rpm2cpio-call-rpm-relocation-code.patch | 25 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch b/meta/recipes-devtools/rpm/rpm/rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch
new file mode 100644
index 0000000..63af100
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch
@@ -0,0 +1,25 @@
+We need to call rpmcliInit to ensure the rpm relocation code is called
+and it correctly honours the relocation environmental variables.
+
+when we export the wrsdk and source the sdk, then execute rpm2cpio xxx.rpm|cpio -t.
+we will get the following error :
+"rpm-5.4.14/rpmdb/dbconfig.c:493:
+db3New: Assertion `dbOpts != ((void *)0) && *dbOpts != '\0'' failed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: rpm-5.4.15/tools/rpm2cpio.c
+===================================================================
+--- rpm-5.4.15.orig/tools/rpm2cpio.c	2012-04-27 01:46:51.000000000 +0800
++++ rpm-5.4.15/tools/rpm2cpio.c	2016-09-05 11:07:30.419903338 +0800
+@@ -87,6 +87,8 @@
+ #endif
+ 	(void) rpmtsSetVSFlags(ts, vsflags);
+ 
++	rpmcliInit(argc, argv, NULL);
++
+ 	/*@-mustmod@*/      /* LCL: segfault */
+ 	rc = rpmReadPackageFile(ts, fdi, "rpm2cpio", &h);
+ 	/*@=mustmod@*/
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 84adef6..55acd25 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -118,6 +118,7 @@ SRC_URI += " \
 	   file://0001-Disable-__sync_add_and_fetch_8-on-nios2.patch \
 	   file://gcc6-stdlib.patch \
 	   file://0001-system.h-query.c-support-nosignature.patch \
+	   file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch \
 "
 
 # OE specific changes
-- 
1.9.1


