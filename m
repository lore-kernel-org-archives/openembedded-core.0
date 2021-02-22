Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: s6+8EnzwAxJHKEGPVTxFVNycZhyJ07JlD+sVspbiKbQlNtJR7l9kVsoMVpTDizIUOOmUCSteZ2
 tHf20EH9D90g==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049359"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049359"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:49 -0800
IronPort-SDR: X5vkJbM+7l/lO3pkepUIeNdR+hpnLyeIWjbwkwMdCd2ZS1j/2Wg7sgSkVI2Z1ktSubaFiyHYKI
 enCRhcvPBhdA==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301856"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:47 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/30] libomxil: Fix up commercial license flag
Date: Tue, 23 Feb 2021 00:00:10 +0800
Message-Id: <1582f67743d9017c2e1462581d61d6501a27c3cd.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

The commercial license flag on libomxil is set because it may include
the Adaptive Multi-Rate audio codec (AMR) using FFmepg, which is patent
encumbered.

It turns out this component is disabled by default in the recipe; add a
PACKAGECONFIG to enable it and trigger the "commercial" LICENSE_FLAGS on
it. This make the default build configuration clean unless a user
specifically asks for AMR support, and prevents them from marking the
recipe with the "commerical" flag unnecessarily which could hide
potential problems later on.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f61e20002c2af93e2d6810574e23606925526ee)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 2061c280e4..82cdaf54c7 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Bellagio is an opensource implementation of the Khronos OpenMAX \
 HOMEPAGE = "http://omxil.sourceforge.net/"
 
 LICENSE = "LGPLv2.1+"
-LICENSE_FLAGS = "commercial"
+LICENSE_FLAGS = "${@bb.utils.contains('PACKAGECONFIG', 'amr', 'commercial', '', d)}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
                     file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
 
@@ -28,6 +28,10 @@ PROVIDES += "virtual/libomxil"
 
 CFLAGS += "-fcommon"
 
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[amr] = "--enable-amr,,"
+
 #
 # The .so files under ${libdir}/bellagio are not intended to be versioned and symlinked.
 # Make sure they get packaged in the main package.
-- 
2.29.2

