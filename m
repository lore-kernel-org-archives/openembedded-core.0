Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DD9C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:57 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13729.1645542530232186642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=cC1TbJvu;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542536; x=1677078536;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SDnkauYN/zAyB557sxmqVTIq+I2s2GjkqhzCmkdds6s=;
  b=cC1TbJvuNXOw5CDSYjKbDf7NiSm/vUtvjkIphTacbGnyd53U4NppOlX5
   HnfIOxwdqRlmnvTNLiJUrRx6l/mvX5Kc1G9Tuf3+uskQ07JRsYYbfj0Ox
   xH62sZ2pk3kXcoZUzBK0w9Avrpczqcpl3xToD2Gg53vxYFXkeHrnhNYY7
   K/kzbOuQEezR9M6sTy2NwxJaVTL4lOewMZfcsJSZa1zRMpiNqeco78dQG
   hUpejjQczrUfYibzCLCpOyy9BaOZ4O8xXoBoMqafIBTJnmBH7MuKvrTMm
   IMMk3X8+7jKg+GHc27LEz6WTSXaSmZdFyUgRuTnyBAPvj33w0coECPtIa
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305350"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305350"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258866"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 36/38] tiff: Add backports for two CVEs from
 upstream
Date: Tue, 22 Feb 2022 23:07:37 +0800
Message-Id: 
 <2edb042a99c4fbc26ed797c8a959985b685e8696.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162172

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6ae14b4ff7a655b48c6d99ac565d12bf8825414f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...al-buffer-overflow-for-ASCII-tags-wh.patch |  0
 ...99c99f987dc32ae110370cfdd7df7975586b.patch | 30 +++++++++++++++++
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch | 32 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  4 ++-
 4 files changed, 65 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/libtiff/{files => tiff}/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch (100%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch

diff --git a/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
similarity index 100%
rename from meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
rename to meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
diff --git a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
new file mode 100644
index 0000000000..0b41dde606
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
@@ -0,0 +1,30 @@
+From 561599c99f987dc32ae110370cfdd7df7975586b Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 5 Feb 2022 20:36:41 +0100
+Subject: [PATCH] TIFFReadDirectory(): avoid calling memcpy() with a null
+ source pointer and size of zero (fixes #362)
+
+Upstream-Status: Backport
+CVE: CVE-2022-0562
+
+---
+ libtiff/tif_dirread.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 2bbc4585..23194ced 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -4177,7 +4177,8 @@ TIFFReadDirectory(TIFF* tif)
+                     goto bad;
+                 }
+ 
+-                memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
++                if (old_extrasamples > 0)
++                    memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
+                 _TIFFsetShortArray(&tif->tif_dir.td_sampleinfo, new_sampleinfo, tif->tif_dir.td_extrasamples);
+                 _TIFFfree(new_sampleinfo);
+         }
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
new file mode 100644
index 0000000000..74f9649fdf
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
@@ -0,0 +1,32 @@
+From eecb0712f4c3a5b449f70c57988260a667ddbdef Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 6 Feb 2022 13:08:38 +0100
+Subject: [PATCH] TIFFFetchStripThing(): avoid calling memcpy() with a null
+ source pointer and size of zero (fixes #362)
+
+Upstream-Status: Backport
+CVE: CVE-2022-0561
+
+---
+ libtiff/tif_dirread.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 23194ced..50ebf8ac 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -5777,8 +5777,9 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEntry* dir, uint32_t nstrips, uint64_t** l
+ 			_TIFFfree(data);
+ 			return(0);
+ 		}
+-                _TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
+-                _TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
++		if( dir->tdir_count )
++			_TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
++		_TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
+ 		_TIFFfree(data);
+ 		data=resizeddata;
+ 	}
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index ef8e8460fb..86b55ad284 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch"
+           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
+           file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
+           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch"
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
 
-- 
2.35.1


