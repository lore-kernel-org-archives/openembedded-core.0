Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.1051.1629822357303292137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360257"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360257"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:49 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658951"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/28] kmod: use nonarch_base_libdir for depmod.d and modprobe.d
Date: Wed, 25 Aug 2021 00:25:12 +0800
Message-Id: <6fa724a55a4cb7eac7d4d50017b573af54fd6a34.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anton Blanchard <anton@ozlabs.org>

These should always be in /lib, regardless of the configuration.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63877226c09a674d3794fdc171adf12fe604a3c9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index 4f2b037f2f..f6fe049d92 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -24,13 +24,13 @@ do_install_append () {
                 lnr ${D}${base_bindir}/kmod ${D}${base_sbindir}/${tool}
         done
         # configuration directories
-        install -dm755 ${D}${base_libdir}/depmod.d
-        install -dm755 ${D}${base_libdir}/modprobe.d
+        install -dm755 ${D}${nonarch_base_libdir}/depmod.d
+        install -dm755 ${D}${nonarch_base_libdir}/modprobe.d
         install -dm755 ${D}${sysconfdir}/depmod.d
         install -dm755 ${D}${sysconfdir}/modprobe.d
 
         # install depmod.d file for search/ dir
-        install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
+        install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${nonarch_base_libdir}/depmod.d/search.conf"
 }
 
 do_compile_prepend() {
@@ -57,6 +57,6 @@ ALTERNATIVE_LINK_NAME[depmod] = "${base_sbindir}/depmod"
 PACKAGES =+ "libkmod"
 
 FILES_libkmod = "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkmod*${SOLIBS}"
-FILES_${PN} += "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
+FILES_${PN} += "${nonarch_base_libdir}/depmod.d ${nonarch_base_libdir}/modprobe.d"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.31.1

