Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25075606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 03:16:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7D3GDHc008512
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 20:16:13 -0700 (PDT)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Wed, 12 Aug 2015 20:16:13 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Aug 2015 11:16:29 +0800
Message-ID: <1439435789-2472-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] rpm: opendb before rpmverifyscript to avoid null point input
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
X-List-Received-Date: Thu, 13 Aug 2015 03:16:14 -0000
Content-Type: text/plain

If the command is "rpm -V" and the return value of (headerIsEntry(h, RPMTAG_VERIFYSCRIPT)
|| headerIsEntry(h, RPMTAG_SANITYCHECK)) located in /lib/verify.c is true, it will call
rpmpsmStage function(rpmVerifyScript->rpmpsmScriptStage->rpmpsmStage) and occur segment
fault because of null point(rpmtsGetRdb(ts) == NULL and rpmtsGetRdb(ts)->db_txn).
So we open rpmdb to avoid bad input when find headerIsEntry true.

workflow:
main()->rpmcliVerify()->rpmcliArgIter()->rpmQueryVerify()->rpmgiShowMatches()->showVerifyPackage()->
          rpmqv.c         verify.c        query.c             query.c           verify.c(headerIsEntry)
rpmVerifyScript()->rpmpsmScriptStage()->rpmpsmStage()->    rpmtxnCommit(rpmtsGetRdb(ts)->db_txn);
      verify.c            psm.c             psm.c                 psm.c

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...b-before-verifyscript-to-avoid-null-point.patch | 24 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch b/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch
new file mode 100644
index 0000000..8097e99
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch
@@ -0,0 +1,24 @@
+Subject: rpm: opendb before rpmverifyscript to avoid null point input
+
+If the command is "rpm -V" and the return value of (headerIsEntry(h, RPMTAG_VERIFYSCRIPT) 
+|| headerIsEntry(h, RPMTAG_SANITYCHECK)) located in /lib/verify.c is true, it will call
+rpmpsmStage function(rpmVerifyScript->rpmpsmScriptStage->rpmpsmStage) and occur segment
+fault because of null point(rpmtsGetRdb(ts) == NULL and rpmtsGetRdb(ts)->db_txn).
+So we open rpmdb to avoid bad input when find headerIsEntry true.
+
+Upstrem-Status: Pending
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: rpm-5.4.14/lib/verify.c
+===================================================================
+--- rpm-5.4.14.orig/lib/verify.c	2015-07-22 22:09:59.992895355 +0800
++++ rpm-5.4.14/lib/verify.c	2015-08-13 10:20:33.752177906 +0800
+@@ -613,6 +613,8 @@
+ 	{
+ 	    FD_t fdo = fdDup(STDOUT_FILENO);
+ 
++	    rpmtsOpenDB(ts, O_RDONLY);            /*Open the DB to avoid null point input in function rpmpsmStage()*/
++
+ 	    rc = rpmfiSetHeader(fi, h);
+ 	    if ((rc = rpmVerifyScript(qva, ts, fi, fdo)) != 0)
+ 		ec += rc;
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index ddbdcb9..1f4d9d2 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -95,6 +95,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-lua-fix-print.patch \
 	   file://rpm-check-rootpath-reasonableness.patch \
 	   file://rpm-macros.in-disable-external-key-server.patch \
+	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.9.1


