Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tQ/Z7B1ICIb47OctsuhPaQQxjFw09lb8eEUupzUBWn1wIH0WbRGt4BEYbGNXyANHKRqdt8vIkq
 OxzOVRab0YTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:54:03 -0700
IronPort-SDR: +E5xRwlVCWzV3VR8lE4xcEsfMIsZREgtMb6ObJOzqbox7Yg5JExzusrZPNYGiAfgFSil3ivh3l
 DzCdiwJ87Knw==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866282"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:54:02 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 21/25] icu: update SRC_URI
Date: Fri, 29 May 2020 13:52:57 +0800
Message-Id: <c90113c61877b35211878286cd3b60a36b8c8684.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

New releases of ICU are published on github.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/icu/icu_64.2.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/icu/icu_64.2.bb b/meta/recipes-support/icu/icu_64.2.bb
index 2ed807787d..d09776f4bc 100644
--- a/meta/recipes-support/icu/icu_64.2.bb
+++ b/meta/recipes-support/icu/icu_64.2.bb
@@ -6,13 +6,18 @@ def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
+def icu_download_folder(d):
+    pvsplit = d.getVar('PV').split('.')
+    return pvsplit[0] + "-" + pvsplit[1]
+
 ICU_PV = "${@icu_download_version(d)}"
+ICU_FOLDER = "${@icu_download_folder(d)}"
 
 # http://errors.yoctoproject.org/Errors/Details/20486/
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV}-src.tgz"
+BASE_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
@@ -27,5 +32,5 @@ SRC_URI_append_class-target = "\
 SRC_URI[md5sum] = "a3d18213beec454e3cdec9a3116d6b05"
 SRC_URI[sha256sum] = "627d5d8478e6d96fc8c90fed4851239079a561a6a8b9e48b0892f24e82d31d6c"
 
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
+UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
+UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.25.4

