Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A58C61D9D
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:15:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.15381.1700644524584223423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Lod/fYeP;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700644525; x=1732180525;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6x9gO0FfNSDv3MlX4wJK+Ors4QspJtErXaPVjGUOWQk=;
  b=Lod/fYePNmGml5Ij/loRV8ZIVom1ADN61AwD/UIxyRpYqA95PKs9awf9
   ASehdNnLvcVbp8CUzapWNgzsLXB4Mse4yMnuW42E4Qi3KcHy6y9FcnfLj
   R3iXYxyzKA0JguRlG7k5Ir2ArIiCOljoAE1f51CGWudxVMJazDzDZfMD+
   +uBXz+TdQIryuQYDVhoEyuAQ3ZyVs5hQamik1A4Fc/tEY3fHURpKIshBj
   FGaJo5vKPB+Ao8a6a5PFQsbTv+f3m+ocqlMbM0u5i2vkFO79K0PTlNWqO
   e8F97QXkgEC1vDZ3KhaDhvsRcuXwsNMyjiT9APWUF0TeyjznJ//rIgsuh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458512235"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="458512235"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 01:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910728622"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="910728622"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 01:15:24 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 2/2] python3-setuptools: fix CVE-2022-40897
Date: Wed, 22 Nov 2023 16:55:45 +0800
Message-Id: <20231122085545.2327422-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231122085545.2327422-1-chee.yang.lee@intel.com>
References: <20231122085545.2327422-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191044

From: Lee Chee Yang <chee.yang.lee@intel.com>

import patch from ubuntu setuptools_45.2.0-1ubuntu0.1 .

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/python-setuptools.inc              |  2 ++
 .../python3-setuptools/CVE-2022-40897.patch   | 29 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2022-40897.patch

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 29be852f66..5faf62bc3a 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -8,6 +8,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
+SRC_URI += " file://CVE-2022-40897.patch "
+
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI[md5sum] = "0c956eea142af9c2b02d72e3c042af30"
diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2022-40897.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2022-40897.patch
new file mode 100644
index 0000000000..9150cea07e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2022-40897.patch
@@ -0,0 +1,29 @@
+From 43a9c9bfa6aa626ec2a22540bea28d2ca77964be Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Fri, 4 Nov 2022 13:47:53 -0400
+Subject: [PATCH] Limit the amount of whitespace to search/backtrack. Fixes
+ #3659.
+
+CVE: CVE-2022-40897
+Upstream-Status: Backport [
+Upstream :  https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be
+Import from Ubuntu: http://archive.ubuntu.com/ubuntu/pool/main/s/setuptools/setuptools_45.2.0-1ubuntu0.1.debian.tar.xz
+]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+---
+ setuptools/package_index.py           | 2 +-
+ setuptools/tests/test_packageindex.py | 1 -
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+--- setuptools-45.2.0.orig/setuptools/package_index.py
++++ setuptools-45.2.0/setuptools/package_index.py
+@@ -215,7 +215,7 @@ def unique_values(func):
+     return wrapper
+ 
+ 
+-REL = re.compile(r"""<([^>]*\srel\s*=\s*['"]?([^'">]+)[^>]*)>""", re.I)
++REL = re.compile(r"""<([^>]*\srel\s{0,10}=\s{0,10}['"]?([^'" >]+)[^>]*)>""", re.I)
+ # this line is here to fix emacs' cruddy broken syntax highlighting
+ 
+ 
-- 
2.37.3


