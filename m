Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1CEC433FE
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:34 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iSZpFt/q;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118393; x=1674654393;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=c/uysYOS+QF2WotYgbXx5FQq1Ncp6tZ2hY1Onva6csU=;
  b=iSZpFt/qWsJHcRiRV5uZqfF3ah9tyT3sFdHHg/+Mk3ZzYT+VXK1h3JFk
   D1LvO9YzHosNd13kJGW1weY8UmO8rpP31b7neVD9waiSMLDD73lEkq+T/
   E2NWTyGYtuLnXjzWGhDueRdq0/ZnFs66yk98V4AAi3xhiE+DNQxTPMsat
   FsBvlBDtqzChxuw5mVOCtqR64DswUFMCEsjwfppKMzalY4ZPR9Tlfxfgg
   IFj8Nimc8GjyUmw0+Y3OU9QmJEKBMkMOnKKyJ+lts3bGhIjibAQRSKe5e
   9KPV2sOfWk/bKYzT3inGVB9o8ospmoAcmC+WySjghCHezRPLoXR6KG62o
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016434"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016434"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494303"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:32 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/13] pigz: fix one failure of command "unpigz -l"
Date: Tue, 25 Jan 2022 21:45:55 +0800
Message-Id: 
 <b8e0bcecce31af29d04d4b694ebddb33b1e5710a.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160922

From: Changqing Li <changqing.li@windriver.com>

Refer [1], "unpigz -l" failed with error:
$ ./unpigz -l test.txt.gz
compressed original reduced name
228799 209715200 99.9% test.txt
unpigz: can't destroy locked resource (pigz.c:2622:mutex_destroy)
unpigz: abort: internal threads error

or

$ ./unpigz -l test.txt.gz
unpigz: skipping: test.txt.gz unrecognized format
unpigz: can't destroy locked resource (pigz.c:2622:mutex_destroy)
unpigz: abort: internal threads error

[1] https://github.com/madler/pigz/issues/96

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...0001-Fix-bug-when-combining-l-with-d.patch | 50 +++++++++++++++++++
 meta/recipes-extended/pigz/pigz_2.6.bb        |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch

diff --git a/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch b/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
new file mode 100644
index 0000000000..9c301f2054
--- /dev/null
+++ b/meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
@@ -0,0 +1,50 @@
+From 65986f3d12d434b9bc428ceb6fcb1f6eeeb2c47d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 17 Jan 2022 15:36:56 +0800
+Subject: [PATCH] Fix bug when combining -l with -d.
+
+Though it makes no sense to do pigz -ld, that is implicit when
+doing unpigz -l. This commit fixes a bug for that combination.
+
+Upstream-Status: Backport [https://github.com/madler/pigz/commit/326bba44aa102c707dd6ebcd2fc3f413b3119db0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ pigz.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/pigz.c b/pigz.c
+index f90157f..d648216 100644
+--- a/pigz.c
++++ b/pigz.c
+@@ -4007,6 +4007,13 @@ local void process(char *path) {
+     }
+     SET_BINARY_MODE(g.ind);
+ 
++    // if requested, just list information about the input file
++    if (g.list && g.decode != 2) {
++        list_info();
++        load_end();
++        return;
++    }
++
+     // if decoding or testing, try to read gzip header
+     if (g.decode) {
+         in_init();
+@@ -4048,13 +4055,6 @@ local void process(char *path) {
+         }
+     }
+ 
+-    // if requested, just list information about input file
+-    if (g.list) {
+-        list_info();
+-        load_end();
+-        return;
+-    }
+-
+     // create output file out, descriptor outd
+     if (path == NULL || g.pipeout) {
+         // write to stdout
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/pigz/pigz_2.6.bb b/meta/recipes-extended/pigz/pigz_2.6.bb
index 3566e18b7e..d490a6a722 100644
--- a/meta/recipes-extended/pigz/pigz_2.6.bb
+++ b/meta/recipes-extended/pigz/pigz_2.6.bb
@@ -8,7 +8,8 @@ SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
-SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
+SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz \
+           file://0001-Fix-bug-when-combining-l-with-d.patch"
 SRC_URI[sha256sum] = "2eed7b0d7449d1d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d"
 PROVIDES:class-native += "gzip-native"
 
-- 
2.34.1


