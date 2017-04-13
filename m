Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9477977A8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 09:57:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3D9vS8Y029136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:57:28 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Apr 2017 02:57:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Apr 2017 02:57:24 -0700
Message-ID: <1c6d599efff7bd0ce95ba7790bc66e9d0498591b.1492077359.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1492077359.git.liezhi.yang@windriver.com>
References: <cover.1492077359.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] apt: fix libdir path for apt.systemd.daily
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
X-List-Received-Date: Thu, 13 Apr 2017 09:57:27 -0000
Content-Type: text/plain

It should be ${libdir} rather than /usr/lib, otherwise it would fail
when multilib:

MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake apt
[snip]
install: target /path/to/apt/1.2.12-r0/image/usr/lib/apt is not a directory: No such file or directory
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/apt/apt-package.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 839d58e..6a01f99 100644
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
2.10.2


