Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8FB7824C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 09:32:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19343390"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 May 2017 17:32:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3A88A47C6105
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 17:32:15 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 26 May 2017 17:32:15 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 May 2017 17:31:54 +0800
Message-ID: <1495791114-1419-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 3A88A47C6105.A531B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ncurses: 6.0+20161126 -> 6.0+20170408
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
X-List-Received-Date: Fri, 26 May 2017 09:32:22 -0000
Content-Type: text/plain

1) Upgrade ncurses from 6.0+20161126 to 6.0+20170408.
2) Delete patch "fix-cflags-mangle.patch",since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-core/ncurses/files/fix-cflags-mangle.patch | 18 ------------------
 ...ncurses_6.0+20161126.bb => ncurses_6.0+20170408.bb} |  3 +--
 2 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
 rename meta/recipes-core/ncurses/{ncurses_6.0+20161126.bb => ncurses_6.0+20170408.bb} (76%)

diff --git a/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
deleted file mode 100644
index e9447c5..0000000
--- a/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-configure has a piece of logic to detect users "abusing" CC to hold compiler
-flags (which we do).  It also has logic to "correct" this by moving the flags
-from CC to CFLAGS, but the sed only handles a single argument in CC.
-
-Replace the sed with awk to filter out all words that start with a hyphen.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure b/configure
-index 7f31208..1a29cfc 100755
---- a/configure
-+++ b/configure
-@@ -2191,2 +2191,2 @@ echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/C
--	cf_flags=`echo "$CC" | sed -e 's/^.*[ 	]\(-[^ 	]\)/\1/'`
--	CC=`echo "$CC " | sed -e 's/[ 	]-[^ 	].*$//' -e 's/[ 	]*$//'`
-+	cf_flags=`echo "$CC" | awk  'BEGIN{ORS=" ";RS=" "} /^-.+/ {print $1}'`
-+	CC=`echo "$CC " | awk  'BEGIN{ORS=" ";RS=" "} /^[^-].+/ {print $1}'`
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb b/meta/recipes-core/ncurses/ncurses_6.0+20170408.bb
similarity index 76%
rename from meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
rename to meta/recipes-core/ncurses/ncurses_6.0+20170408.bb
index ace3108..02db551 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20170408.bb
@@ -1,12 +1,11 @@
 require ncurses.inc
 
 SRC_URI += "file://tic-hang.patch \
-            file://fix-cflags-mangle.patch \
             file://config.cache \
             file://configure-reproducible.patch \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
+SRCREV = "9e9f3df43c491e8f046345b9d1aa54ad57201df2"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.7.4




