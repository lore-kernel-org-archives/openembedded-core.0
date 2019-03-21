Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B38067CE33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 03:21:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2L3KCnD012704
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 20:20:54 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 20:20:46 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2019 23:19:09 -0400
Message-ID: <1553138356-85237-2-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] mdadm: add mdmon service to support Intel VROC
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
X-List-Received-Date: Thu, 21 Mar 2019 03:21:02 -0000
Content-Type: text/plain

Install mdmon@.service to make Intel VROC work well.

mdmon@.service called from udev is used to update Intel VROC metadata,
with it the VROC raid is operational to read or write under user space.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index d79c533f213a..6b32f08abee1 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1
 
 inherit autotools-brokensep ptest systemd
 
-SYSTEMD_SERVICE_${PN} = "mdmonitor.service"
+SYSTEMD_SERVICE_${PN} = "mdmonitor.service mdmon@.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 CFLAGS_append_toolchain-clang = " -Wno-error=address-of-packed-member"
@@ -57,6 +57,7 @@ do_install_append() {
         install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir}/system
+        install -m 644 ${S}/systemd/mdmon@.service ${D}/${systemd_unitdir}/system
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
 }
-- 
2.7.4


