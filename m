Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AFFC48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:41:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.16724.1708083641400806033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YQDdS/Dv;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708083653; x=1739619653;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ihgaddbjK8dUk6980T0cpDZk/d76qANf9Bf1W8nPq5U=;
  b=YQDdS/DvnUPLW1JOCgxsz18EqihYb78he9o9ZRm08JzRpQua0MwCD84S
   yRKrXduduFjNJSncRqxtM0lD2iNYP2u0T+QiAnIGrnjAGM2drlD81KnpB
   bZzOAMZPKRRDKSODezUIKd4qtYxedU5aIkJAQmqN85HgHgJE92GbckHPr
   pRgtJ5ajh+Au/iYtXVYvawvcPlQSvyqjZdMWMhH5zJhnPkVWFj3/hn26A
   CWZy/JnD3qF6cTq3NIiRs+bX6OomcHHAg993RgKgWQpN9YRWM/qsvcqSw
   crj5h1EFvjzOXNN8KvVqkmx/iFzBp4OXXwEVRgypF7OR4NqxBX1rzSc9T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2612870"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2612870"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912349740"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912349740"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.3])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:51 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] libcap-ng: fix build with swig 4.2.0
Date: Fri, 16 Feb 2024 19:40:34 +0800
Message-ID: <20240216114034.109257-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240216114034.109257-1-anuj.mittal@intel.com>
References: <20240216114034.109257-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195756

Backport an upstream patch to remove Python exception handler which is
deprecated and also removed from swig.

https://github.com/swig/swig/commit/736c052d7de3685be9d5c4aecee6b36273e8c319

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../files/fix-issues-with-swig-4-2.patch      | 32 +++++++++++++++++++
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch

diff --git a/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch b/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
new file mode 100644
index 00000000000..fb424fe7258
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
@@ -0,0 +1,32 @@
+From 355eada2d20886287cffc16e304087dd6f66ae37 Mon Sep 17 00:00:00 2001
+From: Steve Grubb <ausearch.1@gmail.com>
+Date: Thu, 4 Jan 2024 15:06:29 -0500
+Subject: [PATCH] Remove python global exception handler since its deprecated
+
+Upstream-Status: Backport [https://github.com/stevegrubb/libcap-ng/commit/30453b6553948cd05c438f9f509013e3bb84f25b]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ bindings/src/capng_swig.i | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/bindings/src/capng_swig.i b/bindings/src/capng_swig.i
+index fcdaf18..fa85e13 100644
+--- a/bindings/src/capng_swig.i
++++ b/bindings/src/capng_swig.i
+@@ -30,13 +30,6 @@
+ 
+ %varargs(16, signed capability = 0) capng_updatev;
+ 
+-%except(python) {
+-  $action
+-  if (result < 0) {
+-    PyErr_SetFromErrno(PyExc_OSError);
+-    return NULL;
+-  }
+-}
+ #endif
+ 
+ %define __signed__
+-- 
+2.43.2
+
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index a6b5dcf452e..845b7c2f0a0 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -7,7 +7,9 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz"
+SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
+           file://fix-issues-with-swig-4-2.patch \
+           "
 
 SRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"
 
-- 
2.43.2


