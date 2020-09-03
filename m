Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.8761.1599118674694045962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 00:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0837bX8I017350
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Sep 2020 00:37:44 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Sep 2020
 00:37:05 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] alsa-state: run alsactl store in pkg_postinst
Date: Thu, 3 Sep 2020 15:37:04 +0800
Message-ID: <20200903073704.30850-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Since the pkg_postinst is prior than alsa-state-init, it needs
to run store first. On some boards, it failed to online install
alsa-state

[dnf install alsa-state online]
root@bcm-2xxx-rpi4:~# # dnf install alsa-state
No state is present for card Headphones
alsa-lib ../../../alsa-lib-1.2.3.2/src/ucm/main.c:983:(snd_use_case_mgr_open)
error: failed to import hw:0 use case configuration -2
Found hardware: "bcm2835_headpho" "Broadcom Mixer" "" "" ""
Hardware is initialized using a generic method
No state is present for card Headphones
%post(alsa-state-0.2.0-r5.0.cortexa72): waitpid(823) rc 823 status 6300
warning: %post(alsa-state-0.2.0-r5.0.cortexa72) scriptlet failed, exit status 99

Error in POSTIN scriptlet in rpm package alsa-state
[dnf install alsa-state online]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index cec2272c80..98a9381b4c 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -62,7 +62,7 @@ pkg_postinst_${PN}() {
 	then
 		if test -x ${sbindir}/alsactl
 		then
-			${sbindir}/alsactl -g -f ${localstatedir}/lib/alsa/asound.state restore
+			${sbindir}/alsactl -g -f ${localstatedir}/lib/alsa/asound.state store
 		fi
 	fi
 }
-- 
2.18.2

