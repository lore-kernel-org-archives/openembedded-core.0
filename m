Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11BC678672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 01:53:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBK1rM7H003275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:53:22 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 19 Dec 2017 17:53:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Dec 2017 09:53:12 +0800
Message-ID: <8321b1389864798845fb943888e43a89c60a8d4c.1513734733.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513734733.git.liezhi.yang@windriver.com>
References: <cover.1513734733.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] sysvinit: inherit distro_features_check
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
X-List-Received-Date: Wed, 20 Dec 2017 01:53:21 -0000
Content-Type: text/plain

Use distro_features_check so that we can have a uniform controller.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 22a0ecf..ad65819 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -28,9 +28,11 @@ SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5
 S = "${WORKDIR}/sysvinit-${PV}"
 B = "${S}/src"
 
-inherit update-alternatives
+inherit update-alternatives distro_features_check
 DEPENDS_append = " update-rc.d-native base-passwd"
 
+REQUIRED_DISTRO_FEATURES = "sysvinit"
+
 ALTERNATIVE_${PN} = "init mountpoint halt reboot runlevel shutdown poweroff last lastb mesg utmpdump wall"
 
 ALTERNATIVE_PRIORITY = "200"
@@ -105,8 +107,3 @@ do_install () {
 	chown root.shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 	chmod o-x,u+s ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 }
-
-python () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        raise bb.parse.SkipPackage("'sysvinit' not in DISTRO_FEATURES")
-}
-- 
2.7.4


