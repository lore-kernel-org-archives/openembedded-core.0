Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8F037899C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053921"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:43 +0200
Message-Id: <20180308181804.31261-21-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/42] ethtool: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:14 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch                | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index bf66267e81b..dbf7142f18a 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -5,11 +5,12 @@ Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
 (default automake behavior incompatible with ptest)
 
-diff -ruN a/configure.ac b/configure.ac
---- a/configure.ac	2014-05-28 18:19:13.513980977 +0200
-+++ b/configure.ac	2014-05-28 18:19:21.129660215 +0200
-@@ -2,7 +2,7 @@
- AC_INIT(ethtool, 3.14, netdev@vger.kernel.org)
+Index: ethtool-4.11/configure.ac
+===================================================================
+--- ethtool-4.11.orig/configure.ac
++++ ethtool-4.11/configure.ac
+@@ -2,7 +2,7 @@ dnl Process this file with autoconf to p
+ AC_INIT(ethtool, 4.11, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
-- 
2.16.1


