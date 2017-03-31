Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B8C2377CD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 21:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490995704; x=1522531704;
	h=from:to:cc:subject:date:message-id;
	bh=QDn8OslUpO1vgDoP2b9vIJPw0TvFo7anFQ0eN974BA8=;
	b=FuWrkPjVI0RDXzAnjaK3X2ajSnqDTDwN+0hY0j/gia3ntiYmQjkXyUc7
	j0iY36mY2gioyfha10zTmmFTyJ9GXw==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Mar 2017 14:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,253,1486454400"; d="scan'208";a="950349691"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga003.jf.intel.com with ESMTP; 31 Mar 2017 14:28:23 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 14:28:13 -0700
Message-Id: <1490995693-19005-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: richard.purdie@intel.com
Subject: [PATCH] ncurses_6.0: Improve reproducibility
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
X-List-Received-Date: Fri, 31 Mar 2017 21:28:23 -0000

Build static libraries without the binutils "ar" -U option.
This option deliberately breaks deterministic mode.
The option seems to be a relic from 2015, intended as a workaround
for some unspecified build problems.

[YOCTO#11247]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../ncurses/files/configure-reproducible.patch       | 20 ++++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.0+20161126.bb    |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/configure-reproducible.patch

diff --git a/meta/recipes-core/ncurses/files/configure-reproducible.patch b/meta/recipes-core/ncurses/files/configure-reproducible.patch
new file mode 100644
index 0000000..54a8bdc
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/configure-reproducible.patch
@@ -0,0 +1,20 @@
+"configure" enforces -U for ar flags, breaking deterministic builds.
+The flag was added to fix some vaguely specified "recent POSIX binutil
+build problems" in 2015. 
+
+Upstream-Status: Pending
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+diff --git a/configure b/configure
+index 7f31208..aa80911 100755
+--- a/configure
++++ b/configure
+@@ -4428,7 +4428,7 @@ if test "${cf_cv_ar_flags+set}" = set; then
+ else
+ 
+ 	cf_cv_ar_flags=unknown
+-	for cf_ar_flags in -curvU -curv curv -crv crv -cqv cqv -rv rv
++	for cf_ar_flags in -curv curv -crv crv -cqv cqv -rv rv
+ 	do
+ 
+ 		# check if $ARFLAGS already contains this choice
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
index e95741f..ace3108 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
@@ -3,6 +3,7 @@ require ncurses.inc
 SRC_URI += "file://tic-hang.patch \
             file://fix-cflags-mangle.patch \
             file://config.cache \
+            file://configure-reproducible.patch \
 "
 # commit id corresponds to the revision in package version
 SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
-- 
2.7.4


