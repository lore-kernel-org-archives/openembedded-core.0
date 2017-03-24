Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BCDEC77BC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490367852; x=1521903852;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JA8ZBu2LVZTc0idZKfGNpc+ZLeZWVWUDwDvXlc9hh8Q=;
	b=DIuvcEOb8aJ70lbuD9xWZMIm/yM1c0vPshnIXphZO7iWbxd90Y1l8cB/
	jfkwx7kYNzW5NiWQc4PQ9XCUkY4CYg==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 08:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="80253126"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2017 08:04:12 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id CCC746A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:04:05 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 17:03:19 +0200
Message-Id: <1490367800-28099-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1490367800-28099-1-git-send-email-maxin.john@intel.com>
References: <1490367800-28099-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/2] valgrind: vg_regtest.in: fix perl script
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
X-List-Received-Date: Fri, 24 Mar 2017 15:04:10 -0000

@PERL@ in vg_regtest.in causes recipe specific sysroot based perl to
be present in the vg_regtest script, making it unusable in the target.

Use /usr/bin/perl instead of @PERL@ to fix it.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../valgrind/valgrind/fixed-perl-path.patch        | 33 +++++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index b054d05..b431d33 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,3 +1,8 @@
+From 67e7a690107efb16d6d5aebfe420b64a552accdf Mon Sep 17 00:00:00 2001
+From: Qing He <qing.he@intel.com>
+Date: Tue, 31 Aug 2010 22:51:58 +0800
+Subject: [PATCH] valgrind: fix perl scripts
+
 this is a temporary patch to workaround cross compilation.
 otherwise @PERL@ will be replaced to perl-native binary,
 this creates unusable scripts and fails FILERDEPENDS mechanism
@@ -11,8 +16,16 @@ a better fix would need:
 
 Upstream-Status: Inappropriate [configuration]
 
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ cachegrind/cg_annotate.in | 2 +-
+ cachegrind/cg_diff.in     | 2 +-
+ massif/ms_print.in        | 2 +-
+ perf/vg_perf.in           | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
 diff --git a/cachegrind/cg_annotate.in b/cachegrind/cg_annotate.in
-index 9dc9565..cc4ef05 100644
+index 69365e8..978265d 100644
 --- a/cachegrind/cg_annotate.in
 +++ b/cachegrind/cg_annotate.in
 @@ -1,4 +1,4 @@
@@ -22,7 +35,7 @@ index 9dc9565..cc4ef05 100644
  ##--------------------------------------------------------------------##
  ##--- Cachegrind's annotator.                       cg_annotate.in ---##
 diff --git a/cachegrind/cg_diff.in b/cachegrind/cg_diff.in
-index 951066e..84c2dde 100644
+index 395460b..05873cc 100755
 --- a/cachegrind/cg_diff.in
 +++ b/cachegrind/cg_diff.in
 @@ -1,4 +1,4 @@
@@ -32,7 +45,7 @@ index 951066e..84c2dde 100644
  ##--------------------------------------------------------------------##
  ##--- Cachegrind's differencer.                         cg_diff.in ---##
 diff --git a/massif/ms_print.in b/massif/ms_print.in
-index e6ffdbf..fb45906 100755
+index e6fae89..3b85b40 100755
 --- a/massif/ms_print.in
 +++ b/massif/ms_print.in
 @@ -1,4 +1,4 @@
@@ -42,7 +55,7 @@ index e6ffdbf..fb45906 100755
  ##--------------------------------------------------------------------##
  ##--- Massif's results printer                         ms_print.in ---##
 diff --git a/perf/vg_perf.in b/perf/vg_perf.in
-index 2188a31..83ad024 100644
+index 7a80cb0..28f6156 100644
 --- a/perf/vg_perf.in
 +++ b/perf/vg_perf.in
 @@ -1,4 +1,4 @@
@@ -51,3 +64,15 @@ index 2188a31..83ad024 100644
  ##--------------------------------------------------------------------##
  ##--- Valgrind performance testing script                  vg_perf ---##
  ##--------------------------------------------------------------------##
+diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
+index cb05b52..032e947 100755
+--- a/tests/vg_regtest.in
++++ b/tests/vg_regtest.in
+@@ -1,4 +1,4 @@
+-#! @PERL@
++#! /usr/bin/perl
+ ##--------------------------------------------------------------------##
+ ##--- Valgrind regression testing script                vg_regtest ---##
+ ##--------------------------------------------------------------------##
+---
+2.4.0
-- 
2.4.0


