Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AC9C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 10:05:35 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.13660.1636711534011390187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 02:05:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1ACA5WOd013690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 02:05:32 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 12 Nov 2021 02:05:31 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 02:05:31 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 12 Nov 2021 02:05:30 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] util-linux: fix tabfiles-tags case failure
Date: Fri, 12 Nov 2021 18:03:33 +0800
Message-ID: <20211112100333.13948-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 10:05:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158214

From: Mingli Yu <mingli.yu@windriver.com>

Pass "--use-system-commands" option when run tabfiles-tags case as
we don't deploy the command under /usr/lib64/util-linux/ptest folder
by default.
 Fixes:
 # cd /usr/lib64/util-linux/ptest/
 # ./tests/ts/libmount/tabfiles-tags
 [snip]
 ./ts/libmount/../../functions.sh: line 652: /usr/lib64/util-linux/ptest/blkid: No such file or directory
 FAILED (libmount/tabfiles-tags)'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...-tags-add-use-system-commands-option.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1e3cd28801..6aebe22036 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,6 +35,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://0001-tabfiles-tags-add-use-system-commands-option.patch \
            "
 
 SRC_URI[sha256sum] = "6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch b/meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch
new file mode 100644
index 0000000000..9f5a3c2d02
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch
@@ -0,0 +1,35 @@
+From be3ecff8b1bc1de4d29ca6381ee9ab42e6c15947 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 12 Nov 2021 15:33:53 +0800
+Subject: [PATCH] tabfiles-tags: add use-system-commands option
+
+Pass --use-system-commands option to make blkid command available
+Fixes:
+ # ./ts/libmount/tabfiles-tags
+ [snip]
+ ./ts/libmount/../../functions.sh: line 652: /usr/lib64/util-linux/ptest/blkid: No such file or directory
+ FAILED (libmount/tabfiles-tags)'
+
+Upstream-Status: Inappropriate [configuration specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/ts/libmount/tabfiles-tags | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/ts/libmount/tabfiles-tags b/tests/ts/libmount/tabfiles-tags
+index 69b06a9..17176ef 100755
+--- a/tests/ts/libmount/tabfiles-tags
++++ b/tests/ts/libmount/tabfiles-tags
+@@ -4,7 +4,7 @@ TS_TOPDIR="${0%/*}/../.."
+ TS_DESC="tags"
+ 
+ . $TS_TOPDIR/functions.sh
+-ts_init "$*"
++ts_init "$* --use-system-commands"
+ 
+ ts_skip_nonroot
+ 
+-- 
+2.17.1
+
-- 
2.17.1


