Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 12DE478973
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:24:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053640"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:49 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:27 +0200
Message-Id: <20180308181804.31261-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/42] nspr: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:49 -0000

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
 meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch     |  2 +-
 meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch b/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
index c2b7258e50e..f12acc85480 100644
--- a/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
+++ b/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
@@ -49,4 +49,4 @@ Index: nspr/configure.in
 -            PR_MD_ASFILES=os_Linux_ppc.s
          fi
          ;;
-     m68k)
+     esac    
diff --git a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch b/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
index a7e7853de1a..ecc6d31874a 100644
--- a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
+++ b/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
@@ -11,12 +11,12 @@ in file {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/packages-sp
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 Upstream-Status: Pending
 
-Index: nspr-4.8.9/mozilla/nsprpub/pr/tests/Makefile.in
+Index: nspr/pr/tests/Makefile.in
 ===================================================================
---- nsprpub.orig/pr/tests/Makefile.in	2012-02-11 00:01:10.476220505 +0200
-+++ nsprpub/pr/tests/Makefile.in	2012-02-10 23:57:40.000000000 +0200
-@@ -379,7 +379,7 @@
- endif
+--- nspr.orig/pr/tests/Makefile.in
++++ nspr/pr/tests/Makefile.in
+@@ -315,7 +315,7 @@ ifeq ($(OS_ARCH), SunOS)
+ endif # SunOS
  
  ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
 -    LDOPTS += -Xlinker -rpath $(ABSOLUTE_LIB_DIR)
-- 
2.16.1


