Return-Path: <erik.boto@pelagicore.com>
Received: from ORO-EDGE-02.luxoft.com (oro-edge-02.luxoft.com [109.166.244.22])
	by mail.openembedded.org (Postfix) with ESMTP id 11E5577FCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 06:09:48 +0000 (UTC)
Received: from ORO-HUBT-03.luxoft.com (172.30.115.38) by
	oro-edge-02.luxoft.com (172.30.19.22) with Microsoft SMTP Server (TLS)
	id 14.3.319.2; Mon, 29 May 2017 09:09:47 +0300
Received: from debbie.luxoft.com (172.31.240.101) by ORO-HUBT-03.luxoft.com
	(172.30.115.101) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Mon, 29 May 2017 09:09:47 +0300
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 May 2017 08:09:32 +0200
Message-ID: <20170529060935.8093-2-erik.boto@pelagicore.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170529060935.8093-1-erik.boto@pelagicore.com>
References: <20170529060935.8093-1-erik.boto@pelagicore.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.240.101]
Subject: [PATCH v2 1/4] masterimage.py: fix issue with calling reboot on masterimage/DUT
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 May 2017 06:09:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On systemd systems calling reboot over an ssh connection doesn't
return as expected causing an exception, therefore wrap the call
to reboot in order to avoid this issue.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 07418fcda1..6cdcfa3068 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -108,7 +108,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
             time.sleep(10)
             self.power_ctl("cycle")
         else:
-            status, output = conn.run("reboot")
+            status, output = conn.run("{ sleep 1; reboot; } > /dev/null &")
             if status != 0:
                 bb.error("Failed rebooting target and no power control command defined. You need to manually reset the device.\n%s" % output)
 
-- 
2.11.0


