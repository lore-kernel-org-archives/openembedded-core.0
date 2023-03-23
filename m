Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F35C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 13:52:10 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.72746.1679579528596545709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 06:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=kNtKUlWD;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679579528; x=1711115528;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DPqVhv0GlCscH8P/VZVbFpAixpq6bOWsSayiG2IiJCM=;
  b=kNtKUlWDCkcVXus9ryIZ5Jt9Iy+lo6wFywX/qpO4VIxynsmcqR5MLE5B
   hrRFqtCJriZbgs9RL8Kc9Bi6nuj0XtCFQPcvaK8k0qYg9Wyredrpg8q1Y
   H7L+TLWmNh4YXp7NKiYhQF74I48exUkItNq+B5aP4v+2QN7U8ZI2V3cWL
   ZG0RFMvvUGixTAwfBhU+LcQx8v+9UBxu5xjI15XvKO2/MCh06rahTTbvW
   SHQefvvtoamX7+fS2oyWq921JJKL+ceSuWljdu9IVTGqJEG+Sy2YX0IRd
   MCMii/GVHRcWFeAfyc657iUvtbhersUZpbJV64Mwn4EgUVIHVl/t6/Fhp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="402070040"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="402070040"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="806256111"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="806256111"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 23 Mar 2023 06:39:16 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [langdale][patch] python3-setuptools: fix for CVE-2022-40897
Date: Thu, 23 Mar 2023 21:39:07 +0800
Message-Id: <20230323133907.1425109-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 13:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178987

From: Narpat Mali <narpat.mali@windriver.com>

Python Packaging Authority (PyPA) setuptools before 65.5.1 allows remote attackers
to cause a denial of service via HTML in a crafted package or custom PackageIndex
page. There is a Regular Expression Denial of Service (ReDoS) in package_index.py.

CVE: CVE-2022-40897

Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be]

cherry-pick and modify from OE-Core rev: f574d8d57ff3fbc38e350e7a90913993081c4fdf

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 ...-of-whitespace-to-search-backtrack.-.patch | 31 +++++++++++++++++++
 .../python/python3-setuptools_65.0.2.bb       |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch b/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
new file mode 100644
index 0000000000..20a13da7bc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
@@ -0,0 +1,31 @@
+From 9e9f617a83f6593b476669030b0347d48e831c3f Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Mon, 9 Jan 2023 14:45:05 +0000
+Subject: [PATCH] Limit the amount of whitespace to search/backtrack. Fixes
+ #3659.
+
+CVE: CVE-2022-40897
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ setuptools/package_index.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index 270e7f3..e93fcc6 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -197,7 +197,7 @@ def unique_values(func):
+     return wrapper
+ 
+ 
+-REL = re.compile(r"""<([^>]*\srel\s*=\s*['"]?([^'">]+)[^>]*)>""", re.I)
++REL = re.compile(r"""<([^>]*\srel\s{0,10}=\s{0,10}['"]?([^'" >]+)[^>]*)>""", re.I)
+ # this line is here to fix emacs' cruddy broken syntax highlighting
+ 
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb b/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
index 1a639ea333..d7cbb99c9d 100644
--- a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
@@ -9,7 +9,9 @@ inherit pypi python_setuptools_build_meta
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
-            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
+            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
+            file://0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch \
+"
 
 SRC_URI[sha256sum] = "101bf15ca723beef42c8db91a761f3748d4d697e17fae904db60c0b619d8d094"
 
-- 
2.37.3


