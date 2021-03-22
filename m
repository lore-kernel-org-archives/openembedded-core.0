Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web08.11461.1616414460034903141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 05:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: awais_belal@mentor.com)
IronPort-SDR: gjmkTBfqiRIX4pD4QzU1Mw809HQSnybh34684xHXmPtOsX49N66swpL4rxDxOpoh8E5ja5nrTm
 ZFFG1b9cnOTXURxvY4xH8yUB0wgJBo9napHnnD4ExvDAj6nRCxVb1yAys5C4o37McxL6DeBI1W
 lipFHQGuEpVF+xtdTLe20WXW13dybNriVBs6VFaj5rsn7cotptMPO+yYXdpfSqjwZh4VKS0iIG
 692Ur7GtBvjssaLLyEnVDvKH0qzQQGIZ184hp6CQ9su95O5GQfCYm/lCvuh6jqgm4N9r/jM9AD
 JOQ=
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="59471250"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 22 Mar 2021 04:00:58 -0800
IronPort-SDR: y1Ijj0X4Kgkv9stk9ggya7f7ZzSxvUvMpI/oJsfc6iJNEMLqEE91n2mjXbcrTlLkQytGwilMdY
 Fk9l0xwLAIAyFfdvEim7iVCJ+1YF3tOMQH5VGSVI9XBtn6FkI3g7J5gF7rGc6ovYW8i3MV9FPo
 mTABCW9OWmYfNRy4m7xROb9nc4+avsGg8wqZd4ZsamMvt29EkMF0BxHXsBG+kQQyUjx2ULM1hG
 gnWKjBRj8fO0+Ukkt8s39b51Z9cTJ1EUUMXFy9cg+VBJZ++FYPbLhk7pbsegMQ+frT829lXdBH
 wBo=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] rootfs.py: mask run-postinsts systemd service when unneeded
Date: Mon, 22 Mar 2021 17:00:35 +0500
Message-ID: <20210322120035.6186-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: awais_belal@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
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
index 249c685dcf..fe35ce5b70 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -257,6 +257,10 @@ class Rootfs(object, metaclass=ABCMeta):
                 self._exec_shell_cmd(["update-rc.d", "-f", "-r",
                                       self.d.getVar('IMAGE_ROOTFS'),
                                       "run-postinsts", "remove"])
+            if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_unitdir}/system/run-postinsts.service")):
+                self._exec_shell_cmd(["systemctl",
+                                        "--root", self.d.getVar('IMAGE_ROOTFS'),
+                                        "mask", "run-postinsts.service"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d)
-- 
2.17.1

