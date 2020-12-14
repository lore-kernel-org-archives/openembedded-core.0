Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29749.1607916926828189768
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ez+JcGmTcfXEuLgVAOMhuWd8pCbUBmikM5t6p0Rr0abhMlndOnLHO+siOzxWpfj0GklXeoqWFj
 AIwb0vS1wJuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752357"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752357"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:26 -0800
IronPort-SDR: 6Xv81NXEzgB2qrlRQxekoDyCl3b0JfaXTfiF1QTJUYxRu6ccop8YvebgZUmi4l18QQM68KGsXG
 yJizllaK00pQ==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670750"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/19] buildtools-tarball: add wic dependency into extended buildtools
Date: Mon, 14 Dec 2020 11:35:01 +0800
Message-Id: <417bb4b01386d6f83f56ba8cd36b9408761de25e.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

fix below error:
wic ls ./core-image-minimal-intel-x86-64.wic

ERROR: Can't find executable parted

wic depend on some tools like parted/mtools/..., and we have those
tools in native_sysroot. so above problem can be avoided by
run command like wic ls imagename.wic --native-sysroot <path>

but this cannot cover condition that usr don't have build the
image, the image just copy from somewhere.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c0eda6ec09395f3a04cb80107a3ca33a063b21f8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index c32d0107c3..0816486754 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -29,6 +29,9 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
     nativesdk-libxcrypt-dev \
+    nativesdk-parted \
+    nativesdk-dosfstools \
+    nativesdk-gptfdisk \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.29.2

