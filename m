Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id DE40571CA2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 01:01:53 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym04.jp.fujitsu.com with smtp
	id 6400_7d95_11804d1c_4cec_473d_87cc_fd41344090c0;
	Mon, 05 Jun 2017 10:01:46 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id B1708AC0061
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 10:01:45 +0900 (JST)
Received: from G01JPEXCHYT13.g01.fujitsu.local
	(G01JPEXCHYT13.g01.fujitsu.local [10.128.194.52])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	91F8346E5D4 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 10:01:44 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT13.g01.fujitsu.local (10.128.194.52) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 5 Jun 2017 10:01:43 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Jun 2017 10:03:02 +0900
Message-ID: <1496624582-13307-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] ncurses: Upgrade 6.0+20161126 -> 6.0+20170408
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
X-List-Received-Date: Mon, 05 Jun 2017 01:01:55 -0000
Content-Type: text/plain

1. Upgrade ncurses from 6.0+20161126 to 6.0+20170408

2. Delete the following patch file becuase new version already uses the awk to filter words.
   fix-cflags-mangle.patch

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
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
1.9.1


