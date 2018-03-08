Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8DDE37897D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053646"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:51 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:28 +0200
Message-Id: <20180308181804.31261-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/42] libical: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:50 -0000

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
 .../libical/libical/Remove-cmake-check-for-Perl.patch   | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch b/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
index c5c0cb076e6..b50f50e7017 100644
--- a/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
+++ b/meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
@@ -14,11 +14,11 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  CMakeLists.txt | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d5aad80..5cc9863 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -91,8 +91,7 @@ if(SHARED_ONLY)
+Index: libical-2.0.0/CMakeLists.txt
+===================================================================
+--- libical-2.0.0.orig/CMakeLists.txt
++++ libical-2.0.0/CMakeLists.txt
+@@ -116,8 +116,7 @@ if(SHARED_ONLY)
    set(LIBRARY_TYPE SHARED)
  endif()
  
@@ -26,8 +26,5 @@ index d5aad80..5cc9863 100644
 -find_package(Perl REQUIRED)
 +set(PERL_EXECUTABLE perl)
  
- # MSVC specific definitions
- if(WIN32)
--- 
-2.1.4
-
+ # Ensure finding 64bit libs when using 64-bit compilers
+ if(CMAKE_CL_64)
-- 
2.16.1


