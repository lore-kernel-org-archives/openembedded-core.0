Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.37424.1614009668774135895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xFOa/eM2SJUfKMM/IjDgB6XGHK6mKEt1RmQtdkrOxds0q7Xv0xosNtxmE6qXzqGmowmFP1MiyB
 hOrBqHEwHZnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706046"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706046"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:08 -0800
IronPort-SDR: btMjKMP0a58dFTjsVu/vIJRBtQtCPtinxeMbypfnhH8yofLOdvkgGWEuYonNiK8Kj6iRmV5vA+
 xc5q/6GUOvvg==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302002"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:07 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/30] package_manager/deb: Fix image generation with package removal
Date: Tue, 23 Feb 2021 00:00:22 +0800
Message-Id: <ffdd5e3d61995f78aa57a7f45d21ebc1513cb5a4.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When building SDKs with the deb backend you could see errors like:

Setting up nativesdk-python3-ndg-httpsclient (0.5.1-r0) ...
mkdir: cannot create directory ‘/usr/lib/opkg’: Permission denied
dpkg: error processing package nativesdk-python3-ndg-httpsclient (--configure):

which is due to environment misconfiguration when removing packages.

Fix this by setting the same environment variables as used for installation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f23c7e319a192ada14bb9a82822ef2967309aaea)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/package_manager/deb/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 5120920e70..0f9b27f831 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -312,6 +312,10 @@ class DpkgPM(OpkgDpkgPM):
         if not pkgs:
             return
 
+        os.environ['D'] = self.target_rootfs
+        os.environ['OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['INTERCEPT_DIR'] = self.intercepts_dir
 
         if with_dependencies:
-- 
2.29.2

