Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFEB872F43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 03:08:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2S38kGa031601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 20:08:46 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 20:08:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Mar 2017 20:08:43 -0700
Message-ID: <359fd56d38e87dc4675f8c228dbcec76a66da74a.1490670444.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1490670444.git.liezhi.yang@windriver.com>
References: <cover.1490670444.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] apt: fix libdir path for apt.systemd.daily
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
X-List-Received-Date: Tue, 28 Mar 2017 03:08:46 -0000
Content-Type: text/plain

It should be ${libdir} rather than /usr/lib, otherwise it would fail
when multilib (installed-vs-shipped).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/apt/apt-package.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 839d58e2f7..6a01f99c63 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -83,9 +83,11 @@ do_install () {
 	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
 
 	install -d ${D}${systemd_unitdir}/system/
-	install -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/
+	install -m 0644 ${S}/debian/apt.systemd.daily ${D}${libdir}/apt/
 	install -m 0644 ${S}/debian/apt-daily.service ${D}${systemd_unitdir}/system/
+	sed -i 's#/usr/lib/apt/#${libdir}/apt/#g' ${D}${systemd_unitdir}/system/apt-daily.service
 	install -m 0644 ${S}/debian/apt-daily.timer ${D}${systemd_unitdir}/system/
 	install -d ${D}${sysconfdir}/cron.daily/
 	install -m 0755 ${S}/debian/apt.apt-compat.cron.daily ${D}${sysconfdir}/cron.daily/
+	sed -i 's#/usr/lib/apt/#${libdir}/apt/#g' ${D}${sysconfdir}/cron.daily/apt.apt-compat.cron.daily
 }
-- 
2.11.0.rc2.dirty


