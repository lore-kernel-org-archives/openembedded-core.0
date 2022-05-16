Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6E7C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 10:42:19 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.27000.1652697729796199226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 03:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24GAg8LP012403
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 03:42:08 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 16 May 2022 03:42:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 16 May 2022 03:42:07 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 16 May 2022 03:42:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] squashfs-tools: always install prebuilt manpage
Date: Mon, 16 May 2022 18:42:06 +0800
Message-ID: <20220516104207.1734099-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 10:42:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165674

From: Changqing Li <changqing.li@windriver.com>

When other feature enabled, and involve help2man into squashfs-tools's
recipe-sysroot-native, install-manpages.sh will run target binary on
build host, eg: mksquashfs --help, which will cause error.
Eg:
 ../squashfs-tools/mksquashfs: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by ../squashfs-tools/mksquashfs)
| help2man: can't get `--help' info from /tmp/tmp.pEG5R8COVb/mksquashfs.sh
| Try `--no-discard-stderr' if option outputs to stderr
| ./mksquashfs-manpage.sh: help2man returned error.  Aborting
| ../generate-manpages/install-manpages.sh: Failed to generate manpage.  Aborting

Fixed by always install prebuilt manpage, avoid running target binary on
build host

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ools-always-install-prebuilt-manpage.patch | 48 +++++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-always-install-prebuilt-manpage.patch

diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-always-install-prebuilt-manpage.patch b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-always-install-prebuilt-manpage.patch
new file mode 100644
index 0000000000..2d0b350074
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-always-install-prebuilt-manpage.patch
@@ -0,0 +1,48 @@
+From 9bf47880ebb0fafd36226ac7fd1c2e8dffc9bc64 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 16 May 2022 17:57:07 +0800
+Subject: [PATCH] squashfs-tools: always install prebuilt manpage
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ generate-manpages/install-manpages.sh | 22 +++++-----------------
+ 1 file changed, 5 insertions(+), 17 deletions(-)
+
+diff --git a/generate-manpages/install-manpages.sh b/generate-manpages/install-manpages.sh
+index 6a43b89..770f15a 100755
+--- a/generate-manpages/install-manpages.sh
++++ b/generate-manpages/install-manpages.sh
+@@ -27,23 +27,11 @@ cd $1/generate-manpages
+ #
+ # If help2man doesn't exist, use the pre-built manpages.
+ 
+-if ! which help2man > /dev/null 2>&1; then
+-	echo "$0: ERROR - No help2man in PATH.  Cannot generate manpages." >&2
+-	echo "WARNING: Installing pre-built manpages." >&2
+-	echo "WARNING: These pages are built with the Makefile defaults, and all" >&2
+-	echo "WARNING: the compressors configured (except the deprecated lzma).  This may not" >&2
+-	echo "WARNING: match your build configuation." >&2
+-	source=../manpages
+-else
+-	for i in mksquashfs unsquashfs sqfstar sqfscat; do
+-		if ! ./$i-manpage.sh ../squashfs-tools ../squashfs-tools/$i.1; then
+-			echo "$0: Failed to generate manpage.  Aborting" >&2
+-			exit 1
+-		fi
+-	done
+-
+-	source=../squashfs-tools
+-fi
++echo "WARNING: Installing pre-built manpages." >&2
++echo "WARNING: These pages are built with the Makefile defaults, and all" >&2
++echo "WARNING: the compressors configured (except the deprecated lzma).  This may not" >&2
++echo "WARNING: match your build configuation." >&2
++source=../manpages
+ 
+ if ! mkdir -p $2; then
+ 	echo "$0: Creating manpage install directory failed.  Aborting" >&2
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 4e009d2625..3726650e3c 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -11,6 +11,7 @@ PV = "4.5.1"
 SRCREV = "afdd63fc386919b4aa40d573b0a6069414d14317"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master \
            file://0001-install-manpages.sh-do-not-write-original-timestamps.patch \
+           file://0001-squashfs-tools-always-install-prebuilt-manpage.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.25.1


