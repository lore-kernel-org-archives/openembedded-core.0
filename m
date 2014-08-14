Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 504ED70D07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:46:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7E8k55n006612
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 01:46:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 01:46:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 16:46:07 +0800
Message-ID: <18e2b9ecac47dcfef1b00a538a61d1f5d4fe51fd.1408005909.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408005909.git.Qi.Chen@windriver.com>
References: <cover.1408005909.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 14 Aug 2014 08:46:04 -0000
Content-Type: text/plain

Set INHIBIT_UPDATERCD_BBCLASS to "1" if 'sysvinit' is not in DISTRO_FEATURES.

The functionality of the init script 'fbsetup' is implemented internally in
systemd. So fbsetup is not installed if 'sysvinit' is in DISTRO_FEATURES.

That's why we need to set INHIBIT_UPDATERCD_BBCLASS to "1" to avoid
generation of update-rc.d related preinst/postinst scripts.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 08438be..7ccb4ee 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -49,4 +49,11 @@ do_install () {
         fi
 }
 
+# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
+# manually to avoid unnecessary postinst/preinst generated.
+python __anonymous() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
 inherit update-rc.d
-- 
1.7.9.5


