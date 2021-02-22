Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.36802.1614009670915969052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: itt3uO03SU7wdyywZ5Sr/ynKSdMezWHee1F5P5vKUV36aNak54IqUdaN5CXKH5o9U3A9M+Z9Zm
 JDL0t4bqeCNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706064"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706064"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:10 -0800
IronPort-SDR: juZS71fNzhhk15iMx67pgv5XCvDKeBjsS4V1+eAAL2QVJKjRynD3tPcFCYrhs6QStZLTRn6dLW
 FBN6ITW5cH9Q==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302043"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:09 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 21/30] buildtools-extended-tarball: Add glibc-gconvs needed for build
Date: Tue, 23 Feb 2021 00:00:24 +0800
Message-Id: <8008d64e8f1d711ba46b92625bb2bad99a4293db.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When building vim it tries to rebuild files using iconv. If this fails
the build continues anyway but the output is not determnistic as builds
using a hosttools tarball are different from builds where there isn't a
hosttools tarball. Add the needed gconvs to the tarball when iconv is
present to become determistic and generate vim locales consistently.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b945652a088f430a2adec6b968cd00c5928d4272)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 0816486754..83e3fddccc 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -28,11 +28,21 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
+    nativesdk-glibc-gconv-ibm850 \
+    nativesdk-glibc-gconv-iso8859-1 \
+    nativesdk-glibc-gconv-utf-16 \
+    nativesdk-glibc-gconv-cp1250 \
+    nativesdk-glibc-gconv-cp1251 \
+    nativesdk-glibc-gconv-cp1252 \
+    nativesdk-glibc-gconv-euc-jp \
+    nativesdk-glibc-gconv-libjis \
     nativesdk-libxcrypt-dev \
     nativesdk-parted \
     nativesdk-dosfstools \
     nativesdk-gptfdisk \
     "
+# gconv-cp1250, cp1251 and euc-jp needed for iconv to work in vim builds
+# also copied list from uninative
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
 
-- 
2.29.2

