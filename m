Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5F4171AB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Dec 2017 02:00:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Dec 2017 18:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,473,1508828400"; 
   d="scan'208";a="5896475"
Received: from anujm-desk.png.intel.com ([172.30.199.130])
	by fmsmga008.fm.intel.com with ESMTP; 28 Dec 2017 18:00:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Dec 2017 10:00:12 +0800
Message-Id: <1514512812-4075-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] webkitgtk: fix build with musl and x32
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
X-List-Received-Date: Fri, 29 Dec 2017 02:00:19 -0000

Make the x32 check generic to make it work with musl as well.

Fixes [YOCTO #12118]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.18.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb
index 00b5a15..4938f69 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb
@@ -66,6 +66,7 @@ EXTRA_OECMAKE = " \
 
 # GL/GLES header clash: both define the same thing, differently, on 32 bit x86
 EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
+EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
 
 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
@@ -92,7 +93,7 @@ EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
 # An attempt was made to upstream JIT support for x32 in
 # https://bugs.webkit.org/show_bug.cgi?id=100450, but this was closed as
 # unresolved due to limited X32 adoption.
-EXTRA_OECMAKE_append_linux-gnux32 = " -DENABLE_JIT=OFF"
+EXTRA_OECMAKE_append_x86-x32 = " -DENABLE_JIT=OFF "
 
 SECURITY_CFLAGS_remove_aarch64 = "-fpie"
 SECURITY_CFLAGS_append_aarch64 = " -fPIE"
-- 
2.7.4


