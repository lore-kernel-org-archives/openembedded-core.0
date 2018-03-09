Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0767978956
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651965"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:54 +0200
Message-Id: <20180309185614.31113-16-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/36] ruby: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:14 -0000

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
 .../0002-Obey-LDFLAGS-for-the-link-of-libruby.patch     | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index b0114ba28b2..4cf579f4270 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -10,19 +10,16 @@ Signed-off-by: Christopher Larson <chris_larson@mentor.com>
  Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index 7da2488..5b4aea1 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -75,7 +75,7 @@ EXTLIBS =
- LIBS = @LIBS@ $(EXTLIBS)
+Index: ruby-2.5.0/Makefile.in
+===================================================================
+--- ruby-2.5.0.orig/Makefile.in
++++ ruby-2.5.0/Makefile.in
+@@ -77,7 +77,7 @@ LIBS = @LIBS@ $(EXTLIBS)
  MISSING = @LIBOBJS@ @ALLOCA@
+ ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
 -DLDFLAGS = @LIBRUBY_DLDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
 +DLDFLAGS = @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
  SOLIBS = @SOLIBS@
+ ENABLE_DEBUG_ENV = @ENABLE_DEBUG_ENV@
  MAINLIBS = @MAINLIBS@
- ARCHMINIOBJS = @MINIOBJS@
--- 
-2.8.0
-
-- 
2.16.1


