Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web12.33.1612799420265488921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 07:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=EWesomMA;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2616; q=dns/txt; s=iport;
  t=1612799420; x=1614009020;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qm8lMK06KofHVhU+XaQfpLYtTJTxLfPVI8Wr5ChI9IQ=;
  b=EWesomMAxwR9uRxpm2i2zR9RDhyiEc5JWcNClFStmPaVODuCDFckInnY
   7fKK+0DcMZ67T6Me9EwEu+0BMoYDnl0HJ8RtGuD5xhfOkLWHl6uLD8OHD
   CFDxAn39zSTrNKhyvpcQbEgrZJTOYeQfu2PzlauivfOM8dWHv7WR+HzQy
   s=;
X-IronPort-AV: E=Sophos;i="5.81,162,1610409600"; 
   d="scan'208";a="643024903"
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 08 Feb 2021 15:50:19 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 118FiJ79013049
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 8 Feb 2021 15:44:19 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 4BE8DCC1251; Mon,  8 Feb 2021 07:44:19 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [meta-oe][PATCH] libhugetlbfs: improve reproducibility
Date: Mon,  8 Feb 2021 07:44:16 -0800
Message-Id: <20210208154416.2880-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Content-Transfer-Encoding: 8bit

CPPFLAGS was overrided for tests, so we
missing DEBUG_PREFIX_MAP and got absolute
path in binary.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 ...Append-CPPFLAGS-rather-then-override.patch | 31 +++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
new file mode 100644
index 000000000..78a4cb0fc
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
@@ -0,0 +1,31 @@
+From b6dba773491bbb7b4664dacdd87a12af860f1bd8 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Thu, 28 Jan 2021 05:43:33 -0800
+Subject: [PATCH] tests/makefile: Append CPPFLAGS rather then override
+
+CPPFLAGS overrided and we could miss some options needed.
+
+Upstream-Status: Submitted
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ tests/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index 0ca3716..d262932 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -33,8 +33,8 @@ HELPERS = get_hugetlbfs_path compare_kvers
+ HELPER_LIBS = libheapshrink.so
+ BADTOOLCHAIN = bad-toolchain.sh
+ 
+-CFLAGS = -O2 -Wall -g
+-CPPFLAGS = -I..
++CFLAGS += -O2 -Wall -g
++CPPFLAGS += -I..
+ STATIC_LIBHUGE = -Wl,--whole-archive -lhugetlbfs -Wl,--no-whole-archive
+ STATIC_LDLIBS = -Wl,--no-as-needed -lpthread
+ LDLIBS = $(STATIC_LDLIBS) -ldl -lhugetlbfs_privutils
+-- 
+2.26.2.Cisco
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 2f07c938b..fa63316b0 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -26,6 +26,7 @@ SRC_URI = " \
     file://0006-include-limits.h-for-PATH_MAX.patch \
     file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
     file://0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch \
+    file://0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.26.2.Cisco

