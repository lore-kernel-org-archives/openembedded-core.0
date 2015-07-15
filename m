Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6272C7391D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 07:04:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6F742gW022345
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 00:04:02 -0700 (PDT)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Wed, 15 Jul 2015 00:04:01 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jul 2015 15:04:02 +0800
Message-ID: <1436943842-17512-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] rpm: fix segment fault in lib/psm.c
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
X-List-Received-Date: Wed, 15 Jul 2015 07:04:04 -0000
Content-Type: text/plain

Add null pointer checking for rpmpsmStage() function in lib/psm.c

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../rpm/rpm/rpm-fix-segment-fault-in-psm.patch     | 34 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-segment-fault-in-psm.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-segment-fault-in-psm.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-segment-fault-in-psm.patch
new file mode 100644
index 0000000..e78ec4f
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fix-segment-fault-in-psm.patch
@@ -0,0 +1,34 @@
+Summary: rpm: fix segment fault in psm.c
+
+When rpmtsGetRdb(ts) retrun NULL, it will output segment fault.
+
+Upstream-status: pending
+    
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: rpm-5.4.14/lib/psm.c
+===================================================================
+--- rpm-5.4.14.orig/lib/psm.c	2015-06-18 10:57:15.949529544 +0800
++++ rpm-5.4.14/lib/psm.c	2015-07-15 14:56:13.362911386 +0800
+@@ -3026,13 +3026,15 @@
+ 	     rc = rpmpsmNext(psm, PSM_CHROOT_OUT);
+ #endif
+ 
+-	xx = rpmtxnBegin(rpmtsGetRdb(ts), _parent, NULL);
+-	rc = runInstScript(psm);
+-	if (rc)
+-	     xx = rpmtxnAbort(rpmtsGetRdb(ts)->db_txn);
+-	else
+-	     xx = rpmtxnCommit(rpmtsGetRdb(ts)->db_txn);
+-	rpmtsGetRdb(ts)->db_txn = NULL;
++	if (rpmtsGetRdb(ts)) {
++	    xx = rpmtxnBegin(rpmtsGetRdb(ts), _parent, NULL);
++	    rc = runInstScript(psm);
++	    if (rc)
++		xx = rpmtxnAbort(rpmtsGetRdb(ts)->db_txn);
++	    else
++		xx = rpmtxnCommit(rpmtsGetRdb(ts)->db_txn);
++	    rpmtsGetRdb(ts)->db_txn = NULL;
++	}
+ #ifdef RPM_VENDOR_OE
+ 	if (scriptletWrapper && *scriptletWrapper)
+ 	     rc = rpmpsmNext(psm, PSM_CHROOT_IN);
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index fb81f12..3314da8 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -93,6 +93,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
 	   file://no-ldflags-in-pkgconfig.patch \
 	   file://rpm-lua-fix-print.patch \
+	   file://rpm-fix-segment-fault-in-psm.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.9.1


