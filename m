Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.2139.1601017576019521610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 00:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08P76EDm028752
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 25 Sep 2020 00:06:14 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 25 Sep 2020
 00:06:14 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [oe-core][PATCH 4/4] alsa-state: run alsactl store in pkg_postinst
Date: Fri, 25 Sep 2020 00:05:35 -0700
Message-ID: <20200925070535.59518-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925070535.59518-1-hongxu.jia@windriver.com>
References: <20200925070535.59518-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since the pkg_postinst is prior than alsa-state-init, it needs
to run store first. On raspberry pi 4 boards, it failed to
online install alsa-state

[raspberry pi 4]
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
[raspberry pi 4]

No regression on qemuxxx bsp

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
2.21.0

