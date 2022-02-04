Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B673C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:06 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=eVLCdzaU;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983984; x=1675519984;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fRFlZvoY7pvei3uldJly9J51Mz5xVvPHJO0UNDN/rDU=;
  b=eVLCdzaUjSPxlW7Qj+G83C1hG79d5rtn2IfCAKIb8r0Mako/O5BVhdeA
   7UmxUTLaYPD6bGA28syEjsNoUa3ybqLYSDNRi+gmUPVoYATOufJryqqeh
   U4XrX4ZcxMjPYdmYnLfbFGpdGCV59b3Z6njEwt2nnqyTQj7LcWXdgZB8O
   9im1FTk/B/66RzQ9+Aj5Cqe7vEcAiPUNHzenznyqdAz4nMTBZFfO0ihvd
   Nv4tYaalNrVh2JXLX7qQSjopkiuZmO2aNhgo6z39RdIGtGufiL7ddNVxn
   2ga1X0GGJzlpkGSMnf4Ax9bET9SzK6J+UtxTKJxcito0b3Fv5lCX3ThNR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321617"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321617"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750075"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/17] tiff: backport fix for CVE-2022-22844
Date: Fri,  4 Feb 2022 22:12:34 +0800
Message-Id: 
 <2948fdb7df4eb5824a06c1d73c6c70b3bcbb9448.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161355

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit daf2880b7431aa641e02ebba8cbca40d81389088)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...al-buffer-overflow-for-ASCII-tags-wh.patch | 43 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch

diff --git a/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch b/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
new file mode 100644
index 0000000000..72776f09ba
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
@@ -0,0 +1,43 @@
+CVE: CVE-2022-22844
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b12a0326e6064b6e0b051d1184a219877472f69b Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 25 Jan 2022 16:25:28 +0000
+Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
+ count is required (fixes #355)
+
+---
+ tools/tiffset.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiffset.c b/tools/tiffset.c
+index 8c9e23c5..e7a88c09 100644
+--- a/tools/tiffset.c
++++ b/tools/tiffset.c
+@@ -146,9 +146,19 @@ main(int argc, char* argv[])
+ 
+             arg_index++;
+             if (TIFFFieldDataType(fip) == TIFF_ASCII) {
+-                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_index]) != 1)
+-                    fprintf( stderr, "Failed to set %s=%s\n",
+-                             TIFFFieldName(fip), argv[arg_index] );
++                if(TIFFFieldPassCount( fip )) {
++                    size_t len;
++                    len = strlen(argv[arg_index]) + 1;
++                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFieldTag(fip),
++                            (uint16_t)len, argv[arg_index]) != 1)
++                        fprintf( stderr, "Failed to set %s=%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                } else {
++                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
++                            argv[arg_index]) != 1)
++                        fprintf( stderr, "Failed to set %s=%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                }
+             } else if (TIFFFieldWriteCount(fip) > 0
+ 		       || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
+                 int     ret = 1;
+-- 
+2.25.1
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 6852758c6a..ef8e8460fb 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-          "
+           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch"
+
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
 
 # exclude betas
-- 
2.34.1


