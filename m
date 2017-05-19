Return-Path: <erik.boto@pelagicore.com>
Received: from ORO-EDGE-03.luxoft.com (oro-edge-03.luxoft.com [109.166.244.23])
	by mail.openembedded.org (Postfix) with ESMTP id CCD7A780BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 14:25:44 +0000 (UTC)
Received: from ORO-HUBT-02.luxoft.com (172.30.115.36) by
	oro-edge-03.luxoft.com (172.30.19.23) with Microsoft SMTP Server (TLS)
	id 14.3.319.2; Fri, 19 May 2017 17:20:17 +0300
Received: from debbie.luxoft.com (172.31.241.79) by ORO-HUBT-02.luxoft.com
	(172.30.115.101) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Fri, 19 May 2017 17:20:17 +0300
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 May 2017 16:20:03 +0200
Message-ID: <20170519142004.32682-3-erik.boto@pelagicore.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170519142004.32682-1-erik.boto@pelagicore.com>
References: <20170519142004.32682-1-erik.boto@pelagicore.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.241.79]
Subject: [PATCH 3/4] masterimage.py: fix stop()
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
X-List-Received-Date: Fri, 19 May 2017 14:25:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The stop() function is called in the context of the masterimage,
so self.master should be used instead of self.connection which is
undefined at that time.

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 18da2799bb..75bcd4b08d 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -156,7 +156,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
     def stop(self):
         bb.plain("%s - reboot/powercycle target" % self.pn)
-        self.power_cycle(self.connection)
+        self.power_cycle(self.master)
 
 
 class SystemdbootTarget(MasterImageHardwareTarget):
-- 
2.11.0


