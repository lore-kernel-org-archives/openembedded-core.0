Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C338EC021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.14627.1739864484748024222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tiqssyPb;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864490; x=1771400490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WMpSn+HyF9JxKQldDOtNweHpqvE2tw0oVQgyNnjH7o4=;
  b=tiqssyPbKSbjZqeqWPI0aWM7VT76HdHWOv5QMigPjKc0N03YzUU5H3jR
   jb82q7XGYYhWBfE/lKWYmLxigQZuZfFRUlYXRFE/ZVFXMzc7VmBcAYec5
   ZcVFH+H2xPXGj46/V4VgFQjUrNWPUAygsNHSoMX45ES5QPxksJOTvI8Yc
   GSYtIQj7eHfItai0aCmtfWongN+/SFVsh8GuvjeLefejHVetExLnGpmpw
   WwP0kRK9UO+sUczSyKKJedRguYlv6eKEfZJF0s5AtilCl6vHx94qYP8Zf
   /gNqgHCBXurdS9n50VvFhiIvvqeNxdB65ie/sNm6YET8YGeLrdSJWGVXD
   A==;
X-CSE-ConnectionGUID: 3SDtExouTZmsCZfi92T/AQ==
X-CSE-MsgGUID: BUK9v708SHSCeXn4iuofmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="177697694"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="177697694"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:29 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 28619D4C2F
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E5B6ED72B2
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A40F1A006C;
	Tue, 18 Feb 2025 15:41:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/32] python3-cython: upgrade 3.0.11 -> 3.0.12
Date: Tue, 18 Feb 2025 15:39:20 +0800
Message-Id: <1739864375-21394-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211578

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
===========
* Release 3.0.11 introduced some incorrect "noexcept" warnings.
* Conditional assignments to variables using the walrus operator could crash.
* Dict assignments to struct members with reserved C names could generate invalid C code.
* Fused ctuples with the same entry types but different sizes could fail to compile.
* In Py3, 'pyximport' was not searching 'sys.path' when looking for importable source files.
* Using '& 0' on integers produced with 'int.from_bytes()' could read invalid memory on Python 3.10.
* Modules could fail to compile in PyPy 3.11 due to missing CPython specific header files.
  Patch by Matti Picus.
* Minor fix in C++ "partial_sum()" declaration.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cython_3.0.11.bb => python3-cython_3.0.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.11.bb => python3-cython_3.0.12.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.0.11.bb b/meta/recipes-devtools/python/python3-cython_3.0.12.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.0.11.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.12.bb
index c1d45eaff5..f1951e3ae6 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.11.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.12.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
 SRC_URI += "file://0001-Output-import-relative-paths-in-generated-C-code.-GH.patch"
-SRC_URI[sha256sum] = "7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff"
+SRC_URI[sha256sum] = "b988bb297ce76c671e28c97d017b95411010f7c77fa6623dd0bb47eed1aee1bc"
 
 inherit pypi setuptools3 cython
 
-- 
2.43.0


