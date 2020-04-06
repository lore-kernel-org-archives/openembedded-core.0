Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: YWHRHW31nRolhm4N960dZFmHbiRQMI0SntIMdwtAZkdEyuiyCOUSfccEPlKrTinbo38k78Zszf
 GpSF003Nbyvw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:06 -0700
IronPort-SDR: zZbcYMGtb56NYbiOzHZn4lGBif3pwo+LJn4LxpXRFcnkFs9VEXXSac7OEFtkbBFKgPduQ9Bzg+
 JSzTSOZFTKJA==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391163"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 06/13] lib/oe/package_manager: make sure to not remove packages in apt install
Date: Mon,  6 Apr 2020 23:11:34 +0800
Message-Id: <15790fa224f405652e8ccc93c01dee04a7259246.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Luebbe <jlu@pengutronix.de>

apt install can decide to remove already installed packages if there are
conflicts. Avoid this by explicitly specifying --no-remove. This will
then cause a "E: Packages need to be removed but remove is disabled."
message.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9605a488b55042add012e9aeef13ab3f4e70e6e5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 7c373715ad..61206daeaa 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1619,7 +1619,7 @@ class DpkgPM(OpkgDpkgPM):
 
         os.environ['APT_CONFIG'] = self.apt_conf_file
 
-        cmd = "%s %s install --force-yes --allow-unauthenticated %s" % \
+        cmd = "%s %s install --force-yes --allow-unauthenticated --no-remove %s" % \
               (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
 
         try:
-- 
2.25.1

