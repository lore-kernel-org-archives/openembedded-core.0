Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1004.1629822353115062713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360254"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360254"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658947"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:46 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/28] pixman: re-disable iwmmxt
Date: Wed, 25 Aug 2021 00:25:11 +0800
Message-Id: <467b2a608c3bea211cf181d23fdb168bc4fb3152.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Williams <patrick@stwcx.xyz>

Commit dd9c3d042aa5c2ae0fd80b558ec7e9c793ff36f0 dropped the iwmmxt
disable as part of the meson conversion and said: "we can add this
back again if it fails."  It does.

| cc1: warning: switch '-mcpu=arm1176jz-s' conflicts with switch '-march=iwmmxt2'
| FAILED: pixman/libpixman-1.so.0.40.0
| lto1: fatal error: target specific builtin not available
| compilation terminated.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Change-Id: Ia1278d18543493a3f9eace6c2dd2f84701b9c2b1
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit afa713033a7fc9b7c4ac3d703ea9218b4d775def)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index 5a3bb22ec3..00dd68006f 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -31,5 +31,7 @@ EXTRA_OEMESON = "-Dgtk=disabled -Dlibpng=disabled"
 # ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):
 # linking mips:loongson_2f module with previous mips:isa64 modules 
 EXTRA_OEMESON += "-Dloongson-mmi=disabled"
+# disable iwmmxt due to compile fails on most arm platforms.
+EXTRA_OEMESON += "-Diwmmxt=disabled"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

