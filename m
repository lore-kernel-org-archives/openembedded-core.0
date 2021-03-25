Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web12.6736.1616673598568213290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 04:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: awais_belal@mentor.com)
IronPort-SDR: 4UEW9dhnAnJm1kKdepQKZyGNRjPgCJn2zFEZYpmfUU9NV6+hJw0EGNu4KM2bvIdfxMiaarX6oy
 5URPYBi2nXJMEAo6Ji5Cl8xA8Q65BE0OPnUuaOZBhMuxJ6owmQjCNYw/WZu07v6YtkiMyI11Bh
 ydl29Gkm2XQ1uBkW+jPkdIZ8SoP5zhp1Ek9ZZVsd02eEjcN4ZHzOj9wl95NoFDblkfT3BAmdas
 XmeKuGzgwg1xbV7uhvZAOUklUN5cHPFh/m6/Sx5SZngvCBgmxnu9jnjrNSjAVC5VrEPWPaoGlY
 kjc=
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="59601271"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 25 Mar 2021 03:59:57 -0800
IronPort-SDR: sU/2KiluUSj6u7aULj2jJZvrSxH3xQc4sBmcUpDe65nQbKmmYSnNSLNNbLmQ6TYh5VXPgBq0Cu
 MeygCqs1rIe1/uvTnshe1CA31wOD0LUidVIyq3qEebgFjhSU3ZaYL/0kK74Yk4yXkbYqQKLamR
 Vq7OshLHNqVdo0Nd3xeI74z6FtR0IRl7SRWvBGeGrlIk4X+fIF2RCLZwa4VA5dYhoDRb0Jurf5
 0kp4UJ9YaSbTR5d26wiJU70vOaCfbrd8JOVMLU6B7+Bdyb6kkv1AR6mco7XvTh0UUr3QTdn8rL
 Kt4=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rootfs.py: uninstall the run-postinsts package if not needed
Date: Thu, 25 Mar 2021 16:59:32 +0500
Message-ID: <20210325115932.22802-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: awais_belal@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Content-Type: text/plain

The run-postinsts package runs post installation scripts
on target if packages request delayed post installations. When
no delayed post installations are found the sysV style scripts
are disabled for the package and hence it did not run on sysV
based systems. However, the package provides systemd service
as well which still ran on systems based on systemd even when
no post installations were found.
Rather than disabling/masking scripts for different initialization
managers we now simply remove/uninstall the run-postinsts package
when no post installations are found to be delayed till runtime.
This is also more aligned with the function (_uninstall_unneeded)
this functionality is triggered through.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/lib/oe/rootfs.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 249c685dcf..5f81023040 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -250,13 +250,11 @@ class Rootfs(object, metaclass=ABCMeta):
 
 
     def _uninstall_unneeded(self):
-        # Remove unneeded init script symlinks
+        # Remove the run-postinsts package if no delayed postinsts are found
         delayed_postinsts = self._get_delayed_postinsts()
         if delayed_postinsts is None:
-            if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")):
-                self._exec_shell_cmd(["update-rc.d", "-f", "-r",
-                                      self.d.getVar('IMAGE_ROOTFS'),
-                                      "run-postinsts", "remove"])
+            if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_unitdir}/system/run-postinsts.service")):
+                self.pm.remove(["run-postinsts"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d)
-- 
2.17.1

