Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.38196.1600680548454292188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 02:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: uT/DUkLaowZqqA4tJJdpj2mor/YWRQ3kNvRa9cHRroZ32KnpB4naXht4/E/y5qVacPCWb85g/+
 d6CkWSZZRWKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="157725339"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="157725339"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 02:29:06 -0700
IronPort-SDR: GhQBILU1mWTmAkcOslzSudb4Eixcf3nCWfkMQqSQ0qHoo/Lspd+qMDWyOYTn6BHankWuUh5+zs
 /MxlB2f1zVpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="304430159"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga003.jf.intel.com with ESMTP; 21 Sep 2020 02:29:06 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/2] libx11: fix CVE-2020-14363
Date: Mon, 21 Sep 2020 17:29:04 +0800
Message-Id: <20200921092904.1350-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921092904.1350-1-chee.yang.lee@intel.com>
References: <20200921092904.1350-1-chee.yang.lee@intel.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../xorg-lib/libx11/CVE-2020-14363.patch      | 36 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14363.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14363.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14363.patch
new file mode 100644
index 0000000000..60045e2890
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14363.patch
@@ -0,0 +1,36 @@
+From acdaaadcb3d85c61fd43669fc5dddf0f8c3f911d Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Thu, 13 Aug 2020 18:02:58 +0200
+Subject: [PATCH] Fix an integer overflow in init_om()
+
+CVE-2020-14363
+
+This can lead to a double free later, as reported by Jayden Rivers.
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/acdaaadcb3d85c61fd43669fc5dddf0f8c3f911d]
+CVE: CVE-2020-14363
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ modules/om/generic/omGeneric.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/modules/om/generic/omGeneric.c b/modules/om/generic/omGeneric.c
+index c44acb88..406cec93 100644
+--- a/modules/om/generic/omGeneric.c
++++ b/modules/om/generic/omGeneric.c
+@@ -1908,7 +1908,8 @@ init_om(
+     char **required_list;
+     XOrientation *orientation;
+     char **value, buf[BUFSIZ], *bufptr;
+-    int count = 0, num = 0, length = 0;
++    int count = 0, num = 0;
++    unsigned int length = 0;
+ 
+     _XlcGetResource(lcd, "XLC_FONTSET", "on_demand_loading", &value, &count);
+     if (count > 0 && _XlcCompareISOLatin1(*value, "True") == 0)
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index 84e0e4457e..ebd2640743 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://disable_tests.patch \
             file://libx11-whitespace.patch \
             file://CVE-2020-14344.patch \
+            file://CVE-2020-14363.patch \
 "
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-- 
2.17.1

