Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mx.groups.io with SMTP id smtpd.web09.9253.1616396866694254608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 00:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.180, mailfrom: awais_belal@mentor.com)
IronPort-SDR: GAhIpffAJmpH4C5bTnIlP2hFvMhYUVDxGihE4jTIVNQIp44x4z01fYQL6HHYnOe127uqO2VSeQ
 h3/M7Blz65SRu4tNYlAh8r2TF0gx90w2DLxcZnuIZfRsznJ3UdD+YZKdTkJIoFWpNB7RORoGMV
 uR6VqcRXrJ4vwbiaHzf3zDDH3L/mR0F8ILb9Ssqhz4iDqsoG+jkFiRdwF+tvPti5OSzKO12/1C
 qW37veQo7R0reM0bkBHfU1XjyPj3I0g+uNuz/M8xZClXXet9gj5F/lzaAMESuHlXirRf+D2oV7
 ylE=
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="59344817"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 21 Mar 2021 23:07:45 -0800
IronPort-SDR: +AWzxd6LgD252ZbDDHLpcvpbfcFNKYVZK9oC+zs+PP+bNzjibhqXUw/iVfJaEpPjjX7ZYPFcm0
 vAWvWeKcwqAE6qFq/FXfWUkpjeoHaEwCmiy5dv+4otnCwBIv8LHICImKbezpPqfcMc55qaWIEp
 wqVMEfZ52j73Yny7GOzTYEeoVQ788xERTUiXeQBtFqeJaKGZsyKPnoesi3XQ04fRkDQuxs31D9
 CbFKhwT1LwjP+BaH5tC19GWsC20jY8faG1CrxtUCSB6zi5gZw5OsF7D20emqqdnFhW/pWelsF/
 9Rg=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rootfs.py: mask run-postinsts systemd service when unneeded
Date: Mon, 22 Mar 2021 12:07:18 +0500
Message-ID: <20210322070718.20753-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: awais_belal@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Content-Type: text/plain

The service is unnecessarily run even when it is unneeded.
This was handled correctly for sysV systems however the
service still runs on the systemd systems as it is not
disabled/masked when not needed.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/lib/oe/rootfs.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 249c685dcf..a29d1f6742 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -257,6 +257,10 @@ class Rootfs(object, metaclass=ABCMeta):
                 self._exec_shell_cmd(["update-rc.d", "-f", "-r",
                                       self.d.getVar('IMAGE_ROOTFS'),
                                       "run-postinsts", "remove"])
+            if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_unitdir}/system/run-postinsts.service")):
+                self._exec_shell_cmd(["systemctl",
+                                        "--root", self.d.getVar('IMAGE_ROOTFS'),
+                                        "mask", "run-postinsts"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d)
-- 
2.17.1

