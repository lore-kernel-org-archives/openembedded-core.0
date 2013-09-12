Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 45C2C60ED9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 09:43:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8C9hF8K012464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 02:43:15 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Sep 2013 02:43:13 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 17:43:55 +0800
Message-ID: <4802511117bc648d9cd10d8262645069d9db1317.1378978986.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378978986.git.Qi.Chen@windriver.com>
References: <cover.1378978986.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] update-rc.d.bbclass: change RRECOMMENDS to RDEPENDS
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
X-List-Received-Date: Thu, 12 Sep 2013 09:43:12 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If a package inherits update-rc.d.bbclass, it actually needs it to
update the symlinks under /etc/rc?.d/ directories. This is a runtime
dependency. For example, if we try to upgrade the dropbear on target,
its postinst process will need the update-rc.d utility available,
otherwise, the upgrade process will fail.

Besides, if we only recommend update-rc.d, the do_rootfs process will
fail once NO_RRECOMMENDATIONS is enabled. Because in OE, we try to do
the postinsts at rootfs time.

This patch fixes this problem by changing the RRECOMMENDS to RDEPENDS
to let the packages actually rdepend on update-rc.d.

[YOCTO #5169]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/update-rc.d.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 5588569..3dee13a 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -6,7 +6,7 @@ UPDATERCD_virtclass-cross = ""
 UPDATERCD_class-native = ""
 UPDATERCD_class-nativesdk = ""
 
-RRECOMMENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
+RDEPENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
 
 INITSCRIPT_PARAMS ?= "defaults"
 
-- 
1.7.9.5


