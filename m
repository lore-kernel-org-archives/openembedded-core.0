Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9uk0/T5pjzZur84WwhWMNuxJyY1Xk1jCgxjxWihwwvwWewFzI+kXNKy/xpkAmdaKerZMC08hP6
 7/8/mdr75hQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752412"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752412"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:41 -0800
IronPort-SDR: +xECwPkpUN/GH+/K6sH7fPaID1OegfSfF/S/VgEJmfPgOygwqvSW4E2fU04mZ/Zfj2R1hb3TZR
 wQsRtFpUaOiA==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670797"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:40 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/19] webkitgtk: fix reproducibility
Date: Mon, 14 Dec 2020 11:35:12 +0800
Message-Id: <b1f2ad7b46e012b653682cb41973384ac5bbdb67.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e7c673ab8d14766190843c6d8747510b37c71bf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.28.4.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
index 34b14f86ea..45b3ee2bce 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
@@ -134,3 +134,15 @@ GI_DATA_ENABLED_libc-musl_armv7ve = "False"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"
+
+PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from comments in generated sources to ensure reproducibility
+        sed -i -e "s,${WORKDIR},,g" \
+            ${B}/DerivedSources/webkit2gtk/webkit2/*.cpp \
+            ${B}/DerivedSources/ForwardingHeaders/JavaScriptCore/*.h \
+            ${B}/DerivedSources/JavaScriptCore/*.h \
+            ${B}/DerivedSources/JavaScriptCore/yarr/*.h \
+            ${B}/DerivedSources/MiniBrowser/*.c
+}
+
-- 
2.29.2

