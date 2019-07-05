Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECA87D3D9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 08:26:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,454,1557158400"; d="scan'208";a="70808062"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jul 2019 16:26:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9F80B4CDB941
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:26:38 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 16:26:49 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jul 2019 16:25:49 +0800
Message-ID: <20190705082549.6330-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 9F80B4CDB941.A9FC3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] util-linux:upgrade 2.33.2 -> 2.34
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
X-List-Received-Date: Fri, 05 Jul 2019 08:26:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from util-linux_2.33.2.bb to util-linux_2.34.bb.

-util-linux/check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch
 Removed since this is included in 2.34.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch        | 16 ----------------
 .../{util-linux_2.33.2.bb => util-linux_2.34.bb}         |  5 ++---
 2 files changed, 2 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch
 rename meta/recipes-core/util-linux/{util-linux_2.33.2.bb => util-linux_2.34.bb} (59%)

diff --git a/meta/recipes-core/util-linux/util-linux/check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch b/meta/recipes-core/util-linux/util-linux/check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch
deleted file mode 100644
index c92c276..0000000
--- a/meta/recipes-core/util-linux/util-linux/check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Checking for exitence of the define is not enough since
-it will be defined with 0 or 1 value
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/sys-utils/ldattach.c
-+++ b/sys-utils/ldattach.c
-@@ -242,7 +242,7 @@ static int my_cfsetspeed(struct termios
- 	 * -- we have to bypass glibc and set the speed manually (because glibc
- 	 *    checks for speed and supports Bxxx bit rates only)...
- 	 */
--#ifdef _HAVE_STRUCT_TERMIOS_C_ISPEED
-+#if _HAVE_STRUCT_TERMIOS_C_ISPEED
- # define BOTHER 0010000		/* non standard rate */
- 	dbg("using non-standard speeds");
- 	ts->c_ospeed = ts->c_ispeed = speed;
diff --git a/meta/recipes-core/util-linux/util-linux_2.33.2.bb b/meta/recipes-core/util-linux/util-linux_2.34.bb
similarity index 59%
rename from meta/recipes-core/util-linux/util-linux_2.33.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.34.bb
index 538e276..262f4ba 100644
--- a/meta/recipes-core/util-linux/util-linux_2.33.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.34.bb
@@ -7,7 +7,6 @@ SRC_URI += "file://configure-sbindir.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
-            file://check-for-_HAVE_STRUCT_TERMIOS_C_OSPEED.patch \
 "
-SRC_URI[md5sum] = "91653b90fcbe9c161153e39b8cc69fb5"
-SRC_URI[sha256sum] = "631be8eac6cf6230ba478de211941d526808dba3cd436380793334496013ce97"
+SRC_URI[md5sum] = "a78cbeaed9c39094b96a48ba8f891d50"
+SRC_URI[sha256sum] = "743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5"
-- 
2.7.4




