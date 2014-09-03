Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E63C713F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 07:09:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8379l21005325
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 00:09:47 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 00:09:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 15:09:18 +0800
Message-ID: <755a5a1c87c6e5c9425bf8de192fedc1c4573b34.1409728004.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409728004.git.Qi.Chen@windriver.com>
References: <cover.1409728004.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 21/25] v86d: mask fbsetup when necessary
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
X-List-Received-Date: Wed, 03 Sep 2014 07:09:46 -0000
Content-Type: text/plain

When 'sysvinit' and 'systemd' are both in DISTRO_FEATURES, we need
to prevent the init script from running via systemd.
This is because that the functionality has been implemented internally
in systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 7ccb4ee..f502072 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -57,3 +57,13 @@ python __anonymous() {
 }
 
 inherit update-rc.d
+
+DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
+pkg_postinst_${PN} () {
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
+		if [ -n "$D" ]; then
+			OPTS="--root=$D"
+		fi
+		systemctl $OPTS mask fbsetup.service
+	fi
+}
-- 
1.9.1


