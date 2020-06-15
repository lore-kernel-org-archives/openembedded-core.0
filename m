Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.9200.1592188041025478909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 19:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,513,1583164800"; 
   d="scan'208";a="94483513"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 10:27:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 082384CE26DE
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 10:27:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 10:27:09 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] ethtool:upgrade 5.6 -> 5.7
Date: Mon, 15 Jun 2020 22:25:18 +0800
Message-ID: <1592231118-3427-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 082384CE26DE.A2C8D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

fix-printf.patch
Removed since this is included in 5.7

Refresh the following patch:
avoid_parallel_tests.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../ethtool/avoid_parallel_tests.patch        |  2 +-
 .../ethtool/ethtool/fix-printf.patch          | 32 -------------------
 .../{ethtool_5.6.bb => ethtool_5.7.bb}        |  3 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-extended/ethtool/ethtool/fix-printf.patch
 rename meta/recipes-extended/ethtool/{ethtool_5.6.bb => ethtool_5.7.bb} (90%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 2f2d04ca07..8ecfde1417 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index 1169b7f..ed82524 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.6, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.7, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool/fix-printf.patch b/meta/recipes-extended/ethtool/ethtool/fix-printf.patch
deleted file mode 100644
index 9effa4f3f4..0000000000
--- a/meta/recipes-extended/ethtool/ethtool/fix-printf.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8dcdb3d22a66f18770e5566c0e72e86a0701aeac Mon Sep 17 00:00:00 2001
-From: Robert Scheck <robert@fedoraproject.org>
-Date: Tue, 12 May 2020 20:33:12 +0200
-Subject: Rewrite printf() due to -Werror=format-security
-
-Avoid -Werror=format-security leading to: netlink/settings.c:378:2: error:
-format not a string literal and no format arguments [-Werror=format-security]
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Robert Scheck <robert@fedoraproject.org>
-Signed-off-by: John W. Linville <linville@tuxdriver.com>
----
- netlink/settings.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/netlink/settings.c b/netlink/settings.c
-index c8a911d..0212465 100644
---- a/netlink/settings.c
-+++ b/netlink/settings.c
-@@ -375,7 +375,7 @@ static int dump_link_modes(struct nl_context *nlctx,
- after:
- 	if (first && if_none)
- 		printf("%s", if_none);
--	printf(after);
-+	printf("%s", after);
- 
- 	return 0;
- err:
--- 
-cgit 1.2.3-1.el7
-
diff --git a/meta/recipes-extended/ethtool/ethtool_5.6.bb b/meta/recipes-extended/ethtool/ethtool_5.7.bb
similarity index 90%
rename from meta/recipes-extended/ethtool/ethtool_5.6.bb
rename to meta/recipes-extended/ethtool/ethtool_5.7.bb
index eda32c877c..d9fc30cb55 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.6.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.7.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest \
            file://avoid_parallel_tests.patch \
-           file://fix-printf.patch \
            "
 
-SRC_URI[sha256sum] = "e904e980294baf5878df410ebcf1d660497ba19bc3a77f798a04dba569f44a7e"
+SRC_URI[sha256sum] = "c2e16f8bf510c5822f8e25061c2533972308a421767c54abcacb1038b08bb782"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.17.1



