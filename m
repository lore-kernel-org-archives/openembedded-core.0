Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A45ED77319
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 09:33:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u889Xqkv001809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2016 02:33:52 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 8 Sep 2016 02:33:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Sep 2016 17:34:29 +0800
Message-ID: <cbd669e595f589d500dfea1b6a7c675636c8639c.1473326978.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1473326978.git.Qi.Chen@windriver.com>
References: <cover.1473326978.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/3] pulseaudio: fix to manage user services corretly
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
X-List-Received-Date: Thu, 08 Sep 2016 09:33:53 -0000
Content-Type: text/plain

Make use of the new SYSTEMD_USER_SERVICE variable added in systemd.bbclass
to manage user services in pulseaudio-server package.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 6ed79ef..f3754d7 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -124,8 +124,8 @@ FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
 FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
 
-#SYSTEMD_PACKAGES = "${PN}-server"
-SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"
+SYSTEMD_PACKAGES = "${PN}-server"
+SYSTEMD_USER_SERVICE_${PN}-server = "pulseaudio.service pulseaudio.socket"
 
 FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
 
-- 
1.9.1


