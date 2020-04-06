Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hKXx3PWvhdzMvRzo8Jk3JFQleEB4g8dX/sJLsOLw0dAdTXoCl7AR4yD/SekZGF+bpjBvVwLjsB
 Yur3wcwHoz4g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:11 -0700
IronPort-SDR: /7P/lU4LUI7MbmvyV4gYj2purwXd1tlUXx83/mk1H8WW67pflroXQq8z97T920/07LAjsMpNtH
 E0acVmsJ0SvA==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391190"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 10/13] lib/oe/package_manager: don't try to rm /var/lib/opkg
Date: Mon,  6 Apr 2020 23:11:38 +0800
Message-Id: <71711f5f20fc3744be4c9188a75606f60d524ff9.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Luebbe <jlu@pengutronix.de>

As opkglibdir starts with a /, os.path.join will ignore
self.target_rootfs, leading to an attempt to remove /var/lib/opkg.

This only fails if it exists on the host, explaining why this remained
undiscovered for long.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc974977cea389f54e7fc7de7b1c8fd3d8bafe58)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/package_manager.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 4d9e501f0e..e0b15dc9b4 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1791,8 +1791,7 @@ class DpkgPM(OpkgDpkgPM):
             open(os.path.join(target_dpkg_dir, "available"), "w+").close()
 
     def remove_packaging_data(self):
-        bb.utils.remove(os.path.join(self.target_rootfs,
-                                     self.d.getVar('opkglibdir')), True)
+        bb.utils.remove(self.target_rootfs + self.d.getVar('opkglibdir'), True)
         bb.utils.remove(self.target_rootfs + "/var/lib/dpkg/", True)
 
     def fix_broken_dependencies(self):
-- 
2.25.1

