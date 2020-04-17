Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.6898.1587118562897372089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 03:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03HAFfOK015926
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 03:15:51 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 17 Apr
 2020 03:15:30 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] alsa-state: ignore 'No soundcards found' error in pkg_postinst
Date: Fri, 17 Apr 2020 18:15:27 +0800
Message-ID: <20200417101527.30217-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

If there is no soundcards on the target (e.g. qemu), the pkp_postinst
function will report an error:
  alsactl: load_state:1735: No soundcards found...
  pkg_run_script: package "alsa-state" postinst script returned status 19.
  opkg_configure: alsa-state.postinst returned 19.

Pass '-g' option to alsactl to ignore this error.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 0670556999..cec2272c80 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -62,7 +62,7 @@ pkg_postinst_${PN}() {
 	then
 		if test -x ${sbindir}/alsactl
 		then
-			${sbindir}/alsactl -f ${localstatedir}/lib/alsa/asound.state restore
+			${sbindir}/alsactl -g -f ${localstatedir}/lib/alsa/asound.state restore
 		fi
 	fi
 }
-- 
2.17.1

